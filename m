Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D285310E4C0
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 10:53:29 +0000 (UTC)
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 19 Oct 2023 10:53:20 +0000
Message-ID: <BYAPR11MB271092E9B14CAC3EB4FE6460A3D4A@BYAPR11MB2710.namprd11.prod.outlook.com>
References: <20231018075904.1834634-1-shawn.c.lee@intel.com>
 <20231019103933.kbwfumzy5cok2r2n@kamilkon-desk.igk.intel.com>
In-Reply-To: <20231019103933.kbwfumzy5cok2r2n@kamilkon-desk.igk.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [[PATCH i-g-t]] tests/kms_setmode: disable DRRS if
 eDP support variable refresh rate
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: "20231018075904.1834634-1-shawn.c.lee@intel.com"
 <20231018075904.1834634-1-shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thursday, October 19, 2023 6:40 PM, Kamil Konieczny <kamil.konieczny@lin=
ux.intel.com> wrote:
>Hi Lee,
>On 2023-10-18 at 15:59:04 +0800, Lee Shawn C wrote:
>
>please correct subject in your patch:
>
>[[PATCH i-g-t]] tests/kms_setmode: disable DRRS if eDP support variable re=
fresh rate ^ ----------- ^
>
>Too many braceses here, should be:
>[PATCH i-g-t] tests/kms_setmode: disable DRRS if eDP support variable refr=
esh rate
>

I will fix the prefix string on next commit. Thanks!

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
>> Disable DRRS after crtc setmode can avoid driver switch to lower RR=20
>> mode and get pass for this test as well.
>>=20
>> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/148
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
>
>Adding Juha-Pekka and Bhanu to Cc.
>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  tests/kms_setmode.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index=20
>> 5fc4421c0080..b6fe3f9c159a 100644
>> --- a/tests/kms_setmode.c
>> +++ b/tests/kms_setmode.c
>> @@ -31,6 +31,7 @@
>>  #include <sys/time.h>
>>  #include <math.h>
>>  #include "xe/xe_query.h"
>> +#include "i915/intel_drrs.h"
>
>Keep it sorted alphabetically, also add newline after system
>headers:
>
>#include <math.h>
>
>#include "i915/intel_drrs.h"
>#include "xe/xe_query.h"
>
>>  /**
>>   * TEST: kms setmode
>>   * Category: Display
>> @@ -651,6 +652,9 @@ retry:
>>  					     crtc->fb_info.fb_id, 0, 0, ids,
>>  					     crtc->connector_count, &crtc->mode);
>> =20
>> +		if (is_intel_device(drm_fd))
>
>Question for Bhanu or Juha-Pekka: will this work for Xe?
>Should this be: 	if (is_i915_device(drm_fd))
>
>Regards,
>Kamil
>

is_intel_device() in lib/drmtest.c should be able to cover Xe and i915 devi=
ce.

bool is_intel_device(int fd)
{
	return is_i915_device(fd) || is_xe_device(fd);
}

Best regards,
Shawn

>> +			intel_drrs_disable(drm_fd, crtc->pipe_id);
>> +
>>  		free(ids);
>> =20
>>  		if (ret < 0) {
>> --
>> 2.34.1
>> =20
