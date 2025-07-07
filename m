Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E84C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFBB10E4ED;
	Mon,  7 Jul 2025 16:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiC9P3Vy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCC710E4ED
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751907021; x=1783443021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g8OQ1XcMRQpG0GBq5BSK09nG0x7VKj2OoSZ+iwR9Oa0=;
 b=RiC9P3VyQLUW0MCF5pYQAcVnLvp4CjBZjXf3Lmo9K+vQaxNaB24pULrK
 goKs9ueegqFTvaA2WwUhYFv0ynYm1Frn3mSQp7HcoUO1SBUCM2j9jsxRv
 rFs98Xiv063Wb8D26wCvQxIzS+/ekizbCGEd5f1dfJPCZJpgRRzICE8JN
 XS2kOGR0bBKJpe7i46XzheDAnm+/KCgLT6uM6R3XHn2FBsmHVerEoScKf
 X10SAjVp5r7JVSEytWV52ogNlE3RonzHthV54xYaZeAZqG7nGonU2WR5P
 bpo7RcAFA/ySc7Ik+gEmk7nucugsK+vRtv6UpHQiaLHtpO87EKqTynlrf Q==;
X-CSE-ConnectionGUID: xiYs41MpTwi5iRM7nJ8cIg==
X-CSE-MsgGUID: GbieZLSRQEyWP+MZfJUG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65194899"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65194899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:50:21 -0700
X-CSE-ConnectionGUID: tIGDd3s0Rq2wGQsXuHizvw==
X-CSE-MsgGUID: zVSKxRWESbedZ0Mw4Urhrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155360408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:50:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:50:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:50:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R94ZhNiuQmzFKgRr2W4SNnRsmCqJykImYVghmzzr+dQbj4D9b6uKt5opUA7Xtv60WFU3DgsTFY4y0E3XcgEQmBqhBUlZbAPvWnDcryb/h2GlgkaI7lshvZqY9qztYWVKgtMK04czoAd/ioKlcMSYmXSwthRJU81SoLv+DWno5hztVImdo4TY7emMIYNB4quw1iwKSda9khz5zL84OtySEFopkvfMbGq9YUUiJgPbjc6e9j4j5z4Bunb0I6n5nZUQX3jLmeI1T2pfzklwQjNeWEWJUnxcljvnYWDh/iASCO5XzSiv73EOtKQibCkb6/S0uFqcqjXSJKbHv/wGBaMEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngMJOSWQIrLsE7vlASe3gq8wiSxjIQ61zC2UnSZxzsc=;
 b=xN8j4ZocPuykCsGLl4hTf1lV4e0+gXjUgmht3yR9n2QABRc9Zs492Zx3hvEurxT+kT+s7BzeiT+HGRGNkoEq+Bi7sDL1nm/nJpWGSwWsC7OG8xUPZF4b6xJH0mFPthEE06Jn2Qzw9ZNNHi5AXu/xwT5b/auhc9rNuCgrfJV/sgYUz93bjFVEbwxLjtWPXJ0HCKugiedGICJqxkHe5cqHerLyDqW4WdiEt3WFksSV+jeOLI9JtM/sFR+7bwyEAFTkM+/Hsa/DB1F9MzfC1qap4i6ihsKOHSgEPGvuSUEIdhrnBIJq+wY75qwMJZFZafpOhqNn9/4dbpnZwb04MPAD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY8PR11MB7898.namprd11.prod.outlook.com
 (2603:10b6:930:7b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 16:50:17 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 16:50:17 +0000
Message-ID: <53d3c8f5-2f53-412a-b143-dda96aa03dcb@intel.com>
Date: Mon, 7 Jul 2025 18:50:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/intel/xe_eudebug_online: add pagefault stress
 tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
 <20250701135307.68147-4-jan.maslak@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250701135307.68147-4-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::18) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d49887e-513d-4797-845d-08ddbd765a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHZ6WHd0SWIrTTdiQ2J6QStDbEVWQkhGVmpPTUduY0k2Y2FPNGdxWVcwbUJ5?=
 =?utf-8?B?OFhOQjVPS2M1TEZPYVExbm1nR0pQS3FvQmlRSGlRaXdZUXRLdTRoL0VtNjZw?=
 =?utf-8?B?LzVKNE83TWdManFKYlFzVWJWZ2NKWXl1QmVWd09kM2VvaEZzU29URnYvaWN6?=
 =?utf-8?B?N0ZBa0IybTFIRlZuak1sQUFRcitzaGxQK2V6aU00MTJyaTdTdUZNNndyMmRS?=
 =?utf-8?B?M2QzVGFKc3M2S1IwL1VhVko0RHdOZzFOQlVrY2NkMkFPU2Rwc0hqMzVDNHZu?=
 =?utf-8?B?VTM2QUxiMnl0OEViVEFNQllUb3dhWjVwM2YxSlZPK3NTaEsvdXVZdUxEdWZu?=
 =?utf-8?B?ZUovRkVJR09YN1R5N2ZzWWViYVR1T29BcWdnL0l4QUpXTUh1K2VhME84VUV2?=
 =?utf-8?B?K1l1cTMzY3pzSGJBUFZYQktQUk5xenUwWWZQNDc1U2xoNHRSTjVPZE5ncm12?=
 =?utf-8?B?YkhZYTgrbTd4MUIvWmhmTm8ybXJiNXQ4Znh4M3N1SnFXMFMxRSs2VWkzdXl6?=
 =?utf-8?B?d3MxYWo3Qk1MMVZpUUF6cUl4Z0lBcmhmQnRZTzFaVCt1ZjBQODVmaEdZUnRs?=
 =?utf-8?B?Slo1c3RrWXBhdUJGVWVHOWZVeDZPTjdLM2lsdUxXZFM3dERvaXRvc09pVWJ4?=
 =?utf-8?B?S1Bvc3UyWDFZMmFJSG5sNFI4a2l1Mmt4YzB3aVB5V3JydENZT1poSW15bkN2?=
 =?utf-8?B?MUpnVG9rRTZDVGZEdUtxK0pvYzJvenA0eDljTlJ1QXNSaFhxQTEwZGY1cFZD?=
 =?utf-8?B?UG9kM2dUakxBWVR5R1hWSnUrdmlLVUtzQ2FVNWpVeW1yQ2h0c2psNlNGUnRB?=
 =?utf-8?B?dEdBSG84UDk4ZW9qSE9zZGxRVEdFQXlKblJmdFkvVWMzRWxjYS96VWJaVk16?=
 =?utf-8?B?UnZ3TW90U1FFaUhaR2o3TmJJbE1SV2N6Q1VOOThNMDJFT2JFcVMrRXBOYjl2?=
 =?utf-8?B?UlVPZDVMbHkreVR4aFhYRFkvNzMrTWpNeWpzelFLZXNjN0FYQ3Ric1Z5K09C?=
 =?utf-8?B?SGx1c0lFMU1veElYVnRVOGhja1FhVXk3dEVUaXNzVnRGUjBiWWNHbVlMY0pT?=
 =?utf-8?B?dHhHaDhlU3FQVVp4bUJOeHg3MWNiY3FpRjZ3MjJnVTVHek9YNUo3QWNRZ0pS?=
 =?utf-8?B?QVk1RmRCWFNkblpWMWpLUjlCSTNRTXBCNlBkK1lsUHFWbUsyQ0ZyUEttOTVx?=
 =?utf-8?B?bU16VWZRczdXUlhqdEFRKzZGbFVzUmFNR0VuZkFJYUhVeDQ0Zld2a2FOeHFo?=
 =?utf-8?B?bnpJd0ExR2VIQUFBbTFLbkppUXgvWG55bHNTMTZqNm5PYzRVWWR5MGFYWHRF?=
 =?utf-8?B?YklXd1JReFpwc3FSMTFkNldheVRtaTZEZHB0T2tJalhibmdFMVlKMFBVNWda?=
 =?utf-8?B?MnZ5RGRVUVBrMDNPZk1kM0daYTVaSUZmSVZBeGpUZ0FvSzl4SGJ6VGNydnNj?=
 =?utf-8?B?dHo2TC83aVAxMVpGL0pEdWZrRmliQkFGNlpPMUgvd1gvWXdQN2hKbE5yMUNZ?=
 =?utf-8?B?SGJJYzhxb1lFcWM4VUFhV0psbTdlRHNEaUZwYjM5SU1wNHZONmRJNFdWdEgy?=
 =?utf-8?B?QTFoOUVCczJ5Y0lRKzI4SHNUUTZISU10aUF2UkpXVk5ENzZJTytqTW1BUE4z?=
 =?utf-8?B?SkdqaVIxYmhXTk5pYXp4d0pKbThzOXU0eU1YNWtXRC9nWmVweUxjdUUvNEZM?=
 =?utf-8?B?OGhiZjlrOE1zYjZlS2hmR3A0SHprMGdlV2pxZURSeDVjcW1SdUo5WTJJdWY2?=
 =?utf-8?B?eGRWSzlEaUtIUUllM0l0S3d3UC8rV05hRlRMSUZDMExMWTJFUHV6Z2NJWXls?=
 =?utf-8?B?UlQrQmxicm5ZRU5CMHFEeTVKNTh0V2ROR21QaWdnTXZiQkxrRC9FSmZTVDZ4?=
 =?utf-8?B?T3VacG5xRWJiMGlPL2c0NlcxanV1MDdrcE83NVBqa08yMUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDQ3T21PZ29PUElXZDNyQUVTMk1PU3FFY25sdks0YlVaUzBVMXJRdFVkalhK?=
 =?utf-8?B?Rlg1Unhpa2hUM2UvcWVqREZ6Z21LdjlMdUx3M0JzZkV0ckp0SVpnWnN1eUF1?=
 =?utf-8?B?ZURIZXhrZ1ZmVHRkcTJROWpmUEV1dEV0bEN5UTJBdUJMckNSWGxZZVgraUFD?=
 =?utf-8?B?Z1NrKy9PdnU4c2c2SVFRR0htVWlUVmhKaVdkVGNXVGszdzdDSmRMM1BybXN1?=
 =?utf-8?B?dnV5RktQMStxY1BmU0tnR3NUZ1NFSkNrMDAraUVkYkVlZnBNSnZMekZnUzZh?=
 =?utf-8?B?WmV0TDBVS1MvQzhLbU5zUlE0b044UU1HcHhaSmN0dGxaZmRLRTJjQjFyRVJP?=
 =?utf-8?B?VEhrL3hZVVNkRmZXRTd5K1AxRi9GVEorRWNMaXU3WncvWlFwcHFxK0pTYTJL?=
 =?utf-8?B?Ni81dkFmT2I1N3FsTmRXSWJ6WnZjN0hESkNwa3JmVElucXNpejMvT2YwRU9D?=
 =?utf-8?B?RHNKYjBGN0JiRm5NZ3RWZFZhTXJlOGJZYThCZGErNm5uU1YyejhvZkhGS0Z4?=
 =?utf-8?B?V3pXZzNXYlFyT0lseElXYnhVU0pveURtTnJlVHJtREU5SkpFaEMwVlJMd0Z6?=
 =?utf-8?B?aXdlRnE2RS9rTEQ5bnJURGJvaks3T2VYVnlyWHhnYzJ0TjFPWG1DNk9FQzk2?=
 =?utf-8?B?aUdsRFFyRTFJcExpRHVFWlEwbUpjdGI5NVZwVC9UNnA0eTJpZkhtWitKS1FX?=
 =?utf-8?B?bGEwTkJaR3hzOUhaejJFWVNhc1pOWllYTVFaK3MzdVJuY01iN3hreExGaGlh?=
 =?utf-8?B?KzNER2xhdzl0dUQxaWM1anljRnNDeGZOaTJYWkJoVzNTaHptOGJYRnpObFpv?=
 =?utf-8?B?aFV6d1ZCdURCbUZZeFFNUUxHMGtwM3hTWHNLV3NEajFRMXBTK1RKcEVXUWxM?=
 =?utf-8?B?WmhoMC9CdVNPdVhkVVFoVklrcGJHUVQrRFhLY2s5QWRMTWRpSll4MXl4KzNW?=
 =?utf-8?B?WW92Y2w1Ujh5T1Y4TGR4ZkFKT09PdlBxUDVITXBGcXFsK29za0RrdFlmbnYw?=
 =?utf-8?B?cGxTYlE2aEg0YWg0MlQyQ0ZXYkEwNU9Xb2F2ZzQ4YTdhV0hRWnpyUTlndUNm?=
 =?utf-8?B?cTNVdEQ5SmM0ckpZYVp6OFdkalpFa2JWY2pld2l2RDBHblkxVHFjSXk1ZHI4?=
 =?utf-8?B?N1JScTljbWg2OTdwdGF2RjVLanpFNmIzR0t0ZEFrSDFWc2RDQzJTQ2k1SXBX?=
 =?utf-8?B?NFVFd1A1akRSNWRaRHFVcVB3Y3YwTEc2WXBLVmR3d2xNSlc2YTRaY1ZDVld2?=
 =?utf-8?B?bkNTUnNtNVpISHI5RGZWYmlMR0Q1YXFkS1BGQnI1UytEL3BLYXovY3FXNG1D?=
 =?utf-8?B?QUgzbVhyRVJmZEdYdnRZMkdvL0x1QU1DRVFFUThlMkxsNXhhTWppci9mdWVE?=
 =?utf-8?B?ZDVHcVFjZW1USXNwNEFNa1pJUGtZeUFnTFp2SnpzZk51V1NCL2lNbzJ4RHY3?=
 =?utf-8?B?L3V4NWh5U2ovUGMwM3IxSTd4UmcrR0ZpaklBNzEwTHNOOUdJYmc5V1oxY3pZ?=
 =?utf-8?B?QUdISVh4RXliRWlkVmM4SEQ1MTZQUmF5RW1Ba1JZL3QxWURIUENja2JCdkc0?=
 =?utf-8?B?d1VpM0R6ZnpxWkxsaHlvK1Q4RzNmejdkSW4xak8wMmdoVWp5c1lUWkF4NmY5?=
 =?utf-8?B?b1FUOEZZUUlld09Ob3h1emMvZ1ByRGlRazE2ZXJUeGl0enFkY2MzaHQ1aDkv?=
 =?utf-8?B?UTM1R2RZU2pRZFUwanVFMG04VEVFZG1DUDd0ODdBUUFhNjhNY3Z5ZExYRWxO?=
 =?utf-8?B?WVhlY3czWm96dE9sbFRSd2JQUm50UytlSUp3Q29tbFVMTFdGVnl3QWNZNU1O?=
 =?utf-8?B?QXpiSTBOMHFFa2Y1ekowOEorb3FVcFhsbkhCMFJUamR6U0RGdmlIcjFZR0dG?=
 =?utf-8?B?N3hqS0x3enJ6bVd2T1pGOGI5N1lYRlZ6UXFEVnNPUXZQSVBCZGlLMCtFQklS?=
 =?utf-8?B?cnpkSmprcWF0OHpyM2tUU2o2K3ZUZDh0bG5DUXl0SGExNWZmYlhEc1JMZnFL?=
 =?utf-8?B?NWZrY3AwS0NwZFZWMTIvMzdlRmxDSHZtUUJvTDVhTWJoRUNiZ3hiQ0JIcUY5?=
 =?utf-8?B?ME1zWXlXWlRmZFV4dzhoWVJlWnZ3Tm5KSks0Y1lwQnh5UFRLUjJ3Nnlyd1ht?=
 =?utf-8?Q?rGnkH6TTywA4TfWdBXR8qTNDi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d49887e-513d-4797-845d-08ddbd765a24
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:50:17.5530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gFO+vGADffd4FZYteIOjLX0Q/sSzCLM/Jct1hsiinYB0WiV5ybMeDLw9HeQIHWpwitnWz7OCrZ8aOR7cJWhDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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


W dniu 01.07.2025 o 15:53, Jan Maslak pisze:
> Add a stress variant of the already existing
> xe_eudebug_online@pagefault-[read|write] tests that increases
> number of threads in the shader and number of threads in
> threadgroup to their maximum available amounts.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 75 ++++++++++++++++++++++++++++-----
>   1 file changed, 64 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 0498be80a..7f06fef27 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -40,6 +40,7 @@
>   #define SHADER_PAGEFAULT_READ		(1 << 14)
>   #define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define FAULTABLE_VM			(1 << 16)
> +#define PAGEFAULT_STRESS_TEST		(1 << 17)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -125,8 +126,34 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
>   	return buf;
>   }
>   
> -static int get_number_of_threads(uint64_t flags)
> +static int get_maximum_number_of_threads(int fd)
>   {
> +	uint32_t hwconfig_len;
> +	uint32_t subslices = 0;
> +	uint32_t eus_per_subslice = 0;
> +	uint32_t threads_per_eu = 0;
> +	uint32_t *val;
> +
> +	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_MAX_SUBSLICE, &hwconfig_len);
> +	igt_assert(val && hwconfig_len == 1);
> +	subslices = *val;
> +
> +	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE, &hwconfig_len);
> +	igt_assert(val && hwconfig_len == 1);
> +	eus_per_subslice = *val;
> +
> +	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, &hwconfig_len);
> +	igt_assert(val && hwconfig_len == 1);
> +	threads_per_eu = *val;
> +
> +	return subslices * eus_per_subslice * threads_per_eu;
> +}

Nice function, with small helper it would be more compact:

static uint32_t xe_hwconfig_get_value(int fd, enum intel_hwconfig attribute)
{
     uint32_t len, *val;

     val = xe_hwconfig_lookup_value(fd, attribute, &len);
     igt_assert(val && hwconfig_len == 1);
     return *val;
}
static int get_maximum_number_of_threads(int fd)
{
         return xe_hwconfig_get_value(fd, INTEL_HWCONFIG_MAX_SUBSLICE) *
                     xe_hwconfig_get_value(fd, 
INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE) *
                     xe_hwconfig_get_value(fd, 
INTEL_HWCONFIG_NUM_THREADS_PER_EU);
}

What is difference between above and query_max_concurrent_threads, 
functionally, if they should return the same maybe you can replace it

with your implementation, looks superior (if it is in our internal 
branch only, then you can try replace there).

Have you tested this on all supported platforms?

The rest look OK.


Regards

Andrzej



> +
> +static int get_number_of_threads(int fd, uint64_t flags)
> +{
> +	if (flags & (PAGEFAULT_STRESS_TEST))
> +		return get_maximum_number_of_threads(fd);
> +
>   	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>   		return 16;
>   
> @@ -154,8 +181,8 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
>   
>   static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   {
> -	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
> -	struct dim_t s_dim = surface_dimensions(get_number_of_threads(flags));
> +	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
> +	struct dim_t s_dim = surface_dimensions(get_number_of_threads(fd, flags));
>   	static struct gpgpu_shader *shader;
>   
>   	shader = gpgpu_shader_create(fd);
> @@ -208,7 +235,7 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   
>   static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
>   {
> -	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
> +	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
>   	static struct gpgpu_shader *sip;
>   
>   	sip = gpgpu_shader_create(fd);
> @@ -671,7 +698,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   	}
>   
>   	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
> -		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t threads = get_number_of_threads(d->master_fd, d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
>   		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> @@ -693,7 +720,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   {
>   	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
>   	struct online_debug_data *data = d->ptr;
> -	const int threads = get_number_of_threads(d->flags);
> +	const int threads = get_number_of_threads(d->fd, d->flags);
>   	uint32_t val;
>   	size_t sz = sizeof(uint32_t);
>   
> @@ -918,7 +945,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
>   {
>   	struct drm_xe_eudebug_event_eu_attention *att = (void *)e;
>   	struct online_debug_data *data = d->ptr;
> -	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->flags));
> +	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->fd, d->flags));
>   	uint32_t *kernel_offset = &data->kernel_offset;
>   	int *counter = &data->att_event_counter;
>   	int val;
> @@ -1042,7 +1069,7 @@ static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
>   
>   static void run_online_client(struct xe_eudebug_client *c)
>   {
> -	int threads = get_number_of_threads(c->flags);
> +	int threads;
>   	const uint64_t target_offset = 0x1a000000;
>   	const uint64_t bb_offset = 0x1b000000;
>   	size_t bb_size;
> @@ -1059,8 +1086,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>   		.num_placements = 1,
>   		.extensions = c->flags & DISABLE_DEBUG_MODE ? 0 : to_user_pointer(&ext)
>   	};
> -	struct dim_t w_dim = walker_dimensions(threads);
> -	struct dim_t s_dim = surface_dimensions(threads);
> +	struct dim_t w_dim;
> +	struct dim_t s_dim;
>   	struct timespec ts = { };
>   	struct gpgpu_shader *sip, *shader;
>   	uint32_t metadata_id[2];
> @@ -1069,6 +1096,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
>   	int fd, vm_flags;
> +	uint32_t num_threads_in_tg = 1;
>   
>   	metadata[0] = calloc(2, sizeof(**metadata));
>   	metadata[1] = calloc(2, sizeof(**metadata));
> @@ -1077,9 +1105,17 @@ static void run_online_client(struct xe_eudebug_client *c)
>   
>   	fd = xe_eudebug_client_open_driver(c);
>   
> +	threads = get_number_of_threads(fd, c->flags);
> +	w_dim = walker_dimensions(threads);
> +	s_dim = surface_dimensions(threads);
> +
>   	shader = get_shader(fd, c->flags);
>   	bb_size = get_bb_size(fd, shader);
>   
> +	if (c->flags & PAGEFAULT_STRESS_TEST)
> +		num_threads_in_tg = compute_max_threads_in_tg(shader->vrt, false, SIMD_SIZE,
> +							      false);
> +
>   	/* Additional memory for steering control */
>   	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>   		s_dim.y++;
> @@ -1116,7 +1152,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	sip = get_sip(fd, c->flags);
>   
>   	igt_nsec_elapsed(&ts);
> -	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, num_threads_in_tg, shader, sip, 0, 0);
>   
>   	gpgpu_shader_destroy(sip);
>   	gpgpu_shader_destroy(shader);
> @@ -1630,6 +1666,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>    * Description:
>    *     Check whether KMD sends pagefault event for workload in debug mode that
>    *     triggers a write pagefault.
> + *
> + * SUBTEST: pagefault-read-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends read pagefault event for workload in debug mode
> + *     with many threads.
> + *
> + * SUBTEST: pagefault-write-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends write pagefault event for workload in debug mode
> + *     with many threads.
>    */
>   static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
>   				  int flags)
> @@ -2665,6 +2713,11 @@ igt_main
>   	test_gt_render_or_compute("pagefault-write", fd, hwe)
>   		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>   
> +	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
> +	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   
