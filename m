Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726ECC55162
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 11:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF6F10EEEE;
	Thu, 30 Jul 2026 11:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQUGX3fT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EBF10EEEE
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785412026; x=1816948026;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KOZdLSN1p3KZr9WZb0SPeBSQjdbYnZMqD4MB07Plrgo=;
 b=DQUGX3fT1xETIRCunZve8TQ07u7S+JPn2OPaxicJdEhIgE/I0iNwJMSn
 di84eiFqCBmB6aXG1a0GKACMr5w3JZ7jH9R1f9X5WkZSfBslp9fHYdVmr
 5lkl69flWvFOMiFQSY5Pja4Mu5nju77UayGHUOaCPb3o8ndU//WvQ6emb
 moKH63lqv3atIyVD2uPR7/YiQ1OGyyLqaKdDhCWTInL2QOCXsDDYfwAm9
 FCuYrZhoFlQzyJMfY4Ne3/SBpoKHomDdJB8MIx4ncN19XI5BEPOBGavIv
 V5gA+2zPMOarUkti7D3LYL8+Hms3wh3XcmMnrwK0OlPu/GsOQH9LV+pbI A==;
X-CSE-ConnectionGUID: dnUUGDhFTZi2S6m0giVWQw==
X-CSE-MsgGUID: VLcb2sjrQYSH2FRE/yfdEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103566586"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103566586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:47:06 -0700
X-CSE-ConnectionGUID: sPmzBlpsS/2XVyUNZTwYcQ==
X-CSE-MsgGUID: d38g9gVCT5C05lvp4TqyCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="256355467"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:47:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 04:47:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 04:47:05 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 04:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i61Bs4YrPW4P+FL9j1KZd7m8bHq0+GqBFyri8XVvSItXSZPPKBRxv1AoWXhubw+1MZCRXDqOajf21FQ1wFQyC39nHKejDZZj1PPp+U8p6pYTL028nJZ5D4Dgaulopfgiv7zJslZtch4VJ8SJ1+U44ZidA90KdB49kwypuH25hlLhviwdvR1OGmmU7vk1vZ2WUt6yhdTk6SRMMWkWK3khZQfbFYD16AxtiOVlNmKw/VvGpB8P58Z5s+SesLQrzTESt5jXdO2UhnBgq+1Qc0KIpbJNids7TLWkOUYD+14rqNUnOoewE9flhU4ZSnL1kcuaLHCt6jDOUh6hREMg1tA1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxUnpa3raBMGPs+cxYtK5Z4zRj7V1Eq6MXuQMSbZ4YU=;
 b=OjprIovhFqROpFmXio3gPa44Y4vZfXDdExildDGmy0j9mrdAHWaELajNLeDkUBgV1b9p8zqDaNHnN1WuPCJOwbsGlGorCIJAUxT4pSUt4gPBhZOb5N9QGI7JfnHaUdEeOGa9dQbK8n9HhA4w0/g0tN+jgjCiEpbfrECmCCH55Xf4Cjm/uhTJvh1oVZruSTWIWEXzsDd7vkgzVwdz/dv2RDswFY0xY2k8DGfnAFxFKTgOQl8PmsmdMq6JnTNi6QHQmslrMlC6v4JJDzQx37JOgtcxEvy4K7J6k4yScYRAzRS8sslbabSPik6gw/4N1XDe0f2FnTLSdyp+1AB1FHtOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 11:47:01 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 11:47:00 +0000
Message-ID: <8c433dbd-a1de-4221-adec-7345260b24e0@intel.com>
Date: Thu, 30 Jul 2026 13:46:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-no-ack test
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260530180502.1773222-1-jan.maslak@intel.com>
 <20260530180502.1773222-2-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260530180502.1773222-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0058.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::10) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|SJ2PR11MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: b48fc9a8-e463-4a57-ea19-08deee304460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 7B9iEghP1HHiFdhLRnFn2X1YPydiBaEY6JynmILKGut7rPqgrtn4v5gwD3lY1QzCxRQmUVkPQ6zyps7KbcTTddpkpjFPchH+FewJPXy2TH8pRQMa6B7uNKeFxcYb9DOXw64vdhNcPk+WjI76u6w0zW4mIsktUpxq2q8fNJQ3JCuXo2S5LP6SQitZ8U8+R4UhfqWB5G12s0MuwKJ9S+VE2HykEJVAp+NLp1G43nS2WeXeMAJr/H5qxXH60uyvXQgI+oIMr8MWEfNc7gjvTaGudzB1G0fFYNLooB6g3FgXQD8rj7zzAFEEyIsXxO055ZZm4rlpx/I/+BK/7Gs7azolPu5BckAadNZJigsAmDCAExVZ97uCW64yS81FwAb7wRnDx9X0jw2T9DIAybVBx06GKLbGMh7hkUwcXMlsjB822z/+Jq6TSINKwE69k99Y7GwqmtMFMPEthPmvtYI+y4Jd12wBLUaxXRlXYxqyCV6BPCxFnbpndroSwF60Fp/NXqjY2wC70BjRm3+06XbE1Qp5SbX58718gWAgcDT92sGgAjJIILPKzL9h4Ga6cda3pwisZdmr45lnN6GrUg8NrNfu4mI/4KCiabXXQnijcPQ08z2o8vbbZnnp2IjbDVGxkJweZF0q+NUx799Fz0KlzXJLvfK/TRDvG2oQjCLKlq7uYDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlQvaFhydHdmV0lYdytOdXVNVEpNYzFkOUtjOUh2YUlONDNoMiswRWNnZmYr?=
 =?utf-8?B?VjlweitFQTlTRkZuTkRUSnpwSFEwL2xiUFlCZDZNVktvVS9wWjl2RWlSWkds?=
 =?utf-8?B?TFRERTh6UVBvaXFrQUtYeE1iYkhReWFhSHhNeUN4NDFRSlJlMDJqRHplSkxo?=
 =?utf-8?B?ZGwvaGpXV083aFVnUGJqK1crUHhIOXAxQkhpOUZsU05UVWhlZWNQdmY4N3kx?=
 =?utf-8?B?bTZTa2ZuYVBFdG5ZRHRLbGFlczdJVXphNjJzRGcrMDlod1VwdS8xQXVMRllI?=
 =?utf-8?B?cFlPeVFmNVlIbGxGUDhBN0JqWkcrL2xhNlNERldkM2N0Z0x4aEI5RGF2eG03?=
 =?utf-8?B?NTFtUDRQb3prbUlTY0dTTk1QK0w0V3FRMjBTQndvL3VKY3p3RDNYbnRmdGdM?=
 =?utf-8?B?NkZKUzYwQlFtQjdiaUJHdDk4SGdsTHJoTTNtNUF4L2JBaDFzZ3daS0hGV0Rs?=
 =?utf-8?B?ZzFncjA1R0NkY3BTQ25Vd2VyTmo0WDB3T0RSMzczWjNBeXpKa1dJeVpwN3NY?=
 =?utf-8?B?MHdJNE5jUFVjdjFUVEg2Y2J5SUhUWC9KR1g0eUZCUXhMdG9GUm5HTFltRXU0?=
 =?utf-8?B?Wm9iektvTW9XMndqU0J3dURZVmpMbWZCbTRMZU9aYTFDajZoTWhhZ1pwZnJw?=
 =?utf-8?B?eGhPM0pMU1ZPWHlldS9aZW0wb3g4WlpWbCsyaWpCcWdPc2h0dE5nR0FUUm5w?=
 =?utf-8?B?Mnl3SHlOSVhjY1F5Sklldmc4b2txVno5V1VjNE5YUVpsMzNHWU9pZUpnUnFC?=
 =?utf-8?B?cXd6YzB4UVdrM29YQ1M1eittQkE4czQ2Q0VoaFZDYlYwaXp1ZVlVZ0ZvOXJM?=
 =?utf-8?B?RkxuR0JYN2I0WmJ1djg2U1QrS3BhK1g3cFNxeTFINFhiQU1OV2lZMm1JZ2pi?=
 =?utf-8?B?OThscWQ5TVZqbmNuR2hBZDg1Vkswb295bHRTWlpUM0x1UUE5R09YWnoxSHdo?=
 =?utf-8?B?aXQ4dndBa09rblVadkZuN3F5eUxIaW9UU1Z4ekdDRnBJV1ZxZ3EyQy8xK0dE?=
 =?utf-8?B?MzEwaWVieUFnNllhb3dNYk9xbHhxakFaK3NmUmZDU0tJelJnRndDWFoyUVl1?=
 =?utf-8?B?SmxwMFd1WnF6NGh1TjB3bUV2R2RCOUZ2dmcwQ3NlcGNROTN5aFJxdDVVOGFS?=
 =?utf-8?B?S08zQU9qM244cEN6YmZGYys1OGxQa0xHMUkxRVIvREh1RHB0ODRmbWxmMHRF?=
 =?utf-8?B?SzRVekFMalNwYjdqR3RKQ1dPRlJiTHRmcWxNNzliK0RmU3gxY0xFMzVVa0lo?=
 =?utf-8?B?OG5sSjBJSmVIVnNmK0ZmaUMydFNkODUyU3lmWk1oY080V0dGSXc3NnNrZEpU?=
 =?utf-8?B?ZXNjcXBTRGRrb0UwZzl0SHlqdHRlSU9LWjdsTXZvdStWOW5ITUdnTmh2THln?=
 =?utf-8?B?SkVyQUI1dW5lRFNIb1BZaXZXdGFMTHJHR1F1ZFJ0ZVBVMVNMTXZieTZBYzJh?=
 =?utf-8?B?VmhYZnQ5RW44NExJR0FVNFJ3T3gyMWVBbGU3dUNRQ3pjeEMyc0lQSC9XM2xa?=
 =?utf-8?B?bUsyT1Y2cy9YM2lFL1d5TTUzNDlLZ2YvV2RDMS8yTjNWQi9MYUlnRjZHMUR2?=
 =?utf-8?B?eC9xZVVMR3BQSEpMZTREbDFhTDBpQ3lNOU1iOTZEaWRlcmxjcU5XOXNvTlFP?=
 =?utf-8?B?QTl5WWh3bnlVMXQ4VE1NQWx6a3VvRk1naDRrcXEwL0IvNWJlTVpURFEyU1RG?=
 =?utf-8?B?djBrdmF3MjVoZlExVXpnOFYzalVzTCs1OUtMMnRteXpqY1cyZG5zMVpCYkc3?=
 =?utf-8?B?Um9zT0c3bm8rcXVDZmlEcGhDUVBPZjFWQVlZdE1xbUo0OUtnRFpITnduemtI?=
 =?utf-8?B?MW51OHM2dnh2ZkNJVXFYZWNCQmEwMlZhTHBZZndsdlJTSWYwUVFQcVFMYy9j?=
 =?utf-8?B?RWxqdFA5SkxwTzIyVXNrMzRrcGE4ZTZXSUFsdHgvV1Y2Y3d6WUdXOXNkS0R4?=
 =?utf-8?B?OXA0QnF2UTg5U1pTbXBmQjB0Snk5NjFQdHFORFh1Z1ZadTZYUTRKNjVzZkZI?=
 =?utf-8?B?a0RtUGVHbjE2R3UwblR2c2U5ZHlUN3NueGFQQVVyS0FkRzJlVnhvaU50RjVy?=
 =?utf-8?B?TlA4TnRqVVMxbXZkSnJOVk56eEYvWWF0S01TVU8yeDhKMkdjWnlJNmtzRkxr?=
 =?utf-8?B?Vm4zMTRYdnpJbkV5Y2RoWHZldTNVeTg2THpPQTRvaWRKQnd2Z3A3b0oyVFIz?=
 =?utf-8?B?aVNOeHdpaEpxV0k3ckkyR0UvRmdUL1hVekp1MVpCZVN4NzNYWlNQTzdFQkRl?=
 =?utf-8?B?L1pWVVFpRnpBaWFWSkkxckwvK0pXL1JnRERaamxTTmJObXE4dko0ZHRGeUR3?=
 =?utf-8?B?REU1aS96OTZXcm05dVdVeVo2WGlLK29vbGNFQ3hSbld0eUJyRHVBZ3YrdWlR?=
 =?utf-8?Q?QRzud80u1W8BEEMA=3D?=
X-Exchange-RoutingPolicyChecked: UbvrbJx24TdcPqf2qlKqMfbPitjGHslmyBrcToRaFqzyJVRp+ojcAxroDkftU/X05aMGsbxXhSkmsd1Yp0gl8R8OYPWeZTmPA9gVZx5uu6r6tniWFrGpvolSHbRur0uss+7M2UlHU7OAiY3579EbUTmLctDiSCj5Tgdv1IgtfcPqnGDgJSwaY41qgJBBWzy0p08wFJ4v3UCVgKcfkOZITm4co6NXpMtMAq8/EAmyQpC6NnRpenGlh6pPBW/IqHInymEtjMuF3YZc1BxVmBOPG286cfXxbyiT3pCpGMZqTh2NAVWThTCx+Rqusj7+fIymcKz+cyrW+m98/JaD+BQViQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b48fc9a8-e463-4a57-ea19-08deee304460
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 11:47:00.9130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TkI84La7n1QqqJtYtxw2W2qcoaOFju9/HGoYJBE24JCo79+npub8uOkMcMJjBOdsg9eseqImaPsFU8MLRVMB9OUyYrV5VmHB7cizyyvBRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
X-OriginatorOrg: intel.com
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

On 30/05/2026 20:05, Jan Maslak wrote:

> Add a test that verifies the kernel correctly blocks unbind operations
> on VMAs whose VM_BIND ufence has not yet been ACKed by the debugger.
>
> The test performs N vm_bind operations with user fences attached, then
> partially acknowledges them: the first (N-2) ufences are ACKed
> immediately, while the remaining 2 are withheld. It checks that:
> - the ACKed ufences complete successfully,
> - the un-ACKed ufences time out as blocked,
> - unbind attempts on the un-ACKed VMAs are denied with -EBUSY,
> - after the remaining ACKs are delivered, the blocked ufences complete
>    and the unbinds succeed.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug.c | 150 +++++++++++++++++++++++++++++++++------
>   1 file changed, 130 insertions(+), 20 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 6f5103a194..f088be4797 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -66,6 +66,7 @@ static void test_sysfs_toggle(int fd)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 9)
>   #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
> +#define VM_BIND_UFENCE_NO_ACK		(1 << 11)
>   #define TEST_FAULTABLE			(1 << 30)
>   #define TEST_DISCOVERY			(1 << 31)
>   
> @@ -1931,6 +1932,9 @@ static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
>   }
>   
>   #define STAGE_CLIENT_WAIT_ON_UFENCE_DONE 1337
> +#define STAGE_NO_ACK_READY_FOR_PARTIAL_ACK 1338
> +#define STAGE_NO_ACK_PARTIAL_ACK_DONE 1339
> +#define STAGE_NO_ACK_FINAL_ACK_DONE 1340
>   
>   #define UFENCE_EVENT_COUNT_EXPECTED 4
>   #define UFENCE_EVENT_COUNT_MAX 100
> @@ -1980,6 +1984,74 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
>   	}
>   }
>   
> +#define NO_ACK_HELD_COUNT 2
> +
> +static void client_wait_ufences_no_ack(struct xe_eudebug_client *c,
> +				       int fd, uint32_t vm,
> +				       struct ufence_bind *binds, int count)
> +{
> +	const int64_t short_timeout_ns = 500 * NSEC_PER_MSEC;
> +	const int64_t long_timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
> +	int64_t timeout_ns;
> +	int err;
> +
> +	igt_assert(count >= NO_ACK_HELD_COUNT);
> +
> +	/* Signal debugger that binds are done - it will ACK first (N-2) fences */
> +	xe_eudebug_client_signal_stage(c, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
> +	xe_eudebug_client_wait_stage(c, STAGE_NO_ACK_PARTIAL_ACK_DONE);
> +
> +	/* First (count - NO_ACK_HELD_COUNT) fences should be ACKed already - expect success */
> +	for (int i = 0; i < count - NO_ACK_HELD_COUNT; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = long_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, 0);
> +		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d completed (was ACKed)\n", i);
> +	}
> +
> +	/* Last NO_ACK_HELD_COUNT fences should NOT be ACKed yet - expect timeout */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = short_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, -ETIME);
> +		igt_assert_neq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d blocked as expected (not ACKed)\n", i);
> +	}
> +
> +	/* Try to unbind un-ACKed VMAs - kernel should deny with -EBUSY */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		err = __xe_vm_bind(fd, vm, 0, 0, 0, b->addr, b->range,
> +				   DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0);
> +		igt_assert_eq(err, -EBUSY);
> +		igt_debug("no-ack: unbind #%d denied with -EBUSY as expected\n", i);
> +	}
> +
> +	/* Signal debugger that we verified the blocked state - it will now send remaining ACKs */
> +	xe_eudebug_client_signal_stage(c, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +	xe_eudebug_client_wait_stage(c, STAGE_NO_ACK_FINAL_ACK_DONE);
> +
> +	/* Now last NO_ACK_HELD_COUNT fences should complete after debugger ACKs them */
> +	for (int i = count - NO_ACK_HELD_COUNT; i < count; i++) {
> +		struct ufence_bind *b = &binds[i];
> +
> +		timeout_ns = long_timeout_ns;
> +		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
> +				       0, &timeout_ns);
> +		igt_assert_eq(err, 0);
> +		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
> +		igt_debug("no-ack: wait #%d completed after delayed ACK\n", i);
> +	}
> +}
> +
>   static struct ufence_bind *create_binds_with_ufence(int fd, int count)
>   {
>   	struct ufence_bind *binds;
> @@ -2031,7 +2103,10 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
>   						&b->f, 1, 0);
>   	}
>   
> -	client_wait_ufences(c, fd, binds, n);
> +	if (c->flags & VM_BIND_UFENCE_NO_ACK)
> +		client_wait_ufences_no_ack(c, fd, vm, binds, n);
> +	else
> +		client_wait_ufences(c, fd, binds, n);
>   
>   	for (int i = 0; i < n; i++) {
>   		struct ufence_bind *b = &binds[i];
> @@ -2154,6 +2229,13 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * Functionality: SIGINT
>    * Description:
>    *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
> + *
> + * SUBTEST: basic-vm-bind-ufence-no-ack
> + * Functionality: VM bind event
> + * Description:
> + *	Verify that missing debugger ACK for VM_BIND ufence blocks the application.
> + *	ACKs only the first (N-2) ufences immediately, verifies last 2 are blocked,
> + *	then delivers remaining ACKs and confirms client unblocks.
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2176,26 +2258,51 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	xe_eudebug_debugger_start_worker(d);
>   	xe_eudebug_client_start(c);
>   
> -	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> -	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
> -			    "missing ufence events\n");
> -
> -	if (flags & VM_BIND_DELAY_UFENCE_ACK)
> -		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
> -
> -	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> -		filter = XE_EUDEBUG_FILTER_ALL;
> -		kill(c->pid, SIGINT);
> -		c->pid = 0;
> -		c->done = 1;
> -	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
> -		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
> -				XE_EUDEBUG_FILTER_EVENT_OPEN;
> -		xe_eudebug_debugger_detach(d);
> -		xe_eudebug_client_wait_done(c);
> -		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +	if (flags & VM_BIND_UFENCE_NO_ACK) {
> +		/* Wait for client to signal binds are done */
> +		xe_eudebug_debugger_wait_stage(s, STAGE_NO_ACK_READY_FOR_PARTIAL_ACK);
> +		xe_eudebug_assert_f(d,
> +				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
> +							   MSEC_PER_SEC) == 0,
> +				    "missing ufence events\n");
> +
> +		/* ACK only first (n-2) fences */
> +		for (int i = 0; i < UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT; i++)
> +			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
> +		xe_eudebug_debugger_signal_stage(d, STAGE_NO_ACK_PARTIAL_ACK_DONE);
> +
> +		/* Wait for client to verify blocked state and unbind attempts */
> +		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +
> +		/* ACK remaining fences */
> +		for (int i = UFENCE_EVENT_COUNT_EXPECTED - NO_ACK_HELD_COUNT;
> +		     i < UFENCE_EVENT_COUNT_EXPECTED; i++)
> +			xe_eudebug_ack_ufence(d->fd, &priv->ufence_events[i]);
> +		xe_eudebug_debugger_signal_stage(d, STAGE_NO_ACK_FINAL_ACK_DONE);
>   	} else {
> -		ack_fences(d);
> +		xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
> +		xe_eudebug_assert_f(d,
> +				    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC *
> +							   MSEC_PER_SEC) == 0,
> +				    "missing ufence events\n");
> +
> +		if (flags & VM_BIND_DELAY_UFENCE_ACK)
> +			sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
> +
> +		if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> +			filter = XE_EUDEBUG_FILTER_ALL;
> +			kill(c->pid, SIGINT);
> +			c->pid = 0;
> +			c->done = 1;
> +		} else if (flags & VM_BIND_UFENCE_RECONNECT) {
> +			filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
> +					XE_EUDEBUG_FILTER_EVENT_OPEN;
> +			xe_eudebug_debugger_detach(d);
> +			xe_eudebug_client_wait_done(c);
> +			igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
> +		} else {
> +			ack_fences(d);
> +		}
>   	}
>   
>   	xe_eudebug_client_wait_done(c);
> @@ -2889,6 +2996,9 @@ int igt_main()
>   	igt_subtest("basic-vm-bind-ufence-sigint-client")
>   		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
>   
> +	igt_subtest("basic-vm-bind-ufence-no-ack")
> +		test_basic_ufence(fd, VM_BIND_UFENCE_NO_ACK);
> +
>   	igt_subtest("basic-vm-bind-discovery")
>   		test_basic_discovery(fd, VM_BIND, true);
>   

Basically, looks good.

My worry is that this only verifies 2 + 2 scenario. Should work in general.

My thoughts were to have this permutated.
Something like:

nack, ack, nack, ack

nack, nack, ack, ack...


Nonetheless,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


