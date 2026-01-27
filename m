Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D7D2FEF9
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 23:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A651C10E5D2;
	Tue, 27 Jan 2026 23:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHm+x9RF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E0D10E5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 23:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769555964; x=1801091964;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bGLKXLAvOwVKk5ISmtzj5w3CbHpY/1DafVgL1u+GPOg=;
 b=mHm+x9RFuZk2XG0rboMjENtuHWVoH8/TqKLQTBObaZeMiNo3PaI9ZlkL
 zrEmBxRafVUaSb4XylGWR3OukCuhIvK10ePCLv/FCCKFXJEvF1tD40swi
 oOXChot1oHTqtF3qFw1FFPlTbxYOpZbzczwQznto8qGXXgyuwtB2E8GUS
 JPqA+IJFIxlWbMMG4u0ZSq45L9I5/u8sRbuspLJqwQOKFyGspOil4+yKc
 g83Hilqp2I9dNEbd9Y3D1sWMrf8R8GTaaUjkOsqiJ057wdEttniXfIyST
 T2h5QbTLckHaBRpfAjGua20qC95Zw0gHlyBcjQ10JXSTzcelzWM0oIUPc A==;
X-CSE-ConnectionGUID: r4ky8gN6QDy6TlxPtjeXBA==
X-CSE-MsgGUID: 1TAxb3YJRLiOqYNOZ4jwRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70737005"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208,217";a="70737005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:19:24 -0800
X-CSE-ConnectionGUID: 1PiKm3eLQ1u1/o5NlHAytw==
X-CSE-MsgGUID: RygswJdzQqyBpAVS6mPkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
 d="scan'208,217";a="207719545"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:19:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:19:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 15:19:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:19:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+i4WFt64Z8jUd8fci8qEAb3pOIVwn8kZxz14Jl8iFVjkeHeBNYIgATWirnkrth/UGDS4QqesuREGNosOefFiuI0N89iBnywmZSHiqKG9drNjOnBwIzIMtd8fOcmt5IO0Cm1pDjdXDhROe/Z7Io5omgYtBQEAWORJPy4jwMInq3GtkY6eYXEj5r0WbTYtIUeGejhPbhQu87vTW4WgDOx47wleqHtRB1YBF2IkacYH3HTPJu34qEEjscQ6FV8bpR5Q0QTN3At8K1QOukwwS3FdThreS8QhXs1MSemYZR4plWkKWcCwdIyIu72rNahNV53Bpxm3QY3vu/pRbZIaPgsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35L3izTZsz/bF1SO0W9BoLfnBLMYsSkUTl/yFk0mN5Q=;
 b=S1KQh/vgkg+3/dJOSUummHNAyFKb4H0xcRG0wh5din6Q5wCnueE6usAZAmpj5VVDVnjHS0hl8zp7IBDa77cAlhmVIrbWHGYcKzNRjnL/4tlODVZ5Rni4AQIQmYY21iL5DlzBiOAnH0Cz4lKmOxKvvja4cKuScmWPOus4UN1v/YZdnd9mIOnGsc526tJblSVtCHZIRgL/zryjaU4bjI2zpG1Yz++q2ZeEXu1Xe09d2OZLsSEJYlMvLzns9n/C6XA/r788Kkx4s/kOYaTeo+YGCmDhzWKEPS+2ITXH0MeWOC8qJfxRqcSBXvrPYFaMle4Elmh+tz8KEtMGU2WgQljqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 23:19:19 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 23:19:19 +0000
Content-Type: multipart/alternative;
 boundary="------------Iy5IXynL9qPNm5YOTvejeBmx"
Message-ID: <9558be0f-01b5-49a9-8944-e239d4db828a@intel.com>
Date: Tue, 27 Jan 2026 15:19:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Fix UC PAT index
 test timeout
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Alex Zuo <alex.zuo@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20260127215102.19951-1-jia.yao@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260127215102.19951-1-jia.yao@intel.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 732f4ebb-46f6-4d2c-74c1-08de5dfa7f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXlxY0tUUnRkM3poSGtGaEd4MXI2QmRKYXlxRGh3cnBORHNaN21hb1o5M1Mw?=
 =?utf-8?B?bXNxUUI0d0IxL0I5dWl1MGpPaDBtNlBycHEvRVVHbGFsMnJxV2t3dTA3Ylc0?=
 =?utf-8?B?dFFhSHB0aWdyV1I2U1p6Mlg5VWlZZGFaZXpkRkRzdThqN01GaU8xMVZoalpn?=
 =?utf-8?B?NmNHM2orYWUxV21RbWtBeGhOUFpmSGUrdXc2ZmZhb1k1b3pwY2d5SVduNjFq?=
 =?utf-8?B?QkFmMEtvVm1aQ1AvOXJrQ2lHZmFadk9vaHF2RndWbVMzQjFOTWJzZ2p3WVM3?=
 =?utf-8?B?WFpFWkZsbmozT3Q1enRPTjAxSGpKUTJHTmNCOFZrcHVUTC9veCtPY1MzWnFL?=
 =?utf-8?B?Q3dtM2k2Z0hQMW9lVjFTOUVTTFJ2NHBGYS9PcFpOMlZteXQyR0tDeHB6VnFD?=
 =?utf-8?B?TDRlaTUrNE9pNUFEMTVNOVErbVZrcmFWMFlkWU5DRkc3TjV5UXh2dDdwaVVO?=
 =?utf-8?B?RDk2Ry9hZU0zL1h2Zk9lcVZWM2JBZXg5VS9WbDk5VUhwem4wQ0Z0UW0yOFRU?=
 =?utf-8?B?ZFZLR0l4R3UyM0p5MjBOY01ZRFcvbkVFSlJtRlRwZmtmbDRZWTdCTDRUVFlR?=
 =?utf-8?B?bTc2Q3VFR0RmeWlJMzhBaGdpV21KTXpkRmh5RkNDSHlWNWx6MWJHV082eEVi?=
 =?utf-8?B?WHJnSFdWWktSaE1yVWVmTkFFQSs3Tzc5S0FjUWFPRnBsczAvWE9WT2RXeFBL?=
 =?utf-8?B?SERCM2VxZStJWVBoczFYYnBPd3RvZWl4NGJYNUtXemIxbHhHaVpnNjVoZ2th?=
 =?utf-8?B?Z0lwMy8yRWRXTEJjanBaUGZOblY0OU9NQ0p1L1JyTm5kRFVaRnh0Q3pSMlVq?=
 =?utf-8?B?L2JwYmsxemVuaEwvbCtjN1B5QVZKY0RWenlVNVphNDQvWWh0cU9meGZSeEpn?=
 =?utf-8?B?Z2hiYlI1SGRjZzNvY2piclYveENGRmtDVmRZWmhhWUs4eG9yclJHTE1CL29I?=
 =?utf-8?B?K3NuaEorcnMzcWlIcjdMSllTZVVXZnpwNzFtZERMTXpTRHFzaityMmxZSklw?=
 =?utf-8?B?Q05KNUx1NktjSlZiNVBPNUd1S1ZpTTZvOWxRWHljQW8zejZOWWVXQ1R4RW00?=
 =?utf-8?B?M3p0a0EzMEMyMTk5V1Z4WHZOODBmQzdzdzFOT2I3LzlzdzZaUUFzS3lXTmo1?=
 =?utf-8?B?QjJJRko4cWhab2pTM3VLSzAzWHNDWlBWeFQrbGxObXVCRFgvNjRma1RUbkJr?=
 =?utf-8?B?djJDVmlqY25HK0tWVGp3RmJ0cjdyb015dzl2LzljdmkxOVF4dHdyeDlZckRC?=
 =?utf-8?B?Vzk3R2c1Sm04b2xISitTNWg1aDRDSE41M3ByNmFyT2MyVzBZSkRUdjV0c3lk?=
 =?utf-8?B?V1FKUFNzYTNHOTVMQzJ3d3NXbk1rcTdjMWYxdXdiS1JJSmhsM1J0Zkh4aDha?=
 =?utf-8?B?dnBBWEF2c2svNlV6Zm9mMEZZUlAwWTZHMlVsMW1MZ0VwTE1uZ3BwNTFzcVVW?=
 =?utf-8?B?NFByOGl0bUh3R1JJMTltTGZpMDlvTUIvbkxtM1E3em9nM2N1bHdTNVh4a3cx?=
 =?utf-8?B?ajdNaVFpVGRPR0pDTktudXVSZnh0TUtHRlhsdS9NN2tkNFZzcUM2U2k1WGpC?=
 =?utf-8?B?RUhiaTh4WisyYXNEUllOekc5SjVXcjVyMFIxRU5ueXdSeGphY0M0am5Oblc1?=
 =?utf-8?B?bzhJNVJ6eFY4QzNvQml2NUQ2M1NFZGZDaHZKQXNMRlJkdDJSbEtoMFRYWk9n?=
 =?utf-8?B?M3VubVJCQ042UE01d0ZmUXJuMGYwL05tbUp2dllwMmlibk1IZjQxdlVOMGF1?=
 =?utf-8?B?SzBLV3kxSEJvVmx1MUdIZGpmM2V2TE1xaUZCQWV5MEVHd0RJUDZKT2JUOHFq?=
 =?utf-8?B?N2pVdW1GTUJKeWVDbjU0eWV5WWh4NHd2VEoxUGovVmlPdXc1eW51clBjZElo?=
 =?utf-8?B?REZCeUtmZGc3dUVnQldrdE9panAxcEJUNEwveEhpRVZPbmtVZHBuZWp0M2Ni?=
 =?utf-8?B?cmxaV1BZMHVTZmpMU3lyZStNc2c2TVl1RFRKSzdUekJXN2Mxb0hJMWU5eVg3?=
 =?utf-8?B?TC92OEd4bVk1eFhGem5oYUZEL0JkUjVNSkFzOFRMeEhYbk9TdXhFTG1vVno4?=
 =?utf-8?B?RHRsWkNCeWtsUVFZdDc1YTl5L3RjYTV3RjY4TTBwcFFmazZLaWVvY2IvWmI1?=
 =?utf-8?Q?aghk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0Nmd1A0K0dienZLbFJLM3pDczh4RUdXeWtBV3pnT0FKeWdseVRScGtuVGtS?=
 =?utf-8?B?MERhMytxSUowT04yeGNTbnJ4akVpRjg1MEwzN3VWV1crK3FnV1RpK1ArRjEy?=
 =?utf-8?B?dFE4QzFtdWY3YkpqekI4c2ZzbzZQT1hrL21lRHZlZkdwcURTenFnalFrWDZ6?=
 =?utf-8?B?WC9mMVNMSytZZ2RON2EvQWwxUlNTdGpVV2Vva1dkZ0R4WHYxV2hPVU0ybXRM?=
 =?utf-8?B?MXlHN2FRbVZvcmxyUE9YdDV0Rnd4cE5EcVZrNVlXQ1N0SW5qTlBGbHRzMzNS?=
 =?utf-8?B?NUVHS1Y2SElVNGMyTVV5cXFNeFgrSm1vT0RNMUdlczQ0amRyNEpBSUhhb0w4?=
 =?utf-8?B?VGZ0TXNQR1Jza0c3bkhwWElGTjhhc3pUeG1lSDM3MVlkZGN0Qk9TWUNIVTBi?=
 =?utf-8?B?bEpLcWw5MkUybTdrSGMrdW9UaDU5cHc1MmRCNkhOaElkdFpSM0RGN2l6dFd1?=
 =?utf-8?B?Mlp3T1NvL0NudkhqWEJROVA1VXdPbis1VklGQ1AzWmtOT2hSMC9PSnlNdTZC?=
 =?utf-8?B?dXVOUzVyTDJoWjYybmtuY2xkUk1jYS9GSkM1ZXVKV05KZzNabS9zTDRVenBp?=
 =?utf-8?B?UjYrVkswdTNSWCt5YUo2aW5Vbm5seTFIWTlxbTdWVlhZNUtpajdWMzhVYnR2?=
 =?utf-8?B?WktKUGNjMmRRaFFKQ2xUZ3NwSEtTZlUyY01SMGFyNDFuWGZFQzJUbGE0K0dy?=
 =?utf-8?B?ZUM3WUd5SDZHb3doNDcrenpLR0xPV0g3NFhkd0FOOGtralBUdEwwWHV0bmc2?=
 =?utf-8?B?dWpETnJhTHd0NzZJZzI3c0FldElOa2EwZ0tQMlJQOVFaQ3RnWWJoSVNPQmhl?=
 =?utf-8?B?K0dsbjFjRTREdmdJTk9XeUFJc0pnYXc5ZVQwWU54Rzg4ZE9FQWk3cHpiY0FC?=
 =?utf-8?B?dnNuOUhrOXBJU01XMWpUaCtwVDBKOElYbkh4bGt3QzB2WG5VM0gzWTlEWG9Y?=
 =?utf-8?B?b0I5WnJGalhFOUQ1RG1hOWdlMlVmb1RlcTBaUWhEc2NiS2luSXVmSmx1OUFQ?=
 =?utf-8?B?RzNZRHVvcS9GdnFGMUJnYUtNR09WMFdHbVFNUE5PanVEZ0Z6RnZNdlNOeDRJ?=
 =?utf-8?B?ZVR4MGFQRWxKTjFsZlJ0eXdkbHpPbnYvUndIeVZFMmZ1RlBoVUI2cjM1UnVw?=
 =?utf-8?B?aUZNYTZCblduc2MrNzREVVp6bXFhZll4WVVOYlBCZkpaUU5YTlVjbXdBTTJU?=
 =?utf-8?B?MlZxMUZMMS9RekJEekxtTnA0bytYZEliZWo1Q1RLVFR6cng2d2Z5Z0xpM2pl?=
 =?utf-8?B?ZFY4WkpEYnAxbTIxRFJhUjVDZ245bXdvZmE2TFg2MkVEd2tGemtnZkU0Zmp2?=
 =?utf-8?B?RW9zc1hGNTJydUtyQ0VNM3Q3MW80T0tjb09xeEJ0TnZPRmJqUk1qR2RoeXVT?=
 =?utf-8?B?MkV0TXByeUptbnlUZXZObFo3WmpyNWxmZHRpTzk0SVBGb3JyeDBrVzhnKzUw?=
 =?utf-8?B?c3hubVpWSWVSVGM3eDhiNkRJMFNDYjFQWnBYdG5Ga2pibFlQSnBnQjFJL3o5?=
 =?utf-8?B?R0ZJbThUNFFRQTRYM1hGS3NtZVFHeU5hSlZWWUZJRlpEUlB2VVFHcS9uakVx?=
 =?utf-8?B?NHREVy8zamFqU2hVMWt4aHhxbXBJdUFnL3NQNEliOEdRUEtyN3A0YnhwVjEv?=
 =?utf-8?B?ZnVXaEwxdldCU0JsNWg4cC9JbUJjc2JaREFxS3ZKUThjRW9UOXBCVVdiUzJt?=
 =?utf-8?B?eWpmNnJjUDNobXNDckZUUU41NFhIUGxLZGppV2lPUW5yQWZ0QWxzTFVocUZD?=
 =?utf-8?B?eGw2YWhJcGdWRStQNS9tNzhyOHNxaTZIZ090YWkxM21mNFFlMXAxemZYVnI3?=
 =?utf-8?B?S3pDeHVjOE02Q21Zdm9YNU9lekRaWjRLV1hlMXdJaUVoOFJDektOVEpFVGJ5?=
 =?utf-8?B?MVpJYXhKNm9OQzUzRTMxWDg5R0xvSW0yZmJMLzlTWjlld3BRSzV5ZGczUERG?=
 =?utf-8?B?UmVRWFd6NTI3ZVZJdTdzUDlXcFRnNndEVllBWWJsZGxlRkNxdjBSdDRUMU84?=
 =?utf-8?B?NFA0VFhVbHhWUkxMTGVvclJENm0wbDBhSnhNbHNHL1FJVlNMUUtzYkJLaDl2?=
 =?utf-8?B?R1BQNnc3cm1DTTR4QWcxQThJUkNtZjdsZlN5QWJQOThPc2FqN1Vxc0dpN0dz?=
 =?utf-8?B?Ynp0dlhLOUNKcHNtdU1MUCtKbS93R283dDJ5aFd3aWZGVm5yMXIvSEFEeHNY?=
 =?utf-8?B?K2YvM2p2UFBBK3REcHZCU1ZGVHd0OTV2Q2d6dU0rdmtmaTF0em5SaGxlMFhH?=
 =?utf-8?B?Q3crRlhuNkI3blFQdkxDbjlNbXFicXdnaVM5cDhrNXl3VWs5RjhPQ25Gd1pK?=
 =?utf-8?Q?z1xE9CXkNGhZyOGNXt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732f4ebb-46f6-4d2c-74c1-08de5dfa7f59
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:19:19.4292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/2Nbo9157krWE3WU0sh54UxPKnb12IuahqjVTO0izYvrdnEWCgWmSCsvOfZH+GdKbP3i+88D36bGnnGhtZ1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

--------------Iy5IXynL9qPNm5YOTvejeBmx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/27/2026 13:51, Jia Yao wrote:
> The pat-index-madvise-pat-idx-uc-single-vma subtest was intermittently
> failing with 'Timer expired' error when waiting for user fence.
>
> Root cause:
> When the PAT index is set to UC (Uncached), the batch buffer written
> by CPU may not be visible to GPU due to CPU cache not being flushed
> to memory. The GPU would then read stale or corrupted batch commands,
> causing the execution to hang and the user fence to never be signaled.
>
> Fix:
> - Use igt_clflush_range() to explicitly flush the batch buffer from
>    CPU cache to memory before GPU execution
> - Initialize clflush support in igt_fixture with igt_setup_clflush()
>
> This ensures that when using UC PAT index, the GPU can read the
> correct batch buffer data from memory.
>
> jira reference: VLK-84224
>
> Cc: Alex Zuo<alex.zuo@intel.com>
> Cc: Shuicheng Lin<shuicheng.lin@intel.com>
> Cc: Xin Wang<x.wang@intel.com>
> Signed-off-by: Jia Yao<jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 412ad0384..49233a65b 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1692,6 +1692,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			prefetch_ns += (end - start);
>   		}
>   
> +		if (pat_value == intel_get_pat_idx_uc ||
> +			pat_value == intel_get_pat_idx_uc_comp)
> +			igt_clflush_range(data[idx].batch, sizeof(data[idx].batch));
> +
>   		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
>   			addr + (char *)&data[idx].exec_sync - (char *)data;
>   
> @@ -2433,6 +2437,7 @@ int igt_main()
>   		xe = xe_device_get(fd);
>   		va_bits = xe->va_bits;
>   		open_sync_file();
> +		igt_setup_clflush();

igt_setup_clflush() is not required for other test cases, I suggest to only add the
clflush check before the pat-index-madvise-pat-idx-uc-* tests.
  
diff --git a/tests/intel/xe_exec_system_allocator.c 
b/tests/intel/xe_exec_system_allocator.c

index 20282fe8a..43f1ed47e 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2604,6 +2604,10 @@ int igt_main()
                              !xe_has_vram(fd)) {
                                 igt_skip("Skipping compression-related 
PAT index\n");
                         }
+                       if (strstr(s->name, "madvise-pat-idx-uc-")) {
+                               igt_require_f(igt_setup_clflush(),
+                                             "CLFLUSH support required 
for UC PAT index test\n");
+                       }
                         xe_for_each_engine(fd, hwe)
                                 test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, 
NULL, NULL, s->flags, s->fn);
                 }
>   	}
>   
>   	for (const struct section *s = sections; s->name; s++) {
--------------Iy5IXynL9qPNm5YOTvejeBmx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/2026 13:51, Jia Yao wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260127215102.19951-1-jia.yao@intel.com">
      <pre wrap="" class="moz-quote-pre">The pat-index-madvise-pat-idx-uc-single-vma subtest was intermittently
failing with 'Timer expired' error when waiting for user fence.

Root cause:
When the PAT index is set to UC (Uncached), the batch buffer written
by CPU may not be visible to GPU due to CPU cache not being flushed
to memory. The GPU would then read stale or corrupted batch commands,
causing the execution to hang and the user fence to never be signaled.

Fix:
- Use igt_clflush_range() to explicitly flush the batch buffer from
  CPU cache to memory before GPU execution
- Initialize clflush support in igt_fixture with igt_setup_clflush()

This ensures that when using UC PAT index, the GPU can read the
correct batch buffer data from memory.

jira reference: VLK-84224

Cc: Alex Zuo <a class="moz-txt-link-rfc2396E" href="mailto:alex.zuo@intel.com">&lt;alex.zuo@intel.com&gt;</a>
Cc: Shuicheng Lin <a class="moz-txt-link-rfc2396E" href="mailto:shuicheng.lin@intel.com">&lt;shuicheng.lin@intel.com&gt;</a>
Cc: Xin Wang <a class="moz-txt-link-rfc2396E" href="mailto:x.wang@intel.com">&lt;x.wang@intel.com&gt;</a>
Signed-off-by: Jia Yao <a class="moz-txt-link-rfc2396E" href="mailto:jia.yao@intel.com">&lt;jia.yao@intel.com&gt;</a>
---
 tests/intel/xe_exec_system_allocator.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..49233a65b 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1692,6 +1692,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			prefetch_ns += (end - start);
 		}
 
+		if (pat_value == intel_get_pat_idx_uc ||
+			pat_value == intel_get_pat_idx_uc_comp)
+			igt_clflush_range(data[idx].batch, sizeof(data[idx].batch));
+
 		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
 			addr + (char *)&amp;data[idx].exec_sync - (char *)data;
 
@@ -2433,6 +2437,7 @@ int igt_main()
 		xe = xe_device_get(fd);
 		va_bits = xe-&gt;va_bits;
 		open_sync_file();
+		igt_setup_clflush();</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">igt_setup_clflush() is not required for other test cases, I suggest to only add the 
clflush check before the pat-index-madvise-pat-idx-uc-* tests.
 
<span style="white-space: normal">diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c</span></pre>
    <font face="monospace">index 20282fe8a..43f1ed47e 100644<br>
      --- a/tests/intel/xe_exec_system_allocator.c<br>
      +++ b/tests/intel/xe_exec_system_allocator.c<br>
      @@ -2604,6 +2604,10 @@ int igt_main()<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!xe_has_vram(fd)) {<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_skip(&quot;Skipping
      compression-related PAT index\n&quot;);<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (strstr(s-&gt;name,
      &quot;madvise-pat-idx-uc-&quot;)) {<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;igt_require_f(igt_setup_clflush(),<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;CLFLUSH support
      required for UC PAT index test\n&quot;);<br>
      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xe_for_each_engine(fd, hwe)<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_exec(fd, hwe, 1, 1, SZ_4M, 0,
      0, NULL, NULL, s-&gt;flags, s-&gt;fn);<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</font>
    <blockquote type="cite" cite="mid:20260127215102.19951-1-jia.yao@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 
 	for (const struct section *s = sections; s-&gt;name; s++) {
</pre>
    </blockquote>
  </body>
</html>

--------------Iy5IXynL9qPNm5YOTvejeBmx--
