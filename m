Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0F410E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 14:55:29 +0000 (UTC)
Message-ID: <8bc2e82c-2b08-59c2-3e11-7ca72b542dcd@intel.com>
Date: Tue, 27 Dec 2022 20:25:11 +0530
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-12-bhanuprakash.modem@intel.com>
 <c04a1f95-706e-3d6c-b4f6-81397c454777@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <c04a1f95-706e-3d6c-b4f6-81397c454777@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 11/52] tests/kms_content_protection: Add
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

On Tue-27-12-2022 12:06 pm, Karthik B S wrote:
> 
> On 11/15/2022 10:38 PM, Bhanuprakash Modem wrote:
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
>>   tests/kms_content_protection.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/tests/kms_content_protection.c 
>> b/tests/kms_content_protection.c
>> index aa28b7bf..0aa2a8a2 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -502,6 +502,13 @@ test_content_protection(enum igt_commit_style s, 
>> int content_type)
>>                   continue;
>>               igt_display_reset(display);
>> +
>> +            igt_output_set_pipe(output, pipe);
>> +            if (!i915_pipe_output_combo_valid(display)) {
>> +                igt_output_set_pipe(output, PIPE_NONE);
>> +                continue;
>> +            }
>> +
>>               modeset_with_fb(pipe, output, s);
>>               if (!output_hdcp_capable(output, content_type))
>> @@ -623,6 +630,14 @@ test_content_protection_mst(int content_type)
>>           igt_assert_f(pipe_found, "No valid pipe found for %s\n", 
>> output->name);
>>           igt_output_set_pipe(output, pipe);
>> +        if (!i915_pipe_output_combo_valid(display)){
>> +            igt_output_set_pipe(output, PIPE_NONE);
>> +            continue;
>> +        }
> 
> Hi,
> 
> Can this check be moved into the previous loop for finding pipe? So that 
> even if a combo is invalid we still try with the next pipe. With current 
> logic the an output will skip if this check fails.

Just realized, this entire change is not required as it is already 
covered by:
igt_override_all_active_output_modes_to_fit_bw()

- Bhanu

> 
>> +
>> +        igt_info("Using (pipe %s + %s) to run the subtest.\n",
>> +             kmstest_pipe_name(pipe), igt_output_name(output));
>> +
> 
> Please remove this as in mst case 2 or more displays are used in the 
> subtest.
> 
> This info could be even updated to be more specific, but I would prefer 
> that to be done in a separate clean up patch.
> 
> Thanks,
> Karthik.B.S
>>           prepare_modeset_on_mst_output(output);
>>           mst_output[dp_mst_outputs++] = output;
>>       }
