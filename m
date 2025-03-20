Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B5BC36000
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 10:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADC10E399;
	Thu, 20 Mar 2025 10:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVpVOPWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990510E399
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742466350; x=1774002350;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mlRAge3GGqhOWSOabr+xjGGNZbouHPuMhE5dsnCVhGQ=;
 b=PVpVOPWAbcxXsoryfYB1iqOKKRlTF6kVgcxzObXmZo9OnXj58633+QQt
 s0mxp59uERqkejYQdkBnDFRpM2lENUbjcKoXRgDNlWaa/wnElZHSJUsEg
 yMr0BnHTTBnFSdM/+4mixvGlzjn1NClJSXV9CydA6IYieV4qq8HI/R5rW
 EBW0oMlt2WDVUqvKmoznEUOS514wr2OcC8xoR4ZfKRfwdDmPl7Ub9/O7/
 sAAiv0vBVs+VjyCJLp/kXApl/9ttEnrhwWqrHFn4XzhYDGw+QAV0WvoPN
 7B13fhNPbLR4qu1LaCPsmn7al8we3MU6jYxL2zx89UvubK2UhbI/XtTSS g==;
X-CSE-ConnectionGUID: lqeuwrubSg6s+XRuBKbi+w==
X-CSE-MsgGUID: H2MNDDaiQB26jA2jM6NFtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55073162"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55073162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:25:46 -0700
X-CSE-ConnectionGUID: 2a+YBAuzTwinDpwB67SW7A==
X-CSE-MsgGUID: TZFQwkeVTgaKRqzyqYffzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123058198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:25:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 03:25:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 03:25:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 03:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEJSpNUamEUC3oFxJOiV6OUqSMPt6XGyRT9KIyxNJLTcv1h9amzsj4XGl/JZdO/N2WLWuax3NYiTDXEg9tqMAOXq/pjpl/fqWBszCtRi/aN3Rg7jb7sVS4giIIr/D9o1RXWWJc4+97qQADGZ7KISdYhgFXBH6v0MuHzMQUNotWwY8jEiUJNmYKG+A9zYc8FyZ3aZOxXW3jsvY0vfdlkWvq+rc8YNVXLDSQGJVPiCsbhJiQDS5yahrNV8JO/AoCKaWY3LN119ysXK5QJmTVgV0R0VPEpx48/9FTvGFiMj/o7uXuH84bVeS8PrmpU5lzHV7xxbTHaoyGMJr6Scr+afFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSOPGsFQ9ZRHTtnfxc4PTdDVEiGXCGpqObf+aAZasUg=;
 b=DFpwPmc6ELQdTtdzCD/3QFMIsaE623zW8p+R9JJjq/loPVbWNcCzFGhCnci+kKTyf6vbP5MOw2WdT5ALor1G6Rtl4XlW/l3bv5QwLRIeCxxWPKe3pa05CUpJUm5bvpz/SFC+7iXJfapA1LCeLp2n+cSrpmpzeGLmkHxAtzNRM7FJ6EegYT7g44YyvzUMOBhoef4PN/rmCwFbYwZETMFoSYbSimNu7875pKyB/DXsXSk53Gs7EAyzdLGc4BdlWA3LV3vXVSyCjPRTLA7KwnxR5aSYjYzL/qZwtbQc4KNO+pq5s40t81G6dnvXg+PtdrPj8vGIovg0IotuS5rBy/dRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB8052.namprd11.prod.outlook.com (2603:10b6:8:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 10:25:42 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 10:25:39 +0000
Message-ID: <6a74fc48-e463-44d7-a6d5-4ac5f627e1c9@intel.com>
Date: Thu, 20 Mar 2025 15:55:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_plane_multiple: Add dual display
 subtest
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250312070821.610143-1-karthik.b.s@intel.com>
 <DM4PR11MB63129F52EA5D4D281908569990D92@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63129F52EA5D4D281908569990D92@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 6766c373-ae1e-46cb-231e-08dd67998fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlZTQ2tCQlJkZWFQc1d0QnI5RCtsbG5TQmJ0SmY0TjBwZ2xxenE5bTVjU0pz?=
 =?utf-8?B?OCtXaldyTzJwbU1tayt6TnpUTUVuNnpZL2ZoQ1pTSTUwNXk1bURjMnErdW1T?=
 =?utf-8?B?aUR4ZmpVQUhleUFoU1R2NGx6Z3d5djhRb0VDUElXNnVOVnU2c3ZGR0hnZjh4?=
 =?utf-8?B?ckJZb296ZTByRzV6TTJjVFpYZVlEc2Q1RmkzM3Nkd0ZHOHhSZFZjU1czUEdl?=
 =?utf-8?B?azlMWnlteWQrUmVDbmZQeVZZR2k1bElmYzRiNFR5V08zZ2dXRzF3ZGtPTVZH?=
 =?utf-8?B?dkN4Zm9PUHViRUU3SlMrVEVXZTN6eVE4SzNnUGRXVURwUjlrM1ZJMmFGOEQ0?=
 =?utf-8?B?MUtucHhxU1ZNaCtqRTYybFZRR3V1Sy85dmtKb1drOTYwM2lHcllja2d4NWcx?=
 =?utf-8?B?U0hvQ3BjY1k0OU40VUV5M2Y4R0NqSUFITm1WbnlhRkQ5TUlEQ29uUWsxL3BD?=
 =?utf-8?B?TllTN3RGY3VNMVlTUWtONWhZak5FVlR0MFk3bnBVL0hMVngvcncydUdOYzBG?=
 =?utf-8?B?UjgzbUI0SmthUlBHMkZHcnVrWm9hcTVBLzRUYnF5enI5Y0hlKzYvQVpDRmF0?=
 =?utf-8?B?eHJQejVnK2drMUdhbGdTL1NjOFdwbjNJeUdxVThuVE9tZVoxQ0g5QnZETTdV?=
 =?utf-8?B?a3hpNDh0OHZkMSthdXFZcmNBYjc3WnNFb3dJa0RlT3VGT0d1NHQ3Y3h4Qmxi?=
 =?utf-8?B?NmJSN2xMTjliZ2s2akduand4TU5JVUE4aGdhc3JKcnBqeG9oSDBDUmZxRE9h?=
 =?utf-8?B?NGl1bUxEQTJjSUFjQ21qeVBLaTFsbnY0WlRENWc4bGZLM2xBaFVDU0FaSWhF?=
 =?utf-8?B?KzRPcksxRkVHMi9Mak4rU05wZ25OL2Z3OUxNd1gxUXk2M1ZVc2VpS2gwOGpx?=
 =?utf-8?B?dHVjVWJqaUVKSmRBaC9rdG1YbDBOVFpNOGlBVC9YdUMvVzhkK3RKTFR1eXpF?=
 =?utf-8?B?SXM5UXpTa21JN21iTU5kaEE5aUtIQzVWOC9mTHE0UllUbHUxZVg5Y1dVcEJS?=
 =?utf-8?B?NlNQVHJzeXFqZkxjd1pQRS9NN0JnMlA0MGJvRDJQVDN4amtLbHVyd3FMM0Fq?=
 =?utf-8?B?YzlxdGJLVGx0b25QNmRXT1Q2M0ZkMVFuSCtVcXRwekg4NVU0N1YyZDNyZXFR?=
 =?utf-8?B?RGFDNnBnRjhDdFJjVUJVZERNd1ZvUG9ZaTdWdFBSb01xZVRBRmxTQnpaRjB2?=
 =?utf-8?B?dEN3TDhNRVBjVUY2cW94R3F1SENNZG9DeGVvOEwvaFM0L1VuSUNnUXNoZjRi?=
 =?utf-8?B?N3UxTUljK1Z3ajJwS1BhT1JIcnEwNlBTOHRJTStqb3NKdXpYckwvdEUxZ0RO?=
 =?utf-8?B?UWhiZy9tb2lYUllHRTYvQzY2bGo2RUFURUJ0Y0l3QkJ2aE1uOHhTdTZZQ2E4?=
 =?utf-8?B?ZWxaczg1SGVVd0dTaHdxWmFTWHp1T29tZWEybGxpVUF4TWFZNFNISjg5Rklw?=
 =?utf-8?B?NWZpQW1JOGNYSlMvc2VmQ21mU0MwQmhFUGM3aSt5dnRqTlpXdlRGVEwrS1VH?=
 =?utf-8?B?bWhScWZjb21aRks4YS9kdGNGd01mZXhocjlYZDUzeEVWUVRCTVZaS1htVHBi?=
 =?utf-8?B?QlYycmxKQ0lkS002L2IyZWhVb1V2VnBuNHcvQ09iSE1zMHUzL096azJZWExJ?=
 =?utf-8?B?dGdwVVVwRDNtWmJJdHVlRmxMVWtRZ2xLNTlSQzA3czVjaEozSzRhdW1acndV?=
 =?utf-8?B?emFyQm5hRWFFa1ZyQlh4aUp4aXhSbENZY0QydHFyZzl2TjgrQzcyWjlwNHZm?=
 =?utf-8?B?M3hMUzBGTldFa3VMTTQ0Qzh5MXQ4RHhsQndreENrRk9nZzgwdTlVOStseGlS?=
 =?utf-8?B?SGpOdEJKaHVuRExQSXBGYVQ5S0RxWVlYV3JhRUE5UGJoU0EvUFoydTBhck9C?=
 =?utf-8?Q?VBDyANWOkc9IH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1hDMlFDTk5sUks2VkJQU0NjTDJBdmR1Q01WMWc1Vlh4SE1paVFCL2p5NGsz?=
 =?utf-8?B?c2F1SXZySzgxQWxGNDU1amY5VmVjUnJvc0c2OE4zSXJNU1FiMHRQNU8wNEJL?=
 =?utf-8?B?MEpzZTVOS1I1NmxTQXFnYm1nVFdENEtFQmtsT2dPbStVdTd3UDRHQ0NTRHI2?=
 =?utf-8?B?OENNM3hiNzNzQjZMMDI5ak5vRldvMEVkcWFlTEZ2Wnc5ZTdZbms4bDIrMWpG?=
 =?utf-8?B?dkJIS1Qza3M1aXc3S3E1UGZiZzZ6TXR6OUJXQjJqeHpweHQxQlNXWkNQVHk3?=
 =?utf-8?B?eXY0WTFyS1FQcUxIS3NIbUxxNkVCVkhaUnh5c0FCbUJvYitKNjdUWVU2ZFBr?=
 =?utf-8?B?UHdNVTgvWU9pdTJBeTM3SjNCdHREKzk5K2pDcVNDVU16UEFxWmlMVDhxVWdR?=
 =?utf-8?B?UWsxQytDVzRvV0R6dFpRVndGeDBwbjVJNGNOaWFoenFGVGtjYWQ4WHJkWnBZ?=
 =?utf-8?B?MXdWMFgwVzFVODhuWkJVWHNzWm1WODFXY2Q2dTFJb29UdnFhd0NHRGw3UmlE?=
 =?utf-8?B?aWxNTmhJT3BTU3prNUROdFU0RXNGTmFFam5EWmhSSTFVeG12RjFTcThDZDd1?=
 =?utf-8?B?a1lrS0hIWjg0ODZpb1oxcXZGTDQ3R0QxaEdLYVlUR2xxcDBjUnJLWXlZbDho?=
 =?utf-8?B?OS9lZ3dVc0JGdjhnVXhrM3JRTFlrV3owYjdTSkl6d1dyWUhmanNGaVhXakM2?=
 =?utf-8?B?bGhabHFzS2RRb0hBYXM4MWtoZzl5bjBuam1YclJFK2pVL3BxTUE0NU1xV1FS?=
 =?utf-8?B?b2w2Sy9mc2hBT3FRQytJa0d5M0YzTHF5N3ltaGZOMkFvejF1R2lxTEhHQWhG?=
 =?utf-8?B?eE1XTDlhWWhMQUJ5MkZvYStHZDg4MzBjck9uYlNRanpwc25UVTAwQjliNyt6?=
 =?utf-8?B?elFnYnlTMjNud3hoYzFXNFJTNWgzdmRvejhsbUh3Y28wZkZpS2kyUWVLdXZE?=
 =?utf-8?B?TmJWbkF6K0gwZU9RWXlzcnJMR0ZiWXViVjkwdXFWRjdmeWdlbnZpbXc0alBD?=
 =?utf-8?B?dDdrUjVyTXkrSFNXRHBtK0NKYk8zQTN3WnQrVW9IMHZwZ1RTdFJBa2NTb2Fr?=
 =?utf-8?B?WTEyRy9hQWpzVFR4SHZlbXJDbXMxOVhyZDEvL084V3pLbGo5SnVuOTBlUzdT?=
 =?utf-8?B?SnRJb3RnekU2aDR2eDB3TW1UTXFNTnVzeW1NNzhrcU1PaEVmU2ZIYnVFUzdB?=
 =?utf-8?B?eUNVa0l4ZFdEMllwcVNyTERnMlRINndGTzU5SHJmLzRPbDNjSDVtQkl0Y3VM?=
 =?utf-8?B?WE93TnE1SnBzU2NZTzRVNy93ZFJtVnpvT0pNMDVQQXhLM0xzQWlPZGU0NVBj?=
 =?utf-8?B?RjVyNlJUR1o3WFB6QUpmZUVIQUtReDROMmxOcmpxL29yV1YxUm1IM3VxUFFa?=
 =?utf-8?B?cTFpNVZwWTBhUG8rVm5SYzRpY3RsRHEyYnkwWlVSdkRYUWZyRzRyYW5UV3g4?=
 =?utf-8?B?YkRXQnRkSjNWU0JzSTZoWm82Qk5xMWFuUHMzb2k0VmNYMktWV2dnSGVpTVpK?=
 =?utf-8?B?SFlMUFlRWWtZblk0RlloRksrK25DUDZRRDVXZ0xKYS8xUHZWZUNVZC9MdHpy?=
 =?utf-8?B?Y1dreEtETUxIZklBU0paYjR6SFMrc2NMaVRFQzdxY0tHMXZ0aGZVZ0V6d1I2?=
 =?utf-8?B?T1VmNFhTdS9SVDVCNjNEbHEySDBQL1Qzb3ZCTW5iemp6OEhTeWlsUlFaL3lD?=
 =?utf-8?B?L1pBTEJCYmdOeUtRTmJwM1o2WWZNQkx3R3NsaHVLaXJ2ckhvQjJTQmNydUN5?=
 =?utf-8?B?NXZJd2plTHIwQ05LdExtNjh5Y0VoY2IvL1ZCTk80VkkyTTVRTTU3QnYwZFV2?=
 =?utf-8?B?ak5UejMvWUJBRGo1OUVJYXpXNjNOUDhYVmRDbFc5MjBhUXJTWW1PR0VXY3Vj?=
 =?utf-8?B?SUxMVnVWZzdMbDJGSmdLWjkvVHllMkk0cVlLNjZzQzNHUTNON0dLc2w3Ty85?=
 =?utf-8?B?dUo3ZEJmK1BXWS9qZCtTdi9ySlAzclJXcXRIQ3J6ZnROTzVqM01vK1RUQUhU?=
 =?utf-8?B?NU1hYlJmRlBsMzNleVg0STM3Zkh0Qm1WdjkxdXh0ZHEzQmRKVFFydjNNUVR6?=
 =?utf-8?B?WERqbzkxWFhmT1VZVGN2dG83d3c4UjFTK2NvcnF6RTU5aW40SnJ4RnF6aWxM?=
 =?utf-8?B?YXhxU2UwOWhoQ3kxTlhHTWpNRFdZZmY2SDkyYVRqM1ZQTXZScjJJZFFhMTNN?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6766c373-ae1e-46cb-231e-08dd67998fa8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:25:39.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mJW6trWd1naq281QjCMiRwAO4A9Fr+CaykvfDsVol0wSx7//dYh7jQs8Tsy1C7nIBygfzZ+DxJDkvIIP5VI2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8052
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

Hi Jeevan,

On 3/19/2025 11:25 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Wednesday, March 12, 2025 12:38 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t v3] tests/kms_plane_multiple: Add dual display subtest
>>
>> Add 2x subtest to verify MPO use case simulataneously on two display
>> configurations.
>>
>> v2:
>> - Update the test to use all the modifiers (Jeevan)
>>
>> v3:
>> - Add modifier support check before starting dynamic subtests
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_plane_multiple.c | 235 +++++++++++++++++++++++++++++------
>> --
>>   1 file changed, 186 insertions(+), 49 deletions(-)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c index
>> eda300b06..1e100a5bc 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -55,6 +55,18 @@
>>    * @x:           x-tiling
>>    * @y:           y-tiling
>>    * @yf:          yf-tiling
>> + *
>> + * SUBTEST: 2x-tiling-%s
>> + * Description: Check that the kernel handles atomic updates of multiple
>> planes
>> + *		simultaneously committed on 2 displays.
>> + *
>> + * arg[1]:
>> + *
>> + * @none:	 no-tiling
>> + * @4:           4-tiling
>> + * @x:           x-tiling
>> + * @y:           y-tiling
>> + * @yf:          yf-tiling
>>    */
>>
>>   IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
>> @@ -73,10 +85,10 @@ typedef struct {  typedef struct {
>>   	int drm_fd;
>>   	igt_display_t display;
>> -	igt_crc_t ref_crc;
>> -	igt_pipe_crc_t *pipe_crc;
>> -	igt_plane_t **plane;
>> -	struct igt_fb *fb;
>> +	igt_crc_t ref_crc1, ref_crc2;
>> +	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
>> +	igt_plane_t **plane1, **plane2;
>> +	struct igt_fb *fb1, *fb2;
>>   } data_t;
>>
>>   /* Command line parameters. */
>> @@ -95,14 +107,14 @@ struct {
>>    */
>>   static void test_init(data_t *data, enum pipe pipe, int n_planes)  {
>> -	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>> +	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe,
>>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>>
>> -	data->plane = calloc(n_planes, sizeof(*data->plane));
>> -	igt_assert_f(data->plane != NULL, "Failed to allocate memory for
>> planes\n");
>> +	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
>> +	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for
>> +planes\n");
>>
>> -	data->fb = calloc(n_planes, sizeof(struct igt_fb));
>> -	igt_assert_f(data->fb != NULL, "Failed to allocate memory for FBs\n");
>> +	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for
>> +FBs\n");
>>   }
>>
>>   static void test_fini(data_t *data, igt_output_t *output, int n_planes) @@ -
>> 110,21 +122,21 @@ static void test_fini(data_t *data, igt_output_t *output,
>> int n_planes)
>>   	/* reset the constraint on the pipe */
>>   	igt_output_set_pipe(output, PIPE_ANY);
>>
>> -	igt_pipe_crc_free(data->pipe_crc);
>> -	data->pipe_crc = NULL;
>> +	igt_pipe_crc_free(data->pipe_crc1);
>> +	data->pipe_crc1 = NULL;
>>
>> -	free(data->plane);
>> -	data->plane = NULL;
>> +	free(data->plane1);
>> +	data->plane1 = NULL;
>>
>> -	free(data->fb);
>> -	data->fb = NULL;
>> +	free(data->fb1);
>> +	data->fb1 = NULL;
>>
>>   	igt_display_reset(&data->display);
>>   }
> I think we need to free resources related to second display like above.
>
> Apart from these LGTM.

Thank you for the review.

Sure, will add these cleanups in the 2 display cleanup function.

Thanks,
Karthik.B.S
>>   static void
>> -get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
>> -	      color_t *color, uint64_t modifier)
>> +get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
>> igt_pipe_crc_t *pipe_crc,
>> +	      color_t *color, igt_plane_t **plane, uint64_t modifier,
>> +igt_crc_t *ref_crc)
>>   {
>>   	drmModeModeInfo *mode;
>>   	igt_plane_t *primary;
>> @@ -134,7 +146,7 @@ get_reference_crc(data_t *data, igt_output_t
>> *output, enum pipe pipe,
>>   	igt_output_set_pipe(output, pipe);
>>
>>   	primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>> -	data->plane[primary->index] = primary;
>> +	plane[primary->index] = primary;
>>
>>   	mode = igt_output_get_mode(output);
>>
>> @@ -142,21 +154,21 @@ get_reference_crc(data_t *data, igt_output_t
>> *output, enum pipe pipe,
>>   			    DRM_FORMAT_XRGB8888,
>>   			    modifier,
>>   			    color->red, color->green, color->blue,
>> -			    &data->fb[primary->index]);
>> +			    &data->fb1[primary->index]);
>>
>> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
>>> index]);
>> +	igt_plane_set_fb(plane[primary->index], &data->fb1[primary-
>>> index]);
>>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>>   	igt_skip_on(ret != 0);
>>
>> -	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
>> +	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
>>   }
>>
>>   static void
>>   create_fb_for_mode_position(data_t *data, igt_output_t *output,
>> drmModeModeInfo *mode,
>>   			    color_t *color, int *rect_x, int *rect_y,
>>   			    int *rect_w, int *rect_h, uint64_t modifier,
>> -			    int max_planes)
>> +			    int max_planes, igt_fb_t *fb)
>>   {
>>   	unsigned int fb_id;
>>   	cairo_t *cr;
>> @@ -168,16 +180,16 @@ create_fb_for_mode_position(data_t *data,
>> igt_output_t *output, drmModeModeInfo
>>   			      mode->hdisplay, mode->vdisplay,
>>   			      DRM_FORMAT_XRGB8888,
>>   			      modifier,
>> -			      &data->fb[primary->index]);
>> +			      &fb[primary->index]);
>>   	igt_assert(fb_id);
>>
>> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
>> +	cr = igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
>>   	igt_paint_color(cr, rect_x[0], rect_y[0],
>>   			mode->hdisplay, mode->vdisplay,
>>   			color->red, color->green, color->blue);
>>
>>   	for (int i = 0; i < max_planes; i++) {
>> -		if (data->plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (data->plane1[i]->type == DRM_PLANE_TYPE_PRIMARY)
>>   			continue;
>>   		igt_paint_color(cr, rect_x[i], rect_y[i],
>>   				rect_w[i], rect_h[i], 0.0, 0.0, 0.0); @@ -188,8
>> +200,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t
>> *output, drmModeModeInfo
>>
>>
>>   static void
>> -prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
>> -	       uint64_t modifier, int max_planes, igt_output_t *output)
>> +prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t
>> **plane,
>> +	       uint64_t modifier, int max_planes, igt_output_t *output,
>> +igt_fb_t *fb)
>>   {
>>   	drmModeModeInfo *mode;
>>   	igt_pipe_t *pipe;
>> @@ -249,15 +261,14 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   		 * Here is made assumption primary plane will have
>>   		 * index zero.
>>   		 */
>> -		igt_plane_t *plane = igt_output_get_plane(output, suffle[i]);
>>   		uint32_t plane_format;
>>   		uint64_t plane_modifier;
>>
>> -		data->plane[i] = plane;
>> +		plane[i] = igt_output_get_plane(output, suffle[i]);
>>
>> -		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +		if (plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>>   			continue;
>> -		else if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +		else if (plane[i]->type == DRM_PLANE_TYPE_CURSOR)
>>   			size[i] = SIZE_CURSOR;
>>   		else
>>   			size[i] = SIZE_PLANE;
>> @@ -265,10 +276,12 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   		x[i] = rand() % (mode->hdisplay - size[i]);
>>   		y[i] = rand() % (mode->vdisplay - size[i]);
>>
>> -		plane_format = data->plane[i]->type ==
>> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 :
>> DRM_FORMAT_XRGB8888;
>> -		plane_modifier = data->plane[i]->type ==
>> DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
>> +		plane_format = plane[i]->type == DRM_PLANE_TYPE_CURSOR
>> ?
>> +						 DRM_FORMAT_ARGB8888 :
>> DRM_FORMAT_XRGB8888;
>> +		plane_modifier = plane[i]->type ==
>> DRM_PLANE_TYPE_CURSOR ?
>> +
>> DRM_FORMAT_MOD_LINEAR : modifier;
>>
>> -		igt_skip_on(!igt_plane_has_format_mod(plane,
>> plane_format,
>> +		igt_skip_on(!igt_plane_has_format_mod(plane[i],
>> plane_format,
>>   						      plane_modifier));
>>
>>   		igt_create_color_fb(data->drm_fd,
>> @@ -276,17 +289,17 @@ prepare_planes(data_t *data, enum pipe pipe_id,
>> color_t *color,
>>   				    plane_format,
>>   				    plane_modifier,
>>   				    color->red, color->green, color->blue,
>> -				    &data->fb[i]);
>> +				    &fb[i]);
>>
>> -		igt_plane_set_position(data->plane[i], x[i], y[i]);
>> -		igt_plane_set_fb(data->plane[i], &data->fb[i]);
>> +		igt_plane_set_position(plane[i], x[i], y[i]);
>> +		igt_plane_set_fb(plane[i], &fb[i]);
>>   	}
>>
>>   	/* primary plane */
>> -	data->plane[primary->index] = primary;
>> +	plane[primary->index] = primary;
>>   	create_fb_for_mode_position(data, output, mode, color, x, y,
>> -				    size, size, modifier, max_planes);
>> -	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary-
>>> index]);
>> +				    size, size, modifier, max_planes,
>> &fb[primary->index]);
>> +	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
>>   	free((void*)x);
>>   	free((void*)y);
>>   	free((void*)size);
>> @@ -332,12 +345,13 @@ test_plane_position_with_output(data_t *data,
>> enum pipe pipe,
>>
>>   	test_init(data, pipe, n_planes);
>>
>> -	get_reference_crc(data, output, pipe, &blue, modifier);
>> +	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
>> +			  data->plane1, modifier, &data->ref_crc1);
>>
>>   	/* Find out how many planes are allowed simultaneously */
>>   	do {
>>   		c++;
>> -		prepare_planes(data, pipe, &blue, modifier, c, output);
>> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
>> output,
>> +data->fb1);
>>   		err = igt_display_try_commit2(&data->display,
>> COMMIT_ATOMIC);
>>
>>   		for_each_plane_on_pipe(&data->display, pipe, plane) @@ -
>> 347,7 +361,7 @@ test_plane_position_with_output(data_t *data, enum pipe
>> pipe,
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>   		for (int x = 0; x < c; x++)
>> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
>> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>>   	} while (!err && c < n_planes);
>>
>>   	if (err)
>> @@ -361,14 +375,14 @@ test_plane_position_with_output(data_t *data,
>> enum pipe pipe,
>>   	while (i < iterations || loop_forever) {
>>
>>   		/* randomize planes and set up the holes */
>> -		prepare_planes(data, pipe, &blue, modifier, c, output);
>> +		prepare_planes(data, pipe, &blue, data->plane1, modifier, c,
>> output,
>> +data->fb1);
>>
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> -		igt_pipe_crc_start(data->pipe_crc);
>> +		igt_pipe_crc_start(data->pipe_crc1);
>>
>> -		igt_pipe_crc_get_current(data->display.drm_fd, data-
>>> pipe_crc, &crc);
>> -		igt_assert_crc_equal(&data->ref_crc, &crc);
>> -		igt_pipe_crc_stop(data->pipe_crc);
>> +		igt_pipe_crc_get_current(data->display.drm_fd, data-
>>> pipe_crc1, &crc);
>> +		igt_assert_crc_equal(&data->ref_crc1, &crc);
>> +		igt_pipe_crc_stop(data->pipe_crc1);
>>
>>   		for_each_plane_on_pipe(&data->display, pipe, plane)
>>   			igt_plane_set_fb(plane, NULL);
>> @@ -377,7 +391,7 @@ test_plane_position_with_output(data_t *data,
>> enum pipe pipe,
>>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>   		for (int x = 0; x < c; x++)
>> -			igt_remove_fb(data->drm_fd, &data->fb[x]);
>> +			igt_remove_fb(data->drm_fd, &data->fb1[x]);
>>
>>   		i++;
>>   	}
>> @@ -400,6 +414,115 @@ test_plane_position(data_t *data, enum pipe pipe,
>> igt_output_t *output, uint64_t
>>   					n_planes, modifier);
>>   }
>>
>> +static void test_init_2_display(data_t *data, enum pipe pipe1, enum
>> +pipe pipe2) {
>> +	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe1,
>> +					   IGT_PIPE_CRC_SOURCE_AUTO);
>> +	data->pipe_crc2 = igt_pipe_crc_new(data->drm_fd, pipe2,
>> +					   IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +	data->plane1 = calloc(2, sizeof(*data->plane1));
>> +	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for
>> +planes\n");
>> +
>> +	data->plane2 = calloc(2, sizeof(*data->plane2));
>> +	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for
>> +planes\n");
>> +
>> +	data->fb1 = calloc(2, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for
>> +FBs\n");
>> +
>> +	data->fb2 = calloc(2, sizeof(struct igt_fb));
>> +	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for
>> +FBs\n"); }
>> +
>> +static void test_fini_2_display(data_t *data) {
>> +	igt_pipe_crc_stop(data->pipe_crc1);
>> +	igt_pipe_crc_stop(data->pipe_crc2);
>> +
>> +	igt_display_reset(&data->display);
>> +}
>> +
>> +static void test_plane_position_2_display(data_t *data, enum pipe pipe1,
>> enum pipe pipe2,
>> +					  igt_output_t *output1, igt_output_t
>> *output2,
>> +					  uint64_t modifier)
>> +{
>> +	color_t blue  = { 0.0f, 0.0f, 1.0f };
>> +	igt_crc_t crc1, crc2;
>> +
>> +	test_init_2_display(data, pipe1, pipe2);
>> +	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
>> +			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data-
>>> ref_crc1);
>> +	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
>> +			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data-
>>> ref_crc2);
>> +
>> +	prepare_planes(data, pipe1, &blue, data->plane1,
>> +		       modifier, 2, output1, data->fb1);
>> +	prepare_planes(data, pipe2, &blue, data->plane2,
>> +		       modifier, 2, output2, data->fb2);
>> +
>> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +	igt_pipe_crc_start(data->pipe_crc1);
>> +	igt_pipe_crc_start(data->pipe_crc2);
>> +
>> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1,
>> &crc1);
>> +	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2,
>> +&crc2);
>> +
>> +	igt_assert_crc_equal(&data->ref_crc1, &crc1);
>> +	igt_assert_crc_equal(&data->ref_crc2, &crc2); }
>> +
>> +#define for_each_connected_output_local(display, output)		\
>> +	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs;
>> j__++)	\
>> +		for_each_if((((output) = &(display)->outputs[j__]), \
>> +			      igt_output_is_connected((output))))
>> +
>> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
>> +	for_each_connected_output_local((display), (output)) \
>> +		for_each_if(igt_pipe_connector_valid((pipe), (output)))
>> +
>> +static void run_2_display_test(data_t *data, uint64_t modifier) {
>> +	enum pipe pipe1, pipe2;
>> +	igt_output_t *output1, *output2;
>> +	igt_display_t *display = &data->display;
>> +
>> +	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
>> modifier))
>> +		return;
>> +
>> +	igt_display_reset(display);
>> +
>> +	for_each_pipe(display, pipe1) {
>> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
>> +			for_each_pipe(display, pipe2) {
>> +				if (pipe1 == pipe2)
>> +					continue;
>> +
>> +				for_each_valid_output_on_pipe_local(display,
>> pipe2, output2) {
>> +					if (output1 == output2)
>> +						continue;
>> +
>> +					igt_display_reset(display);
>> +
>> +					igt_output_set_pipe(output1, pipe1);
>> +					igt_output_set_pipe(output2, pipe2);
>> +
>> +					if
>> (!intel_pipe_output_combo_valid(display))
>> +						continue;
>> +
>> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
>> %s",
>> +
>> kmstest_pipe_name(pipe1), output1->name,
>> +
>> kmstest_pipe_name(pipe2), output2->name)
>> +
>> 	test_plane_position_2_display(data, pipe1, pipe2,
>> +
>> output1, output2,
>> +
>> modifier);
>> +
>> +					test_fini_2_display(data);
>> +				}
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   static void run_test(data_t *data, uint64_t modifier)  {
>>   	enum pipe pipe;
>> @@ -503,6 +626,20 @@ igt_main_args("", long_options, help_str,
>> opt_handler, NULL)
>>   			run_test(&data, subtests[i].modifier);
>>   	}
>>
>> +	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
>> +		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
>> +			int valid_outputs = 0;
>> +			igt_output_t *output;
>> +
>> +			for_each_connected_output(&data.display, output)
>> +				valid_outputs++;
>> +
>> +			igt_require(valid_outputs > 1);
>> +
>> +			run_2_display_test(&data, subtests[i].modifier);
>> +		}
>> +	}
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		drm_close_driver(data.drm_fd);
>> --
>> 2.43.0
