Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50368C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 01:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9F210E061;
	Wed, 19 Aug 2026 01:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3dQ9/xUs";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5810E061
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 01:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMHB+3Vpk621Qp1QwyDIjWB4CeOtNy7crzQZp9+RBXauMvMQtv2IySpfO5MUhVjxSVXTMvVp/b0ZvNWkF9v1gZ/5kEKK7W33O3xqCafmuJvuO87/KvFDpHiQKL1BqjdWXJUiM8mLtNmltkK6enTLs6HqEE5X4tm0lU4lfN0CRkFRtozsHcKoIhIlju+0q9vnfhcgblRovX0OsWFWjfbwbONRe34FHCQLVtXixjqB5kpprHA7o8+oIfUKLj3msy7njPLwIGeRirO6sPAYFhKnXdAevUvJyGe9wpiYsJhm84jZoD8lzupyxEyQazImjfJDna11SBIWryjzSB3mycEzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XvslessivOMqTn7DkeuAF6/RG3U6i0dJqexRC7lDds=;
 b=KnZ8666QHmKYYmG1wZMAUnV6APwlYZj/UQuPMh6uBbAVEvJSqT1oDaoGKpmW6755DCH0ItDyg3zbHYkJB/zYPaL9i4ZiOVmKfqSQQuEy0pZSBJRNE3Hgabd3HK5wYuGw0jYtEHXZ94L+ZTKltX5m36CL95HRdeVmh6QjnFRqaSu+rorskTLGbz67HFZ38l385n5M8qOo22IEOE5fBuuZmAfp5H4aFVUbyL5T8LOt7KMzytcevSyU9zXl8905hXrmqPNeBgw721OvRGhbCAsKeh9lxmimRY2j6T5eLIB6PfvNqkJbnW3omz/snU8p1BTB+EKyBQ+ARILtF/x/1pLhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XvslessivOMqTn7DkeuAF6/RG3U6i0dJqexRC7lDds=;
 b=3dQ9/xUsEBCkbrHn71d2Nr1MkbHZaAgEJNaj4eTPBAWvsm3iZOoHTFGRfCueFTZ7rRNL/TFSuF7nxozJvKt0A/9Qo41DTEweYrJP19nNXPKLhAnrZ9F1BamNtcYYAO/AwRmlApUF7E1eGhLRGOAJLmaP0OsR8ZIxl9KfzpwDAs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 19 Aug
 2026 01:34:28 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 01:34:27 +0000
Message-ID: <83affede-b934-47a6-86b2-249f5554905b@amd.com>
Date: Tue, 18 Aug 2026 21:34:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/amdgpu: fix NULL deref computing
 available_rings in amdgpu_create_ip_queues
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260813080337.3327962-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260813080337.3327962-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::28) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f8a78c-bc7e-45f5-182b-08defd9201e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JrFFv9+C8MLmXSEu0K4gbtj/XP3aLGrX84sH0A77VNzCNoF/dfoig4dQ4WOuqibpVegbZEe2I5PxznifimPEVLta76Zob5tEjLIU9iRcUmQslBselAunWas9DemPj/XwwBjfO7L10b4V3jDWWsmNlIz/c7wcAC79N3rzjnTLu1YHxw+wCEJdw+guVm2Kxir7l3vkVIiWYl8jKWCxQ4SXn+GKWCUiE5VnsjIpasPOzBvwVsaeCYFlle7cIRQaQ3MDjLUuCpjacPO9NZTGkwElmginNcvJRH4oa7QcXf46ViYr2lxyuyexY2p7EtsgIkKotlij7omfFVvJ7Kkzu79hyE2Zlwkys9jMsQOQuYTYSyYnTS+qmZ6o2U8+NxWhZ2pAFasdCA0tvaeXgA4pLJiSxZ3d/s6FFv+q4ykOMtkZYvaHbhLGCocw9oKUX/aOeIjDSE7m6ygXO1WUMNbN4KvNWMi9zpdTsh1DBKgjVbNAXd7MK0gVMXtgY3DUpkWJkQoAKTUSFxAKTBS8zoG76MuH3ubmZvbzBr1egAvpOLTTQsPCbOgXxxasI5yySVfTpENHEKbDLUc/LNQBQCMUmcDW+wHIqIxNHdtxKVA6nZ1UnPdRFwCExLd1mCcXLjdwOLSa1P3kIjX4iakm4WMdW7NhpNLJm9SF6yfxl3yTvVkeQbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJkZmZYRTZ2NWlydXl0MjU2RWlNR0NXRVNmNjBkelR5VjRqdnEyY1JsNFJE?=
 =?utf-8?B?YWt6WDZGNExaYVJwT3YyWEJ0Y3lzWDNQa2QxV1J1TGErTWU2VHIvUDhyUEFo?=
 =?utf-8?B?OTZrdEJLMi8yVUNLOWpGWlFjQ1V0cUhxZDdvWlZLSlZhVHFFSDBRRmYvS3gv?=
 =?utf-8?B?alVhQkxLNUVDblBON0M3eDg5cGhlbHNiekRZeXhPYWp3TDkyenVvcVNubmZv?=
 =?utf-8?B?eGd2WW5lc2tEQld3RitsaDlvTVNPcm00SFdrZ0I4VGdYRHBuN2dmRVVmbHZ5?=
 =?utf-8?B?aHQ0Sm5iYWZJc1RDbUFIR0hFRXB4NlBmdHJWU1paS05DRHVNbXFNL0JrUkdn?=
 =?utf-8?B?NkkwMXZuV0p2M3g0M29NYSs5Z3BWN1FzODRrcDJ1T2s5VUNFMUFuSVduNko3?=
 =?utf-8?B?WEtzUDhWR1FFYk41RUtxanRaOFFvaXkxeFNoR051cGRpNll0amc3ZWJwS3ZH?=
 =?utf-8?B?VU1qVTJQVFp1ZEh1bUhLSndBWlB2c1kxR3NoSlAweC9xNVVjWlAyVTcrRkJ3?=
 =?utf-8?B?NElDaE5NaElkZ2hQQjN4dEZIR0YyYzl2ZkF3c05lNCt5YVFOYWVkSFBSVCtS?=
 =?utf-8?B?dGVxTEVlWERsWmxuZm9CVU9aamwxb25HdWdON0YzMjFxaUduRlJqT0FBU1hr?=
 =?utf-8?B?U3VwZ0NaaWptd0NTMW1HOEdMYTQwa2R5dHUvRnNwNmw2U2VTS2JyZUd4ZHh5?=
 =?utf-8?B?aFVRNkdNTjgyVllTeXRwaG05Rk8wYXBHNTJBd2pCdW5HWHd2SXo3YXZMbGw0?=
 =?utf-8?B?Zm41OFFUTHFjM3VGczk0VzdrcUdlN1VRQjNLaWFVK0prUXdhU2NMbnNYbFd2?=
 =?utf-8?B?NWg2OGQwaGN0aFMzWjNkck83NjdpVjFWN09DVWVTNVR3NG5rU1R5dXdFR0kz?=
 =?utf-8?B?S3ZyTVc2SThTaGVtcFk3c1BiOUFpbERKMm5SQmxYQ0FIc3FqMzlJTUREcmty?=
 =?utf-8?B?WkE4aXFYWTRZeTlxb3NleTl1eVhJdFNZZ3Y0MDBrU1FQOHhuZ1V2QmNlM2pK?=
 =?utf-8?B?YjllcXdtZ3ZkMm5NaTk3ZUxCUktyNitxTEg3dG1pQStnbWhBMmJWVXE1dE9R?=
 =?utf-8?B?cERBQ1lVVHBYdEFjcGZKQUw2di9EUlVwdVFncE1DT0VMWE1nUW1pUktoZTBT?=
 =?utf-8?B?Q1RkaFpLSlFsbVlFUXBKMlJIdjFQUHVvU3Fxby9FdjF4UlBYWlpNU3RsalVL?=
 =?utf-8?B?eGdTOXRFODlDMUl3N0Z0cUR5YWV1U2NKTEtsUnBjdWtSejJiUHlFMDVKRkxY?=
 =?utf-8?B?bTdRdTFxTVZtZUo0YytBU0p3S0d0aXlHRk9TZ2hqRXYzWS9kbTdSKzJ4Z0VQ?=
 =?utf-8?B?QytaRUlUdmFLamxFMzdWckhiWGhSdm9xZWk0QW11VFM1V05idnZjQm9QTnpV?=
 =?utf-8?B?TnJua3VybWorZ0lJa3QzOS9JVmpSdytlZXBkNlhMbmkrOERSRmVHaXYwdkwx?=
 =?utf-8?B?Y2h4ejZLcGwrMmU0UkphR3lKcFJndGtBSnp4c2tnQUx6MEtQMTNaUlkwWE9I?=
 =?utf-8?B?dFZzQTlNSEkvWm1MZjFMZHRUYjY2bHNHeGVydU9hKzZ5Z3JSak0yekhOSGpT?=
 =?utf-8?B?WUN2TENuSHFEc3puZ0ZCM29wSWVnck9tQ0YxOHZ6VWl4MFk1dWVTTTJQTWdp?=
 =?utf-8?B?Q21DQnlKMlhlQXg3SWFnR0VJUTFoQ3JMdG9TdXphQUlnaytxZ29TaVZBL3E5?=
 =?utf-8?B?Sll4RWNNenJ1M1E4T3Jjb29rVHUyN1N1UEMvV0JOMG1NSXE2djg5NGJwaGlp?=
 =?utf-8?B?ODdqWStUWFFEdHZmYWUxMG1FV2pCcjFrSy9ydm5JbVdnYzZsb3A0SCt3UFRO?=
 =?utf-8?B?NWlXS0NsaXNuWXBsUlkxNkU4QVhyWjdaMVBxVlJjNXBjaWxxWUZKS2NObXdJ?=
 =?utf-8?B?TjBmTDYxZGNFWXFzbWhtSXo1STMvTVVrTzQrZStncXFyUFNKbEUyMXdXRm1B?=
 =?utf-8?B?ME10bVgrUFBYRXRuemQ0bmtzMjRya3o0ZjZ3NytKb0UrU01iNk90aEFoWitx?=
 =?utf-8?B?UFdLQ3RHczBaOWFocXFJeldYSWVuQkJXSVhOUG05NmN2cnZlZXdQSlpMbGFL?=
 =?utf-8?B?ZEM5Ung3ZmQyTnI5Y0JFWFRwd016UVdwMVVTNzJadzlCQStxS1E5c0MvVy93?=
 =?utf-8?B?aW5RZnRyUmtWeUtwS09JVWYzYkJLcXMwU1ZndWI2WkFMNlJpVkJSUE54ZjZ2?=
 =?utf-8?B?cUVDK2sraEIrYVQ4OGFyTlZGRUtsNXVlVHI4cVltSnp1TkllazB5b1pCdVE2?=
 =?utf-8?B?UzVCUStjUnF2VWpEakJHM3RlL0liRjByTUNTWlcyd0hMMWcvUWhXb3Q2Q1VX?=
 =?utf-8?B?dXlaOHdDbzJkMzZmKzlnTWRnZFBIdGgzQWUyeGpvT2R4cVpKTHJaZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f8a78c-bc7e-45f5-182b-08defd9201e6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 01:34:27.3713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0kBgxTARVSMJgWuA+PF2lGdC1dgtgq3ny688yO0gzqG4FZ+jLcPVJdW9tkxx27EjvgSZJHPLR4LSH4CptDCrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037
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

LGTM, both patches

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-08-13 04:03, Jesse Zhang wrote:
> amdgpu_create_ip_queues() dereferenced ring_context->hw_ip_info to compute
> available_rings while ring_context was still NULL - it is only allocated later
> via calloc(). This crashed the all-queues-with-umq subtest with a SIGSEGV in
> amdgpu_create_ip_queues() before any queue was created.
>
> The HW IP info is already queried into the local hw_ip_info at the top of the
> function, so read available_rings from that instead of the not-yet-allocated
> ring_context.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 0334c2ded..7210cffb9 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -181,10 +181,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
>  	amdgpu_dma_limits_query(device, &limits);
>  
>  	if (user_queue)
> -		available_rings = ring_context->hw_ip_info.num_userq_slots ?
> -			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
> +		available_rings = hw_ip_info.num_userq_slots ?
> +			((1 << hw_ip_info.num_userq_slots) - 1) : 1;
>  	else
> -		available_rings = ring_context->hw_ip_info.available_rings;
> +		available_rings = hw_ip_info.available_rings;
>  
>  	if (available_rings <= 0) {
>  		*ring_context_out = NULL;
