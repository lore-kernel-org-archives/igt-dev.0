Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F007010E20B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 22:56:09 +0000 (UTC)
Date: Thu, 9 Mar 2023 14:55:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZApj/EvZeaLuSe1X@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-9-umesh.nerlige.ramappa@intel.com>
 <87o7p5mq2r.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o7p5mq2r.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/31] i915/perf: Treat ticks as 64 bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 03:13:00PM -0800, Dixit, Ashutosh wrote:
>On Tue, 14 Feb 2023 16:46:25 -0800, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> To support 64 bit OA report headers, treat all ticks as 64 bits.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/i915/perf.c | 79 ++++++++++++++++++++++++++++++++---------------
>>  1 file changed, 54 insertions(+), 25 deletions(-)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index bd3cdb6a..4c7b4e49 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -125,6 +125,7 @@ struct oa_format {
>>	int c_off;
>>	int n_c;
>>	int oa_type;
>> +	bool report_hdr_64bit;
>>  };
>>
>>  static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
>> @@ -244,7 +245,7 @@ static bool *undefined_a_counters;
>>  static uint64_t oa_exp_1_millisec;
>>
>>  static igt_render_copyfunc_t render_copy = NULL;
>> -static uint32_t (*read_report_ticks)(const uint32_t *report,
>> +static uint64_t (*read_report_ticks)(const uint32_t *report,
>>				     enum drm_i915_oa_format format);
>>  static void (*sanity_check_reports)(const uint32_t *oa_report0,
>>				    const uint32_t *oa_report1,
>> @@ -438,7 +439,7 @@ sysfs_read(enum i915_attr_id id)
>>   * C2 corresponds to a clock counter for the Haswell render basic metric set
>>   * but it's not included in all of the formats.
>>   */
>> -static uint32_t
>> +static uint64_t
>>  hsw_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
>>  {
>>	uint32_t *c = (uint32_t *)(((uint8_t *)report) + get_oa_format(format).c_off);
>> @@ -448,10 +449,41 @@ hsw_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
>>	return c[2];
>>  }
>>
>> -static uint32_t
>> +static uint64_t
>>  gen8_read_report_ticks(const uint32_t *report, enum drm_i915_oa_format format)
>>  {
>> -	return report[3];
>> +
>> +	struct oa_format fmt = get_oa_format(format);
>> +
>> +	return fmt.report_hdr_64bit ? *(uint64_t *)&report[6] : report[3];
>> +}
>> +
>> +/*
>> + * t0 is a value sampled before t1. width is number of bits used to represent
>> + * t0/t1. Normally t1 is greater than t0. In cases where t1 < t0 use this
>> + * helper. Since the size of t1/t0 is already 64 bits, no special handling is
>> + * needed for width = 64.
>> + */
>> +static uint64_t
>> +elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
>> +{
>> +	uint32_t max_bits = sizeof(t1) * 8;
>> +
>> +	igt_assert(width <= max_bits);
>> +
>> +	if (t1 < t0 && width != max_bits)
>> +		return ((1ULL << width) - t0) + t1;
>> +
>> +	return t1 - t0;
>
>OK, this looks fine due to 2's complement arithmentic.
>
>> +}
>> +
>> +static uint64_t
>> +oa_tick_delta(const uint32_t *report1,
>> +	      const uint32_t *report0,
>> +	      enum drm_i915_oa_format format)
>> +{
>> +	return elapsed_delta(read_report_ticks(report1, format),
>> +			     read_report_ticks(report0, format), 32);
>
>Why are ticks always considered 32 bits? For 64 bit report headers aren't
>ticks 64 bits?

The report headers have space for 64 bits, but the upper 32 bits have 
not been defined in the header definition.
>
>Also, sorry my ignorance, what is the difference between timestamps and
>ticks (both are present in the report headers)?

I believe the ticks will vary with gt frequency (and spec says this 
value can be used to normalize the counters), whereas the timestamp 
provides a fixed elapsed time based on the cs/oa timestamp frequency 
(19.2 MHz or something fixed per platform).

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
