Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5126EC8F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 11:10:19 +0000 (UTC)
References: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
 <158279901604.8627.8025260404770607562@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <826e8f8d-2517-6ac7-7abd-2b8bf5f38897@intel.com>
Date: Thu, 27 Feb 2020 13:10:16 +0200
MIME-Version: 1.0
In-Reply-To: <158279901604.8627.8025260404770607562@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: add a stress test
 opening/closing the stream
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 27/02/2020 12:23, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-02-27 10:17:24)
>> This appears to trigger hard hangs...
> Didn't even require a bg load!


Good point actually... I think there was still a glxgears running.


>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   tests/perf.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/tests/perf.c b/tests/perf.c
>> index d9bac561..d9ff4edb 100644
>> --- a/tests/perf.c
>> +++ b/tests/perf.c
>> @@ -3995,6 +3995,34 @@ test_rc6_disable(void)
>>          igt_assert_neq(n_events_end - n_events_start, 0);
>>   }
>>   
>> +static void
>> +test_stress_open_close(void)
>> +{
>> +       igt_until_timeout(2) {
>> +               int oa_exponent = 5; /* 5 micro seconds */
>> +               uint64_t properties[] = {
>> +                       /* XXX: even without periodic sampling we have to
>> +                        * specify at least one sample layout property...
>> +                        */
>> +                       DRM_I915_PERF_PROP_SAMPLE_OA, true,
>> +
>> +                       /* OA unit configuration */
>> +                       DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
>> +                       DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
>> +                       DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
>> +               };
>> +               struct drm_i915_perf_open_param param = {
>> +                       .flags = I915_PERF_FLAG_FD_CLOEXEC |
>> +                                I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
>> +                       .num_properties = sizeof(properties) / 16,
> #define NUM_PROPERTIES(p) (sizeof(p) / (2 * sizeof(uint64_t)))
>
> [and probably crib the kernels assert_pointer_is_array()]
>
>> +                       .properties_ptr = to_user_pointer(properties),
>> +               };
>> +
>> +               stream_fd = __perf_open(drm_fd, &param, false);
>> +               __perf_close(stream_fd);
> Ok, that looks as basic as can be -- I was struggling to decide what the
> minimum parameters were :)
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
