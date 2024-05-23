Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F33C25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 12:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B4110E578;
	Thu, 23 May 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1j3lOowk";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FAA10E522
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 12:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbdEqQPOr4eoxzYjk27VvWETf8PwRRlNtRb0Hx43K0vyKSjJdZVtOKS4nbJkN4k2UfypINnw32esoBXGmuJ7Xe/si3kckkjIy73KIOh0BSAkML6OFycTi3OlyEJNuVHoF+S0IkU05IctaIagf3laH3AkGka0QTlb58+QgaIiQCJ+fhXiXKx34qiyuTwAB7bCrI88t/h49pPYi1y1maKYN143azapWGSldiaxoy0vPoxLjTyW10fTzkfxN140mu2p37roHNSITI9KB2PUEt/9yGLDqCUtSXP5x99Iql1kSIt6CuxHn2YECiXGwvwfLMCOQnW3Yg0bZeZUK/hg9XGp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13mYFKR6Tm+cWUJZP35Inbq8twYv6C2RepNrhPugZro=;
 b=T0zBfIqbXENqcj04FHeHOaFv3+d6owyZKhzfN2jVEZ7F+q1343N/eKiGIVykhnw4/bGu3UJjvjXOO8Q8FaZTKCevip626hdDqGNCh+4SxZc+c9fu4UDPYDF55ssQtw7Hhe2k51CxkibnHkZwKtf67WkSEPt2aNcxGrMdEEDtvSic9viUn92fUuIthZQ9Jd72lEhiWVMsNzQvedkNXFcrigxua3/nQbV7UHajlcQbagQIj3DDBSngbwVOHgMsT4vxX0BOwvnnN+I1B3RUpZ95LeQbgzjDJd/z1JubnncwaFKEzj6/6VBGzQLiLf6v6w3cFlZd6dxBzBj5CiNIbtxzXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13mYFKR6Tm+cWUJZP35Inbq8twYv6C2RepNrhPugZro=;
 b=1j3lOowk6SR/Y9IUBDXFXZCyXobPT8v0hrbBPIlm6vTbtlpUhss2U5m7BVLWr1VN4EdOqdZ+k4qxnZ+k+Vt+VKzpXwQJDWBYs28baoT52wIVa+HhFpLpyn97COwRNHejL6a9tcwDzQZJeZKW2TCVslJibO9mqqmqW66o0r1vLrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Thu, 23 May
 2024 12:56:53 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 12:56:53 +0000
Message-ID: <76967389-6251-47d6-b7b4-5d9b193b068d@amd.com>
Date: Thu, 23 May 2024 08:56:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_bw: allow physically connected only
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
 <20240523100248.230989-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20240523100248.230989-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::21) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae08fb8-80af-4a27-4968-08dc7b27d1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDRvTlJ4KzRSaEVjZVVOa1psWFlYTkVQbDJveUJFYzB0VjVSWXhMUngrVVFz?=
 =?utf-8?B?amxDVkg5QURNQ3h6OGpCTFowYnV4UHFtTFl5b0FRZlFNVnVDOGR0TldqRWli?=
 =?utf-8?B?UU4ralJMZk5oalpNdVgzR3MwVEJ0QUZGNEdCdENKSWNlQmlNdFA3VTE3Skp2?=
 =?utf-8?B?Mm1FSU0vRzRXYU1FNy9BVkNSUzNVWVU4TkFBc3oxZXVQSThac3N4OWhyV251?=
 =?utf-8?B?ZVpkVjEybFhaZC9zSUR2c2w5WlUvTHpYSVM3SGZtdTY4eGpTbWhGZXVlVmFX?=
 =?utf-8?B?NmUrdHlsa3JQQlJZRFZuRWV0TXptZGNiV1JyWGdoa2E3NTdEbS9UbkVpMHdJ?=
 =?utf-8?B?cEV4M09nVExyN0d3Tk9sT0xXWHUyWlNkMk5rUUVyVklBeEVMRUxzMm1ZWHVn?=
 =?utf-8?B?S2xBNEkzT3FZYm5kS21BcENuOTBPc1FxMU9vU09lQzdDcERGeG5zME01Tm5W?=
 =?utf-8?B?aDlWZ2NwK1ZHLzJsa25PY3NWUTJ1ekhTM0kyUzRYakhRTWZPaGhVRDE5ejN1?=
 =?utf-8?B?WEIrNG00T2pRUGtPVG1vRDFqTmVETmRvbndhQmsvaWwrZHVIK1F2eldlV0ZJ?=
 =?utf-8?B?aDFPSU5DaXZSaERJc3ZkeGR5aXQvbXZaL2JGWGZvMzN0U1pnWm9jYVdRRk1G?=
 =?utf-8?B?bUNYK3ErdVUwekhUZzh4bkFXMDlMTEVDcTM3Q2FEZXRiTVFKZ2FjdXF5bThX?=
 =?utf-8?B?MUNtVEdyUS9HYWRBdEY4SEhtbTRlNUI2WG10cUZGOGdUeU51NnE2TFZRSWNC?=
 =?utf-8?B?QW9NRGxFL1N5RldEcnZPWkE4UGFkdVd1ODh1cTBEcjI4UFNsdTY0Wi9wbWJI?=
 =?utf-8?B?aFVzbTBoNVRaTEFvOTlUVjZNT1BPcFlOM1I0UTc5dldZWmJqdDhZNGZyZVRn?=
 =?utf-8?B?ZHl2V2N1aXBnNWpDMGgrdUpEWGxoOS9VbHVUeHJyU2J5dmZtNFFLakp6VjRZ?=
 =?utf-8?B?enlCQkxiQUtrZ1NobWE2WjFwekowSnloYWVYd1lEUzVRelV2MytUL2lTWkhv?=
 =?utf-8?B?dE1vZk1MejQxVytTZG5mZ2Y0SkwyaU5TM3lubzQyZW1qcnhTL3Nzd2FLTml3?=
 =?utf-8?B?WWpEVWowczlzY3VYUmpGVFFCL1NTbTNJWWRUMWFWL3k3QW5Qek8yOHZETFdJ?=
 =?utf-8?B?L0loSnk5bzZGWmNZaWY3bEJ3L1JmUVByQzRkdFA3T2pDRHcrang1T1RjTElt?=
 =?utf-8?B?ejA5L21wRDVLbEY0RmowcHlBVzQzdkVuQVJteXI0QUhwaHpUaTg0RitVMFFK?=
 =?utf-8?B?eis2Wkw1clo4eFFWOTE0bFpMUldjZ3IxeHY3elltK3pWUlAvaFFwMEQ1alda?=
 =?utf-8?B?R0JvZCszKzlnTmhSdStEWkZRc2Jna1RvNlpZMFhFMmhHR2JxcUFqWk9BbUVj?=
 =?utf-8?B?STV1MkNtN1JsVUkyTEM3a1BGNk5GeHhaVk5FenQvVE9RMk80a3EvbGZwcFJC?=
 =?utf-8?B?QjdNUHRXcVRvazhGOW1RSWJSbEJ6SExrdEVWK1VTS3BVTlVyTENWWEhMYk5L?=
 =?utf-8?B?RHM1ekZnUjFqQ2EwOXU4UjF4RmI3SUNBNVBvelU0bXNGdUhEWjJ6dkIyWHBL?=
 =?utf-8?B?Vlp6WnhncVFDSHQ2SkNFUGY5MEgrWm9aakRQS1pOS3lqMmIwaFBwU0VBUXhn?=
 =?utf-8?B?RkQ3SnRVNElWdWVjQlI2WDNPNHVrNkpCWjRtY2pwMnM0cVp5MFRjR0RYV3Ja?=
 =?utf-8?B?Zjc1RWhIY2hMbFlicmI4SmVLMjdlVkovOWpoV1VGcmVja0pURVhjTzB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjVjSXhJajZOU0NzSnhMeXlBeU9XM3BrWFpOc1Nnb0IxNmwwQ0ZsRjNtVVNC?=
 =?utf-8?B?MFFZRy8xWHVHMWdVUE9zOVY5VVRmVWZ2dU9uWE5KUExtZnM1WWV3M3MzSXhh?=
 =?utf-8?B?enFVMTFrZTZkcWt5QWE1OFU2RkpXSWNVZjlpM3FQZG00VWVDRXVtSEs0amNs?=
 =?utf-8?B?UWZTaXpablp6MWViaEVnbjVYZ0tkelZTVHVrS3hzTnJnYXUzZ3duWnFhbnly?=
 =?utf-8?B?RjVSV0ZiVDhJakw2Z093Mnd4Y1Rsd0dab1BmeEppb2l6Rm55aVZtN2dSZElE?=
 =?utf-8?B?Z0grRDdJcFREQ3hWbTVOMnc1NUU5TGp4MFdCUWIrQXZ5enErNW5MdGtFek41?=
 =?utf-8?B?dE1IN2NLbExxU0ZOemszMFF1b2FxTkg5NXM4aEpKQlRlRk5Rb3VVdGszZUlI?=
 =?utf-8?B?ZkVPS1dXM0pBTXhKb1NNNm5QTmxJdVhSSEd5RGpmN2swUzljdXpTVDg1aElL?=
 =?utf-8?B?aUpJeFNpY08rQ2lTUWZTOUd3NmJJUWRoZ3Q3YWlpbmg4K0x1LzcvVzAxT1lr?=
 =?utf-8?B?V2cwVzQ5SmpuVzBmZ0taa1E0YSt5MHhvRC9rZXB4WEFqbWhkUWFlMmpSOVV3?=
 =?utf-8?B?d0xrbzNsaHpuOFMxdzMwem1JdlA2N0hSbVJVWWNQZTV4dVZnWlVtaGFqMTZH?=
 =?utf-8?B?YlpCWkZTU3VidUluL0x3VU9YVko1SlB5ZTFlVXYwb3RXMVpMMit0WmFkclcr?=
 =?utf-8?B?VU1CVHZjeWhVYnF6RG1PY0V6VXdHQUwvNXlVNWRXcDFQY2paZEk0YXE0cWJ5?=
 =?utf-8?B?K1V1SXFqb1FYaFN6U2pMbDkrTHFjdEgrT3BjN1R6ZFUzZUJWbkdSeHVMNXlj?=
 =?utf-8?B?RzVicVVzS2lLMWxqRlpMK0FZV2RJcGthdEt0NDUvWlBzMVg0VzhoZnNGS3Jr?=
 =?utf-8?B?TkIrdStqVUJqZ1djRm5aSFloOVRpVStlMDdmVU1PaGJjL0lEWmtxUTZhdjE4?=
 =?utf-8?B?aTd0ZndPMmN1SVlXK1hhZ29RWENxUllnUGlqRXJmT09rWSszbHMyTEtWRU9N?=
 =?utf-8?B?YjErWGttRmsxRFhISWZjTjFKQ3Eyd1o4MU1MM2pPNlRvRTh4WDhNSFUxUDJR?=
 =?utf-8?B?NGJZem1WYUk5WHZUa3pZOFRHdVdVU0t6RTFhSThvcTdnVHlWUFZvbnRCUEJY?=
 =?utf-8?B?dzl3bWNMNC9samtCblJtandTVVJzSCtjTUpYV2FSb2dyVkdXL1gySmU1WUFS?=
 =?utf-8?B?MkgzMi9wTGpBUno2Q0tJc1RrWmNsak9iL0RXczVQR0dNRzhTNUdMVDVWQzRI?=
 =?utf-8?B?bXdaYXdOdzhhNmV0bStyMGdMVVR0TGlUbnljZmtYdVNsbzZaWjJjK2FvSkc5?=
 =?utf-8?B?d2pYTXpmaEIyWHpIY3pBRUdJdU9HZ0NCTTlnTEphczd3bVN5OWFxMnI4ZGV3?=
 =?utf-8?B?U3NjTXNsdkV3Qi9oMXBLaGdJZEp5TVFMTmN6Y0k0TTdTR1ZSM0tyaVFEMUVD?=
 =?utf-8?B?QndMVkd3aFV6Z0NXSzh5ZHNtbkFYeVF4ZmxhWFVONTliMm9qSDJUaU03VkhQ?=
 =?utf-8?B?bFpNSjVCTXB0ZTkra29JVUpWSUxkL0tCZFdHU3pFWW5GSVl4ejM2aTR3NVVL?=
 =?utf-8?B?emlEclZCcjZib2VITnZ3UTVLRjRNWkdvTVJRclBaanpmeXAvWlBkMGthSUZU?=
 =?utf-8?B?cTNXYUlBUkFwUW52NjJtd2lCaVJYYzZQdVhWMWE2Z055UnhYdzMyVytGWjIv?=
 =?utf-8?B?dVJCM2o5K01lMHdWamM3ZXFnZGZUd0JFTUZNckJENEI2UHhmQ3hNWVRZRk9Q?=
 =?utf-8?B?Zk4wSmpFRytIaFg5UnJyMGQzOGdZYjVGc1N0Q0JHUFZpakFSUkxJd1ZxRHp0?=
 =?utf-8?B?aFdQQVZ0ZGR5Q3MzSlFmQURKZFhWWHdaQVZ3NXgyNXZnZEpZcTRtbzNybE1o?=
 =?utf-8?B?aVFkNU9VVHgzSklRL0RVUHZMRk1UNHV6dHRwYVUwcHlYaXpwOEpVY2tDL2pM?=
 =?utf-8?B?bG1iTUV3eUdnNUhLdm1GblhmM0g5U2hwYURlR2EzYU5TT1RzRGN4ZVMyOFZB?=
 =?utf-8?B?WGpqN2NHRm03ejYvbUgxZnAzejZRL2VMNFpYSUx3c1dDQ0ZvbndWUzk3WEFr?=
 =?utf-8?B?YUx2QmxjQ0UyU0lwSklTT1pGRlhYWDlqb0syUFo1VlVsMm95S0pHU2wwWW4x?=
 =?utf-8?Q?lJE9vweCZJyuc6o12+WrAoJWl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae08fb8-80af-4a27-4968-08dc7b27d1c3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 12:56:53.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHZkKvJGCE1J+3rEnSHMD2+At8KH9V1TpVYFkI5KWVwc81gfcY+AE6LCY49tF3v0nO3S3TFdZPjBaSKQR8PUIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
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

Hi Kunal,

On 5/23/24 6:02 AM, Kunal Joshi wrote:
> modify kms_bw test to only run on physically connected displays,
> avoiding issues with forcing a 4K EDID on disconnected connectors.
> 
> For instance, consider a system with 2 DP and 2 HDMI connectors
> (DP-1, DP-2, HDMI-1, HDMI-2). Forcing EDID on DP is currently problematic,
> and we only support forcing for HDMI. However, if there's only one

Is this limitation intel specific?

> TMDS encoder, we can only drive one HDMI display, not two.
> 
> For now, the test will only run on physically connected displays.
> Future improvements may consider the encoder count to handle such
> scenarios more gracefully.
> 

Making it run only on physical connected displays limits us from 
catching any issues in backend programming related to bandwidth 
calculation, so this change isnt helpful.

How about adding a subtest that can be tested only on physically 
connected ones ?

> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_bw.c | 43 ++++++++++++++++++-------------------------
>   1 file changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index b50f324af..4aabb02b7 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -61,6 +61,7 @@ typedef struct data {
>           int h[IGT_MAX_PIPES];
>           int fd;
>   	int num_pipes;
> +	int num_outputs;
>   } data_t;
>   
>   static drmModeModeInfo test_mode[] = {
> @@ -105,8 +106,9 @@ static drmModeModeInfo test_mode[] = {
>   static void test_init(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> -	int i, max_pipes = display->n_pipes;
> +	int i;
>   	igt_output_t *output;
> +	data->num_outputs = 0;
>   
>   	for_each_pipe(display, i) {
>   		data->pipe_id[i] = i;
> @@ -118,23 +120,22 @@ static void test_init(data_t *data)
>   					 IGT_PIPE_CRC_SOURCE_AUTO);
>   	}
>   
> -	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
> -		if (!data->pipe[i])
> -			continue;
> -
> -		output = &display->outputs[i];
> -
> -		data->output[i] = output;
> +	i = 0;
>   
> +	for_each_output(display, output) {
>   		/* Only allow physically connected displays for the tests. */
>   		if (!igt_output_is_connected(output))
>   			continue;
>   
> +		data->output[i] = output;
> +		data->num_outputs++;
> +
>   		igt_assert(kmstest_get_connector_default_mode(
>   			data->fd, output->config.connector, &data->mode[i]));
>   
>   		data->w[i] = data->mode[i].hdisplay;
>   		data->h[i] = data->mode[i].vdisplay;
> +		i++;
>   	}
>   
>   
> @@ -156,27 +157,12 @@ static void test_fini(data_t *data)
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   }
>   
> -/* Forces a mode for a connector. */
> -static void force_output_mode(data_t *d, igt_output_t *output,
> -			      const drmModeModeInfo *mode)
> -{
> -	/* This allows us to create a virtual sink. */
> -	if (!igt_output_is_connected(output)) {
> -		kmstest_force_edid(d->fd, output->config.connector,
> -				   igt_kms_get_4k_edid());
> -
> -		kmstest_force_connector(d->fd, output->config.connector,
> -					FORCE_CONNECTOR_DIGITAL);
> -	}
> -
> -	igt_output_override_mode(output, mode);
> -}
> -
>   static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
> +	int i = 0;
>   	int ret;
>   
>   	igt_skip_on_f(pipe >= data->num_pipes,
> @@ -184,6 +170,10 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   
>   	test_init(data);
>   
> +	igt_skip_on_f(pipe >= data->num_outputs,
> +				  "%d connected outputs required but found %d\n",
> +				  pipe+1, data->num_outputs+1);
> +
>   	/* create buffers */
>   	for (i = 0; i <= pipe; i++) {
>   		output = data->output[i];
> @@ -191,7 +181,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   			continue;
>   		}
>   
> -		force_output_mode(data, output, mode);
> +		igt_output_override_mode(output, mode);
>   
>   		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>   				    mode->vdisplay, DRM_FORMAT_XRGB8888,
> @@ -199,6 +189,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   				    &buffer[i]);
>   
>   		igt_output_set_pipe(output, i);
> +		igt_info("Assigned output %s to pipe %s with mode %dx%d@%d\n",
> +				 igt_output_name(output), kmstest_pipe_name(i),
> +				 mode->hdisplay, mode->vdisplay, mode->vrefresh);
>   
>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
>   	}

-- 
--

Thanks & Regards,
Aurabindo Pillai
