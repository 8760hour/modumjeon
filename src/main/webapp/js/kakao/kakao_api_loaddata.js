// 페이지가 로딩되었을 때
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    // 체크박스가 변경될 때
    $("#clustercleared").change(function () {
        // 체크박스가 체크된경우
        if ($("#clustercleared").is(":checked")) {
            if ($("#area option:selected").val() == "경기도") {
                // alert 창을 띄우고 확인 버튼을 누를경우
                if (confirm("클러스터를 활성화 하는 경우 로딩시간이 길어질 수 있습니다.") == true) {
                    clusterchecked = true;
                }
                // 취소 버튼을 누를 경우
                else {
                    $("#clustercleared").prop("checked", false);
                    clusterchecked = false;
                }
            } else {
                alert("경기도에서만 사용 가능 합니다")
                $("#clustercleared").prop("checked", false);
                clusterchecked = false;
            }
        }
        // 체크박스가 해제된 경우
        else {
            $("#clustercleared").prop("checked", false);
            clusterchecked = false;
            // $("#clustercleared").prop("disabled", true);
        }
    });
    /*$("#area").change(function () {
        if ($("#area option:selected").val() != "경기도") {
            $("#clustercleared").prop("checked", false);
            clusterchecked = false;
        }
    });*/
    /*$("#area").change(function () {
        regionSelection($("#area").val());
    });*/
        // console.log("테스트 완료" + toto);
        //     regionSelection(toto);
        $("#area").change(function () {
            regionSelection($("#area").val());
            if ($("#area option:selected").val() != "경기도") {
                $("#clustercleared").prop("checked", false);
                clusterchecked = false;
            }
        });
    $("#shadowclose").click(function () {
        $("#menu_wrap").toggle();
        if ($("#menu_wrap").css("display") == "none") {
            $("#shadowclose").css("left","0px");
            $(this).val('>');
        }
        else {
            $("#shadowclose").css("left","363px");
            $(this).val('<');
        }
    });
});

function regionSelection(city) {
      var selectedCity = city;
    // var selectedCity = ttemp;
    // console.log(city);
    // TODO: 콤보 박스 이름 변경되게 고치기
    switch (selectedCity) {
        case("none" || " "):
            // 선택했을 때 마커, 폴리곤, itemElement, page, 클러스터를 초기화
            initialization();
            break;
        case("서울특별시"):
            getjson('../../../location/seouldetail.json', '서울특별시');
            panTo(37.566833213145486, 126.97865508601613,8);
            break;
        case("경기도"):
            getjson('../../../location/ggidodetail.json', '경기도');
            panTo(37.552246098709894, 127.08265827817051,11);
            break;
        case("인천광역시"):
            getjson('../../../location/incheon.json', '인천광역시');
            panTo(37.45601575635058, 126.70526932805312,11);
            break;
        case("대전광역시"):
            getjson('../../../location/daejeon.json', '대전광역시');
            panTo(36.35054566698088, 127.38483209496621,11);
            break;
        case("대구광역시"):
            getjson('../../../location/daegu.json', '대구광역시');
            panTo(35.87139021883816, 128.60180236999602,11);
            break;
        case("세종특별자치시"):
            getjson('../../../location/sejong.json', '세종특별자치시');
            panTo(36.480076633106535, 127.28919257852753,11);
            break;
        case("강원도"):
            getjson('../../../location/gangwondo.json', '강원도');
            panTo(37.88533434764741, 127.72982852649373,11);
            break;
        case("충청북도"):
            getjson('../../../location/chungcheongbukdo.json', '충청북도');
            panTo(36.63536856332988, 127.49145627422729,11);
            break;
        case("충청남도"):
            getjson('../../../location/chungcheongnamdo.json', '충청남도');
            panTo(36.658839597743665, 126.67276943924477,11);
            break;
        case("경상북도"):
            getjson('../../../location/gyeongsangbukdo.json', '경상북도');
            panTo(36.57600343933538, 128.505798836928,11);
            break;
        case("경상남도"):
            getjson('../../../location/gyeongsangnamdo.json', '경상남도');
            panTo(35.237709423780196, 128.69192190637102,11);
            break;
        case("부산광역시"):
            getjson('../../../location/busan.json', '부산광역시');
            panTo(35.179750947369214, 129.07507091757356,11);
            break;
        case("울산광역시"):
            getjson('../../../location/ulsan.json', '울산광역시');
            panTo(35.5394845888991, 129.31146797079748,11);
            break;
        case("전라북도"):
            getjson('../../../location/jeollabukdo.json', '전라북도');
            panTo(35.82020672844053, 127.10897672617733,11);
            break;
        case("광주광역시"):
            getjson('../../../location/gwangju.json', '광주광역시');
            panTo(35.160108723530996, 126.85163269066601,11);
            break;
        case("전라남도"):
            getjson('../../../location/jeollanamdo수정.json', '전라남도');
            panTo(34.81609068924449, 126.46278335953988,11);
            break;
        case("제주특별자치도"):
            getjson('../../../location/jeju.json', '제주도특별자치도');
            panTo(33.48892014636885, 126.49822643823065,11);
            break;
        default:
            alert("오류가 발생하였습니다. 관리자에게 문의해주세요.");
    }
    region = "";
}