Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23384C83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 18:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953510E2CA;
	Mon, 21 Jul 2025 18:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eComhjLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FE510E2CA
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753121233; x=1784657233;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YcPk4jaVZT+tH0lABhDIniQCaJDgf4D1wc4ZXart1bI=;
 b=eComhjLrmzODep/Wy6UZQFhpo6O6feBU7aw03wZRCsw4WYoOhSNWzi0l
 BHv1cnbNWRl2Tkvi7/5ZzOOO3GkxuHNSHDzEwPK8kjzUR9JxOjXjqtMIG
 pg5Wcy7CVmXSa03vxcF0Hy2Sh3npXBYtCBfsy2Tgg5XyRdBbt4B23U5Bp
 pOl8ePF+l2Yjbrhf8Sx0AHRyxq2j2LEOK/Sbha97PNlMY+DXlLWPYdPkx
 zk0R2hM/H1Xbpfx6oC5crX1lJKyonQK1v5mjEnirT1NwHYJYpf0VxTJO/
 K9KYSxNJAR62/JYmIlD/j3R/CFCzwb1QQno4HJSi4zJ/WfGDSpbQSHi0b g==;
X-CSE-ConnectionGUID: ckoS/mZrRP2+uXBMjYzQ0g==
X-CSE-MsgGUID: TEGoEM6SSoKZ1aKF/j8HYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66691056"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="66691056"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:07:13 -0700
X-CSE-ConnectionGUID: jd8aT5NcS5COIIJ+eiLsIg==
X-CSE-MsgGUID: ZlGFndTxROe/U4bzylLz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159239389"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:07:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:07:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 11:07:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a60lMnmA+Hb6dWnkw4brQPimuFkvU4/CgEDWTVCRveaXiwID0HADIFvQuRlPDfitIbsLw3HlYtizgohv+dyL01WqecPnA+c19gXThLBMeyquwj6aY03D7AAE3P99PH01Lme/OYU5dqpktCgp7QAVj5YdxhUW0txAIDqNz4jUyaAImUVdb/xsIZeDED8afsq8jz2SPWjT5n5NknSkXSYZ0NBLtSxEmukuy8rY/eDfcKZvKnWDuSY8KYkDh145laZBvhvko1qyOr7t3mYs8DYVXsyy3tX9xgbGLY0PA71tSn1bp1NFFFQ8h4rt4QPNkJzv+r+NOlmJbmnA57f5kifyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkOBZdYKSo8dDmYL/w+QrlM+BaB/8StvNKwYLwfvka0=;
 b=wGCXmLBqE1ZstaPiEUKhPjeccronP2jDux626N99GJB8lbsYnpBS8jEd3orBVj4cP1vTFePgQDxSEqx9b8hr1kFgrdEPzCPO0ykPsugMSBQIcFQEOz65AIKtnvdJXmajYtaYbyp3LEzzKWvQo2ClvmDq1YHbegQynE6dSAljmWEQWOgyWMYrOL0TZvSObWSMqYOoA6iu5O+SbwnHLk3Bp3WR8Wcn3U8ywJzfKUcDAQozG94yNZdA61bVJUr116k8+GX4b0zy50Vt87RBOcPnVgCxGZMjb7sgitx9RWQ6DN8GCX1FQs+bqcF7YVn3IB6mZ9jV+1akv8z0adVRgHVCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 18:06:41 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 18:06:41 +0000
Message-ID: <3d075fd4-48fc-41b5-8b2b-806940d7c1d1@intel.com>
Date: Mon, 21 Jul 2025 23:36:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vblank: Skip timing check in
 simulation to avoid false negatives
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250711180740.145938-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250711180740.145938-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: da753f0c-e3ab-4287-577d-08ddc8815831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjlxUTNWOUgra295ZExtTVFEdXpETEhzVUdRS3VDSUEzVG5FU3JzTytwT0RQ?=
 =?utf-8?B?ZlJsU1pObHVuZXZ0T3U2bzlwMHlJWmxEaCtQcUh5NmNXRVZkN2NuRmx5SVZD?=
 =?utf-8?B?NjlpYmk5SWhIN202dDNpbkVRbTVsSXJnaE1WZVBQbEt1UDBwZy9BWkdzMTY0?=
 =?utf-8?B?K0ROVTFMUkN3cVoyd05QbGY0dmxiZElpT0hia0JjeEdkUnlFUkF4S05JdERY?=
 =?utf-8?B?c3RWU0UwS0hUclhKVE1Ta1E2VGhuY1NMWTZyemI0REVFK3dMSHhzeUVEQks0?=
 =?utf-8?B?dzBRWHF2SlIrcFVadC9HeHFvQVJRcldTTmlDWDJQeUp2VERpY09wZWpoanMw?=
 =?utf-8?B?cWdyV2JHZU9RaHptaDh3SG81TVB6OTdPTlhQTU1YMWc2RmFiL2JJSUliOU00?=
 =?utf-8?B?U3VtR2hpTkxxRWVScXhvQVBTOTJ1dnVqblF1VnVMaUY2NHJ4Um0rMWphRlZK?=
 =?utf-8?B?MkFIWSszOEkxMVh6YUxNc21YSkNyZEtVSE9LZTFXMExYL2REVGQxUGZoTnZ4?=
 =?utf-8?B?c1pkMnQwelg5dnJ2V2dTcVhrc0lSL1dwK2dJNHgwYkVUaHNFZFhISzdRcWlr?=
 =?utf-8?B?M0NYeHhzRDM1MWdPTkJHWmx5TmlobjdSUGpkV3p6Q09LY0JVQXFXZ2oyWldv?=
 =?utf-8?B?WGlYU3VqeEMrSHFTSWZPM3cxWVJ4VHJYUW9TbytMaGw3ZjN3Y01INENXMmp6?=
 =?utf-8?B?SjIxT1E1WmwyMjNBcHJYT3NFRThuQzBwTVduQnZQbkZmT3NMYm9VYmpGZnl6?=
 =?utf-8?B?WUdvZUpqSXd1YldEZXkrSi8zdFBZcG1la3plYWVRVk9mbzQvM1BGOHQwMndr?=
 =?utf-8?B?M3VraFZKLzdTVHdrSk5sak9FUUdQOVV4RFExdEpRQ2JaWmJjS3YyU0lEcXhu?=
 =?utf-8?B?b2kxTE1sZHNoRExBUU1zZ3QyQ1J1M2pKT1R6a2hiV2VqeWJLeERWRjlrU2RK?=
 =?utf-8?B?dnF6Z0g5aEoxRTZsVk03Y2dDOUFPS2pUdXlDOWRuc2Eza1NsN0VmUHhxY0t5?=
 =?utf-8?B?L1dvSkUxTld3RGJ5K3JrZ3hmWUZtVWtnQjVUb3ZTVzRndERKbmtTZjhZdnJj?=
 =?utf-8?B?L0ZUYzA3blZhU2w5MTE3N0QwSTIzMmpGYVc0NEd3b3FKVHFYNXkzTHZXM3pH?=
 =?utf-8?B?YVJ0anE4N0h5SWxtUm1RUUVDZGM5RlA1cm4ydVAwOUpVU2hybVViTitVSll1?=
 =?utf-8?B?Tm5jMDUvZU1hK2RzY29CUTNmRVZ4aEl2d1NsZ29hc3BKNDc4QmtYeWdXUjlP?=
 =?utf-8?B?bXozUXlDajdaVDRqK3dwRzNLSlN5a2FJV1ZtL2tLcnZ0ZjBZQmFmais5Ny92?=
 =?utf-8?B?NkJSY3g4MUZubEhuQUlQaTJ4TUxSYi91YWhwa0J6WG5xNzFYbFZETitoOWVH?=
 =?utf-8?B?djV6ZTRwWDBldFBuSGU1NEo3Ylh6NDdvaHRuMEluY2JzeEdsaW12bGdPVkJx?=
 =?utf-8?B?SHJFMHJHdXVKa0lrMHZtTFA2aXZKUzM0aVBrZFJ5SDZQd2d1TklwTnhydHZn?=
 =?utf-8?B?NmxrcjdmeVM4ZC81eG1wbzZxZDFxeThmOGJtbjk1ejNXNStRblU4dXN1b0Vs?=
 =?utf-8?B?NkJSV1o3aWtjbVE3aWVaSEFnN25rZ21nS00rVVJOdzRmQkozTmlaNEpMaUlD?=
 =?utf-8?B?TmVWQ01QNE1SRndaOHdHNDhaUC9yWElWNDM5TzBsMDlWclFCZlQzSDRrMzFP?=
 =?utf-8?B?MDcwclM0RUsyZFBhREZhRmJCWE1ZaWJaQ0FsVS9TUlNXbmxoVXlZeHJDK2R4?=
 =?utf-8?B?ZW9xaWFwWWpraGtGU0h1RGpkSGc0Z2xCQjF2QkRaSnZkSE1wQVBUNVhWS3B5?=
 =?utf-8?B?U0lHMzlzLzZEWUsvRmFrdFlqdzVaSU96TzdOQ1NIR21NdnNBa3NxUG1PVzFm?=
 =?utf-8?B?bTQwZ1o4T1BleWRmMHZVcEZVN0xObHhKYlhKMWFDUVd0OEJIWkViNjliUEhv?=
 =?utf-8?Q?dZIiPxb/Aqw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG5tNnF6cEM0R28xamY3YStocUpXNmdaVTY5K1k3WC9abDVHUnVUaW9hZUV2?=
 =?utf-8?B?SVhiTXRDaSt6WEtvY1NKcFJXUkNBMVcxaXJ3eTkrQjJNQWZRbDRHRmppUmFK?=
 =?utf-8?B?cW9XY21DYnIreFROSC83QkdFWUlOR3hGQjFNaXBaMWxMUWg3OU02dmh3QTI3?=
 =?utf-8?B?MSt2SENUSEE1S0hvY1VaSHVDZERSa3dUZzNLVkdFRmY5M1FRaU9wUjVsQ2tG?=
 =?utf-8?B?Wkc3cEhOUmRnV1RrbFRnNEVOaDh5QnU3UG9rMDY1bnZiVFkvdm5QMC9hZjdo?=
 =?utf-8?B?YlplbFdVMXBnZnRkRnRvejI1bUlyN0VEakVvTGdjeU5SY0JWZTZrbWJCWVc1?=
 =?utf-8?B?aE1PSWtlMDFRL1g4ZnR1WG93RTJtRHZLYlJRdDh4WGd3R3VWc1RJSGl1dnRW?=
 =?utf-8?B?b3kxTDNLL3NqUnBqaDJPakIyOWJEYmF3L1FSNk9QNHJ0N2VpdmZVeGdHeStD?=
 =?utf-8?B?M0JWYS9EakFMSWU1Y0s5L1ZFTWR1ZVRsS2NFbytyUEdvenRyL1Juckg4aWlh?=
 =?utf-8?B?ZlhtblNKcnNFK25Manh1WkJ0aTJFQ3VQTmN2OElwWitBZjhndWtrOXg2TTlU?=
 =?utf-8?B?ZUtvdUxMZFdJWTZiZkNMWE52MTdCVUdocTN1cTlSeDhjTHVyOXVZdzFRRUpt?=
 =?utf-8?B?VTh1V0dnTVg1amVsVEp0SmtrY1hldUFZaEJlaUd2NTFneG5ueFFwYTFsTUo2?=
 =?utf-8?B?dDFidVE2bFVwMEVsMVV0NXp2QTZJbHpVeTZXNW90eWRaZHltNC9zLzlJaHVm?=
 =?utf-8?B?akFqTzdFWTN4eTBIVXRVVTB1bVlua29NOUhtTmpvdCtWMVFJa0YvVzFHZmpo?=
 =?utf-8?B?ZGJsWm4wUTRxL0U0SmlQb2dUSTNxeC9XaFd3cGNRK3VCVSs1bmIxUU1mYXZ3?=
 =?utf-8?B?LzdVczliekFzVS91QmZOSm9ZbkJaL0RBcHFsbjFYMWRPSkJQNVVSSEQzclN1?=
 =?utf-8?B?TUsrWHJKNmNpa0szR0NVckhvVkc5LzJZL1JMVVIxOWZycUY2Q1dJdFphSzhV?=
 =?utf-8?B?N2ZFcFNRLzVyWnhIOFAyL2lPUFFoRWFqV1MvOFo2WFJxQUZyempLOVZiN1JP?=
 =?utf-8?B?Y1I4UWNjTjRoZFlBQ2VqdWNwcHQrRGFtVjlPaVgwWFVzYTBCWjZ2OGV5ZDFt?=
 =?utf-8?B?MUZBU1VVVm1USVlCY0xWUXpPNW4vcUVWN1huWFJkTExCekNvOVVlbE9BOTBP?=
 =?utf-8?B?OXpjRzBKZXlSYXRCTFl2d0gvWkM0blFvUmhPeDRnT2JyLzhBOW9FamhQK3h3?=
 =?utf-8?B?K1dzaGp4cmpNVDBGdlBrSmJjbVZtSi9IcVg2UFVnR3R1SnZRYVdqdnFDUFYv?=
 =?utf-8?B?OXJaMVkyNHhUM1hYUmRvN3p0Z1VpUHpRb3c3eDdQNFFOWDMvU0pTMy92bzlp?=
 =?utf-8?B?bGRTd05hNFBkSkZYdnY1anJRUGJ0VVhIS2lJRlpPcXgrdUd5blFXNUpCSkpp?=
 =?utf-8?B?amR5K0d5ZHJsUCtsUzJPSEIwZ0NGS3N2MDZqRVBHeG5RWkhrZjd2VUNQQUZ2?=
 =?utf-8?B?ampGTW1ZQlFTZDJyY2x1bEtvdUFuZytDWHpXNEdrZnhhTXBqRk5iaE5PbFZQ?=
 =?utf-8?B?TXZYM1c4ZkZCbGlwU01IUG5VcDIvYldYZERkb2ltcHhDTlU4ZFZadXRJS2Z1?=
 =?utf-8?B?Yk5meDZ5TkJlM21nRFBxWHJxMnZMbFhvUytVd09GaGcvNFFJVUlSelVDZjdk?=
 =?utf-8?B?OGVwVUgzYVBFcVN5TU1uSXNDeGszU2NWY2cyWGZiOGlOT0FQK0NPOGoyeFo4?=
 =?utf-8?B?dmlpbXZqUzBEa3hodk5BOUZzdGl2SEdpVmw2V21QOHdXVzFnMmh1RCtCZFZ5?=
 =?utf-8?B?dmFJYllhVnRINWhTc3ZaQUtCY2twL2N0V05OY0c0RGJmS1krOFhCcmRVeUJT?=
 =?utf-8?B?dWRiZ0t6ZnlPRGh2Rno2VXZTUCtJSU5qS0ZlSVUvY1lwcU9IaEVlalluY3Bh?=
 =?utf-8?B?SmtSQk90cWRwUmVrVDJvWXVYR3hLK2JBZXlqNjNDZGF1SnRFZ1BCU3RzT240?=
 =?utf-8?B?TkNmQktWdHdhU2FsQzdqem0vUmVNeisvNWNQZjVaZnZjVlMvVTZZeFYzZVVR?=
 =?utf-8?B?cXl3MjZsb1BzQzlDZHdCV1kycmJXVWxnOU1hbzRVUkw5UzBEMDd4QWlCY3Y1?=
 =?utf-8?B?NTV1WlQrb3ZJZ0xOc29mQlg2N0l1MXZFbHJETmw2ZWZERFp5cVAwZWNMUCs1?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da753f0c-e3ab-4287-577d-08ddc8815831
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:06:41.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMzC7tqM6QUZGxo83OhCWQGN+SEPEZS5vKVB1K+pYsN7w91B5iyuOVlydWH/g5MzFjMFq74xMTNeF/AOvNgArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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

Hi Ramanaidu,

Patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 11-07-2025 11:37 pm, Naladala Ramanaidu wrote:
> Simulation environments often do not reflect real hardware timing
> accurately, which can result in false negatives during vblank
> sequence testing. To prevent such issues, this patch conditionally
> skips the timing  validation when the test run in simulation.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vblank.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index b8044ad42..75cf9448f 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -460,8 +460,17 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
>   
>   	igt_assert_f(seq2 - seq1 >= 0, "elapsed %f(%d vblanks) unexpected vblank seq %u, should be > %u\n", time_elapsed,
>   			estimated_vblanks, seq2, seq1);
> -	igt_assert_f(seq2 - seq1 <= estimated_vblanks + VBLANK_ERR, "elapsed %f(%d vblanks) unexpected vblank seq %u, should be <= %u\n", time_elapsed,
> -			estimated_vblanks, seq2, seq1 + estimated_vblanks);
> +	/*
> +	 * Timing behavior in simulation environments often differs from real hardware,
> +	 * which can lead to false negatives during testing. To mitigate this, disable
> +	 * timestamp and sequence validations when the INTEL_SIMULATION environment
> +	 * variable is active.
> +	 */
> +	if (!igt_run_in_simulation())
> +		igt_assert_f(seq2 - seq1 <= estimated_vblanks + VBLANK_ERR,
> +			     "elapsed %f(%d vblanks) unexpected vblank seq %u, should be <= %u\n",
> +			     time_elapsed, estimated_vblanks,
> +			     seq2, seq1 + estimated_vblanks);
>   }
>   
>   static void run_subtests(data_t *data)

