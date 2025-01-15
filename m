Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8905EC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 05:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259210E4CB;
	Wed, 15 Jan 2025 05:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V99L1XkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6147410E4D1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736917812; x=1768453812;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=U+RaomyllD1tUM9b6wA7F6B6lKQFKTwjUIPtzmPTAk8=;
 b=V99L1XkXtWD5Q4oC2ZmB5D47HdIb5Roe2J+Fk9Ju85Xd/SZ8pVnBJOi9
 nAqUBxl+x5i+7/7U+1houmMTaLOef/vzUD3+NxsigTeE/vmHijYDy+csI
 zaRD/bGKr3pLPwj9/0nJslNsIuZ8l5BPP7rEUgZDtTEnzbsEAvs76chGp
 smiD1E8jQL8WzV9YoOJag6SAYlF2F41aq9rgij4USMKEc4K0ua8KzZttG
 Ra0nC4s4mDhn0dTsLy94EpZ9f6hPpciTwZ02HcH5iMlZBcxhkoG7xGGFj
 6NKTPfy/S7V0oqCbucw4KxXNBmSzISYpKFHxFMYcTZHfJBD5teOXfE11S g==;
X-CSE-ConnectionGUID: j8XMWvXSQ8G8ZEqilnY8pQ==
X-CSE-MsgGUID: Q52HM6EyRF2xXUJ5gcNZbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48237766"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="48237766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 21:10:11 -0800
X-CSE-ConnectionGUID: t31Sf2TsRZycIyqZilv89A==
X-CSE-MsgGUID: MbkqaW7oQy2ZnqOIzPFxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="104774442"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 21:10:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 21:10:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 21:10:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 21:10:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNC6CKMGjehEMD5ISZrZjZpg6MFX2DFiMp4ED5ulyriDwp9Wjpm7QGTVNXgC19SIziiV5cluyE1Ts/NLpPfggmuVy71/d6sDoypBeMjD3i12tFM9y4EMPbosvEE6vVjsDTDRYEBsqwP8VPV4E7gTmzt1nfrHPwwyKm6GrcBrySpMBiC8S9yA6TVZJUb14jjGdSZaO1TrKp5TiKjm4/FKCGO46mkss2edci32bxmG2fzJh76meNRt4zUuliCvyxZebTGIkb8oGCRAWlkEeQlwlQBt5TpleoEqAsC/UL5jU2ANY/bLja+r57JtG/RUuiZW9BjHna9EeclI8FRmwJuLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+RaomyllD1tUM9b6wA7F6B6lKQFKTwjUIPtzmPTAk8=;
 b=X7EttWI20nJsuzXnR4en1O9EjIhUV+0EKbD+6x7gsmBx4zailrcE+jg8dxqKUxZvyY8zOWkAjRgpbW404JAAfgXbcBL6b+2keyKTAPTAtUplNyjWWECb4Or8EynK+Gxd82PZR2IgQKv/meMY9ZEYx9hSmTuqZq4zPLrZGeczE2xhtBDpQkUHOjejq/7DKmpn5o9SaUrEV7T/xqP6rsvScQNYLillT3MmuWsurOFcBW5KN8/2UPrcNK5gG/fOYwHF484VomZyiZ+1fFyz82pbKKMtnwi8T8TX2DwK+SzIxT2rGZrBOTlexOp2HRbgs4zT+t4mICiYhNRpB5K/8navqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 05:09:22 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:09:22 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t 2/7] tests/intel/xe_vm: Update invalid flag subtest
Thread-Topic: [PATCH i-g-t 2/7] tests/intel/xe_vm: Update invalid flag subtest
Thread-Index: AQHbTCt1d1Zo9cR9k0Wq1AtgaQLD0LLhwBWAgDW+2AA=
Date: Wed, 15 Jan 2025 05:09:22 +0000
Message-ID: <ba5cfbeea304175a94d50b5a9c42ae4d342a8b1a.camel@intel.com>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
 <20241212001829.2082490-3-daniele.ceraolospurio@intel.com>
 <16394f40-9549-48f7-aefd-c3b3f316ab67@intel.com>
In-Reply-To: <16394f40-9549-48f7-aefd-c3b3f316ab67@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7496:EE_
x-ms-office365-filtering-correlation-id: b9a32318-0a21-4a44-4daa-08dd3522c620
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y3pvcVl5Z3hxdjR5Z1RqWEZkM3JKOWJQOTRKVjJ2QTAxK0JOSW41R3hPMm9w?=
 =?utf-8?B?dDNSYTdQL2JRMDYrN3JLMnlWcHFkeTJySmx4K2IyUS9weFB3bUhyRHQxN0pp?=
 =?utf-8?B?c3dvUjRPaWdjVXhsY1B0eGkydTBXNUhIRVlyTkI3YmpBQ2s2dlRmM0YvMGVF?=
 =?utf-8?B?QUN2K29sZm5KUFEwbzQva1RBbGJHbzFVNE1XOUpyR25jUXRlRnRlS0ZxNG9M?=
 =?utf-8?B?ekYzZU9tT1UrYnRNUml3dWhLT2ZSWVFvMlgveTZ1d05QY1RhOVB5SzVZYU9B?=
 =?utf-8?B?UFd2QWNRNGpocWJGRlljb29kTDd2UUlubFhoV00xamt5eEk2Z2tjSWlKc3lI?=
 =?utf-8?B?dGttcmRMVjBGdVZhc3F5QlRvc3BsUDNCbnRSL1pidGxpYzNjSUJKVGhmWElI?=
 =?utf-8?B?a1RsZkNwSWs3VGdLK2RJTjZBVE5uK1lSV1FiTEc3M2k0eHB4Nzl6S3RUMTEw?=
 =?utf-8?B?SU1lYm1vUHpEQkloV1RHajZjNDJrRFpBQ0ZtK1RZVXhiYVNNRVM1RUxOMzIr?=
 =?utf-8?B?MCtvVkxlTmc5MjlMZ3ZYSWhSaEsvVkFGcFRTSTh6MUZvY3NiREFadDl0Z2FD?=
 =?utf-8?B?dkpSNWs3a0Q2RDA1cU1IUzVkamkwblhaL090ZTFpL0o3MXpSQWc2Z2IvQTBO?=
 =?utf-8?B?Q2d5WDdnVys3R0hlenhYTHBJRko5VE9PS2RxOE51ekd6M3BlZldqN0d2THFP?=
 =?utf-8?B?UXdtZHpUS3Q4OEpXdnZVc2VCSHdEaGUySlRRNjBNcXVRenlXcGI0UTRjTVlm?=
 =?utf-8?B?a3pqcmlNQW1sU0RpZXozQ3dBNVloZGMweXFwcEFvOERGdS91bzV0QnRPS0ti?=
 =?utf-8?B?bk16TUVPNGFJZXZYdEFjdjhnYWUzaTVsMm1nN1ZuOUFCbVhYQVg1V1hxeko2?=
 =?utf-8?B?Yi9wczdrWDhZVitMUkpSdHRKckhQbWNTMWN3ODhJNm9mbnRUZ1Z5Y09mVWdF?=
 =?utf-8?B?akh5K1dvYnNlbnBIcGdoZ0t4anRMMGljUXZ1N0NBc3ZuUFlyRmNuczJpRkNo?=
 =?utf-8?B?ckFLUDFtYkhmRDh3dFByOG9UanRad0hZaUxJZDdOeXF5NDJjblh5aDZIZW5F?=
 =?utf-8?B?MGFUeEErOXEvYUQyU2xJV3JIQW1VWE1SaE5UQkFDWUwzaldOcnN5SFphTDNu?=
 =?utf-8?B?SlBaOWhYQjZUOXovQU5zTEZtNVdVWjNSMzRkaWJ6TFZUMUNTNDNrZmpzK2xJ?=
 =?utf-8?B?ZTVvYzRqYkthRms3Tit5MU5pK28vU0tyMXJEMmt1cHYydUNrMklBVERNalJS?=
 =?utf-8?B?MlNiRWxGSXJ0a1BscDVsL1dtcVlZNXhHK1dUNEtEZi9CUkF4akhmSG4zcy9J?=
 =?utf-8?B?bTlOTm8zSWcxMHBSbEVvcEZWa1VROHVvQWtHN2JGRHNaZ0Z5aHQ1d3BvYjNH?=
 =?utf-8?B?Z0tIUkJRV2xjNExvNW91NjNBa3dFa0RXK0YyTkNpakY2ZjZJWG90NTFCV0Nm?=
 =?utf-8?B?VC85RE5PNU5URktlSko5Y1pRb3RZYTF4SG9uUnZ4L2d3RnNBMnpCblRPRjBS?=
 =?utf-8?B?Ujh6WUNmWXlnbno4cm8rbGFXN2Y2bW5jZnZrUlFhVHpMWWJuOWJ0R0thbnFF?=
 =?utf-8?B?Z0R1WjhhUjlvb3dKSkJuck9ONkhzTUt0VktNQTY1S0xEMDJyVTZQL0FrVENC?=
 =?utf-8?B?MEpYZndxVjhkWkZkYUhqYVA2akU1Z3VOdlI5VTZrbi9WTEFZS0pvSFQ2dmdZ?=
 =?utf-8?B?Tytpb1VuN3BUUWtzbmd6QlRtMlFqVlJ4YU41TGx3bzBxbnRxNzlzTWRSditV?=
 =?utf-8?B?ZHVvL1d1d1JBRWN4d3ZQN2piZjE0QnVsWWswQ2ordHh1L2pHNm1hdnNXcHZr?=
 =?utf-8?B?WTB3QVVUSmNFK3NUTHB4QzRzUVNKbDVvd3lGQW05U0JoeHU2QXVTaGc0azRC?=
 =?utf-8?B?U3drWHBFdVpweVhJTXljN0Z3RWJteGF1SGE5dFdReFVUQk5mUHRCSWkxd1FV?=
 =?utf-8?Q?nVtKg7qWb9xe4Z034cO3bBhdWE/aCRbP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFBmb0gwZ2ZCYjl4TC9Wbk1kWFdTZ0RhdEJsMlZzd2cxU3NOdUtseFFTemdS?=
 =?utf-8?B?UzJPTTB4WFFpUEZXVjlFSkN1dnU1Zno2S09EQVp1aHNoZEFBSHUxYXdUaVRw?=
 =?utf-8?B?azlsazhJMWppZW5QOUNZVWdJVFZlYUtLbGVIVTFBUXV0SVhJbFdnTjhmVWZR?=
 =?utf-8?B?dDIvWjFUcHZRZExUKzBrVm5wSTcweWFxSnhvam8rNmgya1FoMWlPZXN0elkr?=
 =?utf-8?B?dldSeXFoMFgwOGZET25od21LVDdvNHFGdXZnSlA3NzVmaFdsdk95anhXUkpP?=
 =?utf-8?B?bzI2UmFkWSswSXQ3bzFqTTIwS05JaW5yUkJkZC93TTkyYVVKUUVia3NRSjBx?=
 =?utf-8?B?MlltUnVjRE1nQ2wvamtGbDByVjN1RHdSR0R2cXE2bFp1WElabDlTNmt3TXRH?=
 =?utf-8?B?TXI5MWhCamJnVjM2K2hSNFI5MklTYnR2NWlSM3NwZ2xKZlVScElmN3Q4Uk1R?=
 =?utf-8?B?T0pVTjJmZ2xOVjBYUEcyelFYQ25WS29vUElYYWVrbFNNMWtFdC9JWWZaU01h?=
 =?utf-8?B?Q0Qxc1BiaUNSRzhaZTdzSkcyYTB6Q2pxM0tZRTFRZTAxeGxQKzAwa0M1aC8y?=
 =?utf-8?B?cnlEZDVWcXJseXc4cWlMeDYwUWdqZThDSzRHUldQa1BMM2o2bHZQK0lHODll?=
 =?utf-8?B?eVgwTnJHSGczMVJGZmc0QTYrNFp3d2VFb2Z6SnVxZ004RkVCTm1qVDR5RjFW?=
 =?utf-8?B?TnZxNVk5WWN1VERKY2ZaWXBMbmhWWWJyMGwzOHVreXRPbmlucnZOb3VEYmY4?=
 =?utf-8?B?ZzEvR0w0aWtZSXgxZTVPbnU4T2JxUTVmV2JMVWJTQ2tkc29KYk1tQklrT1FM?=
 =?utf-8?B?RlNTaHBZUUhvcVEza2ZEV3FTYlJweEZmckV0YjJNWXRtQ2dMbWF6c2NkWkNo?=
 =?utf-8?B?bXA4cEx1RzJMQ1ByWUNKN2FCeCs1REtWeTN3NmkvYlo1TklMQSsrSVEzU0JS?=
 =?utf-8?B?Y3laTW1sWEM5RVZhT0FRMGVKZGJsWkJxYUJGTnRVVzlxTmpmMjZ2Wk9MdjQ5?=
 =?utf-8?B?UVR6WXhsS3AwMTc1aDNLVmd1bWg3ZGp0a2tQczg4YjZvUzg2bjJpcnVXekJk?=
 =?utf-8?B?aU43dTFDcWdqaUFnc3lFa3RjT3k4VTdXUVo4b2RWZzB2YWNoazRoeDBNNXVt?=
 =?utf-8?B?RDJCV3NEZ053cFRVd3h2c2d1andCUVRzTVcvTnA5MGttak05SkMwdkxLT1pm?=
 =?utf-8?B?ZGhIYU1EUCtqKzU3U2Y2em1McDlOWE5STXBrK001eXhZTnJndHBvZU5xOVFW?=
 =?utf-8?B?bklFZW9kR0I4U3dvamlwU3VzSHRYWG1xcmRxNTdaSGU3OTN0NlRuN3lSQ1pl?=
 =?utf-8?B?a25VcnRTVUNGZ2JxQ09KQkNMVktCS2VxamZ2aDFMOThuTUdSSTR2VDZCNUlr?=
 =?utf-8?B?cElSVTFmQkY5OEEvT2U5YVFEUXM4TVpKUUpiLzR4V0ZoNjMxVlJsdjg4TXYz?=
 =?utf-8?B?ZDRWK29URWZiemFsK3JPTjlJQ1RSZnJLVFRBcmJXWUNhTjRNbXRoR2lGSXlF?=
 =?utf-8?B?NlJLbGxIVGc5L0pXUFNnQWdmSFArbU5hdHUrRjNSaWF0ZFE2NS93Ym1lVW95?=
 =?utf-8?B?YnZLZXgrWHhYKzhpVEFGQUFtem90Z25TeW5MMVJ5U3czQnM4bGk3NnVLMXor?=
 =?utf-8?B?dk55ZjFlTmJxa01pYVIyWmtVSi9qeFhycmRSc2w2YTB5VHVxdHdoczlsZjZ5?=
 =?utf-8?B?VkxOZkJSSThINFdvNUR6dVQzZ1o1TDhkdGxkMUtaVEhsb1g0SXd1Zzk2RUZJ?=
 =?utf-8?B?MmlUOUdGRWdkVjQxR2FIZEZIUlZnTnVFaVIzRGJ6MWZRcGhzcHdhcm5MVEU5?=
 =?utf-8?B?NVltSXBOSldZUkdoOXpNN2I2Tm1mMk1zSmdGMUd0bVBWdUdubUFoa0RaN2Fw?=
 =?utf-8?B?Y2FsTjNXZnY4dHpHOHorZ0RWWkw2NW9VaEtMcDcyU3QyUkNzaVpQNU5WRU12?=
 =?utf-8?B?NHNkZ0RpUmdhOWZkL0FNZkI0eGlCNFZockdxdlE2WGFnNVhNNTBGb2xUdVlI?=
 =?utf-8?B?bG9IT0Nkb25aVGsrTGRYdG1DUkE5MzVPNUxuRW1qbFR3T1pJUVY4WkpUbTQy?=
 =?utf-8?B?MnNKVkV0cUdmMkpMUXVFbUk4K3dmTk9wVksrYjAraU44MFVBcFlFUnloT1pH?=
 =?utf-8?B?NXEySWRrR3hoNXlSWURrZFBEZTcyV2I0TS9Ed2F1WVJXL2Q2by8zSEJsUzJw?=
 =?utf-8?Q?Y/I06rDF5/jCALjaz3ZWidk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F460B5312E6046BA25167998323BF1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a32318-0a21-4a44-4daa-08dd3522c620
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 05:09:22.5031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: th/5rtXtqVRGJnBOMU+30tWArVZqBlTyYDmPMctgjTGjd8xybv3ZA3jhy9EgNRzwomxA8wLtMDvkvQIcOberRLNR+oKyRIANDBFXrnEBnl3Fki01Qwv3eIVUhsV/rN9z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
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

QWNrZWQuIFdpbGwgd2FpdCBmb3IgbmV4dCByZXYgb24gdGhpcyAtIGJ1dCBsb29rcyBmaW5lIHRo
b3VnaC4NCg0KDQpPbiBXZWQsIDIwMjQtMTItMTEgYXQgMTY6MjQgLTA4MDAsIERhbmllbGUgQ2Vy
YW9sbyBTcHVyaW8gd3JvdGU6DQo+IA0KPiANCj4gT24gMTIvMTEvMjAyNCA0OjE4IFBNLCBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOg0KPiA+IFBYUCBpbnRyb2R1Y2VkIGEgbmV3IHZhbGlk
IGZsYWcsIHNvIHdlIG5lZWQgdG8gYWRkIGl0IHRvIHRoZSB0ZXN0IGFuZA0KPiA+IHNoaWZ0IHRo
ZSBmaXJzdCBpbnZhbGlkIGJpdCBsZWZ0IGJ5IG9uZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+IMKgIHRlc3RzL2ludGVsL3hlX3ZtLmMgfCA3ICsrKysrKy0NCj4gPiDC
oCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3ZtLmMgYi90ZXN0cy9pbnRlbC94ZV92bS5j
DQo+ID4gaW5kZXggZTc4ZGRkMGU1Li43NDFkYzBjN2EgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
aW50ZWwveGVfdm0uYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCj4gPiBAQCAtMjIx
Niw2ICsyMjE2LDExIEBAIHN0YXRpYyB2b2lkIGJpbmRfZmxhZ19pbnZhbGlkKGludCBmZCkNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jWzBdLmhh
bmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN5bmNv
YmpfcmVzZXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSk7DQo+ID4gwqAgDQo+ID4gK8KgwqDCoMKg
wqDCoMKgYmluZC5iaW5kLmZsYWdzID0gRFJNX1hFX1ZNX0JJTkRfRkxBR19DSEVDS19QWFA7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfVk1fQklORCwgJmJp
bmQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3lu
Y1swXS5oYW5kbGUsIDEsIElOVDY0X01BWCwgMCwgTlVMTCkpOw0KPiA+ICvCoMKgwqDCoMKgwqDC
oHN5bmNvYmpfcmVzZXQoZmQsICZzeW5jWzBdLmhhbmRsZSwgMSk7DQo+IA0KPiBSaWdodCBhZnRl
ciBzZW5kaW5nIHRoZSBwYXRjaGVzIEkgcmVhbGl6ZWQgSSBmb3Jnb3QgdG8gc3F1YXNoIGEgZml4
IHRvIA0KPiBvbmx5IHBlcmZvcm0gdGhpcyBpb2N0bCBpZiB0aGUgUFhQIGludGVyZmFjZSBpcyBz
dXBwb3J0ZWQuIFdpbGwgd2FpdCBhIA0KPiBiaXQgZm9yIGNvbW1lbnRzIG9uIG90aGVyIHBhdGNo
ZXMgYmVmb3JlIHJlLXNwaW5uaW5nIHRoaXMgb25lLg0KPiANCj4gRGFuaWVsZQ0KPiANCj4gPiAr
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGJpbmQuYmluZC5mbGFncyA9IERSTV9YRV9WTV9CSU5EX0ZM
QUdfTlVMTDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgYmluZC5iaW5kLm9iaiA9IDA7DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZNX0JJTkQsICZiaW5kKTsN
Cj4gPiBAQCAtMjIyOSw3ICsyMjM0LDcgQEAgc3RhdGljIHZvaWQgYmluZF9mbGFnX2ludmFsaWQo
aW50IGZkKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzeW5jb2JqX3Jlc2V0KGZkLCAmc3luY1swXS5o
YW5kbGUsIDEpOw0KPiA+IMKgIA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBVc2luZyBpbnZhbGlk
IGZsYWdzIHNob3VsZCBub3Qgd29yayAqLw0KPiA+IC3CoMKgwqDCoMKgwqDCoGJpbmQuYmluZC5m
bGFncyA9IDEgPDwgNDsNCj4gPiArwqDCoMKgwqDCoMKgwqBiaW5kLmJpbmQuZmxhZ3MgPSAxIDw8
IDU7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZNX0JJ
TkQsICZiaW5kKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9D
VExfWEVfVk1fQklORCwgJmJpbmQsIEVJTlZBTCk7DQo+ID4gwqAgDQo+IA0KDQo=
