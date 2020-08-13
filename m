Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E36E984
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 09:26:20 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Thu, 13 Aug 2020 09:26:17 +0000
Message-ID: <ed96284ce5f34c5fabead75a6329c6f2@intel.com>
References: <20200806110803.19062-1-swati2.sharma@intel.com>
 <54def510-753d-a1dc-f6be-a00a8553a3e0@intel.com>
 <b07728a4-a1fe-9a58-a037-4d09a6ecd28c@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_ed96284ce5f34c5fabead75a6329c6f2intelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_ed96284ce5f34c5fabead75a6329c6f2intelcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I do not think the added time is bad, but wasn't testdisplay considered=0A=
for eviction as it was not testing anything else but the fact that the=0A=
kernel does not blow up on modeset?=0A=
=0A=
Could it be improved to check that we generate a valid image? This might=0A=
require pipe writeback though, so we shouldn't block on that.=0A=
=0A=
Also, how slow is it when we have 6 pipes and 6 DP displays connected?=0A=
Wouldn't it be taking a lot of time?=0A=
=0A=
Martin=0A=
=0A=
On 2020-08-13 10:24, Sharma, Swati2 wrote:=0A=
> @martin peres any thoughts?=0A=
> =0A=
> On 10-Aug-20 1:59 PM, Sharma, Swati2 wrote:=0A=
>> BAT results=0A=
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html?testfilte=
r=3Dtestdisplay=0A=
>>=0A=
>>=0A=
>> Execution time of few CI m/c.=0A=
>> |fi-tgl-dsi|fi-tgl-u2|fi-tgl-y|fi-ehl-1|fi-icl-u2|fi-icl-y|fi-cml-u2|=0A=
>> |=A0 0.352s=A0 |=A0 0.064s | 0.548s |=A0=A0=A0 4.686s |=A0 5.311s | 0.10=
1s | 1.464s=A0 |=0A=
>>=0A=
>> Execution time depends upon which panel is connected if its edp max it=
=0A=
>> supports 2 resolutions =3D> less time. For HDMI; having multiple=0A=
>> resolutions its taking more time.=0A=
>>=0A=
>> On 06-Aug-20 4:38 PM, Swati Sharma wrote:=0A=
>>> testdisplay should be added to BAT. testdisplay is considered=0A=
>>> to be the most basic test to test display functionality.=0A=
>>> With this test we will be able to test modesetting.=0A=
>>>=0A=
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>=0A=
>>> Cc: Petri Latvala <petri.latvala@intel.com>=0A=
>>> Cc: Karthik B S <karthik.b.s@intel.com>=0A=
>>> ---=0A=
>>> =A0 tests/intel-ci/fast-feedback.testlist | 1 +=0A=
>>> =A0 1 file changed, 1 insertion(+)=0A=
>>>=0A=
>>> diff --git a/tests/intel-ci/fast-feedback.testlist=0A=
>>> b/tests/intel-ci/fast-feedback.testlist=0A=
>>> index b796b264..b245b7a7 100644=0A=
>>> --- a/tests/intel-ci/fast-feedback.testlist=0A=
>>> +++ b/tests/intel-ci/fast-feedback.testlist=0A=
>>> @@ -149,6 +149,7 @@ igt@vgem_basic@dmabuf-mmap=0A=
>>> =A0 igt@vgem_basic@mmap=0A=
>>> =A0 igt@vgem_basic@second-client=0A=
>>> =A0 igt@vgem_basic@sysfs=0A=
>>> +igt@testdisplay=0A=
>>> =A0 # All tests that do module unloading and reloading are executed las=
t.=0A=
>>> =A0 # They will sometimes reveal issues of earlier tests leaving the=0A=
>>>=0A=
>>=0A=
> =0A=
=0A=

--_002_ed96284ce5f34c5fabead75a6329c6f2intelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Thu, 13 Aug 2020 09:26:17 GMT";
	modification-date="Thu, 13 Aug 2020 09:26:17 GMT"
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

--_002_ed96284ce5f34c5fabead75a6329c6f2intelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_ed96284ce5f34c5fabead75a6329c6f2intelcom_--
