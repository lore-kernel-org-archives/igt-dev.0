Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155B56E090
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2020 12:17:33 +0000 (UTC)
References: <20200806110803.19062-1-swati2.sharma@intel.com>
 <54def510-753d-a1dc-f6be-a00a8553a3e0@intel.com>
 <b07728a4-a1fe-9a58-a037-4d09a6ecd28c@intel.com>
 <ed96284ce5f34c5fabead75a6329c6f2@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <97118255-3361-c627-f73d-4fdb7b088593@intel.com>
Date: Fri, 14 Aug 2020 17:47:29 +0530
MIME-Version: 1.0
In-Reply-To: <ed96284ce5f34c5fabead75a6329c6f2@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Peres, Martin" <martin.peres@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>



On 13-Aug-20 2:56 PM, Peres, Martin wrote:
> Hi,
> =

> I do not think the added time is bad, but wasn't testdisplay considered
> for eviction as it was not testing anything else but the fact that the
> kernel does not blow up on modeset?

Correct. It's for modeset testing. However, Chris commented saying same =

can be tested with kms_setmode@basic. Should we add this test in =

fast-feedback then?
AON, igt@kms_setmode@basic-clone-single-crtc is present.

> =

> Could it be improved to check that we generate a valid image? This might
> require pipe writeback though, so we shouldn't block on that.
> =

> Also, how slow is it when we have 6 pipes and 6 DP displays connected?
> Wouldn't it be taking a lot of time?
> =

Yes indeed it will take long time.

> Martin
> =

> On 2020-08-13 10:24, Sharma, Swati2 wrote:
>> @martin peres any thoughts?
>>
>> On 10-Aug-20 1:59 PM, Sharma, Swati2 wrote:
>>> BAT results
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html?testfilt=
er=3Dtestdisplay
>>>
>>>
>>> Execution time of few CI m/c.
>>> |fi-tgl-dsi|fi-tgl-u2|fi-tgl-y|fi-ehl-1|fi-icl-u2|fi-icl-y|fi-cml-u2|
>>> |=A0 0.352s=A0 |=A0 0.064s | 0.548s |=A0=A0=A0 4.686s |=A0 5.311s | 0.1=
01s | 1.464s=A0 |
>>>
>>> Execution time depends upon which panel is connected if its edp max it
>>> supports 2 resolutions =3D> less time. For HDMI; having multiple
>>> resolutions its taking more time.
>>>
>>> On 06-Aug-20 4:38 PM, Swati Sharma wrote:
>>>> testdisplay should be added to BAT. testdisplay is considered
>>>> to be the most basic test to test display functionality.
>>>> With this test we will be able to test modesetting.
>>>>
>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> Cc: Petri Latvala <petri.latvala@intel.com>
>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>> ---
>>>>  =A0 tests/intel-ci/fast-feedback.testlist | 1 +
>>>>  =A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tests/intel-ci/fast-feedback.testlist
>>>> b/tests/intel-ci/fast-feedback.testlist
>>>> index b796b264..b245b7a7 100644
>>>> --- a/tests/intel-ci/fast-feedback.testlist
>>>> +++ b/tests/intel-ci/fast-feedback.testlist
>>>> @@ -149,6 +149,7 @@ igt@vgem_basic@dmabuf-mmap
>>>>  =A0 igt@vgem_basic@mmap
>>>>  =A0 igt@vgem_basic@second-client
>>>>  =A0 igt@vgem_basic@sysfs
>>>> +igt@testdisplay
>>>>  =A0 # All tests that do module unloading and reloading are executed l=
ast.
>>>>  =A0 # They will sometimes reveal issues of earlier tests leaving the
>>>>
>>>
>>
> =


-- =

~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
