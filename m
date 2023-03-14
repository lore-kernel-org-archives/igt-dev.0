Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247F210E821
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 14:33:00 +0000 (UTC)
Message-ID: <75a49d2e-d77a-f752-f2f2-9fec097828a9@intel.com>
Date: Tue, 14 Mar 2023 20:02:33 +0530
Content-Language: en-US
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-3-bhanuprakash.modem@intel.com>
 <20230314130340.40a8b008@maurocar-mobl2>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230314130340.40a8b008@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/5] i915: s/igt_require_intel/igt_require_i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On Tue-14-03-2023 05:33 pm, Mauro Carvalho Chehab wrote:
> On Tue, 14 Mar 2023 16:24:49 +0530
> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> 
>> Update to use the i915 specific helper.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> LGTM, although there are a bunch of tests/kms_* that also use
> igt_require_i915(). Didn't check what of them makes sense for
> Xe, if any.

I am planning to address individual kms tests as a separate task.

- Bhanu

> 
> Anyway,
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
>> ---
>>   lib/i915/gem.c    | 2 +-
>>   lib/igt_fb.c      | 6 +++---
>>   lib/igt_kms.c     | 2 +-
>>   tests/i915/perf.c | 2 +-
>>   4 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/lib/i915/gem.c b/lib/i915/gem.c
>> index 27b872c28..ed45a9ed5 100644
>> --- a/lib/i915/gem.c
>> +++ b/lib/i915/gem.c
>> @@ -140,7 +140,7 @@ void igt_require_gem(int i915)
>>   {
>>   	int err;
>>   
>> -	igt_require_intel(i915);
>> +	igt_require_i915(i915);
>>   
>>   	/*
>>   	 * We only want to use the throttle-ioctl for its -EIO reporting
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index ed4623139..ba89e1f60 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -442,7 +442,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>>   		*height_ret = 1;
>>   		break;
>>   	case I915_FORMAT_MOD_X_TILED:
>> -		igt_require_intel(fd);
>> +		igt_require_i915(fd);
>>   		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>>   			*width_ret = 128;
>>   			*height_ret = 16;
>> @@ -460,7 +460,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>>   	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>>   	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>>   	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>> -		igt_require_intel(fd);
>> +		igt_require_i915(fd);
>>   		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>>   			*width_ret = 128;
>>   			*height_ret = 16;
>> @@ -474,7 +474,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>>   		break;
>>   	case I915_FORMAT_MOD_Yf_TILED:
>>   	case I915_FORMAT_MOD_Yf_TILED_CCS:
>> -		igt_require_intel(fd);
>> +		igt_require_i915(fd);
>>   		switch (fb_bpp) {
>>   		case 8:
>>   			*width_ret = 64;
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 8c7dd85b8..84091d5ce 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1458,7 +1458,7 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
>>   	 * Forcing DP connectors doesn't currently work, so
>>   	 * fail early to allow the test to skip if required.
>>   	 */
>> -	if (is_i915_device(drm_fd) &&
>> +	if (is_intel_device(drm_fd) &&
>>   	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
>>   		return false;
>>   
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index 6453354cf..edb922c75 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -4946,7 +4946,7 @@ test_i915_ref_count(void)
>>   	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
>>   
>>   	drm_fd = __drm_open_driver(DRIVER_INTEL);
>> -	igt_require_intel(drm_fd);
>> +	igt_require_i915(drm_fd);
>>   	devid = intel_get_drm_devid(drm_fd);
>>   	sysfs = perf_sysfs_open(drm_fd);
>>   

