Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBD4C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 10:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8710E2A1;
	Mon,  2 Jun 2025 10:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxrfoxAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4C10E2A1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748859428; x=1780395428;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IVG2rb0+oFVqkyRzcTByO6LZG84jninQwHtMOx17niE=;
 b=UxrfoxAsf3d3YMRnrlo7nDIeGrTCdcnefQVEQeJAvjwaQIFy1Xbw/L9m
 VJgHG1qYPx21I7ECIZFZXg8U1X8kjge3NLmyvsNVL2EaNIvMjkuKKkPJD
 WCFLgKrCLqBaP99NJG+ethG7Kt2T3O6s+yTxUvFqKwVYw9C4s2BMGmzyv
 7XS9Q/wGOLOvhrM1gRelQtbgEwLxikbQrv471gS7Vg4HtbPdShi4G7VLL
 WGMxeget1UhQsewVTb3TE5W/++wc2NZMufKFSil7lYZmPySpzN3nm0jtj
 TvIE1cr8BhiK80Og6PFXVhbf0FHMAJwyKIplkPLq/mk6kpXyPeRtXTcB2 g==;
X-CSE-ConnectionGUID: xlnnACuNT4KzNt9EpYTcaw==
X-CSE-MsgGUID: 4ozWUHkmRX2mdCAZl7ZvYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50104392"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50104392"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:17:04 -0700
X-CSE-ConnectionGUID: kN8DZhmTQIKSQWHCwt9oyQ==
X-CSE-MsgGUID: jCP2m0LjQCqBDdQjJxXYww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144338862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:17:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 03:17:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 03:17:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.65)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 03:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g98hwNY67EOgQ3By9MYs1+MIE7wyzTpZYCvddTwviQDpm5EoJ0BEU0XRLc6GyyQ0xhLfqPfFuNC8cA0y6oUi1qAo6iSVJphFgbxR4W6AqbpaBPoUmx/7+7x+l2UEXhGL/Nn3XCWOBzaJ7ySYaQPX+ujcQ/MuhkahFzJFIpNjQdsTUC7leDwOs6jIo6r3eC7i8AjeN48ChiGqX2DD5/OxO57xOFUwNiwbEE7XjDKGylWo/UUXFp1Stzm7YxNAs+YF8MDCe6K2Xh3ELoKNSyeY3lU5Efr/YqDD113EQP3MMl6pUDCAez3HU4SHGBfUxlMJRYtFoPUETAPh10PPJasO6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3ehpWVvGiGJMz/A7McW4rmK77ctx/xCZfSGQUV/Axo=;
 b=IYc/NCIJ3Q/9/TeTd64NWGOy03VsrfTPE4dm4skxkaSMvp+MQbwi2DZgJBKPrK9MJr2lgWZXkYTSq2AIZSYyFbEGgnyuM2P9Uug8EGiurGojFHPkpV2L1b8zjnsHaRc6Ki32Dc1shx0u8DrbX1n8ELTK3vV8mHLrMbK2Z0FT8rJ68MFZyUWT94rjWa0lP4hFKFALxKLpq1M9M4pntLIwBEm8ZMtvCKg7tnP7FzU9vWEA1IhXjdqw46t477XdxZg9rHdvhzkB3NqYGJlEY2L48uqRVX68BsOkHaJg1NQdcGxEJv9FtwojTnKUJrkRdGhiaVvo6LT+yXQBUB6xhRud7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 10:17:00 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 10:17:00 +0000
Message-ID: <810a9e07-51d6-41a4-b09c-9f86566ef15c@intel.com>
Date: Mon, 2 Jun 2025 15:46:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>
References: <20250529090841.4177513-1-sk.anirban@intel.com>
 <20250529090841.4177513-2-sk.anirban@intel.com>
 <20250530194341.45pvnnf64em7xd4u@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250530194341.45pvnnf64em7xd4u@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: ed52814d-92c3-480f-ab66-08dda1be9c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjVJZEpxZkxFV1NZSVBkNFB2M28zbUFqVXM1SWZpcnZDbjhHcFM0d1hkMmEy?=
 =?utf-8?B?NW9nN1hveGEybzhZVzFDK3grWjFWeDdONDNQYWFmSkU2RW5mcXpmeXZMOTZN?=
 =?utf-8?B?aUN6V3dMQUcvOW5FcmlLUEZZSGZyMWYvSG1TYm5Cdk9WS3JkVHp2ZEVvWWpI?=
 =?utf-8?B?UGhXWTN0UXBhYWVOb2gyRWxyalZGN0NhallFVTZ3TUIzNVBEN3hRd1hMRndn?=
 =?utf-8?B?djE4ZXM4UmlUMGNNYUFFN3FKMTFFMXVEZTA0bVl6VFp2OVJ1TzUva0dMRjgx?=
 =?utf-8?B?UUJxVHRsckxBbkMzeGlQaGFjK2xjUEFaRXhKcDZYZk1HSVpZcXdsVUdYOFoy?=
 =?utf-8?B?ZDZjQ3oyNGNYa2MwaDVQY2hJUUtpSnlPZGtvWXFmQkZ6NVhPa3JMczNIakRV?=
 =?utf-8?B?U0s2Yk81Y2o5eVZLdncyK0o5c1lRL3J5V2hvN3NyUy9wRlcwdkpWeWtDSlhn?=
 =?utf-8?B?NWlEbEVyQys4VFVqWllDSGF0RWVyaC82ZEE3QUFPNmwreTNWRWsvc2Y0Z25E?=
 =?utf-8?B?a0E3emc4N0pJVVhFVG5hVGxZM0ZlTzE0WVYyMlJMTUErUXBEUGpIaGZIY05Z?=
 =?utf-8?B?NldCR0VhMFYxVm1lTE1sUlVzQVRIcnVQRG1sS1plSUJTMEhWTFVWMjhDQlVP?=
 =?utf-8?B?UGpuTnY5QUhMK1lhL2x2M0k1ejN3ZDR1UG8rNjdjZktSOUpZeWo2Q3pyeTU0?=
 =?utf-8?B?N2NISkhqS3p2MHo4VGZ5ZjdWTnBDM1NiWTZ2cHVlbDY5WlpHOHJVVi95NFFW?=
 =?utf-8?B?elRpZjdaamtyVVQwSkZmK2JLc00raGd6TC95RXdmQzJVcnFJaWVMczN6L0Vo?=
 =?utf-8?B?M29WeGVLZjJTbkNVZ0xLVDBLN29tOVVKb0tWMFRsZ01EUW56dEVBdnVjSmJk?=
 =?utf-8?B?OVFFVVpNRUlreDBOWGk5aXB0aGVoYmRrRkFpQWJxcW1uLzc0K2tYNTVoZWFz?=
 =?utf-8?B?eU41YnFXclhrSERuMmhsMG9pQkZacG9MQ3poZWU3SExvaDd3eVdkd2VRWVFK?=
 =?utf-8?B?NUJWU1BVSHhBQmgrMndVR2w3WEdqRDNKQmJIbEVtamJncVdsTFROTHpDc0Zk?=
 =?utf-8?B?OWk3SVp1OVNzSWlmWm1nZ2o1ai9BU25vb1J5ZEU4bzA2U0g4SVRpa0V2YnhZ?=
 =?utf-8?B?NVRpWDE1REE2MVRUMGxmUUdlSmZQb3VHam1CQTdWVzhWNys1RElUSllMV2VX?=
 =?utf-8?B?dUtMZGNJNXArRnJmNjcxWGNVdm1GSERxRC9zYmIxNUgvNmFFem9NMXNmV1RW?=
 =?utf-8?B?M01PVHErOUtINEpndE9reXJsZ3JqNjN4dVRXZlV3K1BvNVk2LytFNGV1a3Ba?=
 =?utf-8?B?VW1TaFV1ZUdUUXdsaUQ0U01nQklpcG95NC9uUVBsRUVlQmw5QW1wbjY3RGha?=
 =?utf-8?B?bE5tSzMrVVYxRThDUnViWHdaQlhQVGVVYzhOWXRlVXFWWDhXaFZoeXp0cWR1?=
 =?utf-8?B?WDRKUG1WRk9tQm96L1h3MTBiVnNwL2M5OW1mcXMrMEdYUGRiNW1ORk9EZXI5?=
 =?utf-8?B?NEdieVMxNmZ1blYzMmN2YWk1QWtRRXRrTEU3aWJmYlRtQmw5bGFCbUNGMmdZ?=
 =?utf-8?B?T0lLUEluMzN6WjFLMytBUmV5SnhGYjZ5cGhUTU1kblFnRjZFL0VxWjZuZ2xZ?=
 =?utf-8?B?c0Yrdnlxb3FIUmpyQjAvQWxBQ0gzS1MzR3luZzErRzF6WHdKenN6UTBxamo2?=
 =?utf-8?B?Z2pnT0lzdENHaTJKUEFkeWFoUmdiVGIwRURqV243NTBxUXo0MVFnVmdxbHVn?=
 =?utf-8?B?a3hKRGR3a2toYi9ja0pLL2JzYU5uQ3JWeUZ1OXduTUxCQTd5VSsrSGlobEZ5?=
 =?utf-8?B?OTJwTHJ4QS84ZGg4Q1RFUEJOOHdLMXFwOERFMnZPSWlCS2llN2RFOXcvUFRV?=
 =?utf-8?B?VHlpRCs1d0hZQTdEQXRkcThFTG1PWGd3VG9KQXJ1RlhTaHROMEFvSC94dWhD?=
 =?utf-8?Q?h6/qTi1eU44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUpqNDlwamZqeG15d3dGeS9LS2xqa21UY3lwVjBOajNyS3ZKdUFldlVDWmQ4?=
 =?utf-8?B?YVp2TEUrY1VIMjlJRHl3TGdIcmRzYVlSRFNuWjZBMno1M0dxOC95WnlTTnRw?=
 =?utf-8?B?eXBKa3pFUDdjRXgvMnR0OTl3aWpQbE1tWlF0bXNXTlBMbDhsV2tvN2pIakFN?=
 =?utf-8?B?VHhXSWdKQUpOMDBrbTdQOFk0eUZLYjFScnlDL3U3TDgvNCs1VENiZWtnU3Fi?=
 =?utf-8?B?UXdlZDh3bmt2dW9NaUJieUxyRzVpc0RBSXJHSGNkdEtYVmVpRlhHdDdVdklT?=
 =?utf-8?B?L216MmZlUW1aUzNYeEN0MW10V1g4M3BLNmFDYzEyNTVQaEJHd1QzcUQ4YjU0?=
 =?utf-8?B?SzNUNERuVWJtUm81bGg5aFQ4ZE5nTjhueVVwQ1NadEhMckFrbGR6cTFZUEpw?=
 =?utf-8?B?c2hzbnpvQ3ZPSUMvTTJYTkRhMGY0NVRqSlI5MENXamNCbU9IalNaSllBTERT?=
 =?utf-8?B?V29WQTZtMU9MQWR6b3N0ZGNvbFVNSnVyT3ZsMGYzVnhxdlh6cEwxRWxBNThF?=
 =?utf-8?B?T1IySlNSNnRPcVVBdkRWYnk0Z1VLOU5ZR294Zm1QTElhRW9TemhEMlcvakg1?=
 =?utf-8?B?MGVwUEdPMHdCVTlDeXJMZlAxUHBFSXVQekw0SUV2NGNVS0NvcHNJZW01eGVs?=
 =?utf-8?B?WUJwZXpMK245bGlERWhwTWwvN2lWR1Zxa054WExWMm5sWFM3MGM1KzB0d3pF?=
 =?utf-8?B?Z1AyMTJvMUsvN3FuUDEvcy82ZnJ3VjJvMGZDc1FGYzNjZDdqZTVEcnhlemFJ?=
 =?utf-8?B?dlpoZSsrRThrb29Fd25HQnNrcy9UQVZ0SStzRms2eEQzZWRsNVk5TjB5Wk80?=
 =?utf-8?B?aWdjTGhPVWN3LzRpU2F6NG5MUzYzbzJwTHZvcE84YTR3NHVsQ0U1N25DRmcy?=
 =?utf-8?B?QjJOaVozTjJ5TjNrcXlrZCt1QXhkSjFGK0VpRHNiaC9GemhITDh5YjFEUXpT?=
 =?utf-8?B?OGIwdnpTQ29ka0g4dmhoM1FWaWpLOUo4NWpCaGZTcHE4a3lXWHk3SHBVQVVy?=
 =?utf-8?B?VWtNK0Q5ODBvYVA2T3VNZCtURHhjczBCR3p1aHVTMHJhM0toalZmQjY2U3lT?=
 =?utf-8?B?L04vUmxpVFpYUHJvYS9WMWI2cXU0S0RxdnFBKzc2THV5c0svYzFBelZIbExI?=
 =?utf-8?B?dTYrRHNXaTVrMllwYXVUZXJ3OFVVaVhyT0cyeXlCWldYcURHZVNqNDRsY05i?=
 =?utf-8?B?R2VkUndsdkpoWnNicTcrOEdRNUVPNEd0UDZWL2tGM2I2R216citGT2toSEdV?=
 =?utf-8?B?UU8zWDE1S0szaGtKVEUvMFlYbGFGb2lCYnltMk1lenRIUXVRbFo2Rng5NXg4?=
 =?utf-8?B?L1RSNHl0emhRRmwvRzJZYzU2dUR1QmtBbHFMNm13bEU1Q3hsSnZ6bTdTTEw1?=
 =?utf-8?B?VDZtc3dWZmVGZHlwaW5ERzhoa0JSMHBwNlY5d2FRS0xKQVJrdlJLSmlPcXl0?=
 =?utf-8?B?ekxkTTBmNjB3RVNkMlY5MkJQYTlPdDFHYldmZE1lNlcxcGlzR09yU2dlRU4w?=
 =?utf-8?B?Tkk1S3U5alJQV05vZTRMWStqMTd2RWZNa0U0cTd5Y09nc0hPOXhBQ2xGWkVN?=
 =?utf-8?B?RWptdDM5TXZNd1MyTW5hRm81VGlrazRPeTk0cmZ2a3FNZVVrdWU1TlM3OVBB?=
 =?utf-8?B?LzFLSmJmaUZ4NVlnMjVaTnlhYlB1cFFYanQ0aS82eTRid1pQOXVoT3Y1R29X?=
 =?utf-8?B?VXVXbmk0dGJURDZRZDdEZnMrQ2FIbnVQNG5FSEU0TXlHZ1pYOE9CWi9yZ2ky?=
 =?utf-8?B?L2dOWFhKZEdRdG5mbkkyUVBZanVGbEtkdFlJOGEwbkVHeEtQcGpsZzVEZWlI?=
 =?utf-8?B?U2FPZVNVV2RjY3pORGlPdFNBaDdpTzBxQVgySzdaUXNrQjJqMWx3K01Eekh0?=
 =?utf-8?B?VVhvSjRPZUxDT0J6cXRUWm5TdXBqUWlpTHVSdTllWVZ0V1N5TVRuK3lGMldy?=
 =?utf-8?B?a0dFT2V4OU15WFlZM3B1MWYzeFpWMFR6Q0RxTVVNdEVTWHhwWFF6L0c4aWVq?=
 =?utf-8?B?UForTHBzUUhIZ0hzd3dPR2tTOU9OcjZ2TGREcTBoMDQwTDU1UE5JQWNUUmNQ?=
 =?utf-8?B?YUphK0JNak1wbTNOZVQ5YStjWDdpQTFEZjJ6cnBLeUdLT0ZIb2tpNEk3Tlc2?=
 =?utf-8?Q?iGgn4hQmRUzZNrx8XvVpF+Ehm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed52814d-92c3-480f-ab66-08dda1be9c37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 10:17:00.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WxZe+aFalWsQZL0ckjkNljmX0sOtag7j+ArYyMziVp43R04CIklGHtD+FzjpTXxy/7nF/idotdWfk3hkdy1iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
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

Hi Kamil,

On 31-05-2025 01:13, Kamil Konieczny wrote:
> Hi Sk,
> On 2025-05-29 at 14:38:40 +0530, Sk Anirban wrote:
>> Leverage IGT spinner to trigger frequency scaling and
>> set RPS minimum frequency to RP0 for achieving peak frequency.
>> This method replaces the existing waitboost mechanism used
>> to reach maximum frequency.
>>
>> v4:
>>   - Cosmetic changes (Riana)
>>
>> v5:
>>   - Limit the power consumption test to GT0 only
> Imho this should be a separate patch with its own description
> why you need only for GT0.
The test was targeting GT0 only in the past. Maybe I will add a 
descriptive commit message for this.
>> v6:
>>   - Fix frequency restoration (Riana)
>>
>> v7:
>>   - Fix variable scope (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 125 +++++++++++++++++++---------
>>   1 file changed, 86 insertions(+), 39 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
>> index c9128481d..e7a34b0da 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>>   	return false;
>>   }
>>   
>> -static uint32_t batch_create(int fd)
>> -{
>> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
>> -	uint32_t handle;
>> -
>> -	handle = gem_create(fd, 4096);
>> -	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> -
>> -	return handle;
>> -}
>> -
>>   static int open_pmu(int i915, uint64_t config)
>>   {
>>   	int fd;
>> @@ -286,45 +275,88 @@ static int open_pmu(int i915, uint64_t config)
>>   	return fd;
>>   }
>>   
>> -#define WAITBOOST 0x1
>> +#define FREQUENT_BOOST 0x1
>>   #define ONCE 0x2
>>   
>>   static void sighandler(int sig)
>>   {
>>   }
>>   
>> -static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
>> +static uint32_t get_freq(int dirfd, uint8_t id)
>> +{
>> +	uint32_t val;
>> +
>> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>> +
>> +	return val;
>> +}
>> +
>> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
>> +{
>> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
>> +}
>> +
>> +uint32_t stash_min;
> ^
> static uint32_t stash_min;
>
> Also add:
> static int s_dirfd = -1;
>
>> +
>> +static void restore_freq(int sig)
>> +{
>> +	int i915 = -1;
>> +	int dirfd;
>> +	int gt = 0;
>> +
> Add here:
> 	if (s_dirfd == -1)
> 		return;
>
>> +	i915 = drm_open_driver(DRIVER_INTEL);
>> +	dirfd = igt_sysfs_gt_open(i915, 0);
>> +	igt_sysfs_gt_open(i915, gt);
>> +
>> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
>> +
>> +	drm_close_driver(i915);
> This looks incorrect, in signal handler you should only make one
> write with restoration of stash_min, so only dirfd and stash_min
> are needed.
> Also this is a last call before exit so no asserts here, if you
> really need it you could make restoring with assert at test end.
> In summary, here:
> 	if (stash_min)
> 		set_freq(s_dirfd, RPS_MIN_FREQ_MHZ, stash_min);
I will fix the above code, I will be removing the igt_assert from the 
restoration block.
>> +	close(dirfd);
>> +}
>> +
>> +static void bg_load(int i915, const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
>> +		    unsigned int flags, unsigned long *ctl, unsigned int gt)
>>   {
>>   	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
>> -	struct drm_i915_gem_exec_object2 obj = {
>> -		.handle = batch_create(i915),
>> -	};
>> -	struct drm_i915_gem_execbuffer2 execbuf = {
>> -		.buffers_ptr = to_user_pointer(&obj),
>> -		.buffer_count = 1,
>> -		.flags = engine_flags,
>> -		.rsvd1 = ctx_id,
>> -	};
>>   	struct sigaction act = {
>>   		.sa_handler = sighandler
>>   	};
>> +	int64_t timeout = 1;
>> +	uint64_t ahnd;
>> +	int rp0;
>>   
>> +	ahnd = get_reloc_ahnd(i915, ctx->id);
>> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>   	sigaction(SIGINT, &act, NULL);
>>   	do {
>>   		uint64_t submit, wait, elapsed;
>>   		struct timespec tv = {};
>> +		igt_spin_t *spin;
>>   
>>   		igt_nsec_elapsed(&tv);
>> -
>> -		gem_execbuf(i915, &execbuf);
>> +		spin = igt_spin_new(i915,
>> +				    .ahnd = ahnd,
>> +				    .ctx = ctx,
>> +				    .engine = engine_flags);
>>   		submit = igt_nsec_elapsed(&tv);
>> -		if (flags & WAITBOOST) {
>> -			gem_sync(i915, obj.handle);
>> +		if (flags & FREQUENT_BOOST) {
>> +			/* Set MIN freq to RP0 to achieve the peak freq */
>> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
>> +			igt_assert(gem_bo_busy(i915, spin->handle));
>> +			gem_wait(i915, spin->handle, &timeout);
>> +
>> +			/* Restore the MIN freq back to default */
>> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
>> +			igt_spin_end(spin);
>> +			igt_spin_free(i915, spin);
>> +			gem_quiescent_gpu(i915);
>>   			if (flags & ONCE)
>> -				flags &= ~WAITBOOST;
>> +				flags &= ~FREQUENT_BOOST;
>>   		} else  {
>> -			while (gem_bo_busy(i915, obj.handle))
>> -				usleep(0);
>> +			igt_assert(gem_bo_busy(i915, spin->handle));
>> +			igt_spin_end(spin);
>> +			igt_spin_free(i915, spin);
>> +			gem_quiescent_gpu(i915);
>>   		}
>>   		wait = igt_nsec_elapsed(&tv);
>>   
>> @@ -350,6 +382,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
>>   		/* aim for ~1% busy */
>>   		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>>   	} while (!READ_ONCE(*ctl));
>> +	put_ahnd(ahnd);
>>   }
>>   
>>   static void kill_children(int sig)
>> @@ -361,9 +394,9 @@ static void kill_children(int sig)
>>   	signal(sig, old);
>>   }
>>   
>> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>> +static void rc6_idle(int i915, const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
>>   {
>> -	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>> +	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>>   	const int tolerance = 20; /* Some RC6 is better than none! */
>>   	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>>   	struct {
>> @@ -371,10 +404,11 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>>   		unsigned int flags;
>>   		double power;
>>   	} phases[] = {
>> +		{ "once", FREQUENT_BOOST | ONCE },
>>   		{ "normal", 0 },
>> -		{ "boost", WAITBOOST },
>> -		{ "once", WAITBOOST | ONCE },
>> +		{ "boost", FREQUENT_BOOST }
>>   	};
>> +	int dirfd = igt_sysfs_gt_open(i915, gt);
>>   	struct power_sample sample[2];
>>   	unsigned long slept, cycles;
>>   	unsigned long *done;
>> @@ -407,12 +441,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>>   
>>   	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>>   
>> +	if (gt) {
>> +		close(fd);
>> +		close(dirfd);
>> +		igt_power_close(&gpu);
>> +		return;
>> +	}
>> +
>>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>   
>> +	stash_min = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
>> +
>>   	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>>   		memset(done, 0, 2 * sizeof(*done));
>>   		igt_fork(child, 1) /* Setup up a very light load */
>> -			bg_load(i915, ctx_id, flags, phases[p].flags, done);
>> +			bg_load(i915, ctx, dirfd, flags, phases[p].flags, done, gt);
>>   
>>   		igt_power_get_energy(&gpu, &sample[0]);
>>   		cycles = -READ_ONCE(done[1]);
>> @@ -451,15 +494,16 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>>   
>>   	munmap(done, 4096);
>>   	close(fd);
>> +	close(dirfd);
>>   
>>   	igt_power_close(&gpu);
>>   
>> -	if (phases[1].power - phases[0].power > 10) {
>> -		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
>> +	if (phases[2].power - phases[1].power > 20 && !gem_has_lmem(i915)) {
>> +		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
>>   			     "Exceeded energy expectations for single busy wait load\n"
>>   			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
>> -			     phases[2].power, phases[0].power, phases[1].power,
>> -			     phases[0].power + (phases[1].power - phases[0].power) / 2);
>> +			     phases[0].power, phases[1].power, phases[2].power,
>> +			     phases[1].power + (phases[2].power - phases[1].power) / 2);
>>   	}
>>   }
>>   
>> @@ -582,19 +626,22 @@ igt_main
>>   	igt_subtest_with_dynamic("rc6-idle") {
>>   		const struct intel_execution_engine2 *e;
>>   
> You should set stash_min and s_dirfd before installing exit handler.
>
>> +		igt_install_exit_handler(restore_freq);
> This should be before ..multiprocess_start(), your test may skip
> in case require will trigger skip.
>
> Regards,
> Kamil
sure, I will check this.

Thanks,
Anirban
>
>>   		igt_require_gem(i915);
>>   		gem_quiescent_gpu(i915);
>> +		intel_allocator_multiprocess_start();
>>   
>>   		i915_for_each_gt(i915, dirfd, gt) {
>>   			ctx = intel_ctx_create_for_gt(i915, gt);
>>   			for_each_ctx_engine(i915, ctx, e) {
>>   				if (e->instance == 0) {
>>   					igt_dynamic_f("gt%u-%s", gt, e->name)
>> -						rc6_idle(i915, ctx->id, e->flags, gt);
>> +						rc6_idle(i915, ctx, e->flags, gt);
>>   				}
>>   			}
>>   			intel_ctx_destroy(i915, ctx);
>>   		}
>> +		intel_allocator_multiprocess_stop();
>>   	}
>>   
>>   	igt_subtest_with_dynamic("rc6-fence") {
>> -- 
>> 2.34.1
>>

