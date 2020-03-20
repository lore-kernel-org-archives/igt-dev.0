Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF26E186
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 16:03:29 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Fri, 20 Mar 2020 16:03:25 +0000
Message-ID: <414609087dad419caa67e95008d3c2ec@intel.com>
References: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_414609087dad419caa67e95008d3c2ecintelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Bifurcate
 tests into HDCP1.4 & 2.2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_414609087dad419caa67e95008d3c2ecintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-20 11:03, Ankit Nautiyal wrote:=0A=
> Currently, the test kms_content_protection does not distinguish=0A=
> between HDCP1.4 and HDCP2.2 tests. Since the driver by default=0A=
> always chooses HDCP2.2 protocol if the panel supports HDCP1.4 &=0A=
> HDCP2.2, HDCP1.4 does not get tested.=0A=
=0A=
Thanks for working on it!=0A=
=0A=
> =0A=
> This patch makes two versions of the existing subtests for testing=0A=
> HDCP1.4 and HDCP2.2. For forcing the driver to use HDCP1.4, the=0A=
> kernel module 'mei_hdcp' responsible for HDCP2.2 authentication,=0A=
> is unloaded before HDCP1.4 tests. Once the HDCP1.4 tests are=0A=
> completed, the module is re-loaded.=0A=
> =0A=
> This patch also makes the existing subtests as dynamic sub-subtests=0A=
> based on all outputs supporting the protocol under test.=0A=
> This helps in running together all HDCP1.4 tests for all outputs=0A=
> that support HDCP1.4, avoiding the need of loading and unloading=0A=
> of 'mei_hdcp' module for each test.=0A=
=0A=
That sounds like a complicated process which won't scale to future=0A=
versions of HDCP (no reason to assume they will stop pumping them out).=0A=
=0A=
How about adding a debugfs file that lists the supported hdcp versions=0A=
for every connector, says which one is being used right now, and=0A=
force-disable one or many so as to be able to validate all the cases?=0A=
=0A=
Martin=0A=
> =0A=
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>=0A=
> ---=0A=
>  tests/kms_content_protection.c | 185 ++++++++++++++++++++-------------=
=0A=
>  1 file changed, 113 insertions(+), 72 deletions(-)=0A=
> =0A=
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c=0A=
> index 3b9cedcb..1472e987 100644=0A=
> --- a/tests/kms_content_protection.c=0A=
> +++ b/tests/kms_content_protection.c=0A=
> @@ -59,6 +59,9 @@ struct data {=0A=
>  #define HDCP_CONTENT_TYPE_0				0=0A=
>  #define HDCP_CONTENT_TYPE_1				1=0A=
>  =0A=
> +#define HDCP_14						0=0A=
> +#define HDCP_22						1=0A=
> +=0A=
>  #define LIC_PERIOD_MSEC				(4 * 1000)=0A=
>  /* Kernel retry count=3D3, Max time per authentication allowed =3D 6Sec =
*/=0A=
>  #define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)=0A=
> @@ -593,44 +596,6 @@ static bool sink_hdcp2_capable(igt_output_t *output)=
=0A=
>  	return strstr(buf, "HDCP2.2");=0A=
>  }=0A=
>  =0A=
> -static void=0A=
> -test_content_protection(enum igt_commit_style s, int content_type)=0A=
> -{=0A=
> -	igt_display_t *display =3D &data.display;=0A=
> -	igt_output_t *output;=0A=
> -	int valid_tests =3D 0;=0A=
> -=0A=
> -	if (data.cp_tests & CP_MEI_RELOAD)=0A=
> -		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),=0A=
> -			      "mei_hdcp module is not loaded\n");=0A=
> -=0A=
> -	for_each_connected_output(display, output) {=0A=
> -		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])=0A=
> -			continue;=0A=
> -=0A=
> -		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&=0A=
> -		    content_type)=0A=
> -			continue;=0A=
> -=0A=
> -		igt_info("CP Test execution on %s\n", output->name);=0A=
> -=0A=
> -		if (content_type && !sink_hdcp2_capable(output)) {=0A=
> -			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",=0A=
> -				 output->name);=0A=
> -			continue;=0A=
> -		} else if (!sink_hdcp_capable(output)) {=0A=
> -			igt_info("\tSkip %s (Sink has no HDCP support)\n",=0A=
> -				 output->name);=0A=
> -			continue;=0A=
> -		}=0A=
> -=0A=
> -		test_content_protection_on_output(output, s, content_type);=0A=
> -		valid_tests++;=0A=
> -	}=0A=
> -=0A=
> -	igt_require_f(valid_tests, "No connector found with HDCP capability\n")=
;=0A=
> -}=0A=
> -=0A=
>  static void test_content_protection_cleanup(void)=0A=
>  {=0A=
>  	igt_display_t *display =3D &data.display;=0A=
> @@ -651,58 +616,63 @@ static void test_content_protection_cleanup(void)=
=0A=
>  	}=0A=
>  }=0A=
>  =0A=
> -igt_main=0A=
> -{=0A=
> -	igt_fixture {=0A=
> -		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);=0A=
> +static bool=0A=
> +is_valid_output(igt_output_t *output, int content_type) {=0A=
> +	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])=0A=
> +		return false;=0A=
>  =0A=
> -		igt_display_require(&data.display, data.drm_fd);=0A=
> +	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] && content_type)=0A=
> +		return false;=0A=
> +=0A=
> +	if (content_type && !sink_hdcp2_capable(output)) {=0A=
> +		igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",=0A=
> +			 output->name);=0A=
> +		return false;=0A=
> +=0A=
> +	} else if (!sink_hdcp_capable(output)) {=0A=
> +		igt_info("\tSkip %s (Sink has no HDCP support)\n",=0A=
> +			 output->name);=0A=
> +		return false;=0A=
>  	}=0A=
> +	return true;=0A=
> +}=0A=
>  =0A=
> -	igt_subtest("legacy") {=0A=
> +static void=0A=
> +test_content_protection_dynamic(igt_output_t *output, int content_type)=
=0A=
> +{=0A=
> +=0A=
> +	igt_dynamic_f("legacy-%s", output->name) {=0A=
>  		data.cp_tests =3D 0;=0A=
> -		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_LEGACY,=0A=
> +						  content_type);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("atomic") {=0A=
> +	igt_dynamic_f("atomic-%s", output->name) {=0A=
>  		igt_require(data.display.is_atomic);=0A=
>  		data.cp_tests =3D 0;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("atomic-dpms") {=0A=
> +	igt_dynamic_f("atomic-dpms-%s", output->name) {=0A=
>  		igt_require(data.display.is_atomic);=0A=
>  		data.cp_tests =3D CP_DPMS;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("LIC") {=0A=
> +	igt_dynamic_f("LIC-%s", output->name) {=0A=
>  		igt_require(data.display.is_atomic);=0A=
>  		data.cp_tests =3D CP_LIC;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("type1") {=0A=
> -		igt_require(data.display.is_atomic);=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);=0A=
> -	}=0A=
> -=0A=
> -	igt_subtest("mei_interface") {=0A=
> -		igt_require(data.display.is_atomic);=0A=
> -		data.cp_tests =3D CP_MEI_RELOAD;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);=0A=
> -	}=0A=
> -=0A=
> -	igt_subtest("content_type_change") {=0A=
> -		igt_require(data.display.is_atomic);=0A=
> -		data.cp_tests =3D CP_TYPE_CHANGE;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);=0A=
> -	}=0A=
> -=0A=
> -	igt_subtest("uevent") {=0A=
> +	igt_dynamic_f("uevent-%s", output->name) {=0A=
>  		igt_require(data.display.is_atomic);=0A=
>  		data.cp_tests =3D CP_UEVENT;=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
>  	}=0A=
>  =0A=
>  	/*=0A=
> @@ -713,7 +683,7 @@ igt_main=0A=
>  	 *  either of these options, we test SRM writing from userspace and=0A=
>  	 *  validation of the same at kernel. Something is better than nothing.=
=0A=
>  	 */=0A=
> -	igt_subtest("srm") {=0A=
> +	igt_dynamic_f("srm-%s", output->name) {=0A=
>  		bool ret;=0A=
>  =0A=
>  		igt_require(data.display.is_atomic);=0A=
> @@ -721,7 +691,78 @@ igt_main=0A=
>  		ret =3D write_srm_as_fw((const __u8 *)facsimile_srm,=0A=
>  				      sizeof(facsimile_srm));=0A=
>  		igt_assert_f(ret, "SRM update failed");=0A=
> -		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
> +	}=0A=
> +=0A=
> +	/*=0A=
> +	 * The tests mei_interface and content_type_change are meant only=0A=
> +	 * for HDCP2.2 protocol, hence ignore for HDCP1.4.=0A=
> +	 */=0A=
> +	if (content_type !=3D HDCP_CONTENT_TYPE_1)=0A=
> +		return;=0A=
> +=0A=
> +	igt_dynamic_f("mei_interface-%s", output->name) {=0A=
> +		igt_require(data.display.is_atomic);=0A=
> +		data.cp_tests =3D CP_MEI_RELOAD;=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
> +	}=0A=
> +=0A=
> +	igt_dynamic_f("content_type_change-%s", output->name) {=0A=
> +		igt_require(data.display.is_atomic);=0A=
> +		data.cp_tests =3D CP_TYPE_CHANGE;=0A=
> +		test_content_protection_on_output(output, COMMIT_ATOMIC,=0A=
> +						  content_type);=0A=
> +	}=0A=
> +}=0A=
> +=0A=
> +igt_main=0A=
> +{=0A=
> +	int i;=0A=
> +	struct cp_protocol {=0A=
> +		const char *name;=0A=
> +		int content_type;=0A=
> +	} protocol[] =3D {=0A=
> +		{ "hdcp-1_4", HDCP_CONTENT_TYPE_0 },=0A=
> +		{ "hdcp-2_2", HDCP_CONTENT_TYPE_1 } };=0A=
> +=0A=
> +	igt_fixture {=0A=
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);=0A=
> +=0A=
> +		igt_display_require(&data.display, data.drm_fd);=0A=
> +	}=0A=
> +=0A=
> +	for (i =3D 0; i < 2; i++) {=0A=
> +		bool force_mei_hdcp_off =3D false;=0A=
> +=0A=
> +		/* In case a panel supports both HDCP2.2 and HDCP1.4 protocols,=0A=
> +		 * HDCP2.2 is always chosen as default by the driver, even for=0A=
> +		 * the TYPE 0 content.=0A=
> +		 *=0A=
> +		 * To forcefully test HDCP1.4, mei_hdcp module needs to be=0A=
> +		 * unloaded. This takes away the HDCP2.2 support from the=0A=
> +		 * platform, and HDCP1.4 can be tested. After the test the=0A=
> +		 * module is loaded again and HDCP2.2 support gets re-enabled.=0A=
> +		 */=0A=
> +		if (i =3D=3D HDCP_14 && igt_kmod_is_loaded("mei_hdcp")) {=0A=
> +			igt_kmod_unload("mei_hdcp", 0);=0A=
> +			force_mei_hdcp_off =3D true;=0A=
> +		}=0A=
> +=0A=
> +		igt_subtest_with_dynamic_f("%s", protocol[i].name) {=0A=
> +			igt_output_t *output;=0A=
> +			int content_type =3D protocol[i].content_type;=0A=
> +=0A=
> +			for_each_connected_output(&data.display, output) {=0A=
> +				if (!is_valid_output(output, content_type))=0A=
> +					continue;=0A=
> +				test_content_protection_dynamic(output,=0A=
> +								content_type);=0A=
> +			}=0A=
> +		}=0A=
> +		if (force_mei_hdcp_off)=0A=
> +			igt_kmod_load("mei_hdcp", NULL);=0A=
>  	}=0A=
>  =0A=
>  	igt_fixture {=0A=
> =0A=
=0A=

--_002_414609087dad419caa67e95008d3c2ecintelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Fri, 20 Mar 2020 16:03:25 GMT";
	modification-date="Fri, 20 Mar 2020 16:03:25 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUVOQkYzazA1Z0JDQUN5WmhP
WGExNGJUY3lUUWtjMVV5R2ZjNGx4ckhQREw1YXVPbkM3cUVIWkw1b3ZWd3NDCmF1ZlFaOVFKVWwx
NHh1OCt4dUl6UGoyWXhEbjFBeVJFN0RzSXNxNjVIaDlRa2YxQytFNmtHeHBDS2VXeFpEalIKS0xE
a2pQWmdRTTdOeHNFWkRkemNaTlFLUEt3OXBXUUovRCtrSUlyNDJYaERhbktyQ1pHV3Vxc3VwVGI4
YmM2agp3ZnBxVzV2eUp2WnVMSHcrTURhRVhoZ1Z0SlVWYVdSWENXbXFZQU1YWFlMMGh5NHVjRDZz
UWl3U2psK3JUU2NIClhqSHdhWURWWTI5bVFlR3lWMDMyeXBFWFQzWG1DVTJVT0hhNENNaktLR3ZK
MjRBU2Q5SFkyWHo4cmNyR1pTbGsKRkhMTGRwNUNET2wrRFU2Vjc5SWs5a3pPMFVxK0hXWDRtc2Z4
QUJFQkFBRzBLMDFoY25ScGJpQlFaWEpsY3lBOApiV0Z5ZEdsdUxuQmxjbVZ6UUd4cGJuVjRMbWx1
ZEdWc0xtTnZiVDZKQVZRRUV3RUlBRDRXSVFSTjlzUS9iN0dPClhRdkh5WUVDditaL002VXplUVVD
WGVUVG1RSWJBd1VKQWVFemdBVUxDUWdIQWdZVkNna0lDd0lFRmdJREFRSWUKQVFJWGdBQUtDUkFD
ditaL002VXplUmJ3Qi85ZHhZaG01WU14eGlSa2tZRVBrOE9DUGZjOGJwazF6RFc5Nkc0MgpLYVoz
RlRPRGNSMktjelg1ZVRMRFYwdklNRndqMmw0UXAvRFpzbVlsNzlKNDNhbHg1RHRIQUZJMlJHSis2
dXJhClFZMkovVXUvUWt5eEdrMTRpQUFzYytaalJSdWllQ1h0Wkc2THRMYmdsTUZCWUd4dzlWVEow
L0xhNHJjUVk3UksKOW1KM1QwWUxKMkJNNlVha3lUWEdzbnN0aWtOa2wzU0JKVDBJc1B1bVdGL240
a25penZQcG5BTGNQWGwwS3VtUwpuZDZ1b2dPT3VrQ0t4Z0RUWm1qRG9meDVvN1pveDI5blNkdjR3
aVJMOHVBeDRrY0pPOUxPOFhBN0lITzd6SXRTCmpXbWRXRmN4QTVicFRkRWR0TThIQWlCQkFaNU44
WXVraENuejltT0FFOXZLOXZydHVRRU5CRjNrMDVrQkNBREwKR3JGN1NBblB5NVo2R2ZlelZDclFm
dUlHSmhPemxuY0c2aFdHYU05YzlDVEtxSGZDNHROV1VFeHJmam5YNjBtRgpJbUx2aHhlRlZDOWJv
QS9jNGFVTmhEYy9NOUtqc08ycWRyd2d4QXl3bnIraVJqbzNORUJWQkF3T2NldWRRM0xPClZmZW5k
b296d3lqd3ZZRFV2QzNUcWtjajBsNmE2R3JqZTZWMVVTQ3RIL0ZlR2NONG9EMnZPOW1yWFlQb2hr
V2cKU3B2QUpPSEs5bk5nMUtaTjcvcDlXNUZMMlZZN2pIbHErd1gxZDBTRytRNlhjVHNEQUEyOStO
YmM1Qk0vcTJJTAphV1Fva0I0bzBaRjNsakZiN2RYZDNRZEpNWDdvNXRURzFMUi9TalZmbkZGckMw
K1IrZGhlRUVldGxVckRMRmF0CnhnRTdvREVPLzA4c2g5eHJPdzdMQUJFQkFBR0pBVHdFR0FFSUFD
WVdJUVJOOXNRL2I3R09YUXZIeVlFQ3YrWi8KTTZVemVRVUNYZVRUbVFJYkRBVUpBZUV6Z0FBS0NS
QUN2K1ovTTZVemVTMVRCLzlNbTFYTUhpbWtFbW15ZXNiMQpxdHFUY2htV2Q1NWhiRkIxMDRSbUx5
c0VrSU43Q3IweVNEZjBZRWxxd2QvSDlGWWVLUTVEWWJWWS9CclhjeGYzCmNKVDJBZ01Zdk54bHZ5
NHluR1F4Yy9YbXRzMGZVSno5cmRVVmZxZlFKbDlHZkR1U3dpQnhmb3BlN21aR2NIZWcKNzBaQTg3
Q0xJQ0FVbi9uRFpSekZuUHNhdUxJSU9sMGhxVWtJUml3WVp0WW9WZnNoVGhTNzNEcXNGS2U0Y25r
eApZcGVCRXNsYUduZnRMUC9uWDl6dkZ4SXJYUXBPdHJ2eWdkWklhMVMrZXhYM2NXMHNPYm02Zjk0
T3Q1Mjl3V3pTCnhJRjBvRnZPY3NlZ2ErL3FPK1hSNHNjbUJ1K3NUVU5FQnA1NWYyc0ptOWllVlU5
SXUwM2JYVnBMZGV3dTNtMEIKTTVtaAo9YzJPTwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9D
Sy0tLS0tCg==

--_002_414609087dad419caa67e95008d3c2ecintelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_414609087dad419caa67e95008d3c2ecintelcom_--
