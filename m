Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593FA1077603
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 18:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA310E481;
	Wed, 18 Mar 2026 18:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eKPIrCl4";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C567110E481
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 18:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekWSuZVd+U2Bdek8s265nbBmXcnuWJlRaU4YlAhGlL4g8feQWOAsULT0jgXtJs4bFR6vzZJTpqV7vSwDQ9nNs708CYahwswor2OVN26ykpAiMm55FwnJmrpZ6WlZCNZ3HFfW6QwZVQ3JJcpkI14MFZqx+QRAsdaxOXdqWVTHtQj45W+yuYboEFEcTc7RE8+ba487/vck9rbI7Sgxm7p8TkUYgGd7EZe61aHi4dmJKr46+7Bd4CMmL/hPpeSnLLM93cy+OCYYitDGssRG45WuOitva8X5/a8GZsfpOalXhg4Ol9HbDg8+61eOJBxS/19SykgAUG+WPhBRhzmSb30cTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A90Va/YC1OSN6AZRDV4yusQdduBUT5A/eUR9X+QDKDg=;
 b=My+hrdWehyiHX9ZaV68HNgwcB4R0nklcquo4QqcKyyqOHuOe/Aend5bA2YmA59eUQ1NFdjjU/2fGEI/JnaG2ENytiJxl7sw6GjoBt486OhBfEQkCHJk6LUsf67JTI5ZdNM/JSKwXTlb1YtE+DpjO87sWkDbzzBSEIWQtWhxu5waDNKzGioCTojrV7EY87Jm/XZdX2JKOp+clSh++hchF0Pc1XxLK9gAfxr1Mornj706DIXNzVIrz0TTMNRee63d0wkA9GRJAz/3uD2pF0v6f9q+cXaZPkQ25+JCw7QN/mezPuR7eJ4axFVtbq7nVF803LVp4UEsba1jR3AvnecEsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A90Va/YC1OSN6AZRDV4yusQdduBUT5A/eUR9X+QDKDg=;
 b=eKPIrCl448Mon6ASOXQIz7HCoy3OUsXWRyPaLtPoNl2+2MkUP+ULrWMilDERUzdVHyOHBxuVKgy1vJ9MkPyIcx+c0aS/K+jfjs/4Cb6MhjQCx66xYIeC5YPXiDd6bFQkoHPgvgwQAWbFFES5b+mTgzVYjZl5qc8JR8jr+UHjhv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 18:40:38 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 18:40:38 +0000
Message-ID: <1620f56d-c574-4bb4-a843-6696f2db3d4c@amd.com>
Date: Wed, 18 Mar 2026 12:40:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] lib/igt_hdr: Extract HDR helpers into igt_hdr library
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: wayne.lin@amd.com, Mark.Broadworth@amd.com
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <b2afa0a7-95f8-4f28-b95b-9504cff26fad@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <b2afa0a7-95f8-4f28-b95b-9504cff26fad@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH1PR12MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 136e26f6-0194-4a4f-d846-08de851dd97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 7tKKqlhwWeg5GKK0dB4G/jSYos4eU+v65mPBOFViAkjeBy3iEjLd0YMut4naYblSqfVKYsMcmVrfqU027xNhNeMfl17ALKYBciPcfliRPlcOxV+CDfyup6XMUoKrNpPLBNwzZsZNui5ihIxO6lAaEJ2BXzMgtl/zERSVXJIji6qXlTPrKYagbV1A7SVUB8/CfDg+4dEQeN3X1XkSNikrsnbfXP331wECK1qsaSk8ssKF7PqopHVuuGN81QHVE4n8oGtvUsDCF6fVOcTUavTvI29iH1aopJjw1V8kKy/ajl7u1aTyPkc00mdAQ3Q6OZ1ba8OpGZMuX9oB86Yeztkhc6BUKhn5LNMecybAFTyYjTbwenN1b5WNUgCVIQ5X5yaYJz9mNi4qJbW1nw9W81gwxbjPjghT66wMrLdWVkdTLljIUNdL4MXlAWnwcgY4itCzkahg5BONLQtm+fcDBN9wn1Hm9YbCkc6U5AIkrJjZsG9fGJetolahbyw1ArfRaA/y1d5Z4kq/iacYp6Kndut3ADDzewvQ/KtxX8A1mjcafzD5aAuKQV+BmBIZxDXEIECsmsi35ZIR5vVkRnDGeVrDUe9SO9Ei5q9s2C4e/wDDCwHMa8TLChnLdD/09cWKxpPfj5yAAvyUArmsR+kMyyP9zDLXc0MxHp83OTtcYwloGaTAC7e/mQFnH9ZkihO5TkmC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDMwRjl3Y09DYlhORUJiaytKWHdyUEtxN0NtTUtSZnV3dXkxMm13WWFnVEh3?=
 =?utf-8?B?VHNoc3FCb0N4dFIrakdsdWpFaERLc2hvRndGaVJzczZCeGRtMk1YZ0F1RVdt?=
 =?utf-8?B?d1JNQ0xxRjdvVUJ1eTMzSTdId2lCRHk1OUVlRWN1dis1VmpNRHY3cWg4c0N4?=
 =?utf-8?B?SERWelRFc0Z6Z2hkODhyTFdRQTgzOXF1a1pLdzZnZlZVMjFVUGluQ3VZYW9I?=
 =?utf-8?B?aGZWcGx3NG5PMVhqWFVzY0U0SlYxQnNWSVdEYkU2RHVuMndrZHVHbjJ4NHIr?=
 =?utf-8?B?ZjFmTk9LU3V1TGxkTEsvdklxaVVhTkpKc2p1OUNTbDdCNEhqbitMWXlCYWxG?=
 =?utf-8?B?cUpKdGpPZzdTejYvbmM3VUxYVFZwdVMvMGo1d1ZWaUpMVXlJNjFic0E1SllY?=
 =?utf-8?B?MG82TTRKSzk0d2UyQWhHeGQ1c2xHYzdoUkxWa0c4OVBER2dGTDdHMXZBQ2xh?=
 =?utf-8?B?OVBTYitqNmw4emVUcG5qNXl3SEY0elM1L2FFaGQ3dldEZ2V6TXVQMGExNVVB?=
 =?utf-8?B?WmlsWXNJQks2Myt4MlVRMEc0QlpPdVN3R0c4UFpuaFhESDhQNGFremlFZWMy?=
 =?utf-8?B?Y3VLRTFxc1dWclpnL0ovSlhNaEx0RTlYam5QeGlUN0dmSDRWd2FucVBsWHlV?=
 =?utf-8?B?ZmZUUVcveFJ5bXpvYyt1TWdIbjZEWDE2akVxYlV5Y2FzWlJQL0t1b3JqODNU?=
 =?utf-8?B?SWs5YWtzcXNZam5yb3hZVm55TmZSQUE4MEhYZU84dnNhbG0zdTRHcjdMY1ho?=
 =?utf-8?B?ckxVMFJ4YTdxOVQrMjV5aytEZzZ1djVFM2hwQ09ORkNPOG0zREJhMlRDSnVB?=
 =?utf-8?B?QWNMdS85bzNEd29ERmpwQUZMTUpCeFVRZnpyblpXOHVmbWhIZWE2OENGRzJK?=
 =?utf-8?B?bG1pV21ET2diY1Fnek5vRU9zSXVIT0tJTWYrdzhSc2E2Q1JDdnhDSUdtOG1E?=
 =?utf-8?B?MFR5bGxNZExOYmMwZGlSUjNYWEF3eU5hR3BBVWsyNy9aYm9Bcm9aVHJ0QkpT?=
 =?utf-8?B?Mk5PeE5NdlFneHlObkJGQXFiV1poeit3a0g5N0NVRjA4MUpRaHB5K2ZIeERB?=
 =?utf-8?B?a3ZGejBkUkFhVkUvZWJYaHlXUHk3ZjJVdG9FTzRKMEI1Mmc0N09sZ0hSYlUv?=
 =?utf-8?B?TWlvU3BKaXo4MmhTOUxweW51N0haZkVMdllPbWNVTUx4STBpV0pLMUMzdU9W?=
 =?utf-8?B?K3lFbTJWMDRiN29VWUdUZzBRb010cUpXWW4yS3FHQVQ1cW83TnpGcDNxL1ZY?=
 =?utf-8?B?THNoQkdFdUxXV3hzMnVQaVRQaWRrZjlvRTBrS2Z1YWt1Q01TY2hLdzh0NFNE?=
 =?utf-8?B?LzFEYzg2WHRORXFnMURiQ054T1Aza01xTnVFTWpxaGFxMHNFUUh4YXBEM2hy?=
 =?utf-8?B?S0RlM1F5bG5WejlSSnJBbWQ5REttQWpjOGJxRzlmRWgxMms2SHhMcVF6WGFl?=
 =?utf-8?B?Qk9RNzVwRGhZWDZtT1QvYUVWQmxNMFdJZ1k1anRyOHRvNWlKOEU0STRqUUR2?=
 =?utf-8?B?cWZsTDJ4R0VmYVJwTkZQMzhmK0xXbHZOVGMyUmZ0OFNnZW51cDNNTDMyMmsv?=
 =?utf-8?B?K1BPc1NSaXUvOWdRY1FFRjE2d0pmVlFTbGZKcm5Vb0NhcXlVMzBndWlKaHJ1?=
 =?utf-8?B?L3VEYURNc1pydEZaMmZ1T2ptL2tsNjVVMHhFOG4ramxxUlBSRVJiVGkyZjh2?=
 =?utf-8?B?eEs2RXMvc2htaldmdGhFNytJOHBCUlZaQkFPYUw4RHYyQXlLOFkzZC9lN1lP?=
 =?utf-8?B?RXhZSUJZSFcwaEJXeTZhOXJNUzFnVm45eU14NlBsRUVRa29LNDZyeWRFUnJp?=
 =?utf-8?B?cXJOSFN1cnVJUVRzeE5tNGRoR0VDM3Vqck4yTXUrbEowdGU3Qjc4bENDamcw?=
 =?utf-8?B?VGJBaFlPQms4NGNzYW11Ulp4VG96VWdyZm84MHUxeDJqcDlKSGJaeDJuVHJQ?=
 =?utf-8?B?RjJMb2pWdVFtbG1zeWtoY0VKcTkwekVkNWJXcW5SenhlV05jNXJtUzcxRktP?=
 =?utf-8?B?NDFxdktPc0cydlBCOGVyZDZwS1JoSjVUb2dOR1NlZlR4RDdzSk5hbFdXc0xh?=
 =?utf-8?B?TGw0aEtmdDNUS2NQaE05N0hMbVY0MGx1N25sMFd0MTh5OUwvTDQ2dGpXWGVH?=
 =?utf-8?B?UkRkS1ZGOGZRQVJPcEp0dWVFVFFaYUFXWkJDYUlqckd5M0c4UnRYU3ZLWi9x?=
 =?utf-8?B?a2ttUmcxdzdVT2RBcGNFNHNDelBaNzhBeGhLd1c3cnM4V2IyTVVjSEJqbTNr?=
 =?utf-8?B?T0ErU2x5WjBMSThCeSt6bnpvVkhaQ1k5SE01aFE1a1dFaDFtcU5ER3gvTVlv?=
 =?utf-8?Q?BtCuFPZo7F8UDPRfar?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136e26f6-0194-4a4f-d846-08de851dd97a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:40:38.4008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSiBVOJLmY6Fx7g69GlgjysX1P+KMRyJpQZCuNZpGRt90ZjoLIHvhRBw44y9bxc21+dgzvEwa2n23JYqEKzY9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599
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



On 3/18/26 01:34, Sharma, Swati2 wrote:
> Hi Alex,
> 
> We already ahve patch series to extract HDR in separate lib
> 
> https://patchwork.freedesktop.org/series/158425/
> 
> Series is reviewed. Need to fix CI regression.
> 
> Can you please add your patches on top of this?

Sure but this series won't apply clearly on top of IGT's master now. 
There are lots of conflicts and one of which is from change of pipe->crtc.

Will you send V3 to address it?

If possible, it would nice if you can integrate my patch 3 
(https://patchwork.freedesktop.org/patch/712423/?series=163396&rev=1) to 
your patch 1 
(https://patchwork.freedesktop.org/patch/696737/?series=158425&rev=2) in 
V3 since you are moving this function.
