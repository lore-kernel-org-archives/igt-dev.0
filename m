Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5109CFA466
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 20:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7457110E228;
	Wed, 23 Oct 2024 20:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6Rtwi5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979210E228
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729715354; x=1761251354;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=gTENHVsHJf9ywi5iWR/n7AvRvk2kLF/qVaRRDTvxnDE=;
 b=I6Rtwi5yT/8pKM6u90EdRqALIcY9zxVa1I5FyIeRgPUUlkvxlaxOHfYc
 Ooeq2Y/1z98Cm6AQyHDn/EeWW89helItTLe/4r8j6BPMZVAfN4MT4uPSU
 SI9iZYfCZmrxigeW70Zmg+117qVgfcooOloXXZUCIwG/Fxz45oADkSHg/
 7/hGN+krtbOxCfeGigtALmNB3u4SxOWUCKt08xF16QoRBMc6k7liy0M+x
 XnMxEpOPJhT0StlV6O1xn76glmDlc88eqi+yNzV/LSxzbq17ty4NPbBoc
 m/BrhBsnmGBtplYMCs4oUHSuE2EuWsNueB6oYCSzEEq9gtVXKN0TJ6MVo Q==;
X-CSE-ConnectionGUID: 2dnc+i8gRnSGw/U3DE/huA==
X-CSE-MsgGUID: 3DZKSdLBSfaEx9H0lps/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33016768"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="33016768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 13:29:13 -0700
X-CSE-ConnectionGUID: YN/6+4DfQPaRQMtqWh9uvw==
X-CSE-MsgGUID: z/aqMpmTQdSpUkVz0JKOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
 d="scan'208,217";a="111176708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 13:29:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 13:29:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 13:29:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 13:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biFFW8mNHxp6uHAE/AnOw55o1obe90vjBOAre/DW4GbocPKoyiedrFLX9OaAMrKKe0WBGlwAfNwrc80dKwGSo/UvryV6qeeflxYFN6d8/wFhAum5F+BNogJGk1v8xCmHBwI9Y6JhQyogu3Dz5mJlYFKgALVAB40XBCPnNUuGxQUQLuxIWHuW8Tb1qjLkdLzNyRaDXapmzUPJLxYe6Qtz893Z8lch2oy9D5l4KK3IKUlnrUSJBNMw/NapvlJI8jy+RIcDhqzpm7xo2AEkSkh0oUX3Kox5L25wx9nP1vX8CPrgoRxEKDVPUdIde5Vt+kQKl5qDHYlJnIF8s4WQm8vUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsVgv5U3XOCMSyHrDSAFcHJG4IBGvdjTDG5VDzF9wt0=;
 b=rWiZ/NjzXmCO77hSiQtiHsPAZ21ve/FsT3zQUNy9YC77Rjbvr1UKL38j4xtfvAikTBIgNQhDK8xqiMq2sleFBNemS/4F1Q8MPPUbdK/DpBNvL5D3c3KcCSGvXE1QFcBSrOe22BmCyqGolhgGk1HqmRpJswGDwS8ixejZb3mguAQBNQrirTjPGHkadSZa9ReqUFaUPuC+BNVT7Gmk1CrN9KPPx9OJZEXcOkFhPYn4Y6AZkzS3f+/ra/bh3AeR71kJvaCw2USyIKDn7tpAVl0ubJ0MylfdXz9R5RWcXRFvrp97TSVih7N9Q83tCeNmkbqmiuWI9p9Bg6KJAjbqd/kHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SN7PR11MB8110.namprd11.prod.outlook.com (2603:10b6:806:2e1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 20:29:07 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 20:29:07 +0000
Content-Type: multipart/alternative;
 boundary="------------ZW3008t7ux3SnSqjEi082v0V"
Message-ID: <cacecbfd-7037-44bc-97f1-425e2626b9a1@intel.com>
Date: Wed, 23 Oct 2024 13:29:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
 <CH0PR11MB54441E7BEAC825A733D6B600E54D2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <CH0PR11MB54441E7BEAC825A733D6B600E54D2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SN7PR11MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: de78bc31-c1bc-4aa1-dbb0-08dcf3a15831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDk5UEMvejZoaktWaHg5RHU5T2hPbTdCaXFWSDl5eVJlUEtxWFpzSVBtaXhW?=
 =?utf-8?B?VDNPUGw0SHdzVTdGYzluRk9WZldjRWNuSVMyUHZHbjJ6elF3dm9lek9vUDNT?=
 =?utf-8?B?UEFjMTJMcXdOYUsxNTBYWkQyOHhYMGFCcjhLOFlhZER4clVxbmQ3N2g1V0J5?=
 =?utf-8?B?b2gyWWhFQUc0N1JHVDhhbFAvQitDYm1CZFpEdFczcDdhTjlOSlNTUHJ4T0Rq?=
 =?utf-8?B?L2NrZmUxUm9CL3RhSE4vZ0s3andKSVZiSnczZFdPcWJKamlDZlFMbGRocVBx?=
 =?utf-8?B?bThYbW5iVFZESmY4VTZMU1l2UTBBZC9kSmFnL3E5VWZjMjc0YktwRHlTSS9T?=
 =?utf-8?B?d2RuMm5iWTRlZXJYS3ZrOE8rUU1WSWRGditGSlBMbll4T0xPcGk0VGV2Qlhv?=
 =?utf-8?B?bEV1bytpS1VoTHBzWThWeDVucU5waHpGdzNOVklaSHQ4ZUpyR2VzZlJwcHdN?=
 =?utf-8?B?c0xZbC9kaDBOb0hpellRS2luYlNEdTlvZ21DODJKTXV2YWR1WFhUTm5jSVFh?=
 =?utf-8?B?ZDVtbXE4OHhtYkJWUnhTT1h2WklQNGx1d2xvU1YvTVBkeG5ERlFvYko3M1Bs?=
 =?utf-8?B?cXNYREM2N241RmVUVUE1MHZqamMxOHkrMUxoZzRpUnFwbnpSS2NxREQ5V2tT?=
 =?utf-8?B?c1g2SEFSVW13L3hEVDNjcDhtMlRLb0hyekthWFhPNzBPV1BsOWJKdWUrQVQ5?=
 =?utf-8?B?NDgwOFk4aTU1SWIwam5RY3NaaXlUbk9CbU1VZnFnOUhMTjhSSEVjQjZUWHIy?=
 =?utf-8?B?SXV4TkZIYU9LNnZYWDFEY1laKzk2d2Ewbm5NTER2bVp3Ujd1a1hHelJvblNo?=
 =?utf-8?B?OGtmVis1K3N6Y2F1dzdTcTYySnNYbVRaSkJHTFRXYS9CTDRwanEvUGtJa25G?=
 =?utf-8?B?dGp6TnZkeEw1Vm5LKzliTURKRTE1R0l3NVgyQkMvMGJpVFNTbmNvcU9HRHVB?=
 =?utf-8?B?TnpBSmZwNXdzVmc3TkNwaWZUSzI4R09NWnVaallPNzNiWDg5L2I5aWh4d3dS?=
 =?utf-8?B?eUhnZnBLbnZ3cE5MYnhKdWtSY2RQbUJHOVVkTEVjOW1DMXFISkQ0cG1CZnQw?=
 =?utf-8?B?VGhCR3JtV2p0RWd2ekdEZlBXOUQwOExZdHUzY2ZBeTFSaGM4TjVFdWNkOFEv?=
 =?utf-8?B?MXd2emp3ZjNEMHRWOWZVbVlwTmpEYUJWc3U1Rk9vK1pVK1lZbWxuTXJZdHRN?=
 =?utf-8?B?b3dLVjZxMXMrOVVUYWIycGVNVmpZYlFJRGxlaTNjQ2d3NTFPekprMWVKbWw4?=
 =?utf-8?B?RTRsNGxOYmtvRjc0U3Q4SE9DeWJYM3VuTjJaM1dUd3J2RWdacEtLbFQweTV4?=
 =?utf-8?B?UUVmaEJxejYrRldtb3gyMUFWeWtacWtubndsTFpjb2RMcnJITmQwcmZqWW1u?=
 =?utf-8?B?RkMwYU9iajJkZFZZcDZBUWlDZlArU2NMV3hOV3VTOEwrL2pTUlBIb3dJTjNN?=
 =?utf-8?B?M2JadE5XNmRWOGJUekRGNWx3TENwM3AvTTM1anRMRmRDaytWVEZ2ZXBEanN6?=
 =?utf-8?B?cUdCcXlRRTRRTzlpbjJDWFRlOVBPcGRNQ2NudTBvN0Q4UG15azZCMHhPNmRJ?=
 =?utf-8?B?NnlnQ3d1eEhOdDZSQ25xaGtCY214VTNNWjF4MDJYNnB5M2RhQjZjOGdZcUJl?=
 =?utf-8?B?UHJwdy9yOTJrcjJ2bmtyZEJqN09DUXBiZ1V5YVBON1VlSVZvN3BIdjVtTWcv?=
 =?utf-8?B?anRzaUx2UFgvaUNHSTFQYUliWUlzRGdlbk5za0lKOWJNUytrbXAvelZtcCtj?=
 =?utf-8?Q?5FxKo3LpQm7DunCEL0Fzcjy+sqmc1GU8fKylYSU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdTUGxuNGJFOXVSb3d3Vk1JOWpoK2svNm9CYUR2eE8rMGd3TUFVT1g0MHhu?=
 =?utf-8?B?SVA0a3FQZTFkUmhsNkZOR05Sb0g3bHNsMTFLSytwUjdBbzk0QVFMWGNJTlQ4?=
 =?utf-8?B?dkdPcDhYSTNVcXZ4ZGFJQ0tna1ltZ3p0aWFrTHdQR0VGOTUrcjREbk90ajMz?=
 =?utf-8?B?YTFKVTFtd251djI5Q2pDUFhOWDFtZ2xPb3JyNVVpdXA0OG5MUHUyOE1TbldE?=
 =?utf-8?B?V0Ewb0dzdGdpdjV0emU3TmdVN3graUlPUm9iWURyQ1JWVWJ0b05WdEFXQUZi?=
 =?utf-8?B?UGRIZE45QjhhSk13UnZlZjRyeGJGRmhBUEd6Ti8rUkVTMW1ZeXlaQkExYzlI?=
 =?utf-8?B?enpxOTZUVmZJaG9mYlpTV3FqRm5YbmthSXJMZXlPVDNibWsyWnpPZ2hudUY4?=
 =?utf-8?B?Sk4zWEIrb1RxdFZRYXRTa3ltNEwyaUEvQXlrRlFrVG9FT3Y0eFZEelh0R0gz?=
 =?utf-8?B?WFlNQXRwU2lRTVZ3TVp4c2w3bDZHZFA2a09veVhzOFpyV0xKOVNEbkliYTFv?=
 =?utf-8?B?dGVsTW45bnVCY1RqdVlKRldmTTJveS9iNHBvSXVzNS9kOGJ3TG9pN2x5V0Q5?=
 =?utf-8?B?UTFKRW02bHh6M2hKYVllVTJZanRWQ3FOWTZ4aFJBN3dhZ0c0Vk1aOGNkM2Fv?=
 =?utf-8?B?RFBjZWRPblFxTUc3aThGdFlwSS8xazVCR2FtcVRabmx2TUpJOGY1SzRKVERZ?=
 =?utf-8?B?TUcxMFBKOWZHTVd0c1BxQUZseUQwdUZ1M1V3NGdLYmNWdTlLWkNDQmFHMjNZ?=
 =?utf-8?B?RllxZUlGVWFtVTFJRHFZV2hBd25hOHVGMWZ3SVpORFhhVVhHY0RyWXBwU1pH?=
 =?utf-8?B?aDV1dnJGUE9jWTd0K2JtZ0Y1K1RwUHBQOEJ6NmV3VHZSejE3L2toV2Jxc0Q5?=
 =?utf-8?B?emxiUWRCcU8zN2x6Q1BmNGs2aGlBeERFcUR4dHZYdlFSZkdkbUZVMVM1bWZV?=
 =?utf-8?B?aXJWbHovL3cxaEZIalVaWUk5UmZ5YlhDazArY092dEMxRVVSNkRWQWRGZk55?=
 =?utf-8?B?eldyb3VOVUFGSmVZeEMwY1BVTDBIWnFLVGRncm5RUDh0OEVjL0N6aE1lK09R?=
 =?utf-8?B?cDVDN1Q4Slh1UlpHZStHT3JBVUt3cjU0WW5pK2lneVpqK0NYbkppejQ2Smp1?=
 =?utf-8?B?a3pLNENxSFRsZnhObVZnM1daUVFoRnZ4OVlpOGlwYnhKWkM1alhUZXVKdits?=
 =?utf-8?B?Rm1yN1kxRlRjV3ZHcmQ5SkpIQlBUVTNhUHJZeWVSa243QXJ6UFBFSGpEUEZT?=
 =?utf-8?B?Q0xmVHI2ZDRsUXQ4YW5GS3IwNVQ2SnVNMzRPZXZHc1ZtR1BDZkRwYVh6TE9Z?=
 =?utf-8?B?aUl4UkdqamZhUFdrQmc5c25HeVNCMEpTeVlWTUVaK052d2h5allrUnRpSTJj?=
 =?utf-8?B?c3BmeUx3OVpPdjRSQlpJSFBVNzA1MFVabXBqRXptUXMwVDkrdFh4Ky9GVkJm?=
 =?utf-8?B?bUhwM2hRMUJYL2pBR25ydjZFUEt6bVViUVZqc2xYUVRkazlsbFBHaExoaC9W?=
 =?utf-8?B?NFU3d0p3ZC9VR2cwZzNueTBPSTRnRkdqOTNlVkhQNjdiT1VKRytCMlVGdEpv?=
 =?utf-8?B?NkJ1dUptZ3hLbGlDcllHZUZrdTl3WDVzQWtkc1JJYktDT2xzcDF2U3g3TCtJ?=
 =?utf-8?B?T05qdEd4M2tMWjVIVStJMVNYempxbmxIcnVJMFZURkVJcUh1NmRSdkUzaHFM?=
 =?utf-8?B?SG1mMGdkdDFmcFFvTytPendNcndrVHZCd3VNQTFlWi8zUkNSNTkxMnhrTE5z?=
 =?utf-8?B?WWRhbkF2ajEweWZqa2syQW9UQWxPY0ROY05aVk50Nno4b052LzRGRldWTjVQ?=
 =?utf-8?B?dVQ3VmRUb3hWby9vNmtTaXgvaEk3SmRtMUhudDVZZGRCYWloUWdJMFFOQ3U0?=
 =?utf-8?B?RkpMejZWMFZ0ZXVuUlBNbG9pMzZ0RklTRmFmVjd0RFF0YVRPZXJhTXE2RDVU?=
 =?utf-8?B?OUdpci9tUkgwNHBsVUVUZ0ZsT1d5UlRKUWxoMy80Q2dmTXlqNUc1OFNBNlk3?=
 =?utf-8?B?ZzhoZkhLbjU0d0doMUhQRDRFcTlKTFdyUmN0ODREMHp4ejhObUx4L0tpQmhJ?=
 =?utf-8?B?cTZPUFFuSjMwOEFxZ3Q5cmZ5RGpOTEdmbXFuKzdITVpaZE45bjIzN0JvN3Js?=
 =?utf-8?B?a1JOaW92WHlpVDBDWlV6SWZLS3FmdzlBanNiYTZJdENYbzVsTW9Jdngyc29o?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de78bc31-c1bc-4aa1-dbb0-08dcf3a15831
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:29:07.6120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwxlknSVjlRsGbaHhwCQNL8Ttpqy5Duf0Wq0J2mqU0MJxyShu8AhnxxqjZMXtavWmLWLgNSxqHLGDUOn6nWnrxj5BOwWDC0K+4r9aAwaix4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8110
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

--------------ZW3008t7ux3SnSqjEi082v0V
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/23/2024 7:12 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Randhawa, Jagmeet<jagmeet.randhawa@intel.com> 
> Sent: Tuesday, October 22, 2024 1:12 PM
> Cc:igt-dev@lists.freedesktop.org; Cavitt, Jonathan<jonathan.cavitt@intel.com>; Zuo, Alex<alex.zuo@intel.com>; Konieczny, Kamil<kamil.konieczny@intel.com>; Randhawa, Jagmeet<jagmeet.randhawa@intel.com>
> Subject: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
>> The bind-array-enobufs test in xe_vm.c is intended to trigger
>> an -ENOBUFS error by submitting an oversized bind array.
>> After encountering and handling the error, the test reduces
>> n_execs by half and retries the operation. On some environments
>> with stricter resource limits (e.g. simulator),
> Is it "just" simulator this is an issue on?  Because if so, we could probably
> use igt_run_in_simulation() to narrow the scope:
>
> """
> 		xe_cork_fini(&cork);
> -		n_execs = n_execs / 2;
> +		n_execs /= igt_run_in_simulation() ? 4 : 2;
> }
> """
>
> If not, then
> Reviewed-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thank you for your comment and review Jonathan. Oddly when I tested the 
following line

  "n_execs /= igt_run_in_simulation() ? 4 : 2;" The test fails as it was 
before the original patch was sent

so I suspect igt_run_in_simulation() is returning false and we are 
taking the "2" integer in this case.

I believe it is just simulator we are facing this issue on, however I 
think leaving the code as

"n_execs = n_execs / 4;" doesn't do any harm if we run it on any other platform such as hardware
, as it does not affect the basis of the test which is to trigger enobufs error, handle it, and then
run with less n_execs to pass on the next iterations. This patch will just accelerate the test on hardware.
If this works with you, may I ask if I still have your reviewed-by? I can change it and investigate
if you feel strongly about it. Thanks again.

Jagmeet

>
>> halving n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
>> Reducing n_execs further to n_execs / 4 allows the test to pass
>> successfully. This patch modifies the test to reduce n_execs
>> to n_execs / 4 after an ENOBUFS error is handled. This ensures
>> compatibility with environments that have tighter resource
>> constraints while maintaining the test's integrity.
>>
>> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
>> Signed-off-by: Jagmeet Randhawa<jagmeet.randhawa@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index 7a8740b69..e78ddd0e5 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>>   		xe_cork_end(&cork);
>>   		xe_cork_wait_done(&cork);
>>   		xe_cork_fini(&cork);
>> -		n_execs = n_execs / 2;
>> +		n_execs = n_execs / 4;
>>   	}
>>   
>>   	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
>> -- 
>> 2.34.1
>>
>>
--------------ZW3008t7ux3SnSqjEi082v0V
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/2024 7:12 AM, Cavitt, Jonathan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH0PR11MB54441E7BEAC825A733D6B600E54D2@CH0PR11MB5444.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Randhawa, Jagmeet <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a> 
Sent: Tuesday, October 22, 2024 1:12 PM
Cc: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; Cavitt, Jonathan <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>; Zuo, Alex <a class="moz-txt-link-rfc2396E" href="mailto:alex.zuo@intel.com">&lt;alex.zuo@intel.com&gt;</a>; Konieczny, Kamil <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@intel.com">&lt;kamil.konieczny@intel.com&gt;</a>; Randhawa, Jagmeet <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
Subject: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
The bind-array-enobufs test in xe_vm.c is intended to trigger
an -ENOBUFS error by submitting an oversized bind array.
After encountering and handling the error, the test reduces
n_execs by half and retries the operation. On some environments
with stricter resource limits (e.g. simulator),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is it &quot;just&quot; simulator this is an issue on?  Because if so, we could probably
use igt_run_in_simulation() to narrow the scope:

&quot;&quot;&quot;
		xe_cork_fini(&amp;cork);
-		n_execs = n_execs / 2;
+		n_execs /= igt_run_in_simulation() ? 4 : 2;
}
&quot;&quot;&quot;

If not, then
Reviewed-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
-Jonathan Cavitt</pre>
    </blockquote>
    <p>Thank you for your comment and review Jonathan. Oddly when I
      tested the following line</p>
    <p>&nbsp;&quot;<span style="white-space: pre-wrap">n_execs /= igt_run_in_simulation() ? 4 : 2;&quot; The test fails as it was before the original patch was sent</span></p>
    <p><span style="white-space: pre-wrap">so I suspect </span><span style="white-space: pre-wrap">igt_run_in_simulation() is returning false and we are taking the &quot;2&quot; integer in this case.</span></p>
    <p><span style="white-space: pre-wrap">I believe it is just simulator we are facing this issue on, however I think leaving the code as </span><br>
    </p>
    <pre wrap="" class="moz-quote-pre">&quot;n_execs = n_execs / 4;&quot; doesn't do any harm if we run it on any other platform such as hardware
, as it does not affect the basis of the test which is to trigger enobufs error, handle it, and then 
run with less n_execs to pass on the next iterations. This patch will just accelerate the test on hardware.
If this works with you, may I ask if I still have your reviewed-by? I can change it and investigate
if you feel strongly about it. Thanks again.

Jagmeet
</pre>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:CH0PR11MB54441E7BEAC825A733D6B600E54D2@CH0PR11MB5444.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">halving n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
Reducing n_execs further to n_execs / 4 allows the test to pass
successfully. This patch modifies the test to reduce n_execs
to n_execs / 4 after an ENOBUFS error is handled. This ensures
compatibility with environments that have tighter resource
constraints while maintaining the test's integrity.

Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Signed-off-by: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a8740b69..e78ddd0e5 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		xe_cork_end(&amp;cork);
 		xe_cork_wait_done(&amp;cork);
 		xe_cork_fini(&amp;cork);
-		n_execs = n_execs / 2;
+		n_execs = n_execs / 4;
 	}
 
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
-- 
2.34.1


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ZW3008t7ux3SnSqjEi082v0V--
