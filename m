Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C40CF8540
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 06:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229B10E6E2;
	Thu, 20 Nov 2025 06:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvnAUpr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D5910E6DF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 06:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763618793; x=1795154793;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=osz4aH+3X+1NW+bn+ttz3A7IDiXFGXvnlOU9m/AS1dE=;
 b=NvnAUpr4y1lI7jkr/jFCqx2pEo9/sRPPBnftjXuFcDxHBrq38wTolB6A
 0fMO8E0b+ghJ+X1jCHyRHGH5xqfT8k4+hoUBGdG6InG5hxeB5W6qSM7KX
 rF6aBv+kBPgA0VsqRWBB0dl5517x586j22kPyuCV4bJ8sb19EBW/uaPGc
 rohFx+8dSCuowH34Nn9C1pTQCEwWQfQcrTmayTvlwFxXcg5aEL+3elxGm
 nXCDGE2YJcx15lrMv6IsD6to2ICfL79uyyCxxEa8GZzho1bVU6a2j8XDq
 beRNq3Zn2S7PbFAhwRuyypvjTvaYx6TyoVGXSx0IZOrS0lmBegIylMNCs Q==;
X-CSE-ConnectionGUID: SjAnXQ2mTxqrEFkFq5gX6Q==
X-CSE-MsgGUID: n42cUw2jS1e+DP3T5lhrzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69527968"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="69527968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:06:32 -0800
X-CSE-ConnectionGUID: +WE4bi6USJyv8LSgscq3qw==
X-CSE-MsgGUID: DKUM0yT4SJ+vRvudDWTygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="191059621"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 22:06:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:06:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 22:06:31 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:06:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYTJfG8pdZkgqQB24XEtNkLLyMqZJdF1wqIieMRcZ0Zt1+09hz+uyydta2RyZcBysaUmz/ITYLQarQbCPnSVxNYJ3jmlfpdt75zu3HzmiEunzbHyE0bpQb2CJAyK9I2J3SeEqzz6VgM5YtxhWvykQExvRfhVUXN08uFPL9JlAGp68jZOV+0i2Hlrf7ts8WstaNtMWEfdf6wBFi25KAOllbwyoSO8Kw1OGKf64aV0SKeQvtCcthBuIR/A8wUCaPeMHlihB9dNxh2faCJsL8xBt1mf/KW5av4yGmxv3SQXEYExcJqEp4LZbLVGTCi3piG11JEAt5upUxT1PVf/Py+RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICWXAdOf7rw7lvKazpEfUvJLmTecweUbqhQSaKN1PMI=;
 b=ezIGNWn29bl3nArTHQcSezF+f/LEU1+Sr0iN6K0QclkzVfc6IGdpH82O6+eYQsyQdh5W74474Ek7lIh2/JNrNO+xpg1Lvhr0SMfyn2iPUBrQABcZB2zlAuncmyyFdlpn/XKfary5J0ok9eUQhXzQSQzmUBKNcatzqU8TSIVOgdNHTMghdbNLFv+axXGWBu3xfdcCi4rHjxDNfTJZA636+JNRmqdCGkwLxXFT/IvWDMByRamE56GIl5T/xc4kWftJwVNDa6OAtzxOWM1FF4JjFIRVtSI3383RmtZ4FL7EMJqqsts4xGAAYYkVn+/cc4ee5pbzCTUDR8N9yI78NkNxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:06:29 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:06:29 +0000
Date: Thu, 20 Nov 2025 11:36:20 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Message-ID: <aR6vuANUcyHXOJRA@bvivekan-mobl1>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
 <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <aR2-bUaoRjDBsO93@bvivekan-mobl1>
 <SA3PR11MB80464E069FB8D679B69877E186D7A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA3PR11MB80464E069FB8D679B69877E186D7A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1f9835-f838-4ef3-314c-08de27faf1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGlEamQwVE9hMHZkVTNwcDNVbWVhSTV1WnZKMldBT1VtaUVWTm1JL05hLzFW?=
 =?utf-8?B?Mjc1bjExVWhweTFzWUdNNDllRi9sN2VxMEdRaW1PcjlwM1pjNy95d2wxaWxV?=
 =?utf-8?B?T2ZGcW5DbDVBb255QUdPdk92b0FZOFNKdnc4TWM1RXdKbjEycUJwOHpCNzhS?=
 =?utf-8?B?YkFUM0ZGYkgrMXJKaW5ldUo3Wm5jKytsQ0xwNjAzb2hxUmRKUlVkbmVqVHNo?=
 =?utf-8?B?VmZoNzNIMVN0Z0tvdGkzd2NNSE91eXN6MHZsbldUd3dYOERQSmh0bnQxQlJr?=
 =?utf-8?B?RllEaklQV0tITFBYYXdqV0lvMlJpcXp1UHpYUFdNWWtjNEFOdXRlRElVdFNh?=
 =?utf-8?B?TU91Rm1ZSXg5TWJ4aE1RZlhhOXV4NGZlK1RybjlOWDNwS1lqSkFUcmhvQW4v?=
 =?utf-8?B?dmtXRExKaXlaSTZaZk5HWWdiQVR0bi9iUi8zenkvYzlQOFhHa2JDNEJBVXdI?=
 =?utf-8?B?cWlKc2RWc0xSZDlvOUd4OG4vVmJ0MU1QeVZDTWJHL1JodDJuQ1VtTUFkWHJT?=
 =?utf-8?B?ODN6L29pOXA0eWkzTDlVVldiRTlMOVg4eTdzQmZ4Q21jemZ0MXFBdm54QjhN?=
 =?utf-8?B?UTdCZFBaaE5NSHZpN0VGR1JqOGFocjMvdk5VdVVDOEp4eFplTlJhWFN2N1l0?=
 =?utf-8?B?NnIrdkhXZStwa3Fla0k3N0Nydk9SQ25aQVNlTTFDeG1xU05xaEJwZUZwZVcr?=
 =?utf-8?B?MW1uU0xZclJEZFpXR1F2aXRoVDlUS0krc3E2RjU4WWZwbFlzc2QxQXVVTk1y?=
 =?utf-8?B?V1Uxdk1sUlB4Qmx5dEZxSks0M1FIMFdHZjBOWkF0WU4zSmJlOW9UTFFiQTY5?=
 =?utf-8?B?WUtsR090NWg3UGxpMk0wWWIyUGgrNUZWbkdPbGZQOTdQSlRXa3A4SDVQZENy?=
 =?utf-8?B?WGxGSnBXRmdLZXYzeVZYZ1cyekhESzl0NEIyeWxYUG5YN2d6ME9YMzNhd3JI?=
 =?utf-8?B?WjlOSTNVaGZXT2JTK2g0RWdHNmo0Rk1PakxLTW5zMVRmRHpxV3FaZDRuNzVw?=
 =?utf-8?B?aitQTnZBcE9BV2N3TzNBZ2poUkJ2Y3RmaEEyczdJcDRpYmpHS0JGUE54Z1Qx?=
 =?utf-8?B?WVY4L1RjUXlvVkxubTJvb1Z1b1VER0ZDYzYrQlJ5emgyeG1YNmNlNHRvTDAx?=
 =?utf-8?B?b0VuQmJMdHE1dTFYeStvdjNCNi9QVFlYWnZnYUJuVjh3K2ZENHhTOUlJSS82?=
 =?utf-8?B?SW5ybjQ1bHBFR2ZFcy8wYlBYUnpVcllGQ2pHUXM2VFBhK0x0bUVsdXB5czB0?=
 =?utf-8?B?ZkthcHRVRVBwUWJwcXk0ZFpwQ0xIdC9sN0xXZkZDM0tuS3dOaDJ3c2tuTksz?=
 =?utf-8?B?TXlZdmZPZWoyVHkzR1BQMjd2dnBTMldwaGZpSnZ1Qml3aWlFTUJIZlphaE0x?=
 =?utf-8?B?MVR2OTNYT1JtSEFwQ2VMV0JXenZDZTFSdGtnaW4yWFBvNGxWSVErL3ByczlT?=
 =?utf-8?B?T2JNc0dTUkZjMS82dWpDRmJrSkdvV1dPVnpjbzFkRjhuU2JzU2QxeEg1dVlv?=
 =?utf-8?B?STByM3d4RVg3dG95Tng5ZXQvTVg4NElid282OWNyZ01UWFhTWUJTbVhrNEJG?=
 =?utf-8?B?VHR0bXhiM2JMbWEzc0prS1VFNEpKVTlYQm90ck0yOFRZRnJ1LyswTk1OQzY2?=
 =?utf-8?B?Z0JrRmVLTk1vUFhhZENLVWF3eGFJT2NnNVBLblNvZmlSYXdRVFlKOHR0T2Iw?=
 =?utf-8?B?anc0akFyckZzVndHMHdLeDFCS2ljUkptMXkxaU84aWFGY3Rqa0FNMU13OHhL?=
 =?utf-8?B?SFE5N0REL1UyNi8vS2tsY2pMSm8rY0dyUTUwMXBqZGRMWTZuZHRSRkplZGNC?=
 =?utf-8?B?YnFNSUR5SnAvajBWaXp3YThLT3ZHUTZPQUUxSjhhMXpNL0lDOFk4OGpTTGEw?=
 =?utf-8?B?WHhPeTRCanFXZENlOWpSc0FOUlJwQlVoYldvWEtKQ0RHVUh1SGdZZEhVcVlO?=
 =?utf-8?Q?DUjXAIV/ZwNd1AFUM7ud7MoeEdLcuoN4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzY5eWZ2b2FyMnpScmovRHhTaXlCeC9iUnJXZ1F1Q2lsVUM3Rkk1UHBNWnhO?=
 =?utf-8?B?T2E1WVlSbFhHTXdNN1hpdFlYUTFLWHJ5V25BdVo3ZnR0TExvMk1kcm9qWWFn?=
 =?utf-8?B?VHh2WWlocGJhbE1MRnI0dEdlUklnTnorYS9tSEcxSzdXaldJeE50WGU5UmFt?=
 =?utf-8?B?MCtoZkgxWitTOFhPWEg0K2V2emVCR3VPcXg2OHVyMzM1SEhHNCtSNVdhQzVF?=
 =?utf-8?B?bkJESGIxT3dmdXpkcE1yeTlwNXVPRk9OZWZLdkxrQlFaWTB4WnZFUUYyZkYy?=
 =?utf-8?B?aHUzbnJJME5rb3FHVDJQNWoraXpjWjMzTjNZdXR1SHlvb0RUb3BTVG9KN0li?=
 =?utf-8?B?Q3UzTWduN1BlLzNZVmQyMWRZOWhWOWgyNlRPV0dCSjNIa0xsczNKcklyK1h4?=
 =?utf-8?B?ZzBGbm9NTmlldk0wWG80UU8vY3RIRnV5R085d2ExQ1VUR3BtemRlTVp1ZmRF?=
 =?utf-8?B?OXE5V1ZYS2hpZVVieFZRK0ZYOExDcVRqci9LUkNUTTV1OVZKSlgyb0szVmFI?=
 =?utf-8?B?SFI2a0c2dklidUJzMUFpRlA1VVExdGdmQ2ZGbEV6bHUvWmNnWEg4bWNJUzJ5?=
 =?utf-8?B?MzZ3MTZ4eXZqc0xtZFRFak5KQk9zVXFJMDExSWp6dkdhNWZuN2pYaTdqSUJP?=
 =?utf-8?B?NkJkUlpLTFg0QVdHY05teVlpT1dOWWFKamc3SkJLcW96b0xGcVpxMHZHYVhH?=
 =?utf-8?B?K0o5TnU4YW85anlHZjV3dmlVTU0rYlRxeWk0ejk1NWIwc2JzRUw5aWZwZTZa?=
 =?utf-8?B?VkxXOFZuek44UW9RUXlOWDdMSHdrVlg0cTRTeHBKNGlNakhQdGl6dXNjSks3?=
 =?utf-8?B?WDNMMG9CckVLc2YzN3JKTElPeGdnVnZPMkxNK3R6MEJqQWFxTExwWFEyc2ZJ?=
 =?utf-8?B?STRIemFGbVIrN0x4VnRqTEFXZFU3R2o5ZDlPSC9LamlZM3ZOWjl6N0xkQ3Zh?=
 =?utf-8?B?V3pSNzRhS21UYXk5c05kMDArUmM4WGEraGxQdDVybnJGWnQvVitzbUlmQ1Rx?=
 =?utf-8?B?Wm9YNi9XWG5OWDZ2bzd6anRCamdRemFKRHFSUmwzN0JFWUpjSlRrVW5FMTRK?=
 =?utf-8?B?RHlwVlNCTSszcTdYempXWFYwVmQ5NlZjdGpxL1dBM2c1Q3hwYnJCS0hucklz?=
 =?utf-8?B?Um1qQ1VvR0VBY2ppenpZMTY0VkNub296OWxtYmVNaEdTT0tYbWprWjVFUFla?=
 =?utf-8?B?V1BmSDg4aW9TN2F3OGFnVEZ3eWNBZHYzdERyb1k3czRYSUFtenE4VWdwU0tr?=
 =?utf-8?B?aXI5VGx0NUk0RFBVa2JJMTZIbHBKOTB1YitNU3pYZms0bjVYc1Izcnl6RUln?=
 =?utf-8?B?d2hBVHRMMmRpTGQ4K291ZTRzWnl1Vy9Rcm85b0IwS3h4RG9hV3BZcTA2WG14?=
 =?utf-8?B?bnZWVEhzRC80VFhZWXRTUnNsb0FiTURQVmdMUDJ6eDZlVjJGOVNNZGg4N24v?=
 =?utf-8?B?b3VMbHBMS0VuS1JNYmFYVnVJamJkUDAzMFAwSFZ2VDFsNERBdG9TV3AvZ0tj?=
 =?utf-8?B?ODE4Vi9ORUJ2cDFRN3l0RUxRTEg5dVVRZWlwcWc1Wk55V2dLU3pQbC8wSEVi?=
 =?utf-8?B?TGo5SHlIWldtdU1CSDFSREE5dHRHeFE5UVlKT25HYVdrRkt4V09UY0FxdXRT?=
 =?utf-8?B?N0M2ZFF1TUNXOWN0d1UyRjF1OU00c2MyT2U4ZEV6clpYZXQ2S2dqQ2EydTg0?=
 =?utf-8?B?cStSSGdMS3k0RUZlc2hRS1MwRzB0TnhWTzNEeExMamZHMVFySGNobUxseVJ4?=
 =?utf-8?B?Mm50VWRlZDh5OFBwWmovSVNpK0FQNUJVUGwxMHNYRXIrK3E4U0pKd0V0aXZI?=
 =?utf-8?B?ZjZTYjVkNUJHckQ1MVRnQkR0TUc2S3RGdEFQTUZTVzVsMm8xamNwaGV6UWxl?=
 =?utf-8?B?dEdLa3ZuVXliQ1hKbis5ZWNnY2N3TUw4aGdCa2szcFI1MDBsVUZXR1p2azBa?=
 =?utf-8?B?eEZRMVphY1VEc1k3dU5IWEhrNm50K2krWUkxbkZ0aWtJeHp1WnhwYncyVDQ4?=
 =?utf-8?B?SzFRS2k0TGtzZXNwdWdQajVpUjlwOFVNUldXVFBVYjBZTElKeFBXSHY4N3A3?=
 =?utf-8?B?THBnektYMlFOMFdGTE9qQUpzeTd5S0lic3B0aVlWdUtLbjJKZHZEN1RyUHNT?=
 =?utf-8?B?V08vbDhhVEM0ZEM2WktveS9jWGI3Z2FwVlVnWWVYaS83VTZYRDRWNk1wREk3?=
 =?utf-8?Q?9364j5RBLA+kF+Z4+JtUCvk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1f9835-f838-4ef3-314c-08de27faf1e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:06:29.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgPqDFmtLrl+xWdNAPNlJUMZG6veBqP/d7klzfnwnUCHyIbyPOluk+Gg+Mty71eSZMDKX7sdypY51w2ZK6OAQ+X43idSNlh7YDpLcFTkNdVNlR8HItEl8KXPXjTYDTt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

On 19.11.2025 22:09, Wang, X wrote:
> 
> 
> > -----Original Message-----
> > From: Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Sent: Wednesday, November 19, 2025 04:56
> > To: Wang, X <x.wang@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> > Francois <francois.dugast@intel.com>
> > Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
> > platforms
> > 
> > On 18.11.2025 23:24, Wang, X wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > Balasubramani Vivekanandan
> > > > Sent: Tuesday, November 18, 2025 06:25
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> > > > Francois <francois.dugast@intel.com>; Vivekanandan, Balasubramani
> > > > <balasubramani.vivekanandan@intel.com>
> > > > Subject: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy
> > > > for Xe2 platforms
> > > >
> > > > The source and destination mocs index fields has changed in the
> > > > MEM_COPY instruction in platforms after Xe2. So we need to check for
> > > > the IP version before placing the mocs index in the instruction.
> > > >
> > > > Signed-off-by: Balasubramani Vivekanandan
> > > > <balasubramani.vivekanandan@intel.com>
> > > > ---
> > > >  lib/intel_blt.h  |  4 +++-
> > > >  lib/xe/xe_spin.c | 11 +++++++++--
> > > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/lib/intel_blt.h b/lib/intel_blt.h index
> > > > 54a096c03..2fae045bc
> > > > 100644
> > > > --- a/lib/intel_blt.h
> > > > +++ b/lib/intel_blt.h
> > > > @@ -53,7 +53,9 @@
> > > >  #include "intel_cmds_info.h"
> > > >
> > > >  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 :
> > > > 256)
> > > > -#define XE2_MEM_COPY_MOCS_SHIFT                     25
> > > > +#define GEN12_MEM_COPY_MOCS_SHIFT		25
> > > > +#define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
> > > > +#define XE2_MEM_COPY_DST_MOCS_SHIFT		3
> > > >
> > > >  enum blt_color_depth {
> > > >  	CD_8bit,
> > > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index
> > > > 72b13ef42..1b12ce991
> > > > 100644
> > > > --- a/lib/xe/xe_spin.c
> > > > +++ b/lib/xe/xe_spin.c
> > > > @@ -54,6 +54,7 @@ void xe_spin_init(struct xe_spin *spin, struct
> > > > xe_spin_opts *opts)
> > > >  	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
> > > >  	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin,
> > > > timestamp);
> > > >  	int b = 0;
> > > > +	uint32_t devid;
> > > >
> > > >  	spin->start = 0;
> > > >  	spin->end = 0xffffffff;
> > > > @@ -163,8 +164,14 @@ void xe_spin_init(struct xe_spin *spin, struct
> > > > xe_spin_opts *opts)
> > > >  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
> > > >  		spin->batch[b++] = opts->mem_copy->dst_offset;
> > > >  		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
> > > > -		spin->batch[b++] = opts->mem_copy->src->mocs_index <<
> > > > XE2_MEM_COPY_MOCS_SHIFT |
> > > > -				   opts->mem_copy->dst->mocs_index;
> > > > +
> > > > +		devid = intel_get_drm_devid(opts->mem_copy->fd);
> > > > +		if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> > >
> > > NIT: could we use the existing helper intel_gen() ?
> > >  if (intel_gen(intel_get_drm_devid(opts->mem_copy->fd)) >= 20)
> > 
> > Both intel_gen() and intel_graphics_ver() are both checking for graphics_ver.
> > intel_gen() was created for legacy platforms where the graphics IPs where
> > identified by a generation.
> > Modern platforms has a separate version for each of its IPs like GT, Media,
> > Display. So I would suggest in any future code, we check for the IP_VER
> > instead of generation.
> > 
> 
> I don't think that distinction is quite right. intel_gen() is intended for scenarios where we only need to check the major IP version—like in this case, where we simply need to identify Xe2+ platforms. intel_graphics_ver()
>  combines the major and minor versions, so it is generally used when we need to check for a specific device revision. Both APIs are valid for use on legacy and post-Xe2 platforms, depending on the granularity required.

The original intention of intel_gen() was to check the graphics
generation, which is evident from the function name and the function
documentation. We can use intel_gen() to check the Major version of the
graphics IP because the same variable used for storing the generation
contains the major version of the graphics IP.
To check for only the major version of the graphics IP, I would prefer
to create a new function something like intel_graphics_major_ver().
Similarly we may need separate functions for media/display.
There is already redesign work in progress to remove the checks for
platform names or device ids and use the GMD IDs (versions of individual
IPs) on supported platforms. Therefore I am not creating any new
functions.

Regards,
Bala

> 
> Xin
> 
> > Regards,
> > Bala
> > 
> > >
> > > - Xin
> > >
> > > > +			spin->batch[b++] = opts->mem_copy->src-
> > > > >mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
> > > > +					   opts->mem_copy->dst->mocs_index
> > > > << XE2_MEM_COPY_DST_MOCS_SHIFT;
> > > > +		else
> > > > +			spin->batch[b++] = opts->mem_copy->src-
> > > > >mocs_index << GEN12_MEM_COPY_MOCS_SHIFT |
> > > > +					   opts->mem_copy->dst-
> > > > >mocs_index;
> > > >  	}
> > > >
> > > >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END |
> > MI_DO_COMPARE | 2;
> > > > --
> > > > 2.43.0
> > >
