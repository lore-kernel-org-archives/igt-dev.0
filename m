Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6F910E439
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 08:19:56 +0000 (UTC)
Message-ID: <6c5ea40f-e29c-8a21-9c77-75e92fd07dc1@intel.com>
Date: Fri, 17 Feb 2023 13:49:49 +0530
MIME-Version: 1.0
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20230215165947.15421-1-swati2.sharma@intel.com>
 <20230215165947.15421-2-swati2.sharma@intel.com>
 <733cee66-81e3-1d13-72c3-b691db892798@gmail.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <733cee66-81e3-1d13-72c3-b691db892798@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_plane_scaling: Prep work
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


On 16-Feb-23 9:00 PM, Juha-Pekka Heikkila wrote:
> On 15.2.2023 18.59, Swati Sharma wrote:
>> struct can be reused to add more test cases.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 4a04f42a0..382d199e0 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -42,6 +42,15 @@ typedef struct {
>>       bool extended;
>>   } data_t;
>> +struct invalid_paramtests {
>> +    const char *testname;
>> +    uint32_t planesize[2];
>> +    struct {
>> +        enum igt_atomic_plane_properties prop;
>> +        uint32_t value;
>> +    } params[8];
>> +};
>> +
>>   const struct {
>>       const char * const describe;
>>       const char * const name;
>> @@ -827,14 +836,7 @@ static void invalid_parameter_tests(data_t *d)
>>       igt_plane_t *plane;
>>       int rval;
>> -    const struct {
>> -        const char *testname;
>> -        uint32_t planesize[2];
>> -        struct {
>> -            enum igt_atomic_plane_properties prop;
>> -            uint32_t value;
>> -        } params[8];
>> -    } paramtests[] = {
>> +    static const struct invalid_paramtests paramtests[2] = {
> 
> "static const struct invalid_paramtests paramtests[]" would be better 
> here, ie. not declaring here how long is the list of tests

Done. Added new series with the fixes 
https://patchwork.freedesktop.org/series/114059/
> 
>>           {
>>               .testname = "less-than-1-height-src",
>>               .planesize = {256, 8},
> 

-- 
~Swati Sharma
