Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD362D69108
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A98310E13B;
	Thu, 28 Nov 2024 13:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kO6py/DZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DA310E13B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732799433; x=1764335433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GdG20EYCGVS4Wa/cw4ce+VSnAVUa3xoHshnjqQtec7s=;
 b=kO6py/DZOHSPyt6aEuWXxOC0cyhWCTsvKLxuHISmhQftTcRhF8Na4lqI
 AHf5KRbeOKIoobqJbKzcvAU4h0wpUc22ln22RyMR/l4k5Vfhk9q8mkKwg
 K4B6hKkI3uB1gll5ewbfX8Jlky+HR63NTSSL35He0V6VsHBdfvNI5Vsyp
 6Z/qSNJLiXdpUvhFZOHdFP+JFKl/OX2k6NnNHmGR/1Jt+bLkUjt2iPIqQ
 afLeb1Rq537b1OyEbDMo4I7RaZQzTI/D58HyE9pdPUnztlFqME66KmA57
 PAAHKiMxw6P80ytyJfRz75mKvj1QUj56p5VjaX9YIy6II8z+YGlrlqZKS g==;
X-CSE-ConnectionGUID: XozLypxjQJyG+cLtNoCdHA==
X-CSE-MsgGUID: Eg1nAh2JTR6OjOqqMmnqjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33086866"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33086866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:10:33 -0800
X-CSE-ConnectionGUID: CPGNrXU4TiGOUeiGIqz+Kw==
X-CSE-MsgGUID: agOKQE8qQZKiypXXOdqoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="96998444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 05:10:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 05:10:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 05:10:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 05:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EutrgQLavcSxNYs+BFqPcFk7bLvDBw8pGwKP6RaDQAjHLsNmURX2aYUkf+7VXGMWY5RRdM8xo1gRiPooWItj9HHG/AIo+6r04AtJ3QBmkZqmR/S0GFvVIw7VNLeHfehqioTrbvdkkFw3YngTJ8q1NdWoWU8dKVDyu3IOIR02QyL152W6FtNMcdz3oN6HBJiwWyCXfI12NMoG8WuzMVz4wYbyEDrbMsAqmGU7hIjwNiOymDUF+XbXPf0owmbWOZpDwye8426rcWukzBe+/0tTS2lWqj4VQs8DS4qkGCO7D9xe1cdpnsok+MXm8+pioDrfh0Cei1mDkrN/ezEi0vQk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdG20EYCGVS4Wa/cw4ce+VSnAVUa3xoHshnjqQtec7s=;
 b=Gj+6jLSyxW4p0P4+6P2S5o2z9hqHN/D/nHxRvQn3j0ak2Ku9BGR50LCrDqtN3HwQ8n82zqn3UOnt17WlmqWlbvWH+aLtdEf402If81QkzKxARK1AGQLzpBK/naVUIC5k4ye7lkk9pvFga3Ch1B+sfBlgFHXTI/dj309nikwx8oYZeIk0uz77dTOqwp+IodSeOPZZd7WlvrFromMZC2TzJL0vBcXMmBRBX2YXR5nWrdUjID4LnIj2J7F7tbPvuLHY4ixzDjBDaj/+GTmhCK7mlQi8my6EM9o3vsrDgR8zJXhwT7VHZTn8miZWBGchcUWXU9Qe4lJvR1pifaAJ+m3oJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 13:10:29 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 13:10:29 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Maslak, 
 Jan" <jan.maslak@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Topic: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Index: AQHbQZY+w+bd3bC6ZEmtH/oqa6RV/7LMqpgA
Date: Thu, 28 Nov 2024 13:10:29 +0000
Message-ID: <0260e385cb7c77c4ec3905fed9e9f87aff1ceb99.camel@intel.com>
References: <20241128130503.241328-1-jan.maslak@intel.com>
 <20241128130503.241328-3-jan.maslak@intel.com>
In-Reply-To: <20241128130503.241328-3-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DM4PR11MB7326:EE_
x-ms-office365-filtering-correlation-id: 79d90216-bb26-44d9-a043-08dd0fae0812
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MzhFSlNhMWhGMlY5YmFBSURSMzg1TTRBY0tZVWFFMUw4OHFwNWx6a0pRZkph?=
 =?utf-8?B?OE5OTWZhOTNETWFPTXJSeWtQMmFFcU1nMTdxNWN4bUR2SlVIUm5KZ0IxeEta?=
 =?utf-8?B?QkkzczFwbmdTQVZMMFBFdEhDYTRidHZzNGQwTVRBV293S2d0UUVpVmZ4Sy9H?=
 =?utf-8?B?WmhsOVRiNVdNQ1QzaE9oVStWWU1DdEswNjNacU9HTHRnQSs2MktrOHJZYk9r?=
 =?utf-8?B?VDRBNGVHa3RyVkwvaHczVnpYQ3ZRYWpTTk03ZFdjOXpNTHpYWVZaMVdCcGpn?=
 =?utf-8?B?N3VoMHcxakRvYjRxZlExWUI0ZzVjWElHR3czNTNUbVp4cEpvclV6bTNCQVg0?=
 =?utf-8?B?RExVVmhYMHJjYWpIMUl5a0ZZZlV4blkyaWFoazYyUHpOdjlkRk9TY1hxcFNM?=
 =?utf-8?B?VStYN0pQeG90V1hUSTNtYVE3UDdxSlpqNTNXZkFmRDFuazBoUFBnQjRPeGtQ?=
 =?utf-8?B?SFVtck9jU3Z5QWprVWFVZ0loM21ZSHdFalRwdUErU0ZzNWFrUXA3KzRjN1dW?=
 =?utf-8?B?cVhkV1Yra1lISU84ZVVWWjJmbjhFOVpST2pycmY0aU9RcmVPSitMSncvZ2hx?=
 =?utf-8?B?b2czNTJhTUYvNnNNUnBaT0pVZFhGTUJDWFZiR09uOVNOcDkyNkVKK3BVL3Zh?=
 =?utf-8?B?Snd1SDRaeW1jUTNIYWNOYSs5VTQ1a2JxajhyT3pWWlNTWUNRQXdPRCtlTWU1?=
 =?utf-8?B?UDY5T3R0cWg1NUg5TnRXZDFoUFVKUTgwbEdxQ0Z2eFBqUjlQb3Fvbnovajhh?=
 =?utf-8?B?cU01aHJSbEVWOGM5TzQzZXNFa25HTzAyTnFYNFp2emlXcXFMQzQ5SDlIdVpK?=
 =?utf-8?B?ZEJhU1dDcXk3aGtQRkM5elBpWGxnUjRnRERhTXIxbUlpczBWRmJCKzlXUXIv?=
 =?utf-8?B?L2pIcFFtYm9lSytLQ2g5ZkpSd0RwaWovMWllNUltc2UvclR1WlRRVkdtdEti?=
 =?utf-8?B?dDl3WHRCTFZhZ1RuRGRyS3pSQ1NoYXBVWTg3cEZTSnM2MnlhRkNhdmZHc25V?=
 =?utf-8?B?OEI5V1c4c2RlclUrNXEwMjJMOFAvZTFTQ214THRVWFFMMG5ldzc0T2VOcEFo?=
 =?utf-8?B?R3dWdEdWWVJuSGQvdFpjeEFralI4cmppMmtLaVpsOE1JYWtMNnc3bW5vcGtH?=
 =?utf-8?B?YXlTNVl0T1ZCbk96YjZrSm1oSkF6cVZmYUU1RHVvOE1CN2JEZ1l3dU9ZZXor?=
 =?utf-8?B?WGFtaE5QVVBLWDJsdERCeEU0WFpZeHZWeUdNSmozbHhhbUIrL29Udk1PWSt5?=
 =?utf-8?B?eG5wNkRNeFMxSHBlbXpvMXVtWWFoS2hveGJyMUlWUXhqTGxIbW5OYVBIbWMy?=
 =?utf-8?B?Mnc2K2NmOWVvYkk5aFhxMlFuWWtwZ2o1L2FrUDBxeVBEZlF2QlRmNXVqS3I0?=
 =?utf-8?B?cUNoZDVtYUwvMDd2Zjc0RlFxd0wvZkl5SDRVL3VlWURKUzZwRlovVDFnWGxX?=
 =?utf-8?B?b01oVjlOT0ZRM3M0YzBhNzRmMFI1UmVYWm5DNGhtdStLUlBvaVlYbi9pMlZS?=
 =?utf-8?B?ZVZLdFdKNzEwNlR0Z2VQcER3TDRaNmluU0tWZUNCMStTLzl3TjZQTEFJWGRB?=
 =?utf-8?B?eXJLbmtzbnFSOTdqcEtyVHpyYnp1TUtXVlZEMEM3S3JHZXVucmZsKzF1c0Q0?=
 =?utf-8?B?bzhFaXI1Z292U09yR293VjNCK3M1QXhjSFd2ZytuY2JIdi9RdWFCVzZBWVpq?=
 =?utf-8?B?Nk5oVGRhaStETlJnMGg3MUxDbTh0ay9QMm5jSFhTOHpPc280VlZDZ0E0bmNG?=
 =?utf-8?B?dC9hSFBsYVRhVFlVSW9XaXVSMjFEdGtPdjFCRzZEd0VjQVZnSi9NSnZ1a09F?=
 =?utf-8?B?WktTQkFpa3hTbGhTdWsrZXBRekFFTXl0WG1UL01CV1Joa2Jsa0JMa3JKYkVz?=
 =?utf-8?B?Tjk3MEdiak14UlJBMkxuckhqL0l2bGFydmFhbmJaUC9qaVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDBLMWxpcFFoUm1Ra0RGSTVka1JyWmhzZ3hibTVwVFQ2RDVUTTlvN2xGdFl6?=
 =?utf-8?B?UVJKMUtmWjh0YmEvZTVwc3FibGMzSGdQbWpTMkVZRU5JUGFWekU0MlFjbkJJ?=
 =?utf-8?B?dWZhb2UydGl1RmJhaUJUc3pITkEzMXpXUGFnOVJHeWt1ZG9EQmt4MGdaOThX?=
 =?utf-8?B?S3l6dldMSmNmSW5sWjFsM0xrVG1LbzBYeXRrZDN5Wi9YUDhqZUVwT29qcU9Z?=
 =?utf-8?B?M3NWWXBSdGdzNTB0T2FlN3VjUWZIMFNFYy9mS21LdWwzKzZNRi9HMTNIaEtL?=
 =?utf-8?B?OHBzRFN4dmp0UWJMdHdHbG16MkpEM3A1V3ZNWFBUS0w5V0ZueXM4VWZvbkgw?=
 =?utf-8?B?dUxLa0s3QXRxdmtyanZqTlBCTzRHN1l0V0V4b1A0aHlHUWJlN1p1QlplK2xB?=
 =?utf-8?B?N3pSczVtYXRPbHJnS1ZMNWQ0QldPaVZJb0MzMDRoQjBpLy84OHRFcTg3MWNp?=
 =?utf-8?B?YWE1cWpVUjBUUEh1bzBYcUtCeERWT0l3SjZlMWI2dUpLL0Mzcy9CY1FDcmpi?=
 =?utf-8?B?UDcxT3UvaEJDUXdEa1d5TmtydG9QOHh3TG1CSmwxNlFnQ1ZJSVc4MHFJanZx?=
 =?utf-8?B?SDEwWUYxZDRnU2pTOGowT0pXK21qTHpkTFhtaHQ1Z2JsdnZ3eFBqR3dtWlU5?=
 =?utf-8?B?c2h0aVVScTBmdjNYZTAxY08wN1lrM09ucGdXZGY5M0VRNUxLSVlXR1l4cmJa?=
 =?utf-8?B?d2JvOGRpaUZNQWljNnV3S0lMZWpnRVQwZ3dHeDJ1bFZ2c1FabDNPRklXV1lW?=
 =?utf-8?B?b2dKNmN6WVY1c0M1c1h5Z0s5M084OWpEbjRndWxUMlQwdmYvYVJESGtyWE1w?=
 =?utf-8?B?YnVHc1VKYVE2T1dCdHFFY2xyNHpvdXplSU9kSkcwMS9McmY0dUdsQVN5L2h5?=
 =?utf-8?B?emxRd2JIWE5qNitWOG1VZjU4amdXK0pWSWd5TTdTTW1OOHdnODlDUGZDTnVQ?=
 =?utf-8?B?SVNiQ3VvcW1zcWROZkxab1E2dlVVTldTNThVSWJQOG9BNnZLOVFzbDhESFpq?=
 =?utf-8?B?MTVkSXpPRkZWMTZmZjQwQ1lRcCtLdkd2Z3JzYTE4WDV2Tlg0a0V4K0RoUmJt?=
 =?utf-8?B?OWZuQ2ZMTWRlSTlhWlFBTkJRR05KQ3RwQXpHRkRDY0p4UnpkQWttQWxRN0di?=
 =?utf-8?B?ZHNsT2REeGF3UytXVlFucXN3Q0FQRUdkVWVRMkhXWjBkaG1aNDVGVWhyVkl3?=
 =?utf-8?B?WlBpZ0FpS1NFMjFsbFEzckNIMG1iZGdWVEpRbit0ZEVLd0JOckhVeXVBWWtw?=
 =?utf-8?B?b05lUHhsWmVDclFKcGtLMnBrRk0zeE5PSVJ1UEQ1RGxCRTZpVjhXbjN1NDhu?=
 =?utf-8?B?VFc5MGhONlZPVHhHME00aUJYa1g1VVlzL3Y1L0RwTk0wbVVocWh5NVFrUjNT?=
 =?utf-8?B?UmkzRGNRN0c5aE1PY25ocWNveVBSa3luVlpNcWljUmhnK1VpSEVBNksyMmhy?=
 =?utf-8?B?WFpEQVdlK3FDdUdNWWJ4UDY3eUhoTGI2aXNpMWZHK09rTUo3bDhCWVZLUm5a?=
 =?utf-8?B?d3J3MlJaY3RrdDI2ZWFCM25WQk5PcXpBR0xaZlRURzV5NlRHOXdtMENZcVRZ?=
 =?utf-8?B?UmViTy9tMEhUalBrV1Y5bWVDSVIvaUlCeGFIM0twNWh3ZmFoR1ZMd1crU21M?=
 =?utf-8?B?czNXVnVMRGp0MEF1NitoTUR4Y0Jua1FJYk4yeUZqYmplRmlLS3UwL3lJUi95?=
 =?utf-8?B?K1NKd2ptbXAxdXVOUTA4RVZRRGUyZHdkY1JkMUFFL0thR1ZuM1Nrd00zajd1?=
 =?utf-8?B?ZERFNHBsTzVZbGdiUWRTMlYvdnBaNGMwVHp5T1B5bzdSMjhqc2VZRnRXZGNR?=
 =?utf-8?B?S1NjbG05Rkh6OWZoZFVtaWw2OHUvSlAyK0lqcExadlZQWU9zbVJjbW5ZWk1y?=
 =?utf-8?B?aWxRcUt1aWliNUNSS1JOM1RXK0ttYnh2bzcwUkJTSU5EL2g3SnFyT05DTExI?=
 =?utf-8?B?WnRqbUJoY2xFWWwwUmpQNXNmaU93SU85MDY2ZzJKaEFpeG1vbWpXT3ZYUnhE?=
 =?utf-8?B?ZDA1YWZXZTVhVE9rVG5lZkliMEFacjUwMUJERVhVYTdnQ2IvMVUzK3p6c24x?=
 =?utf-8?B?YUFoTmVOZG5rblhDN1k5aUlpWEVvUHFtQVdqQVdKSU1WQkhsVEpRYTZxQ3FQ?=
 =?utf-8?B?ZUpGajJHYVRZKzZ1anM5NXRUV0FNQjZvVkNqbk5yNzFYU2VsN0JUQllteldC?=
 =?utf-8?Q?SnEHHYcfEaNW7xMpLYeob/s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58CC955988A2D74A9107038CAA5AC5B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d90216-bb26-44d9-a043-08dd0fae0812
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 13:10:29.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6iSFQa9p2GFOnJjiHTDCJVwLgaoCQNK0QvhRFinQrofX3j4rDX1PYH/03Ln2Z+89gxvunRlucrjUC5Ly8Ex2GNjpsWoDT8vDXsUsqSqbI3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
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

T24gVGh1LCAyMDI0LTExLTI4IGF0IDEzOjA1ICswMDAwLCBKYW4gTWFzbGFrIHdyb3RlOg0KPiBB
ZGQgYSBuZXcgaGVscGVyIGZ1bmN0aW9uLCB4ZV9od19jb25maWdfbG9va3VwX3ZhbHVlKCksIHRo
YXQNCj4gcmV0dXJucyBhIHBvaW50ZXIgdG8gdGhlIHZhbHVlIG9mIGEgZ2l2ZW4gaHdjb25maWcg
YXR0cmlidXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIE1hc2xhayA8amFuLm1hc2xha0Bp
bnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21p
bmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi94ZS94ZV9xdWVyeS5jIHwg
MzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBsaWIveGUveGVf
cXVlcnkuaCB8ICAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94ZS94ZV9xdWVyeS5jDQo+
IGluZGV4IDQ5YmVkMDMzYi4uZjM3MzFkOWQzIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfcXVl
cnkuYw0KPiArKysgYi9saWIveGUveGVfcXVlcnkuYw0KPiBAQCAtODM5LDYgKzgzOSw0NSBAQCB1
aW50MTZfdCB4ZV9ndF9nZXRfdGlsZV9pZChpbnQgZmQsIGludCBndCkNCj4gIAlyZXR1cm4geGVf
ZGV2LT5ndF9saXN0LT5ndF9saXN0W2d0XS50aWxlX2lkOw0KPiAgfQ0KPiAgDQo+ICsvKioNCj4g
KyAqIHhlX2h3Y29uZmlnX2xvb2t1cF92YWx1ZToNCj4gKyAqIEBmZDogeGUgZGV2aWNlIGZkDQo+
ICsgKiBAYXR0cmlidXRlOiBod2NvbmZpZyBhdHRyaWJ1dGUgaWQNCj4gKyAqIEBsZW46IHBvaW50
ZXIgdG8gc3RvcmUgbGVuZ3RoIG9mIHRoZSB2YWx1ZSAoaW4gdWludDMyX3Qgc2l6ZWQgZWxlbWVu
dHMpDQo+ICsgKg0KPiArICogUmV0dXJucyBhIHBvaW50ZXIgdG8gdGhlIHZhbHVlIG9mIHRoZSBo
d2NvbmZpZyBhdHRyaWJ1dGUgQGF0dHJpYnV0ZSBhbmQNCj4gKyAqIHdyaXRlcyB0aGUgbnVtYmVy
IG9mIHVpbnQzMl90IGVsZW1lbnRzIGluZGljYXRpbmcgdGhlIGxlbmd0aCBvZiB0aGUgdmFsdWUg
dG8gQGxlbi4NCj4gKyAqLw0KPiArdWludDMyX3QgKnhlX2h3Y29uZmlnX2xvb2t1cF92YWx1ZShp
bnQgZmQsIGVudW0gaW50ZWxfaHdjb25maWcgYXR0cmlidXRlLCB1aW50MzJfdCAqbGVuKQ0KPiAr
ew0KPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldjsNCj4gKwl1aW50MzJfdCAqaHdjb25maWc7
DQo+ICsJdWludDMyX3QgcG9zLCBod2NvbmZpZ19sZW47DQo+ICsNCj4gKwl4ZV9kZXYgPSBmaW5k
X2luX2NhY2hlKGZkKTsNCj4gKwlpZ3RfYXNzZXJ0KHhlX2Rldik7DQo+ICsNCj4gKwlod2NvbmZp
ZyA9IHhlX2Rldi0+aHdjb25maWc7DQo+ICsJaWd0X2Fzc2VydChod2NvbmZpZyk7DQo+ICsNCj4g
KwkvKiBFeHRyYWN0IHRoZSB2YWx1ZSBmcm9tIHRoZSBod2NvbmZpZyAqLw0KPiArCXBvcyA9IDA7
DQo+ICsJaHdjb25maWdfbGVuID0geGVfZGV2LT5od2NvbmZpZ19zaXplIC8gc2l6ZW9mKHVpbnQz
Ml90KTsNCj4gKwl3aGlsZSAocG9zICsgMiA8IGh3Y29uZmlnX2xlbikgew0KPiArCQl1aW50MzJf
dCBhdHRyaWJ1dGVfaWQgPSBod2NvbmZpZ1twb3NdOw0KPiArCQl1aW50MzJfdCBhdHRyaWJ1dGVf
bGVuID0gaHdjb25maWdbcG9zICsgMV07DQo+ICsJCXVpbnQzMl90ICphdHRyaWJ1dGVfZGF0YSA9
ICZod2NvbmZpZ1twb3MgKyAyXTsNCj4gKw0KPiArCQlpZiAoYXR0cmlidXRlX2lkID09IGF0dHJp
YnV0ZSkgew0KPiArCQkJKmxlbiA9IGF0dHJpYnV0ZV9sZW47DQo+ICsJCQlyZXR1cm4gYXR0cmli
dXRlX2RhdGE7DQo+ICsJCX0NCj4gKwkJcG9zICs9IDIgKyBhdHRyaWJ1dGVfbGVuOw0KPiArCX0N
Cj4gKw0KPiArCXJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+ICBpZ3RfY29uc3RydWN0b3INCj4g
IHsNCj4gIAl4ZV9kZXZpY2VfY2FjaGVfaW5pdCgpOw0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hl
X3F1ZXJ5LmggYi9saWIveGUveGVfcXVlcnkuaA0KPiBpbmRleCBmODgzNjU3OGUuLjMwZWE1YWQ0
MSAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmgNCj4gKysrIGIvbGliL3hlL3hlX3F1
ZXJ5LmgNCj4gQEAgLTE1LDYgKzE1LDcgQEANCj4gICNpbmNsdWRlICJpZ3RfYXV4LmgiDQo+ICAj
aW5jbHVkZSAiaWd0X2xpc3QuaCINCj4gICNpbmNsdWRlICJpZ3Rfc2l6ZXMuaCINCj4gKyNpbmNs
dWRlICJpbnRlbF9od2NvbmZpZ190eXBlcy5oIg0KPiAgDQo+ICAjZGVmaW5lIFhFX0RFRkFVTFRf
QUxJR05NRU5UICAgICAgICAgICBTWl80Sw0KPiAgI2RlZmluZSBYRV9ERUZBVUxUX0FMSUdOTUVO
VF82NEsgICAgICAgU1pfNjRLDQo+IEBAIC0xMTgsNiArMTE5LDcgQEAgc3RydWN0IGRybV94ZV9l
bmdpbmUgKnhlX2ZpbmRfZW5naW5lX2J5X2NsYXNzKGludCBmZCwgdWludDE2X3QgZW5naW5lX2Ns
YXNzKTsNCj4gIGJvb2wgeGVfaGFzX21lZGlhX2d0KGludCBmZCk7DQo+ICBib29sIHhlX2lzX21l
ZGlhX2d0KGludCBmZCwgaW50IGd0KTsNCj4gIHVpbnQxNl90IHhlX2d0X2dldF90aWxlX2lkKGlu
dCBmZCwgaW50IGd0KTsNCj4gK3VpbnQzMl90ICp4ZV9od2NvbmZpZ19sb29rdXBfdmFsdWUoaW50
IGZkLCBlbnVtIGludGVsX2h3Y29uZmlnIGF0dHJpYnV0ZSwgdWludDMyX3QgKmxlbik7DQo+ICAN
Cj4gIHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldmljZV9nZXQoaW50IGZkKTsNCj4gIHZvaWQgeGVf
ZGV2aWNlX3B1dChpbnQgZmQpOw0KDQo=
