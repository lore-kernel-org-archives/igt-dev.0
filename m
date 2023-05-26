Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42E410E0EF
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 07:13:04 +0000 (UTC)
Message-ID: <90f3f637-b85d-b9bb-c8b9-ac3a884f7a7f@intel.com>
Date: Fri, 26 May 2023 12:42:43 +0530
MIME-Version: 1.0
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20230516115656.229418-1-swati2.sharma@intel.com>
 <b8e66d62-55a1-75ef-64f3-638ee9088936@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <b8e66d62-55a1-75ef-64f3-638ee9088936@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: enable test for sim env
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

Thanks for the review. Patch merged.

On 25-May-23 7:54 PM, Juha-Pekka Heikkila wrote:
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> On 16.5.2023 14.56, Swati Sharma wrote:
>> Lets do some tweaks to enable this test on simulation
>> environment.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 10e16b63..90b68a47 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -41,7 +41,8 @@
>>   #define LUT_MASK 0xf800
>>   /* restricted pipe count */
>> -#define CRTC_RESTRICT_CNT 2
>> +#define CRTC_RESTRICT_CNT    2
>> +#define SIM_CRTC_RESTRICT_CNT    1
>>   typedef struct {
>>       float red;
>> @@ -614,7 +615,7 @@ static void capture_crc(data_t *data, unsigned int 
>> vblank, igt_crc_t *crc)
>>   {
>>       igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, 
>> crc);
>> -    igt_fail_on_f(!igt_skip_crc_compare &&
>> +    igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
>>                 crc->has_valid_frame && crc->frame != vblank,
>>                 "Got CRC for the wrong frame (got %u, expected %u). 
>> CRC buffer overflow?\n",
>>                 crc->frame, vblank);
>> @@ -1193,8 +1194,12 @@ static void test_invalid_settings(data_t *data)
>>       }
>>   }
>> -static bool is_pipe_limit_reached(int count) {
>> -    return count >= CRTC_RESTRICT_CNT && !all_pipes;
>> +static bool is_pipe_limit_reached(int count)
>> +{
>> +    if (igt_run_in_simulation())
>> +        return count >= SIM_CRTC_RESTRICT_CNT && !all_pipes;
>> +    else
>> +        return count >= CRTC_RESTRICT_CNT && !all_pipes;
>>   }
>>   static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
> 
