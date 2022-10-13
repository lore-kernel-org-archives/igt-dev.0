Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86F910E291
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:46:31 +0000 (UTC)
Message-ID: <aca1cd0f-fd02-0057-bb91-83f8c1ef7e1b@amd.com>
Date: Thu, 13 Oct 2022 11:46:27 -0400
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
Sure, will make a v3. Thanks for the review
