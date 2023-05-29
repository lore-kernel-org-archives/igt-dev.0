Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA64A10E2C3
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 14:40:28 +0000 (UTC)
Message-ID: <bb4775e0-dad8-5036-734b-87817a77cea2@intel.com>
Date: Mon, 29 May 2023 20:10:24 +0530
MIME-Version: 1.0
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20230526064520.310041-1-swati2.sharma@intel.com>
 <20230526064520.310041-3-swati2.sharma@intel.com>
 <2c6f4996-8548-2abd-eb19-3f4e4c07526b@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <2c6f4996-8548-2abd-eb19-3f4e4c07526b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_display_modes: reduce
 exec. time for sim env
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

Thanks for the review. Pushed!

On 29-May-23 6:00 PM, Juha-Pekka Heikkila wrote:
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> On 26.5.2023 9.45, Swati Sharma wrote:
>> For simulation environment, we can reduce execution time
>> by running test only on one valid output on pipe.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_display_modes.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
>> index d69c7b93..b963c609 100644
>> --- a/tests/kms_display_modes.c
>> +++ b/tests/kms_display_modes.c
>> @@ -169,6 +169,12 @@ static void run_extendedmode_test(data_t *data) {
>>                                   pipe2, output2);
>>                   }
>>               }
>> +            /*
>> +             * For simulation env, no need to run
>> +             * test with each valid output on pipe.
>> +             */
>> +            if (igt_run_in_simulation())
>> +                break;
>>           }
>>       }
>>   }
> 
