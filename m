Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D74CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434710E721;
	Wed, 24 Sep 2025 12:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw/gRNhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C75410E721
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717552; x=1790253552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aIxHtRGu0YRkHPt9yj7YaU04pp1ZHTZj9JmYr4+xXQM=;
 b=Sw/gRNhweqXCXmd2MVhQGVWxdBDmFWl/n65eGXU1UcHriNyFOCAuKpjj
 neVakemyQBuSx5skcmCGHqbcYGfIXAaEAageHIxtYLpvi4Z1afVple1bn
 fqaWg4MYKVPHXemHQuGaBFv+sGd2D5Irn2yeuFXyQM14c+74gyGYoS0Ie
 iP5g3NMg7sRjYnacU4bk+jDdFEqMhiCY9eUt73bmrb7WbQsiB/EcmSJTV
 LswzkxqalJ+dZ++4uTwOTCS04MA8XHt6DIzPFetjQ6jfT+TmgSP8u13aH
 QvcCTEg9xfQBdGuufW3TJePiXfNHhtVEM9VeaU3VD6l+mTfj/q7ReyQwT w==;
X-CSE-ConnectionGUID: Gaqcu2N7QI2MSgDntJ8+mg==
X-CSE-MsgGUID: jQcLpnG5RWexMNuxAc7FMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61181784"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61181784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:39:11 -0700
X-CSE-ConnectionGUID: ZxrO2uLcT/ipJtvEZry+Gg==
X-CSE-MsgGUID: GVEm3XwVTCKwySwAugxxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182302596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:39:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 05:39:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 05:39:10 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 05:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovTm4Q5o/A/McOgi2byojWC7p03WM/eZys4h6Ikmd6MeINpIgyBNc9fA6/77wqpsb7VAg4nqDvNEFaJ9Kh+HNMsiEKxSKqGUOAVO0hSNk/m1iVojsGaRPTeo2CEOWuYEk2mgo3C7djH1W1tURfkkuYLrBFaq6tBKQA3YnJEwrTdHMcUbN0qiszbYbA2uwdD789qc6xkjQ6ILneWf/t1zlZVFrr/S8AbjVBLu4XIsjmaZ1YyNIr/fP5tJlUiQOK37rnDPmuo20UOyFfhJYhzPgmWMw9maaJUrUUEIgdi8Go5juTDYLTECwdmwhXGkqr+pdwUHEQz6YrCGcIMelj1JQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIxHtRGu0YRkHPt9yj7YaU04pp1ZHTZj9JmYr4+xXQM=;
 b=K0x85BVwcMY/VEAluwuhcQ142aeDpGkuViKmtoJT0wounJj5ol+5EmHFLN9wtsQvhTg9Foo5pdEwyxerk9t5M+TDOCemGPDV3VdqiVIivbtKkvq+xMK5S6DZU+GFy+OAUsqrYniGVK4kbyidtZZzZ1jYNpQrV4W95AQmqgFhYXx5RLZ2RHwRoTyRIfVFxQM03yBT0+JNuiG29yRBlEKaTaKpdWfQkwhVrBiKe7mU1f/jvrmtS3zg0RPkZ7lQyz3i5/skAlA3IWsL1+j8rcZo7ANW2loR+wvabF3rLjmuVlZneOVgypSKWotUyM85daomNKwZOSaeRc5r0xOFA/69XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 12:39:07 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 12:39:07 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v4 i-g-t 6/6] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Thread-Topic: [PATCH v4 i-g-t 6/6] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Thread-Index: AQHcLItwC7euA9Q3ikKdhqXrb6SfvLSh4yEAgABWLICAAAldQA==
Date: Wed, 24 Sep 2025 12:39:07 +0000
Message-ID: <DS0PR11MB72642FFEBCB8B7F356568FE4D91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-7-dominik.karol.piatkowski@intel.com>
 <rrwptxvacd43d3olx6nvqtodzsjnti3yud3mflvtepdkgsc6xn@dxchujdcwj6p>
 <ff659d30-ef6f-4d66-816e-580721beab66@intel.com>
In-Reply-To: <ff659d30-ef6f-4d66-816e-580721beab66@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MN2PR11MB4760:EE_
x-ms-office365-filtering-correlation-id: a2a4ba9e-8986-46ef-463b-08ddfb675a8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WmV0VXBmMEc3N1c0cTVKNTN2TEgvVElLU1crYklzVFNDUW5lblVEczk5Skxw?=
 =?utf-8?B?b2lJdjFlM0dVZ3NyZEk4YjBXbXlxaG5CMUZSdTh4YTY5N0trNlNIajh2bjZV?=
 =?utf-8?B?Z1phQ0g4bGtsR2N4UzBYMDljOHI4TFJydFZYTkhucVlXeHMxWTdZT0NKZDZD?=
 =?utf-8?B?N0NiL2RXMGZCRDl5K3kwYXFHemVpWDZKVWNmdXQvdjhud3ozUE1Jby93cW1S?=
 =?utf-8?B?QTVuRENsNVpkRThBQ0R5bjZWNW80R2wvVWpTcUwwRlpNSUZ3MDdja2Y0RGsr?=
 =?utf-8?B?bXBMREZseUtuNlhKOHpTMUd6YnB5SlBOazVuaDhYZnFYQ1FsbGZXOVBWbGZl?=
 =?utf-8?B?dWlqZ3ZIYmFpQkhjRXpobzN0ZW1CT2RlNktmWkowNXh4ekJmcFFiWlYwczVR?=
 =?utf-8?B?dTFoV2xUL2ZKVFJNakVaQ3lGQ3k2d0RmTG5UZkh6Y2ZyQWtVdXRTS2lhWEh2?=
 =?utf-8?B?dXFpUE9UQU1qQXoyTTlDVFExU1R0Sm9RQ1J4ckYyUWNzbmxVbDhPZ2czZ3FM?=
 =?utf-8?B?YlNESkN6dngvWjJUSU4xYzlXQkJCbWE0cTVONVRSaFBpVEFWT2Z0UWZLS0VD?=
 =?utf-8?B?K1lXYXl5ZnhvcWhHZVhaOGNIYXA5SUFmQUNIZlN6MHgwNzgwbHZudisxM3Bm?=
 =?utf-8?B?NFB0cVc0d2toZmdpcWo5Yy85UlFKUWZlUUx2TVBEUnVyOG9xa1VSRUV6alJJ?=
 =?utf-8?B?Ky94N0tjUFZCSDUrOU5vemNLR1EyZUtodGZQc05DajVOVDFGVjZYRzJyaFlX?=
 =?utf-8?B?dnpncVdiWHJEL0NOa05POHNWWWJTWXpiQlBXcTdQdWJ1M2YySHZKU2dWUVph?=
 =?utf-8?B?QzA3dGVBUGk0Vjc1NmI2WkJiR3ZsOFdKMTl3N0FNVlF0RDZhTUhIV3VPR0x0?=
 =?utf-8?B?ZUZSdk9EUzkrZWliNGJkRTJZbUNvR2VuN1VzYUs2L3d5SkhVcHR0QnpWaUl6?=
 =?utf-8?B?TVpiTk1tSVlWdkVnemk2em1BVyt3c2NOS0cvWXR6RXVhUWZ1eXJaQmpkYmp4?=
 =?utf-8?B?T1hMRElMeTBvSHIzaWl2Yllac1FGZEFXWUZiRmk2R3FVVnBZVEtoOEwyM0F4?=
 =?utf-8?B?QXNnYXh4RDZnVmltTDlxS1orWEhUSHlvVmJpcEE2dUdSRGU3V1ZlOWFBSlBu?=
 =?utf-8?B?REpZbGN5Nlo0NlpxOUtUUmhoSDRMMU5CK1NURXdZYk4rR2VmUEI1SDVlSk4z?=
 =?utf-8?B?NFJqVTB0dGxOMjIrV0F5VTVycHQzbmxFNnMyMVNmbVBZeTdiVmJvelVraWN0?=
 =?utf-8?B?NjFncUx2TGhXN3ZQc0J1YlNkWmdKNHJWSndlaUhrNHg5cTdyRytNZzVQK0tq?=
 =?utf-8?B?MG1jUzM4NFV0Y3dtdXQybWdlQ2YxNVBuWXl4b0hkNENZOFpsb1p6dWNhaFpO?=
 =?utf-8?B?TklVUkxDdTV4eUdmWHFqM1B3M3doS1Zaa283T1NDcjlWMlgzaENISlRtWmRM?=
 =?utf-8?B?N25SeWM3c09yaFdUSGFOWFczYlllbXd5MmtadEhYd1F0VGJObjk2QzlVYXpm?=
 =?utf-8?B?L09ENVNIenZCQmM0Z0NPUDM1WjJLZTQ5RHhNYmdCck9XYXI0eHJ2a3lZZVlw?=
 =?utf-8?B?aTU0akR2aU1ZQTVyOHFOeC9vUWFXYXJydWZoZ3V3OUduR0FyaW10OG85eS9i?=
 =?utf-8?B?Rnhtd1JJenFwV09oR0puSW12YjJuSE8wRjRGQTR5RUo4T1lPVk5TQVhpbXN0?=
 =?utf-8?B?TDZaN0dUNGZMQ1UzS3U5QnQ3bWxWMU41SDJCbG95cllSWXZwNE50Tk5XSVV0?=
 =?utf-8?B?U3U2aHBONzVRKzhZU2phVVl6Wlc0MGJLbERvdlczWDBDK0plL0FVdGtUYitX?=
 =?utf-8?B?aUh4WDNwelBBL1pCVm9nd2RaeW5nZm9wbGZvVHBWanVXZmtBUWtheEpkYlpY?=
 =?utf-8?B?NmloUm9ickZncVZBdzlOaW9zdzlpeUlVLzRpNXlDNXJsZnZ0b1pIQ05QdXdj?=
 =?utf-8?B?Qk5SZE5JMWJaaUJtVmk0VkhSUzNoMUc2OGNQL25YZDViYmtYR2t0bU5uL3dw?=
 =?utf-8?Q?M0I8nPmVvtbi+oL+5K1zfSQyrCoMKM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0l5REI5cURHWWN3eHovZWY2MURUVUNFZ2RBdlZLY2NGVjNMSkZXUTR3dVhD?=
 =?utf-8?B?RzVxd3dET2UzR0NhWFZLYzBnaW9HamxaQ0c2MGRQUHV1eVRpMzlERlNkaCt1?=
 =?utf-8?B?SndyYlBROXNqd1Z3bkMvajhTWTRhYUJiYVAyM1NMR3laSFdmK3R6aDVNcTBL?=
 =?utf-8?B?ZklnNzhTcEp2SjJXaUVveGV0QTVoSHBlZmdRdXI2cXdqcElpd2Z5TGtIUGM4?=
 =?utf-8?B?algreHFZbkk4NjM0cGVzdUpjbW1ZcngvUzEramtqd1huL3Z5S3BLeHRDTmQ3?=
 =?utf-8?B?VkxuWHFTNGFuc05TNVI3bUp0K2I3bzFaR09RN3Y5QmRXa2JVbzFWeFYxY0ZN?=
 =?utf-8?B?RllZeG52cnNadjUyV2ZvZkpvalpvRSs0K0tXNmtIZlNMUk9mWXRQVjcyc3Jw?=
 =?utf-8?B?QjVmM1FzMTMwVEdOZkNFZzBBV0JrSDZUSXozVDVLVm40a3B0cXZienErbG1H?=
 =?utf-8?B?eHVieE45ejJoWk1BbEFabjlhUjRtaUxOcEJJVit4cS9TaEllaGhyY3c3WWl3?=
 =?utf-8?B?MXZDRkxXRWlMNUxoZmtCS0NraStnTlErVm50cmxQb0M1YTJjZm5uM0d5ZVlQ?=
 =?utf-8?B?bTk2d0Q0RUpRUG4vS0VjbEM4RThyODgydFRFRzBLUG5PTEZ6dG9sUDNJbjl4?=
 =?utf-8?B?bU1UcDVxaGZJbTRRNCtkY0VPV3NwUmZyQVZtUlY0UGNjU0FlVjdHd1RySlZ0?=
 =?utf-8?B?N3Jic2h2Q01OUWNJSVJhRElHNElLUkZRZUlocHBVMmZxNHAxeDRCY1RoT0VU?=
 =?utf-8?B?T1JMQ29tWE1ubW04MFY0STl2OFoyUnp4Uk9OR2x3M0NUcVlhZTBQUjdha2Ex?=
 =?utf-8?B?cjFSbTVyRWVQSnk2djFaQ0xvTHYzakcxSXc1SWdOT3NlRTVlRWF5UGp3L25T?=
 =?utf-8?B?eHJCMlZJVTA1TmZIQW5LSDFqdDExTzZOVFEyN2QrOUpkRWN5WFNza0FzUWNs?=
 =?utf-8?B?YVBUc2lma0xmSnhNOXNRSExjSEtGWldVeW5Uc3N0R2RGei9kektGcStFcXNt?=
 =?utf-8?B?cno2QUZqUUR2c2dxQ0pGeXJCOGFjUGFDeG1LeFJuZlB4RzJBOFllWm1yK3hS?=
 =?utf-8?B?VmsxbkorZTlOMUVUUUphanVGdjVnK1M5TjlBLzdJd3V4RWYzMk5SSjNnRlNJ?=
 =?utf-8?B?SlNYVGZ3VlN2aHVpekJEVFZPeW5DOUVpVUV3M0Nhbk5KeW5MWVZXTG00QUN1?=
 =?utf-8?B?TTNUVFFYUDVvSnQrVVFaWUVhU2VqY2lSMXdlQ0hENXZNTlVLZnJVT0QveXpk?=
 =?utf-8?B?QXc2S2tYT2ZPWHdudE5vcENjbEtBc3ZaRnJsZjZEVS9rNHMycFF0Q3Y0eStn?=
 =?utf-8?B?Rm5KQlUrK2kzQ1ZNSTYrV0hNVkNoS25UTXZ1ajBwd2xFeURDRnk4UndqOEIx?=
 =?utf-8?B?NjlNVVhueWJMTGNBZFJlc2xTNGN4Nm00U3pqRmxCekFTRzVUMVhFeGR2UVdS?=
 =?utf-8?B?ck1RQ3FHRXQ2b0pEUFh4TnBBUTBvZW1wMlVYWkRkM0s0Si9Uc2FvMWsyTXl0?=
 =?utf-8?B?b2lEUU1SR1dKb3FXTm5pelQxVGVCWU1BZEtnajVDcXZzM1NWemNHTUR6ZWFB?=
 =?utf-8?B?d2FqQmpMVVJpT09Qb2NlZkNsM1pWeGIvMllNOXkzaVJDU2NJMEhSSGdTNUxr?=
 =?utf-8?B?UjY5b2VzT1llMHhwRmRFa2xkYXNkSy95cTVTbk9lRVNjbFVvOEpSeUpWczg4?=
 =?utf-8?B?QlY0dXdCWUxEME5lS0I0VGxhY25Qc3lIR01Id1o0OHBpTGQrYndyRFlwbVYx?=
 =?utf-8?B?ZUdtTzdBd2YwUWUvVjlzZjAxVzBZVjJVYWJ5WUlHTEdVVjg3d3JCWTBuaFRq?=
 =?utf-8?B?eTJCa3lyczc3MHpieG8vWnU0aGI0VFBKTkhHQ0ZuWDQzSlBXYWY2K3lJbXBL?=
 =?utf-8?B?YTRNWnRRS3B5ZmN6ejM2WkVKZXRwYktsWGpNRkV3NUdvNlQ0b2NDajBUcjlH?=
 =?utf-8?B?WmhBWnIydFBiKzgwZzNGZERmY1R2ZEJBYTJLWHp5VS9na1dnRVBFeThHU1dN?=
 =?utf-8?B?azRqTG1VeE1GMElXUUU5UUdpVitnT1BGR1dwN2F4QldyTVF5bE5GNjVoYlZR?=
 =?utf-8?B?dlZvSW12a0ZPZ1VyV3ZlY3o0endhQnphVEFZcGllaEo1RU5YbDBKVnFqMFBI?=
 =?utf-8?B?MzQ3d3Z6MmQycVZCdExXV3JpTDZHT2NqdmsyYjhaMUZrd0s4NCsxaWtGK2FO?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a4ba9e-8986-46ef-463b-08ddfb675a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 12:39:07.5705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKLmpzOk0tOK9Wks4vF4Gq2sMgAEOoKyJAfYO5dHH375wJnlK6/Er+ExFiTlK93ZNweLaO2EohE9k8Ap84oBQT7hwnLuoDFWLDcWwdCSGuc3uVaSCydzxNla0hpT8cMr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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

SGkgQ2hyaXN0b3BoLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
bnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNCwgMjAyNSAxOjQ5IFBNDQo+IFRvOiBLZW1wY3p5
bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IFBpYXRrb3dz
a2ksDQo+IERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+
DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWlrYSBLdW9wcGFsYQ0KPiA8
bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQg
aS1nLXQgNi82XSB0ZXN0cy94ZV9ldWRlYnVnX29ubGluZTogSW1wcm92ZSBpc3N1aW5nDQo+IFNJ
R0lOVCBpbiBzZXQtYnJlYWtwb2ludC1zaWdpbnQtZGVidWdnZXINCj4gDQo+IEhpIERvbWluaWss
DQo+IA0KPiBPbiAyNC4wOS4yMDI1IDA4OjQwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3JvdGU6
DQo+ID4gT24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMDM6MTA6MDJQTSArMDIwMCwgRG9taW5payBL
YXJvbCBQacSFdGtvd3NraQ0KPiB3cm90ZToNCj4gPj4gVXNlIHhlX2V1ZGVidWdfZGVidWdnZXJf
a2lsbCBpbnN0ZWFkIG9mIHB0aHJlYWRfa2lsbC4gV2FpdCBmb3IgdGhlDQo+ID4+IFNJR0lOVCBo
YW5kbGluZyB0byBjb21wbGV0ZSBiZWZvcmUgY2xvc2luZyB0aGUgZGVidWdnZXIgZmQgdG8gYXZv
aWQNCj4gPj4gdHJpcHBpbmcgb3ZlciBhc3NlcnRzLiBJc3N1ZSBzb21lIFNJR1RFUk0gc2lnbmFs
cyBpbiBxdWljayBzdWNjZXNzaW9uDQo+ID4+IGJlZm9yZSBTSUdJTlQgdG8gcmFpc2UgdGhlIG9k
ZHMgb2YgaGl0dGluZyB0aGUgaW9jdGwuDQo+IA0KPiBTbyBhcyBzdGF0ZWQgcHJldmlvdXNseSAt
IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyBzdXBwb3NlZA0KPiB0byB3b3Jr
Lg0KDQpUaGUgd2F5IG9mIHNpZ25hbCBkZWxpdmVyeSBpcyByZXdyaXR0ZW4gc28gd2UgZG9uJ3Qg
Y2FsbCBwdGhyZWFkX2V4aXQgaW5zaWRlDQphIGNyaXRpY2FsIHNlY3Rpb24sIHBvc3NpYmx5IGV2
ZW4gb3V0c2lkZSBvZiBJR1QgKGdsaWJjKS4gSW5zdGVhZCwgdmFyaWFibGVzDQphcmUgdG9nZ2xl
ZCBpbnNpZGUgdGhlIHNpZ25hbCBoYW5kbGVyLCBhbmQgZm9yIHRoYXQsIHdlIG5lZWQgYWNjZXNz
IHRvDQpkZWJ1Z2dlciBzdHJ1Y3R1cmUgc29tZWhvdy4gUGF0Y2ggNS82IGludHJvZHVjZXMgYSBo
ZWxwZXIgd2l0aA0KcHRocmVhZF9zaWdxdWV1ZSB0aGF0IGRvZXMganVzdCB0aGF0Lg0KDQo+IA0K
PiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpDQo+IDxk
b21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICB0ZXN0
cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIHwgOSArKysrKysrKy0NCj4gPj4gICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+DQo+ID4+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+IGIvdGVzdHMvaW50ZWwv
eGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiA+PiBpbmRleCBhYTU4ZTVmOTkuLjJkYjFjNWJlZiAxMDA2
NDQNCj4gPj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiA+PiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ID4+IEBAIC0xNjAwLDcgKzE2MDAs
MTQgQEAgc3RhdGljIHZvaWQNCj4gdGVzdF9zZXRfYnJlYWtwb2ludF9vbmxpbmVfc2lnaW50X2Rl
YnVnZ2VyKGludCBmZCwNCj4gPj4gICAJCWVsc2UgaWYgKGV2ZW50X2NvdW50ID4gMCAmJiBldmVu
dF9jb3VudCA8IGV2ZW50c19tYXgpDQo+ID4+ICAgCQkJc2lnaW50c19kdXJpbmdfdGVzdCsrOw0K
PiA+Pg0KPiA+PiAtCQlpZ3RfYXNzZXJ0X2VxKHB0aHJlYWRfa2lsbChzLT5kZWJ1Z2dlci0+d29y
a2VyX3RocmVhZCwNCj4gU0lHSU5UKSwgMCk7DQo+ID4NCj4gPiBJIHdvdWxkIGFkZCBjb21tZW50
IGFib3V0IHdoYXQgU0lHVEVSTSBkb2VzIGluIHRoaXMgY2FzZS4NCj4gPiBJIGtub3cgaXQgaXMg
aW4gY29tbWl0IG1lc3NhZ2UsIGJ1dCByZWFkaW5nIGl0IGluIHRoZSBjb2RlDQo+ID4gaW5zdGVh
ZCBvZiBkaWdnaW5nIGluIGNvbW1pdCBsb2dzIGlzIGZhc3Rlci4NCj4gPg0KPiA+PiArCQlmb3Ig
KGludCBpID0gMDsgaSA8IDUwOyBpKyspIHsNCj4gPg0KPiA+IERlZmluZSBzb21lIHNlbGYtZXhw
bGFpbiBtYWNybywgbGlrZToNCj4gPg0KPiA+ICNkZWZpbmUgU0lHVEVSTV9UUklFUyA1MA0KPiA+
DQo+ID4+ICsJCQl4ZV9ldWRlYnVnX2RlYnVnZ2VyX2tpbGwocy0+ZGVidWdnZXIsIFNJR1RFUk0p
Ow0KPiANCj4gVG8gbWUgaXQgbG9va3MgbGlrZSB0aGlzIGlzIGVzdGFibGlzaGluZyBzb21lIGFs
dGVybmF0aXZlIGNvbW11bmljYXRpb24NCj4gYmV0d2VlbiB0aGUgc2Vzc2lvbiB0aHJlYWQgYW5k
IHdvcmtlciBsb29wIHRocm91Z2ggc2lnbmFscyB0byBza2lwDQo+IHdhaXRpbmcgb24gJ3BvbGwn
LiBCdXQgaWYgd2UgU0lHVEVSTSBwb2xsLCB4ZV9ldWRlYnVnX3JlYWRfZXZlbnQgd29uJ3QNCj4g
Z2V0IGNhbGxlZCBhbnl3YXkuIEkgbWF5IGJlIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUgc28gSSB3
b3VsZCBhcHByZWNpYXRlDQo+IHNvbWUgZXhwbGFuYXRpb24uDQoNClRoaXMgY2FsbHMgYmFjayB0
byB0aGUgb3JpZ2luYWwgaWRlYSBvZiB0aGlzIHRlc3QgdGhhdCB3YXMgbWVhbnQgdG8gc2hvb3QN
CmEgbG90IG9mIFNJR0lOVHMgYXQgdGhlIGRlYnVnZ2VyLCB3aXRoIHBvc3NpYmlsaXR5IG9mIGJl
aW5nIGluIHRoZSBtaWRkbGUNCm9mIGlvY3RsLiBXZSdyZSBqdXN0IHNsaWdodGx5IGluY3JlYXNp
bmcgdGhhdCBwb3NzaWJpbGl0eS4NCg0KVGhlIHNob290aW5nIGlzIGFmdGVyIHJhbmRvbSAwLTEu
MSBhdmVyYWdlIHNldC1icmVha3BvaW50IHRlc3QgdGltZSwgc28NCmV2ZW50dWFsbHkgd2Ugc2hv
dWxkIHN1Y2NlZWQuIExldCdzIHNheSB3ZSBzdGFydCBzaG9vdGluZyBTSUdURVJNcyBmb2xsb3dl
ZA0KYnkgU0lHSU5UIHNvbWV3aGVyZSBpbiB0aGUgbWlkZGxlIChmb3IgZXhhbXBsZSwgYWZ0ZXIg
d2FpdGluZyBmb3IgMC41DQphdmVyYWdlIHNldC1icmVha3BvaW50IHRlc3QgdGltZSkuIFdlIGRv
bid0IHJlYWxseSBjYXJlIGFib3V0DQp4ZV9ldWRlYnVnX3JlYWRfZXZlbnQgZnJvbSBub3cgb247
IHdlIGp1c3QgbG9vayBpZiB0aGUga2VybmVsIHN1cnZpdmVzIGl0DQphbmQgd2UncmUgdHJ5aW5n
IG5vdCB0byBicmluZyB0aGUgd2hvbGUgSUdUIGluZnJhc3RydWN0dXJlIGRvd24gaWYgdGhlDQpr
ZXJuZWwgaXMgb2sgLSBhbmQgd2l0aG91dCB0aGlzIHNlcmllcywgd2UgaGF2ZSBvY2Nhc2lvbmFs
IGRlYWRsb2NrcyBhbmQNCnJhbmRvbSBmYWlsZWQgYXNzZXJ0cy4NCg0KVGhhbmtzLA0KRG9taW5p
ayBLYXJvbA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RvcGgNCj4gPj4gKwkJCXVzbGVlcChy
YW5kKCkgJSAxMDAwKTsNCj4gPj4gKwkJfQ0KPiA+PiArCQl4ZV9ldWRlYnVnX2RlYnVnZ2VyX2tp
bGwocy0+ZGVidWdnZXIsIFNJR0lOVCk7DQo+ID4+ICsJCS8qIFhYWDogRG9uJ3QgY2xvc2UgZGVi
dWdnZXIgZmQgYmVmb3JlIGl0IGRpZXMgKi8NCj4gPg0KPiA+IFJlbW92ZSBYWFgsIHRoaXMgY29t
bWVudCB3aGF0IGl0IGRvZXMgaXMgZmluZS4NCj4gPg0KPiA+IFdpdGggYWJvdmUgbml0cyBhZGRy
ZXNzZWQ6DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+ID4NCj4gPiAtLQ0KPiA+IFpiaWduaWV3DQo+
ID4NCj4gPj4gKwkJd2hpbGUgKCFzLT5kZWJ1Z2dlci0+aGFuZGxlZF9zaWdpbnQpDQo+ID4+ICsJ
CQl1c2xlZXAoMTAwMCk7DQo+ID4+ICAgCQljbG9zZShzLT5kZWJ1Z2dlci0+ZmQpOw0KPiA+Pg0K
PiA+PiAgIAkJaWd0X2Fzc2VydF9lcShSRUFEX09OQ0Uocy0+ZGVidWdnZXItPndvcmtlcl9zdGF0
ZSksDQo+IERFQlVHR0VSX1dPUktFUl9BQ1RJVkUpOw0KPiA+PiAtLQ0KPiA+PiAyLjM0LjENCj4g
Pj4NCg0K
