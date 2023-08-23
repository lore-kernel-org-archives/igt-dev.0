Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186E210E2C4
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 06:38:20 +0000 (UTC)
Message-ID: <c15749c4-03f2-dffe-3c0a-6a3458863ddd@intel.com>
Date: Wed, 23 Aug 2023 12:07:52 +0530
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "Thasleem,
 Mohammed" <mohammed.thasleem@intel.com>
References: <20230707153720.1478-1-mohammed.thasleem@intel.com>
 <ZN8vfGObzmdK5EKb@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ZN8vfGObzmdK5EKb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Skip the
 negative test on MST Hub
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On Fri-18-08-2023 02:14 pm, Lisovskiy, Stanislav wrote:
> On Fri, Jul 07, 2023 at 09:07:20PM +0530, Thasleem, Mohammed wrote:
>> Skip the test on which MST hub which support bandwidth for 2k-4k
>> and 4k-4k multi displays.
>>
>> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> 
> Okay I missed the MST check in the begining of the main function, so
> 
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> 
>> ---
>>   tests/kms_display_modes.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
>> index 4bebb25e..8e117695 100644
>> --- a/tests/kms_display_modes.c
>> +++ b/tests/kms_display_modes.c
>> @@ -310,6 +310,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>>   
>>   	igt_require(i915_pipe_output_combo_valid(display));
>>   	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>> +	igt_skip_on_f(ret == 0, "MST Hub supports bandwidth on multi display\n");

NACK

Failure reason can be anything, you need to check for the precise error 
code.

- Bhanu

>>   	igt_assert(ret != 0 && errno == ENOSPC);
>>   }
>>   
>> -- 
>> 2.34.1
>>
