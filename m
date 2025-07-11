Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46276C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 08:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE4210E9CE;
	Fri, 11 Jul 2025 08:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkPox8tQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673F010E9CD
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752221510; x=1783757510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1mZpWi9Rk84cxi3NmBwPObMXxxe9T/QdlLoCLwWHaPs=;
 b=SkPox8tQS7xf3OZ4uxxNf/hGSJz47l7t4KHfi3P+dmup65/PCKWpNLSI
 gRaZc2/bRC471on1+I9/EfABPW/DGn3ejHXm2FHj3zCnYS0RL4zAIGQq/
 Y6seFh0S0vCl2BK4ZU1ktIGHFhYQMgJEc+fzGPjJsPL54EuNC56MTiOy+
 OEjNLdTAATvd9KSjMJFtDexEPkInyZ97hu7nj3luAdWjhOsluT6xlAPDO
 wSb4N7A88lKtY31BZGGTSudRyqjMdcG/bXG3owtEHqKRjplnWPA1LeuHW
 wzalFNVfg2OZEEpM9EyaAZezxmLXf29oD3Jp4H6IWsBpPpVCiO5wKPYjf w==;
X-CSE-ConnectionGUID: TLKkqp3iTnCvth6e6599tg==
X-CSE-MsgGUID: 0ou59018SiiHoRusEkzUdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42145781"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="42145781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:11:48 -0700
X-CSE-ConnectionGUID: 7u7yo+sMQFKi9QJVKpAjWA==
X-CSE-MsgGUID: fWtGsL2jSN2io8d28ROvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="155719972"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:11:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:11:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 01:11:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emAyzNpure3fKPK1LvoGpZxN3SBmimoMnGpx9bW9wEhAFEs8Ti8R1ja8eSIvqIlFUVF9x05c5K/HzhPylem7SKqAl1/9p+oipznbkcN0Mpcs9AKsMHxU+ZJd8JlT+ZUgXu06fe4SoytzihbHFByiqSljSEVmFq+GhEdB7gTFaW/HuQvobtmZqkLhqqmdjyjz206c2P44VIujuS67LltnHpLup9HPgmbnm/BAqWZZ12mkPv2WDuWt0kp/iUW/q9ofjgzW8OSTR1EoxpuoQg9fxnEmVKR7xF3Z0P/iN5PxrraqZVYwtwuk21EP5dN5ghH4oEMVBRg+PvY8Nz5WBVV2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JE0Z4wkbMz3zrFzAuyl4MeF0jpC4xm7K/ZFsvQ/skU=;
 b=XN8z6ORxZPW5m09yebfwfGWRB+sZcb0Ic4PZ3z9BQeesnLKcN1BSoQj5GW0b+nUC9P1atDjjAqdzKGdVK7UPsxaVHx1v0TwbiWJCAieolJMzvQuQRl1dp5Xae1IIEglGHdAGgRWLmk9wiFRDGvQg9QbeMH4F+QZbpYFFk8RcJ67SUGRJzxgpl8tLTHuTZY/JbLCL0ZcaQOMJ07e8a3BKBR1tD1IKVrPtEk0K23N1Ra1/Cf+SdYFfhWJLhpCUjPq0aMpDu7IMHwfx2RP7I4q2mgQbIvznvMzfdev2FsbNPRRJukkjDU8RTmLAByIJFehD+Ko4dnoL9s9ED75aXSzHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 08:10:52 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 08:10:52 +0000
Message-ID: <068524e7-f373-4a82-ba79-9c7f6aa9018f@intel.com>
Date: Fri, 11 Jul 2025 13:40:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: Optimise plane cursor
 behavior on simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250710143913.1208675-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250710143913.1208675-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::32) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc30ed1-6d68-4b50-59e8-08ddc0527404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHoyM0gzVklxSlBRQXRWbzNnbmxETE9ZbEI5RThmSmZKSFRaYmVFOU9rWkg0?=
 =?utf-8?B?OEt3a29qKzU5UVRoZ3Z2NG5UNUJBdFQxaDlwVUpGSjFvTlBmaC95aXpJbnBi?=
 =?utf-8?B?bFJ3WjZHcHo3SGM0VHA0UVArSmsrL3lrQWlYM3M2YjhVSExwWUdsZXJEYUZw?=
 =?utf-8?B?cHh6L3NlWHdQVmRxZ0FsQkV0MWExelhxWVpZcC9oTEQxSGxHd0MrRTI4TnE3?=
 =?utf-8?B?L2xnbWFrZmJ4RUxOODluMzI4c0RZR0dZdFNvaUg2VjRLWG5XRElhTkdrcWsz?=
 =?utf-8?B?eFlnNG13Q3JDTzMyZjR3NitDczFCNEwxZEhlci9CZUFidW5vQTZwYVEzb1BU?=
 =?utf-8?B?bWNpOG0xMmZ1dXVlS1VTdUdsQ0xaZW1hNnhCVTBiaU8xeUkvckh4WWtWT0JQ?=
 =?utf-8?B?aStGMG1ZY2Z1dzlSa0pHUWcrMTBFUUNsaWdQZVhEV3hkcGg3RHNZUjNaRFl2?=
 =?utf-8?B?T1Zib1FJeUxWdGx2bGJMWU1WNENtSHMreFlUQUVFRmJaV2hWdHhoRFd0cUFX?=
 =?utf-8?B?ek1kSVhETkh6SHppeWZWL2tabXRSeHhKMjkxR1JtNlBwZkRnMnRqdnlFeVVx?=
 =?utf-8?B?RWxaRGM2WlBtTWV6SFRjZGZZTVVaR0RRanpVQlJaK0xFNnl3SXQ0SllTamhk?=
 =?utf-8?B?cEplUWVBdnhnOCtsWExtZWQwWC80WHlMVXhjZDA1VU96NE50UFpoYTVqd3Rz?=
 =?utf-8?B?bUtUdTZYY0M5QXRhNEZpMjFNZEJJd1hBYzFHZndMVGVKU2Z5RmQ4eWZVQWl4?=
 =?utf-8?B?TEdSUXA4TjcrQlJ3bTVxUE5ISUxYNWJZa3lPWFA1cnQ5c0VOU0psK2hrOEYw?=
 =?utf-8?B?Q2dIV0owRVBrQnd5QlhvV3dPdlNVQjhLV0d3RWVQY3FRS2E2QlA3ZFZXbmR3?=
 =?utf-8?B?SWhDNXU0VHBxUlhVSnhCR0hoMTYyV2tmaDdXUlNJQnhmUURlTnZNclF2UGNB?=
 =?utf-8?B?Rm81dU8vUWFTRTgvdWdNNTdpelJoVVFXMjUxbDRJNk5INjNKWXJhdFhCNlJz?=
 =?utf-8?B?M2Qzdy9ydDZpejFWeHkwMjJBMmhwWGxGQ3Y0dm55cFFGUGxCWlpzQkovVFZ4?=
 =?utf-8?B?ZXVzeDlzdmhMeEpZeVBKVG54ckVzKzBqSjdEK0l3VWdzM3NqMy9kV1F4Vklv?=
 =?utf-8?B?aXhzRnY1Zms3VndndVhvdVdCR1JINEhueURGSUMyS2tVNkJCZTJTa1IzM3Ru?=
 =?utf-8?B?UVR6TzRkWFg4aWpqM3ZpeXBEcGoxam83Sm9LTEZTdS9CRDB5VXNmTkFESTN6?=
 =?utf-8?B?UHFFc2E1TFpJekVCMlpoaVExQzNTOXNDT2daa3RBRGFUM1M2WENNVmVDSGhz?=
 =?utf-8?B?S0hkcFZvUzl3UFUxUVl3WldweVI4ems2QmErZWRUa1lBb2lUZmNuZDBubXBT?=
 =?utf-8?B?SmtyRERQbEg0bmF2WFBSWE1kbVk4ZjdsVkExREZORWpWN1JxcWcwMjZ5MnRi?=
 =?utf-8?B?M0RMb1VxaW5ibThwM05Kd0wzWlJkdlJvL01xWGZUazM0SlFXYzNMTXh5R2dR?=
 =?utf-8?B?ZW9VYjY0MlFZUDcxQmRKWlFlSEMvY1E4ZVRSdVM0YWswQ2hQQVJxSTZvbXBz?=
 =?utf-8?B?a2Q0RVJEeUg5YkFRL282N3kvZFZGTWtueGNMM0JTenFMcGVkNHV0di80eVd2?=
 =?utf-8?B?YlZwbWZ4UGtzZTlrdmJRVHBxMXdmTTM0cEVjVDArZWorWlRmeG1Ma1F0RmVT?=
 =?utf-8?B?RUlweGRtM1Rkdno4VmNUcnpLTHhOcHBhTkZsTEwzLzRjTVdVa1UrbVNRcHdL?=
 =?utf-8?B?QmdnYmViOW5CUjhFZSs3QUxsRUhIQ0xLb0c4dDdVdUY4RlFDSGRBbUtJZlVG?=
 =?utf-8?B?VXE5RkJGYXNGODNmQTFyTTR3K3JlakRtNTl3OHY3Y29HN1lKRXRqUWczZ201?=
 =?utf-8?B?NXNwZDdVUVRIUnhqYU9BdVpOb0djZ0JlSnJ0Sk9hRTY1Z00vM2J4UzZjcWFX?=
 =?utf-8?Q?pUBNtiKASYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEE4N2s3U1NqN0FiSXczM1N0c05jQkl0dmVsMHNrSXRqRGZzbHhSODhMMTNM?=
 =?utf-8?B?eGJKYkNVcW5VU2tvOGJqY0NWbEhxYmZpMmIwU3FBb2RTbjBTdFFvUkZ6Nm1N?=
 =?utf-8?B?RzJSd25DUC9DU2krMnYrclJVL25LUVppbnlnbEgzaEc2Z3Uxc2ZxODRKaTdx?=
 =?utf-8?B?anlTK2JFS1pzNXpuWnQzNjBkUTZaekNYSHpTVkJUMlJ0bUxpVk9vVUVkOEdR?=
 =?utf-8?B?TU90QWJ1cjUzQXloQk5RelNmaHdZWkhqYWs5S3ZIU2Jxb2t0eFRsZnNEU1JX?=
 =?utf-8?B?eUFIRHVHTDIyM2VSN1o5M2R1VGVSK2FNcnY0bDlKYmUrSmdFQmZzN3ppV0lD?=
 =?utf-8?B?QjJ3N0ZLUjFxRlRyNGROam1LVDFPWHNXckdXQTEzQ1cwQU50YzU1NVVuN0NF?=
 =?utf-8?B?U0x4ejBaK0hCWm9PRU4wc05QbFhaNWVqZGFiSUtmVkRNcXJ5ak1vSTFONTRX?=
 =?utf-8?B?S0dqNXhvUFQ3U0tWMmlPZFI3SytEelF5WWlzVjBFbFlvalo0aStPUHlFeG1J?=
 =?utf-8?B?SzJTbjJzVTBvQUp3eTZZcHpmcUs1RXAzUUN1Zm5pY3pjVDhTWmRZZHlseTA4?=
 =?utf-8?B?V2h2RmJZdGZaSWVQemR3UFFpOU5yNllTbDV1anFqZnNIV0Q0cVordVFEQkxy?=
 =?utf-8?B?M3M4cnd6UVN2MU9ZNUljaGN6dmFHZUEvYWFnMWd6c21BYXpnMml5RFRvTGQ3?=
 =?utf-8?B?ZVcybHQ4bGhIUVlHVFJWN09xZ2FQWk5FcXNrdFlDZVhUNGIxVU1zQkl5THRD?=
 =?utf-8?B?dXlybzJJSHNIZ2hzM0d4VWJyNGVNbGJDblZmMmhpUnNFRE9oKzc5eGRncllW?=
 =?utf-8?B?Mm8vemFQQndLSTBUbGNsNVR2MHprRDJDYlkxakJLL0psaGUzYzZ6M2JzQmNu?=
 =?utf-8?B?ZjhhRllYYk10NytPSFdDT3hsWVV1SGIxMWpEUGY1MWhwdlFtM25ubTh3eUo1?=
 =?utf-8?B?Y0pFcUo3amZ4WjNTcm5BdVNDeXZoVytiUFVLYVVZa3NSS2pndGJSSXRXdjZZ?=
 =?utf-8?B?VDlKTWdXUzRSQ3h0NVBneUpVLzlRc1pzdHpSRWhJMzJBZk16bm5ic1VkSFkz?=
 =?utf-8?B?YVZHT2xFVXh3Yi9DdlRrL0dBTmxOeUpGZFdVNjU0ZjV5UkZvRjdmeXpMck45?=
 =?utf-8?B?SUJ6cTEvZjZMQkE1ZVlvZFNjTTVURjZFcWh1SkJXSXg0NGIzOTNFaFZMYXBV?=
 =?utf-8?B?Q1NEMFdmUU5mL3Z1d245c0swNFdQNEJSbFBVNlJFaS9XWWlVMnRCQ3FEUlQv?=
 =?utf-8?B?clRIWk8vZkZHU3I1WEVOYXpwb1RHREx4aU4vcXdNcjB3Tkp1R3NYcTU0S0Zt?=
 =?utf-8?B?RkhDcUU3dSs1NmFxUWR5RlFXaDkvK0dtSmRLUnRTM2Z3dzZSQy9VTmRpSWpZ?=
 =?utf-8?B?KzdzNS81cG9DaUFscGFkVXp4U1I1UEFoUnlNTlZHQVZLYlFEc01ZWi9Dd1J1?=
 =?utf-8?B?SGtHWDZETThoOW9jNm1JWGJlaGVIM2dCaFA2ekUxczNWZ3FtNTlXQzA4L01N?=
 =?utf-8?B?MVBUZHpWQllROFN3VzkrdGhQc2JWQjVpT2dteHRtZ2g5cVR1QzZTMjVybHNt?=
 =?utf-8?B?QzhDRzNLREJhY3MrWmxITGhKNFhWamo2QkFVU2RaeE5Wc0hIdTIvQ25lRHpG?=
 =?utf-8?B?ZVQzTVBJZGY1ejNGclFkYlArdi9vSHkvZ3VuWkxITDdJK0pGak8xNE5VeGE0?=
 =?utf-8?B?NTN3TjlHUFg5RVRBV2JpNDhFc0k4ZStJTkE2R29tWmFGSUZHcnY2TGpJU2ZG?=
 =?utf-8?B?ZzRJelJyQW9NTUI5dXkzclFyK09hVmgyRHZCbmVEN1B4NmZKVWZmcHNLQlAw?=
 =?utf-8?B?ODlxOWI4Kzhid0haN2JTSmpGMW5pOVc0aGFhS05rVEJaSDAyZGhTS3NhQ0E1?=
 =?utf-8?B?NUlTM0U4ZnA5bTFhSnVOUU5CU1IveFlVSVdGeVl5YXZZanJQdk16aVdvY1lE?=
 =?utf-8?B?TkRXSzB2OUtiVVMyakR1MmZBYk5GMEJZT2tEY0Z6VEgvUUZ3NXJUeFVyaTUr?=
 =?utf-8?B?RnY3OFh0SlpRUUZWUFhqdnlSbWhYemZ4MHl0WkMrcmliUXF5Z2grUUszZlNQ?=
 =?utf-8?B?dEVxeDZJNUtqenNuaE9QbEdqc09kMXNHTjRHQkVxU1hHNGYzVmVjdHR2M3JH?=
 =?utf-8?B?U1lsQ2I3ejc5R1dmbUNmS0ZlMVpGZlhYVmVRVFZpY2FoZkdHMGRBWENQYy8y?=
 =?utf-8?Q?PrhL4NPoH1qYN5HiI3RKI90=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc30ed1-6d68-4b50-59e8-08ddc0527404
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 08:10:52.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4J3UNAX8QMp8TdrLNFHRGJL3uYKNMKqigQU3YGPAqrypaKhmcSTezrjl6cOqIhjOpQV2WQYSs/J+MVDKO68QLLOvavYa4XuMy0GVN05Id5jTtez3DbZELoX/y39WWIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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

Hi Pranay,

On 10-07-2025 20:09, Pranay Samala wrote:
> Reduce the number of cursor positions and limit the
> execution only to a single pipe during simulation.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane_cursor.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 1b72515f7..9ce35e045 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -237,6 +237,8 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
>   
>   	for (i = 0; i < ARRAY_SIZE(pos); ++i) {
>   		test_cursor_pos(data, pos[i].x, pos[i].y, flags);
> +		if (i == 2 && igt_run_in_simulation())
Please add a comment mentioning that limiting only to first 3 positions.
nit: good to reorder condition, igt_run_in_simulation() && i ==2, which 
is efficient when first condition fails , will avoid comparision.

With this fixed.
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> 
+			break;
>   	}
>   }
>   
> @@ -347,6 +349,8 @@ igt_main
>   						test_cursor(&data, size, tests[i].flags);
>   
>   					test_cleanup(&data);
> +					if (igt_run_in_simulation())
> +						break;
>   				}
>   
>   				test_fini(&data);

