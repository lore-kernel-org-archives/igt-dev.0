Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F5CE69E9D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 10:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BBB10E9C6;
	Tue,  3 Dec 2024 10:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFalu2m8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8BA10E9C6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733220985; x=1764756985;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=b+MOOEldrGjtdxrQT17UKYzTAjc6ODv9KF81yCkeWeo=;
 b=nFalu2m8FY5VMzBDLOf97ufVz/hjBr0jrw0uLllLKAZ515KS6zwUt4mD
 tUqQ0Mtif7etmp8t1wnh7sptiz7cFCpyQz6zem/Q/O5AyrP4g/MSUgXD1
 VMjnPcV9gVbJEdRNEOMd14JROtlczlGKUKam4xjYcsB36GYvrZaCcfYXq
 dlK9zDCqzyQHGYzQwWYg+NENrisieBNEfaN1Swpe3ayHaxwqyWT6zKoEQ
 subM4TtTrE2l0NpxrW0ESu7153FtQEVAS8dcjkD1+Sr3gQHjqEJJFEHBM
 69pgwWlMgBZjumj1RdHzViyXnqV96MR7a00u7pDx/TfEW6duvR3dLw0Q1 Q==;
X-CSE-ConnectionGUID: hCB+iSQiR9aQaphzfXUB6Q==
X-CSE-MsgGUID: sLVIpLg5RQ6CGW3GNQ99IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43910172"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="43910172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 02:16:25 -0800
X-CSE-ConnectionGUID: hdKQN4xDTTOLpWQ6YRleKw==
X-CSE-MsgGUID: EVCbqg4VS2GokAtlc3MW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93055424"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 02:16:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:16:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 02:16:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 02:16:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2l3rdTY1cCjZOYtgKXSc/x+O0jRRe/2ELls6DUQKYLb0pFqu6RhEVgdsJDEsDHLOZo7FfkSWclAfqQGp/Gmuj2OY0JegHlRRKMSxr42eXQvZlsB4DE1eF1llZDhJJAe+/xBtQ4GWJB9OPYDyvK0l20RyV0O9h4IL3YXjVjGFvN9fNpVUHYZBKDlIVDkferChQrx7w0ThurI43q1SjPJQqXci8BIXsV/jnEoK0wMlxp/05Nr5WuoPWLn3+xUXqdHvGMkcCjTvvvvNnSpmll53kSmQamrWgknrudD+XxBYxtRcWSwNSWMzezS/jx6xKSeRIBeXqlhgo8XOkrtbJPrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJes3F0d2+LEH36TFP4AHd46n7Q5pK+7Bm5bBidZj2I=;
 b=hSzgeZdslOyJ1t/K2DkGlLeFFfB0fh+cNDDOpjHd5+uBLfvp4WTtBToo+lER1F9ZRc8wN+bEvMjehsyI/1o2yQfleGUHApk3OyaBuOiMJr3w6aEL8LBCa7XIGhEN8TypbvD41mg1w//rSUHCr4w5i7KaRiEiDEplDQ9uoPjhJJ/UjBU53OTwT+Jy4aOVueRE58mbTNsGAvUO07eCaeteRealKAvJaeUfECvx6hZ6HwIfNmXijc9WGql0KRLOk8h4flZFUCvEmopkH1wtYOGZf8noU48y7jgaE3uAp1E4jQ+lRQY8z1bdUyNuxjGbMWq/bZhgfPjwUHFQ01w92QEX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 10:16:20 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:16:20 +0000
Date: Tue, 3 Dec 2024 11:16:10 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>
CC: <krzysztof.karas@intel.com>, <eugene.kobyak@intel.com>
Subject: [PATCH] tests/intel/gem_ctx_param: Add GTT size test
Message-ID: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0299.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::10) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: be032548-6306-4901-d1cf-08dd13838808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERBeXRMaDcxSy9uS0lDeWhKRXdiYTlVdGpEdHhldDNEQXlZMW1OUHlLdlBq?=
 =?utf-8?B?Q084L2YyY09nMlQxZ0pHdGM1dFFMb0VNbk5UU3V3TW5NN0FmQWxxbkJDMDFm?=
 =?utf-8?B?Y0xLSjVqcDRSNE1PSG1hUTR6TWI0VWxSbU1sTzJVUUZaUFZSRlByd3ZDa0Zr?=
 =?utf-8?B?MjNwcXh3c29kS3lCMFAyMjRUaFVrbzkwR0FHZ2k2My8wbDA5VGM2dkVkdm5q?=
 =?utf-8?B?ZE11cUxBMW5uUkdUeFZ5aVQ3TXpxWDlJMEJFWk9YRDQxVyszbkNnS3l3SWRX?=
 =?utf-8?B?WEJ4QmI1ZDVwQmM1REEyb1ZMdW0waGcza1lmZVhESXpBUGJCSjc0R3h3b1Bk?=
 =?utf-8?B?NDdTVUJzMGw5bzh2QzhkYTdPUkdTdzJUV2M2ZDdOSFhSSDhDQjlvZjdOS09y?=
 =?utf-8?B?VTUwbDlwLzFVbHkxaTJoUHBraXo2SXNocXdyZXBYQjBLL1VORHNXRm14WGpi?=
 =?utf-8?B?aVNpRXk2OTMrMmdvZWR6ZkY0WlBEUlYzSTJkMnBQQXpXN3Q0aUFVRzAyMWRY?=
 =?utf-8?B?eFdERGVXYW1hY0lZSEQxZjR3eC9NYkRIMmkyWmtTNk1IWExFbUt0amttaGJ1?=
 =?utf-8?B?dXA2cnQySkYyMlZCZkdGWE1lU0hybTVMMnBvajNhMnVBNHRrVGVnTGJJTmNi?=
 =?utf-8?B?Z0JlSTNhZlppZlhTS3JYZWd1amZEcitMOWN3MkVWdXFDRFBsaGxaZHMybC9l?=
 =?utf-8?B?Qk5zYjV0MkRxOTFBVms0UCt5dU50QTkxNWgvVllEalZ5RU1OM3dlTitWTWxO?=
 =?utf-8?B?K3VHQkV6Q0hhZDhVWFptSGVSNWxsMlRZeGVRYmtlWEdsaktNbFJoYUZZRHpv?=
 =?utf-8?B?a3o3Y203UTFPNWQ5b2M0dEJyUU9vaWNnMnJJekM0UnRkUzRKeFhvMTdiTW9k?=
 =?utf-8?B?OTdidmZxQko2eGwzQUw3MnFTbmJwU2FNWnY2WDN2VUR4OUNoMElmOTJRdFht?=
 =?utf-8?B?K1NIWFpKV1dWd1l1RnpMMEZ6U0NiWTVtRlFFU2E3dDBieGl4a20ybTNLTmYr?=
 =?utf-8?B?Q1FsNE5VTjh2VGNrOUwwQkpMVnpGVDR6Mm93L1kzUVBIaEdpN21SYlRrTEhB?=
 =?utf-8?B?YS8reVJFbG9yVlRoOGZ0WTZNZnRpdjI1QTNsTmlYa1NVWUFlemtkcmlvNkNz?=
 =?utf-8?B?UCtpZUZoNmF0TllwcDBrOUMzc05HOERGN1JmRVZEclliYUFjWnRJbnF2dUhP?=
 =?utf-8?B?aXlKbXY3a1U0dmdtdmJteDJhRU1qTWxKTXZObjJxbk9nMHJ6TXhBNHVVajll?=
 =?utf-8?B?SzBkclQwTlZNTStiL1NhOXp5TVBpZGtpeWRRbnQ0dHhrZVhaUVZEbWwwZnBO?=
 =?utf-8?B?aWxYSXhCVDlrTERQK3VuMDBKaE1BNmJWNldsSis4ZGRXejhrQ1luc2lzM3o4?=
 =?utf-8?B?aVdEYUgxc0loTzJZWldKRFlEakYrWG1IM3F3K2wxOVBuR3kvT3U5WHRkZ3c1?=
 =?utf-8?B?MnYxMkpYNk1nRElpN094L3EvYm5lZDkrS2dMbDg1cjJrTXlWSVNQb0NvSlho?=
 =?utf-8?B?S0orSXZPTDYzRDBtRGhoN1N6ZDlxQVd2VkNLTzhGY2s0L0ZoaHpZajR5Vk9C?=
 =?utf-8?B?Vllpa2R3aElGRlJNOFgzRGNzRkx3dGFxS1M4N3YvSVluOHVZS1AyLzg0NWlX?=
 =?utf-8?B?blNlRmpHOHRldU5KaTRqUXltcWNrL29HcVE0TVI1QnFkSk5POGdkNHNlMjZt?=
 =?utf-8?B?am5UU0FUZnlCVTRlNFVnL2pqOW96ZGRYUW5HaUFnNDVHVzA2M0ZpYUZSVUdu?=
 =?utf-8?B?NUxPNE9hUlo0UHI0dXEva0xUZUxWSVBlMmN4QjdXeVVHRkIwZE1ZOVUzeVVS?=
 =?utf-8?B?SGdUSjIwSUpqUUwyT0lwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFpTUZWTUNUQm9zaldNeGZWV2FVRXFRUVNlOFdxbm11R1ViVFJtY2kwR1Qv?=
 =?utf-8?B?ZDVmTCtOVU9nN3h1Z3lvbUwzNi9VeEY4WmRkeHBDVE9vVk1lcjFjZlVYaDhJ?=
 =?utf-8?B?RnR4TmJKWnBsMnYxczBMeFZpSit3OGg0L0hPcVFpN3VBaGdNeE91bnpOM2N1?=
 =?utf-8?B?UC9QdlROVGttVFo1QnJXNjBDem84MHMvZWc5UUZIM0JOWDJXbFhRL0dPaS8x?=
 =?utf-8?B?TmtMZVFPT3oxSSsyS3ZQVkhGRVhWSzhDcklGWHFnQkdXUGk3ckJ4WFM0K2Qr?=
 =?utf-8?B?cXY2K290ZVNWVnZTUFdOSk94OHF3M0NwclRiNFpDd3orNmRwTEx0WURKQytK?=
 =?utf-8?B?M0lTMXJOU0owVldHRVBZbnNwTys4SXBYcUNNS0wrWGZ6YWMyMGd5akwrWWFL?=
 =?utf-8?B?Rk1KcDJxWDdjc1Fobzdod2kvWk5FVExiTkFDWVZyV1pxc0J2TCs4L3Y5bmhw?=
 =?utf-8?B?MlRGMXhHQkFsaDRNVE12ZkNSS2tMQmV1d1FpNGlIbDN2eFJHYmpQYm1leDRI?=
 =?utf-8?B?R0dvdkd0aE1YaE83ZzVSOFNjZFY4RFhhNEtGd05IZy9naHFyMU8rODRoVnoz?=
 =?utf-8?B?Zi9QTTc0bi9EMCtJdTVtazhyQ0ZoVG9ROXJjQVdwbjl2S28rTnBVY0YrZTdK?=
 =?utf-8?B?d3Izci9OUy9WZjUwOGlqOWlwVGp3aVRsd1RhNDNEdnJNTmEwR25tZWhHeHp3?=
 =?utf-8?B?MnIrQ2tScitXMzlwbVpIdWZtdllsd2czWFpQMjhXNzdISWp6YkxmUVQ2OWxn?=
 =?utf-8?B?M1UxNktUR1BRZzE3NTc2S0RYeENTeEVzQXVaWDJXdUtWUDZPTGRhbGZXT1h3?=
 =?utf-8?B?cmV5RzBmYTdQdVI0U0RFVmxWRjhvcGFXcG1MSWlqOVA4Ui96VGc1aGxGMWRv?=
 =?utf-8?B?U1c0ZnYwTmxjWVpRUlVkMjQ1SklPZ1hYaFJMSWRqbXBTcC9sMGhFaUZBYi9N?=
 =?utf-8?B?T2NJblQvQ05CU0U1WUNTbXNVdzduWjhoQVd4aGwrL3NFd3YxZ09XcEZCN2xy?=
 =?utf-8?B?ZW1tMnE4WnpSTjdDWlR2WkszMndIb3pBTmRueVkzL1pGc0Q2S1JkUS9SUkIv?=
 =?utf-8?B?SjJ4OFZLRnN1V1BXb1JKTXo4c2lEZ1QwOFAySGUvaFp2RUt6WHlBcStJZytY?=
 =?utf-8?B?bCtPK0Jyd1A3UExPQ0RpTkZvcGd0dUlVMG1vM0wrbDdzZEdvcHh2QWtrbCtm?=
 =?utf-8?B?Q29lUHdLb1l5T2ptOEVVdTNyRUxuZWpUcEkxVE1NWHRRUGRJYXBLL1g3d1I5?=
 =?utf-8?B?VFdBVDhuNDVOSHNZc0lQcVBHRUl0dzdzZ0pOTDVRdThqeWN4L1VkM1FxYWJm?=
 =?utf-8?B?UlJ0V2pUV1AvWkZQZExYa0xMTmErRFpGUWQrYW9XNlVFMWFucWtFZW0xeGdV?=
 =?utf-8?B?U0VZa0oxSDYxVDRBNTJqakR0QkdDNWJ2L0s1TitPWWJCWG5nY25IRXhOV1g5?=
 =?utf-8?B?T29pUFVNcmtBcDZqQ0RNMVNLYWtGUVRhd2l0TXpxTE1tVU8wdlhVZWl3SEdS?=
 =?utf-8?B?VzZIYThGalZ6WTUzaHJIRWpiZXdPVGVUL3E3eVJxMFNOOEhIYUEwbFJIMGtn?=
 =?utf-8?B?emRQNk1WV1VBSUJmSFpOSlk3Y3YzdXhldHk0OHRWSXRPVVpSMUVPUFhTdGxq?=
 =?utf-8?B?WEJQcVZEc2hhdUhIeEpMNXM1dWhxVmJaTksyTm9rei9vUWw5K3luZEdqTGxj?=
 =?utf-8?B?Y1B0ejVyQzRpSUFicmZpODFTcVFTL1I3RGM5aU1DOVVLZSs1MG5oVHVmNy9a?=
 =?utf-8?B?ZEMxQmIxSmY3Z3VTYnRJTlNCbS8rcmdzVjIweEQ3ZS9SYnBhRjRmbGt5dkV6?=
 =?utf-8?B?cUo2Qm43cDZ3OUFUNGpsMDVCRkdSRUVQNGRaN3QxUzEyajB2cGd1ZHVKYVh6?=
 =?utf-8?B?RGdrdDRVNVh0eEtYenMyeTdmU044dm83NUlmMGk2alFDRDV5Mkw5QmVjY1A4?=
 =?utf-8?B?SUZSYnpQRjMzNkl0ZE5SOFphZWQvRFR0OVllaUdCTEhBQXAxeHR0L1M3U1FO?=
 =?utf-8?B?dGU5VWRJaTlBeDZvZFVKVGJNUm5YcStKWWt2UTNEQ0tjanEvZ3JoOWkyOTRY?=
 =?utf-8?B?QlhaK0ExUC9aRUpCdHBMZGJhb3BCalJKU29RMG80UTVuSjFhVnpTdndpbTgz?=
 =?utf-8?B?TC9XSndueGVYeG1nb01tclMwR0pKZndiaWJ5RmtobnVwMVV0djBBcUM5allY?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be032548-6306-4901-d1cf-08dd13838808
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:16:20.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRUutiooVOv38JYTnQe/JmOfswuQtwr+QO7o8nUHPcEbtJ1HVG8UOCATD156DicpQ71uzhJyCvY6yOrN/6pknwn2x2zdg8/KwgIcaqGs6is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
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

Create test checking if driver reports total GTT size.

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
 tests/intel/gem_ctx_param.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index 2e39a519b..bb208cf22 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -107,6 +107,9 @@
  *
  * SUBTEST: vm
  * Description: Tests that multiple contexts can share the same VMA
+ *
+ * SUBTEST: gtt-size
+ * Description: Tests that total size of GTT is power of two
  */
 
 IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
@@ -468,6 +471,16 @@ igt_main
 	igt_subtest("vm")
 		test_vm(fd);
 
+	arg.param = I915_CONTEXT_PARAM_GTT_SIZE;
+
+	igt_describe("Tests that total size of GTT is power of two");
+	igt_subtest("gtt-size") {
+		gem_context_get_param(fd, &arg);
+
+		igt_assert_neq_u64(arg.value, 0);
+		igt_assert(is_power_of_two(arg.value));
+	}
+
 	arg.param = I915_CONTEXT_PARAM_PRIORITY;
 
 	igt_describe("Verify that context set param ioctl returns relevant error if driver "
-- 
2.47.1

