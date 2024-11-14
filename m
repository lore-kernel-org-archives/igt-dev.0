Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E65D6A223
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 02:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFA310E263;
	Fri, 15 Nov 2024 02:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8jR+j8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BBD10E263
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731636773; x=1763172773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bGZNNu9FXRzYJtAzeuEFuRmM+A1XJYUc6x6NGZsDUqs=;
 b=E8jR+j8hyXEdPpGDNw8Pvwzc2mrIk3ua3X2q2i6Dn36dfYmz4Lji51L8
 EoB+Pz458TwsFETTk0Djv1TbxBqGklnV9farVoIrV0JILUdprSKSL0kdh
 VVkc0cMiwd2FfMmgHnGP6olRzm/dGFsK7+Ae6wK3MCTMEkd0u7Vib9PwC
 3BD+Qod81R+LH1jp/YBAOi9t0AL4Mfmu6VUAHIzgJ+D/iLNvemfLoLFWv
 A1IlbgsgvzMEcN6Up+kot7LRSvtEFJt8usVIu8oXBZJtN5J4D+Bxme0+T
 SqNhFI34om2Qiyh/Qy5v2O3uS9aEsPF3D5/3dzMUDndAfdmPGUVahuV3u Q==;
X-CSE-ConnectionGUID: rpDdAIZOR/mkF74Gl7H0qw==
X-CSE-MsgGUID: qJc+JNyMRQuqGuCACwgcLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31772054"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31772054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 12:17:30 -0800
X-CSE-ConnectionGUID: gFzGWG6ASSe90cV8E3b4FQ==
X-CSE-MsgGUID: 5/qP4+U/SuCZRNC8Y3Btaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93145381"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 12:17:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 12:17:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 12:17:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 12:17:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvQzloX0a7k4jXnS3pcbo9UHJPraDCVK4c1ldZYJ/h3p8tcIMHDQw7lFTNE+Pr3Es5dXXjgcUiBfe9uneUw8bv83ooQywNlv3HyB1nuLk2aKsAQqDYWmQ6TreVBRk/WDe0M2tNJ7LXJ98unNUuJGk3r0I6QXq0kjvjvzimV9Tx3PPYAIICCIqLLjMci+6JVQGKvvtSuwIOUN0nQ9oO+5vTMyDEyZxZFQbd0MmzyDmJtqDBycCV8jrEFfaQQL7/4fyetZfOx1Hx16rcDuiKho92pwkfgYQPnb2DJf2V6eCd9eekhVnkdgqHCrOf5mvhBR+zV6SPMDLSLMR2WPyJSNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh3LxGQYD3MAI0yZzhBdGve38f3rCkq+bnsSRbyHUxA=;
 b=fz0YKNq8kQvGoFl8JoRrNg1G8/L8GmtM08KMkZtyg9cPnJaFv8x37iCGhZ9CJ3vi6tBtFpqdxCIWi9fXHQhXs1dxXjbsJkALA1YY0QY9VnNBZ1ozCLZpAgHhuIdXuvwW816xZtZuUyiUoZmSIRyODToCkM+yAhOkK9LeQ9YkypNrLxMcqBsBpch+ziepQejJ9zWSXDqs01cDJ7QBP1tHrIEKGKNQ+cdEL46CNecktwvs1dTOMBwfeOdJrWnX/SSn1+RNYfZowqoHtjh50eOQeY4KHUPtlh1PkVIBsMnJNaXkRT9IHT19aFSLug0cfnUwOgUs35fnwUHAKkPBA079PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Thu, 14 Nov
 2024 20:17:26 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 20:17:26 +0000
Message-ID: <645a5544-7efb-4722-ab41-d3f15f39b0b3@intel.com>
Date: Fri, 15 Nov 2024 01:47:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add 6k resolution support for a
 single CRTC
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241112163435.1351560-1-jeevan.b@intel.com>
 <20241112163435.1351560-2-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241112163435.1351560-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 46239ae0-3902-4ee6-ae8a-08dd04e95b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1p3d0ZIT1lHU3FpcmRmOHhKL2x4Z0RPbmdkeFFnamRCTkprVWVHVVZDWUFh?=
 =?utf-8?B?dkpOUit6YjFjeE1ZcmRqcUhVVXg4SFNjNmdqdWtZZkFvVGtkTVdFcFBGTDRS?=
 =?utf-8?B?VVUxeUtUTVJLcGJqeGxuMDZWVjhkMFk2YldVZmlwcmY5RVlHZnVCMndpN3B1?=
 =?utf-8?B?UGFtRjhwNERKSGd0TkdKSDJmUlpURHphUWtvTG1OM0c5N0ErZmJnZ2pDZGo5?=
 =?utf-8?B?NFpRLzdEN0ZTMTVtUlpQaXdWa0twbURLc2IrcnlGUys4a0VZMmluUEVybm5J?=
 =?utf-8?B?ZHJXTTVtK01saHZqZHZjcmN2NTVMOG9uYzBiUTBiVHo5aG84VEwxbnhvL1hJ?=
 =?utf-8?B?Y2JySjY1R2xQZWxicGhuSTBUN3BHZ0dFZHo2QnJ4T2NNaW1uZE91MnJYWEJY?=
 =?utf-8?B?bENYbWlmWG5EVWVzUUxwTjBaUGNCdkRyWWNkcmtNeTFwWXNZdlJXN0hXRFU3?=
 =?utf-8?B?anJ0M1hKNVdGeGVKdzhQd0Q3QmZKSmRVWTduSkxzbnlHZ1RuaU0vaVJlLy84?=
 =?utf-8?B?UUNMYWtTUXFsVWZiak5nN3VnZkVISTNycmM1M21HUlNEVUFWS0tNREZHNGFy?=
 =?utf-8?B?Z0lWRlMxVy9vcXV5amYxSkg1cUZMVzd1TElsM1pKblgyQ1VuUUV3SmZ3bU1K?=
 =?utf-8?B?alBJTU54OStxa2FqZk1DZG9NdytmY085ekVkeUI5UTgyckdJRDRsRW1pTStH?=
 =?utf-8?B?Y2o4S25zaTFXOW82Y3FGN0FlSVlvUjI1R21nYkVqS291MVZvK3dPVjBVc0Zl?=
 =?utf-8?B?V3c3bU1IV1pDNnd3eFFNcGcwc3VVa1JPREJwSm9yRE5YZ0FCaHY5TjN6dmw3?=
 =?utf-8?B?L2gwVVVKVGE1ZzZlVlZWRVduZllkNGtJaFpHeHh5dE5QRkpZSDlCNi9DKzlh?=
 =?utf-8?B?RWtZM3g1NlhDdkZSRkRDWUJnSURCeFNxblB6dTJLUWdtWHVjYXUreTcvOVUx?=
 =?utf-8?B?QzFLN24yWThXRWxYdjQvVkc3Ni8xTDF6aHVQMzRRQWs2VTZMTEd3d0tIVjN1?=
 =?utf-8?B?c1FQNGw0NXZ2SHRFYmV6M29WQzZFMjFTekk5bGtUbDNBdlVxTGgxNkp1TzNT?=
 =?utf-8?B?d1BHODBoL0ZtOFFOUEV4b2JNV0V4NEU5MUZmZHVBYkpKQ0NuRFhsZ1A0amQz?=
 =?utf-8?B?OG9tN0Fwbk1BcGcrMExQd0NOaEJ4ZEJNNG84QWx6TlBNM3Z0RUhqd3p6S0hG?=
 =?utf-8?B?b2l6WmVNSEtKMzljL0tRRXMzYjY0ZUJGUnM5ZnM4Umc4NEtjT3pXMW1BMEdO?=
 =?utf-8?B?eVBDems3TnZmbTd4ZXlyQ0FuN282alJybzhTRnFSTTV4UjVzUGoyd1ZDSm03?=
 =?utf-8?B?UWRlQjNmY1hvSStOelFBc2dteWkzNUhUenFyNzBYcGtNWHJkcUdLWkZmTjdN?=
 =?utf-8?B?Z0dRbUxDYTNKVFlxYmo4TkFJOE1tdmpCNld5N0hSeStoMVE1djYyNVBLdEtK?=
 =?utf-8?B?STlnbDg3NEduQk1pY1dwRHFBOEJDR3E1ZVd5SmRSSG8yRHNtZnY0VkJTN3Y3?=
 =?utf-8?B?MTIrQUkwYW1vaWFBZE5IMVhCc0xZY0lMQkplbU01YWpCZjZTQ2VTSzV1MStB?=
 =?utf-8?B?WVRBMkZ3NkJiSUh3bXJNRUZCMDhtVlorNEc2RW91S2cwdHZDbzYrai9wNHl6?=
 =?utf-8?B?L2dqM2lQb3l0OTRjS0gwajI3WHNuVUZRNmtsSGtwVXJQNjVPY2JubFMxMHZ4?=
 =?utf-8?B?RkhEbnYwWjdDdnZWWnF2SnRSc3RsZUQ2bzhGdHF4aDZDLzRsdnJwd05YdmFB?=
 =?utf-8?Q?7ILR9ZXjxjpo7F5hVViQyzH5O0ObtfPVaHw/zS8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlLVzAzTVpwd3d3Q0pFdGRoSjhpekhyY1pqSzZ6ZWJTMXl0aERJVlZ3SWdW?=
 =?utf-8?B?VEhHMkxuOXNKd3pyUnZIdUFndnRybzFXeXBiMklIaG4rMzBTdFloTW9BZGZP?=
 =?utf-8?B?azFlbGN2OGY1MVh3SE1aRGJhU3hjbHlrTjN2c2lUd3dJUmhjbnA0YllMbUgx?=
 =?utf-8?B?VmM1cHFnT3NJaGpnOS9naHVJWEhHU1BaZ0dVRE8zai9Dd1RPUk5SR3NmRjVX?=
 =?utf-8?B?RXNyLytyNnFDbUphWEZDdHB5SXBFN09wQ2FVUjJhRFYvb3JQU1RuK1l5U2Js?=
 =?utf-8?B?T1ZsNVlOc0xJVm81em41THNwVzY2SDE5ZzB3OURRT3h2SkZuQUFNdnRtWjM1?=
 =?utf-8?B?WWUwZC9JZ29BTzczdXVBMVN6U2NiVjdTL2haY0RVQlJocVZ1bDhnUWpScXA1?=
 =?utf-8?B?dmlobittY3RYRFFuQWtTZkF2dHpqM3NWVVVxMVc5V0l5M2xBNm5EQW9OUnpI?=
 =?utf-8?B?d0tKRHpoYnh5ajQ0alpCTG9GU2psZFJRT1IyRVNOcnhKcjl2SXFZR1EyaTZu?=
 =?utf-8?B?Rnd5Y2hJck5qdEs4NnRDOWxGb2hsN1psNHhZMVBIclo2VmRjb1hVaDdibmV3?=
 =?utf-8?B?aG5vOVI2Y0h6TWpSa21jc3N6T3JkUWV1eWN0SllPQkVjc1Y5alkwYUdmZng0?=
 =?utf-8?B?ZVZtODhwd3dvSWtsTnhQdURoOWdFdjUzUVVBTzI2Nk5xT0FZSGlLeG12WXhP?=
 =?utf-8?B?Mk5pN1JXckluWWhUZWh0ZVJQRG45OVV1SmZHQnlXdVV2Q2J0Y3ZndW9Eclhv?=
 =?utf-8?B?a3h4NCtxYTVFZWtKQ0FQQk5aMlhveEFvMGhSWk4wRVFGRkxCZjYwUzE2TTJD?=
 =?utf-8?B?dWV3N2h0MWZPUC9pbzVaT2tYUVdDbS9pdlFaOHNRU0YwV3NnRGo5T01ubWNt?=
 =?utf-8?B?RitnVFFOOXNZc1pYOTRMU29RekJFbEF3QkdhU2tBV21DODR2Q1NSNnY0TVdG?=
 =?utf-8?B?SjdieTA0clJvMHZjWTZDVGlhMmVsVW02b0h4dUZFNlpaUlhERjdWS3hoR0Vy?=
 =?utf-8?B?Mk9UclhQS2xOYktTejY2UGxHKzB1eEU3Q3hiRzBUYWdGMGRiRytvUnNmcVBm?=
 =?utf-8?B?dnZtWWYrbkJCbVZtQytPTDdJdnRvdVVkWmlzeTNxS3NVMTQveThzVzdWWXBD?=
 =?utf-8?B?bHlScGZrcEdsalE4RS9NVTZXTkNHcml6Y0U5ZVhHeE5pTUs0cVk3RGxva21S?=
 =?utf-8?B?SFF6YTVGQ2JQbUpoU3pHN005cjQ1QUFrOXRrVmd1cnZUVXAyQXhaOVBGR0N2?=
 =?utf-8?B?dGFVUDAzSWkwTkNKOEYwWXh1M2M0bk5kR1FNeGdFTXh5SHEzeXRQRTh6NTc3?=
 =?utf-8?B?MlhzQVgzdmdFbFNTS3ZqOHZnQWMxNVJYMVM3enFYZTBDa0JXNzE1b0IyZnpy?=
 =?utf-8?B?Q1BEa09QQXo1SFZEY2RzTldmVXJ4K21uT3h2TDQvTVFpZllMTWgwNVpvdjFP?=
 =?utf-8?B?Wmk2NFp4SlFjREorNEd6SG1lS3J3Z2NrYzVMc1RvS05OUjFlMGlJQXNGaFZp?=
 =?utf-8?B?dFh5N0d4Z255TkJqb1h6clVrR1dQeFAweUxrRWVzeUJTcUplR0l3RmJOVDFz?=
 =?utf-8?B?djdzWENYcnNrMDJPQnRZYUNBUjBCSHhsNGplUko5dWpVUXRrTldGL2RjMm5r?=
 =?utf-8?B?OGZMR1lja2lOVlpQOEVKNktsdUQ4UHMzZGtnMTBsMXIwZE1hRlZycE1KaW8v?=
 =?utf-8?B?K3VJcVBuN24xb2Vqc20xczRvcTFWS0VVdkNUTGJkK3lMMk9jZWFuaHFkbEhl?=
 =?utf-8?B?dXpibkhTZndUUFMwMktZMi80TjhOVUwvTlhPcG1wdUZxc1VmZ3BOeVJJUDli?=
 =?utf-8?B?UktSVmk1RUtDd0ZSTnhmcGdiRFYrZ2FoTXFHem81a2JXeHdVVmlEWDVlWGZL?=
 =?utf-8?B?YlRmM2R2Yy9hbjU5SU5xY0tTMzg1b1JwVStybzhBaE9iZmV5V2lJRXIwL3pM?=
 =?utf-8?B?eFVEOTFtS1hadHlSUFo5dkR6Vk0rYjA1d1lLMDlONGd2RG1qVzMzMlh4ZEFP?=
 =?utf-8?B?eE1nUmhBOUJnZVN5c3dVb0lDWTQ3T3g4V2hFdDhwanFPYy9lRFFIZk1BTXFo?=
 =?utf-8?B?RUM0VHBLMklMQWtoSXNtNXNHNlVhM1ZoOFVXbnlUQ1pSMUcwMTA0dTdqT3Yx?=
 =?utf-8?B?SURVVGw4bitVTFE4bDJSdkY4Q1NURkVNUDBUbkdsbVpnckFoZ1o0ei9VNzNH?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46239ae0-3902-4ee6-ae8a-08dd04e95b4e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:17:26.5743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqmliGBbv3cnzI6gnlElbZgCxfv6smppu1I7l8fc/MgB+f71dbDYgy/1567rOzK1Ntm+uOLQFBL6e9aYWI1xEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

On 12-11-2024 10:04 pm, Jeevan B wrote:
> increase big_joiner limitation to 6k from 5k for display version
> greater than 30.
>
> Bspec: 68858
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 22 ++++++++++++++--------
>   lib/igt_kms.h |  5 +++--
>   2 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5d8096a17..ca7f90ca8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6330,6 +6330,7 @@ int igt_get_max_dotclock(int fd)
>   
>   /**
>    * igt_bigjoiner_possible:
> + * @fd: drm file descriptor
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> @@ -6338,10 +6339,13 @@ int igt_get_max_dotclock(int fd)
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> -		mode->clock > max_dotclock);
> +	int max_hdisplay, dev_id;
> +	dev_id = intel_get_drm_devid(fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +							   HDISPLAY_5K_PER_PIPE;
> +	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
>   }
>   
>   /**
> @@ -6362,10 +6366,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	if (!found) {
>   		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	}
>   	if (found)
>   		*mode = connector->modes[0];
> @@ -6384,7 +6388,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    */
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>   		mode->clock > 2 * max_dotclock);

Is there any change in ultra joiner condition?

>   }
>   
> @@ -6549,7 +6553,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd, pipes[i].mode,
> +		    max_dotclock)) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i].idx),
>   				 igt_output_name(pipes[i].output),
> @@ -6576,7 +6581,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   			}
>   		}
>   
> -		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(display->drm_fd,
> +		    pipes[i - 1].mode, max_dotclock))) {
>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i - 1].idx),
>   				 igt_output_name(pipes[i - 1].output),
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bd154d1c1..a1d2b8632 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> -#define MAX_HDISPLAY_PER_PIPE 5120
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -1238,7 +1239,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
