Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77C10EC4F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 09:39:29 +0000 (UTC)
Message-ID: <787f85ec-3e54-2dba-f312-f2e918c496a5@intel.com>
Date: Fri, 9 Sep 2022 15:09:10 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220906095030.486152-1-bhanuprakash.modem@intel.com>
 <20220906095030.486152-2-bhanuprakash.modem@intel.com>
 <YxoIZO6+xEfeQJ5A@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YxoIZO6+xEfeQJ5A@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 01/52] lib/igt_kms: Add a helper for igt
 test constraint
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

On Thu-08-09-2022 08:51 pm, Petri Latvala wrote:
> On Tue, Sep 06, 2022 at 03:19:39PM +0530, Bhanuprakash Modem wrote:
>> Add an IGT helper to check the test constraints to decide whether to run/skip
>> the subtest.
>>
>> Example:
>> * Pipe-D can't support mode > 5K
>> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>> * MSO is supported only on PIPE_A/PIPE_B.
>>
>> This helper is supposed to be a superset of all test constraints. But as of
>> now, only Intel specific hardware/configuration-related limitations like
>> Bigjoiner/MSO can go through this helper.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 7d4916a7..3a1bc391 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5824,3 +5824,42 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
>>   
>>   	return true;
>>   }
>> +
>> +/*
>> + * igt_test_constraint:
>> + * @display: a pointer to an #igt_display_t structure
>> + *
>> + * Every individual test must use igt_output_set_pipe() before calling this
>> + * helper, so that this function will get all active pipes from connected
>> + * outputs (i.e. pending_pipe != PIPE_NONE) and check the selected combo is
>> + * valid or not.
>> + *
>> + * This helper is supposed to be a superset of all test constraints.
>> + *
>> + * Example:
>> + *  * Pipe-D can't support mode > 5K
>> + *  * To use 8K mode on a pipe then consecutive pipe must be free.
>> + *  * MSO is supported only on PIPE_A/PIPE_B.
>> + *
>> + * Returns: true if a valid crtc/connector mode combo found, else false
>> + */
>> +bool igt_test_constraint(igt_display_t *display)
>> +{
>> +	bool result = true;
>> +
>> +	/*
>> +	 * TODO: Add all possible test constraints here.
>> +	 *
>> +	 * Intention of this helper is that all kms tests should use this
>> +	 * helper to decide whether to run/skip the subtest.
>> +	 *
>> +	 * As of now, only Intel specific hardware/configuration-related
>> +	 * limitations like Bigjoiner/MSO are going through this helper.
>> +	 *
>> +	 * Please update this helper as per the requirement.
>> +	 */
>> +	if (is_i915_device(display->drm_fd))
>> +		result &= igt_check_bigjoiner_support(display);
>> +
>> +	return result;
>> +}
> 
> 
>  From what I understand from this currently very barebones snippet: The
> only inputs it can work on are what's on the passed display struct,
> the caller having selected pipe(s) and output(s) beforehand, before
> commiting the modeset. The function tries to determine without
> commiting whether that's a valid pipe/output combo selection.
> 
> The required pre-condition (igt_output_set_pipe called) is documented,
> excellent. Maybe also check that it is done, and internal_assert it.

Will do that.

> 
> That said, "igt_test_constraint" sounds way more generic than what the
> function really is. We can also drop the "As of now" part and straight
> up make it an i915-specific function for now, with "i915" in the
> name. Along with "kms". Dropping the "test" from the name makes it
> clear _what_ it does after testing (as in, return a bool or
> igt_require).
> 
> i915_pipe_output_combo_capable() ?

How about i915_pipe_output_combo_valid() ? I think "Capable" is limited 
to a particular feature.

> i915_kms_display_pipe_setup_good() ?
> i915_kms_pipe_constraints_met() ?
> 
> Naming is hard...
> 
> Also worth considering the usual bool vs. igt_require pair of functions:

I don't see it being very useful to have a require_* version of this 
helper, because if the selected combo is invalid then the user has to 
try for another combo.

So, each individual test must call this helper for every possible combo 
and should handle the case where all possible combos are invalid.

- Bhanu

> 
> bool __igt_something() {
>    return true;
> }
> 
> void igt_require_something() {
>    igt_require(__igt_something());
> }
> 
> Drive-by round of thoughts, not a full review.
> 
> 
