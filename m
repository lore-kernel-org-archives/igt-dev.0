Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0DC30658
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 03:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0C10E0DF;
	Wed,  3 Jul 2024 03:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oAy/uqhf";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBF410E0DF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 03:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVBXe/neEck56KuhLoGSm5kAJ1riJJy648cwtS+F/z1l2N8R5jw/zM36Ltfk3bfu1k9pXJPhRBadVaZpHVFdNwAdvDOOwT+Uu4boQ8bJ3hSNJsoGZjV2IXIQO2rbC14ajrqOKUO9JqWXJt8Tx04DVoTzDBe8WVUmNSHfhUoGtIgq+OubeYeZoBCSsWlv4Cqaz3P3GsVbbIBT+vrS9K0midd971T2A7YTKAV1CdRvMpW3QujPF+peFuu8jTlAJ4I5T6dl8W/obILbZ6Uj7FU+8IiN2vFOvfavTxuIYJGrcP2g0RdXiAhlFPi+XQREFUf9FAWLHlonsDSQN9s8qegNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmZUrVpGfEJ59lRSIXAvY5onhgzud1PIFsQEvvzVRQk=;
 b=M4ojymt1rztT8QhkKYbVsKlZEPHSpVFBEb/Si0YYcOmFHBku1LA5NYLFhObzZ2OJjz77uxgaYJZ4ytvQVjVkfzt95Qr0boMjkHBw+l8V9OKDzYBU5snvEIC6VjfkLifGB6u8w/V6TdE3l8SXidEYWQk0nSlqOCc3kjyvRBBUyaP9Uj1i0IMneUmdIuztnTRE3IJPQt31tghoyfiFm0kmq29BNOjpLocw0OF4zWc31cVIoOWwkmNHwc2st7ofKQjFCi+39p/Bl0MQFe8VWzk4Z9zwVgMgPAgP7hxUTgBlDPFj591CVXBRRDEayWQ7li4aFrbGzJ6vt5apZUx2QSx9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmZUrVpGfEJ59lRSIXAvY5onhgzud1PIFsQEvvzVRQk=;
 b=oAy/uqhf/EvE0PfHS2JXcYHCEmaFf++++dRZqux0zUv5o7OAccE7a7Ypcq7RFiVG6zDX9kMSY7tKLuh+UZwiwC/Ay8gj2WOthA2YCPwmL1Bm1HNRyt+tgiUrkD9Fi6IFqlWsMSF8yRVkSdVbJDPsfGcgFLBZkQyBbXfG/amlBpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH0PR12MB7095.namprd12.prod.outlook.com (2603:10b6:510:21d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 03:14:02 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 03:14:01 +0000
Message-ID: <506bdf60-47c4-41a8-aec4-b9a21dbdd17a@amd.com>
Date: Tue, 2 Jul 2024 23:13:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/amdgpu: add amd dispatch subtest
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jiadong Zhu <Jiadong.Zhu@amd.com>
References: <20240703030931.925386-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240703030931.925386-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0462.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH0PR12MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: bc329767-5e97-4138-ca27-08dc9b0e2fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk5NT1dlM05vbmtFR28yYlNxcmhjdFJPdkI0Y2QxaGIxYmxnTTgyTTRZUlQ1?=
 =?utf-8?B?c2RHRFUybnduenBhRHVLMEIyOHNnQkNsQWprdHlRbjRnWElnN3dGRE1wRkp1?=
 =?utf-8?B?TE9sQmt6ZXAvby9uTmN0cU9CaEN3SmhRaCtKL1A1Y0VsaEx2Q2lRcVFJUi9t?=
 =?utf-8?B?VkRZRHNCcWpIdlhqYU5mN0xibCtFek82YjB1R2d2M3d2SnJINXpROHJkakdx?=
 =?utf-8?B?dkZnY0FycHlXN3Vvd3NaNXlPeU9jNDRwT2ZlQjNjWHdLYStRZE1rdXJPN1Iv?=
 =?utf-8?B?TGt6bFlmZ2hpbmpIRi92R0hlSFQ2S2p3dnVwSDdzR3AreUo0Y3ZRSkdhRUpj?=
 =?utf-8?B?czFrb3NlaTFjM1BaTWovckNpZ3JQT1NlWVpzOVdLZzVxUmpSY1c2dTlBQWNq?=
 =?utf-8?B?Q2tpRFduMjQ1T2ZOc1F1M2w5cmFiR3JMSzNnZ0ZKUFJTTHlESm5JeTVpTUgy?=
 =?utf-8?B?K1BqZTkwZk5MdkI2RHh4eTQ3Ym1xVjhLL1ZSRlVaQjNmUE1uZ3VETDErNFhL?=
 =?utf-8?B?RnF1emJoTXU0ak5ld1ZEdHhFU3pqTy8za1lSK0FZRFB3dlpmUmNPNzhwc2p4?=
 =?utf-8?B?clhuU1BFd0lFbXgwcjNtYjhmanloOGs2cC81Uy9KRzlaR3FJSFppSWlBWW1x?=
 =?utf-8?B?NUlycDZuUWh2dWpvbmZKK3JVVDJSbGxJSEM5ejQrTmRjT1l2ZVlHVngyVE1U?=
 =?utf-8?B?ZDV3WGUwcmVUN3JJcFFMbnNETG96cy9VT3lNK3VncDZTRzFHMkVjVHE2N1hH?=
 =?utf-8?B?NnN5aWNEUzN6aDdtQW9LZFNNSG0xS1ZMRFpBUFFuVE9GQUlHYitUcUc5bVNS?=
 =?utf-8?B?UkZvOTgwaHdlT0VBZEVLazJiZzZaVWJWMGRPNnFrNTZjbEZibDhkUDV4NzMr?=
 =?utf-8?B?R1BHYlBFdlo1NUFTazNoc2JCR3RVUkRUc081NTZFb0JINUVJWnBLSHZwOXRO?=
 =?utf-8?B?MHNkREVXN3k2SXNaVDFDRGlRYjBTek83Qk9Wd1hSeDVlY2poMCtHSDVGWkpq?=
 =?utf-8?B?VEF0YjhOQUNoM2ZHanZydktNamxxMTBSckNTQ2ZqNFVwdUNFVlhyZjZoeUYv?=
 =?utf-8?B?cmFIcGZKYUZtZm9rWm9PTUE1R3NxWm9DbWN1T0F2cnhwRGpMS3dBVktYaXIz?=
 =?utf-8?B?VHg5eWxWenBVUTl1MjdjVlZzZzdHQUdicW5YT0NZWkpkRkNzQkthZ0FOZ3JN?=
 =?utf-8?B?Z2pXSjA2UE9aNE1WRy84dkNRcEZoK3hid09CY04wOWpHUlNUcHBlcFovU3Nz?=
 =?utf-8?B?Wk41eWtmdmp5TS8yOVVVbmhSQTY1VmxlbVNnZFhTcFkzNE41ancrOU1pUzFs?=
 =?utf-8?B?Y1hEU2owaGdEcnhibTY3Szg3cXA0dmZVWHpoaG15K2FEMGVNV0Vlem9jRTQ3?=
 =?utf-8?B?U0NlZllzT0tLSUdCR3hxMHBOSkxFNkREVURSbTN6dUo0Zy9MUEtVb0pFSFlG?=
 =?utf-8?B?SElmR0hGcU51c1F2a2Jmc0x4UG0ybk1ia2hzWk5IUGtFS25lbWNrVStGa0pS?=
 =?utf-8?B?azJlcGdMdElmV1JmQ2x0MEVHSytZaU5rVHkxdzU4TFZwREtPSTVGVWMvYUQy?=
 =?utf-8?B?Q1pKS1ZoWGhiWDZYdDN1UEdYWVFyNGpVUmNWdGlFSldNYzJXODBTQnY1REFt?=
 =?utf-8?B?ckVlamhjeEdXWFZZQmJJWXVNNlcrNzhTdHJBRVdMaTdUWVpNSUg1UUlyRTc3?=
 =?utf-8?B?cmk0eldyZWxRd21UT29xM1A1M3J3bTg4WHpIM1EvUk5aZmptWDJGMlRnbGFG?=
 =?utf-8?B?Y0JpOHg1S2dSRVpQOHdJdmNZRlJUdFI3WlFhSEZHUVVRUGdUY1d3UmdaZVEy?=
 =?utf-8?B?cllXaFVCemZKL2VxR3Mrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0c2T095VHhzZ0c0Q2k3NXc3N1FQWHRYa0NiZjFzZzAxNjJnV3VXaHczVWtw?=
 =?utf-8?B?bWFveDBiTHlnaXhBUEJ3YVhmV1dQQVBuQmhnTVhvQXZ2SFRkNDh4NFI0TGRm?=
 =?utf-8?B?SDFweFp5bXRBUVltWkVaRmg2Ym5DTmYyckFQdnh3ZXI3Q3VlTHBsREtHYlBJ?=
 =?utf-8?B?TWdFV3lRb2hYWFZEdE1TTEpNNGgxVHJxWG1XU1pGaGNkT09sWUczUkY5Rlpa?=
 =?utf-8?B?cFR4Ums5SGVzN3FZMGExZWFGRmRZcmRET3lIQkNuWlpUY3dDOG9nYWo3d3Bl?=
 =?utf-8?B?MUdQbklabWc1RmJyRTNkazdtODNSRG5KdXlvdGo0ZXVxaEFvL1VMSFQyY2ZP?=
 =?utf-8?B?dmhsOEJ5N3dXenBzUnN5eU5VbFJKQkZhYSsxcjcvWkZXUW84b2JiRU5SdkE5?=
 =?utf-8?B?OFliTGFZTmhkMVl2c3lndWFpa1o4elA2Y0Jua2orMnluem1LSDhmZ0ZoaHh5?=
 =?utf-8?B?ME5LTXBxa1B0N3VIU1lnRVB6TFl4NE42NFp3RjN3WjlzQWFkN1hja2lQc2tG?=
 =?utf-8?B?bFkwUG01N1NHZk5DczZVRGJuazRqT1NPRm1zVUE5M0kvcHVqZDZTUVFNN1Ez?=
 =?utf-8?B?d01QTnVHSkJRMFdxSXBWZk5LMG5EMU5sMW02OWh3RWVqaHBQN3ZKV1FzWGVC?=
 =?utf-8?B?U2x1ajJEYVVDL0g4dS90clNCbnlITXZZOVJNSXd1MG0rdzkra2Rsc2NjbjlX?=
 =?utf-8?B?OGJyQk9PMFRYelZUL3E3czhpNnpOcEt3eWtZYnYwdnFmb2IxYno0ZWh4cGlB?=
 =?utf-8?B?SVFGbndLM3RHa1g2NkJoQlV2K2J1M1pENjBhZlNaOUJ6S0I3UVhBekpJSUdU?=
 =?utf-8?B?Q0NNdlFDclRTdnkzcE5ObFF5SGg0L3hFbUFLRldkeE96R3BYSExldmUrZld3?=
 =?utf-8?B?d25iKzErMURuZnRNdkdQb0FvbE1nSzBxdlJZNytwNTdMempJbVBtVDNzWExE?=
 =?utf-8?B?SmpJVTJpd0VVYXJubTlZYTYzUGFuYzkwTVd3TFRVSG52MUphakNzMktVaHBL?=
 =?utf-8?B?K1J2Y25YeW5wRWlQckIzS1Q4K2llVzRBQkNvbDZUcGZlbTd5UnMzSGN6Y3pk?=
 =?utf-8?B?M3dBR1l4MUt3bEhJVDJhVlRLUUNwdWh5QWk5L2tDN1FMdUJ2TmdMUzVZQzRY?=
 =?utf-8?B?WFVCU1RqTm5CVkN0Sjdodm12Qnh3aC9vUFN1emFGOU5HQTh4VXJWdFlMNVg4?=
 =?utf-8?B?UWxTMWlhOUgwRGlENWZWWXpVRFJlVFpjWTZEM1BESm1WUVAyVGp3SjBwQ3Jr?=
 =?utf-8?B?YVFxc3ZycDgxMUtWMEVEZXY5SFE4UnZiOXZJUDhCa1lUSCtsT0Z5UWowd3JJ?=
 =?utf-8?B?eVZodlQrWmJTTmRmaGxwcCtIRlVPWDdoRXhTWVVtMFd6U3pCcTRjampQcXNF?=
 =?utf-8?B?OURxTWVHTDdvb1BIKzVHUEtwRCtNakhhRkFNS2hwUG44N0ZETzlQcjg3V2Jp?=
 =?utf-8?B?bHFpN1o4TjNqbGgxNE9ZNm5oeHByVVRTd2ZMN3ljS2ZGQ1I4bkEzc3N1N3dk?=
 =?utf-8?B?dDc1VVdQT0hBZzFsMmVRTnU3VjJDN3BPNEdIdEFmOFFlSTJwTTlvWU9jaXVK?=
 =?utf-8?B?QWRxc2ZGeU56d0VEVENSenFpMk44eDVHb1hxcUZHaEM3MERTbTY0cGZGdGRU?=
 =?utf-8?B?RTlOcXNDNVdESXVjdTBtSFU4QVdtWmNrcnRaWHAxSzdlTE4xV3VNa1FnbkpQ?=
 =?utf-8?B?aFF2Tk1YNGFHRW5rZklHaTNqYjVqNUY3K1ZxY1FKckRkVEtUN09udG8vQm9w?=
 =?utf-8?B?ejNjTnh1Q0NDdW5KY1FaMm5VQnVveGgrQUp5c0xPaCtFN1JOMDFwR1NWSUMv?=
 =?utf-8?B?MUpsbW5aR1Yzb0ZQc05VNEc0cVlNUERiUzYwb2pvV21ITUxvUGIvMTdhZGFZ?=
 =?utf-8?B?RXlUcUJoSC8yMjNoR3pUU1FHc2xVa3NxSHBMTU5iTFYwZ1dwK1VhM0RRZTlP?=
 =?utf-8?B?UTlHZ2xIM3ZPdDJpZ0hKcXp5V0NZWkRWbGxFdDdwMlFvY0EzVWdjZCs2WnhI?=
 =?utf-8?B?aHZLa2NlRkJENUZGSjdtT1dlRFIwTEhzcklkYkRDZmh5aTFIYW1XLzRnTm5G?=
 =?utf-8?B?cGUwNm1XWld4VW5mR0JhSUY3TjNrK3pGeGpjbmdNUWlhY2dZbzBlQkZ4b0Nh?=
 =?utf-8?Q?Gfe82GnXhpeseF/tgSUMyZCX3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc329767-5e97-4138-ca27-08dc9b0e2fa3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 03:14:01.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emmh/xSVPsTJ3t43Qg0QV4aP8utwJIsXBc4t4gz3aSic3VgSDyg4Fek5StXzj08cPcRuAoGXSrXx6Ikrgkdb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7095
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-07-02 23:09, Jesse Zhang wrote:
> Add more cases to trigger gpu reset.
> 1. Using invalid user data to trigger a gpu reset.
> 2. Use invalid shadow program address to trigger gpu reset.
> 3. Use invalid shader settings to trigger a gpu reset.
>
> V2: Rename cases and map them for easier maintenance.(Vitaly)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c         | 35 +++++++++++++++++----------
>  lib/amdgpu/amd_dispatch.h         |  5 ++--
>  lib/amdgpu/amd_dispatch_helpers.c | 39 ++++++++++++++++++++++++-------
>  lib/amdgpu/amd_dispatch_helpers.h |  9 ++++++-
>  tests/amdgpu/amd_dispatch.c       | 31 +++++++++++++++++++++---
>  5 files changed, 93 insertions(+), 26 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index df7d56ea7..12ef7874c 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -70,7 +70,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	amdgpu_dispatch_write_cumask(base_cmd, version);
>  
>  	/* Writes shader state to HW */
> -	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
> +	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
>  
>  	/* Write constant data */
>  	/* Writes the UAV constant data to the SGPRs. */
> @@ -162,7 +162,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  void
>  amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  			    uint32_t ip_type, uint32_t ring, uint32_t version,
> -			    int hang)
> +			    enum shader_error_type hang)
>  {
>  	amdgpu_context_handle context_handle;
>  	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
> @@ -202,7 +202,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	igt_assert_eq(r, 0);
>  	memset(ptr_shader, 0, bo_shader_size);
>  
> -	cs_type = hang ? CS_HANG : CS_BUFFERCOPY;
> +	cs_type = hang == BACKEND_SE_GC_SHADER_INVALID_SHADER ? CS_HANG : CS_BUFFERCOPY;
>  	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
>  	igt_assert_eq(r, 0);
>  
> @@ -217,22 +217,28 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					&bo_dst, (void **)&ptr_dst,
>  					&mc_address_dst, &va_dst);
>  	igt_assert_eq(r, 0);
> -
>  	///TODO helper function for this bloc
>  	amdgpu_dispatch_init(ip_type, base_cmd,  version);
>  	/*  Issue commands to set cu mask used in current dispatch */
>  	amdgpu_dispatch_write_cumask(base_cmd, version);
> +
> +	if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR)
> +		mc_address_shader = 0;
>  	/* Writes shader state to HW */
> -	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
> +	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, hang);
>  	memset(ptr_src, 0x55, bo_dst_size);
>  
>  	/* Write constant data */
>  	/* Writes the texture resource constants data to the SGPRs */
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
>  	base_cmd->emit(base_cmd, 0x240);
> -	base_cmd->emit(base_cmd, mc_address_src);
> -
> -	base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
> +	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
> +		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, 0);
> +	} else {
> +		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
> +	}
>  
>  	base_cmd->emit(base_cmd, 0x400);
>  	if (version == 9)
> @@ -247,8 +253,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	/* Writes the UAV constant data to the SGPRs. */
>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
>  	base_cmd->emit(base_cmd, 0x244);
> -	base_cmd->emit(base_cmd, mc_address_dst);
> -	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
> +	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
> +		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, 0);
> +	} else {
> +		base_cmd->emit(base_cmd, mc_address_src);
> +		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
> +	}
>  	base_cmd->emit(base_cmd, 0x400);
>  	if (version == 9)
>  		base_cmd->emit(base_cmd, 0x74fac);
> @@ -401,7 +412,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	amdgpu_dispatch_write_cumask(base_cmd, version);
>  
>  	/* Writes shader state to HW */
> -	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
> +	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
>  
>  	/* Write constant data */
>  	/* Writes the texture resource constants data to the SGPRs */
> @@ -536,7 +547,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  	}
>  }
>  
> -void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
> +void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum shader_error_type hang)
>  {
>  	int r;
>  	struct drm_amdgpu_info_hw_ip info;
> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
> index 4df8b1355..5f05ee693 100644
> --- a/lib/amdgpu/amd_dispatch.h
> +++ b/lib/amdgpu/amd_dispatch.h
> @@ -25,15 +25,16 @@
>  #define AMD_DISPATCH_H
>  
>  #include <amdgpu.h>
> +#include "amd_dispatch_helpers.h"
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
> -			      uint32_t ip_type, int hang);
> +			      uint32_t ip_type, enum shader_error_type hang);
>  
>  void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					uint32_t ip_type,
>  					uint32_t ring,
>  					uint32_t version,
> -					int hang);
> +					enum shader_error_type hang);
>  
>  void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  				      uint32_t ip_type);
> diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
> index b0a5f550e..6b2e8f39f 100644
> --- a/lib/amdgpu/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/amd_dispatch_helpers.c
> @@ -114,7 +114,7 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
>   }
>  
>  
> -int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version)
> +int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version, enum shader_error_type hang)
>  {
>  	static const uint32_t bufferclear_cs_shader_registers_gfx9[][2] = {
>  		{0x2e12, 0x000C0041},	//{ mmCOMPUTE_PGM_RSRC1,	0x000C0041 },
> @@ -123,6 +123,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
>  		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y,	0x00000001 },
>  		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z,	0x00000001 }
>  	};
> +
>  	static uint32_t bufferclear_cs_shader_registers_gfx11[][2] = {
>  		{0x2e12, 0x600C0041},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
>  		{0x2e13, 0x00000090},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
> @@ -131,6 +132,14 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
>  		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
>  	};
>  
> +	static uint32_t bufferclear_cs_shader_invalid_registers[][2] = {
> +		{0x2e12, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
> +		{0x2e13, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
> +		{0x2e07, 0x00000040},	//{ mmCOMPUTE_NUM_THREAD_X, 0x00000040 },
> +		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y, 0x00000001 },
> +		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
> +	};
> +
>  	static const uint32_t bufferclear_cs_shader_registers_num_gfx9 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx9);
>  	static const uint32_t bufferclear_cs_shader_registers_num_gfx11 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx11);
>  	int offset_prev = base->cdw;
> @@ -146,19 +155,33 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
>  	if ((version == 11) || (version == 12)) {
>  		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
>  			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> -			/* - Gfx11ShRegBase */
> -			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
> -			if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
> -				bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
> +			if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING) {
> +				/* - Gfx11ShRegBase */
> +				base->emit(base,bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
> +				if (bufferclear_cs_shader_invalid_registers[j][0] ==0x2E12)
> +					bufferclear_cs_shader_invalid_registers[j][1] &= ~(1<<29);
> +
> +				base->emit(base,bufferclear_cs_shader_invalid_registers[j][1]);
> +			} else {
> +				/* - Gfx11ShRegBase */
> +				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
> +				if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
> +					bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
>  
> -			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
> +				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
> +			}
>  		}
>  	} else {
>  		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
>  			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
>  			/* - Gfx9ShRegBase */
> -			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
> -			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
> +			if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING) {
> +				base->emit(base, bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
> +				base->emit(base, bufferclear_cs_shader_invalid_registers[j][1]);
> +			} else {
> +				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
> +				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
> +			}
>  		}
>  	}
>  	if (version == 10) {
> diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
> index a129e8e07..7ae88cd78 100644
> --- a/lib/amdgpu/amd_dispatch_helpers.h
> +++ b/lib/amdgpu/amd_dispatch_helpers.h
> @@ -25,6 +25,13 @@
>  #define AMD_DISPATCH_HELPERS_H
>  
>  #include <amdgpu.h>
> +enum  shader_error_type {
> +	BACKEND_SE_GC_SHADER_EXECSUCESS,
> +	BACKEND_SE_GC_SHADER_INVALID_SHADER,
> +	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
> +	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
> +	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
> +};
>  
>  struct amdgpu_cmd_base;
>  
> @@ -32,6 +39,6 @@ int amdgpu_dispatch_init( uint32_t ip_type,struct amdgpu_cmd_base *base_cmd, uin
>  
>  int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
>  
> -int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version);
> +int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum shader_error_type);
>  
>  #endif
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 323284306..00564903f 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -10,6 +10,7 @@
>  #include <sys/sysmacros.h>
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_dispatch_helpers.h"
>  #include "lib/amdgpu/amd_dispatch.h"
>  
>  static void
> @@ -31,9 +32,9 @@ amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
>  }
>  
>  static void
> -amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
> +amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum shader_error_type error)
>  {
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error);
>  }
>  
>  static void
> @@ -125,7 +126,31 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
> -			amdgpu_dispatch_hang_compute(device);
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
>  		}
>  	}
>  
