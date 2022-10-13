Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E672310E15C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:45:45 +0000 (UTC)
Message-ID: <32f531ea-ed93-c8de-985f-67390e8bfd0d@amd.com>
Date: Thu, 13 Oct 2022 11:45:41 -0400
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20221012200133.3161321-1-aurabindo.pillai@amd.com>
 <bc063817-7541-4ff7-3ac4-085f57f34a2d@gmail.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <bc063817-7541-4ff7-3ac4-085f57f34a2d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] test/kms_plane_cursor: Honour max
 cursor size
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



On 2022-10-13 11:37, Juha-Pekka Heikkila wrote:
> Hi Aurabindo,
> 
> On 12.10.2022 23.01, Aurabindo Pillai wrote:
>> Skip the tests for cursor sizes that are not supported by the hardware
>>
>> Changes in v2
>> =============
>>
>> * Remove the duplicate definitions for DRM cursor width capability
>> * Check for both cursor width and height when verifying the test 
>> cursor size
>>
>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> ---
>>   tests/kms_plane_cursor.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
>> index 43bcaaa4..37fc026c 100644
>> --- a/tests/kms_plane_cursor.c
>> +++ b/tests/kms_plane_cursor.c
>> @@ -30,6 +30,8 @@
>>    * - DRM index indicates z-ordering, higher index = higher z-order
>>    */
>> +static uint64_t max_curw = 64, max_curh = 64;
> I think these would look better as part of data_t structure since all 
> other 'globals' are there.
> 
>> +
>>   enum {
>>       TEST_PRIMARY = 0,
>>       TEST_OVERLAY = 1 << 0,
>> @@ -222,6 +224,8 @@ static void test_cursor(data_t *data, int size, 
>> unsigned int flags)
>>       int sw, sh;
>>       int pad = 128;
>> +    igt_skip_on((size > max_curw) || (size > max_curh));
>> +
>>       sw = data->mode->hdisplay;
>>       sh = data->mode->vdisplay;
>> @@ -270,8 +274,16 @@ igt_main
>>       };
>>       igt_fixture {
>> +        int ret;
>> +
>>           data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +        ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
>> +        igt_assert(ret == 0 || errno == EINVAL);
>> +        /* Not making use of cursor_height since it is same as width, 
>> still reading */
> What does this comment mean? I see you using cursor height in 
> test_cursor function.
> 
Hi Juha-Pekka

Sorry, that was a leftover comment from v1. If there isnt any other 
concerns, I can merge it with the comment removed.
