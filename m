Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB210E56E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 07:43:32 +0000 (UTC)
Message-ID: <5c61a73d-f30c-504b-79d4-603b7a65ecdc@intel.com>
Date: Wed, 25 Oct 2023 13:13:12 +0530
Content-Language: en-US
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230911072249.1935228-1-bhanuprakash.modem@intel.com>
 <20230911072249.1935228-3-bhanuprakash.modem@intel.com>
 <b1d4b535-4550-49df-8f4a-a8a4f411e02e@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <b1d4b535-4550-49df-8f4a-a8a4f411e02e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V5 2/5] tests/i915/kms_fb_coherency: Add XE
 support
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

Hi Swati,

On Mon-23-10-2023 02:11 pm, Sharma, Swati2 wrote:
> Hi Bhanu,
> 
> On 11-Sep-23 12:52 PM, Bhanuprakash Modem wrote:
>> Add XE driver support for kms tests. This patch will add a support
>> to call the corresponding apis based on the driver (i915/xe)
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/intel/kms_fb_coherency.c | 43 ++++++++++++++++++----------------
>>   1 file changed, 23 insertions(+), 20 deletions(-)
>>
>> diff --git a/tests/intel/kms_fb_coherency.c 
>> b/tests/intel/kms_fb_coherency.c
>> index c772ddcdc..745ffcdd2 100644
>> --- a/tests/intel/kms_fb_coherency.c
>> +++ b/tests/intel/kms_fb_coherency.c
>> @@ -16,6 +16,7 @@
>>   #include <string.h>
>>   #include "igt.h"
>> +#include "xe/xe_ioctl.h"
>>   typedef struct {
>>       int drm_fd;
>> @@ -91,7 +92,7 @@ static struct igt_fb *prepare_fb(data_t *data)
>>               0, 0, fb->width, fb->height,
>>               0, 0, fb->width << 16, fb->height << 16);
>> -    if (!gem_has_lmem(data->drm_fd)) {
>> +    if (is_i915_device(data->drm_fd) && !gem_has_lmem(data->drm_fd)) {
>>           uint32_t caching;
>>           /* make sure caching mode has become UC/WT */
>> @@ -160,7 +161,10 @@ static void test_mmap_offset_wc(data_t *data)
>>       fb = prepare_fb(data);
>> -    buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, 
>> fb->size, PROT_WRITE);
>> +    if (is_i915_device(data->drm_fd))
>> +        buf = gem_mmap_offset__wc(data->drm_fd, fb->gem_handle, 0, 
>> fb->size, PROT_WRITE);
>> +    else
>> +        buf = xe_bo_mmap_ext(data->drm_fd, fb->gem_handle, fb->size, 
>> PROT_WRITE);
>>       check_buf_crc(data, buf, fb);
>>   }
>> @@ -226,7 +230,7 @@ igt_main
>>       data_t data;
>>       igt_fixture {
>> -        data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>> +        data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>           data.devid = intel_get_drm_devid(data.drm_fd);
>> @@ -251,39 +255,38 @@ igt_main
>>        * Test category: functionality test
>>        */
>>       igt_subtest_with_dynamic("memset-crc") {
>> -        if (gem_has_mappable_ggtt(data.drm_fd)) {
>> +        if (igt_draw_supports_method(data.drm_fd, IGT_DRAW_MMAP_GTT)) {
>>               igt_dynamic("mmap-gtt")
>>                   test_mmap_gtt(&data);
>>               cleanup_crtc(&data);
>>           }
>> -        if (gem_mmap_offset__has_wc(data.drm_fd)) {
>> +        if (igt_draw_supports_method(data.drm_fd, IGT_DRAW_MMAP_WC)) {
>>               igt_dynamic("mmap-offset-wc")
>>                   test_mmap_offset_wc(&data);
>>               cleanup_crtc(&data);
>>           }
>> -        if (gem_has_lmem(data.drm_fd)) {
>> -            igt_dynamic("mmap-offset-fixed")
>> -                test_mmap_offset_fixed(&data);
>> +        if (is_i915_device(data.drm_fd)) {
> 
> Instead of using if (is_i915_device()), can we use 
> igt_require_i915(data.drm_fd) instead if these subtests are executable 
> on i915 driver only?

No, we can't use igt_require_i915() here.

For XE device, IGT will always throw a SKIP after the execution of 
"mmap-offset-wc".

BTW, we can't use igt_fixture inside igt_subtest_*().

- Bhanu

> 
>> +            if (gem_has_lmem(data.drm_fd)) {
>> +                igt_dynamic("mmap-offset-fixed")
>> +                    test_mmap_offset_fixed(&data);
>> +            } else if (gem_has_mmap_offset(data.drm_fd)) {
>> +                igt_dynamic("mmap-offset-uc")
>> +                    test_mmap_offset_uc(&data);
>> +            }
>>               cleanup_crtc(&data);
>> -        } else if (gem_has_mmap_offset(data.drm_fd)) {
>> -            igt_dynamic("mmap-offset-uc")
>> -                test_mmap_offset_uc(&data);
>> +            if (gem_has_legacy_mmap(data.drm_fd) &&
>> +                gem_mmap__has_wc(data.drm_fd)) {
>> +                igt_dynamic("mmap-legacy-wc")
>> +                    test_legacy_mmap_wc(&data);
>> -            cleanup_crtc(&data);
>> -        }
>> -
>> -        if (gem_has_legacy_mmap(data.drm_fd) &&
>> -            gem_mmap__has_wc(data.drm_fd)) {
>> -            igt_dynamic("mmap-legacy-wc")
>> -                test_legacy_mmap_wc(&data);
>> -
>> -            cleanup_crtc(&data);
>> +                cleanup_crtc(&data);
>> +            }
>>           }
>>       }
