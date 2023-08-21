Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23A410E0EF
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Aug 2023 15:41:38 +0000 (UTC)
Message-ID: <b42506c0-5d10-4519-b93b-3fa30de6e4e2@amd.com>
Date: Mon, 21 Aug 2023 11:41:34 -0400
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20230818175637.419349-1-aurabindo.pillai@amd.com>
 <2792a229-769e-d894-6f6e-7e87e7a19e27@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <2792a229-769e-d894-6f6e-7e87e7a19e27@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/2] lib/amdgpu: Add check for ODM combine
 segments debugfs endpoint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-08-18 17:02, Alex Hung wrote:
> 
> 
> On 2023-08-18 11:56, Aurabindo Pillai wrote:
>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> ---
>>   lib/igt_amd.c | 10 ++++++++++
>>   lib/igt_amd.h |  4 ++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
>> index 83011e8ca..1a720ff56 100644
>> --- a/lib/igt_amd.c
>> +++ b/lib/igt_amd.c
>> @@ -325,6 +325,16 @@ static bool igt_amd_output_has_dsc(int drm_fd, 
>> char *connector_name)
>>       return igt_amd_output_has_debugfs(drm_fd, connector_name, 
>> DEBUGFS_DSC_CLOCK_EN);
>>   }
>> +/**
>> + * igt_amd_output_has_odm_combine_segments: check if connector has 
>> dsc debugfs entry
>> + * @drm_fd: DRM file descriptor
>> + * @connector_name: The connector's name, on which we're reading the 
>> status
>> + */
>> +bool igt_amd_output_has_odm_combine_segments(int drm_fd, char 
>> *connector_name)
>> +{
>> +    return igt_amd_output_has_debugfs(drm_fd, connector_name, 
>> DEBUGFS_ODM_COMBINE_SEG);
>> +}
> 
> This helper function is the same as one line igt_amd_output_has_debugfs 
> and it is only used once in patch 2. The log in patch 2 seems to explain 
> its purpose quite well too.
> 
> Is there a special reason to have a new helper function? Do you expect 
> the check for ODM combine SEG will change or expand?

No special reason, can be dropped. I can use 
igt_amd_output_has_debugfs() in the code, and drop this patch before I 
apply.

--

Thanks & Regards,
Jay
