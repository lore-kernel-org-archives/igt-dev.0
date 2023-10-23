Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5889F10E14C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 05:59:59 +0000 (UTC)
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 23 Oct 2023 05:59:53 +0000
Message-ID: <BYAPR11MB271084330B7C9D86125A0E6BA3D8A@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20231018075904.1834634-1-shawn.c.lee@intel.com>
 <20231019112729.1837000-1-shawn.c.lee@intel.com>
 <1ac9ac64-ebca-93f7-16dd-64bd0debc1ff@intel.com>
In-Reply-To: <1ac9ac64-ebca-93f7-16dd-64bd0debc1ff@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_setmode: disable DRRS if eDP
 support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: "20231019112729.1837000-1-shawn.c.lee@intel.com"
 <20231019112729.1837000-1-shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, October 23, 2023 1:23 PM, Modem, Bhanuprakash wrote:
>On Thu-19-10-2023 04:57 pm, Lee Shawn C wrote:
>> Below is a failed case while testing kms_setmode.
>>=20
>> CRTC[80] [Pipe A] Mode: 1920x1200@60Hz Connectors: eDP-1[236] Expected=20
>> frametime: 16659us; measured 20824.4us +- 4.799us accuracy 0.01% [0.10=20
>> scanlines]
>>=20
>> The expected frame time is 16659us (60Hz refresh rate).
>> But kms_setmode report measured time was 20824.4us (48Hz) then it=20
>> failed. We found legacy DRRS mode was active at that time then refresh=20
>> rate fall into lower RR automatically to cause this problem.
>
>Then, this is applicable for all the timing related subtests like kms_flip=
, kms_vblank etc..
>

I also commit a fix for kms_flip as well.
https://patchwork.freedesktop.org/series/125425/

>Also, is it applicable only for legacy drivers? If not, then IMHO the corr=
ect place to call the helper (to disable drrs) would be some where before s=
tarting the subtest (probably igt_display_reset())
>

Yes, only legacy DRRS will impact this test. Legacy DRRS will be active aft=
er modeset automatically.
That's why I add disable DRRS after drmModeSetCrtc() that will update CRTC =
setting and trigger full mode setting.

Please let me know if any suggestions. Thanks!

Best regards,
Shawn

>- Bhanu
>
>> Disable DRRS after crtc setmode can avoid driver switch to lower RR=20
>> mode and get pass for this test as well.
>>=20
>> v2: fix prefix string and sort header file by alphabetical
>>=20
>> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>   tests/kms_setmode.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>=20
>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index=20
>> 5fc4421c0080..98e49bbf95f9 100644
>> --- a/tests/kms_setmode.c
>> +++ b/tests/kms_setmode.c
>> @@ -30,7 +30,10 @@
>>   #include <string.h>
>>   #include <sys/time.h>
>>   #include <math.h>
>> +
>> +#include "i915/intel_drrs.h"
>>   #include "xe/xe_query.h"
>> +
>>   /**
>>    * TEST: kms setmode
>>    * Category: Display
>> @@ -651,6 +654,9 @@ retry:
>>   					     crtc->fb_info.fb_id, 0, 0, ids,
>>   					     crtc->connector_count, &crtc->mode);
>>  =20
>> +		if (is_intel_device(drm_fd))
>> +			intel_drrs_disable(drm_fd, crtc->pipe_id);
>> +
>>   		free(ids);
>>  =20
>>   		if (ret < 0) {
