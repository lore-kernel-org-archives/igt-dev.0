Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149CFC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 15:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA40010E82C;
	Thu, 24 Apr 2025 15:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC4Vv2SD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9024010E82C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745509341; x=1777045341;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HxYx9Xvx8gqzTkvpknD4ORso/FUOSSr1oCKS23o41Go=;
 b=MC4Vv2SDxuTTHljky+TdgKrLjLmqB/WkZoGNhPNz3GeSSkV1lHHUkC2h
 FViG6Mq1wPVhF4J4kjNm7/GiJHGq/2iGDoXN7NEzRb6PnuRoXOsgGMCq9
 47eV0jHlZIjYIFju97DG4hk5jxWua3veCI0++3ERPCpUy43laLIgqenfl
 7QR32ehPzV+grVta+Gp6SELg1XwtaTGJ40mgQTv5qCS09RIqXDxdgjGfK
 Y7cQPf0ISUu4AANGCOZe0eJVuCOuq90ls2mnSjCL/vw/URJ8/4jMxPHjO
 qtJhIP158atn9Y6XrfrpzG+PZbCpGWro1v/fBLbQS9A+4hNdSPhLnJjjb A==;
X-CSE-ConnectionGUID: K1HwybqEQDC01k1F/oXZKA==
X-CSE-MsgGUID: QH1+67eWTxKhSGztpOpKTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47328481"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="47328481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:42:20 -0700
X-CSE-ConnectionGUID: gJIYtvYLTWqitIfCK0w3CA==
X-CSE-MsgGUID: QGVC4+3ATRShvNkfMKV7ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137507531"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:42:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 08:42:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 08:42:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 08:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJM5b1/uDfp7tdLEGyLYbI4lBFNnk3S3q+5Y8y45Ux3HbR/E/XY1sQvpnK/kod4kv6evNo0ScwYbyQlc65IHX8dFRZnziSqeEa+um+Av39Vf5xnlr7ROoFvTa8T8mJPbOwHWfgG3gw67NiLsf+kwW+ugwgRP91gUm/Bm+6oVms1xwhuPtSAbeRuyAYxjZ8af86dblgpuWg+iVLbPCbGdJyh7MyRPZvUQzSg46yJOX7jOkjO5oYW0r1KmvIX7bYV4hPQy51IER/Bo7mnebhXzdSA3Xgyhx5e1Hf8Gsq2/WKKfNcL75Ud4q1HTXMSBo8EUZPNVERLzrXFfXCd2RiBQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2qPIP6Z0pyozV0eCF1S9oy4rhHBRJIA4QsQEi/lPX8=;
 b=i2tkjFI+y+QvJZ36N0+jdUSGWpkBP8gwjzbtw+52IaS7WRuivCp/SR/NY95y/rYhAEKxqQUusAWw1jdr3zm5VmQ3eZ5Hka+WAED+HpzRpz8uWdjzwG31kbAhVxxrGvlkvql7s2FbmBzQJXy6nAv7vRGloQEgJlSdJpuoZWFqwkul+qC9IEVH3gviyrPb1V9HisxIU/8E58zNU/BIDt2hNaSv4xh3EjyCvf/8QGxkPIaNd3jbD02iWdIKMMfqUu1+RqbDcAvjJttpjGIXNonv1c5KcWW9bTkkpugeIxRiHVw0m2ekrl+qpbZDouCHKUDQXOi3HUrqfefbo798c+TVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 15:42:17 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8655.038; Thu, 24 Apr 2025
 15:42:17 +0000
Message-ID: <67109cff-05c1-4b64-8545-78b04791db7e@intel.com>
Date: Thu, 24 Apr 2025 08:42:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pxp: Terminate PXP on exit
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
 <20250418145447.h4kpkferveojdrvx@kamilkon-DESK.igk.intel.com>
 <1936bed7-a7cc-4483-a9d1-db9aefa515c7@intel.com>
 <20250424112431.sabgltn3tdxgl72u@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250424112431.sabgltn3tdxgl72u@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: d6983e37-a548-49a7-cccc-08dd8346978b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEZpUllSNGNSejRKcGJERng0Q2pSbUNuY3l6R1ZKbWhXd0VBNEZDT3ZZTGYx?=
 =?utf-8?B?ZXYyZklTOU9tNkFyMFJCUnpkZVJEMzNBYm1lbHpQakpTc2dVM2dZM2crcjVJ?=
 =?utf-8?B?RGJSOTNRZ0tHWGxyczN5am9CcGk1NVJOZXQwSGpiVGVDSmxPQld5WnZwMnBH?=
 =?utf-8?B?djJwTWdNUy8ySkw1Y1ZlUTl1ck9KK3NXbGtzR0RpRVNoeVlIc1cydzdTWHVE?=
 =?utf-8?B?TTBIU0dCYUwyaVdZdjJ3NUpqMXpUMzVIL3o0Ync3SGZEZVpoM01aVmg5bVVz?=
 =?utf-8?B?WFBPVVhvcmk3K0UvcU1qemh5VVhvdTk0aGx5MFRoLzVFM1VxWVZHUWJrajc4?=
 =?utf-8?B?QzBxUGZaWTVzSjlPNVpta0pTT1k5cHN5TDBtZ2hXVDFRNVNEYjNjOHFISE5u?=
 =?utf-8?B?OTNLU2VMaUdrbGlyUUxkY240K3Uva05ZbEY1SVJrMFQ1THcwd25iT2YxNmF3?=
 =?utf-8?B?U0N0bEdlTm03NUZCQ3hKb01kZVZLQXdBWTMyMEFuUWR5YkdubWt4UUJzQWZK?=
 =?utf-8?B?QWpWM3Jxc1ZaVVpuL25hNGVWeXNCNVh5NVl5Y1VjelFHYWZjTi9CdWhCa01v?=
 =?utf-8?B?aytnYzVIdllPOWlOVGNXZU1LOW9CVXViZWNFbTlMZjJtVVMyUVp3ZGpnZE4w?=
 =?utf-8?B?clRnRlFQeXVJUFk3MHpKNWFQVmVmZHE0emhoQS9RZHdBRnpieHo4d1VXTXVT?=
 =?utf-8?B?amhiZDhxcnUrZklsaUtSN2JIYlc3Tk0vS1VpdnpiMHkzS2lTb2xUS1JKYytQ?=
 =?utf-8?B?YWNDbzZvMHZsdlllaHBQN3lpZEFDdnhBOEtsb3VGdDNCbmFxUjF6dHlGOVh0?=
 =?utf-8?B?U3VIL0xRM0VZaC90UEJWQ2RDU3RDNWh1SElWaU5UMnhyK3VSdHBheGZoVE01?=
 =?utf-8?B?Ky9OS0FsNmRkSnJpT3VrOFRRRTJ5U3AvZDBUa3lZMWpxNklldkkvc0ZiYm95?=
 =?utf-8?B?R1pzbEZicGdtUktLR05Db3pDYmdWM3NCbXJLWE5wd2xhMVpiakRpVkNYYmsw?=
 =?utf-8?B?MW95OE1QTjRtWjhJRXI3NlluRlRld3A0S3pkTHdjL0Yrak9mTFVYZENCNWpO?=
 =?utf-8?B?NXlOTDFFQTNVSmhnVGVMVXlxS2hMeWlFVHVvM0ZqeUxwRSthQkNkdGw4VElL?=
 =?utf-8?B?aHBLOTJpYVZLNEI4YXBCWUdrRElKcFgyVlkxWWlJdFpmOEVmUWhOK1NsVmxF?=
 =?utf-8?B?UTVNTmZscG9mWDEybTFGYU51c3B1cmVXSzBjN0JjRTRZTThJVVgzU3pacGJu?=
 =?utf-8?B?UUlxdzhOU0FHSWpHRmZsd0RNcmJyNTFSdmpha296ZmIwMGNWa2dienlCWklU?=
 =?utf-8?B?RXdKY2xsbUg0dllKOUJUU2tFT01yYjJscS9iT3FNRmFDWkUwYU0vcjIzK3gz?=
 =?utf-8?B?Z1Ewd2tsS1JmOWZuOWRwRldZRnZRL1h0S3dnMFdpZjBFaGpacFUyeGN4WVFV?=
 =?utf-8?B?NGVIQ1VKWlN6aTErLzhKbUxPUkxMSDJ6SEQyUFkzVGhNbEtPUXE1cW8rMXdF?=
 =?utf-8?B?N2laWjEzeDc1T1Y0aWtiVWNXZW16YzZGZXM1UDc5a0dsdFNZZjdmYW4zc2pD?=
 =?utf-8?B?b1kvcTJjVkJyVUlxc1VOWmliUmlEdXJGVnI2anlWS3hNYkgzUVRwVjRiYVJl?=
 =?utf-8?B?ZjBtbThVajFaazluSitaU0lVYmhpZGZiNnJra29uTWZoT2paYUk4djZFWWRU?=
 =?utf-8?B?dmU5MWFDOG1JSmpid3BnU0NjN0pNUjBRUTVCVE1IVVYrMzgvNm9NQ3FIRERP?=
 =?utf-8?B?WHFFNlVvRFRLb1hEdnR1U1RXRXZFSmlYR3YvSTFKdDFnSkxRaUFqek10ZnhX?=
 =?utf-8?B?ZmN3SmVpYWVEVVVjZS9IZyt4NWc0WTJ1WDhkQU1QVUJScms0ZFI4V0JUdDZw?=
 =?utf-8?B?NzZPRHBUc09rY1VjaEhHcXpiV1Jpcm93RGpiZXF6dVhoMkkxODRDY2VndlZp?=
 =?utf-8?Q?vjmN37nc0bY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZWZnMvVVk4T09vcnc5a2Q4Mlg4Nml6WjRiSVRuYlNSR0Z1R2ZkbGwzT0JR?=
 =?utf-8?B?alZIZTVOVGFWOTdJMzc1SkhEd21aeHVsTEE5aWVjU2hGQUlXNFQ3emhqQmVZ?=
 =?utf-8?B?ZitQMzZ5OXIrYzFibFBTYThZdjBMcWZ4L0NhYTV4ejNrOU90WFk3eVgyclI3?=
 =?utf-8?B?MjJvYzRPTFRsWlVtWTBuUWkrZ3lTVlRvaUxpT0YrUlRZNWFsbEJzOGtMRFZn?=
 =?utf-8?B?NjZBOTNFc3Qwb3ZHdnNFeDFha3hIdEtkS21qOWZFTnZsb1l6WkxYNVV2K0Iz?=
 =?utf-8?B?eUNNbFpNTUoyRWlyWFVvNWFRb3h2SEtsNHkrT2dwb1VaNFd6RTNuNmQ0SFhx?=
 =?utf-8?B?TktjZDBKcUtxVzRheWFtbEtaTkcwUXllSjdseHluQ0xrbU00YmlQRGxYTHcv?=
 =?utf-8?B?Zno2dWNOWVNsRnlMWXZ0aWsyaTFVTVl0bDQrWU5Ga0RES2ZxY2Q3dHUralEr?=
 =?utf-8?B?clFDZ1QvRGNUaGJINnJPTm5NUGRVMG5JYjE5T2YzWWk0MDRIcFpXOU55b3Vu?=
 =?utf-8?B?V2VnUEdLQ2RGb2U3eFJ2ZUNrT3Y3MURtWWE4NzRpellab2xQYTZiVVcvOGJR?=
 =?utf-8?B?TnljMGNNQ3FZem1zM1p6UlRqZjZ5bWtLeEMvOTJ4eTQwSnRXZHNNcDMxbW0y?=
 =?utf-8?B?MGwvSktublIxQWVCMjN5SC8rZFRLZTZJY1dKckNscGhSL0YxY3hZc3gyUUQ2?=
 =?utf-8?B?NzI0UG0vSnNVU2FtMEQvUjZxUjNCdEs1SGNSSWlNTEttT1hwcHBSN0xrLzlK?=
 =?utf-8?B?ekJSZkpPQ0c0aHAweUdrR3V2OHpJODQzcUNvWHJoYmkzSGprN29SVldjZHdu?=
 =?utf-8?B?cllUTHZ1dVBxT2NYNE9OUS80RDFoYk5ZWmZBQUIraXNld2NLTFI0dG9GZ2RM?=
 =?utf-8?B?anYrWEtQZzNYbC82S1lzcWdobGNQbWVDU1FQWVgxMjRNUmZXV1NKVWMrU2pU?=
 =?utf-8?B?T1A3ODJSa2ZoRzNiNWN0S2FrQlh4MStveHp1WVZDN2NXZForcTdZblUyM3Av?=
 =?utf-8?B?VlN3d3NuNmxzaWNyVy9lTGRzdXdkMGJnei8vUWFuRXluSU9WM25zU3V2MDZD?=
 =?utf-8?B?dHZXL3lTRjFxSlJDS0I1V244V3k0SjRHK0hWWXN1WkVnQ1NtYVMxWkJ5UzhU?=
 =?utf-8?B?Nnc2R1l1ZGhDZkx2WTV1RTRZRi8wYWdpVCtsc01vQldoQjRrREl0Mk9KNmVN?=
 =?utf-8?B?MlBZNmVWekl1QWpPUlc4ZXIxQ2dIVmNPTDZKRitxdEdsZTdBaU9pZWtGMktv?=
 =?utf-8?B?dCsvMldKOEpHNTUxeXJzRXFVRHg0VDc4ek1leGVkdHRiZk44bXB1Nm1xR2FG?=
 =?utf-8?B?YmwzRk80dGlKVFV2QkRWZXh6eHUxeU1wVEtDUC9UbkpIeS9IWXBiSWZPZlVi?=
 =?utf-8?B?cFBZanBCSVdQQ0czREduTVBXV0dYeEMvb1gxc3ZrNGNMd1MyeWxxaitwcnlU?=
 =?utf-8?B?UWM2NS9jSkUzbGZySEJnYTd1Zkt2cDR1OFlvUzVGOVRkclVFUDFSQmpSWG5l?=
 =?utf-8?B?K2lPSHM3S0ZjTkY5dlFnU3JnR1lGdnhzQi9adjIvRjJRTzY2b3ZERUJWM21t?=
 =?utf-8?B?TytyMzE0MHFWNngrNFp2eXAybDZucTVSY1BhQkRsaldqMHNxNld5WHdUbDVJ?=
 =?utf-8?B?TXphZ0U2R0hUeTNIdVdzalBIaXZKNnY4Q3o0K2xGUExVYmhwWFVIZzczMGw4?=
 =?utf-8?B?MDRxQU9RL0FrTmVhUks1Q1NuL1lCbkJQQXpuZDZjOHJZSEcwQ3lyR1FvbklI?=
 =?utf-8?B?eTY2ajV0YnBHMkxnZ2F6QTZxVWJVeThFZi9pQVJrckljcWdISWJ0TnpEMkdp?=
 =?utf-8?B?Vmd0bDdXdFlrUUJsV3hpWUxhUXFqVm5GYzBINmpSMFNjblJKRzlRb1NxQ0N0?=
 =?utf-8?B?M293S3FOSmN1Nzk0NlBaemIyRzhkVDU4d0phNHlOYmpqZEdNeTJ4akZNOWxq?=
 =?utf-8?B?eFFJUlVObGxkcFd4cUhmN3ZrTUtZdUZzWlg1UU5wQmxxUzdPZjdpb01YdFN3?=
 =?utf-8?B?eG4vR1pHVjFtVUUzQ2swMHRtTVVYSlhsTUdPUGFOd1A1ZFhrN3NSSWtOT25X?=
 =?utf-8?B?VWVhTzJTU1dVc25pclB2MGRoelRFV2dPTWNHV1VxakpLcTZrOVMvdVV1YXNn?=
 =?utf-8?B?dCtTYWcvT2MwbGNDRjBVcDJlUmhaUlptWDdrUVE5b2RnSy90MzNIb294ZXkx?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6983e37-a548-49a7-cccc-08dd8346978b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:42:17.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrSxzJ3rubj5JbPZJT/Cv38Z3blxgNJq9YH9apkahhW+49dxrHID/+9mq3+b2fCpJjXF0TvbQp6m+3YN1/HMBQjJb185la0kbLhh+dvuhWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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



On 4/24/2025 4:24 AM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2025-04-18 at 09:53:42 -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 4/18/2025 7:54 AM, Kamil Konieczny wrote:
>>> Hi Daniele,
>>> On 2025-04-17 at 16:57:19 -0700, Daniele Ceraolo Spurio wrote:
>>>> Most of out tests expect to start their execution from a clean GPU state.
>>>> However, the PXP tests currently leave a PXP session running when they
>>>> complete, so follow up tests will not have a clean starting state; given
>>>> that PXP can impact the timing of some operations (e.g. suspend/resume),
>>> What kind of problems could occur? Is it longer wakeup or refusing
>>> to enter sleep?
>> PXP can delay the suspend flow or, in some unlikely error cases, cause the
>> driver to abort the suspend attempt. AFAIU it can also delay idleness for
>> the media GT.
>>
> Thank you for explaining this, I spotted one nit, see below.
>
>>>> this could pollute the results of those tests. Therefore, let's make
>>>> sure that PXP is de-activated before we exit.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> ---
>>>>    tests/intel/xe_pxp.c | 21 +++++++++++++++++----
>>>>    1 file changed, 17 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
>>>> index 458d32322..3442396b2 100644
>>>> --- a/tests/intel/xe_pxp.c
>>>> +++ b/tests/intel/xe_pxp.c
>>>> @@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
>>>>    		}
>>>>    }
>>>> +int xe_fd = -1;
>>>> +
>>>> +static void exit_handler(int sig)
>>>> +{
>>>> +	/*
>>>> +	 * PXP can interact with some operations (e.g. suspend/resume), which
>>>> +	 * could impact the behavior of other tests if they unknowingly start
>>>> +	 * when PXP is already active. Therefore, let's make sure PXP is
>>>> +	 * de-activated before we exit.
>>>> +	 */
>>>> +	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
>>>> +	drm_close_driver(xe_fd);
>>>> +	usleep(50 * 1000); /* give time for the termination to be processed */
>>>> +}
>>>> +
>>>>    igt_main
>>>>    {
>>>> -	int xe_fd = -1;
>>>>    	bool pxp_supported = true;
>>>>    	drmModeResPtr res;
>>>> @@ -1151,6 +1165,7 @@ igt_main
>>>>    		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
>>>>    		pxp_supported = is_pxp_hw_supported(xe_fd);
>>>>    		res = drmModeGetResources(xe_fd);
>>>> +		igt_install_exit_handler(exit_handler);
> Now I read it 2nd time and imho this should be done for pxp supported, so
>
>     		if (pxp_supported)
> 			igt_install_exit_handler(exit_handler);
>
>>>>    	}
>>>>    	igt_subtest_group {
>>>> @@ -1213,8 +1228,6 @@ igt_main
>>>>    		}
>>>>    	}
>>>> -	igt_fixture {
>>>> +	igt_fixture
>>>>    		drmModeFreeResources(res);
>>>> -		close(xe_fd);
> If we go with above change, fixture here should be:
> 	igt_fixture {
> 		drmModeFreeResources(res);
> 		if (!pxp_supported)
> 			drm_close_driver(xe_fd);
> 	}

Sure, I'll go ahead and to the changes.

Daniele

>
> Regards,
> Kamil
>
>>> Looks like you are fixing a bug here, it should be
>>> drm_close_driver(xe_fd);
>>>
>>> LGTM,
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Thanks!
>>
>> Daniele
>>
>>>
>>>> -	}
>>>>    }
>>>> -- 
>>>> 2.43.0
>>>>

