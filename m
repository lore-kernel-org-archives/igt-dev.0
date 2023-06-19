Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABF910E20A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 14:10:17 +0000 (UTC)
Message-ID: <06dc6b7e-f131-e007-812e-1a5582577628@intel.com>
Date: Mon, 19 Jun 2023 16:08:58 +0200
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>
References: <20230619062652.6700-1-lukasz.laguna@intel.com>
 <20230619120529.useftahay4pjtewr@kamilkon-desk1>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20230619120529.useftahay4pjtewr@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_sysfs: add asserting helpers
 for read/write operations
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

On 6/19/2023 14:05, Kamil Konieczny wrote:
> Hi Łukasz,
>
> On 2023-06-19 at 08:26:52 +0200, Łukasz Łaguna wrote:
>> Prefix names of existing, non-asserting helpers with "__". Replace all
>> calls to non-asserting ones in order to don't introduce any functional
> --------- ^
> Please write the names of functions you will be
> enhancing/changing.
>
>> changes in the existing code.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   lib/i915/gem_submission.c      |   2 +-
>>   lib/igt_pm.c                   |   2 +-
>>   lib/igt_power.c                |   2 +-
>>   lib/igt_sysfs.c                | 210 +++++++++++++++++++++++++--------
>>   lib/igt_sysfs.h                |  16 ++-
>>   tests/i915/i915_pm_dc.c        |   4 +-
>>   tests/i915/i915_pm_freq_mult.c |  28 ++---
>>   tests/i915/i915_pm_rps.c       |   8 +-
>>   tests/i915/i915_power.c        |   4 +-
>>   tests/i915/perf_pmu.c          |  38 +++---
>>   tests/kms_prime.c              |   4 +-
>>   tests/nouveau_crc.c            |   4 +-
>>   12 files changed, 220 insertions(+), 102 deletions(-)
>>
>> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
>> index adf5eb394..76286129a 100644
>> --- a/lib/i915/gem_submission.c
>> +++ b/lib/i915/gem_submission.c
>> @@ -70,7 +70,7 @@ unsigned gem_submission_method(int fd)
>>   	if (dir < 0)
>>   		return 0;
>>   
>> -	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
>> +	if (__igt_sysfs_get_u32(dir, "enable_guc") & 1) {
> This example show that __igt_sysfs_get_u32 should return 0
> in case of error or here we should also check for existance
> of this sysfs param.
>
>>   		method = GEM_SUBMISSION_GUC;
>>   	} else if (gen >= 8) {
>>   		method = GEM_SUBMISSION_EXECLISTS;
>> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
>> index 18c84bf3a..40a245e83 100644
>> --- a/lib/igt_pm.c
>> +++ b/lib/igt_pm.c
>> @@ -1415,5 +1415,5 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>>   		return;
>>   
>>   	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>> -	igt_assert(igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val));
>> +	igt_assert(__igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val));
>>   }
>> diff --git a/lib/igt_power.c b/lib/igt_power.c
>> index 3b34be406..b94a9e09d 100644
>> --- a/lib/igt_power.c
>> +++ b/lib/igt_power.c
>> @@ -137,7 +137,7 @@ void igt_power_get_energy(struct igt_power *power, struct power_sample *s)
>>   
>>   	if (power->hwmon_fd >= 0) {
>>   		if (igt_sysfs_has_attr(power->hwmon_fd, "energy1_input"))
>> -			s->energy = igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
>> +			s->energy = __igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
>>   	} else if (power->rapl.fd >= 0) {
>>   		rapl_read(&power->rapl, s);
>>   	}
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 35a4faa9a..c4d98cd53 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -511,94 +511,163 @@ int igt_sysfs_printf(int dir, const char *attr, const char *fmt, ...)
>>   	return ret;
>>   }
>>   
>> +static uint32_t ___igt_sysfs_get_u32(int dir, const char *attr, bool assert)
> ------------------------------------------------------------------ ^^^^^^^^^^^
> Do not write such functions, rather write two variants of
> get_u32, for example:
>
> no asserts here:
> uint32_t __igt_sysfs_get_u32(int dir, const char *attr)
>
> checks present here:
> uint32_t igt_sysfs_get_u32(int dir, const char *attr)

Hi Kamil, thanks for review.

I implemented such variants below. ___igt_sysfs_get_u32() was used only 
to avoid code duplication (and it's static).
Do you prefer me to duplicate code in
__igt_sysfs_get_u32() and igt_sysfs_get_u32() and remove 
___igt_sysfs_get_u32()?

> or alternativly, you could add
>
> bool __igt_sysfs_get_u32(int dir, const char *attr, uint32_t *val)

The main problem with the original implementation of igt_sysfs_get_u32() 
is that we are not able to distinguish if it returns 0 because of an 
error or because it's a read value.
So I even prefer bool __igt_sysfs_get_u32() , but on the other hand 
helper returning read value is more convenient and I guess that's why it 
was implemented in a such way, so I didn't want to change that. But 
maybe I should? What's your opinion?

Regards,
Lukasz

> Same note goes for u64 variant,
>
> Regrads,
> Kamil
>
>> +{
>> +	uint32_t result;
>> +	int ret;
>> +
>> +	ret = igt_sysfs_scanf(dir, attr, "%u", &result);
>> +	if (assert)
>> +		igt_assert(ret == 1);
>> +
>> +	if (igt_debug_on(ret != 1))
>> +		return 0;
>> +
>> +	return result;
>> +}
>> +
>>   /**
>> - * igt_sysfs_get_u32:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> + * __igt_sysfs_get_u32:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>>    *
>>    * Convenience wrapper to read a unsigned 32bit integer from a sysfs file.
>>    *
>>    * Returns:
>>    * The value read.
>>    */
>> +uint32_t __igt_sysfs_get_u32(int dir, const char *attr)
>> +{
>> +	return ___igt_sysfs_get_u32(dir, attr, false);
>> +}
>> +
>> +/**
>> + * igt_sysfs_get_u32:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>> + *
>> + * Asserting equivalent of __igt_sysfs_get_u32.
>> + *
>> + * Returns:
>> + * The value read.
>> + */
>>   uint32_t igt_sysfs_get_u32(int dir, const char *attr)
>>   {
>> -	uint32_t result;
>> +	return ___igt_sysfs_get_u32(dir, attr, true);
>> +}
>> +
>> +/**
>> + * __igt_sysfs_set_u32:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>> + * @value: value to set
>> + *
>> + * Convenience wrapper to write a unsigned 32bit integer to a sysfs file.
>> + *
>> + * Returns:
>> + * True if successfully written, false otherwise.
>> + */
>> +bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
>> +{
>> +	return igt_sysfs_printf(dir, attr, "%u", value) > 0;
>> +}
>> +
>> +/**
>> + * igt_sysfs_set_u32:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>> + * @value: value to set
>> + *
>> + * Asserting equivalent of __igt_sysfs_set_u32.
>> + */
>> +void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
>> +{
>> +	igt_assert(__igt_sysfs_set_u32(dir, attr, value));
>> +}
>>   
>> -	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%u", &result) != 1))
>> +static uint64_t ___igt_sysfs_get_u64(int dir, const char *attr, bool assert)
>> +{
>> +	uint64_t result;
>> +	int ret;
>> +
>> +	ret = igt_sysfs_scanf(dir, attr, "%"PRIu64, &result);
>> +	if (assert)
>> +		igt_assert(ret == 1);
>> +
>> +	if (igt_debug_on(ret != 1))
>>   		return 0;
>>   
>>   	return result;
>>   }
>>   
>>   /**
>> - * igt_sysfs_get_u64:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> + * __igt_sysfs_get_u64:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>>    *
>>    * Convenience wrapper to read a unsigned 64bit integer from a sysfs file.
>>    *
>>    * Returns:
>>    * The value read.
>>    */
>> -uint64_t igt_sysfs_get_u64(int dir, const char *attr)
>> +uint64_t __igt_sysfs_get_u64(int dir, const char *attr)
>>   {
>> -	uint64_t result;
>> -
>> -	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%"PRIu64, &result) != 1))
>> -		return 0;
>> -
>> -	return result;
>> +	return ___igt_sysfs_get_u64(dir, attr, false);
>>   }
>>   
>>   /**
>> - * igt_sysfs_set_u64:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> - * @value: value to set
>> + * igt_sysfs_get_u64:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>>    *
>> - * Convenience wrapper to write a unsigned 64bit integer to a sysfs file.
>> + * Asserting equivalent of __igt_sysfs_get_u64.
>>    *
>>    * Returns:
>> - * True if successfully written
>> + * The value read.
>>    */
>> -bool igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
>> +uint64_t igt_sysfs_get_u64(int dir, const char *attr)
>>   {
>> -	return igt_sysfs_printf(dir, attr, "%"PRIu64, value) > 0;
>> +	return ___igt_sysfs_get_u64(dir, attr, true);
>>   }
>>   
>>   /**
>> - * igt_sysfs_set_u32:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> + * __igt_sysfs_set_u64:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>>    * @value: value to set
>>    *
>> - * Convenience wrapper to write a unsigned 32bit integer to a sysfs file.
>> + * Convenience wrapper to write a unsigned 64bit integer to a sysfs file.
>>    *
>>    * Returns:
>> - * True if successfully written
>> + * True if successfully written, false otherwise.
>>    */
>> -bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
>> +bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
>>   {
>> -	return igt_sysfs_printf(dir, attr, "%u", value) > 0;
>> +	return igt_sysfs_printf(dir, attr, "%"PRIu64, value) > 0;
>>   }
>>   
>>   /**
>> - * igt_sysfs_get_boolean:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> + * igt_sysfs_set_u64:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>> + * @value: value to set
>>    *
>> - * Convenience wrapper to read a boolean sysfs file.
>> - *
>> - * Returns:
>> - * The value read.
>> + * Asserting equivalent of __igt_sysfs_set_u64.
>>    */
>> -bool igt_sysfs_get_boolean(int dir, const char *attr)
>> +void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value)
>> +{
>> +	igt_assert(__igt_sysfs_set_u64(dir, attr, value));
>> +}
>> +
>> +static bool ___igt_sysfs_get_boolean(int dir, const char *attr, bool assert)
>>   {
>>   	int result;
>>   	char *buf;
>>   
>>   	buf = igt_sysfs_get(dir, attr);
>> +	if (assert)
>> +		igt_assert(buf);
>> +
>>   	if (igt_debug_on(!buf))
>>   		return false;
>>   
>> @@ -612,21 +681,64 @@ bool igt_sysfs_get_boolean(int dir, const char *attr)
>>   }
>>   
>>   /**
>> - * igt_sysfs_set_boolean:
>> - * @dir: directory for the device from igt_sysfs_open()
>> - * @attr: name of the sysfs node to open
>> + * __igt_sysfs_get_boolean:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>> + *
>> + * Convenience wrapper to read a boolean sysfs file.
>> + *
>> + * Returns:
>> + * The value read.
>> + */
>> +bool __igt_sysfs_get_boolean(int dir, const char *attr)
>> +{
>> +	return ___igt_sysfs_get_boolean(dir, attr, false);
>> +}
>> +
>> +/**
>> + * igt_sysfs_get_boolean:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to read
>> + *
>> + * Asserting equivalent of __igt_sysfs_get_boolean.
>> + *
>> + * Returns:
>> + * The value read.
>> + */
>> +bool igt_sysfs_get_boolean(int dir, const char *attr)
>> +{
>> +	return ___igt_sysfs_get_boolean(dir, attr, true);
>> +}
>> +
>> +/**
>> + * __igt_sysfs_set_boolean:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>>    * @value: value to set
>>    *
>>    * Convenience wrapper to write a boolean sysfs file.
>> - *
>> + *
>>    * Returns:
>> - * The value read.
>> + * True if successfully written, false otherwise.
>>    */
>> -bool igt_sysfs_set_boolean(int dir, const char *attr, bool value)
>> +bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value)
>>   {
>>   	return igt_sysfs_printf(dir, attr, "%d", value) == 1;
>>   }
>>   
>> +/**
>> + * igt_sysfs_set_boolean:
>> + * @dir: directory corresponding to attribute
>> + * @attr: name of the sysfs node to write
>> + * @value: value to set
>> + *
>> + * Asserting equivalent of __igt_sysfs_set_boolean.
>> + */
>> +void igt_sysfs_set_boolean(int dir, const char *attr, bool value)
>> +{
>> +	igt_assert(__igt_sysfs_set_boolean(dir, attr, value));
>> +}
>> +
>>   static void bind_con(const char *name, bool enable)
>>   {
>>   	const char *path = "/sys/class/vtconsole";
>> @@ -797,8 +909,8 @@ static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
>>   
>>   	igt_debug("'%s': sweeping range of values\n", rw->attr);
>>   	while (set < UINT64_MAX / 2) {
>> -		ret = igt_sysfs_set_u64(rw->dir, rw->attr, set);
>> -		get = igt_sysfs_get_u64(rw->dir, rw->attr);
>> +		ret = __igt_sysfs_set_u64(rw->dir, rw->attr, set);
>> +		get = __igt_sysfs_get_u64(rw->dir, rw->attr);
>>   		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
>>   		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
>>   			igt_debug("'%s': matches\n", rw->attr);
>> @@ -842,7 +954,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
>>   	igt_assert(st.st_mode & 0222); /* writable */
>>   	igt_assert(rw->start);	/* cannot be 0 */
>>   
>> -	prev = igt_sysfs_get_u64(rw->dir, rw->attr);
>> +	prev = __igt_sysfs_get_u64(rw->dir, rw->attr);
>>   	igt_debug("'%s': prev %lu\n", rw->attr, prev);
>>   
>>   	ret = rw_attr_sweep(rw);
>> @@ -851,8 +963,8 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
>>   	 * Restore previous value: we don't assert before this point so
>>   	 * that we can restore the attr before asserting
>>   	 */
>> -	igt_assert_eq(1, igt_sysfs_set_u64(rw->dir, rw->attr, prev));
>> -	get = igt_sysfs_get_u64(rw->dir, rw->attr);
>> +	igt_assert_eq(1, __igt_sysfs_set_u64(rw->dir, rw->attr, prev));
>> +	get = __igt_sysfs_get_u64(rw->dir, rw->attr);
>>   	igt_assert_eq(get, prev);
>>   	igt_assert(!ret);
>>   }
>> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
>> index 978b6906e..118137d5e 100644
>> --- a/lib/igt_sysfs.h
>> +++ b/lib/igt_sysfs.h
>> @@ -62,10 +62,10 @@
>>   	igt_sysfs_printf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
>>   
>>   #define igt_sysfs_rps_get_u32(dir, id) \
>> -	igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id))
>> +	__igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id))
>>   
>>   #define igt_sysfs_rps_set_u32(dir, id, value) \
>> -	igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
>> +	__igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
>>   
>>   #define igt_sysfs_rps_get_boolean(dir, id) \
>>   	igt_sysfs_get_boolean(dir, igt_sysfs_dir_id_to_name(dir, id))
>> @@ -114,14 +114,20 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>   int igt_sysfs_printf(int dir, const char *attr, const char *fmt, ...)
>>   	__attribute__((format(printf,3,4)));
>>   
>> +uint32_t __igt_sysfs_get_u32(int dir, const char *attr);
>>   uint32_t igt_sysfs_get_u32(int dir, const char *attr);
>> -bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
>> +bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
>> +void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
>>   
>> +uint64_t __igt_sysfs_get_u64(int dir, const char *attr);
>>   uint64_t igt_sysfs_get_u64(int dir, const char *attr);
>> -bool igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
>> +bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
>> +void igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
>>   
>> +bool __igt_sysfs_get_boolean(int dir, const char *attr);
>>   bool igt_sysfs_get_boolean(int dir, const char *attr);
>> -bool igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>> +bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>> +void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>>   
>>   void bind_fbcon(bool enable);
>>   void kick_snd_hda_intel(void);
>> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
>> index 2bb07ba8b..734bcfa8b 100644
>> --- a/tests/i915/i915_pm_dc.c
>> +++ b/tests/i915/i915_pm_dc.c
>> @@ -534,7 +534,7 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
>>   
>>   	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>>   	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
>> -	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>> +	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>>   	close(sysfs_fd);
>>   	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
>>   		prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
>> @@ -629,7 +629,7 @@ static void kms_poll_state_restore(int sig)
>>   
>>   	sysfs_fd = open(KMS_HELPER, O_RDONLY);
>>   	if (sysfs_fd >= 0) {
>> -		igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
>> +		__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
>>   		close(sysfs_fd);
>>   	}
>>   }
>> diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
>> index d75ec3f9e..82a578f8e 100644
>> --- a/tests/i915/i915_pm_freq_mult.c
>> +++ b/tests/i915/i915_pm_freq_mult.c
>> @@ -57,11 +57,11 @@ static void restore_rps_defaults(int dir)
>>   	if (def < 0)
>>   		return;
>>   
>> -	max = igt_sysfs_get_u32(def, "rps_max_freq_mhz");
>> -	igt_sysfs_set_u32(dir, "rps_max_freq_mhz", max);
>> +	max = __igt_sysfs_get_u32(def, "rps_max_freq_mhz");
>> +	__igt_sysfs_set_u32(dir, "rps_max_freq_mhz", max);
>>   
>> -	min = igt_sysfs_get_u32(def, "rps_min_freq_mhz");
>> -	igt_sysfs_set_u32(dir, "rps_min_freq_mhz", min);
>> +	min = __igt_sysfs_get_u32(def, "rps_min_freq_mhz");
>> +	__igt_sysfs_set_u32(dir, "rps_min_freq_mhz", min);
>>   
>>   	close(def);
>>   }
>> @@ -81,17 +81,17 @@ static void setup_freq(int gt, int dir)
>>   	wait_freq_set();
>>   
>>   	/* Print some debug information */
>> -	rp0 = igt_sysfs_get_u32(dir, "rps_RP0_freq_mhz");
>> -	rp1 = igt_sysfs_get_u32(dir, "rps_RP1_freq_mhz");
>> -	rpn = igt_sysfs_get_u32(dir, "rps_RPn_freq_mhz");
>> -	min = igt_sysfs_get_u32(dir, "rps_min_freq_mhz");
>> -	max = igt_sysfs_get_u32(dir, "rps_max_freq_mhz");
>> -	act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
>> +	rp0 = __igt_sysfs_get_u32(dir, "rps_RP0_freq_mhz");
>> +	rp1 = __igt_sysfs_get_u32(dir, "rps_RP1_freq_mhz");
>> +	rpn = __igt_sysfs_get_u32(dir, "rps_RPn_freq_mhz");
>> +	min = __igt_sysfs_get_u32(dir, "rps_min_freq_mhz");
>> +	max = __igt_sysfs_get_u32(dir, "rps_max_freq_mhz");
>> +	act = __igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
>>   
>>   	igt_debug("RP0 MHz: %d, RP1 MHz: %d, RPn MHz: %d, min MHz: %d, max MHz: %d, act MHz: %d\n", rp0, rp1, rpn, min, max, act);
>>   
>>   	if (igt_sysfs_has_attr(dir, "media_freq_factor")) {
>> -		media = igt_sysfs_get_u32(dir, "media_freq_factor");
>> +		media = __igt_sysfs_get_u32(dir, "media_freq_factor");
>>   		igt_debug("media ratio: %.2f\n", media * FREQ_SCALE_FACTOR);
>>   	}
>>   }
>> @@ -117,8 +117,8 @@ static void media_freq(int gt, int dir)
>>   	setup_freq(gt, dir);
>>   
>>   	igt_debug("media RP0 mhz: %d, media RPn mhz: %d\n",
>> -		  igt_sysfs_get_u32(dir, "media_RP0_freq_mhz"),
>> -		  igt_sysfs_get_u32(dir, "media_RPn_freq_mhz"));
>> +		  __igt_sysfs_get_u32(dir, "media_RP0_freq_mhz"),
>> +		  __igt_sysfs_get_u32(dir, "media_RPn_freq_mhz"));
>>   	igt_debug("media ratio value 0.0 represents dynamic mode\n");
>>   
>>   	/*
>> @@ -141,7 +141,7 @@ static void media_freq(int gt, int dir)
>>   
>>   		wait_freq_set();
>>   
>> -		getv = igt_sysfs_get_u32(dir, "media_freq_factor");
>> +		getv = __igt_sysfs_get_u32(dir, "media_freq_factor");
>>   
>>   		igt_debug("media ratio set: %.2f, media ratio get: %.2f\n",
>>   			  v * scale, getv * scale);
>> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
>> index eaacc7c90..5ae91ffd2 100644
>> --- a/tests/i915/i915_pm_rps.c
>> +++ b/tests/i915/i915_pm_rps.c
>> @@ -742,8 +742,8 @@ static void fence_order(int i915)
>>   	 */
>>   
>>   	sysfs = igt_sysfs_open(i915);
>> -	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
>> -	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
>> +	min = __igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
>> +	max = __igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
>>   	igt_require(max > min);
>>   
>>   	/* Only allow ourselves to upclock via waitboosting */
>> @@ -862,8 +862,8 @@ static void engine_order(int i915)
>>   	execbuf.rsvd1 = ctx->id;
>>   
>>   	sysfs = igt_sysfs_open(i915);
>> -	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
>> -	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
>> +	min = __igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
>> +	max = __igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
>>   	igt_require(max > min);
>>   
>>   	/* Only allow ourselves to upclock via waitboosting */
>> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
>> index 3675b9d6d..86b0fd08c 100644
>> --- a/tests/i915/i915_power.c
>> +++ b/tests/i915/i915_power.c
>> @@ -58,8 +58,8 @@ static void sanity(int i915)
>>   	igt_spin_busywait_until_started(spin);
>>   	busy = measure_power(&pwr, DURATION_SEC);
>>   	i915_for_each_gt(i915, dir, gt) {
>> -		req = igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
>> -		act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
>> +		req = __igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
>> +		act = __igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
>>   		igt_info("gt %d: req MHz: %d, act MHz: %d\n", gt, req, act);
>>   	}
>>   	igt_free_spins(i915);
>> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>> index 8b31df7b2..1a5595d67 100644
>> --- a/tests/i915/perf_pmu.c
>> +++ b/tests/i915/perf_pmu.c
>> @@ -1793,9 +1793,9 @@ test_frequency(int gem_fd, unsigned int gt)
>>   	sysfs = igt_sysfs_gt_open(gem_fd, gt);
>>   	igt_require(sysfs >= 0);
>>   
>> -	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
>> -	max_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
>> -	boost_freq = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
>> +	min_freq = __igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
>> +	max_freq = __igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
>> +	boost_freq = __igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
>>   	igt_info("Frequency: min=%u, max=%u, boost=%u MHz\n",
>>   		 min_freq, max_freq, boost_freq);
>>   	igt_require(min_freq > 0 && max_freq > 0 && boost_freq > 0);
>> @@ -1808,12 +1808,12 @@ test_frequency(int gem_fd, unsigned int gt)
>>   	/*
>>   	 * Set GPU to min frequency and read PMU counters.
>>   	 */
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == min_freq);
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", min_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == min_freq);
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", min_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == min_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == min_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", min_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == min_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", min_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == min_freq);
>>   
>>   	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
>>   	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
>> @@ -1834,13 +1834,13 @@ test_frequency(int gem_fd, unsigned int gt)
>>   	/*
>>   	 * Set GPU to max frequency and read PMU counters.
>>   	 */
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", max_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == max_freq);
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", boost_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == boost_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", max_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == max_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", boost_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == boost_freq);
>>   
>> -	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", max_freq));
>> -	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == max_freq);
>> +	igt_require(__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", max_freq));
>> +	igt_require(__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == max_freq);
>>   
>>   	gem_quiescent_gpu(gem_fd);
>>   	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
>> @@ -1859,10 +1859,10 @@ test_frequency(int gem_fd, unsigned int gt)
>>   	/*
>>   	 * Restore min/max.
>>   	 */
>> -	igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
>> -	if (igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") != min_freq)
>> +	__igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
>> +	if (__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") != min_freq)
>>   		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
>> -			 min_freq, igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz"));
>> +			 min_freq, __igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz"));
>>   	close(fd[0]);
>>   	close(fd[1]);
>>   	put_ahnd(ahnd);
>> @@ -1891,7 +1891,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
>>   	sysfs = igt_sysfs_gt_open(gem_fd, gt);
>>   	igt_require(sysfs >= 0);
>>   
>> -	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
>> +	min_freq = __igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
>>   	close(sysfs);
>>   
>>   	/* While parked, our convention is to report the GPU at 0Hz */
>> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>> index dd5ab993e..98ed30f12 100644
>> --- a/tests/kms_prime.c
>> +++ b/tests/kms_prime.c
>> @@ -341,7 +341,7 @@ static void kms_poll_state_restore(void)
>>   	int sysfs_fd;
>>   
>>   	igt_assert((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>> -	igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
>> +	__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
>>   	close(sysfs_fd);
>>   
>>   }
>> @@ -352,7 +352,7 @@ static void kms_poll_disable(void)
>>   
>>   	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>>   	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
>> -	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>> +	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>>   	kms_poll_disabled = true;
>>   	close(sysfs_fd);
>>   }
>> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
>> index 785d39bde..b78a53653 100644
>> --- a/tests/nouveau_crc.c
>> +++ b/tests/nouveau_crc.c
>> @@ -269,10 +269,10 @@ static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
>>   
>>   	set_crc_flip_threshold(data, 5);
>>   	igt_pipe_crc_start(pipe_crc);
>> -	igt_assert_eq(igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
>> +	igt_assert_eq(__igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
>>   	igt_pipe_crc_stop(pipe_crc);
>>   
>> -	igt_assert_neq(igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
>> +	igt_assert_neq(__igt_sysfs_get_u32(data->nv_crc_dir, "flip_threshold"), 5);
>>   	igt_pipe_crc_free(pipe_crc);
>>   }
>>   
>> -- 
>> 2.40.0
>>
