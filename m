Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09833C87FCD
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 17:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F9610E754;
	Thu, 29 Aug 2024 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sl8Ip+um";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1B210E754
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 17:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXez7F0gw2bvT9TXajKSG6s+bb/ebR5iXERzH53VuDEdhoBk3mKsGD7XJND2ZRPbbJHOTwrqipWT9ROk4KD7Cce/zZtN56nMH9yXdphE2ogfOVwn/t8U76jM1wrsCBIaPATOWSxHgEqzhLyN49fMCMfV2KIjgEPZjwgsOBhK0RIbaaJ0qHlnj2jIDl7QF15LzL8D6b+p6yyibOvEuvZQWWeQKtM3DBlWQgK1eNQsoPHsT2r78iN3K75fGI7/8AUs63R11p6GIyjIycRoNu7oR4xuBYknqTwFx8xEq7NLTsCnGdxgKwdyZ3CwYJHQCvFU4FgeEvUVKoau/z7nXOoCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAmKFI13P0B9nzNq6NlRvZYqYtUYVKgtzBMMP8s3yao=;
 b=LQcA6ahDZiaC6lHFY8/3g6PYh30DmUDw7KsCj5N2llOoMYNhYDkTRibrCZPd8Bt7UpcuGyj7DZLgBVt91a6vJybs8rXtKnwFT6ZvTlcPLvH3GRQ4FQ0kmQsSLLeRUSCJmtnIViWaJWrO/BrBaZNNpy/znRVC+81+80nZ/GDbLC/7w7DMJKCepxm/8XYnzutXwdYvZCLW15aoJ0hzb2Zgo9NSFgSE/fI/Yp9OKMjudrQPp/lb6sv3HfH5V64aBav3CILsl2ROLRBPG0Bry29GTndF83PzPEOBWl1MSqu99UhqYdYpHKG6fuXoyNh7yPVPxCroa3IETuKCcGsHhN86Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAmKFI13P0B9nzNq6NlRvZYqYtUYVKgtzBMMP8s3yao=;
 b=Sl8Ip+umdcz1eL1tDcZTsepeOHcLhEahyas1JSTw170iN+H9yH1wlNBscZxUVw1nhn616oDSaMCWugH5TtsbGgPbjtJ3JXXbsCHTVU2jmV2+l+rqFpYWvWWd/DZ0DYd7DYzWM5UqBFKQkTQiQu1xf/oARcS+dYL12xiza36uOHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 17:56:48 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 17:56:47 +0000
Message-ID: <718f1b45-da28-4e2c-bfe3-865347bb832c@amd.com>
Date: Thu, 29 Aug 2024 13:56:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V2] tests/amd_queue_reset: add sdma test in queue
 reset
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240829084035.191312-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240829084035.191312-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b55b811-b843-41a8-e12f-08dcc853f39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzJxSHRzd0c5YmdGZU1vaWFDWVU4czg4TEt1Q0NIbHV2aXQ3YnUxMHdwbDk5?=
 =?utf-8?B?K3FMK2x1WlBHQUdTak5JQkg1UlBZTWNUdU1sYVlFN1hsditUUEhRN2gvamhn?=
 =?utf-8?B?ejg3bnJBMnFrOTdpNExLYnZ4WUhySDFoUUN2UllnUzJ6WXVib1ZyeDY5aVZi?=
 =?utf-8?B?ZlRGUUxITUwyMWxWOVdWaUNyKyt1T3V3Z1ZXdE43N2xWVElNQi9TQXRHZXl3?=
 =?utf-8?B?SncwRG1qelZWWXpSVk4rMVZSTStOcE1nbUQ0QXlKYjMrd1BMVXY1M3hwWEg1?=
 =?utf-8?B?WDlRdXhpWFJJUnhDRmFnTFhpQmpKZ0lRUDVXZ2hwbURMMHRKUVBUdHhOU3B1?=
 =?utf-8?B?YlRobjRJa3J0dG0zZDlxR1NVY09SQXNuVVBNdXZlWk1VcG1NWXlqZGY5ZlBa?=
 =?utf-8?B?ZENxSE9SQ2FVdEVSR0ZpbEF2SlM2RnRUOTJ6RVY3TnVrbXFKRVFtQVpyb3F2?=
 =?utf-8?B?TWx5R2wxQnZIYUEwamF2SEY2UkpVa1pkZ3o4S1FMeTE4YWZrM0pLRWFlWnor?=
 =?utf-8?B?ZW4zYlp5UzBEN29lditGQ0J5ZExkYTJ3cDlEdEZHRktkYklNRkRBaStaSzJH?=
 =?utf-8?B?cTRBZkJ6Z0NDNUcvb3dpK2hMVTdJZnlvV2hCbGNTYkR0R04xb2RCTTczbHc4?=
 =?utf-8?B?S0FQcG5WaDdKb1NYZ0cvMmVxSUJva1lhVDd3YkFJem9iZ25OOVAwNkZqcklH?=
 =?utf-8?B?SFVlZ2JrMEhVeFJZVW1keGUrb0RqVGJMM3MvWE1nUkloM1h1RHBFT3ZRK3pT?=
 =?utf-8?B?Z0RPd0ZidDdpWWh5eG51QUoyRXluYmE4L0pldTN4QkJHUDNlcE5kcEtNQXpE?=
 =?utf-8?B?d1UyUDZ1cmRCbkx1b1NXZHg5ZlZJb1FqSjViSjhMa1MyREk3OGRZWUc3dCtM?=
 =?utf-8?B?eDRDUmtpZEw3cnpLVHA1QnE0bXhwak53NUxEWWZoL002eUNtWWlMNThWR0tV?=
 =?utf-8?B?SVhOQjlqY1Z0Q0Y4T2VEMTNoa3VtcEVlSHU0QlhCWVRqR3M4akU2cmh6OU1h?=
 =?utf-8?B?KzU0UHVxb2xXZVVRVnlrcWFFS3plUXBOL0xmTFVDb1B1a3RwL21ncDRCSlVa?=
 =?utf-8?B?dytXQno3ZXFHWGxvNTBxUCtUdmZjUWp0RHJCakdXY1l3SlQ4bVA0VW80MG5O?=
 =?utf-8?B?L3YwQTlpMGp3WnA0UDdtem9zN0ZxL1lqYU1sd20zOHlQaGV0V3MrcWFrV1Vq?=
 =?utf-8?B?VzZhUkNKcmZTTnVMRlR4NVZGak9CcjNXVzVnMERoK3NQVUl6aG9qSy9hRXRD?=
 =?utf-8?B?cHNma01SZWVkbDRZVGJ3MkVZdU14eGtBU3NXV2N0OWV3ODR2NHQyNXVCNXZZ?=
 =?utf-8?B?eWZFamxOajdWOVV2cGR1aDdRTDhTZVM1cGorS1dVQmxtU2hRV3o0ekVQTVNq?=
 =?utf-8?B?QkRmRVorbnBSdDlGTDBZMnRGbkFiQ1ZGQUtQTkozS3NxVzIva082NGV1STdz?=
 =?utf-8?B?T0VZV2srSG9RUGlVcGpUM1hxZXErWGRjZDJXQXVUUFcxVjdUbWNmOXlFVTFr?=
 =?utf-8?B?ckxWOWxtQXZmRFZVVHp6RkJTU1owOENoUlkxbTlHUnNpSUtORHVqNGordkdZ?=
 =?utf-8?B?S3M1VHM1UkhmYmlHd1Z5Q28xVlp1NjBFbEM0QytZbkdNY0wxOTEzN0EzREFC?=
 =?utf-8?B?RzVrRm85eHAyZWtsb01MSnlLdzdWRCs0UHgrS3hMcHBMNThZSFRaOXFvYVE2?=
 =?utf-8?B?TW5semVoZDFzdk0rd2pTTjhRcWVqY0E4TUxUNCtiT1dvNWF4MHhZcXMrZVE2?=
 =?utf-8?B?TDA3S1BSNUdqRFFKK3M1a2xNQjJqKzZteTIrUjI1QzRqQkQwN2wvQUMvcGkr?=
 =?utf-8?B?RWszazkveitrOWJTUGFqUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhCUDJUSzk3TXBSRmxEaTBLbFVNaGc2QnFPWnN6RUYveHlWVE9ZYUk1ckNs?=
 =?utf-8?B?Q1E4SlM5byt0WWNUUWFDeHRLWjUvODZrS1VKTTV0RlcyUzdYa0xHV3VBQnFO?=
 =?utf-8?B?V0VqWVpwV2ZTL1JDVEM4dkJoZWJWOUFMQXFNTjFzVm1KcjVFZU5mOEM4QVMy?=
 =?utf-8?B?TFJuQ2o3M3VGK3h5NzNJQ2dRcmZNWVNKdUM5ckllTWJ4UnRXdWRMd29HcEFV?=
 =?utf-8?B?SVBlY0hVMHJ6YjBad29PNk9VQmo3a25jWkdERWNkekZOMXAzb0dRaFdxNkE4?=
 =?utf-8?B?OER6dHVpaFFTS0tTNElQblhINWdXU2hQVmtGU1VxdGtmRmhmb2o3SmV4Rkxq?=
 =?utf-8?B?WXRLQTI3U285VjdhdnB2eDJyVG5IN0xES0FZa3JTNUlKSzNtTndNNitITi9R?=
 =?utf-8?B?bTdoKzBzMm9Jb0VtN0hRQ2QrNDFzdWNLSVZLYnlSdW1hSW9mL3V0M1k0cjNY?=
 =?utf-8?B?Wks5RnV6YUF5VXFGR2x1TndvN3RpM3ZtMXFSaWxTRnhleWVEQjdlaXJSTlRR?=
 =?utf-8?B?WTNVVEQ4Qk5qemtKbTIzbW9uLytrbFBsamhJZm9TaDJRdlJXS3BHdEF3aGtJ?=
 =?utf-8?B?cTVBTmZlaHJuT0NqNmFZdTRiaXZrZ21zNDBpM0Zud1QyWGxPSGFrc0c1Q3lK?=
 =?utf-8?B?U285MTYzRGQ5SzE0Ly82TG1aWURWSU5CT25Za0xPQXhmeEVCZjEyWW1EWUJw?=
 =?utf-8?B?WTlvWExrRWVrTzJhelFZaG54MThlZ0hMMUlxdS9uWTB4VFZLaG83R01FWTIx?=
 =?utf-8?B?YUFpMDJKNlBUbUJiK2NmSTdaUWt5TUN6OG9pOGUvbldPU1BsUW1sY0FIYjRp?=
 =?utf-8?B?aTd6OVdFR1RKQ0xCMWo1ZlJWVUFRcEU2MndSZEdWRE5XN2lDSFhnNnBrMzNz?=
 =?utf-8?B?VEkvYjQya3FqUk1YNU5VaHpXSURBeVRBSjRVQTMva0NZTjJ3ZG84WE9RcTQ5?=
 =?utf-8?B?alg2bHFidVpBQjVmalFJeXY4SGZ0bkRCWmVHNE5PMmZDbUhycHJHOVRrcENm?=
 =?utf-8?B?UWYvaUZ0TWczdVZtTTllV0p1WStXQ0VxN1Jsb3RQVnA2TTFNMmFTKzk1WEwv?=
 =?utf-8?B?Y0VJRXJiUXdBZTJzRHlMdGpMRE4rd2hzQVVxMHhsMFlGU3NVWEZjRTMzR0ZM?=
 =?utf-8?B?TmZDL3lYZEhWRk9PSis1RTQ0VmZiSG9GWTUxTlVvc3BCdzdvUWM2MXNwa3Zs?=
 =?utf-8?B?NlBDc0l3REpGb0tlVUp4MGd6U1VUOWVycnhWRE1zNk9yNFRTRVlhT2Z3bnZi?=
 =?utf-8?B?Q3N2R2NNYjVsQmIyeWNGVlAwaGdQYm5RZGlZMWZQbUVXb2w3TWJsdlR1Vm15?=
 =?utf-8?B?MTdpbGJQYVNkV3haRkdXaEpyN081SGE4RXp2QmNSYW9kTXFTeEZWSFRqUmtu?=
 =?utf-8?B?L2FSWVZ2bEthUEFHa1JnMFVIa3JzZWwwYXFNRElocWVSK3Nibys3akFvWEhE?=
 =?utf-8?B?RWZZU0dwMWw3VU04YjJxR05zNXdZWkpGWTRpK0t5dzFETWozSHV6Z1NQZndo?=
 =?utf-8?B?YTBPZXNkVEpPVWoyRXJZVkJ2VWZFZkFPcXFaY3prcFJkdEJWTjBqNGNaOEpi?=
 =?utf-8?B?K2lpaUJkOUdEZjdWMHNQak1sMVVrbmdIc0xQUmlwWkRSYmVaU2lDVm1zN01m?=
 =?utf-8?B?Yk1kWFJCdFZvY2ZXcmcreTZnZGpuU1doZGhDODlwZW1DeDB2VS80TEVveGNw?=
 =?utf-8?B?SndVcS85dGNRWldqMDZnSyt2UngvRFFSNjZZUTU0dDVITHFVUjA3cW1UdHZp?=
 =?utf-8?B?OWp0eG5lT09ZYzF0NGxpc2NhMUFGdWcrT0I3blhEb09odkMwQ3BiYWFYc0NB?=
 =?utf-8?B?ZVVvMEpOUWZ4cFBFWUpFU014b2xXMXpjK1cxZExSQWJjUFFXQXdHRERlUjBh?=
 =?utf-8?B?VXBhTWZienFuZkdOdWhDQ21wSGM3Qm1YaWRBa3BEZWFLczRxNzlONlJUR1ZX?=
 =?utf-8?B?QUxuTzZDckRmeHdyQ3I5UGRURnhscDg4SHBCMm5ybTBTTmYvNXZBNk9XRmZ3?=
 =?utf-8?B?SGFiSnR2bjZBWlVHbVBXelB3eHVrWm96Q1hNcFdqWVcyVW9meTF5M0c4MC8x?=
 =?utf-8?B?cTFlM0krRGoyaXdiMEd1NWtjS3dDRm5OWkh1SnFBSFpnL0xyYmlzZldOZlBz?=
 =?utf-8?Q?vE2Rj25NtMyR9YozC0EuPG/KZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b55b811-b843-41a8-e12f-08dcc853f39a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 17:56:47.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfnFdHqg69C9WnXbvtAfeBPInkEDC84bqRmGDb9MuQ5W/gT9BxnxY3UA1SEQKOuZgFLYaIHtHNr3DpWIKMhqCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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

Hi Jesse,

Overall, the changes look good to me.

Please address the following points:

1.    Add bool support_sdma to struct dynamic_test: Please include a bool support_sdma field in the struct dynamic_test { ... }.

2.    Improve Context Calculation: When calculating const_num_of_tests, add a function that iterates through the arr_err array to determine the number of tests needed to create the required contexts. Ideally, I’d like to drop this and create contexts on demand, but this would require exporting from one process to another. Currently, this is handled automatically using fork, so we need to explore the best approach for this—there's a TODO here.

3.    Remove !strstr(it->name, "CMD"): Since we can now directly check if a given test is supported by SDMA, please drop the !strstr(it->name, "CMD") condition.

Please let me know if this approach works for you.

With these changes made, the patch is:

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com


Thanks Vitaly


On 2024-08-29 04:40, Jesse.zhang@amd.com wrote:
> To enhance queue reset, add sdma ip test.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 537f653f9..8482a371d 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -1035,7 +1035,6 @@ igt_main
>  	posix_spawn_file_actions_t action;
>  	amdgpu_device_handle device;
>  	struct amdgpu_gpu_info gpu_info = {0};
> -	struct drm_amdgpu_info_hw_ip info[2] = {0};
>  	int fd = -1;
>  	int fd_shm = -1;
>  	struct shmbuf *sh_mem = NULL;
> @@ -1047,8 +1046,9 @@ igt_main
>  	unsigned int ring_id_job_good;
>  	unsigned int ring_id_job_bad;
>  
> -	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
> +	enum amd_ip_block_type ip_tests[] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
>  	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
> +	struct drm_amdgpu_info_hw_ip info[ARRAY_SIZE(ip_tests)] = {0};
>  
>  	amdgpu_context_handle *arr_context_handle = NULL;
>  
> @@ -1098,7 +1098,8 @@ igt_main
>  		if (is_run_subtest_parameter_found(argc, argv))
>  			const_num_of_tests = 1;
>  		else
> -			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
> +			/* -3 because sdma don't support shader test*/
> +			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests) - 3 ;
>  
>  		fd = drm_open_driver(DRIVER_AMDGPU);
>  
> @@ -1142,13 +1143,17 @@ igt_main
>  	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
>  		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
>  		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
> +			if(ip_tests[i] == AMD_IP_DMA && !strstr(it->name,"CMD"))
> +					continue;
>  			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
> -			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
> +			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
> +						ip_tests[i] == AMD_IP_GFX ? "GFX":"SDMA", it->name) {
>  				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
>  						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
>  						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
>  					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
> -							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
> +							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
> +							ip_tests[i] == AMD_IP_GFX? "GFX":"SDMA")
>  					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
>  				} else {
>  					set_next_test_to_skip(sh_mem);
