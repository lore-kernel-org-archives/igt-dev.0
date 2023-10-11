Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36210E646
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 10:07:46 +0000 (UTC)
Message-ID: <bcbb5871-53a6-8ddb-1c18-86c7624a6927@intel.com>
Date: Wed, 11 Oct 2023 15:37:19 +0530
Content-Language: en-US
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230914080329.16648-1-stanislav.lisovskiy@intel.com>
 <344efd54-9002-dce5-2ad2-b60706a6763e@intel.com> <ZRPvX5Nyf1311cRY@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ZRPvX5Nyf1311cRY@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/intel/i915_pipe_stress: Use only first
 pipe if Bigjoiner is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Wed-27-09-2023 02:31 pm, Lisovskiy, Stanislav wrote:
> On Thu, Sep 14, 2023 at 07:13:39PM +0530, Modem, Bhanuprakash wrote:
>> Hi Stan,
>>
>> On Thu-14-09-2023 01:33 pm, Stanislav Lisovskiy wrote:
>>> We currently are having test failures for Bigjoiner, because that
>>> test tries to use all pipes simultaneously, not realizing that
>>> if we use a Bigjoiner mode on pipe A, the adjacent pipe won't be
>>> available.
>>> For now just fix it by using only one pipe, if resolution > 3840
>>> is detected.
>>>
>>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>> ---
>>>    tests/intel/i915_pipe_stress.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
>>> index 3cd84d027f..a050fa0117 100644
>>> --- a/tests/intel/i915_pipe_stress.c
>>> +++ b/tests/intel/i915_pipe_stress.c
>>> @@ -590,6 +590,12 @@ static void stress_pipes(struct data *data, struct timespec *start,
>>>    		igt_pipe_crc_stop(data->pipe_crc[pipe]);
>>>    		igt_assert_crc_equal(&crc, &crc2);
>>> +		/*
>>> +		 * Do not try to use other pipes, if Bigjoiner is used
>>> +		 */
>>> +		if (data->highest_mode[pipe]->hdisplay > 3840)
>>> +			break;
>>
>> I think, you can use "igt_check_bigjoiner_support()" to know the selected
>> pipe can drive the Bigjoiner or not.
>>
>> - Bhanu
> 
> Yep, would be nicer of course to use some helper function here, but I guess
> the one above just checks if bigjoiner is supported at all, while here we really
> need to check if we are actually using it.
> As I understand being able to support Bigjoiner doesn't always mean it is used at
> the moment.

Correct, we can't use igt_check_bigjoiner_support() here.

But instead of checking for hdisplay > 3840, probably we can try with 
igt_bigjoiner_possible()

-     if (data->highest_mode[pipe]->hdisplay > 3840)
+     if (igt_bigjoiner_possible(data->highest_mode[pipe],
+              igt_get_max_dotclock(data->display.drm_fd)))
            break;

Thanks,
Bhanu

> 
> Stan
> 
>>
>>> +
>>>    		++pipe;
>>>    	}
>>>    }
