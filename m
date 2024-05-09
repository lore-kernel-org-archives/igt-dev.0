Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB0C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 14:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785310EB27;
	Thu,  9 May 2024 14:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bqrd2XpS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C2410EB27
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715264843; x=1746800843;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hjjQWcnt8cVxMmLjRY+cndlFwXiRm1lndLkVEHeNoY0=;
 b=Bqrd2XpS/OY+rUm+UDNEn2hQG/qk19nuNpLZrRAsN2qHWkvj/vyP95c9
 4vub1LY/3g0kQj52gadG/rhBwgHAPQ9uQZPJjVOpm2g+VjE5CZv3OOqgl
 4gn2Hhgq5zkvIX5eV5E1Mu/Y68dWhgyQsa1KMZabcHj0lySZOZfQUxesV
 E2N7yujJc6iqIaGFXUk8mPJ+HBc0CGT6Bl6tW+oDCto2x08TGTwrMKErT
 N1+DsrKzY89H96QHjQbFXov719hpsPF2r31I4CtMISpy9bA4R40fLSFIC
 LlGiUT2ZVdoLPrPo7O/o7PzftXsPpfWHdwmUSyaN3aBEzyZfuZQ3O/4T9 A==;
X-CSE-ConnectionGUID: tAXxUeLCSv6jkvoHA2KxIw==
X-CSE-MsgGUID: sxDt583pR9ijIF4lFmDang==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11317106"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11317106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:27:23 -0700
X-CSE-ConnectionGUID: BRed1vRtQJ65nD1MnUan4A==
X-CSE-MsgGUID: +lwHmSV4SFGJ5iPAVtWkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33931450"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 07:27:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 07:27:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 07:27:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 07:27:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 07:27:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBaqcykLX6HM0R5fxeD8jGayUJ8QTetCu44VWkNsFeMWEPJH5PN9Lf4Z4/oFV94tgdOJgjgM07CAeVGBMrX/Vo0H9+6ajh8q1h+sT9tvtmlfGkWSQXI2b+Y2YDQ8wiSgS1YkoXXzLWj90Fk90v/MncLLW90bpChYe9+zKwRK6UmGRGlesGjnQ2nU932cbsuwgcUe/DZ26cjHwGwktQk7pIyFH0dfbJrkgVFl27gHmlUZ5mOlg3G+JeWVGx8ITGm0ABq4ErA0jGPSlqUoeFPAIcn4PVivYfsntuFpflur/BH/NNrqmWXth9kTp7hl09/B1SJfkae77kFqxoccq60SYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjjQWcnt8cVxMmLjRY+cndlFwXiRm1lndLkVEHeNoY0=;
 b=drQOm3YXRHjRMAzkiiyeCE4TVIBrUeNw21p8FMbyp3IxdHmiqLtMMDqh9zN2sezDv1J/1fDCa/A/LteI0jjBkVaWQnAcTEVr775b4TjlyVfwyKIQdSjmqPe4cQOiPbYHIIVt2PxYNDtSzITXI6ZjWLfg/DR8ypCtbex8R7NcGBdjvhpmWBfOiiI5+nsxn1kMZA6LqluDHz2iQAsip3GJuxa/GGn8HsWN4wsmwLGx09Hu0nrxhEVWGMRceYDwyZaKcPX5VM3TAfIXTs3brktSeeP+28c20OvDTlptgbPrQvMM7Wb8eSETHMAqFPDv2poGL8LIEuO0Wt5HUNHrCxOtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 14:27:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 14:27:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Topic: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Index: AQHanZN24GaWUtUpZkKW//a6akHlCLGNjQ+AgAAB3/CAAAtwgIAAiruAgADSkwA=
Date: Thu, 9 May 2024 14:27:17 +0000
Message-ID: <CH0PR11MB54440B22368601E14F1AA6A7E5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
 <20240503193714.1967850-2-jonathan.cavitt@intel.com>
 <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB5444E8304D0EF667EB79DBC9E5E52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20240508171127.cjl3ty7vra5fsszj@kamilkon-DESK.igk.intel.com>
 <662f9756-b04d-462a-893a-8d0c4385c552@intel.com>
In-Reply-To: <662f9756-b04d-462a-893a-8d0c4385c552@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB7895:EE_
x-ms-office365-filtering-correlation-id: bddb095b-d992-493d-d798-08dc70342155
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|376005|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?cS9sNCtIUk9hT1FOa1dPcG1ZM3Y2MGlZQSt1RVVlcWR0VTRMOFRJNklsY2xD?=
 =?utf-8?B?RDkyWlU1ZUc4ekd5UHZIUHJYMURKUnFMckY2WFBnd292RkYwRHFzNnErZUJH?=
 =?utf-8?B?YXRxUmRuSndiVnI4S1hLY0d2eFRJTks4VlVwYkRYNFRBN2tIRndDbTVicEtN?=
 =?utf-8?B?OXFUbFFzKzFJcmFqcksxWmdaZW4vTVY1R2N5QWhsRW5BQlh6QVQ2R3A0M2Va?=
 =?utf-8?B?UmRPUTduNDJCRm0veWFyOGtGVVBlU1V2REtLT0k0WlRiN21uTnFiV0RpNUdk?=
 =?utf-8?B?VWRqYytTaGVpRDcweTN1TGcyVTNZQis2ZGJ3RDJtSEtxa2FrcE9Ic0RzNnEx?=
 =?utf-8?B?ZFl3VlVwTVM1bGloMmp3VG81LzRsMzNkbGdUaUd1K2R1Qzdlb1pEQmlMclFt?=
 =?utf-8?B?T2MwNFFQOWlOakRvMFBqYzRRaEJhNkpWU25LWkhDWStJcHB0ZjNmZEdYVTdr?=
 =?utf-8?B?WCs4SHhGMnVGR1NEWW1IcVk4TzZ2YWdrbGdOa211T0FpcGhwQ3N3TEZQYnl4?=
 =?utf-8?B?SlVCcUE5Ujl4cXRzeUJDall1d3I1RmxpcWNWY1VWMXpWaFlSUG56R00zeisr?=
 =?utf-8?B?bTRMU0FUSktYNDF1VFlkdzA2N004SVNvWFF0SzkzdGpZM204YTJqV0o0THdF?=
 =?utf-8?B?VVYycEIzcUQwVVE0OE5vUG50T2JzM2dnU3lheHhQT2pTOWpPZitCZ3drVVZC?=
 =?utf-8?B?RFNzaExrdUJuTnRrcTJ2VmhFdllVV0lXVWRtd016QXJ6U1ExN1Nwb0ZBOEp4?=
 =?utf-8?B?UXU4aVppajVmVjFuM25EQkg0dUxZbVpOYnV0RUx6NWtVUENBTjNNKzlRejRj?=
 =?utf-8?B?ZDJiQ2lNN1Z4cGlYK3ZPbFVNNU5TRnFHOGNFbThZM1lRN1FZdEdEbU9IcW1u?=
 =?utf-8?B?L2hLWG80aDZoSENiZDVGNnEvbWdFdFJjSUtId0JNZEVhRm52MG4reU5ncHhX?=
 =?utf-8?B?UmlUckRldUQ5TTJGNVF6eHZCQjZzY1FJRkExQzlvdmNWNmpidWl1VC9Db01n?=
 =?utf-8?B?M0xhdHFMdFdXYnBFK2Z1RnlmTGN2K1BmTkNYNUt6KzNaMWVuSW1UYlIycHFp?=
 =?utf-8?B?bjhJVGNBRDdaa1lHRjZJQjluT0dRMjE0b1FtcFlSMzg2V0ZTek1GWlh3TGlw?=
 =?utf-8?B?czd5NVlQSDBUU0dqTXp1eW1jaHpjMmYyeXVIWHVIdWtHTkxYWE5TS1djOTcr?=
 =?utf-8?B?MXE5WGV5SUZCVEhNcnhzMEdycUZqL3JLYU1sTzB2bHRUZ2d0TCsrOFgwNjBN?=
 =?utf-8?B?NXRjT3JWV0tBSERIS2NtbjRiQml2blpGUlAzYjhHY1hXeW5nYmFpMHoyQkY1?=
 =?utf-8?B?N3dSQjZBa1NjZ1ZENVZHZ0kxSXVZMWp2MTFoUUsvNVE0MUNBRzE1T2ZhQ1Rt?=
 =?utf-8?B?eFBUOEdmSVA0WHJaWUpGTEhKbTY2ZFJqV0tGeGhlWWkwQ1J0dkRLamFYMkYz?=
 =?utf-8?B?OEhzWUlZbmt3R2ZPSHJiRFR1Y0dQTHROdjlJWFdodXZoNFIwRkVibkhKL0VI?=
 =?utf-8?B?Tm1XaXh1N2phcWcwYy9XRnlLOFVMQ1ZJUmIrZ0FCQkxqTEd5VUhSamJGOFhP?=
 =?utf-8?B?TFh1MHQ0MXVURTdLUEdjcmxmdUpBV0hCRDhIeURzb2NMb2FmTEJBYkU3RTJ5?=
 =?utf-8?B?bVRRK29abHhscHArcHBrQUJwK2hQMFZCZzU0b0lzRE5LWEw3c0tjOVhSRXY2?=
 =?utf-8?B?SHRoWjNHSjlmb2xIOU16Qng0RmlRSUdFOTkyMDBPeDNNakRqZFRNYWZydW1W?=
 =?utf-8?B?N05pTGYwTXhnQlVURFUyRktSc1J3SEJUczlVdm0yY3lZVG1XMTdBYXJ6djh2?=
 =?utf-8?Q?MeWALjL2nqz161znaXG57xu+CYPWehCn25XSA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(921011)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVFLd1pWQWdyeTFkVCtDbkNieGNTc0k5clB1TmZTL1ArWDR4VUNiTEhJaUlY?=
 =?utf-8?B?NVl4UnlrNFNycllmWDZKR2hrL2JUSkk0Qm40dHU1TXRKY09VREJaanRkMXlY?=
 =?utf-8?B?cDFKWjVPb0drV3Y1SG1UWTFiSnVlcVJEYTRiQXprMk9WVXM3aWVPRHQ4NHVR?=
 =?utf-8?B?VnFKNHhMNG9DcEh4UTNmUTgvNXFiejdHYUgxanZRMjZGdlZ2dFduQUZGa09N?=
 =?utf-8?B?OWxvL1lzS0p4UUNydFlLOU9Fam50eDdrMEtDMDZZb1lMU2NtNHMwYVROR0VS?=
 =?utf-8?B?TnBDWnJqQSttMEdnMWpSNS9wSVFTR0RVazdrSUp0Q2hoNTVybXVRRUZWVjhD?=
 =?utf-8?B?ZTQ3K3FYdmpHNzdyS0hKUmhtRFVadFFES0JTRVRaY2JKWXNGM01uOWNIUXdk?=
 =?utf-8?B?MHdGR0RlMVYyM1BVakJ4RVhTc3MwbC8yRE5EdlBPM1ZoeEJsSVhGaFE3cGVn?=
 =?utf-8?B?bXlrVmdvdlZVbkpZMlM3MTR6ZUNTSlVFSW1GWlRtb1ZibW1sUm51TjVCcmdI?=
 =?utf-8?B?aG5RV0pETDVnSThMRG4zUG44S2tTa1A2dHNBa0ZOaEhPS2dRWlF3YXFkLys5?=
 =?utf-8?B?TlRpOWdoNi92dlBiNTVGZ2J1aW1zTHAwRkFocTdBazVxUURDWi9yQ04xUzFJ?=
 =?utf-8?B?eE9lOGdIMU5sS2hwcEduTlU3bWpxNjRVK1l5bjc2NWY0QzJWWTMrM3Q3VUhQ?=
 =?utf-8?B?UUJoSE5VdktHcy9IaEVVYWp0ZS95WTNrbjlJY21jWGlReS9kM056THZCamUy?=
 =?utf-8?B?cyt1SlRTK2ZPdlRDSmNMajVzdkZnTXVMTytJVXVKMTRDelV4WXNEWVNHa1FC?=
 =?utf-8?B?V05iUVFCZy91QVVzV0g4WlRMS0ZLUFBIcDdjaHRpbkZzeGhSa3hDZFlSQ3Ew?=
 =?utf-8?B?NUc4Um5BYUlYZ1VSb1lvT3YxdWVSSEp2bG9CN3VpajZxMU15WEZBQWxzc2Ra?=
 =?utf-8?B?MVQ1eDJvdkJVZHMwL0RxNGRJcUZtS00xeDZIL0hybnFQTUQ2cjJNQkJxQ05T?=
 =?utf-8?B?aTVyUFVBbW5PWnZhWjQyYmY1bldQSVhpYmNFWkh3WVVrb0N1bnNjQmdzenpY?=
 =?utf-8?B?TjVXTzZRU2lMN3d2S29uWTBOWHZ5SzJBVWtrSTFxM1ZBc2VpYThxaTRadnR4?=
 =?utf-8?B?UVgzd1NoRVZHRHJ1STh5ZlpFNGk3TUVTdWpnazhjMEhIeVB4TEs0VmFOa21y?=
 =?utf-8?B?MW9odWlOM09tYnRDOVlSQ0hQUE9rSmFqOUdpazdpbUtIYThnUXNpMWxTTXll?=
 =?utf-8?B?bmNUdUpvYmpxcEkrVHZmRC9icC9nQVJaVlkyRHNYL0Y1dkdHVGZkbzJHNTd0?=
 =?utf-8?B?RG1ZSVQwODZ3S2M1U1hmZ0VsRU9mMlhQWDNNUDlrUmRZaWVBSXFvRzhaSjI4?=
 =?utf-8?B?NFlPMmpMZStCcVR1c2FLdXZxTzcwMHBtc0dFbitzc1poVklBU2g1VnRPWjdr?=
 =?utf-8?B?VEZ5K3dGU0w1TXQvSFlBNEJIWjJXM0pRNzRWY3JLOW1jR3FMVzdXUHQyOEQ3?=
 =?utf-8?B?cDNEYVRDeWg0YWxDUEdoSFBIcDZvUGxqeFdlT2J0TjhzT1p0MlQrQXphUThp?=
 =?utf-8?B?eHBvbzc5Qk12NVB2VGtBWThLY2ViWk5JbzdHc3NCREdjQks5bGREcjdFSEVL?=
 =?utf-8?B?UmF5UzVCQ2t6S1IrMmhsUG9xeGdodk5UTmJUVjZHRGJOaitSL3lsd0VSRUlj?=
 =?utf-8?B?U0RHOUlicEZIMmRIeGl0WjdDSFI2WW1sMloraVoxV0ZHT1lQV1RjYjhqdmYy?=
 =?utf-8?B?RXZzRjNrM0w4RXNYb201OGZsRlRibVdFd05MaDJYa2dFeDJhWkVUR3JrUmpL?=
 =?utf-8?B?cWoyTmdwUWF1d2xOaTVaTlR5dWZBQWJJOWlrWGFOZGVkakhFRVNIdmRleXFq?=
 =?utf-8?B?QkFKWUhuejh0d3c5dXNKamJTUnNLcUhsL2lxR0ROVGFyb0JaNGQyNzJqeitm?=
 =?utf-8?B?MzNLcE4wcW51UUxrT2tjcWZKTVlvbnJuTGZFNUZuYmtHNzNZSkNqZlJwOGdW?=
 =?utf-8?B?dXl5YTRKRjNEZFhMM09mbWRLbktvWC9sZ0srakxiOUZ5SVNXNm5hdzJ0cTl5?=
 =?utf-8?B?U091NFk0ZFEvMURYQVV1K1pmaGpCd1puRy9JSXBTbURzUjhVYVRjS1pnNzZz?=
 =?utf-8?B?OE1jeXp6S0RxeUMwTUJDMjdsK3k0M2lYZmM4d2pxK1ljOVdrZGx2bDJrWDZL?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddb095b-d992-493d-d798-08dc70342155
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 14:27:17.9064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+mzgs2Sy/50dm3lhmpsb11T5BTUXRF5Qr0Pz6wkrt6jh3piAdVv3dh8p3xuF4AFhwUbtGWkC30zIY+7lVLdSbrXt5DaLX63VeIHgNFvAbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2Vs
dHlAaW50ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTWF5IDgsIDIwMjQgNjoyOCBQTQ0KVG86
IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZp
dHRAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+
OyBNaXN0YXQsIFRvbWFzeiA8dG9tYXN6Lm1pc3RhdEBpbnRlbC5jb20+OyBHaXJvdHJhLCBIaW1h
bnNodSA8aGltYW5zaHUuZ2lyb3RyYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGkt
Zy10IDEvMV0gbGliL3hlL3hlX3F1ZXJ5OiBXYWl0IGZvciB4ZV9zdXBwb3J0c19mYXVsdHMNCj4g
T24gNS84LzIwMjQgMTA6MTEgQU0sIEthbWlsIEtvbmllY3pueSB3cm90ZToNCj4gPiBIaSwNCj4g
PiBPbiAyMDI0LTA1LTA4IGF0IDE2OjQzOjA0ICswMDAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3Rl
Og0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5l
c2RheSwgTWF5IDgsIDIwMjQgOToyNCBBTQ0KPiA+PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gPj4gQ2M6IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRl
bC5jb20+OyBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFdlbHR5
LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPjsgTWlzdGF0LCBUb21hc3ogPHRvbWFzei5t
aXN0YXRAaW50ZWwuY29tPjsgR2lyb3RyYSwgSGltYW5zaHUgPGhpbWFuc2h1Lmdpcm90cmFAaW50
ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDEvMV0gbGliL3hlL3hlX3F1
ZXJ5OiBXYWl0IGZvciB4ZV9zdXBwb3J0c19mYXVsdHMNCj4gPj4+DQo+ID4+PiBIaSBKb25hdGhh
biwNCj4gPj4+IE9uIDIwMjQtMDUtMDMgYXQgMTI6Mzc6MTQgLTA3MDAsIEpvbmF0aGFuIENhdml0
dCB3cm90ZToNCj4gPj4+PiBJdCdzIHBvc3NpYmxlIGZvciB4ZV9zdXBwb3J0c19mYXVsdHMgdG8g
cmV0dXJuIGZhbHNlIGlmIHRoZSBzeXN0ZW0gaXMNCj4gPj4+PiBidXN5IHdpdGggbXVsdGlwbGUg
cnVubmluZyB0ZXN0cy4gIFRoaXMgaXMgYmVjYXVzZSB0aGUgY2hlY2sgbG9va3MgZm9yDQo+ID4+
Pj4gYWxsIGFjdGl2ZSBWTXMgYW5kIHNlYXJjaGVzIGZvciBWTXMgdGhhdCBkbyBub3QgaGF2ZSBm
YXVsdHMgZW5hYmxlZCwNCj4gPj4+PiByZXR1cm5pbmcgZmFsc2UgaWYgYW55IGV4aXN0LiAgUmVj
ZW50bHksIHRoaXMgY2hlY2sgaGFzIGJlZW4gY2hhbmdlZCB0bw0KPiA+Pj4+IHJldHVybiBFQlVT
WSB3aGVuIHRoZSBjaGVjayBmYWlscyBpbiB0aGlzIHdheSwgc28gd2FpdCBmb3IgdXAgdG8gdGVu
DQo+ID4+Pj4gc2Vjb25kcyBmb3IgYWxsIHRoZSBhY3RpdmUgVk1zIHRvIGZsdXNoIG91dCBiZWZv
cmUgcHJvY2VlZGluZy4NCj4gPj4+Pg0KPiA+Pj4+IFN1Z2dlc3RlZC1ieTogQnJpYW4gV2VsdHkg
PGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBD
YXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gICBs
aWIveGUveGVfcXVlcnkuYyB8IDkgKysrKysrKy0tDQo+ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdp
dCBhL2xpYi94ZS94ZV9xdWVyeS5jIGIvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPj4+PiBpbmRleCA2
ZGY4ZjQyNjQ5Li41NDU4YzczNDE3IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL2xpYi94ZS94ZV9xdWVy
eS5jDQo+ID4+Pj4gKysrIGIvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPj4+PiBAQCAtMzE0LDggKzMx
NCwxMyBAQCBib29sIHhlX3N1cHBvcnRzX2ZhdWx0cyhpbnQgZmQpDQo+ID4+Pj4gICAJCS5mbGFn
cyA9IERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFIHwNCj4gPj4+PiAgIAkJCSBEUk1fWEVf
Vk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSwNCj4gPj4+PiAgIAl9Ow0KPiA+Pj4+IC0NCj4gPj4+
PiAtCXN1cHBvcnRzX2ZhdWx0cyA9ICFpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9WTV9DUkVB
VEUsICZjcmVhdGUpOw0KPiA+Pj4+ICsJc3RydWN0IHRpbWVzcGVjIHR2ID0ge307DQo+ID4+Pj4g
KwlpbnQgcmVzdWx0LCB0aW1lb3V0Ow0KPiA+Pj4+ICsJZG8gew0KPiA+Pj4+ICsJCXJlc3VsdCA9
IGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZNX0NSRUFURSwgJmNyZWF0ZSk7DQo+ID4+Pj4g
KwkJc3VwcG9ydHNfZmF1bHRzID0gIXJlc3VsdDsNCj4gPj4+PiArCQl0aW1lb3V0ID0gaWd0X3Nl
Y29uZHNfZWxhcHNlZCgmdHYpOw0KPiA+Pj4+ICsJfSB3aGlsZSAocmVzdWx0ID09IC1FQlVTWSAm
JiB0aW1lb3V0IDwgMTApOw0KPiA+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0g
Xl5eXl5eXl5eXl5eDQo+ID4+Pg0KPiA+Pj4gV2FpdGluZyBhbnkgbnVtYmVyIG9mIHNlY29uZHMg
aW4gbGlicmFyeSBmdW5jdGlvbiBpcyB3YXkgdG9vIG11Y2gsDQo+ID4+PiBpbWhvIHRoaXMgaXMg
b2sgaW4gdGVzdCBpdHNlbGYsIG5vdCBvbiBsaWIuDQo+ID4+DQo+ID4+IElzIHRoZSBzdWdnZXN0
aW9uIGhlcmUgdGhhdCB3ZSBzaG91bGQgcGVyZm9ybSB0aGUgd2FpdCAib24iIHhlX3N1cHBvcnRz
X2ZhdWx0cywNCj4gPj4gcmF0aGVyIHRoYW4gImluIiB4ZV9zdXBwb3J0c19mYXVsdHM/ICBJLkUu
IHRoYXQgd2UgZG8gc29tZXRoaW5nIGxpa2UgdGhpcyBpbnN0ZWFkDQo+ID4+IGluIHhlX2V4ZWNf
ZmF1bHRfbW9kZS5jOg0KPiA+Pg0KPiA+PiAgICAgICAgICBpZ3RfZml4dHVyZSB7DQo+ID4+ICAg
ICAgICAgICAgICAgICAgYm9vbCBzdXBwb3J0c19mYXVsdHM7DQo+ID4+ICAgICAgICAgICAgICAg
ICAgc3RydWN0IHRpbWVzcGVjIHR2ID0ge307DQo+ID4+ICAgICAgICAgICAgICAgICAgZmQgPSBk
cm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPj4gICAgICAgICAgICAgICAgICBkbyB7DQo+
ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdXBwb3J0c19mYXVsdHMgPSB4ZV9zdXBwb3J0
c19mYXVsdHMoZmQpOw0KPiA+PiAgICAgICAgICAgICAgICAgIH0gd2hpbGUgKCFzdXBwb3J0c19m
YXVsdHMgJiYgaWd0X3NlY29uZHNfZWxhcHNlZCgmdHYpIDwgMTApOw0KPiA+PiAgICAgICAgICAg
ICAgICAgIGlndF9yZXF1aXJlKHN1cHBvcnRzX2ZhdWx0cyk7DQo+ID4+ICAgICAgICAgIH0NCj4g
Pj4NCj4gPj4gSSBjYW4gZG8gdGhpcywgdGhvdWdoIGlmIHhlX3N1cHBvcnRzX2ZhdWx0cyByZXR1
cm5zIGZhbHNlIGZvciBhbnkgbm9uLUVCVVNZIHJlbGF0ZWQNCj4gPj4gcmVhc29ucywgd2Ugd29u
J3QgYmUgYWJsZSB0byBkZXRlY3QgaXQgZnJvbSBoZXJlIGFuZCB3ZSdsbCBzcGVuZCB0ZW4gc2Vj
b25kcyB3YWl0aW5nDQo+ID4+IGZvciB4ZV9zdXBwb3J0c19mYXVsdHMgdG8gcmV0dXJuIHRydWUg
d2hlbiBpdCBzdHJpY3RseSBjYW5ub3QuICBJcyB0aGlzIGFuIGFjY2VwdGFibGUNCj4gPj4gdHJh
ZGVvZmY/DQo+ID4+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPj4NCj4gPiANCj4gPiBJZiB5b3UgYXJl
IGRvaW5nIHRoaXMganVzdCBhZnRlciBpZ3RfbWFpbiB5b3UgZG8gbm90IGV4cGVjdA0KPiA+IGl0
IHdpbGwgcmV0dXJuIEVCVVNZLiBPdGhlciB3YXkgd291bGQgYmUgdG8gcmV0dXJuIGVycm5vIGZy
b20NCj4gPiBsaWIgZnVuY3Rpb24gYW5kIGxldCBzdWJ0ZXN0IGRlY2lkZSBpZiBpdCB3YW50IHRv
IHdhaXQuDQo+ID4gVGhlcmUgeW91IGNvdWxkIGFsc28gYWNjb3VudCBmb3Igc2ltdWxhdGlvbiwg
d2hlcmUgaXQgY2FuDQo+ID4gdGFrZSBsb25nZXIuIEJ0dyBpcyB0aGVyZSBhbnkgc3lzZnMgcGFy
YW0gZm9yIGl0Pw0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gS2FtaWwNCj4gPiANCj4gDQo+IFBy
b2JsZW0gaXMgdGhlIGlzc3VlIGlzIHRoYXQgMiBWTXMgY2Fubm90IGJlIGNyZWF0ZWQgaW4gdGhl
IDIgZGlmZmVyZW50IA0KPiBtb2Rlcy4NCj4gQ2Fubm90IGhhdmUgb25lIFZNIGluICdmYXVsdCBt
b2RlJyBhdCBzYW1lIHRpbWUgYXMgb25lIGlzIGluICdub24tZmF1bHQgDQo+IG1vZGUnLiAgIFNv
IHRoZSBjb3JyZWN0IHBsYWNlIGZvciB0aGUgY2hlY2sgaXMgbm90IGV2ZW4gaW5zaWRlIA0KPiB4
ZV9zdXBwb3J0c19mYXVsdF9tb2RlKCksIGJ1dCBpbiB4ZV92bV9jcmVhdGUoKS4NCj4gDQo+IEFz
IGV2ZXJ5IHNpbmdsZSBJR1QgdGVzdCB0aGF0IGNyZWF0ZXMgYW4gSUdUIGNhbiBmYWlsIHdpdGgg
LUVCVVNZIGZyb20NCj4geGVfdm1fY3JlYXRlKCkgYXMgY3JlYXRpbmcgMiBzdWNoICBWTXMgaXMg
bm90IGFsbG93ZWQuICBXaG9ldmVyIHRyaWVzIHRvIA0KPiBjcmVhdGUgdGhlIFZNIHNlY29uZCBs
b3NlcyAoZmFpbHMpLg0KDQoNCklmIGl0J3MgdGhlIGNhc2UgdGhhdCBlYWNoIGNhbGxpbmcgb2Yg
eGVfdm1fY3JlYXRlIGhhcyB0aGUgcG90ZW50aWFsIHRvIHJldHVybg0KYW4gZXJyb3IgZHVlIHRv
IHRoaXMgcmFjZSBjb25kaXRpb24sIEknZCBleHBlY3QgdGhhdCB3ZSdkIHNlZSB0aGlzIGlzc3Vl
IGNyb3AgdXANCmZyb20gdGltZSB0byB0aW1lIGluIGNhc2VzIHdoZXJlIHRoZSBpc3N1ZSB3aXRo
IHhlX3N1cHBvcnRzX2ZhdWx0cyBpcyBub3Qgc2VlbiwNCmVzcGVjaWFsbHkgaW4gdGVzdHMgdGhh
dCBkb24ndCB1c2UgZmF1bHQgbW9kZSB2bXMuDQoNCkhvd2V2ZXIsIEkgY291bGRuJ3Qgc2VlIGFu
eSByZXBvcnRzIGFmZmlybWluZyBhcyBzdWNoIG9uIGEgY3Vyc29yeSBpbnNwZWN0aW9uLg0KVGhl
cmUgd2VyZSBhIGNvdXBsZSBvZiB4ZV92bV9jcmVhdGUgZmFpbHVyZSByZXBvcnRzLCBidXQgaXQg
bG9va2VkIGxpa2UgdGhleQ0Kd2VyZSBjYXVzZWQgYnkgaW50ZXJmYWNlIGRpdmVyZ2VuY2UgYW5k
IG5vdCBieSB0aGUgYWJvdmUgcmFjZSBjb25kaXRpb24uDQotSm9uYXRoYW4gQ2F2aXR0DQoNCg0K
PiANCj4gTWF5YmUgYSBnb29kIGZpcnN0IHN0ZXAgaXMgdG8gaGF2ZSB4ZV92bV9jcmVhdGUoKSBy
YWlzZSBhIFNLSVAgb24gLUVCVVNZIA0KPiBlcnJvcnM/DQo+IA0KPiBNYXliZSBhIGdvb2Qgc2Vj
b25kIHN0ZXAgaXMgdG8gZmlndXJlIHdoZW4gYW5kIHdoZXJlIGFkZGluZyBhIA0KPiB0aW1lb3V0
K3JldHJ5IG1pZ2h0IG1ha2Ugc2Vuc2UuLi4uLiAgIG1heWJlIHNpbmNlIHRoaXMgaXMgYSBzaGFy
ZCBydW4gKEkgDQo+IHRoaW5rPyksICB0aGlzIHRlc3QgY2FuIGJlIGF0dGVtcHRlZCBhZ2FpbiBs
YXRlciBpbiB0aGUgYmF0Y2ggb2YgdGVzdHM/DQo+IA0KPiAtQnJpYW4NCj4gDQo+ID4+Pg0KPiA+
Pj4gUmVnYXJkcywNCj4gPj4+IEthbWlsDQo+ID4+Pg0KPiA+Pj4+ICAgDQo+ID4+Pj4gICAJaWYg
KHN1cHBvcnRzX2ZhdWx0cykNCj4gPj4+PiAgIAkJeGVfdm1fZGVzdHJveShmZCwgY3JlYXRlLnZt
X2lkKTsNCj4gPj4+PiAtLSANCj4gPj4+PiAyLjI1LjENCj4gPj4+Pg0KPiA+Pj4NCj4gDQo=
