Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7D710E352
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 01:12:52 +0000 (UTC)
Message-ID: <cf999c8e-0c47-e52c-afa0-897edb962c06@intel.com>
Date: Thu, 27 Oct 2022 06:42:00 +0530
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, Petri Latvala <petri.latvala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20221026021615.2445018-1-alex.hung@amd.com>
 <Y1jo6avSqRrAU7rY@platvala-desk.ger.corp.intel.com>
 <79df58ca-1e4e-e86b-af75-799d7e81df73@intel.com>
 <1c4a2175-eab7-a0c3-6df2-75d2b1445358@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <1c4a2175-eab7-a0c3-6df2-75d2b1445358@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

On Wed-26-10-2022 08:37 pm, Alex Hung wrote:
> 
> 
> On 2022-10-26 05:14, Modem, Bhanuprakash wrote:
>> On Wed-26-10-2022 01:29 pm, Petri Latvala wrote:
>>> On Tue, Oct 25, 2022 at 08:16:15PM -0600, Alex Hung wrote:
>>>> Without DP port connected, kernel reports "Too many retries"
>>>> that indicates no sink to respond. This is the same across GPUs.
>>>>
>>>> amdgpu ... DM aux hw bus 2: Too many retries, giving up. First 
>>>> error: -5
>>>> i915 ... AUX C/DDI C/PHY C: Too many retries, giving up. First 
>>>> error: -110
>>>>
>>>> In addition, the test can result time out such as below:
>>>>
>>>> /dev/drm_dp_aux0: Connection timed out
>>>> /dev/drm_dp_aux1: Connection timed out
>>
>> These timeouts are already handled in this test: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Figt-gpu-tools%2Ftree%2Ftests%2Fkms_dp_aux_dev.c%23n88&amp;data=05%7C01%7Calex.hung%40amd.com%7Cf247127341e34be42d0608dab7434b53%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638023796906119251%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4kt0bcLG6jsPpagnkqwcVWxhvf00Omjr3kjCTs%2BEu2o%3D&amp;reserved=0
>>
>> IMO, It could be fine with existing test, since it'll work as a kind 
>> of negative scenario.
> 1. If a case is known for not going to work, is it necessary to test it?
> 
> 2. copied code here for discussion
> 
> igt_assert(ret == sizeof(buf) ||
>      errno == ETIMEDOUT ||
>      errno == EIO && is_mst_connector(drm_fd, connector_id)));
> 
> As in description, the i915 returns -110 (ETIMEOUT) but amdgpu returns 
> -5 (EIO), and the above code handles i915 well but that's not always 
> true for other scenario.
> 
> Do you prefer I made changes like the below instead?
> 
> igt_assert(ret == sizeof(buf) ||
>      errno == ETIMEDOUT ||
> -    errno == EIO && is_mst_connector(drm_fd, connector_id)));
> +    errno == EIO);

Yes, probably don't break the existing one:

  igt_assert(ret == sizeof(buf) ||
       errno == ETIMEDOUT ||
-     (errno == EIO && is_mst_connector(drm_fd, connector_id)));
+     (errno == EIO &&
+      (is_mst_connector(drm_fd, connector_id || 
is_amdgpu_device(drm_fd)))));

- Bhanu

> 
>>
>> - Bhanu
>>
>>>>
>>>> As a result, checking DP connection alone should be sufficient.
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> ---
>>>>   tests/kms_dp_aux_dev.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
>>>> index ed9dd510..7fce74a4 100644
>>>> --- a/tests/kms_dp_aux_dev.c
>>>> +++ b/tests/kms_dp_aux_dev.c
>>>> @@ -53,8 +53,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>>>>       drmModeFreeConnector(connector);
>>>>       igt_assert(dir_fd >= 0);
>>>> -    if (connector->connection != DRM_MODE_CONNECTED &&
>>>> -        is_mst_connector(drm_fd, connector_id)) {
>>>> +    if (connector->connection != DRM_MODE_CONNECTED) {
>>>>           close(dir_fd);
>>>>           return false;
>>>>       }
>>>
>>>
>>> Bhanuprakash, Swati, you wrote/reviewed this piece of code, please 
>>> review
>>> this patch.
>>>
>>>
>>
