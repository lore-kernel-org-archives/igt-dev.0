Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973410E068
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 20:37:44 +0000 (UTC)
Date: Wed, 15 Mar 2023 13:37:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZBIshB2JJtyaH9X7@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-16-umesh.nerlige.ramappa@intel.com>
 <20230313152121.kml6iabgta2teh6s@kamilkon-desk1>
 <87o7oulugj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o7oulugj.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 15/31] i915/perf: Add OAM support
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

On Tue, Mar 14, 2023 at 05:38:36PM -0700, Dixit, Ashutosh wrote:
>On Mon, 13 Mar 2023 08:21:21 -0700, Kamil Konieczny wrote:
>>
>> > @@ -5306,10 +5345,27 @@ test_sysctl_defaults(void)
>> >	igt_assert_eq(max_freq, 100000);
>> >  }
>> >
>> > -#define __for_each_perf_enabled_engine(fd__, e__) \
>> > -	for_each_physical_engine(fd__, e__) \
>> > -		if (perf_supports_engine(e__)) \
>> > -			igt_dynamic_f("%s", e__->name)
>> > +static struct intel_execution_engine2 *
>> > +__ci_to_e2(const intel_ctx_t *ctx, struct i915_engine_class_instance *ci)
>> > +{
>> > +	static struct intel_execution_engine2 e2;
>>
>> e2 is on stack, see below, so it should be *e2

e2 is not on the stack because it is static.

>>
>> > +	struct intel_execution_engine2 *e;
>> > +
>> > +	for_each_ctx_engine(drm_fd, ctx, e) {
>> > +		if (e->class == ci->engine_class && e->instance == ci->engine_instance) {
>> > +			e2 = *e;
>> > +			break;
>> > +		}
>> > +	}
>> > +
>> > +	return &e2;
>> --------------- ^
>> imho you should allocate memory for this and return NULL when
>> not found.
>
>Yup something needs to be done here since e2 is on stack so dangerous to
>return a pointer to it.

Same as above, the static function variable is not allocated on the 
stack, so a pointer to it works just fine.

Thanks,
Umesh
