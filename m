Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1FC1077610
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 20:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508D310E091;
	Wed, 18 Mar 2026 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bI+S9gQr";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F283410E091
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 20:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW5z+Yzji7ttYDSWNvUgsPpIxIhCHD51GvKmz+QWlAQIpq9wh2bSarNTqptFPJdADpGieY/KSJxkrnGR272gmMQDhemUM2kWF/VY13BnxatuCFro2+nWa1PbcetUYsqMdSOvPxxy9569cSe4uDhRnDKZZoUmHsh0wl/2myBnCQvtKeWDFoSV0XHXvloc5f9DwHei0H1tuF6i+Dxm75YgGcRCmSsU2+20Ed7BEqBttqSBLyc5856k1XBouF14pQbE+azyJ6et3Qu5iY4G+UjuN9fKsXYh5ShuCClIuDgYseM2JK0tjmi64DEdRdTc3JFq2IKWU7u7zmcSujwv72RW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXuvNw/Ki+EYRT65063IlembcXIkOxd1HtiNrGcZ6wM=;
 b=ZaymSALs9y7NdAQvmEH3OPgISJAWYDuAEr10hwM/L6rZgUptuFLkhYAJ111KJxdasXZvCFuE8acOfb0COuhZXIMDqNtZWCe6LDV3Wr4qsMgJDnf8XUeoIX5EyHnkF8Ozqrb/m8zz7ZbVhpEQW8KhYaaAikztfelVD68VGitGw2eWdefqr5p2mxt2TKfX+hKAfOI6bKhvZS2Y+hKJHGY/an12XZDoJvy1aYJ766GxNryt60zYlJ8x1IZ/zkCEosCLpyCumi2vL0ueUOSqcIljdHy1alJmZkulIbMqxOt11XyoWPCjIQPbTRu0RM+OUkfhwl8kzpc4IcDNcDUqxA0w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXuvNw/Ki+EYRT65063IlembcXIkOxd1HtiNrGcZ6wM=;
 b=bI+S9gQrQNUy7lZG0HOszenaYB8ifg1xopXFl1bzlT2O58xEQMyVjMBsbfg4CR6cQcBe9ECWp3e/h7XOeFHVI3KYve/Bkbt9mPP7e+8DRrv9xH+IrYEfNipXgnabglyzk+3KCVwVyXBMaFKUIeQ3coZMk77SpDyytj3QM+ppg8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 20:02:00 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 20:02:00 +0000
Message-ID: <475c8dc6-30b0-4013-93a8-6dcaf49cc163@amd.com>
Date: Wed, 18 Mar 2026 16:01:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/12] tests/amdgpu/amd_mode_switch: Prepare for
 returning NULL from igt_crtc_for_pipe()
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
 <9fb29dd8fcfa356cfe1a40e63977870779f277bd.1773659680.git.jani.nikula@intel.com>
 <20260318180108.vnqsmithuivxe3lw@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260318180108.vnqsmithuivxe3lw@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0076.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::13) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc843ee-217c-4665-10c3-08de85293735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6R6znhgXa+NRBnXMO35l2u3aaUFLyOEqazWtNB8H0Qqa+adKNrq6hiGmY1Ffx+xwhpb4TeHQaUyiIB7LlyjhyzcKBPZlJlzjyB/mqItTFiVsSPKhMRV54y4tB7JkQoM63NYJ1xpGYOOuRi/+Vab2HtdlVCJpkHbJzE4EUtC36cwyC6JP2UsC5lPAnt7oy2zJ1/Pu200mcZwc5qLJAeoQDFFCCbQtDkZImulEoQLJlUyRb1CDHMgyfRdqknw5eKrqYBOGrNarK15u68ZowKMFKS1N1s1rM5ZydcvOtXEc5yvBfQaiJ+KiO8ZfN8Sk3Gok4Ne5XlsdYEA3uD8NIXgKK3b/N1Jvfk03Ie2q5psKxLvG2bsSgSGRpS+3M/FNqY2RIc+fxY4LqqhLjI8Db1xfP5ZjTK/pRXRUKMK4P/w6OGmPYD3JPaJB2M0iL8fM3lZDJirbJaVpUVckW/1KK9+QBpslnQ4ca0YzetJJu9eeKiRQJPPaOck5d8bGFeDYEq4BBIEqgeUmLuGxuWnEAIfYmRav1ToqlyDOcRZL2tU+Srxca6rNO9W4gEtp6I7suyya0j3KlcJGp45vQ0Df2ypkQ2SuFdTRMtZESyyrsfqOAKrnOjP+BwN3RajZjw4SmxvX9S5mXClKhUqby3AVNPgPWSS/X1tPbjC+yoE/nf9PXyuMW7wrQcp0G3O0DA5PRcjAm3lSLY5FjqSA/IwpYA1jWkYVOVnsKqoRXrk7DIMPj+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEkzNlg3VmhWQ2tyMjRnZ2srT3pqSU8yVExXNlU3b09wNlVGWVN3ZkY3a1c3?=
 =?utf-8?B?UWlma09haXRKVzZnN2ZCVC9BWlNkdlNqOStZM0R2dDN0RmdWTlFHSW1vODMw?=
 =?utf-8?B?aUREcng0NXZFM3R2bFYxZWphcENIN0NLaUNIOU9qanpveUFSU2g0ajc2MXVz?=
 =?utf-8?B?emExenlQQkZnajRVSStMczNLM3RJTktDM2NMVkJFTWtlREh3TkVkK2p5TGZi?=
 =?utf-8?B?TDVrajR4WXJoZ3RDWWNrOWZDOUhLcml6c0pCcGZqMkVmeTdnemdzMkx2UFhw?=
 =?utf-8?B?c2dwUDFwSHNFdzNmM2NkMmFvVXVNQkJLVjRVYUNPVUpGSTE1QzhhNnVwTW8v?=
 =?utf-8?B?TmhuZDAzRlZ5VlFxK1hQMXhkQjcxOFZNSW5KbGx4WUkrb0FZVVZNaUQ0enk2?=
 =?utf-8?B?WFFrd1MzSFBuakFvV0NwMjhjZGNRR1pZVWx6Rm8rb2hBUXVSN2NvUGZ0VkI4?=
 =?utf-8?B?eGJrS1Z6a0oxbVp3aXBOUUlpL2NpNFNDbm84aWpBOUM0aUtVTndFZFFFVDFO?=
 =?utf-8?B?Ujk5V2pHUEs3TkJYbGV3Rk9BSDE5Z3p5aGp1bDdhWVZKRTU3OFFNcnRLQjZa?=
 =?utf-8?B?MWIxU1cvNHNncDBDN1pRTFdTeHd1ZkRneG01UCtBOVIyM2Y0U1VJUURYNG1z?=
 =?utf-8?B?YUdkamtjSTZmQWYySmd6TU9BWi9vYXFOcnd1dnVxVHZiUUIwSmpBRkNHbytt?=
 =?utf-8?B?VFE1REhwVXd0bkpPQk9kR0MreGtMTHNpbUhiT1pnMnJQem4wNTdvenF3ZDFW?=
 =?utf-8?B?TGx5ZGM0cWR1bS9YbjF3NDVlbW9oeWwvUUhXQ0x2NU50em9JUkxjUG1salpy?=
 =?utf-8?B?MTZlbTZOdXVMZDUwcVpvcGMxeGw5R3hZUWhiei95T2IxRlJjVjZqSEdMWlpq?=
 =?utf-8?B?cnJhRXc0Qi8rVjNpK0x0K3FUWkF6a1g1YWJPbSswS09ucllMVzFsYVYwaXZB?=
 =?utf-8?B?RmVDVCtONkJ2TTdCQ2hJZldFYjFTalpJLzd4UnBjbXluVFFwNmcxZ1F1dk82?=
 =?utf-8?B?eFM2Ujh2citON0sxSjRsVzMxOVJoWW1IMENkVi9UWHpiK2wrSmJlSnZ3TmFh?=
 =?utf-8?B?bnBkVjFPaU5tNEVwMlN4cU10aVNCUlRhblJtc3FCRWlHdm83K0t6WlpSa1ps?=
 =?utf-8?B?MDBpMHl5WU81anM0K2U3MlB1b3ZscllkNGxISmVmSm1tRjhoWTJrdTl1L0E4?=
 =?utf-8?B?RlQzc2dEUFhNcDk0OGgvSkxneERwYVZHQkY3cWMwdlRNVkpOUFVwKzFFZWR1?=
 =?utf-8?B?d0ExUFhwVngzTkZGVUtsRWxQSTBuQzU0dDY4VlNJR0xIa1FJYU9BQVFjUksr?=
 =?utf-8?B?NkpTd3VGY1hWeFVSeEI1ejJiTkk3Z0NyNU42WWhNaFRRR01MYkY2Ri8zVWFv?=
 =?utf-8?B?RFBxZXp2eHpKemt3OVRqNmpTMjcwUzdtUE93T1A1WW5VZDhYVXFKb1RVYUJ5?=
 =?utf-8?B?MnZqQlJIZUVWUWhzWkNoSTdtTWZsKy9vRWRYVllzTTlWZjZlSVJKY1JHMHVH?=
 =?utf-8?B?OFJVMGtoUkk4SWV3WlZRZHlEb0RsTzJCM0lBRUpNWDRSbDRsQzlyTUpXZEF5?=
 =?utf-8?B?NmU5RHZBcFRpNU1UeVljeEZhMEdadzNGYVlDRXY5NndrMWlxbFd3VnBaV0lR?=
 =?utf-8?B?TnF4OUYvcE5Vb2JoeUsxNE9iN0x0b0xkZUZiNkUxTGE0bzJTelBDUjR5Rit5?=
 =?utf-8?B?UmQyUTR3R3p6TXAyWXhPUzcyb2J2dE9saTlQbU1TMW5XcU5HMG5OU2FQWnVn?=
 =?utf-8?B?UzhuMUdES2VDczg1Sk5SbWduWnV0aWdNVjB2SG5RY1FFZWpjMkVyZ0dpdjhx?=
 =?utf-8?B?T01MQk00cFcyTVJXbmlacGl0NjhXZTUvdlRNOUVxOTNBelRBY1N0QlAzYk1s?=
 =?utf-8?B?YTRrOXoxbXBKMnBoUjJrRExCS1FET3pmSERUQ2tuQnluRVBBUG1aU3Q0andF?=
 =?utf-8?B?dkpCWjhDS1FULzZzcENKSEdJdzBVeldWWlF0VE5TRjRmWkJsaFkwRkt1TFdU?=
 =?utf-8?B?RFFLR0NXMTNQeHpaZEIvN012cjRocnJyR2Q1eDdjOElTdkpsQ2ppeUE4QnIy?=
 =?utf-8?B?bXFRMnBmRmhHaDJadExrTEJHczBuUDB2V1pYR1E5cGJXaFV2cVVXMitLQkZv?=
 =?utf-8?B?amY0SmlxRjU3U3pGQkRGTlFZdzF4SFc0SXNGV2p5NVd5UG1NS1BMdit4em5O?=
 =?utf-8?B?bGJiMU1qTnRDYTFQd0dTUWIwNnZNenFQdTFXQ2UvOUFiclFndE1pSEhKd3U0?=
 =?utf-8?B?OW1Hb2dlMys3dEh1NXhnNTZXRTJ4Z3VKWHk2Z1VzRGJLQ2pGVFQzSEs2NnRn?=
 =?utf-8?B?dUc0ZHhuQVl1TVhxRVpuNDMxUllrZ0FQSWJPMHpBR01uWDRqTmlLUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc843ee-217c-4665-10c3-08de85293735
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:02:00.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJjQ8n1KxOsCwfmAt8ucfVirJVs2TeApDMTEAI//TnIwp6p1YeqPS5A21yqbMLbMHG4VMUGtFs/VdeWBtjVUwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 2026-03-18 14:01, Kamil Konieczny wrote:
> Hi Jani,
> On 2026-03-16 at 13:19:03 +0200, Jani Nikula wrote:
>> After checking there are enough pipes, AMD should always have the
>> CRTCs. Assert that the CRTC is valid.
>>
>> This prepares for returning NULL for invalid pipes from
>> igt_crtc_for_pipe() by ensuring the test logic is sound.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> +cc AMD devs
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
>> ---
>>  tests/amdgpu/amd_mode_switch.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
>> index 4da07c412996..ffa2952bb5c2 100644
>> --- a/tests/amdgpu/amd_mode_switch.c
>> +++ b/tests/amdgpu/amd_mode_switch.c
>> @@ -98,6 +98,8 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>>  	for (j = 0; j < num_pipes; j++) {
>>  		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
>>  
>> +		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
>> +

Not sure I follow how this prepares for returning NULL
from igt_crtc_for_pipe(). Wouldn't this do the opposite
and hit a NULL pointer with crtc->valid if the function
returns NULL?

Harry

>>  		output = data->output[j];
>>  		if (!igt_output_is_connected(output))
>>  			continue;
>> -- 
>> 2.47.3
>>

