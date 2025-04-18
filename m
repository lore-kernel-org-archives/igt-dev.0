Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F2C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 16:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCE210E232;
	Fri, 18 Apr 2025 16:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDIsHyxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436FC10E21D
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744995228; x=1776531228;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=toru5K4uq6wOva+u5AqHM9PXbvC1JxVtJCzBqddZQMU=;
 b=cDIsHyxlxmRihUidbs3tFMxK1k6F/rRO/FJxaq65BnQIBPUnysus6gt8
 J7D2u4ov4J7Itlk2aTpqGGAcGe1OKsIcw96f4zTtevYadSUlh4J/RSXdD
 +P0i+RA7laZoMeu33MOVHMG7STib8RCbxv7GYj4ttqHJl9NHrSgrrtMgC
 GA9s71HLRRdvAc2r8lx0e2Ex6RNtJcnHHK4V0Bp2w6Son2eavJh44/anP
 bVATFqrF2PcdimzO8JcgBv/CpWUED9Za3R//UyySYPqiI5xpsjZ3F0wiq
 tO0GddBZMVbQmnPdkQSUAjuPE5mNLuTA2Zw+Fd7CdUIYK/ZraRZxKNHmE w==;
X-CSE-ConnectionGUID: njlIQKj/Q0GK8oVfBDTwSg==
X-CSE-MsgGUID: romf3D4HQ7e7fZkBpal+Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57990610"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="57990610"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:53:47 -0700
X-CSE-ConnectionGUID: 7/4VkwdjR/ariZC48nWH1w==
X-CSE-MsgGUID: zN82NPrvSeGGaLH/cGRiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="132049902"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 09:53:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 09:53:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 09:53:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 09:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWjGB+uaxvAyhYoAfW5iievJrO+Wut18Qdzz1z2Lx5LTM2nRwy9SOlAQXQ+laXa12qPPU6YRtxDvzRZ0kM+vQCxJefaADFIXnYOJAWlkwhDFC0PUurWgjjD82MOUi1gKqcXahV9a8NTRszyvESgIT6260v5b5Wn1SjhDEcRQtFHx/HTuNoZbWQkftwiRSwX5Z5CHuMOTKtpCrSwNY6NdOWZO3wRlOhlUvbQu8hD11jiHIas6IXr2esukPY4A3eXEGv8Mm6J4snqHk1CostQ34GENzEZSB97Oky2es1rEPvojfQkj42navSO/YR7BP4Xnb7e5bdUvJQypSylPdskB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clW2kRtYvMSsiBIw/71UO9xj2DH4au5ijIu66+2irgU=;
 b=jI441JKKqc2RwPu3Oe/EVERClgncCa6JIZLjNko0VNW73jZrle9SOSzDQKLtTUaVFtJ0b9JFdMr1ZdOvp76Kx2Nvai9XRF9MQxqokhuMM1H6/keKkOy1iWcE0y6JmQ090/wAAIpfuYkW73g3w0VtEy1moDYhwitBAv/GzpQXKQco0UB7h5dZyLZTlb2J5L+cyHu1b0JJRdWOdTAToVMJTgPMxqOjJ70gRKjEbHXMcShbHDCbPYYT1bTma3KXtIiYdZ37vnJMWgDPuwhRCJJPblPiSZy4wetiFgb/8KaNmA2nbSjWZnW/NbRQ+ds9IXgls0yuBERcEJGdOOOGKnXwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Fri, 18 Apr
 2025 16:53:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8606.033; Fri, 18 Apr 2025
 16:53:43 +0000
Message-ID: <1936bed7-a7cc-4483-a9d1-db9aefa515c7@intel.com>
Date: Fri, 18 Apr 2025 09:53:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pxp: Terminate PXP on exit
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
 <20250418145447.h4kpkferveojdrvx@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250418145447.h4kpkferveojdrvx@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0199.namprd05.prod.outlook.com
 (2603:10b6:a03:330::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: f4abf176-c5d7-4ac1-ccee-08dd7e9993f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk5ScnlIR0UyY1ZuaUxrcUxzeWtxdlZuZ0FIeHBIc2RMZ1dIdWpQQzU4VnIw?=
 =?utf-8?B?di83WkpMSjlINEYrYjZiMVM1OVRlYnBGeTRFZEx3blloZXI2VVAwNzZmckF1?=
 =?utf-8?B?b1MvdXgrWk1rN2dPRFpkVjZUaDIxSUgyS3F0S21aRWQrdTRuVWgwdTAyeWFp?=
 =?utf-8?B?SGl6eXA4S3FHMHUyaGZjbW94U1lwSnBSemI0Z0pBdUd0YjNnanVrWVV2LzRG?=
 =?utf-8?B?eHBxMkxSRkJrLzRrQ1J1QlVraURGUU9Rd3FFVkcyUkhNQ3VRNFhlcHV0QmxK?=
 =?utf-8?B?NjVhSHlESjc1T1RhTTJhK3NoQklETTBoRUk1NFc1azFZZjRxaHYyWmZkZk8x?=
 =?utf-8?B?ajBQTU9sQWMrSlNvcThiN1ovaW5jT1dwSnZEdHFZcHB2SUxmUTVwaXRSRVJs?=
 =?utf-8?B?N255M2ozUUZXdnhBQmd3SmdnZXE1NzlEVThvRE04NXZWcGYzY0VqY3RCWVJT?=
 =?utf-8?B?NTY3MCtvUWJtMWRRYklsS0NzRVNLZ2UrR1N1K3ZmbUVadWlvU1Jabzlza04y?=
 =?utf-8?B?My9iSGJRVFB3dVVnOTAxWVpQTzhIbU9tZ1g4ZVUzVndlc1FYZEExbUlldll1?=
 =?utf-8?B?YzJ3M2ZLc2lhdFZlQ0l0RWdKNWFMLzVOdGhmTTFuWXVicGFBaUZINUpBcHRM?=
 =?utf-8?B?bXFHZThjbXpLbmVHU0NUc1pPZGlQZHlkb1d4aEIvd3pXRXNoSEpxdDZOMHpn?=
 =?utf-8?B?VE9VUFhmdzdac2lvQ3BpajJnRUh0M3ZsdjNkZXNqUHB0QktLRHJJN2wxL2J5?=
 =?utf-8?B?R3ByZ0VFZlR1ZzFFd1FSQ1ZvTEorZTJ5TkZlMmpLTDBsVjZjTWt1d3lzQnZp?=
 =?utf-8?B?OTBvYVliK1BVUEtoblBpVlZBamlYaXJ3RzUzeWlzeUdNeTdJSXVKZTVlRnpm?=
 =?utf-8?B?UUtydmE5VTdCNGxRZ2J0Wjk3ZFZ2UlhZYjVCOEJNVGhCQmdrNVZmelo5VjNK?=
 =?utf-8?B?NkRyZFVXS3d2TFBSNVRWb3pnaVZqaHZFVzk1S1ZSSUF2YUZSQTM1RGRuMjAv?=
 =?utf-8?B?bHN3Q3lOMjhRMWlIalZReDRjVVZ3Q25hbTg1OGFMNE4rT3UrMVRXclIwNmFm?=
 =?utf-8?B?MVhvNWtNWVZmOHZPRnVrTG01bzBoUGNHNlJnVGNJQVFwQTlBUUtOVVM5Nito?=
 =?utf-8?B?UVhIV3Z2a2k5VUFYRFdhVmdKL1c1MVNxS3F1dE9kVkJmSHNyalBzNkJ4Y1BL?=
 =?utf-8?B?S3lmMmo1NmVCcmdYNE5FMDRKZnZQcVR3REZGY3JDWHBlK1I1d2d1NkxKdGcz?=
 =?utf-8?B?ZWluVVBxeEZGQXZTZi8wYUplWitQUldjZGFvOHk1V0RtVWZnZSt3UnUzdFRO?=
 =?utf-8?B?S2p1YUU3VmgwejhFbWphTTEzeU82SGNEcEE4bnBhYnA5NFNRd0tXMnplbGlV?=
 =?utf-8?B?SkRvb3dXbUV5QkRibHVLcDJScVNNcnczQzREYitJcnJYdTJoNkM4NmZSVFdG?=
 =?utf-8?B?c2tXUHYvNjQ1V01CelplVVl1L05PUmZCWkxyQldiS1RyN25rTFFhQUVJd0Zw?=
 =?utf-8?B?eEdRMHd1ekRETnpRU2h1UTRpVVl0U05MWXpnOXlJM1RVQTRBc1dhTXp5dTNP?=
 =?utf-8?B?YStVcnpHMjNTQ3RwSVNBNFJpZFdacEhYSjM4Nmxoai9WRERtNFQ2RXE0cUlv?=
 =?utf-8?B?Yk1RQllsVnkzbjh0c01NVXNNTUY0SUplWlNRMXNLMTQzb1Z6SndYNzZOWWFp?=
 =?utf-8?B?RXduK01EVjQ0WkdDQlk3WlRKNVlRTHg0cWpsL0ZPSlU0VmV2Sk94YjY1MWFx?=
 =?utf-8?B?VFdIZXU3NFVmUTg0Sitjc0FFOUNzS1FYQ2tacUl2UzhaQ0ZOSEdibEwvdWQz?=
 =?utf-8?B?dWtCbkdoT0pmQlJaYzZHYlp6RVJrRjFZbDFXWTdZaE81Mkt6MWIzaGs3ZG9Y?=
 =?utf-8?B?a3J5dExKRUJLSEN5WXoxZmRjODlaV0VZazBMYzA0WmwvMWlpdXhMQ3ZvMWRM?=
 =?utf-8?Q?jMTRKs60HtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjFHdVVlenlRR282MmJidXhHOENpUzNRRDFaTEtDNVZCUVc3QkcxeDFMbmE4?=
 =?utf-8?B?VE5mMVJURjFIbFZxM0ltWjRsVzJJUGROVmRqbmhHMW9oOFl5VlloOEd4ZUkz?=
 =?utf-8?B?WTZUTG5iaGk3a2laSXNoZVhtYzI4S2NGc2EvbCt1amFhUU1VbUk1ZVA1TThN?=
 =?utf-8?B?MzRWUSttemhKYUZwbzFIRngweFA2YmZPbzJNRGowNWxjZGVwSC9yNlVyNTlm?=
 =?utf-8?B?QTNsYXUxb1VrTkdyR0laOFhLSnA0RFBOaW5uc2tCcjNBdFFVZXF3ODhCTTZ5?=
 =?utf-8?B?M2FocklpTlpQWmQ0ODZQelN1SHFZOWdBU2o1Y2hnaURlME1wRUFwVTZRcGRx?=
 =?utf-8?B?eDh2QzRZa0JXR2VMQkl5cENlcFVoaWlrQkdhNTJHbXVycG9JUjZuYmNZcTI1?=
 =?utf-8?B?bTg2TTBBSm5yTjVwR1RsbHdvWTV0cXBWY3VVVTV3NmJVQURwdWpscVhLVnI2?=
 =?utf-8?B?eWpGM0pFZlRCZ3NTZ0dFNm94bGgvcitBVHc4YkgwMVNoVklkSG5mNUwvTkNI?=
 =?utf-8?B?OVI3RVlncE9leXNhZU9MQlAxQjRoNnIzVjNNekRzZUhOdUlZRUo4RnhiVENy?=
 =?utf-8?B?RURrUFdPMDRzbjhVclp1MmJEOFJFZi9LbHErdUpuZDR3NjJVQ1czS3g3WnlP?=
 =?utf-8?B?ZGRoKys3dk1TOW9DeEhEeUJ2T3h4NURiTmw0UVFCQUJzUmEvM3R1TlBuUU8v?=
 =?utf-8?B?ZkZrZzZwMGJlZHBBMUFCV1Q5L0IxMW5jV1RiQTJNQ0NwNUdmWUdtUHVzQmsw?=
 =?utf-8?B?THovbGkzK0tsTjMrUU1wMkV4WG11eDVGR0FCZmlJMUpLanJKcTNINkpwOXJ6?=
 =?utf-8?B?ZTV5Umk4TVVyUmg4di9aMkptUW9wQXphNkFFUlJwRjFlS25yNnBoWHN5VEpI?=
 =?utf-8?B?ZHE0aElVbWpWTWkvYzJCN0prRUwzZ3BYZDY5aVlqZXdKZFIrc1pXVDZXOUN3?=
 =?utf-8?B?cFVSeWo5RUFHbnN5SXR1eTVTdlNEaHVMcHEzeG1WVUZNV3ZtQmhKcVlxTTd4?=
 =?utf-8?B?YUlNSTZLeTJRckV0eXNNYzI2QzZwektHM3h0NjdUU0hkQ1UxdDZXaUR6eC9X?=
 =?utf-8?B?QUlTM1BGTnU5YUx5ZFEzY0RqUUtJN1VoUTNtZzhYV2ordDdqd1FjMlhrU0tw?=
 =?utf-8?B?YlNDOWdoWklreVJlUWl1NWx5UTZsNVcyd2YybFkvL1BqeHJRQlpBZGxPbDMx?=
 =?utf-8?B?RXNrTlBBelRmQ2dnSUpvcWVTak9vUVBmeE1iY1JWRmxNTVdJejBIWjJHVVdt?=
 =?utf-8?B?ZjMvMWVkUjlibTI4MnhScEROZGxSMFZWZitJbyt4NlhvU05GTC9Gb1grVS9m?=
 =?utf-8?B?WUUvSyt0ak9MU2txUklBbXdjMW4yMTRaWnljQWwvamNsR2I2M2FRRmxOKzNq?=
 =?utf-8?B?SU0xVUdjdTVFdFgyVnVQMHBqTEd4aWZTTUhFbVNRUHMyZzArd1J2MEhWQUFq?=
 =?utf-8?B?M2laTUtWY3NaOTdKNEE3Z3JhcEtJT3lCamFkYTJRUVVXeUx4aWtUV0pNOXBr?=
 =?utf-8?B?MUwyeFBOR3lGdEx6SVovZkZwQXJCenVPWDZ3ajRDdmd1b0xTdXYvd3pYd3Bs?=
 =?utf-8?B?bmQ3b1RmU0ViQ1ZxNjJQYk8yOEJpaFRyMVBYd0VFRFdlR3RnK1VzWmZKVC94?=
 =?utf-8?B?dmhKMldKeGlzVElNdm9yalVxNlpsbGQ5OUROWldCbk13SHVhMGtKNDNsZUFi?=
 =?utf-8?B?Tlc4RGdhblBORUl3NVpVUlJJV1NmOGZrdlF5R0oyZmM2aSs1Z00zOVVUM3Fm?=
 =?utf-8?B?ZnM1RFM1M3AzcnRzN0RiSVMzQkJsSkFBTVpnZWltbVJKMXRTS0RVZ2kzeVpp?=
 =?utf-8?B?U1RUaDBlL3l1YURqMTNqcnU1Vldqc0RUQVFxc3Z3RGdUd2RrVUIrQlkyelIw?=
 =?utf-8?B?MWxmK0swejA0QWRxOS9ZTi9VNFRUTmx0VVhxUlRGdmw0N3F2cTUrdEQwOUsz?=
 =?utf-8?B?Zm1Bc2p5anhCY1A0SkFwYTdNS3dnd2tXN2ZpQzJ4UWt3RENEcE9ybkN1b25q?=
 =?utf-8?B?VklxTXpMeEpuOGNGOFFZU0FpaTU5U3YrMFdLR3FYWlUxaUhnV1p4Q2J3L3hO?=
 =?utf-8?B?ZlpKcU4vdGNUWTgrQUc1OWQzL25PTG43MzZLUHkxVERpbzFDbTRZVVFsbi81?=
 =?utf-8?B?TXI0c2V2NVlPSUI5RkNuNGhpUmlCaDgxWWFPV1Jka2pONHpkYmdhd3BWemdZ?=
 =?utf-8?Q?ncAYMJFKT/VyBchs8kO8dVk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4abf176-c5d7-4ac1-ccee-08dd7e9993f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 16:53:43.5656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ulxk/Agl+8aoGULISItwQzZam7H58HRjer+CAtEXSFgaNfGk/8Vbb2QP+f24i1mkkXKR6/IWou21N/7DnEGTowQGkZR1NERElbFBPePsjZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 4/18/2025 7:54 AM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2025-04-17 at 16:57:19 -0700, Daniele Ceraolo Spurio wrote:
>> Most of out tests expect to start their execution from a clean GPU state.
>> However, the PXP tests currently leave a PXP session running when they
>> complete, so follow up tests will not have a clean starting state; given
>> that PXP can impact the timing of some operations (e.g. suspend/resume),
> What kind of problems could occur? Is it longer wakeup or refusing
> to enter sleep?

PXP can delay the suspend flow or, in some unlikely error cases, cause 
the driver to abort the suspend attempt. AFAIU it can also delay 
idleness for the media GT.

>
>> this could pollute the results of those tests. Therefore, let's make
>> sure that PXP is de-activated before we exit.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   tests/intel/xe_pxp.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
>> index 458d32322..3442396b2 100644
>> --- a/tests/intel/xe_pxp.c
>> +++ b/tests/intel/xe_pxp.c
>> @@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
>>   		}
>>   }
>>   
>> +int xe_fd = -1;
>> +
>> +static void exit_handler(int sig)
>> +{
>> +	/*
>> +	 * PXP can interact with some operations (e.g. suspend/resume), which
>> +	 * could impact the behavior of other tests if they unknowingly start
>> +	 * when PXP is already active. Therefore, let's make sure PXP is
>> +	 * de-activated before we exit.
>> +	 */
>> +	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
>> +	drm_close_driver(xe_fd);
>> +	usleep(50 * 1000); /* give time for the termination to be processed */
>> +}
>> +
>>   igt_main
>>   {
>> -	int xe_fd = -1;
>>   	bool pxp_supported = true;
>>   	drmModeResPtr res;
>>   
>> @@ -1151,6 +1165,7 @@ igt_main
>>   		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
>>   		pxp_supported = is_pxp_hw_supported(xe_fd);
>>   		res = drmModeGetResources(xe_fd);
>> +		igt_install_exit_handler(exit_handler);
>>   	}
>>   
>>   	igt_subtest_group {
>> @@ -1213,8 +1228,6 @@ igt_main
>>   		}
>>   	}
>>   
>> -	igt_fixture {
>> +	igt_fixture
>>   		drmModeFreeResources(res);
>> -		close(xe_fd);
> Looks like you are fixing a bug here, it should be
> drm_close_driver(xe_fd);
>
> LGTM,
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks!

Daniele

>
>
>> -	}
>>   }
>> -- 
>> 2.43.0
>>

