Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E5D690ED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 09:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272E310E313;
	Thu, 28 Nov 2024 09:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcyBGTyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2D110E313
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732786414; x=1764322414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=arNT9LjqWKx4QuhC4UIoNxqW4y4t20VPdoNKKvE8MAs=;
 b=NcyBGTylAg8y8uNffPvmzvZZ57vEq59g3DsGklqgQhK8vf1iJD1Yx4mE
 wfeu+D99eqnf3oKY3C3AsOm044zTl6RQqoo6TDS2s/QB4cE3CYBo5rFeT
 c4vy9U24schJgpzOMdpCpZjHHqfViDAGbsmxk2t6dktTNI0RWrH4W0J4F
 0KXoMRIN2yHgWOdvu1OdfzqKGf5F9RTHhAtS775O8IDf7BPQHLNphn8jr
 teSGAgUDu0W+jz+/XTaUEooYeZ3xge264ZEeANHtjNOGeHb/Zs5qzL2Ww
 fuoITg/w4UZf5OPHqouhxSfD2m4bjPrZGPjNzXeVa/P+KTzbLKX8RULzM w==;
X-CSE-ConnectionGUID: 6SmhRdB8SCWhQA8lxvdtcQ==
X-CSE-MsgGUID: k9W+7PNBRbykFVsNGIPIAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33256971"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33256971"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 01:33:34 -0800
X-CSE-ConnectionGUID: E8Du/nrxT6esJCy4wbiEFg==
X-CSE-MsgGUID: l1ATAdRAR5Oy1CmFfGpXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="92118730"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 01:33:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 01:33:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 01:33:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 01:33:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w149fttf46fSQg8/mAnjiAmvr8BHxUNc3s+UFlvUQfrzHp0kiazVv7N+UNfcHFmJoPnOJsWKqwROz64XNApKB3Y10esL6u1Y6RQtAlvHXkc/J5CoamxEETqGR/yrAF0W2L85svnIoOXyy2utp42Dg2rVMr3cZxnUGEJ8PVDWnavaS6bxWD3085ez8+Fi9djY5Vliu/AhKm3yWCkIjm1BV0Z/X6bcjhUS7iMIi1BJaok5UxrhfwJ0qm9RIDWs6EvQZh4V9ahqJ5fBNwQfsHC9Ps9dGoeywly7CwlETBb7CaMnkIobSK/Ynx6hDSWahJ5E78/zA1X4LQdPKv/eiHqSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssXjtyPOg0x373ZUMZmNH+jhZsfFNp+hX6pEA1R8ysE=;
 b=boWmitQGVPQNm16zTb2LhKdWl3qgg266Ij88e5zW8OULWQV9uCsf1b6FPJmXTiRG+R0GGVGeegZDSmy6kxsZ7AUk2zZRKPSyjuHsWYKa278fwUP6sSfK4Sg6eypb/+Hz+JlmjmoA80pfuky2Q5IUM2ppsqBB4u2GTs5B0nMYzz05psqEAUp7zZLGDyB5axCKs1nqDztCgOOTaCe3dQVhr3QjNICt13yikZH/4MLb1TegNL8FHFnSqtm0LFgK/nnLCTFgWkZaz9cQTjiW8Y7cceI4Y3OU4M4SNtCVDFsjX7eVAE73IiMMf1fW9I8UMgxRrvlcdSXDwV5IhvLt6OvG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 09:33:31 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%7]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 09:33:31 +0000
Date: Thu, 28 Nov 2024 09:33:22 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>,
 <andi.shyti@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <dplbtzos7biylospvqgai4eeyk5ok6qy7kstf363aaicovvjas@vohj76jkygr4>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1bddd1-45ad-4e52-2307-08dd0f8fb89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T25YY05PaFJ4NWRUSEV3M1B6OXVSWlFodkhzL3FuUmVwR2J3K3cyY0JvcXJk?=
 =?utf-8?B?KzFPUGtYa2RXSkRHbnJPamllK2JNR1ptR1ltTmFLR0lUWS9odW9vSjJsWkR3?=
 =?utf-8?B?dWVVK21aN2VCOE1LdzhOZFQzcTZsVzFMaThYZ0RrcEplaDc2ckdqVENINHFJ?=
 =?utf-8?B?anVwS3pFd3dsbHE5MWpJcm1aeGJHakZLUUJIeDZPWUFmajRCTGkwSGNPS1lm?=
 =?utf-8?B?Yk85YUEyNFRSazBCTGhEYWRGN21qUmg5M2tyNUI0djQ2MXZUYjBFV21GemFY?=
 =?utf-8?B?dXhCSnhzYTJYKzVZV0V5Qm5UYm1RRDhBQmF3MVlsUHkvQWc2ajVsMWpYVkM1?=
 =?utf-8?B?SnpsR3drZlR0am1Td1NWblVlUm9QNXFSV2hYaUtYb2xEUWNwdHRlcy9oZDZa?=
 =?utf-8?B?NE90R3l3WHExMFRjUVY1aW9kcFo0ZFRaK2Q0enZTa0lMV2hlNlYwY2J5RHhX?=
 =?utf-8?B?bURpb1p6Kzc0b2RjcDRFVDVsRDVidGtqNmtjYmREdmwxcEdFbVpzYmhraGY3?=
 =?utf-8?B?VUNjdmQzbWxxdWY0VElJbmNpSU5IdVFSOXJqVWlDbHhDeEJxdkNoNlFsbHJT?=
 =?utf-8?B?U0Y3MEJvZVp3Wnh4M3p3SEh6UUtwSTQ1TEpyUlFRNmJWRjBqdlM4d3ovVnJx?=
 =?utf-8?B?YWJkQVJ1MzRQcjJiSjQ0WEc3bk8vQjRkVmNXQ28rQlM4SkhqSDRVVU5SZEVs?=
 =?utf-8?B?ZWpwQ0kyS1RqMjJ4Q1VtaC9SVk1xaWUrSVFDZEdKSGhaNmlaMEpZTFpnYUF6?=
 =?utf-8?B?SDJDUktyU05xQXpQbmFDRDUwQitWMGVzTWFIOUVkZ0lhdG1YSDRKUGpTaFZ2?=
 =?utf-8?B?NzQ4aU5SaldlNVFNWVBkNXo5aDVSdmEwZ1lLQmN6bEFWR0NyS1I0UkgzSGZa?=
 =?utf-8?B?OE94MnVtbFdvOHJqdW05ak1OVXlVMDh0MjgrYU9FelUyL2d1S0Z1ZTh6UjZZ?=
 =?utf-8?B?R2k3SC9Ca3NjNFQvaVM1S21BcDB2RXVzZTF0YVFFYzFWaW8wdkw5eW44VDRR?=
 =?utf-8?B?WU5kaE5ucXZZbS9TQ0tkYW9rcUdhclVzMk5GQUxOQXFkbk9naTBvY3JsQTdu?=
 =?utf-8?B?cDRnZWwvZWFydnBVZVhZYmE5ZGRoZ0VVdFBsa1hkV0JwM2Z5VTdGdzdZWFA3?=
 =?utf-8?B?REJqd0x0eDdtMmtIMUpSR05ybVRFQXoyZmZGL0VFcTZmaW5JR1pKam5Oa2Y0?=
 =?utf-8?B?OCtEZ1pnOEtkUU1Xb09nQmZjb0Q3aXdLOUZYWUV4cml3amlMQ2ZMWE5obnlq?=
 =?utf-8?B?eVhqNm5OMXp6SlhRek5QNTZ1dzdqZ2w1Q0dSdk1SU25jVzM4Ky96bTdQaUtq?=
 =?utf-8?B?YnVwN2ZnYi9adjhKTzNwemkyWnhzSlhpRTVUM2JLQStHNHAyNzFTVmlXc3Yw?=
 =?utf-8?B?a1JYNkltaFpoY2xMalNTMUt5SGp3dUgxV3A2aEFuVVNSbm51YmdBakFRcjNh?=
 =?utf-8?B?T0VXUloySEQ5L3NGV1FuV0NXUDF5YS9EWXluU0p5RVhlVUc4Q2hPM2dmOExK?=
 =?utf-8?B?NFlNakZPVVpTTWZkbjk2emY5ais4N3FydXdWU2Jnd3dFWFZIWU1xOXE3WktT?=
 =?utf-8?B?UW5ZZGVaWmh5d1lGWWVBQzljTHpkdHRIK2FUdXQwNFJMdllydTBSQk44c25R?=
 =?utf-8?B?bzZVY01XVTdkdHQ0bU4wL3lUTGJlcXY1UW5xRmRhN1pzRWhHTnIwc1RkLzVB?=
 =?utf-8?B?RjQ3eitQVCtYb1BhekZUMGVveXBsSGprOWs3N1E1Ry9BclVSMlVJd2dGWGpE?=
 =?utf-8?B?bTBkdTJOYlQrQjE4TlNBZGxiMkNZWDM3SW1HVUZlL3UrRFJ5SDJFRlFyYzZJ?=
 =?utf-8?B?cWFaZjkrYnFuenNNZ0w4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9sQnoraEZSKzhiQUk2eXJlZmc5d3YwbFJSK3VZcWxXWDgxdDkwQmNvcVZj?=
 =?utf-8?B?dzBoOUJuQnJHajN0UmVZNlVMSFRkR0RPcUFqWC81VTR0YnEwT2dkVGU5UytB?=
 =?utf-8?B?enI4M21lL2ZaSXFoMmZyQ3hYOEtLWWtQaFhyaE9ZZHpva1gzcmVlUG5HV1Er?=
 =?utf-8?B?aEhBeFY2dVhCREx3RjhTa0JFTEpEUUtITkZkRlJxdWN5R1I3RFNhcXh4M05Z?=
 =?utf-8?B?R1NoaDJ1eG9hQmgrYzcrUEs2Wmw1aDhYM2UwZmFaZitMMENPbUV5V1l3TXpi?=
 =?utf-8?B?NXpzTGJBbmwySXJaNTlBc3JWTVlnc09aZWdSbkFvWTc3NjhQQVYwdG1JMGdW?=
 =?utf-8?B?MmFwcUlyeEFTcDhkSng1dTBFSlJPdXZ0dnNDUjkzaENnZE5hRnU5S3Y4Nk5J?=
 =?utf-8?B?OFdqaGdGRU9jaHBDa0dSUC9OMG11ZkswV3FuTGwrUUN3ZUJ0RUREQWRQQTU4?=
 =?utf-8?B?K3M3T2pzUlV6Y2dUb2ZqVVdmUGtXeW1nOVhxTmlQbHdZVW1tRnhNbmlVczJQ?=
 =?utf-8?B?TG9iWXNzSlhYVzZQZTFRMlIzR1hiMkRVWUg3bUROeTZoNFdkN0M0anhsUW9l?=
 =?utf-8?B?VWZhajJCdGRBcXRPSlBHcmZKenlKd29JR2V4c3VDU3RKUlBLUGpuT3M2T083?=
 =?utf-8?B?cGxQdGxZd2JOM0ZGTWczV2YyQ2lTYlAvbU9ObFBJbTRPYklLSVp6a21NVE12?=
 =?utf-8?B?VjVVS1pEVENJT0VVWXQ2cU5iUDJSUU1RZjc5ZlVrbWU3K3VaS2dUVEE2eFl4?=
 =?utf-8?B?TGVaSTkzbmtuUEpZdVVjQVNKUmRzSG80NlB4QndDZkIwSDhSU0VPVUhablgx?=
 =?utf-8?B?MEx6S2UzYTdLZUlHUmRpaXhpelNBMGVOK1E5bjNIQU1MRDlKR1dyWGZZVk1s?=
 =?utf-8?B?SFFpenhFbEQxU2NCYktCaVh1dkJrYWJ1ZWd5V1prUXAvdFh1ZmRzeWVkdWoz?=
 =?utf-8?B?b0pES0ZrRzVyTDg5bi9KdW8vYU0yTHByc0RHN253SUFCcW1ENXNNTEJYTGlD?=
 =?utf-8?B?cVpOY2FWbGJtWTY4UTI2a0Nqb0xsZTFJRk5WeFNaaGZQR1JRYlRHR3F1TUVH?=
 =?utf-8?B?MUpOQWdCTnlYTWI5MFhvcVlmVGFmRndYbFl4Q1NMUDZSdXh5b21pRFhTNnZO?=
 =?utf-8?B?K1BGRlJnTit5OHdBdm12WTNTRlBNS0xkT3ArNGZtektyNVVkTWUwR1FkQlZF?=
 =?utf-8?B?L0IrWVN3c3FkTDU1Mmdxa2xkeUVYaEdqMVcwbUc1bFp2VGlhSS9WUjMwVms4?=
 =?utf-8?B?MnozMEhHSzV6eWdYS25iR1hwVktsTCs2aEtOdXVBQTErOEhCa3oyTkJqblpY?=
 =?utf-8?B?QnkzME5QUk0rT3RNRTIrT1JVd3M0YXRDY3l3VTd5bVVQbmhkS2s4cisrVEpW?=
 =?utf-8?B?Q0FhR0FuMjA5RVkxU0J0djhDc3pXcXlLc1BDTVNmajBZUjZpQUxnWmtBb29a?=
 =?utf-8?B?UHl5bWJXaTEyM2RRYWZhRFJ4NURwaUQ4UUlJL3lZL29lL1RIbmxkaXA5eGw4?=
 =?utf-8?B?ZWJzTHZvaE1NOVlRRFVFYzhLU3RaVmxIaTlPUkFQR0V6bDRIUlllaUduWWFL?=
 =?utf-8?B?ZUpnZU9RcEdLYTVBREhURVZXdlVZQ0ovV0x4TlpJdllFQzNJL1g2WEQvbFd2?=
 =?utf-8?B?WDdRUnA2NTVoOFhVMEdlVk9QK3B4WHpzSmxZWWpPU1krcXUxZ2NzSk50S3Ns?=
 =?utf-8?B?bXIrdnd6Smh2L2YweWZoTGxCT2dqejZ1M3VVU05nc3k0NGIxa3ozS1RrMXB6?=
 =?utf-8?B?M1luQUZWaWozckZJd2J6NVFYdGZMaUp1R2JEWHNzS2hyQUwzbFovaWZ6VVpF?=
 =?utf-8?B?TTJsamx0MTF1MFYxbWhrNjFTVk1QSDZqcVVCcFJCNXp5TkxuR2FBbXNLRFhq?=
 =?utf-8?B?dmxIWktkYmVkRUdMTVFQU2orN1EwVUZtTk9hbnZrbDZPeGoxSThHNktDdTVW?=
 =?utf-8?B?cU9nWHNINmtNME5MUHdTcjR4NzZqeGhPbTh1SFU5cytYRDhSY3I5YTZnaG05?=
 =?utf-8?B?Q2l5SnBiOEkrQWg1V1NjUHo5S0prTTExOHhGbWFpNDR2T0c3Q2l4TGF2dWNR?=
 =?utf-8?B?aXZXWUQ0VGNUZWwrSGQrcUNHUHgyNUd3cms0SWQwWWpNZkVsYUhQR2VpaXZZ?=
 =?utf-8?B?dmtPbFQ2M3B4anlpMmxGd21zSEozT3J3RHBRcnB4bmdrUFhWYlQ2ZmFHbzdY?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1bddd1-45ad-4e52-2307-08dd0f8fb89e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 09:33:31.0219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMVHM+48CqR+KX2p1T9hAGagGnxhDCR714KYA/yhmLHrwKGqCvJf+KukOJCf/zZDqlCfq9+AIL7Rc1+8GxLrwpu1clp9Y5NmtdRair9do8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

Hi Mikolaj,

> +static bool
> +is_bcs_ccs(const struct intel_execution_engine2 *e) {
> +	return e->class == I915_ENGINE_CLASS_COMPUTE ||
> +	       e->class == I915_ENGINE_CLASS_COPY;
> +}
> +

I am wondering if this function could be useful in its current form in
other tests in the future. As it is now its only purpose is to let us
save a few lines of code (instead of writing e->class == ... || e->class
== ... we call this function). What if you moved the logic from lines:

> +                 is_bcs_ccs(e) &&
> +                 is_bcs_ccs(other) &&
> +                 e->class != other->class

into the function? It would then compare two engine classes and return
"true" only if they are COPY/COMPUTE and actually different. This would
change the purpose of the function (and likely its name as well), so
treat this as a suggestion.

Krzysztof

> @@ -388,6 +394,13 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	 */
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
> +		/* Wa_14014494547:DG2 */
> +		if (IS_DG2(intel_get_drm_devid(device)) &&
> +		    is_bcs_ccs(e) &&
> +		    is_bcs_ccs(other) &&
> +		    e->class != other->class)
> +			continue;
> +
>  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> 
