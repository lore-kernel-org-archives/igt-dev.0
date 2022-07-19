Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3452210FDD9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 00:38:34 +0000 (UTC)
Date: Mon, 18 Jul 2022 17:38:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, e@orsosgc001.jf.intel.com
Message-ID: <YtX9CKjrzRGMm6QM@orsosgc001.jf.intel.com>
References: <20220718223205.1629532-1-ashutosh.dixit@intel.com>
 <87y1wqavcu.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1wqavcu.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf/i915_ref_count: Skip on
 __drm_open_driver failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 03:50:41PM -0700, Dixit, Ashutosh wrote:
>On Mon, 18 Jul 2022 15:32:05 -0700, Ashutosh Dixit wrote:
>>
>> Skip early on __drm_open_driver() to generate a consistent failure
>> signature for CI (rather than a follow-on igt_assert(is_i915_device(fd))).
>>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>  tests/i915/perf.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index e641d5d2db7e..5502a3fb4e59 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -4838,6 +4838,7 @@ test_i915_ref_count(void)
>>	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
>>
>>	drm_fd = __drm_open_driver(DRIVER_INTEL);
>> +	igt_require_intel(drm_fd);
>
>The other option might be to use igt_require_fd() here (or something like
>that) which would be closer to the signature CI expects from
>drm_open_driver().
>
>At the other place in perf.c __drm_open_driver() is followed by
>igt_require_gem() which skips using igt_require_intel() and that's why I
>used igt_require_intel() here (instead of other options).
>
>Maybe as long as we are skipping one way or another (and not asserting) it
>should be ok?

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>
>>	devid = intel_get_drm_devid(drm_fd);
>>	sysfs = igt_sysfs_open(drm_fd);
>>
>> --
>> 2.34.1
>>
