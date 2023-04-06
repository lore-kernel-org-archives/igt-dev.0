Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017B010EB01
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 07:57:25 +0000 (UTC)
Message-ID: <7fb0a6e7-251d-1adf-9b2b-6f9da88d9f5f@intel.com>
Date: Thu, 6 Apr 2023 13:27:00 +0530
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230331134556.4077113-1-bhanuprakash.modem@intel.com>
 <20230331134556.4077113-4-bhanuprakash.modem@intel.com>
 <20230404150244.aqfj5jaiieep3p7d@kamilkon-desk1>
 <d24220f9-cae1-b11a-fd42-684aa04922a1@intel.com>
 <c4bcf664-5a24-1341-a84b-5bcf61d83ad7@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <c4bcf664-5a24-1341-a84b-5bcf61d83ad7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 3/5] tests/kms_addfb_basic: Add XE support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Karthik,

On Thu-06-04-2023 12:12 pm, Karthik B S wrote:
> 
> On 4/5/2023 11:43 AM, Modem, Bhanuprakash wrote:
>> Hi Kamil,
>>
>> On Tue-04-04-2023 08:32 pm, Kamil Konieczny wrote:
>>> Hi Bhanuprakash,
>>>
>>> On 2023-03-31 at 19:15:54 +0530, Bhanuprakash Modem wrote:
>>>> Update/fix necessary subtests for XE driver compatibility.
>>>> Also, reorder existing subtests to avoid code duplication.
>>>>
>>>> V2: - Fix invalid-smem-bo-on-discrete subtest (Zbigniew)
>>>>
>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>> ---
>>>>   tests/kms_addfb_basic.c | 42 
>>>> +++++++++++++++++++++++++++--------------
>>>>   1 file changed, 28 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>>>> index b4526eee6..e27b22fe0 100644
>>>> --- a/tests/kms_addfb_basic.c
>>>> +++ b/tests/kms_addfb_basic.c
>>>> @@ -41,6 +41,8 @@
>>>>   #include "igt_rand.h"
>>>>   #include "igt_device.h"
>>>>   #include "i915/intel_memory_region.h"
>>>> +#include "xe/xe_ioctl.h"
>>>> +#include "xe/xe_query.h"
>>>>     uint32_t gem_bo;
>>>>   uint32_t gem_bo_small;
>>>> @@ -121,7 +123,7 @@ static void invalid_tests(int fd)
>>>>         igt_describe("Check if addfb2 call works for clobbered 
>>>> modifier");
>>>>       igt_subtest("clobberred-modifier") {
>>>> -        igt_require_intel(fd);
>>>> +        igt_require_i915(fd);
>>>>           igt_require(gem_available_fences(fd) > 0);
>>>>           f.flags = 0;
>>>>           f.modifier[0] = 0;
>>>> @@ -139,10 +141,17 @@ static void invalid_tests(int fd)
>>>>           uint64_t size;
>>>>             igt_require_intel(fd);
>>>> -        igt_require(gem_has_lmem(fd));
>>>>           igt_calc_fb_size(fd, f.width, f.height,
>>>>                   DRM_FORMAT_XRGB8888, 0, &size, &stride);
>>>> -        handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
>>>> +
>>>> +        if (is_i915_device(fd)) {
>>>> +            igt_require(gem_has_lmem(fd));
>>>> +            handle = gem_create_in_memory_regions(fd, size, 
>>>> REGION_SMEM);
>>>> +        } else {
>>>> +            igt_require(xe_has_vram(fd));
>>>> +            handle = xe_bo_create_flags(fd, 0, size, 
>>>> system_memory(fd));
>>>> +        }
>>>> +
>>>>           f.handles[0] = handle;
>>>>           do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
>>>>       }
>>>> @@ -323,7 +332,7 @@ static void tiling_tests(int fd)
>>>>         igt_subtest_group {
>>>>           igt_fixture {
>>>> -            igt_require_intel(fd);
>>>> +            igt_require_i915(fd);
>>>>               tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 
>>>> 1024,
>>>>                   DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
>>>>                   1024*4, NULL, NULL, NULL);
>>>> @@ -494,7 +503,7 @@ static void size_tests(int fd)
>>>>         igt_describe("Test that addfb2 call fails correctly with 
>>>> small buffer object after changing tile");
>>>>       igt_subtest("bo-too-small-due-to-tiling") {
>>>> -        igt_require_intel(fd);
>>>> +        igt_require_i915(fd);
>>>>           igt_require(gem_available_fences(fd) > 0);
>>>>           gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
>>>>           do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>>>> @@ -548,7 +557,7 @@ static void addfb25_tests(int fd)
>>>>         igt_subtest_group {
>>>>           igt_fixture {
>>>> -            igt_require_intel(fd);
>>>> +            igt_require_i915(fd);
>>>>               igt_require(gem_available_fences(fd) > 0);
>>>>               gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
>>>>               igt_require_fb_modifiers(fd);
>>>> @@ -594,6 +603,7 @@ static void addfb25_ytile(int fd)
>>>>       igt_display_t display;
>>>>         igt_fixture {
>>>> +        igt_require_i915(fd);
>>>>           igt_display_require(&display, fd);
>>>>             gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
>>>> @@ -618,7 +628,6 @@ static void addfb25_ytile(int fd)
>>>>       igt_describe("Check if addfb2 call works for y-tiling");
>>>>       igt_subtest("addfb25-y-tiled-legacy") {
>>>>           igt_require_fb_modifiers(fd);
>>>> -        igt_require_intel(fd);
>>>
>>> This removes duplication (if it is intel-i915 specific subtest).
>>>
>>>>             f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
>>>>           igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
>>>> @@ -631,7 +640,6 @@ static void addfb25_ytile(int fd)
>>>>       igt_describe("Check if addfb2 call works for yf-tiling");
>>>>       igt_subtest("addfb25-yf-tiled-legacy") {
>>>>           igt_require_fb_modifiers(fd);
>>>> -        igt_require_intel(fd);
>>>>             f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
>>>>           igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
>>>> @@ -644,7 +652,6 @@ static void addfb25_ytile(int fd)
>>>>       igt_describe("Test that addfb2 call fails correctly for 
>>>> y-tiling with given height and modifier");
>>>>       igt_subtest("addfb25-y-tiled-small-legacy") {
>>>>           igt_require_fb_modifiers(fd);
>>>> -        igt_require_intel(fd);
>>>>             f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
>>>>           f.height = 1023;
>>>> @@ -667,6 +674,7 @@ static void addfb25_4tile(int fd)
>>>>       igt_display_t display;
>>>>         igt_fixture {
>>>> +        igt_require_i915(fd);
>>>>           igt_display_require(&display, fd);
>>>>             gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
>>>> @@ -689,7 +697,6 @@ static void addfb25_4tile(int fd)
>>>>       igt_describe("Check if addfb2 call works for tiling-4");
>>>>       igt_subtest("addfb25-4-tiled") {
>>>>           igt_require_fb_modifiers(fd);
>>>> -        igt_require_intel(fd);
>>>>             f.modifier[0] = I915_FORMAT_MOD_4_TILED;
>>>>           igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
>>>> @@ -839,6 +846,9 @@ igt_main
>>>>       igt_fixture {
>>>>           fd = drm_open_driver_master(DRIVER_ANY);
>>>>           igt_require(has_addfb2_iface(fd));
>>>> +
>>>> +        if (is_xe_device(fd))
>>>> +            xe_device_get(fd);
>>>>       }
>>>>         invalid_tests(fd);
>>>> @@ -847,6 +857,10 @@ igt_main
>>>>         size_tests(fd);
>>>>   +    prop_tests(fd);
>>>> +
>>>> +    master_tests(fd);
>>>> +
>>>>       addfb25_tests(fd);
>>>>         addfb25_ytile(fd);
>>>> @@ -855,10 +869,10 @@ igt_main
>>>>         tiling_tests(fd);
>>>>   -    prop_tests(fd);
>>>> -
>>>> -    master_tests(fd);
>>>
>>> This is just moved above, how does it avoid duplication ?
>>
>> Sorry for the incomplete information. There are 2 reasons to do this.
>>
>> 1. Due to the i915 check in igt_fixture in previous tests, these prop 
>> & master tests are getting SKIP.
>>
>> Subtest addfb25-framebuffer-vs-set-tiling: SKIP (0.000s)
>> Test requirement not met in function igt_require_i915, file 
>> ../lib/drmtest.c:664:
>> Test requirement: is_i915_device(fd)
>> Subtest addfb25-y-tiled-legacy: SKIP (0.000s)
>> Subtest addfb25-yf-tiled-legacy: SKIP (0.000s)
>> Subtest addfb25-y-tiled-small-legacy: SKIP (0.000s)
>> Subtest addfb25-4-tiled: SKIP (0.000s)
>> Subtest basic-x-tiled-legacy: SKIP (0.000s)
>> Subtest framebuffer-vs-set-tiling: SKIP (0.000s)
>> Subtest tile-pitch-mismatch: SKIP (0.000s)
>> Subtest basic-y-tiled-legacy: SKIP (0.000s)
>> Subtest invalid-get-prop-any: SKIP (0.000s)
>> Subtest invalid-get-prop: SKIP (0.000s)
>> Subtest invalid-set-prop-any: SKIP (0.000s)
>> Subtest invalid-set-prop: SKIP (0.000s)
>> Subtest master-rmfb: SKIP (0.000s)
>>
>>
>> After re-ordering these tests (with minimum code churn) tests are 
>> getting PASS.
>>
>> Starting subtest: bo-too-small-due-to-tiling
>> Test requirement not met in function igt_require_i915, file 
>> ../lib/drmtest.c:664:
>> Test requirement: is_i915_device(fd)
>> Subtest bo-too-small-due-to-tiling: SKIP (0.000s)
>> Starting subtest: invalid-get-prop-any
>> Subtest invalid-get-prop-any: SUCCESS (0.000s)
>> Starting subtest: invalid-get-prop
>> Subtest invalid-get-prop: SUCCESS (0.000s)
>> Starting subtest: invalid-set-prop-any
>> Subtest invalid-set-prop-any: SUCCESS (0.000s)
>> Starting subtest: invalid-set-prop
>> Subtest invalid-set-prop: SUCCESS (0.000s)
>> Starting subtest: master-rmfb
>> Subtest master-rmfb: SUCCESS (0.000s)
>>
>>
>> 2. As XE subtests are tightly coupled with the xe_device_get() and 
>> igt_display_fini() in tiling tests destroys xe_device will cause the 
>> failures in prop & master tests (only if we enable tiling tests in 
>> future).
>>
>> Maybe I need to re-word the commit message.
> Hi,
> 
> The test reordering seems to be masking the problem in the existing 
> code. I understand that this patch isn't actually introducing the issue, 
> but I think we would need some code restructuring to fix the issue to 
> add XE support in this binary.
> 
> I see 2 things which are causing the issue here.
> 
> 1. 'igt_display_(require|fini)' being called individually inside the 
> functions. 'igt_display_require' is caused 3 times and 
> 'igt_display_fini' is called to 2 times. And as igt_display_fini is 
> internally calling 'xe_device_put', this will mess up any xe specific 
> subtests after this call.
> 
> This could be fixed by using 'igt_subtest_group' to group the subtests 
> which need display and call igt_display_require only once. 
> 'igt_display_fini' can then be called in a fixture only in the end of 
> all the subtests.
> 
> 2. The 'igt_require_i915' being called in a fixture outside a 
> subtest_group, which is causing all following sub tests to skip.
> 
> Again this could be fixed by using 'igt_subtest_group' to group the 
> subtests which are specific to i915 and have this check in a fixture 
> inside the subtest group. This looks a little tricky as I see a couple 
> of functions that are having a combination of i915 and generic tests, 
> but I can't think of any better way to handle this currently.

I have separated this into two patches and floated a new rev [*].

1- Re-group & cleanup the code
2- Xe support

[*]: https://patchwork.freedesktop.org/series/115381/

- Bhanu

> 
> Thanks,
> Karthik.B.S
>>
>> - Bhanu
>>
>>>
>>> Regards,
>>> Kamil
>>>
>>>> +    igt_fixture {
>>>> +        if (is_xe_device(fd))
>>>> +            xe_device_put(fd);
>>>>   -    igt_fixture
>>>>           close(fd);
>>>> +    }
>>>>   }
>>>> -- 
>>>> 2.40.0
>>>>
