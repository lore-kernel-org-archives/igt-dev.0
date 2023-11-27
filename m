Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E4710E264
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 13:02:07 +0000 (UTC)
Message-ID: <c9c246c7-baa3-4039-814a-01454e00e0b3@intel.com>
Date: Mon, 27 Nov 2023 18:31:46 +0530
Content-Language: en-US
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231121075451.2012768-1-bhanuprakash.modem@intel.com>
 <eae351a7-b2d3-44e9-9190-61295667c85f@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <eae351a7-b2d3-44e9-9190-61295667c85f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/2] tests/kms_feature_discovery: Fix display
 subtest
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

Hi Swati,

On 23-11-2023 11:49 am, Sharma, Swati2 wrote:
> Hi Bhanu,
> 
> With this change, test is passing on atsm
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10248/bat-atsm-1/igt@kms_feature_discovery@display.html

drmModeGetResources() is expected to return 0 on display supported 
platforms and -EOPNOTSUPP error in case of non-display platforms.

Hence it is expected PASS. Test will fail if we get any return value 
other than 0 & EOPNOTSUPP.

- Bhanu

> 
> 
> On 21-Nov-23 1:24 PM, Bhanuprakash Modem wrote:
>> Instead of doing nothing, check the connected platform really
>> supports the display or not.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/kms_feature_discovery.c 
>> b/tests/kms_feature_discovery.c
>> index 428f97ffe..81064aa0e 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -30,8 +30,7 @@
>>    *        anything else means we have a serious problem.
>>    *
>>    * SUBTEST: display
>> - * Description: Make sure that we have display support with
>> - *         some outputs connected.
>> + * Description: Make sure that we have display support.
>>    * Driver requirement: i915, xe
>>    * Functionality: feature_discovery
>>    * Mega feature: General Display Features
>> @@ -97,18 +96,25 @@ igt_main {
>>       igt_fixture {
>>           fd = drm_open_driver_master(DRIVER_ANY);
>>           debugfs_fd = igt_debugfs_dir(fd);
>> +
>> +        errno = 0;
>>       }
>>       igt_subtest_group {
>> -        igt_fixture {
>> -            igt_display_require(&display, fd);
>> -        }
>> -
>> -        igt_describe("Make sure that we have display support with 
>> some outputs connected.");
>> +        igt_describe("Make sure that we have display support.");
>>           igt_subtest("display") {
>> -            /* will skip because of the fixture */
>> +            drmModeResPtr resources = drmModeGetResources(fd);
>> +
>> +            /* Operation not supported on non-display platforms. */
>> +            if (!resources)
>> +                igt_assert_eq(errno, EOPNOTSUPP);
>> +
>> +            drmModeFreeResources(resources);
>>           }
>> +        igt_fixture
>> +            igt_display_require(&display, fd);
>> +
>>           igt_subtest_group {
>>               volatile int output_count = 0;
>>               igt_output_t *output;
