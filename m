Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F86CCD19A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 03:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265F10E0D9;
	Mon, 17 Nov 2025 03:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ebcRvTGG";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010010.outbound.protection.outlook.com
 [52.101.193.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C283F10E0D9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 03:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/X9GhKrbgquHt/AhzhJZsqsrP/dUxkb8cFAPjYz7nG9z7Ggi3DoDo1LSEh89kjGQXH7x9HTlM5zLGvd2MS0Wabl81MG+lOdYX25ZAGDpC5B4/BTSX/5ffnGLHSGTU8bPRIZOY5Oj9UsAgcYZe01L3jON2SvacPF+fy4osMk6zyoBzULW3dLzrBtOLYyXe2f2rWf8SD1kACkOjfLYkzUHP5YnzZ2yBb7AMdIJOeXtP7I7XknobETPYPrboeU9L6FC+dkzxYQPEAh0QNGZ5oR25N+Lr028VTAeyunowEVGDdVZ/bkX6H2SzP3sFGHDeRqDvhdAFDZev9ndZTyoukUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98mRFvNcYDh/ke7BayvU5RpTVX24jY8ni9r13QLJrAc=;
 b=eGLrVdNdRxj9bVLMRjfKB6xbWmtCikBYKOtlUEaCr+oHb2saqDVgFihi3G7KV3+cuHnAuDuTrwvPzrgMFvZ+hMBXsDMcYM/tlOsI2B2MD6Ih2i5gSNMo+BiyZ1KggtNR/ek2c96r3maACP/uHR4yL/XU27LdvDyQyrjapEKk+Ku6LU8Nm44VvJ3yMFIC4GnCIsM7MHZJ8o1KQar3ek/VWzPPcF6859SuRzuYvuHWHeRP5QjJvo3jND8fWOz2vxy3V+sOZprDIN2ag1WlgTej6kofZSv/LgtG8BKY+6IgQG83H0jYs8hOEtFAGCCrDN4IxIVu4cZLHxIuso0Mwgz3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98mRFvNcYDh/ke7BayvU5RpTVX24jY8ni9r13QLJrAc=;
 b=ebcRvTGGweDGI7bkgFZplL5xT/7cpyXwPFByCJ1yd19rTaBXinzyeBoHEFWqWqjoLOhSMLFtszyhCpnYz9NdWRtOEq/WOR6tXV9w6vn7vCJ9S0AN4E6DYBVZyiCpckY40ByAUcha48Y/UYixxjJKolkc9dgWqJPWAZrM915oOl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 03:11:01 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 03:11:01 +0000
Message-ID: <91f2940f-26aa-44c9-88ce-2da48a51947f@amd.com>
Date: Sun, 16 Nov 2025 22:10:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/amdgpu: Fix SDMA packet handling and memory
 ordering
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20251117030050.552497-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251117030050.552497-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0333.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c5a40a-8765-49e2-5f20-08de2586efeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3lWNVVPaVk3S1VmbngxSk1TMGNhcFJndWtUY0ozUGV0Mld1bGNFRENTVXZK?=
 =?utf-8?B?RzlJeGRPdllpNVdST3NNNW1acE05eWF3b1FmOWlGTTNqdlQ0U3hRSXlnNTg5?=
 =?utf-8?B?aW54a0wyMEhMcjZ1QllBclYxQ3lRa1FoOXFMRWJmenI2VFhuM00wMHFGcWE0?=
 =?utf-8?B?Qmd3dUFxNEhlNS9BcWdUalJnTTZ0ZHYwZmwyV2xCQUV6UFJ0V3hhZ3lQbENJ?=
 =?utf-8?B?WHJ2cVZoSkRZT0NQcUFJSEMrZ0JtNzkxMTkxZ2plVDM4SmdHK0tyY0g5UHdJ?=
 =?utf-8?B?eXdGS2xCOGV6V09RMHI3d2NNMlhiZ21hV0gwek80dGloTXA5RnVCT2d5V3l0?=
 =?utf-8?B?RWxZUC9kSy9nTWZRellhOWwzUCt6aHJvZFhlQklEaE1kTkZ6SDJjQTBmcVVZ?=
 =?utf-8?B?SlhJWHowdjREdGtnVkR1SjdIY0lRamtVNXR3czVKVGJacUZhUnJEaHRMZ2tx?=
 =?utf-8?B?OWJ3ZzBXZ3Qwc084RkMrcjY3bDRCYmZ0VS9nc0h1OCs0bFdPb3VoTURCV0lh?=
 =?utf-8?B?TUVQYUdHMDZsR0pGWVEzb3pUMjBsUnVFNWhEeFhxRC9RandSNmtRak92STN2?=
 =?utf-8?B?emNQQnV6bmp6VmdZRjZoRmtTV1duS29YZTQyL01oZDNpTldzbzhZMGhPQkln?=
 =?utf-8?B?YlNzcHhVTXJIdnFHaGc2dk9zcjlEcjJQcG9TenNtcU1rdEdvbVozdys1V2dP?=
 =?utf-8?B?aGt5aFZnRnJFVUkrVlREQTV4SWhNKzh1ckgxNmRsV2M0OUxtREpWcGV6OGZN?=
 =?utf-8?B?VVVwR2szZlNXTkZ6WHpiaHM1WnUxMVYxMGF3c3BCU1BlbWlhblJFdUZ3NEpy?=
 =?utf-8?B?RjM4dkUyaWQvSmQ5eFoxT2pwZnJnVi8wMThnK2taajF1MFlBeXpTaTMxY0Zu?=
 =?utf-8?B?Mzl0aG1oRGxINzNONUE2dGNnclBtMG1WZ24yY2RVYkxGQlJpV2dXM2E3MlNL?=
 =?utf-8?B?aTJSV0hleUUrNHk0dmtxOGQwNWthcmRMdG00UHY4bEFRSk5TdVg5eDJMOEhz?=
 =?utf-8?B?Zm1zeVJVSU9SN3lYaU0yV3EzQnQ4elpQaVFQaTNPbEN2UnlPYXNHcUp4bU1B?=
 =?utf-8?B?bXV3SnYxNmN5Rk5CR1F3MjVhTHJGSWxYTmszMFNmTkZDZlZVd1l5VHZqeWZG?=
 =?utf-8?B?OVZaMnBRRTMxaU5qUUtmcHl1OHJzY0UyaFBoK3VXRkFZUTh3SlFJRTV5QzBU?=
 =?utf-8?B?Z0lUcm5jMGJsMDhpTHAzK2JzSnNsSk1VV3NCNGdoS3hwOEYwWWp6QW1FWFcx?=
 =?utf-8?B?TXZ1Y09kRWQ1Y1ZBVUpMYmNIRGFDUnVaTEFFK3lKVHRJeFAvSVMzYStVVk5W?=
 =?utf-8?B?QnNwQWpocUR3bDhKc0ZCMlg5RllEa3hUSVp3UmJDK2Z4UG5QWjFpY3JZbzhU?=
 =?utf-8?B?d01UN3Nkc1d1Vm92TnppaDFaNFdEZFFXQ1pnNkVBTXBEMkM1dkZFYVVZSnBm?=
 =?utf-8?B?YmN0Z2VOc080N1dSa2xsNWswUkUvTU5wUG1vSHBlcHh2TlNLcTZzUVJUNjBT?=
 =?utf-8?B?bXFabHhLcGxYR212Rk10dW1vT3dXY3BWT1pZdHFBNFhpQU9lQ2JvVjZRRi9z?=
 =?utf-8?B?aE1aQ1ZocUprOHlGNU5IaUVETVZreGNFb1FkTUNldkI4d3Foc1BnNVhTMlZU?=
 =?utf-8?B?OE9hUVUwbVYrWjRaT1JON0pYUnNxWUY0a2UyTnNQRHhqS0RUY2pJRkUxZ1dL?=
 =?utf-8?B?VW1LcWJxK1FSbzVNdEYrK2RoQTlJRnVtR3V1bi9nQU9UTUwxS2hJbWRFRDZk?=
 =?utf-8?B?ODRhYmxPYmFhSFdkMlUwQmM2NHBrbm9yeXcrbjZTS1VPYmZXREU0WmFxY3dl?=
 =?utf-8?B?QXk4QTJORHBlcUZVWExkb1hXZ0YwZG0xMXhVdFJwWE8vWHRXdGdPMHc2WnBN?=
 =?utf-8?B?ckQ4L2R4WThFcjdQTnNsTFNFLzdDakZQdk1PYWV2TjlCSXAwY3UrZTlrc1pv?=
 =?utf-8?Q?1692NsMnJSnWYw5ZbD9HKIMhQEPeqoN4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytOdHYzeUw2L3lkWDk2RjFyQVZGMmlWbW1aM2VQbFRJMk85L2grZUVNeFFj?=
 =?utf-8?B?SlYydFQ2em1YWGIwTHllK09RQU4ybFEza01naUVvZVl0VHk0eERGN3E5RnZU?=
 =?utf-8?B?eTE3eDlFVUEybXQwVkNxY3lYRjljYkg0U1JZU3hpRXd4MERpaElXNzh3bUlI?=
 =?utf-8?B?MG5xSTdqcWRCeU42RHl4TGRBdzZqZytmNitUUXA4dWNSK2hRdVg1MW0yQk1I?=
 =?utf-8?B?RldWblBLMFl4eWFTYlZmVmpjNHZtWDJrSmw5Q2FQS0k2OHZtL0tTdHB6L2JS?=
 =?utf-8?B?VEM4dHpGOEpWWitUU2F5QWpvUk5zY1NYcGt2RU1DeFdieEtMN0o5R3hEMm1F?=
 =?utf-8?B?bUxRTmU3U1ppbUk5QUZSNExiUGNiNTJvNlFsVjVucmJ0NHJ6cENudTZhaGN1?=
 =?utf-8?B?Z3VaSlZEalpDakVZVHI3N1RlMXdMLzI5MXgvV1Q2cTEyRFhuRUxySHQxbi9j?=
 =?utf-8?B?Sk4xSDhWaUxKUnVwdGdjL1hKMjMvSTJRYkZTNW5NdTFJNEN6Z2pJUk5LbFFT?=
 =?utf-8?B?Z3AzclA3MEpFWDdYRXFIWGNxeVZJMmFFem02VE5rL0N4L1M1RmFnUnppdkFn?=
 =?utf-8?B?b1dXbmo0ekFLNXBsN045VDRSTEtwL1kxcU9nZks2NUJ2dmVieU9jRTVzb2F6?=
 =?utf-8?B?WDFieHloV05nVFB5TmNrRDRPdVgyU1pOaE94bzJHSlZrTWJJbzdhZjNBVFVh?=
 =?utf-8?B?bUthb0NaOEFQWHlxTU1weVpxVVZ5eFdVckMwV28zN3kvMjM4bG5oUTVlOTM3?=
 =?utf-8?B?RFVHTHVGNitoYUpCSEVLbFFqNHM4K1luYkgxYjhMRS9PTnY3T1cyc1J3YmxV?=
 =?utf-8?B?ZlN0Z0tXeU1XZk9SQTJkSk05bzJReUF3Yzg0MWRsSGI0VTNNUXNaNVdlK2hJ?=
 =?utf-8?B?WEZFUGlybTRYcVJheHJqcXZJSVZkd09vUS83THNHeHJ5Y1ZIU1NWT05MQU5m?=
 =?utf-8?B?RXNLQjFwWUJjL3hKRjkrRU1LRXByay9hb2Y1dGxKS3B4cENuZ25VRkYwUm41?=
 =?utf-8?B?L2o3NGVjQ2t3UGdCQWYwcnZqVmtQaUk0UWdkNzBnQlNlRWJkczl3cWFhZEIx?=
 =?utf-8?B?eUphdFZ5dFM1WE94ZSthM3ZNKzhkNXcrL3hGOUZHL0lTTnZwd1Nwc3A4WmFq?=
 =?utf-8?B?WlZnSUlHNHZqZlpxNGE2L3hxSSsrdVFKU2U2ZDhXUHAvOEdWeUwzRzRwaWhp?=
 =?utf-8?B?Mm5qWnY3SW1UVnBueVp4RlVHNGJxZ3d6UTRTRERNbTRJNXMzaWZOaHRhb3FF?=
 =?utf-8?B?SHNUbkZNTWlCSjFsc0hHRnhaZzJlMzlrMTVvWHRqSGtsMTFyQzU5cTVld0F6?=
 =?utf-8?B?ckk2bUxzSkJRTlRjdXp5VU9JTWlwd1J0bUlVbjVEVW82NHc4WlVXZ0lmamg3?=
 =?utf-8?B?NjZJcExxTUkvdDhSWHp3Umo0blhxNHRVSGZQOFRaUE9OUnZKRW9STlpNb0JX?=
 =?utf-8?B?ODlEKzNlRzdWbFh0QmRJTXpocEZ6WEtMNllEZHlxWGhObmFjUnlXdXNCVUxh?=
 =?utf-8?B?TzhDdzk5Q3FFaTNmVjBwbGtVaURwRko0ZVVveWdzaldDY3o4aUR6aTg1ZFEx?=
 =?utf-8?B?NDZQa1JCQnhrd0xEZDRtSGZtS3liWmtFdzJnM2RweHM5eis2bExrRzE0Qmpp?=
 =?utf-8?B?LzdreHlpcDFyb2xjeituWkVUVndjTmtkd3VlUG4rV0ZVMHdoSVBvTHNUSFJt?=
 =?utf-8?B?L0gwYXMrREJKQWJMR1BaakN1NnhubVBBNHhBaEIwcHd3NU9CMzdIeFZjdWNt?=
 =?utf-8?B?K0NoV0k0L20zY2pLbTl1K0gwRWxlbExnaFBzTklnVC9hdzhHcHh1Y1JDREFI?=
 =?utf-8?B?QVZxMUJGbGVWMnJnUW14SnZCOW5NMmlYMmF6VWNrdzFwVm53TkNnUzF1QUVn?=
 =?utf-8?B?MWd2eFRTbUNabTJWSHpod3lTSUtXTzNpQnk3N3pPUjJOemlGQXZXaDlBTHNu?=
 =?utf-8?B?c3ltM2Z2a0VGeWtXSnU5a0pRZ0dkTHF2R09uUHNzMGRxSktTWXlnWGQrclpr?=
 =?utf-8?B?WWJsWmNRTDhDR2NXR2FsSVVObStRdDZlYlR2YWNzQ0NQQWNjMmVCTkgrbDJm?=
 =?utf-8?B?RWhuWUhlbGFTWUYwRlRMdGU0WDZwTjNoZVlFRVRITjQ3WXFxS1RuYjhnR3ZZ?=
 =?utf-8?Q?sa85Dn/9udqRGb0m5OThBAf4c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c5a40a-8765-49e2-5f20-08de2586efeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 03:11:01.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppOVoJzWhIGXXOlXDZLb+OW7Dsfx//+yNhdFXcq/13kolTkFv8gQsV8E1mbhvDTCZ0ApWzBYoTCNh/HX7/QgAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
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

The change looks good to me!

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2025-11-16 22:00, Jesse.Zhang wrote:
> This commit addresses several critical issues in the user queue
> submission path:
>
> 1. SDMA-specific pointer arithmetic:
>    - SDMA hardware requires wptr pointers to be scaled differently
>      (shifted by 2) compared to other IP blocks
>    - Added dedicated amdgpu_sdma_pkt_begin() and amdgpu_sdma_pkt_end()
>      macros that handle the proper pointer conversion
>    - Fixed the SDMA submission path to use these new macros
>
> 2. Memory ordering and synchronization:
>    - Added mfence barriers for x86/x86_64 architectures to ensure
>      proper ordering of memory operations before hardware register updates
>    - Restructured the submission flow to place barriers at appropriate
>      points in both SDMA and non-SDMA paths
>    - Ensures all command buffer writes are visible to hardware before
>      updating the wptr and doorbell registers
>
> 3. Code organization:
>    - Separated SDMA and non-SDMA code paths more clearly
>    - Moved packet begin/end calls inside the IP type conditionals
>    - Fixed volatile qualifier for doorbell_cpu to prevent compiler
>      optimizations on hardware registers
>
> These fixes resolve stability issues with SDMA operations and ensure
> reliable command submission across all AMD IP blocks.
>
> v2: add brief comments explaining the purpose of the macros (Vitaly)
>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 24 ++++++-------
>  lib/amdgpu/amd_ip_blocks.h | 70 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 80 insertions(+), 14 deletions(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 51503f59d..b44c29819 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -591,12 +591,12 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  	uint32_t syncarray[1];
>  	struct drm_amdgpu_userq_signal signal_data;
>  	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
> -
> -	amdgpu_pkt_begin();
> +	unsigned int nop_count;
>  
>  	if (ip_type == AMD_IP_DMA) {
> +		amdgpu_sdma_pkt_begin();
>  		/* For SDMA, we need to align the IB to 8 DW boundary */
> -		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
> +		nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
>  		for (unsigned int i = 0; i < nop_count; i++)
>  			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
>  		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
> @@ -606,7 +606,13 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
>  		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
>  		amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA_SUB_OP_PROTECTED_FENCE, 0));
> +#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
> +		asm volatile ("mfence" : : : "memory");
> +#endif
> +		/* Below call update the wptr address so will wait till all writes are completed */
> +		amdgpu_sdma_pkt_end();
>  	} else {
> +		amdgpu_pkt_begin();
>  		/* Prepare the Indirect IB to submit the IB to user queue */
>  		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
>  		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> @@ -622,21 +628,16 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  
>  		/* empty dword is needed for fence signal pm4 */
>  		amdgpu_pkt_add_dw(0);
> -	}
>  #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
>  	asm volatile ("mfence" : : : "memory");
>  #endif
> -
> -	/* Below call update the wptr address so will wait till all writes are completed */
> -	amdgpu_pkt_end();
> +		/* Below call update the wptr address so will wait till all writes are completed */
> +		amdgpu_pkt_end();
> +	}
>  
>  #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
>  	asm volatile ("mfence" : : : "memory");
>  #endif
> -
> -	if (ip_type == AMD_IP_DMA)
> -		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
> -	/* Update the door bell */
>  	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
>  
>  	/* Add a fence packet for signal */
> @@ -869,7 +870,6 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
>  			      AMDGPU_GEM_DOMAIN_DOORBELL);
>  
>  	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
> -
>  	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
>  	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 67891ded6..c319ded6e 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -38,15 +38,61 @@
>  #define PAGE_SIZE 4096
>  #endif
>  
> +/*
> +* USERMODE_QUEUE_SIZE
> +* USERMODE_QUEUE_SIZE_DW
> +* USERMODE_QUEUE_SIZE_DW_MASK
> +* --------------------------------------------------------------
> +* USERMODE_QUEUE_SIZE        : Total size of the usermode command queue (1 MB).
> +* USERMODE_QUEUE_SIZE_DW     : Same size expressed in DWORDs (size / 4).
> +* USERMODE_QUEUE_SIZE_DW_MASK: Bitmask used for fast ring wrap-around.
> +*
> +* The ring size is a power of two, so the mask (DW_size - 1) enables:
> +*
> +*      index % queue_size  →  index & USERMODE_QUEUE_SIZE_DW_MASK
> +*
> +* This provides fast modulo arithmetic and prevents buffer overruns.
> +*/
>  #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
>  #define ALIGNMENT			4096
>  #define DOORBELL_INDEX			4
>  #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
>  #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
>  
> +/*
> +* amdgpu_pkt_begin()
> +* ---------------------------------------------------------------
> +* Begins building a packet in the usermode queue.
> +* - __num_dw_written tracks DWORDs written in the current packet.
> +* - __ring_start is the starting write pointer for this packet,
> +*   wrapped by the ring mask to ensure it is within bounds.
> +*/
>  #define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
>  	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
>  
> +/*
> +* amdgpu_sdma_pkt_begin()
> +* ---------------------------------------------------------------
> +* Same as amdgpu_pkt_begin, but SDMA rings use a byte-based wptr.
> +* - Convert byte-based wptr → DWORD index (>> 2)
> +* - Wrap with mask to stay within the ring
> +* - __ring_start holds DWORD index of the write pointer
> +*/
> +#define amdgpu_sdma_pkt_begin() \
> +    uint32_t __num_dw_written = 0, __ring_start = 0; \
> +    if (ring_context->wptr_cpu) \
> +        *ring_context->wptr_cpu = (*ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK) >> 2; \
> +    __ring_start = *ring_context->wptr_cpu;
> +
> +/*
> +* amdgpu_pkt_add_dw(value)
> +* ---------------------------------------------------------------
> +* Writes a single DWORD into the queue at:
> +*
> +*    queue_cpu[(ring_start + num_dw_written) & mask]
> +*
> +* Masking handles ring wrap-around. Increments __num_dw_written.
> +*/
>  #define amdgpu_pkt_add_dw(value) do { \
>  	*(ring_context->queue_cpu + \
>  	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
> @@ -54,8 +100,28 @@
>  	__num_dw_written++;\
>  } while (0)
>  
> +/*
> +* amdgpu_pkt_end()
> +* ---------------------------------------------------------------
> +* Finalizes the packet:
> +* - Advances the write pointer by the number of DWORDs written.
> +* - Wrap-around handled by mask.
> +*
> +* The wptr remains in DWORD units (unlike SDMA).
> +*/
>  #define amdgpu_pkt_end() \
> -	*ring_context->wptr_cpu += __num_dw_written
> +	*ring_context->wptr_cpu = (*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK
> +
> +/*
> +* amdgpu_sdma_pkt_end()
> +* ---------------------------------------------------------------
> +* Finalizes SDMA packet:
> +* - Advance DWORD wptr
> +* - Wrap with mask
> +* - Convert back to a byte offset (<< 2) because SDMA uses byte-based wptrs.
> +*/
> +#define amdgpu_sdma_pkt_end() \
> +	*ring_context->wptr_cpu = (((*ring_context->wptr_cpu + __num_dw_written ) & USERMODE_QUEUE_SIZE_DW_MASK) << 2)
>  
>  enum amd_ip_block_type {
>  	AMD_IP_GFX = 0,
> @@ -193,7 +259,7 @@ struct amdgpu_ring_context {
>  	uint32_t *queue_cpu;
>  	volatile uint64_t *wptr_cpu;
>  	volatile uint64_t *rptr_cpu;
> -	uint64_t *doorbell_cpu;
> +	volatile uint64_t *doorbell_cpu;
>  
>  	uint32_t db_handle;
>  	uint32_t queue_id;
