Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D808D44171
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 09:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DD410E3D2;
	Wed, 20 Nov 2024 09:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5NybokD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155610E6E0;
 Wed, 20 Nov 2024 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732096737; x=1763632737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cxsospL2vE93sIMNc+YrydPTvVkblEaa4eslRpbNgdA=;
 b=i5NybokDbzi2Aa1LK3qAIoPcBi1rIdxV0LacFjURzCgiHVezj26ZB8/S
 WU5ozlmLp6uzLMyxKrJNpzg8pcb/xdIIJ5WlYv2Zz2kdjOY2SJtSFxYQR
 LuZrfNDC5N3uuVl0xLRmVZ78uqknZwa4ZIayFphJT8zkK40yL2T5Snww9
 Fllk7ifstK+ZCekzMnxmfQbZtmgbCZgGBsZUg6i28UvxItMsDhj25+SBj
 4JIguW5ZhQDf7MbapFX5DYGVZC6Y5huzixTgEJMw6mrT0J5ZMZTpZWCMW
 tya/kXFqCaUImrWWMgyCkw1qX33t5hH55ThmqN2Ctrhq50bwgE5eJIXXl Q==;
X-CSE-ConnectionGUID: uWs5bL10T6KmqGGRIlxJXQ==
X-CSE-MsgGUID: E0RrzmSFSROH+rC/pUVn7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31543094"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="31543094"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 01:58:57 -0800
X-CSE-ConnectionGUID: Bz5r0glhQRqO9fNn2dteCw==
X-CSE-MsgGUID: EUAqiuXwR46tWBqiEiy4VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94680752"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 01:58:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 01:58:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 01:58:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 01:58:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGc07ugeD3gIkffNBuClAKB31YPeuIl0UbG7QuG92L7EClpRme5evA3QZe8XwkEBB6qzdToCW4DlMv8q5ujUJx8OgRf8/vS6gDm2LAeX863Dk7gBPmRT2P3eBq9h5qiMVCGN4obdNIRKEh/k78MGCV8a4ZD5wHS32NWLSex7GckuSJsUVqldRAryD/G/RRz3QuEz8H6n8JfB5VgF8j3ftEbkUcMYgaf+9D0P4/3KRCf++lIu9fRNFBbYG8DaVD2dWRaSXqp9fTYTliidQwnpOWjPfOd8Kpg1CoGamoCc7qpHNp8d+tW1VXD6POMKGAlBaYrwhU/DKQ05KS0QtJMmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV5t9Y2CxcYN8ashvzZvHwvxLdvXsoV9qf6JVRjSzCk=;
 b=FPQ/nN8tFcFxFhGGMf+NeULtCDP59k7pH6SV1acvdFXSVfW2fY5Msrf9VhGN/Hz1t4rNSnXTexVp4CKoRjcVvpa8VgclKeLA/VoD0VVZYzla/XxE/mhlZsWPDdyH6B6aHMEgazT7Aief+MrkP2Zdj5bblgh/Wl0sGtHFtR7FaI3Gfq5VK4Zneju86VEUT3SFD1vO6/W+Y8/p9dBdo9F9mu+akKElthK8txUujWG0VweZd5BXvpR2o4J43sm355a0nW+YgHkmfenEoJHVpRWmyGsTgFzt2/Kn3xgkFeZJHebB/uPtS3OBCNaWfkiIIAMnB/dRteU/oaMzDQXa2j5TvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by BL4PR11MB8823.namprd11.prod.outlook.com (2603:10b6:208:5a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 09:58:53 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 09:58:53 +0000
Date: Wed, 20 Nov 2024 10:58:48 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fgem=5Fctx=5Fpersistence?= =?utf-8?Q?=3A?= Wait for context
 termination (rev3)
Message-ID: <avvxtmqw2lygd5babrr33auorrt5czma2ljb7xhd4abpxalkpx@read3ouxl6so>
References: <20241118121657.10624-2-krzysztof.niemiec@intel.com>
 <173201914539.308878.18382774776580887963@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173201914539.308878.18382774776580887963@b555e5b46a47>
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|BL4PR11MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1629ac-8fbd-4abf-d151-08dd0949f0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THM4bVI1ekNXUHY3aHBXRWlacUhZQ1p1VUJxRFFRaWt6M3JVZ09OSXRHT1NM?=
 =?utf-8?B?Qk1Yc3Arc1MrMFBmQ2ZmVERmT3YyNGJqbWhNcjB1OHlEeHRtWUcyUmZpcDJV?=
 =?utf-8?B?dTRlV0NkTE5PNEhOeEVZYXFuWVFiTnBVQzFFUFAwVDAwR1JBcUFJTlpYMGFK?=
 =?utf-8?B?ejgxZUZrYkpqZmF3TGdDSVZ6YldlK2xmTDBLaUtjdEtRUG52ZHBtNi9DbE9Z?=
 =?utf-8?B?UjlEU01RTVpxNXZXdk40RjhqeVBzZHIzZ2tHNnlaRzRTR2VhMnFFd1NjeG5i?=
 =?utf-8?B?V2xmVnc1RytNZWVmTFpUQjlzZVF3UTVUalhvKzBVdmtyeG5hN3N5aTg3cnZU?=
 =?utf-8?B?dTNMUTVzM1lrVlVvUFBuRjI1WnJCaVJ0cmM0M0xnSVVDRlJQR1VvelUwN3cz?=
 =?utf-8?B?NHk3VTNLbEJOamhZalpXc1B0cXZybHBLUDE4RHR6czB2bVdNY3RGY2JaYkx3?=
 =?utf-8?B?UzBkUjJkdGlFVVgydFJYYTRjZjdpZnBHMGZnS0RFdTZ0eFpsRmZZanp4TDIv?=
 =?utf-8?B?ajErMzNOMXk5WDlSYWxaWFJsWEQvMFNTSjUvV0lSOHIwZThWUE43WFZnKzNX?=
 =?utf-8?B?TEdRVFBOTThiVmRNREFnUTNIWEJPZzkyYUVVemtEeW5FU2FId3JJRm55cGJN?=
 =?utf-8?B?eExMK1hpWnJ0dXdFbFhyNU9pNFNseFM2cTF2ZXVMM0ZrdFlTbWRMdk5UV1NX?=
 =?utf-8?B?ZHlkaUZ4bnphcUVBNEUvckxkdHNxVXc3bVE0Snh3OHZIeUFRZWV2bzlZcDlr?=
 =?utf-8?B?RVc4SWRBQTBPYjg0eGxNR2V1eElCTy9VU3RwazFtTCt6NkNiaDFIMW4wUkR3?=
 =?utf-8?B?QkhwQTB4Q0hiQ2cvOTI1cE5YRGtTTXRHNlhzaDB5WGxPdzh4K295Rmk3dXhI?=
 =?utf-8?B?ZWVLYjEzZ292ZGI1VFdhNTltWWFuU1RIalF4SHNQUnBWMmZHSXBQRHljL3F2?=
 =?utf-8?B?dGNrYlFBQzl2NUNJTHFwVzZmSHA0VnFzNzI5ZzFTbnEwdkNDL1FNSUNPc0JV?=
 =?utf-8?B?RDVESUpvaFZXRTlGMGRraEZHdUJRRGt0Vmd6SEhhQStVWWVXNlJnSEN5Ujdt?=
 =?utf-8?B?QmNzL1ZUdk00TlNaZldGSlVtN0RwR2w0cmFBOXF3UnJoK0x4Z2hvcC90M0Rs?=
 =?utf-8?B?UWV2T3ZtSmlBVmltZVJvbXp0VmJJNjRaUUxMU21mRnczUDhIMUQ2Vk1qblJ2?=
 =?utf-8?B?Yk1wNGsrdVNLcFhzMTdsV1JSKzRTb2U5b09zcWF5MVlTbFM0aGFtb3hGUmY4?=
 =?utf-8?B?UnM5eXlZS3JrdXFmR05HQ3BhRGJqa3FLNkhUbXQ5ajBaRW9JVGtjTm1zNldF?=
 =?utf-8?B?RlViTEgxTUhMM0Nhb1dMUm5xR05hWGxBQkxwYkdDUDlTMzd4dXlHaFZuSjVY?=
 =?utf-8?B?aTM3aGtlUnlkR2pMWWFmUE9aR0dRQWd3VkZ1ZzhCb0NQcUJjQi9Ick01dFlG?=
 =?utf-8?B?aXo2bTRrQlVscXY2VE5sWEwzTjJyeStOeFUwR0s4RkEzT2xtdGhKMk8ybTBp?=
 =?utf-8?B?WVFOS2d3VTZSbkpqL0VHRS9adTRUVDhwYjFjbUw4cFBzMmpEU0diS0YxWm5k?=
 =?utf-8?B?ZE9XNjdyZzIvSVRyWTBrdEVPeEVFUjc3dnovVlVPL3NTenlqdXhuZkpNb2sy?=
 =?utf-8?B?T1U5YUkrbDdUU0xTSlhsVi9lR2lFL29kVGk5UlBlSFhBQUpZQTdkOEdQcmY5?=
 =?utf-8?Q?H8lxcP59iMaGGjgRixvG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2UwT3E0cXhORFdKVzZ6bHlwYUVCTS8wem5hdlZrck42MmNsYzdEa0h4UlI4?=
 =?utf-8?B?TGhCZzBTQUJFMXZzS3R0T0gxTDVLaTExWVJMV2ZubFFhbmFFOENaV1Vyd3dU?=
 =?utf-8?B?MEw4b0pBSTlueTFqMXhCWXo0UmIyem9YejV5anNtSndGUkgrQlZZVG1OK0VE?=
 =?utf-8?B?ZlVud0F3MnVvSXJpNDNaMGFTblRoRCtxT0kxMlU0UGpwMDhuRWFNdmNMVGZX?=
 =?utf-8?B?bHpsY1M2Qzk2NHZXR29KZkNXQXRnaER6c0JoeFhNWWtHZVBUU1FxMEUyTmQ1?=
 =?utf-8?B?MWp2Y0V6VlBoeGIwaC9RLzdRVEJEZ2p3b0FXWkhzc1hkc01WLytac3pDeEhH?=
 =?utf-8?B?emJRc3Q4MFZqbGdyWmFuNjArTVpyeml3RTUzbU4vUTgvdzZIMTZLS0p6M255?=
 =?utf-8?B?QXhPMTdEc1hRWGhDUzhyUXlTTWxlRmN6YnBLcVkzcUtqc1AyVkF1cTlGNVZD?=
 =?utf-8?B?RVVCSXNtWDJLQUpwK2VRNUVXVVg4Si9qK0h5WW92L1dmdWNxWDY5YUovUkc5?=
 =?utf-8?B?d1E0ajkvUFdkWGROUEdSeC9sSFhNR0hlSXpXK0k5eVE0V1Z3V3dIMDFGUVhh?=
 =?utf-8?B?QnEzVWcyMW1IY1NoMFlOWDhBdW43NjVFcGpiOFhjaEtVdjc4ZTA1bThCQjVw?=
 =?utf-8?B?bEMrMmxTVkF2VlNCRlNGRFJtcmp6TWI2dmxBanpMMFVmbjBXTWlUNDJTM2NS?=
 =?utf-8?B?ZVo0SFA3VWlTT2phV0NreDY1Q1lWdFBGOHVlc2ptQ3JnWEY5Lys4K05oNy9w?=
 =?utf-8?B?ZGVwN2pad0xIZW95eFlJeHlXNUVNSkc1Y2w1VmdjOU9zMm5FeXZKUkVRRkp4?=
 =?utf-8?B?L2p4enVRTnFXalRZSTVoWnZYMnVPQ216OUZRLzIzcERNZkhwc0M1b2dDc3gv?=
 =?utf-8?B?MVJkdFZLSW4vNzNHRnk3YUhGQjRsT25zRko2UVFSakVkSS9jSkZzamJqdUVL?=
 =?utf-8?B?c2dqS29sUmpNV1dsaSt3ZWtCdG1vSWJJQmFjVU0ra1BpT3A2Q0IrVG9pTjNp?=
 =?utf-8?B?ajh1TElNVnhXVTBCN0tVNTg0Q2JYbzFUakprNlhyR0ViNmJZSGJlc3JRU21o?=
 =?utf-8?B?cWRhbDNHblFIR2FpQ0RDYlhJTEszU25taVovTUo3SDN0bWlrMXplTjVHTDh2?=
 =?utf-8?B?K3JFL2ozdkRYaVJabTdtSERlZVN3NWN3dG1lNmovU3plRGczd1g3dXpnd05N?=
 =?utf-8?B?TENDV3R0VllFNkprWkNXcjBLNmVrd0xDR1hrZ2lWeml4Tnc3RlVSTVNrWkc4?=
 =?utf-8?B?UmNCdGcrM24vYkUvOEtoSjJvYkNTT3N4aHczL0RTRVBXNW1VZHM1T1lCTnNX?=
 =?utf-8?B?ODlwSmtUKyt2MWFxZ0NaZW0vaWJJdWR3MDhIN1FQem5ZR0MxV3g3WHViRTdM?=
 =?utf-8?B?VHF3aXQ3MS8yU005TVZMWSt5VGhFTWt6M3ZOZGtqRDljR2ttblhuK2FBZjdY?=
 =?utf-8?B?T0dSejJwOTBCRWt6dEd5Y3Nqd1lPYzFRTm1DRTczQ1dvTHVsRndXdE9XUm5n?=
 =?utf-8?B?SVpoc3hvSGM3T294bHgrSFJQczNOSW5pY3h5anRYWitEa1BvdnBOaTZZN0lJ?=
 =?utf-8?B?S1Y3OE1KQVVzemNBa1dOTDNnYm5XZXdWUGN3YnJFWUxFMDdWTWZxd2dQVGU1?=
 =?utf-8?B?OU0wQkg2OTYybitTemNCRE9GMWhmQkVuMWhuZ1pJODQrSGtJZCt6ejk5K0N0?=
 =?utf-8?B?YXUwbG5yTE80SW5Ld1puN3R0ZytVc2IvTHUrK05ObWwxclMzeFpFVWxKODZJ?=
 =?utf-8?B?U3p3OWh1ZzEwRXRvWlFLR3JwOE9vdUdJRVV5MmRSZEM4eE02RzdwM2NZc3g0?=
 =?utf-8?B?R1VUb0srZjJNL3JqT28xd0hUelVnNDJDNHFqcjlBN1JsL3RXNVQ1d0dTWnZ4?=
 =?utf-8?B?M3BNN3lYREVvK0RJTUIvR1ZhTWZhOXdXNWF6eFNqUEhOVHUrZmRyOXlGSUxx?=
 =?utf-8?B?bHdya3ptN3VhSlNrZGhxTElPemFKUi85bjArbTdKeW55SnRIZHV1bERiUnQ4?=
 =?utf-8?B?dFQvbStxTjVnczdTOFZob25HSUlpS1Z2QW1oODVnUFR2N085a1VuMnMzcml5?=
 =?utf-8?B?R1JBNEsyUzNMNGxJdEo0blU1UWdlR1NjWVZnTUN5VC81dE5hNmN3cERmZ2k4?=
 =?utf-8?B?aEVQQVZzUEQxekNRVlFvU2llQXVlNExmd3dWT05IVWFjWTNaWHJFMEtqU004?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1629ac-8fbd-4abf-d151-08dd0949f0b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 09:58:53.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7hDpp4tAK2x7CnTWiRhnZoudnMSciU8Ty0/n56E26xppsoGS73AvsaPnN5CqtfMBAnsUGdUmgHVc+jPs7Uq/+tvVGeiIBiB8QW/H9TF/Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8823
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

On 2024-11-19 at 12:25:45 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev3)
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8115_full -> XEIGTPW_12126_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12126_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12126_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12126_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [PASS][2] -> [INCOMPLETE][3] +8 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge:
>     - shard-bmg:          [PASS][4] -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-right-edge.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge.html
> 
>   * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +12 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-6/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][7] -> [DMESG-FAIL][8] +15 other tests dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][9] -> [ABORT][10] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][11] +3 other tests dmesg-fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [PASS][12] -> [FAIL][13] +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-lnl-6/igt@kms_psr@psr2-suspend@edp-1.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-lnl-4/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] +4 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-464/igt@xe_evict@evict-threads-small-multi-vm.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-433/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_exec_compute_mode@once-userptr:
>     - shard-dg2-set2:     [PASS][16] -> [DMESG-FAIL][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-435/igt@xe_exec_compute_mode@once-userptr.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-435/igt@xe_exec_compute_mode@once-userptr.html
> 
>   * igt@xe_vm@large-userptr-split-misaligned-binds-67108864:
>     - shard-bmg:          [PASS][18] -> [DMESG-WARN][19] +76 other tests dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-8/igt@xe_vm@large-userptr-split-misaligned-binds-67108864.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#3442]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][22] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][23] +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-bmg:          [INCOMPLETE][24] ([Intel XE#1727]) -> [DMESG-WARN][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [FAIL][26] ([Intel XE#2333]) -> [DMESG-FAIL][27] +7 other tests dmesg-fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2-set2:     [SKIP][28] ([Intel XE#2446]) -> [ABORT][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-bmg:          [FAIL][30] ([Intel XE#2364]) -> [DMESG-FAIL][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-bmg:          [FAIL][32] ([Intel XE#2364]) -> [DMESG-WARN][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-bmg-2/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
>     - shard-dg2-set2:     [SKIP][34] ([Intel XE#1130]) -> [DMESG-WARN][35]
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/shard-dg2-466/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/shard-dg2-463/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
> 
>   

Unrelated, I didn't touch these tests at all.

Thanks
Krzysztof

> Known issues
> ------------

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8115 -> IGTPW_12126
>   * Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -> xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
>   IGTPW_12126: 12126
>   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4
>   xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12126/index.html
