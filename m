Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EEE89C3F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:55:28 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Mon, 23 Mar 2020 06:55:25 +0000
Message-ID: <ed6f16b6a7384617b0214849ce0c6ed3@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-2-anshuman.gupta@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_ed6f16b6a7384617b0214849ce0c6ed3intelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/5] lib/igt_pm: Add lib func to get
 lpsp capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Peres, Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_ed6f16b6a7384617b0214849ce0c6ed3intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-23 08:32, Anshuman Gupta wrote:=0A=
> This lib function evaluate the lpsp capability from=0A=
> the connector specific debugfs attribute i915_lpsp_info.=0A=
> =0A=
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>=0A=
> ---=0A=
>  lib/igt_pm.c | 27 +++++++++++++++++++++++++++=0A=
>  lib/igt_pm.h |  1 +=0A=
>  2 files changed, 28 insertions(+)=0A=
> =0A=
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c=0A=
> index 9d441e1b..7a6cab7c 100644=0A=
> --- a/lib/igt_pm.c=0A=
> +++ b/lib/igt_pm.c=0A=
> @@ -37,6 +37,7 @@=0A=
>  #include <dirent.h>=0A=
>  =0A=
>  #include "drmtest.h"=0A=
> +#include "igt_kms.h"=0A=
>  #include "igt_pm.h"=0A=
>  #include "igt_aux.h"=0A=
>  #include "igt_sysfs.h"=0A=
> @@ -827,3 +828,29 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)=
=0A=
>  =0A=
>  	return true;=0A=
>  }=0A=
> +=0A=
> +/**=0A=
> + * igt_output_is_lpsp_capable:=0A=
> + * @drm_fd: fd to drm device=0A=
> + * @output: igt output for which lpsp capability need to be evaluated=0A=
> + * Check lpsp capability for a given output.=0A=
> + *=0A=
> + * Returns:=0A=
> + * True if given output is lpsp capable otherwise false.=0A=
> + */=0A=
> +bool igt_output_is_lpsp_capable(int drm_fd, igt_output_t *output)=0A=
=0A=
Do we have a file for i915-specific features? If not, maybe prefixing=0A=
the function with i915 would help readers understand that this is an=0A=
i915-specific function.=0A=
=0A=
> +{=0A=
> +	char buf[256];=0A=
> +	int fd, len;=0A=
> +=0A=
> +	fd =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);=0A=
> +	igt_require(fd >=3D 0);=0A=
> +	len =3D igt_debugfs_simple_read(fd, "i915_lpsp_info", buf, sizeof(buf))=
;=0A=
> +=0A=
> +	if (len < 0)=0A=
> +		igt_assert_eq(len, -ENODEV);=0A=
> +=0A=
> +	close(fd);=0A=
> +=0A=
> +	return strstr(buf, "LPSP capable");=0A=
> +}=0A=
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h=0A=
> index 5e438452..076d8c27 100644=0A=
> --- a/lib/igt_pm.h=0A=
> +++ b/lib/igt_pm.h=0A=
> @@ -53,5 +53,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(vo=
id);=0A=
>  bool igt_wait_for_pm_status(enum igt_runtime_pm_status status);=0A=
>  bool igt_pm_dmc_loaded(int debugfs);=0A=
>  bool igt_pm_pc8_plus_residencies_enabled(int msr_fd);=0A=
> +bool igt_output_is_lpsp_capable(int drm_fd, igt_output_t *output);=0A=
>  =0A=
>  #endif /* IGT_PM_H */=0A=
> =0A=
=0A=

--_002_ed6f16b6a7384617b0214849ce0c6ed3intelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Mon, 23 Mar 2020 06:55:25 GMT";
	modification-date="Mon, 23 Mar 2020 06:55:25 GMT"
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

--_002_ed6f16b6a7384617b0214849ce0c6ed3intelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_ed6f16b6a7384617b0214849ce0c6ed3intelcom_--
