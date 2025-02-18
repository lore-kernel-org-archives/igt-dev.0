Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F9DC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 12:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246F10E6A1;
	Tue, 18 Feb 2025 12:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZngVPZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E478F10E6A1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739882814; x=1771418814;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LXGRExFA01rzSHn83yJEVizOoq1XDLUSbCtGkTp/M2U=;
 b=GZngVPZwsUqGeTGXEl+uqIbBfsKFHe7nA2nXq3y98zKyGRzcNSDauAqw
 4oRk+Hc3y8UPU9TvmkFwfSYHf58yDw5PkCpWeqJkQOLKQDURa0uNA/d/c
 rSlMuEhyxm0pAZzl9EShHDi5PnPAGgZEHAw2MGoFkFGx1l+I0g7z1qnDO
 fERxO0NnEF3qjTaIJv2HebL3ndVzLGes4DwrLlfG4RCySFd2SBHxVGkyp
 /b4f2AoMZZkZCaQKrndlVXcMb3/TdT3THZjfI/yN5l31/0H0QNIj5WScm
 /VrUJ8/PYyXjDe4msz4CFO/PzLqrXrJRDeZVIMQ+gNmaXQZv6HxirIu67 w==;
X-CSE-ConnectionGUID: VqftMZMtQgKkeg2bPsyMEQ==
X-CSE-MsgGUID: e74ULGAxSgqrYwjZ9cuR1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40280041"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40280041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 04:46:54 -0800
X-CSE-ConnectionGUID: nknbDHJDRIuPjsU6cGHnTQ==
X-CSE-MsgGUID: TZwqA3P1Q6KltypeOMnD0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114309528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 04:46:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 04:46:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Feb 2025 04:46:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 04:46:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/NkQAHjIAmuKO1yuXsPZcNwgfBGfDRV2oRPwCd/V1DA/G7bKId4Ea5Gl57gQu/cdCW/Wq4JHrqpFSGpLvf0Sbo8YJTwCVIYEzd+Fg5zvP+lgkbELYc/kzHJW0sZdBG+E28/aNRWUJIZkHysAuqfvb/yDlMN05/Jg6r5ki+vs3wiDpy8DBQt97c1373ULuLZs7vBBK34iaCQFXum0bUaX74JHyEjlzQBiv214QEPKb3kKh054uyAVD8dQTOiAISDCmIb9M07TsaPhnkSg6+2X3IegEgNJc/sPHryf0vdVIKsE6ut4vurw5e3E8/VDqLdqBULBP0eKjGQ/kLSVo62Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dswDbWsS8GG5qyxffcrjdw0fLqL/HPFq3s0XISDU860=;
 b=mKXdecRZq9AtHpOpCJxFfpd2bs4vW640keYxsAWsusb1rq25SgntBnx7j96StN2L2R/yCnd/f0wwK2ed6h6EgPD2uBn6RNSJirkO//11trnSXJ1Fvdo/81jGWQ34z1nk7aw0MjvBhthcPhbzps7ekIcb4we4pE5wX5ZeMUCif/htYXGgHRIf6Bs4hfrcEeXtFZDudN6yexEVN5muflpMuMWAMQ1/2AGJuZl+oGkPoSxG/1ObewMUsi9C00UUQswruK1FgZDGatM0wJzcJsTQODMS+Jt3rlKgBGn+NVzkw5K5AdE24WoY3ZGfoPpqa2bv7T1xjO0xeDORnRcQsO8CRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 12:46:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:46:50 +0000
Date: Tue, 18 Feb 2025 13:46:45 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Message-ID: <Z7SBNXrd5I2dIdjZ@fdugast-desk>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207072902.12582-3-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0026.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea8974e-cfd3-4640-1802-08dd501a5019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVpBa0QvZEtMemFwZkJvdU9ZeThZSkF1bnRSZHByVzd4QUpMeVhGanJVa3Bn?=
 =?utf-8?B?VGlNbFhUNFA4UFFIQWFhTU9HZWZtUGNzRjQ5UU9RdGZFeng1M1RLNzF4N3Vx?=
 =?utf-8?B?OTViNS81RjFQVWx2VEVWeFg0cUxoRDNRNldNT3dZVnRaeUdBNjJHWjM5K21F?=
 =?utf-8?B?Y1ZDWkJwRjBlRlB5RWZJSGJHNGxlajFWSDEyUXFvOVFXNHc3NnA3NWdnMHhD?=
 =?utf-8?B?b0FmTDdScVhSNFpzYlc3Wll2b05JQ0V5SEFrc1YydVhubDRvQnJGSlBkTFVs?=
 =?utf-8?B?dWRBVzcxc1l1NmEwYXp0K0lQaXJ0WTlYRi80ZlVTLzB4em0rOVZ3dEJodDJ6?=
 =?utf-8?B?end6ZndobGttVWRweG5RdjVqSUtIM0YzWTErdEk3UzZoZVlnNjdMWkg1aXhO?=
 =?utf-8?B?dkN4YTVCU0srYUpGcjA1Q0FGRllHLzlrNG1pT3R0WUlqUnR1aEgwRHIwYm9u?=
 =?utf-8?B?dkY0TElNOS9hd0xWVzdOZHIySkhZU0d4Nkc5dFNRVGR2amx6d0FNbTlvU1dX?=
 =?utf-8?B?ODZaeHV6VU44UXI4OXpXVk9Yd2toQU1lSXdtWU5tbmhFVU1uTmlXTVBlNFRv?=
 =?utf-8?B?a1RNN1hQeTd3cDV3UU83K3FGRWwwWUdPWDJmWnJMUlVFZkRhb283V0RNT1dp?=
 =?utf-8?B?dmV6MG9ETjNXZGgzMGRtNGl2d25VOU1QMUVTV0Vvays1d3VrcnRkdTZKN3VP?=
 =?utf-8?B?WFozZHBrd0psMVVIMXdLWTNUZzhDZnJGUU92WE5PeWNPR1dqYUljWWdnejJj?=
 =?utf-8?B?bEFGR09rL1dnY0NiUmJMcTU0c2R3VXZ4WFpNcmNuMmR1eGlPUm9OVXNFTGp5?=
 =?utf-8?B?aWZrb1hQSHFTT0tKdmJRc3owNVFBbVBpUS8rNWY2RHQySjlRbG5xcjBOWnRl?=
 =?utf-8?B?T2Q2SmxEakVoUFZtNFJXYTJTNUR4QlRjUmRtQnV0SEVURllOVXJ5bExnYU50?=
 =?utf-8?B?N01vRnBtYkhMQlZ4MnZJYkJYVDVvWUxURi80SlFHdytuR0NhVUV4c0lBTWNK?=
 =?utf-8?B?RTcwcEFpNzFRRGh3eDRLU2FtRVNFSTRKazJEbm5OU1AweFFhRGhmQ01uOFAy?=
 =?utf-8?B?RzZQRCs3V2djZHVIb1Q5eE5UUWpWV0ZhWWVPQzI0U0cvMTJpamhQVWJ3S203?=
 =?utf-8?B?MmFXZ0JqUEl4bmx2RFVvbXN6cW5ZSldPRWM2UmhUV3dUdGV2WW41YWEvNVlS?=
 =?utf-8?B?bWRnbTZZaGpuOWpGN08vVmQ2SEd1eEpvQjlhQlRqRWpqYTlhbTdXZVNydWMw?=
 =?utf-8?B?YXBPcklXUkJUSDRLOHpWWFRsQ0p3WElDN3dVWDV1M2RkZi9VL3lIMmZHWFRh?=
 =?utf-8?B?bW9JM3BBdFI5WFFIb2QxMXJwQjZSN0JBa1J5eTc4MlpIVHppRldKMGpzUXFu?=
 =?utf-8?B?N0x6R1lneWo0Z29INml0K1FlMkNRNTg2alQ4Ry84UGRuT2JJMjZjVDVsamFE?=
 =?utf-8?B?NS9EMVlzZFYyS2F1VkVTTHZnUzNkV012SWNqcWtFTmNUcXA1amgzOCtYNVpq?=
 =?utf-8?B?cHVtU2d6dkh2RzRqOUhJSGtodTk4R3psSFNwYWxJbG9rZlc0dGd2QjNTZ3lH?=
 =?utf-8?B?ZVVOZDBsMDcvK0R0QWhma2VrTjZyRFVSRFVtSXA0KzN0TDhOZ3FEWkp1QkUz?=
 =?utf-8?B?SXNBait6b0psV2xVb1RtRzkyTE5RTFhnN2E4QnF6bGNXQnlmaGMvZTZCRnlx?=
 =?utf-8?B?MUIxK05jRHhpL2ZGR0xTUzkwVmtRdHkrZ2J6R3FFRFBZbC9lUDFnNEZoWkM2?=
 =?utf-8?B?OUxad1A0bk1FVHRIQk5JQXY0Y1B1bGhuTFNCK2JSY01ZRC9qelpjMDFkZ2Fa?=
 =?utf-8?B?d0E0Qjl5VnNkQzN4WHEyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZBS1dWMnlwZ2ZDNmV1TEwwOERyd09NcjJCdTUrNnZQNVFlTnZZNmdkcUZZ?=
 =?utf-8?B?RHYyVEpmUTFaVFlveGxpU1lSelB5T1RaUURFbE0rcDZhZkNncjFIVEcvYUov?=
 =?utf-8?B?eGs1OXZqMUVHN1hIVk4yTEt3N1ZPbjQ2dGE2RFRNbWhVT0d6SVVTdDVIR21s?=
 =?utf-8?B?aWFVRnBHMDZKQnQ1UllwL3piV1FkaUpvWWRkS0kzNW5JNWgwSC91YVFRdHl2?=
 =?utf-8?B?bUVHZ1o4R0hHNGw0UUI4TEhXVWswQjVSbjdtU05DRjNVSVF2OVdQUVo1dlNK?=
 =?utf-8?B?bjlqYTBNa2tEU2NkZGp4My9ZamdwQ1FBN0dYL1pIalJPbEpKSEdvSGFhRVVm?=
 =?utf-8?B?L0w2b3VualdqWTN4N0p3eXdQeXVObGtDWFZwNlhYVGdMV01rY25XemlUaWV0?=
 =?utf-8?B?U2VRQnh4aFJPU0tsYldLWW5GcVJLdGRNTnNHenhhOHk0akFJNDh5TEZqL3NI?=
 =?utf-8?B?WVJ1QkdmVTMwalJoanNaaHZ3aDc1emR1bzdTM2YvVGF4NEx2eWVmRDRiNEVZ?=
 =?utf-8?B?S0pBSkJLcVBrZDA5WGQ4aE05bTRGd1RMN2EzRXd6VWtqSExzU0ZQUlRoTThT?=
 =?utf-8?B?R3FQODVERmt2em52L2llUEM5Z2N5a2Ivb2ZwaEFFMDBnL1ZkRDVMY2MrL0FZ?=
 =?utf-8?B?ZlUrNEtFTFUwMndyMTVMTWQxUHAwRGwvdTIzVno1dWdHQmNnaGw1cjE3MkdI?=
 =?utf-8?B?MHQ3dVVoOFZ2bEFFeVpZNjhJcDJQZWljalpueVpjZldiak9IRTRRaFRabFY0?=
 =?utf-8?B?SzZETXVFM01ERTUyZk56UjE1cFZEQmROU056NW5qSVhETVNyaUFyMDl3blMv?=
 =?utf-8?B?dzhyaUxLYWQ4ODljMmV5bVA2cUFuVXNSaXRwdHRhSGg3UUhOUk9yMS9iOENh?=
 =?utf-8?B?TGJUR0N4V3FDYVVDVDIzcEp0cUNOdkFxVU5uOCtBNlhPTnJpbi92MTU1M292?=
 =?utf-8?B?dE1NbzNvVjhsZnVQbjNnakFUZXcvSGt3NGZJa3h2WG5qWmU4S05LSXpGRzh5?=
 =?utf-8?B?VWMxdjlWL3IybGlTU3lraWQ0azA0VW16a1c5eXpTMU16azdKaGhtNldwL3BL?=
 =?utf-8?B?c3BoRktiWlpMUnU1QS9JR2ppTW9INWoxbjVhZWc0SG4vL0JWZ2FoTVFCVS9B?=
 =?utf-8?B?VDcraHZ5NUwwUXh6UWNxS1RmSFVnbHVtT3FocklTb2tZN2tCVFlFYm11SkpS?=
 =?utf-8?B?c3NnNk5EOWJqWkpLaTJHKzMzdDFETFFjdTBSdHRpNjF3QUJFLytEbUZxMVQ5?=
 =?utf-8?B?RTh2MEY3RTI5UFh0RnpzbEUrQnR6TUI2QmhQZ3B0eW8wazNFR1BzMHhObkFD?=
 =?utf-8?B?d0hOUkVsSHRleG9iWE9PYXN1VUpxeFpuUmhPejhpNkRITTAzN0hCNkNnZEdN?=
 =?utf-8?B?NGhvR1hHWTAwTzVWZHU1eVhvbUF5cmJPc1h6V2xQV3hmRUNncGV3TzVEM3VS?=
 =?utf-8?B?NVhwNE1BdFpqdWZMb3lwdDdvUnlJdFhwOW5QOEMvSEF2YVo2L0lDdkdMN1BR?=
 =?utf-8?B?TjE0UjluTVh3b3RRK01LNEU4Z2huYkF1V1hDcG5vVjlUUVJhdzV5ZC8zVk1Q?=
 =?utf-8?B?YTVpMDdVL1pld2NocURYbFBoNUoxK1hzVmxqM2czRHMzRDArcCtTUVhpUkxL?=
 =?utf-8?B?ZU4vS24xMGFoQ2ptNUpYbE5MK0d2bWhCcndEM2FyZE5TL3JsaTNEMUsweXZw?=
 =?utf-8?B?SGcvTjNOK1pweDdpYUdsR0RPVEJkS2JSYVV2QW1uTEJ4bTk5dDRuUnhjWjRk?=
 =?utf-8?B?aWJmNm5CTWFrMVdVUW5RbXgyR3VxSWdTZStqWndieFJwSEM2aE1yNC9GTU9l?=
 =?utf-8?B?L2VpUUpjQlpGWUhoSitIS014SUdudXNiU2xvcmdhVkMrdkZoQXIrTjFKMlhD?=
 =?utf-8?B?Nlgwc2JwaTFWYW4zaDNLbjA1Z1RkSFZneUF0RWpzazd3b0orc1REempoYkZH?=
 =?utf-8?B?QktLY01VdFYzTHlnSWkyajYycHBaWFdTcmFNbTBzZHhEcEMzZCtmMEx1R0Vy?=
 =?utf-8?B?S3htTEtCN205TEJvUHZweUJzS0dEcU9kSHhUdFh6U0xoQWhvTkxyRFA5RFNJ?=
 =?utf-8?B?ckdpS0NzeUE0clg3cW5rZmZtMHErNjNSWXBHRW1udW8zSGkwNHdVbXVtVnJI?=
 =?utf-8?B?UjUxalBsTlZvSmpPYjdrREs1elBRbVZYRmQrNnJ0eUdJd0lLak1IeFN6WFRw?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea8974e-cfd3-4640-1802-08dd501a5019
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:46:50.3170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgcYxY0lXGwf1KfhKiDCjqzEmA8PH4XKZqV7LvJBO4CayistfV6W5czbhmLqsqvW7GqJ4r5t1XJ0qtp3dAvi8ZnUwYy03OzLXx39sNB3ilY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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

Hi,

On Fri, Feb 07, 2025 at 12:59:00PM +0530, Satyanarayana K V P wrote:
> The current setup_injection_fault() is always programming fixed fault
> injection parameters. Update this function to accept fault injection
> parameters for better injection capabilities.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 42 +++++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..a4252d028 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -31,6 +31,17 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +struct fault_injection_params {
> +	/* @probability: Likelihood of failure injection, in percent. */
> +	int probability;

It seems there is a type mismatch between here and the calls below with
igt_sysfs_set_u32() and igt_sysfs_set_s32(). Those 4 attributes could
be:

    uint32_t probability;
    uint32_t interval;
    int32_t times;
    uint32_t space;

> +	/* @interval: Specifies the interval between failures */
> +	int interval;
> +	/* @times: Specifies how many times failures may happen at most */
> +	int times;
> +	/* @space: Specifies an initial resource “budget”, decremented by “size” */
                                                 ^      ^                 ^    ^
Is there a reason for using “ and ” instead of " like in the rest of IGT?

> +	unsigned int space;
> +};
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> @@ -117,21 +128,40 @@ static void injection_list_do(enum injection_list_action action, const char func
>  	close(dir);
>  }
>  
> +/**
> + * Default fault injection parameters which injects fault on first call to the
> + * configured fail_function.
> + */
> +static const struct fault_injection_params default_fault_params = {
> +	.probability = 100,
> +	.interval = 0,
> +	.times = -1,
> +	.space = 0
> +};
> +
>  /*
>   * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
>   */
> -static void setup_injection_fault(void)
> +static void setup_injection_fault(const struct fault_injection_params *fault_params)
>  {
>  	int dir;
>  
> +	igt_assert(fault_params);
> +	igt_assert(fault_params->probability >= 0);
> +	igt_assert(fault_params->probability <= 100);
> +
>  	dir = fail_function_open();
>  	igt_assert_lte(0, dir);
>  
> +	igt_info("probability = %d, interval = %d, times = %d, space = %u\n",
> +			fault_params->probability, fault_params->interval,
> +			fault_params->times, fault_params->space);
> +

igt_debug() is probably sufficient but up to you.

Francois

>  	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
> -	igt_sysfs_set_u32(dir, "probability", 100);
> -	igt_sysfs_set_u32(dir, "interval", 0);
> -	igt_sysfs_set_s32(dir, "times", -1);
> -	igt_sysfs_set_u32(dir, "space", 0);
> +	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
> +	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
> +	igt_sysfs_set_s32(dir, "times", fault_params->times);
> +	igt_sysfs_set_u32(dir, "space", fault_params->space);
>  	igt_sysfs_set_u32(dir, "verbose", 1);
>  
>  	close(dir);
> @@ -322,7 +352,7 @@ igt_main
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
> -		setup_injection_fault();
> +		setup_injection_fault(&default_fault_params);
>  	}
>  
>  	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> -- 
> 2.35.3
> 
