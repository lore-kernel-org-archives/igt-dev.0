Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0BC9C94
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 13:57:17 +0000 (UTC)
Message-ID: <c445849e-4238-5675-6174-f4bca67ebf36@intel.com>
Date: Mon, 15 Aug 2022 19:26:57 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
 <20220814180908.2553394-2-bhanuprakash.modem@intel.com>
 <YvoWwFdTQMmzoBSk@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YvoWwFdTQMmzoBSk@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 01/51] lib/igt_kms: Add a helper for igt test
 constraint
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

On Mon-15-08-2022 03:19 pm, Petri Latvala wrote:
> On Sun, Aug 14, 2022 at 11:38:18PM +0530, Bhanuprakash Modem wrote:
>> This patch will create a helper with super set of all test constraints.
>>
>> Example:
>> * Pipe-D can't support mode > 5K
>> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>> * MSO is supported only on PIPE_A/PIPE_B.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 22 ++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 1ba3bd2a..e1a65244 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5803,3 +5803,25 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
>>   
>>   	return true;
>>   }
>> +
>> +/*
>> + * igt_test_constraint:
>> + * @display: a pointer to an #igt_display_t structure
>> + *
>> + * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
>> + * and check those pipes supports the selected mode(s).
>> + *
>> + * This is a super set of all test constraints.
>> + *
>> + * Example:
>> + *  * Pipe-D can't support mode > 5K
>> + *  * To use 8K mode on a pipe then consecutive pipe must be free.
>> + *  * MSO is supported only on PIPE_A/PIPE_B.
>> + *
>> + * Returns: true if a valid crtc/connector mode combo found, else false
> 
> "all test constraints" sounds very broad, with very implied
> specifics. Please write the specifics so potential users can easily
> see if they need to call this function or not. Is this meant to be for
> all kms testing, or just for bigjoiner-related hardware limitations?

Our intention is that all kms tests should use this helper to decide 
whether to run/skip the subtest. But for now, I can see that only 
hardware/configuration-related limitations like Bigjoiner/MSO can go 
through this helper.

> 
> Speaking of hardware limitations, this sounds very intel-specific but
> the documentation (or the code) doesn't specify. Same comment goes for
> the function igt_check_bigjoiner_support, even though that's already
> merged.

Agreed, we need a check for i915 device as above mentioned limitations 
are intel-specific.

- Bhanu

> 
> 
