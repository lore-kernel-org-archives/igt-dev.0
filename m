Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <f2b11473-cab7-25a8-e8cf-62ad409638d7@intel.com>
Date: Thu, 30 Mar 2023 13:52:28 -0700
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230324224959.1727662-1-vinay.belgaumkar@intel.com>
 <20230324224959.1727662-3-vinay.belgaumkar@intel.com>
 <ZCAmqEsDAxVt7ysy@intel.com> <99d669bf-54cc-1105-fe50-616db3aaeae2@intel.com>
 <ZCM3mchRbwxU15L1@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZCM3mchRbwxU15L1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/2] i915_guc_pc: Add some
 basic SLPC igt tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 3/28/2023 11:53 AM, Rodrigo Vivi wrote:
> On Mon, Mar 27, 2023 at 04:29:55PM -0700, Belgaumkar, Vinay wrote:
>> On 3/26/2023 4:04 AM, Rodrigo Vivi wrote:
>>> On Fri, Mar 24, 2023 at 03:49:59PM -0700, Vinay Belgaumkar wrote:
>>>> Use the xe_guc_pc test for i915 as well. Validate basic
>>>> api for GT freq control. Also test interaction with GT
>>>> reset. We skip rps tests with SLPC enabled, this will
>>>> re-introduce some coverage. SLPC selftests are already
>>>> covering some other workload related scenarios.
>>>>
>>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> you probably meant 'Cc:'
>> Added you as Signed-off-by since you are the original author in xe igt.
> I do understand you did with the best of intentions here. But since with
> the new Xe driver we are going to hit many cases like this. Please allow
> me to use this case here to bring some thoughts.
>
> First of all, there's a very common misunderstanding of the meaning of the
> 'Signed-off-by:' (sob).
>
> **hint**: It does *not* mean 'authorship'!
>
> Although we are in an IGT patch, let's use the kernel definition so we
> are aligned in some well documented rule:
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off#developer-s-certificate-of-origin-1-1
>
> So, like defined on the official rules above, in this very specific case,
> when you created the patch, your 'sob' certified ('b') that:
> "The contribution is based upon previous work that, to the best of my knowledge,
>   is covered under an appropriate open source license and I have the right under
> that license to submit that work with modifications"
>
> Any extra Sob would be added as the patch could be in its transportation.
>
> "Any further SoBs (Signed-off-by:’s) following the author’s SoB are from people
> handling and transporting the patch, but were not involved in its development.
> SoB chains should reflect the real route a patch took as it was propagated to
> the maintainers and ultimately to Linus, with the first SoB entry signalling
> primary authorship of a single author."
>
> Same as 'c' of the certificate of origin: "The contribution was provided directly
> to me by some other person who certified (a), (b) or (c) and I have not modified it.
>
> It is very important to highlight this transportation rules because there
> are many new devs that think that we maintainers are stealing ownership.
> As you can see, this is not the case, but the rule.
>
> Back to your case, since I had never seen this patch in my life before it hit
> the mailing list, I couldn't have certified this patch in any possible way,
> so the forged sob is the improper approach.
>
> It is very hard to define a written rule on what to do with the code copied
> from one driver to the other. In many cases the recognition is important,
> but in other cases it is even hard to find who was actually the true author of
> that code.
>
> There are many options available. A simple one could be 'Cc' the person and
> write in the commit message that the code was based on the other driver from
> that person, but maybe there are better options available. So let's say that
> when in doubt: ask. Contact the original author and ask what he/she has
> to suggest. Maybe just this mention and cc would be enough, maybe even with
> an acked-by or with the explicit sob, or maybe with some other tag like
> 'co-developed-by'.

Ok, makes sense. I have sent out another patch with you Cc'd.

Thanks,

Vinay.

>
> Thanks,
> Rodrigo.
>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    tests/i915/i915_guc_pc.c | 151 +++++++++++++++++++++++++++++++++++++++
>>>>    tests/meson.build        |   1 +
>>>>    2 files changed, 152 insertions(+)
>>>>    create mode 100644 tests/i915/i915_guc_pc.c
>>>>
>>>> diff --git a/tests/i915/i915_guc_pc.c b/tests/i915/i915_guc_pc.c
>>>> new file mode 100644
>>>> index 00000000..f9a0ed83
>>>> --- /dev/null
>>>> +++ b/tests/i915/i915_guc_pc.c
>>> since 'guc_pc' is not a thing in i915 I'm afraid this will cause
>>> confusion later.
>>>
>>> I know, guc_slpc also doesn't make a lot of sense here...
>>>
>>> Should we then try to move this code to the 'tests/i915/i915_pm_rps.c'
>>> or maybe name it i915_pm_freq_api or something like that?
>> Sure. I was trying to make these guc/slpc specific since host trubo/RPS
>> already has coverage in IGT.
>>
>> Thanks,
>>
>> Vinay.
>>
>>>> @@ -0,0 +1,151 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <dirent.h>
>>>> +#include <errno.h>
>>>> +#include <fcntl.h>
>>>> +#include <inttypes.h>
>>>> +#include <stdlib.h>
>>>> +#include <sys/stat.h>
>>>> +#include <sys/syscall.h>
>>>> +#include <sys/types.h>
>>>> +#include <unistd.h>
>>>> +
>>>> +#include "drmtest.h"
>>>> +#include "i915/gem.h"
>>>> +#include "igt_sysfs.h"
>>>> +#include "igt.h"
>>>> +
>>>> +IGT_TEST_DESCRIPTION("Test GuC PM features like SLPC and its interactions");
>>>> +/*
>>>> + * Too many intermediate components and steps before freq is adjusted
>>>> + * Specially if workload is under execution, so let's wait 100 ms.
>>>> + */
>>>> +#define ACT_FREQ_LATENCY_US 100000
>>>> +
>>>> +static uint32_t get_freq(int dirfd, uint8_t id)
>>>> +{
>>>> +	uint32_t val;
>>>> +
>>>> +	igt_require(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>>>> +
>>>> +	return val;
>>>> +}
>>>> +
>>>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>>>> +{
>>>> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>>>> +}
>>>> +
>>>> +static void test_freq_basic_api(int dirfd, int gt)
>>>> +{
>>>> +	uint32_t rpn, rp0, rpe;
>>>> +
>>>> +	/* Save frequencies */
>>>> +	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>>>> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>>> +	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
>>>> +	igt_info("System min freq: %dMHz; max freq: %dMHz\n", rpn, rp0);
>>>> +
>>>> +	/*
>>>> +	 * Negative bound tests
>>>> +	 * RPn is the floor
>>>> +	 * RP0 is the ceiling
>>>> +	 */
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1) < 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0 + 1) < 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1) < 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0 + 1) < 0);
>>>> +
>>>> +	/* Assert min requests are respected from rp0 to rpn */
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rp0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpe) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpe);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
>>>> +
>>>> +	/* Assert max requests are respected from rpn to rp0 */
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpe) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpe);
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0) > 0);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rp0);
>>>> +
>>>> +}
>>>> +
>>>> +static void test_reset(int i915, int dirfd, int gt)
>>>> +{
>>>> +	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>>>> +	int fd;
>>>> +
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>>> +	usleep(ACT_FREQ_LATENCY_US);
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
>>>> +
>>>> +	/* Manually trigger a GT reset */
>>>> +	fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
>>>> +	igt_require(fd >= 0);
>>>> +	igt_ignore_warn(write(fd, "1\n", 2));
>>>> +	close(fd);
>>>> +
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
>>>> +}
>>>> +
>>>> +igt_main
>>>> +{
>>>> +	int i915 = -1;
>>>> +	uint32_t *stash_min, *stash_max;
>>>> +
>>>> +	igt_fixture {
>>>> +		int num_gts, dirfd, gt;
>>>> +
>>>> +		i915 = drm_open_driver(DRIVER_INTEL);
>>>> +		igt_require_gem(i915);
>>>> +		/* i915_pm_rps already covers execlist path */
>>>> +		igt_require(gem_using_guc_submission(i915));
>>>> +
>>>> +		num_gts = igt_sysfs_get_num_gt(i915);
>>>> +		stash_min = (uint32_t*)malloc(sizeof(uint32_t) * num_gts);
>>>> +		stash_max = (uint32_t*)malloc(sizeof(uint32_t) * num_gts);
>>>> +
>>>> +		/* Save curr min and max across GTs */
>>>> +		for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
>>>> +			stash_min[gt] = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
>>>> +			stash_max[gt] = get_freq(dirfd, RPS_MAX_FREQ_MHZ);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	igt_describe("Test basic API for controlling min/max GT frequency");
>>>> +	igt_subtest_with_dynamic_f("freq-basic-api") {
>>>> +		int dirfd, gt;
>>>> +
>>>> +		for_each_sysfs_gt_dirfd(i915, dirfd, gt)
>>>> +			igt_dynamic_f("gt%u", gt)
>>>> +				test_freq_basic_api(dirfd, gt);
>>>> +	}
>>>> +
>>>> +	igt_describe("Test basic freq API works after a reset");
>>>> +	igt_subtest_with_dynamic_f("freq-reset") {
>>>> +		int dirfd, gt;
>>>> +
>>>> +		for_each_sysfs_gt_dirfd(i915, dirfd, gt)
>>>> +			igt_dynamic_f("gt%u", gt)
>>>> +				test_reset(i915, dirfd, gt);
>>>> +	}
>>>> +
>>>> +	igt_fixture {
>>>> +		int dirfd, gt;
>>>> +		/* Restore frequencies */
>>>> +		for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
>>>> +			igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]) > 0);
>>>> +			igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]) > 0);
>>>> +		}
>>>> +		close(i915);
>>>> +	}
>>>> +}
>>>> diff --git a/tests/meson.build b/tests/meson.build
>>>> index 7d2168be..3ebd3bf2 100644
>>>> --- a/tests/meson.build
>>>> +++ b/tests/meson.build
>>>> @@ -202,6 +202,7 @@ i915_progs = [
>>>>    	'gem_workarounds',
>>>>    	'i915_fb_tiling',
>>>>    	'i915_getparams_basic',
>>>> +	'i915_guc_pc',
>>>>    	'i915_hangman',
>>>>    	'i915_hwmon',
>>>>    	'i915_module_load',
>>>> -- 
>>>> 2.38.1
>>>>
