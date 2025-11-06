Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EC6CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 05:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223E410E808;
	Thu,  6 Nov 2025 05:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMMjkkn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85C10E808
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762405921; x=1793941921;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=OoIlD2IlQbg+kmDBi9INKMc2gCwwyRBTOf7weTYH6cQ=;
 b=hMMjkkn4mOD3APlspFNrvtPP8KMGBplIjHcmyyBCrBFpFCXXoxKJhaDx
 nH5OSJjHGsWTufUSb11H/Fn+ybwb7nI+3bISgFIDNAqLgtC6X3gThTElA
 m/U/iZs3xs7ddQa4N9CUJvq1zk02rQAylksG8vv6ZoafaxArA/mTF3bcv
 ZHPuweIctHMcbZ/Y8cavQmfNGyt8t8NViFnpNiuL8IEkOHAYuIxHeq8zS
 Xs9+A/eIfSSGnxL6SjmuFgwhNZp7eO0OptypSf0R74xisa9wnlgAHl3p3
 i6BSMFvfrw4IeAzTkqozeV9HTc/Rezq64qXOIaZjzgphsrjuTcO/uZ8A1 g==;
X-CSE-ConnectionGUID: +iJ4cOFxQb26gdqdv5eWaQ==
X-CSE-MsgGUID: /qZfmx3bTf+RBmUPcjs72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64683765"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208,217";a="64683765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:12:00 -0800
X-CSE-ConnectionGUID: z5aA+WEhR5avwQfbQ244cQ==
X-CSE-MsgGUID: mvFKdaoERtSYd0V9RrD0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
 d="scan'208,217";a="187501860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:12:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 21:11:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 21:11:59 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 21:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQtpcDcfhQ5ehfkZonyESzPGmNw0xyndCiHC+ssmbIe684JgSNvPWSkoGMeQM01K/ifpJSprU0iSAXMhPRMJOThMh500wo/Jly1daIOb0MuOeC7WKdV4mRete+q3q3r+H669pjmDrAz5+xTU8RnQIrttp1a+LS0lPCAqBX7DifYo8xuV2jc247RGhn3b/gFuHZ7uwTpqFD+Ru19aNC3nd17VXv/6+6q3ghRWv2WmRV4/R7BtHU1xczaOxdIn6lw8+FaCClNzk4cwaDfVenHnOFPtZDiR7aRRLu0aWuxlhIIO/Z5/5AfpZ+DyHdGT1/Cyx6PXgVwMK7GJDYjlyND54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXaE3snv1u94N2WgkBg4t+cVxQJWhQG9Z0yOKaBuPTc=;
 b=OrLUtXwinA75kzPxatpz1NymvVqmnwrNQbrRrGL2IZbqKeX6vNPnyS/15mVuZVAsqymKOnZiuNvSkQbbcIUuiREPIGrVbwTgksLXlDxJU7ApclyK/1s22qn8lGujqsNNeZTHQx96ZFUxPL4FLN9Rf8YGZwCueNkLgOhEYlLWUm+l3bNZhWWLmtXMlBlFkd2Vkm3y86/VgNCUBTRGwk8GBqUkKINpbDxVn1IwJDwaXogqLneB+0O3zX0WxNuvYIYie0zpra8BHOB4n2dVm1y2Qm7DJ31CfYBrspgLWx2Uvw6IZ04btIquNxxXt94LEJ9Les+JJ/DEFpGU+iQ2mTw74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 05:11:56 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 05:11:56 +0000
Content-Type: multipart/alternative;
 boundary="------------0unn0oUM2DFh2ntEScadcEcg"
Message-ID: <997aab04-e2c5-45cf-9d3c-1538c336c7f3@intel.com>
Date: Thu, 6 Nov 2025 10:41:49 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fsurvivability=3A_Add_xe=5Fsurvivability_test_=28rev12=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251104095221.694286-4-sk.anirban@intel.com>
 <176229555320.17802.13400962993084440102@10055242dc62>
Content-Language: en-US
CC: <kamil.konieczny@intel.com>, Riana Tauro <riana.tauro@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <176229555320.17802.13400962993084440102@10055242dc62>
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f540de-e625-487b-97e5-08de1cf30148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHZEWXVWaUZTWmZ4V09DSWN4SEJhOFh2S2JlMWJRU204ZFlZTGwwTTAyMHpz?=
 =?utf-8?B?RWNjcjNJSVcwWG9oWlJTR2dBRkF6RUI2V2dRL1l5WlVjTUZiZ2xOTi9BcnFa?=
 =?utf-8?B?a1FnazQxZUVyN3RpUEhRdk1kTkkzSkc2VFpaWHJKL1RURWc1Nkt0R2lXN1E5?=
 =?utf-8?B?c3AwYVl6Qm52NE9OaXRDeXdSNUY5bDNOZ3MwVnRQNWNmRDVySURwL1o3RUlt?=
 =?utf-8?B?Tzc1SGZlSDN3ZmtWbUorU1RVb25RY3RDWVNsMXlKVlc0cHN3RkpYUkhmdVVC?=
 =?utf-8?B?N25wNE92VTY0L2tXcGNLTlY4YnU5ZG5uYitGOUZRdkZzWC9la2x1bzlNUk5G?=
 =?utf-8?B?Kzd3Qm8zY0V3RnUxS3NmamdzRmltWTQveXdQYjJza2V4N2hUd0ZSeWhUUVRp?=
 =?utf-8?B?Z1lkYmJENkthclp6THlrU3JrZmV5WTNXaUhOV2Nxd01iNWkyR0ZSaUFuV2Zl?=
 =?utf-8?B?SnJKODloTUJFZ0lBcXFKR2RXWXl1Rnd5cEp3RTdtMDNJM3paMVBHNytYbi9V?=
 =?utf-8?B?RWg5Y2xNMVEva2Z1Mk0rOCtuYnZCQU9taFhFMFNZMGtrQmNJRkhRZXdvbzBq?=
 =?utf-8?B?SkZWYWlya1ZPMUxzdWllNzZZZ3VwTjhHUVNnREQ0VGc0aGtoK2cyYjhXQnhl?=
 =?utf-8?B?Vkx2WEpDTDhzK05aY1hiS2VsY2oycDBna2ZXK1RJTWQrcUR1cmt1aVMxL2dP?=
 =?utf-8?B?aGl2NG83dHQ1bUFodWJ0TFlsV25UM1QwNnB4R0pRdVhxdDI1ZFhXSStCeXQ2?=
 =?utf-8?B?T2Uwd01haFYxeXlSblRnOUNZWDhyTlRNUkE1QW5YaHJPTVRpK3dvVEZSTFl5?=
 =?utf-8?B?VThrS1Q4SHV1d1RQRHVUeFJKbmZwSnYzejFVSVNka0lrVnJiZGd6eFNUelln?=
 =?utf-8?B?cEtPOWZ6ZjlOMzVFMENnd09QMzdJQ2E2VUEyVmZYUHBHYU9TdmdvbUpsZk9a?=
 =?utf-8?B?Wkl4UkxTTU1peEcwdmVkTDVPV1lsdzFFV2R4SWdWR05Ra2hBUXQyQWxpNVV0?=
 =?utf-8?B?MDZuL3VNdEd3Yk04d0x3Qk50TWkxa2R5LzhESHo5MkRlNlQ0MGlkNFN0cW1i?=
 =?utf-8?B?RFVZQm1aOFFpWlFJVVpobVRhSVZZYkovSkJxbUttRlVKZTdYR0dzYUY2czhB?=
 =?utf-8?B?Q01TekxBQnVtRTduTEdwZ01GSDNUbGg4QmpmdklpWEdQZFRCbUlQVkxqMXZw?=
 =?utf-8?B?bnJSTXFvNEhxdEZDd0JhdE93c2V1UlpBRW4vbktCSFlJUW1KZUJES2NkbTRQ?=
 =?utf-8?B?ZHdNQ3BhaHZPbmhvWXJOS2pPam9wNU9laTJsWUZiQ3dkTVV5UytTSEtxL2c5?=
 =?utf-8?B?M3RoTHhkUEhQWVNuNGZ4cmJCVmtHdFJwV0VEa3g1aDNBY1N6dEJkOEJGcGZM?=
 =?utf-8?B?MkttYW9aa0RYRk9xNWlEMDNlbE1tSjM4eUNoMWNkRXFCeEYzU2hVbXZwa3Jv?=
 =?utf-8?B?bXppR1pRQ1czcXd3Vm5JWERsSUFaVTYrNTUwTzdWM29QWitYZTlmaEJnQVRk?=
 =?utf-8?B?N2JxcVRJVDlCUXh1M2d1ODlBNXVZVnROU1Zsd2FJdXVSb1MvTUdrckZwUFQv?=
 =?utf-8?B?dk5xWGdScmQwM3VIVmlnaks5TEF1T21KRUdqN0lxWklybm1CckU5dllOMTdO?=
 =?utf-8?B?RnVMZHZ2dVJpK3ZoZGJZOUlLMGJDS1FTNng5RW01LytOOVVpNng3VkZPblU3?=
 =?utf-8?B?NkQwZENPckVJRTlSOEVKdkdNZlJBOE0zaDUyY2RNblB1a0EvNEpXZzZHSmZQ?=
 =?utf-8?B?eHBOVXM4S1dyRW0rY1RKRzUwYnpUeDhtdnJMNWdndnUwZ2dvSXhDaE8zSE9N?=
 =?utf-8?B?clpWTENYd01ISmxkNmRCZTA1MzRWczVXMUgvSXpWNHExWGN3a3RyNENPemE5?=
 =?utf-8?B?NWh6Z3owMW9naWI1ZnBuT1dTa3hJL1JnTkpmM2tQOUFLUGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnplNFErb0N4U0tNd0VhR1BnRk1makZpYXQwdHoxbE1oY2g0UUVqYU83ZWhI?=
 =?utf-8?B?WXFPRWErS1dYZFJ0RjQ4VTNONGM0eXlZK0dnd2l3Tk53SnIveHNRZHl5V0ZY?=
 =?utf-8?B?cm4rdy9udkt1N2E4VnpTVDhrT2JnUjk2N2dLNHhKcHdUV0ZJRTJuaGxMT0RS?=
 =?utf-8?B?T2prMVNQOVNleisyMjNLUmZRTXJEYmtKM1VVV0MrODkwNFE1Z2QvWGViTkdU?=
 =?utf-8?B?dUdnN0pxenl6cGNYamVIdUJOYnRkSlhpZEVWUUxnSXhTeEtvVzFJckxPL3dB?=
 =?utf-8?B?NkIrcXZ3NmFYTEY3Tk5MR2pPdTFzdjQrdEZtdWZVUmd6ck5IVUdSdjBCaEZh?=
 =?utf-8?B?U2E1bWhURjBvbS9sWVo0bVF1QmcxVDJMSVZmd0NMYjJYUTUwUktrSzhTK2ZL?=
 =?utf-8?B?NU5Sc09VRm5CQ0VQSWxIUVp2UGdTTWxJZFh6dSsrZnVQdmF6Sk02R2MzS0xu?=
 =?utf-8?B?cHNodVBzdnExY3pxK3Bwc2VSWHkydUZmVGFrOUtkY0g2ejVzU1NrbmVLaVo5?=
 =?utf-8?B?N3ZpU0JUUFUxYTJEVWNvMks2MWMvcVBYUjJ5TUNaNktKY3VMMStlcXJpekxO?=
 =?utf-8?B?bE9MYlVoZHUvQmJGTzRRUlozdTBvajgxQTJqMy9mR2NWVTR0U0tFODFEbGhL?=
 =?utf-8?B?YU1YdTJ5ZnU3bzM1YmZJVVM5RUw3bWQ0NG9YNnBHcHFrWGF5c3RnKzhTdmtD?=
 =?utf-8?B?blY0SUdLMGg5SGttV2xUTXh0TEtkc0Q1S3lob3J4VXlQV1F4d2xjcnVNb1pS?=
 =?utf-8?B?ZUVWRjNCclNHeE9nejNUdjY2UE9lYmVReW5xMURUT2dtZUFoR0podGlXNDlz?=
 =?utf-8?B?V1VIczlFSzZiNlR5M0toeXIvOURCdFB5VnpzRlorK2ZKeW1BVWtvdEV1aWs1?=
 =?utf-8?B?Tkw2UmNQaFN5bzBCSGQyeko2WFpaNGhmSHRKVnYzL1N3amVHUi9xZmtrQTB5?=
 =?utf-8?B?WlBRaFdiaS9WQlZLUXE5U0NBOHlzd1F1Ym9OQnl2MEZoMnRFa3FwMzB3YWd3?=
 =?utf-8?B?VzBmdk5iSE5HbVJacnlhYk9tVGNTMGUwVlRLUWh4OGE0Q3V2eVJsaEl6TEkr?=
 =?utf-8?B?U2J3eE9JM2Z6QnVnTnJNdnNvZWcvMk5reDFpY3diQ0FqTVRtRjFGVmtlYmVK?=
 =?utf-8?B?dm10OWpEY2pMWWdjd2VpUkVSMXBOWmtPYXIxdXJhWXNBTU0vS2Q4eldXekRS?=
 =?utf-8?B?N3M0R0lBSlFWSlRuekV5d1VQa0FQYkZKVVc4QkVTVE1YNEVEd2xIN01Qams3?=
 =?utf-8?B?SXZuZU9MdGtKVVphaWdPRDhLTVBkUWE2VTRIM3FMcDZ3S0VwY05OU25hRzAv?=
 =?utf-8?B?cXNMVEMxYXVTeTRRUi9TcFpmTS9CNVZXclBOVlFhOWNmcXBhM1cyRzhOZjBW?=
 =?utf-8?B?RU45cHd3azZWZDZxNWRGTEEzdTB6WnR6Sm1XMFZwUGltaDZWRHhLZDZqMytT?=
 =?utf-8?B?ZmZqaUdWZGJzQm9YeE1TWTBCM2pGbzJFS3NzUXVITFJ1VGJsc0w0MlFWQkl0?=
 =?utf-8?B?WS9Ha0x1eDlvSUVEWkxreDlROUFoVmJLV1A5eDFOMS91MndqQUpoRy9JckpI?=
 =?utf-8?B?VHlBRkErRWFRcE01SUk3RnRKT1ZkclNjUHpLbGNldWtBOE9WaWIyZlBrU0gr?=
 =?utf-8?B?RmdCT3ZrTHltNmdJUEFrMFZTWUQ3YkJ4MHhWU1hQOXl5SXpiaHB4MG4wVTYy?=
 =?utf-8?B?SWQ0S3dialNrZXdrNVdkK2pqbXVMYS96QytIYnhnVGpQRnROUUR5Y05OS1hj?=
 =?utf-8?B?UHlka2J5WHBjdGdtcERRNW91Z0hhbDhDSGFBK3QyQVFpWW9vL0VzdU9ENFlr?=
 =?utf-8?B?dWJlTDFySTR5OTk0QXhMWjdxVU9abmRIdG9UemVMY2k3alh5MFVrVmRiNjlq?=
 =?utf-8?B?V1gvQnhHVUFmekpFYUNCS0RsYjZWdlFDOC94WWhiSm1RekpyOUhONks1UStM?=
 =?utf-8?B?dzc2dEZxeXN2ZzFvRXMzN0NsbGNlS1ZNTURRR0w4NHRaQlVkaDBnZVBJeDFs?=
 =?utf-8?B?bGFhUmFGdmNUY3UyYUxNSXpoc1FlcG9od3VtdlhsK2JMT0VTUklvcDQ4S2ky?=
 =?utf-8?B?bzRaNGZQMUQ2OTBPNW1qZEg2cGF1dkFHSWRRNWVzME1BVFhWZ1djTTZ3V3I2?=
 =?utf-8?Q?Ge3JqVDbJBZFX5kThhfN7rC99?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f540de-e625-487b-97e5-08de1cf30148
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 05:11:56.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXMX9DqI0XX9x8RzUDNSmBQBlVK/uv2GaYs7JVSpAsyQaKTHvkzNJkaYYWVkMhpiONhX1DRuOM8uI7EPLC8+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

--------------0unn0oUM2DFh2ntEScadcEcg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These bat failures are being reported because of HAX and these are 
expected,
Could you please re-report?

Thanks,
Anirban

On 05-11-2025 04:02, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_survivability: Add xe_survivability test 
> (rev12)
> *URL:* 	https://patchwork.freedesktop.org/series/154342/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html
>
>
>   CI Bug Log - changes from XEIGT_8607_BAT -> XEIGTPW_13987_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13987_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13987_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (11 -> 11)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13987_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_survivability@i2c-functionality (NEW):
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-ptl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>  *
>
>     igt@xe_survivability@runtime-survivability (NEW):
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-atsm-2/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-ptl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8607_BAT and 
> XEIGTPW_13987_BAT:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o Statuses : 2 pass(s) 8 skip(s)
>       o Exec time: [0.0, 0.01] s
>  *
>
>     igt@xe_survivability@runtime-survivability:
>
>       o Statuses : 2 pass(s) 8 skip(s)
>       o Exec time: [0.0, 2.23] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13987_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Possible fixes
>
>   * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
>       o bat-adlp-7: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html>
>         +1 other test pass
>
>
>     Build changes
>
>   * IGT: IGT_8607 -> IGTPW_13987
>   * Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165 ->
>     xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af
>
> IGTPW_13987: 4d24e938d100a2f6746e6dcb11c9c1d9c19bd3d8 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8607: 8607
> xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165: 
> 3512eb46a8d42c3deb477856c25d519b19a7d165
> xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af: 
> 23a9835dc75d0a8ce54cce440a3e0b36c4cec6af
>

--------------0unn0oUM2DFh2ntEScadcEcg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    These bat failures are being reported because of HAX and these are
    expected,&nbsp;<br>
    Could you please re-report?<br>
    <br>
    Thanks,<br>
    Anirban&nbsp;<br>
    <br>
    <div class="moz-cite-prefix">On 05-11-2025 04:02, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176229555320.17802.13400962993084440102@10055242dc62">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_survivability: Add xe_survivability test
              (rev12)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/154342/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154342/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8607_BAT -&gt;
        XEIGTPW_13987_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13987_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13987_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (11 -&gt; 11)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13987_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality (NEW):</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-adlp-vm: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability (NEW):</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-atsm-2/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8607_BAT and
        XEIGTPW_13987_BAT:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>Statuses : 2 pass(s) 8 skip(s)</li>
            <li>Exec time: [0.0, 0.01] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability:</p>
          <ul>
            <li>Statuses : 2 pass(s) 8 skip(s)</li>
            <li>Exec time: [0.0, 2.23] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13987_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@kms_flip@basic-flip-vs-modeset@d-edp1:
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8607 -&gt; IGTPW_13987</li>
        <li>Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165
          -&gt; xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af</li>
      </ul>
      <p>IGTPW_13987: 4d24e938d100a2f6746e6dcb11c9c1d9c19bd3d8 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8607: 8607<br>
        xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165:
        3512eb46a8d42c3deb477856c25d519b19a7d165<br>
        xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af:
        23a9835dc75d0a8ce54cce440a3e0b36c4cec6af</p>
    </blockquote>
    <br>
  </body>
</html>

--------------0unn0oUM2DFh2ntEScadcEcg--
