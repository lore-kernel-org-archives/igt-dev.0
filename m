Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442110E4A7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 11:14:32 +0000 (UTC)
Message-ID: <79df58ca-1e4e-e86b-af75-799d7e81df73@intel.com>
Date: Wed, 26 Oct 2022 16:44:06 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, Alex Hung <alex.hung@amd.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20221026021615.2445018-1-alex.hung@amd.com>
 <Y1jo6avSqRrAU7rY@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <Y1jo6avSqRrAU7rY@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Check DP connection
 only before tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed-26-10-2022 01:29 pm, Petri Latvala wrote:
> On Tue, Oct 25, 2022 at 08:16:15PM -0600, Alex Hung wrote:
>> Without DP port connected, kernel reports "Too many retries"
>> that indicates no sink to respond. This is the same across GPUs.
>>
>> amdgpu ... DM aux hw bus 2: Too many retries, giving up. First error: -5
>> i915 ... AUX C/DDI C/PHY C: Too many retries, giving up. First error: -110
>>
>> In addition, the test can result time out such as below:
>>
>> /dev/drm_dp_aux0: Connection timed out
>> /dev/drm_dp_aux1: Connection timed out

These timeouts are already handled in this test: 
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_dp_aux_dev.c#n88

IMO, It could be fine with existing test, since it'll work as a kind of 
negative scenario.

- Bhanu

>>
>> As a result, checking DP connection alone should be sufficient.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_dp_aux_dev.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
>> index ed9dd510..7fce74a4 100644
>> --- a/tests/kms_dp_aux_dev.c
>> +++ b/tests/kms_dp_aux_dev.c
>> @@ -53,8 +53,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>>   	drmModeFreeConnector(connector);
>>   	igt_assert(dir_fd >= 0);
>>   
>> -	if (connector->connection != DRM_MODE_CONNECTED &&
>> -	    is_mst_connector(drm_fd, connector_id)) {
>> +	if (connector->connection != DRM_MODE_CONNECTED) {
>>   		close(dir_fd);
>>   		return false;
>>   	}
> 
> 
> Bhanuprakash, Swati, you wrote/reviewed this piece of code, please review
> this patch.
> 
> 
