Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FA110E038
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Dec 2022 05:02:28 +0000 (UTC)
Message-ID: <92b0ccec-3104-be7a-2ca8-e30a3b5c93d7@intel.com>
Date: Thu, 29 Dec 2022 10:32:04 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-45-bhanuprakash.modem@intel.com>
 <a4baa256-ef64-58eb-659e-93a3a24027b2@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <a4baa256-ef64-58eb-659e-93a3a24027b2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 44/52] tests/i915/kms_flip_scaled_crc: Add
 support for Bigjoiner
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

On Thu-29-12-2022 12:13 am, Swati Sharma wrote:
> 
> 
> On 15-Nov-22 10:38 PM, Bhanuprakash Modem wrote:
>> This patch will add a check to Skip the subtest if a selected pipe/output
>> combo won't support Bigjoiner or 8K mode.
>>
>> Example:
>> * Pipe-D wont support a mode > 5K
>> * To use 8K mode on a pipe then consecutive pipe must be available & 
>> free.
>>
>> V2: - Use updated helper name
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/i915/kms_flip_scaled_crc.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/kms_flip_scaled_crc.c 
>> b/tests/i915/kms_flip_scaled_crc.c
>> index 10465ca7..1b497dcc 100644
>> --- a/tests/i915/kms_flip_scaled_crc.c
>> +++ b/tests/i915/kms_flip_scaled_crc.c
>> @@ -648,8 +648,13 @@ igt_main
>>               for_each_pipe(&data.display, pipe) {
>>                   bool found = false;
>>                   for_each_valid_output_on_pipe(&data.display, pipe, 
>> output) {
>> +                    igt_display_reset(&data.display);
>> +
>>                       modetoset = find_mode(&data, output);
>> -                    if (modetoset) {
>> +                    igt_output_set_pipe(output, pipe);
>> +                    igt_output_override_mode(output, modetoset);
>why we have to override mode here?

Without override, i915_pipe_output_combo_valid() will check the validity 
of (pipe, output, default_mode) but run_tests() is supposed to run with 
(pipe, output, override_mode).

Example:
Consider the 8K panel, with 4k mode as default. (pipe-D + output + 
4K_mode) is valid for i915_pipe_output_combo_valid(). But run_test() 
will try with (pipe-D + output + 8K_mode) which is invalid.

So we must check the validity of the combo which is expected to run.

>> +
>> +                    if (modetoset && 
>> i915_pipe_output_combo_valid(&data.display)) {
>>                           found = true;
>>                           igt_dynamic_f("pipe-%s-valid-mode", 
>> kmstest_pipe_name(pipe))
>>                               run_tests(&data, index, pipe, output, 
>> modetoset);
>> @@ -658,6 +663,12 @@ igt_main
>>                   }
>>                   if (!found) {
>>                       for_each_valid_output_on_pipe(&data.display, 
>> pipe, output) {
>> +                        igt_display_reset(&data.display);
>> +
>> +                        igt_output_set_pipe(output, pipe);
>> +                        if 
>> (!i915_pipe_output_combo_valid(&data.display))
>> +                            continue;
>> +

Just realized, we need to update the "modetoset" with NULL, since it 
becomes dangling due to the igt_display_reset().

Will float a new rev to fix this.

- Bhanu

>>                           igt_dynamic_f("pipe-%s-default-mode", 
>> kmstest_pipe_name(pipe))
>>                               run_tests(&data, index, pipe, output, 
>> modetoset);
>>                       }
> 
