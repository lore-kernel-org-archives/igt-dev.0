Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38507C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 06:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311AE10E933;
	Wed,  4 Jun 2025 06:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVjATh40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBF510E943
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749017091; x=1780553091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3KnYy1/KcAUTt5yuybhrZYTrF1XbqRfU4wrIIvD4j9U=;
 b=KVjATh40BH0rchOoujFyAVno9phH2cKKZyWVfJdbjZk9lTdpPGL2Qcv0
 VzWcRvErJqV+0KYbeBTmUa5E45xF7pCQ9QlkiSbE66gDRmRRjR20g+1Ky
 HGiry4dOzmBvIJSoezq646bdTE6JftsOTK8DaR0UXLlheJ00k0qRWJoAS
 2ZfvI2I9x6sjC6D5SOigMYs4zkTDX8oS2QRhCW5oDTb985CB5x6Jwcd4V
 PhkDDB3hue4UbrOiJJAEFKAWtBfFDpf3bleAoWXH4T0yRSRSDKqzoAz30
 uLHzvReK2QwVdniHgpT74f2UQ1ETowjTvt8i9uyU3t9Iiav3C+ghNfBBS Q==;
X-CSE-ConnectionGUID: lqiYtTe0SqWwHwhAP0mDAA==
X-CSE-MsgGUID: rGjLLabUQwulKyxVHyguTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50995584"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50995584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 23:04:49 -0700
X-CSE-ConnectionGUID: T7pOK12bQmqu7EBgCFVHfA==
X-CSE-MsgGUID: 8aDPXshZRHuS/hzIg2lorg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="144951276"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 23:03:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 23:03:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 23:03:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 23:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxqi3OmaTTnAhhh2rvneigqLZNRrc+Jg91rliyt726oL327Po0cz/JGzTm4QNFJKq64Ch1xCYjvLIo+W8Fd6Zgafn/vpxeDA7RwFHQSI3PWo5CTdm+Cjak4BYPfJonC79r3URSSOujCWFN0iZdN3q44VPoeBO14QepukpHTtd0IXfqEAcMNnzKo1TS1VDGHUsFQoeRFz66LpSzMWNUSSGVbahfwEGsmMGeHzo1poUGvokoclMN72PO6Eu+N2V71MPReCkDTnnfpkgrEKlJwASvBjsrpQ262JoxuHyZ9/dCfECZOeFrGN2GzAXHxsv0/NcX3kFq5LHziBViApTNGH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j0jJQCtH40H3uIwfJy14aK20ydq6Z/yvi7c/uah13k=;
 b=g8KhjoP8fGjAT5tzws8oWWATyVi0unsvyy8fkP7j0NgK2WDoE6qsqcYQ0qLO2BtQQ9YKThCgMUfj0nvZJYruh9agbLhj7dEkIY3iNfgOmh1zxxE06WyP7ZcpR+7IlFhwHIDLPveAwdRbDEFzz1LWyPMhHBK7ZOZaAELAq5Rc4S94bLIaBRZkpJpHslGu7eezvOGBb4dXlq/h7xgs3OujOH/CPD1gTlPtUgx/kN+EWEEeVwsWk9uBLQH5/yWmgL1HJiDEHNqbQC2WDZnBOnLFI1mDUn/6IC4Yv/XQkAXV+ChNQSxCLMoZlVi3smd4ExxM1poCgh+v2jSsEWDtjQx8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 06:03:31 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%4]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 06:03:31 +0000
Date: Tue, 3 Jun 2025 23:03:29 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test if feature is
 not supported
Message-ID: <aD_hsTG_n_tqpx5V@intel.com>
References: <20250603160718.1744538-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250603160718.1744538-1-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 392621e2-1048-4c7a-8fa1-08dda32d885b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnFEM2RNeDVBWENqci9pQ084YjNxZ1ljVVZQS2JWR2hSbUFOT294cmJteEdX?=
 =?utf-8?B?bGJnK2k3M2dMMStWK3pZZXdGTnBRc3FicUlFcDEvbkJBVW5NbThZSGhxbzNL?=
 =?utf-8?B?bkxobDVjbWI3RmZRVXhiOGxTVjhBdko1aFkxL3cxTHE1Y21HdVJLcjBIWk9Y?=
 =?utf-8?B?akU5TTRMMUdQVkNIZXI5ellGRzVicmxXU055NG0xT0pYNTFQM1FuNzdpT2s5?=
 =?utf-8?B?WUJhUWNRZzVnYXNvaHplR1Bpa2pDNkFCamsvc25YOTZYRzIrTGUvZ0lvWUhR?=
 =?utf-8?B?UHVqeUpXSUVSdGc2VTNiRXEvUWhjT29XdlZBc3l3SXFscjJoNXRWMk1uSGxO?=
 =?utf-8?B?VGxlSkV5MVgwUStRY2MyV1F4VDdnUVdNZk9xdXVXNDBSWWpNaFdydHBxeHBL?=
 =?utf-8?B?M09wZVB0WWtUa2NZdjRkKzNIY2k1NzZaWFUrby91am5CemYrU2JwZW1SQ2ta?=
 =?utf-8?B?TllNNWJleHNXV1BMU0VXeTJON1BUaVpJVnpKT0VyMWRBWXJkSnRjbE5PUXJS?=
 =?utf-8?B?K20xL0x2ejlqSHB3TFB4ZGFsRDBndnhEenBHWTdHTUVWMVAwK3BnNDhkbnoz?=
 =?utf-8?B?TXRaa1lnaWtaY2tSWHZtajV4bUZaQjVKbGNMSGhiTk9pcGkrT00zREVaUGdY?=
 =?utf-8?B?VWpQVHhnWTV0WkZSQTN4Z09FSHV6UVRnb3htU2ZRazNtQXJDNG5yS0NqTTVO?=
 =?utf-8?B?czNCMTM1TEc0cEtUZFprUU1IMWtQZE53OXQwczk0eHdZTDhTN21Ob2lXb1B3?=
 =?utf-8?B?YU9XWkJVWHRNSXROSE1VZ1c0cHRxYjBiaDVQcEg3QWxWckpWZmNDZ3plQnpm?=
 =?utf-8?B?b1o5NFhkQkNwWlVrbW82NG1XRzR4WFY5K3BFZ0RaQzY0NjJrQnV5bEtiM012?=
 =?utf-8?B?dHpWSXpOUXl3VEZwUEhxKzMxSDNhb1UrSnZMdGNOMjVDOFVqdVNNWnB3VGpU?=
 =?utf-8?B?NGZZbVRDU3JjNTB6ZEVCR2JQbWZDcnM5UzltRDQ0Vi9Ld1Q4M3dBQWJ0K0Vy?=
 =?utf-8?B?TmFNZTMyS2R5N3lVQ1dwNEtrODlnV2txelVTazBJTnJwclBDWitUTVd3VFY3?=
 =?utf-8?B?aUIveHJCVm5hOGJGemJ2NGtFTCtremJ6cG05K0NVVExleGpFV2FLR3ZJNHZ1?=
 =?utf-8?B?d3BUcUswUVJ2Q0VzeGpaQms0bmQ5aUpVa28rNkU2ZUhZVHBaR1FDK2ZEYitE?=
 =?utf-8?B?ZFFhcGdKRWo4c1kxVDNlQmFpWXMwTWhBSUxVYzJJTEdVMk93Z09yb1RLNzBG?=
 =?utf-8?B?RHdId01CcU9IZFJXVGt5Y0NHcVBXMy9MZ2ZDY1ZsUUtkYTloOFFJdGhaVVp6?=
 =?utf-8?B?dFBFZ1RDMXhrNkpFbGpTQkloWXBRM3RNNTFJZDhEaDRNdnRTQXNFTXdqbWpy?=
 =?utf-8?B?Vk9yT2xJc0lramp2dWxtUUN4dnZFTkQ3ajh5a0tqcVJnbzZ5eGp6am1HV2Js?=
 =?utf-8?B?MHlWcStlOG1uVzZFYzRPVjY5djh5MEcyTjNPeFVZSlRtVzU2MHpTWTVVQzd0?=
 =?utf-8?B?KzFzUVRUcnM4WXpKRlRkeVdPQ3EzeWJCMnNNKy9Rc1g4WXBHNngxQVJNenVG?=
 =?utf-8?B?UDVXU1UwSlViajcwOVdOVTdUVEc0RFFXUms2NXVkbElwZ0xiSnRjRHhwTHpw?=
 =?utf-8?B?NFMzeFNkeTVaUmhQZ0I2a29vV3d3ZHpPZnd6SWdGYnRtUVllZXdKMzE1SU5u?=
 =?utf-8?B?RDI1elFFYU5Yck5EN3FQbldOaS9kdDZkRCtKejV3NWlBRlZvLzNJZEt0TFZP?=
 =?utf-8?B?MlhhbVZpLzU0cXFtNWk2ejJNdGNPZXRFRmxlbXoxSTZjSlhsMU9NR1hwQTJY?=
 =?utf-8?Q?1i2NkNrAyoJMYKSnq5DBKhu2Ei2f9CX/pQFRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lhTGlRSTdBUFQwaFZoaklZRFNLVjdCOUtVbjhvVy9adDdFUzVhaVd1MWdS?=
 =?utf-8?B?YXhhc0hUS3hwVjBKbnB0S1ZYSFVneXY2ZmJ3RXYvRXJ6cHkrZGg3WW1TN2hP?=
 =?utf-8?B?L05zdzAwa1k1ZE9mL04zQ0dLVDFWMm93UlBxN0VSbzc2bU9KVXJBSDNidjJZ?=
 =?utf-8?B?aWZWUyt5eGhiZkR2ZEtRTkxHazZrd0FXci9RNkgvZkdjK2twS1VCbCtoeDdL?=
 =?utf-8?B?UmNUYU9QdzBDWVVVdUNPU3FNM1JtZlRlMVhwemxnT0w5ZTZ2eFUzL0ZvTGYw?=
 =?utf-8?B?Ui91WFhxMXdrbnZYRExSNlZFeTJLNUFhZis4cnJ6aHJ6RGtXSVlMREdsWEZz?=
 =?utf-8?B?UEQ2Q2FJOTVGMldSZUZnVWVGTmhkUWFBZ0RhSTBNREtYK2libkZIa2pNWmxG?=
 =?utf-8?B?ZUh6N3ZETE03S3FHeHlpVUlVZkd6UC9JWnZaMkFVYVJYYjhSODdWQkYvTkxY?=
 =?utf-8?B?Q05WMmVQd1pLTFIrQ0VxODdpQit6aVE2VnlVUVNybjdSeDdxckQ4RisvaE15?=
 =?utf-8?B?U1dROHhyR3NxL09iYzgwL0pkeXBReFZqelNNNE84QVgyZS9HcmdtYzc1TjMz?=
 =?utf-8?B?dFhuVEFUMWxMVXl1cGQ0Uk1aR20zc3lLSVRqU0JwTmFOaXFiM0cweXd2ek5w?=
 =?utf-8?B?N0FHYlFCZEdOQVZsY0dvVFRWdjVTVm9DdzY5Z1BLR295ZFZZZGgySWlDcXVT?=
 =?utf-8?B?YmYvazV1VzY5SjNoUnlJNzFNTjc4bUZLdnE4TU9XbVp1UWxIa3FPdTdQaHNm?=
 =?utf-8?B?NFdMVTdvZnYraGFzbHFscVo1YUFPempOUDcxNW9QKzJiaVB0WlpPRzFRUHZn?=
 =?utf-8?B?THoycnFCKzBpRnJGVUNPRVdKdDB1T3Rraks5RzQ1OUJQa0w0b0pialhyTnUw?=
 =?utf-8?B?cXVnSU0zZFkvOW1rVTBzbGpuWWtHZ3loUHNiZFFtaG1UenhHbDA1VWVFMnF6?=
 =?utf-8?B?RjdhZmhoWkVFVUN6QU5Mb1hxQitDc0t2RHVZbnpWUmtFMHptU2RkdXlTNWo1?=
 =?utf-8?B?YTdIbkhCeHRNekZQemR0NHFJeldJaWZ2dnpNb0l2VXhNdHNRTjZMZzMxL25B?=
 =?utf-8?B?b2hZNFBXWVZQM3hoSVVEemkydGZLSm9wLyszYkhadFN6czRONFFHTUVXS0xG?=
 =?utf-8?B?WTFOMnJDMXErM084QlNQWWJiMkpKMkpnTlpxZWRQalk4Nm5uSjFNVnVlRGh0?=
 =?utf-8?B?M3NyR3JDSlAyRHR6RmRFbXBTcFFIUVYveXllQ2IzNndCajdRemI5cEw5U3RG?=
 =?utf-8?B?ek9lazhyQ0xNdmN0bWhrd1BNNUFJeWdRUGhZU1FxS1hIN3QxdEQ4a0Y2MWd3?=
 =?utf-8?B?b1U3a2diYmh0K3I3MEVrWlFyamphcTdnencyYVhXSytQdlk4OVVIb0xNakhk?=
 =?utf-8?B?MnhPZ1NkaEcwK1JqcktKQ2l6aHVhRmdsWTRiM2lPTUhadkhQdWZpQjdKUVhW?=
 =?utf-8?B?TzZML1ZhMkp0cFdVdlhKMmtncGFrVFR1YVdvSTBkSkJVL1Y0YlM4dHBZZGRh?=
 =?utf-8?B?aklJWC9Tb1c2QXFaejZjYWlSSDk5STRoSDlRQWtQOWRpZnI2RysweURmdjdW?=
 =?utf-8?B?Y2R1SjhQcUhpelErNHNBd0xyaDNRK09hN3J1bGNNdDl5ZGpPWGRHb2daN2Uv?=
 =?utf-8?B?RFhVVWRIWnRNUm5JQnczN1RkMjZLMTcvZ0FRVXhxUjkzYzMxeDI4bzk2U1pt?=
 =?utf-8?B?cDh0ekNlQXFkY3VuSzJWOVhTbnpJUVhZS0YxQkVMTVBXUnVVbTczYlROTmpW?=
 =?utf-8?B?dTN5OUVjbGJRZE5zRkZxcENlY3hveUF3MDE0d0tWOCtEaWlSeXYyL1p2U3Q3?=
 =?utf-8?B?QVV2V3ZpN2V5SFY2VjRIa0lZVlgxUXlBUzJxS2djYW8zZVUzSDhLOEJnaWRi?=
 =?utf-8?B?Z2pIUEFaNHhxTS9paSszOUZBeWpHdVVMSWZ5VHJJTGhvT2l6TS9ZbGwvSDVz?=
 =?utf-8?B?Rm1kbnVyMGNwY3MxSml0VUc0cXFSZVdHczdSSTg4MEo4Uk1YZ2ZRbGp6OG16?=
 =?utf-8?B?b0VkQmhaUTJ6VUd4WlNwTXhQbzk4ZHJTK2RESzlrUGdhQW9Qa3hiMDhZTjRS?=
 =?utf-8?B?WkFsQjBMeHVPajczWlhyV0F2OTZONXB1b25yYlFGSFB6VzVDTzdsQjlEOHVk?=
 =?utf-8?B?T0c0U09FRU5xblEwOExHMVBqdk5aRjVPUklwY1N1RTJMNDV5Qy9SU0l4ZVpa?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 392621e2-1048-4c7a-8fa1-08dda32d885b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 06:03:31.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwpUu/E2dFE87+H9ZHn6ugVQUrY7+Ei36mdMUiLuziOEYNyMF0cImbHI2PykrGRGbnqG/VO7S++GZHdmSdeBfBoTreFqXxl92qk/YQbA5As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
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

On Tue, Jun 03, 2025 at 04:07:18PM +0000, Jakub Kolakowski wrote:

Hi Jakub,

Thanks for sending this patch. Recently I have been working on a
different but related issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
I have come up with a similar patch with the difference that I have used
a EU stall query IOCTL to check for EU stall support. The query IOCTL is
already being used in the test so I reused the query IOCTL to check for
EU stall support too. I copied you and others on that patch. Can you
please let me know your comments.

> Add a helper to check for feature support. If feature isn't supported
> skip the test.
> 
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel/xe_eu_stall.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> index 411c30871..f3d7c1974 100644
> --- a/tests/intel/xe_eu_stall.c
> +++ b/tests/intel/xe_eu_stall.c
> @@ -267,6 +267,31 @@ static void xe_eu_stall_ioctl_err(int fd, enum drm_xe_observation_op op, void *a
>  	errno = 0;
>  }
>  
> +static bool is_eu_stall_supported(int drm_fd)
> +{
> +	int stream_fd;
> +	uint64_t properties[] = {
> +		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> +		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, DEFAULT_SAMPLE_RATE,
> +		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> +	};
> +
> +	struct xe_eu_stall_open_prop props = {
> +		.num_properties = ARRAY_SIZE(properties) / 2,
> +		.properties_ptr = to_user_pointer(properties),
> +	};
> +
> +	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> +
> +	if(stream_fd == -1 && errno == ENODEV) {
> +		close(stream_fd);
> +		return false;
> +	}
> +
> +	close(stream_fd);
> +	return true;
> +}
> +
>  static uint64_t read_u64_file(const char *path)
>  {
>  	FILE *f;
> @@ -654,6 +679,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
>  		igt_require_fd(drm_fd);
>  		devid = intel_get_drm_devid(drm_fd);
>  		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
This check would no longer be needed.
> +		igt_require_f(is_eu_stall_supported(drm_fd), "EU stall sampling not supported\n");
>  		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
>  		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
>  		if (output_file) {
> -- 
> 2.34.1
> 
Thank You
Harish.
