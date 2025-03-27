Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF62CC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 15:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773B410E90A;
	Thu, 27 Mar 2025 15:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iassGQjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78910E90A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743089014; x=1774625014;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wX9K9E3PBeh2z51FELGMCgkt+EzcV3TUusWZHji2uOo=;
 b=iassGQjkdIyohvzzkZql2KBXucnjUtpEbn6W0r/xMBHawQusiRRPZFnf
 7ncanT/U8V2J3vAqrjPx1Y525t5hnmUCw1Eo+yAx9BBeYraAxMop/yiRE
 qkZtz9PncNXqn0znef+qQ+aDmjCC89rVdbv+PuXtLQVkcpQq9M3IekEiC
 2la5Iw3bCrEiISUs4yNlUJVYGGsM3T5I8TlJHfD1/JviLWobNVKxBX5H8
 o6MCAI4dDOO+W1BVd0sLFayOy1J1z93IuuIvzYDFczF0qyxQYCceZ+SVS
 Sb18GJJki3E9tS1tssZ2V8GHhdeUJFoEznfcVh1866Tf/u5EEzbRjS8H4 Q==;
X-CSE-ConnectionGUID: Cbd/+FuLRC6WiyzTLAuw6w==
X-CSE-MsgGUID: Dt4IixUtSVGIyGUTCkpjWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55077624"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55077624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:23:34 -0700
X-CSE-ConnectionGUID: L544BHaDQ3+DucBZnm2mNA==
X-CSE-MsgGUID: gmYHIJEiSxmeVTqj1wzAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125620509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:23:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 08:23:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 08:23:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 08:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c20fhol02LCAKI3B8dPZFHI6NfzfyEazBr41gyLnmXUaPWy2/scKgZ8PJ3+nmVZs4QwAPQAHALd8iOuLOu2boNd08Dcy2W51lwAdYoMqNfwrKMWnOqiIcTxGizEkxjv0kR5Cq62uoIf/+o+d+XmbSi7t6RPtRT6dxdgl44zgxatb6o9ysQgRBXqmy9XomSTppK5oyQEhMwT5uQWOvjI66ewDiLKTCUWLPk6RgKf/EQjCXAStKPL2cDUVdy2G6xmby4W2DOMBdrEUkLrKWkXYBqT0Z9t1xz96RBX6gigxemL7opkSng5XwfxNB7TwcgUtkoRKW0KNibOQNwk2gMP6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX9K9E3PBeh2z51FELGMCgkt+EzcV3TUusWZHji2uOo=;
 b=iUlBcxXNH5JUisSLFs/3FGa2kGN0eBoRgOMElFpW7UZWAQlIxJ7emYz7/fmfKw4b3HpIaxoZURL86p0VJrh8rMoJxYxQiypLgsDECWrnVD9RFiBDIaZxqa+XpfDhaH5jxiPcHyA6yv7ZViVJXLcTfpJE3VfUkf93sa73RmHhtqBrlRtF0aJSZTSHURs/8AjcxM8gguDmZyisEnqpH6cxtNL4kW3KABCB0sVR9uXUE7AWni9clpoyixwcmr8GvkKnEb64i4wBJ69ahnam/I0JPAqilqjHeDxpEftNfeap/iVRxuT3ewekFI0Vh/nDCBFlKf0OdOLQhIzBnc8B8N1ttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:23:30 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:23:30 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4] tests/kms_plane: Add test to validate odd panning
Thread-Topic: [PATCH i-g-t v4] tests/kms_plane: Add test to validate odd
 panning
Thread-Index: AQHbjeI4u30SoHKJYUmvC0EtdwrxR7ODrWSAgAOPIbA=
Date: Thu, 27 Mar 2025 15:23:30 +0000
Message-ID: <IA1PR11MB646741118C16750771377023E3A12@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250305151708.874294-1-nemesa.garg@intel.com>
 <424d20b6-b8b8-4e1c-9967-35f065e67c1b@intel.com>
In-Reply-To: <424d20b6-b8b8-4e1c-9967-35f065e67c1b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH0PR11MB7633:EE_
x-ms-office365-filtering-correlation-id: ef2b2e45-0940-4fd2-7ad0-08dd6d4354a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WjhHQzJ0RDJkcDlOOW1WMGJzTGFaeElqTitVUGpOQWppeGR2WHphSk16UGo4?=
 =?utf-8?B?VU1oYzJLRi96WGdGdmFTVjNZdk1FQzVUN2tqenkyZ3NOd1dEWnVJdEhGTWpW?=
 =?utf-8?B?UFllTFA1RFVKNHRUaWI3dnY4Z3hOeTNITkt6SWhxdWg5N0ptbmtRR0JTejl0?=
 =?utf-8?B?TnNGb2tQMXUzUTJ1OS9WU3ppVUVQNDFFRjliSlNLek9hcGpuY2FGMjMyVEZs?=
 =?utf-8?B?OWVubEdqQ3lIQ01idnJLamw5N3ExSzhHMHpWOG4zaXZsbHJiRGVXSTVYZE1t?=
 =?utf-8?B?RklDVWtvTVRWcHFDaU5vTkFaTEVPb2JPTkJTRW0rN1RTNkp3Rjg5Vzk5VFRx?=
 =?utf-8?B?T1RHSlZ5VnZjMkhmT1Q0NHN4VFYvVUZDQXk0VzY2TG15TVVoKzhwSUhja09m?=
 =?utf-8?B?Q0NVQXpaZDNBM1lGdXpQZlEwSmJKUHlMeWZTYnNRWFhCdjJ0QkhwbkVPQ09h?=
 =?utf-8?B?SEExNGFHbVR5TEpBL0tJcGFsSUo2N0hkT3grb1lJRjNNcEY2c2JqOEs3U0xT?=
 =?utf-8?B?bkl5aDhPMVhPL3FKOUJKVVhEVStkVWsyRGpkZlRvZ2NoVCtsRkNpZ1EveWM2?=
 =?utf-8?B?bGZCdW04R1VXZmRITVJIZTF4UFdabjBUYXBhczVWYThVdndVcEVtM2ZUY2FP?=
 =?utf-8?B?TSs2Y3ZxUFlhbmVGSXVxNTg3Z0dLQ2VuZGpBeFBpK2dNRVVzUXdZRlFwbC9C?=
 =?utf-8?B?Uko2bVM1R3FMWU10Nk0wS2o1c3RmY0ZFTHYxbGRqb3BXajhZek8wV2p0K3kv?=
 =?utf-8?B?VG4yeS9GSlNrY21lSFRBcElLVmIxZ2RIVVl1b2FCM3pIMmNjZk9KZ2ZMa0tw?=
 =?utf-8?B?V0ZiaFh1d0RnSGVVc1BGTWwxRDQrODFmUnQwWHJ3eGxRS1U5blROT3FwOFZ4?=
 =?utf-8?B?UUVHYnpENm56R1RPUnJJMnFrcDI1Y3ZRTjlrRXBCMjAwaXIxdUo1RDFCMjlV?=
 =?utf-8?B?WVUvZFI4OC9HRHVRdHcvUUF4OUJxQzFaUmc5OEZvUGk2bCtIbU5lN3NucGpo?=
 =?utf-8?B?NStYSnNFRm9wclVCa0d0bE1zcUVLcmd5MW5ISUkzbDUwRE5NNDkycW1WZ3VC?=
 =?utf-8?B?ZlZXbmdYQUJFcGRCTnVycnA4clRaMy9JakROMjc1VDRDeGtMaWZibzJPd1Fq?=
 =?utf-8?B?VWVJc2h6NzZpNGwwQUxsczdXVHU3RFhoTUZROTJYWG83TUc0eVpGVytTV21Q?=
 =?utf-8?B?UkRuSUtEbTRhRytHT3VoaDdZQ2lyTzZyNGdSVVJMdDhIUkRzanJJRkY2Uzd4?=
 =?utf-8?B?eEZYTFFDSzBvbEwxeXJxNEtMTFR1WGZEbUNjaVlYR0FYdUZ6cDNRQzhJTHRm?=
 =?utf-8?B?VHdMSkNwbjhWNlJLYnQvL0lIUXEybHBLNGhnSFBZcHQyZnJ5ZCtqeUZuSmg2?=
 =?utf-8?B?UHl0UEs0cGtOend3UUgyS1kxYWxDZEw4QnFOSFpTaWpSNk5sbFlQbEwyMDl1?=
 =?utf-8?B?Y1pScXFCQTZKcFl0R0YydHdZejlVRzFMUWVMRVYrNWl6RFhZekh5c2JucHh6?=
 =?utf-8?B?dHNKR0l3S1Q5TmppRk1SNEdLT0lBMjFhV1FieTRQMHkxbmk2akVob1gyOEcr?=
 =?utf-8?B?WWk2OFFLQmIwdG1TR0pJOWpGaW1IMmhuTk1ORitKcHhuSVREWEg3RU5QMmpT?=
 =?utf-8?B?bmlGcEdtMVJRcisrcnVyRElia2ROWUd2cFZaV0tJazdibUc4aUFNOFNOMUw0?=
 =?utf-8?B?MUhHcHl1UTd0UVVuUTRxNUY4b3Z5djhDeXlQNVo5bFVCREpXNUoxbE9wK0Iy?=
 =?utf-8?B?eTlpVFJnR1hvVFJLU281ZExpSE1uSU04U2JpZVpwbkdYQnMrd1BjUTlla3RI?=
 =?utf-8?B?UVZIdzJONWlDSlQ3Y01Hbm82R01oZDMwZGZIbjFTMDlpa3BGelB0VWl3OXRi?=
 =?utf-8?Q?OmD6pYBjrUDnT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWMzOG1UOERCSkpPc3NQbWhNWlFqaEY4WTJLWjhLVk9UME5ITjQxbWhFUUo1?=
 =?utf-8?B?NGUzZFZySXRDdWp2aVZTUFNsUXZsZlpna0VvanFXR2FEV3p4Zi9VVkh6dnFS?=
 =?utf-8?B?Ym13WjhBeENIL1RnQktEcFZ3eDAyeHZrOXhtaHR1ek8xNStxN0EyRkU3Zmtn?=
 =?utf-8?B?UlpPWlpFZWxUTi9pOFBNVHVZbm9YY3BLdWpETW95N0V5SGo0OXBXM0VRQnEv?=
 =?utf-8?B?Z3dJei93ckNnRms5cERWQnRvNnpRZDFFdHRxYXVIQzVYVTlnR0lZOG5Kc0ky?=
 =?utf-8?B?bTFXZ1RHRkMrc2VrYkhkc2lVRDlyWmtXVUZNUkVrZTlFbUxsbVJXQ0RGV2pi?=
 =?utf-8?B?aWZ0ekN3YmYxT2RaU2o0YUE3YjBTV1RXWmUvMi9EMDdDaU16dzgxdVYrZkc2?=
 =?utf-8?B?ZWs2WmJLUUFXaUtOTER1RlpmWWdDQkVSd0VJeTU3UXdxbkJJRXdENExKemgy?=
 =?utf-8?B?ZXo1UUNzS2hURmtrQzQ0Tk52ZGh3RkxkWEFveVJmR29lVlZQZnlqYWFFZ0RX?=
 =?utf-8?B?eFJDV1ZRTHVQUmU3WVNDMjhuREN5T2RmbkhrQWg1R2NOOWoyNjZkeU94QXBW?=
 =?utf-8?B?YzQraUQrWnpud00vNWdnVGFiNCtWeWpRa3dxcFJxS1B2bG9EUHVDVXR3NlpJ?=
 =?utf-8?B?enJrVmg3SUVrbE1kUzdCYlM0V1Y3cUhwQVNIbk9rMnFJQWxJcGlmQk95Q1lh?=
 =?utf-8?B?QzRiUTVKM2RNbDc2VjUxMGN0UFZCQ1F6MjlDL1dOaURscndrekIxMWRUOXE3?=
 =?utf-8?B?cEpIY3llbDJOcWswKzNtU1MyajcxM2ZyQU5HbXByazlSaUViZ2puQStnejFj?=
 =?utf-8?B?ZEJpY1A5Rnp1K0xkOEd1VUhaQWNVZHFpUXovUVhhN2VzZlE3aUgrOXFDMUFC?=
 =?utf-8?B?Umt2M1grVTlwdTUvMSsxdmUwWm15VjdoRFJSck1iQUIyN1V2eXB0NXlhNXFG?=
 =?utf-8?B?OUpjcE9yS3VzejF0dDg5NTZvSjdTbG9nS3NTY3VXTStFUnY1TU9iRk5zMm5o?=
 =?utf-8?B?UWhPbHNoWVM1eGdnY3ZKdUpqenh2bHc0aExMUENaQVY5NGJhWDhiMTV6clY5?=
 =?utf-8?B?a2JKakNDR3ZoUjlhdVlxdVAzSjNoZWJYMXV2d3I3M0RkbHRuMjFNckRKMkZT?=
 =?utf-8?B?M1E4REN6bThxN1JGMWZscEp0a2RnKzY2aTFhaThiRDJVQXV1QlNtOWp2L2cw?=
 =?utf-8?B?ZWc1Vmg5dHdZS0ZTeXJOczJCY1RtblIxU20vY3dDTkh5bHMweTUvWFloZHh1?=
 =?utf-8?B?VG9vcVUzTVkyZGp4TmN4eWtVWWVCSis2ejBTaXVxV3VPeVgyaG04YmkrcUdn?=
 =?utf-8?B?T0NSV3E5Y014ZW16VnA4UmxaUEVZc2U3K1BjT2tTRkw3WHdhS0VsaDIwR0ts?=
 =?utf-8?B?cWVtaTcwUzU1citTcFlDSWlqSDZtSTBNT0tYSTdnZndCK3VqNFhUbmJDNEIz?=
 =?utf-8?B?S1JsUVVsRnhwUU4zWFZPVU9pYnlDN1FHc0pBakJYUjBaaDhzUmxodHJjM090?=
 =?utf-8?B?ZFhqY2RwRm5YYzROY3hrWjNSYzdmYUMxNkh1VktGRU9rd1ZNR3hWV0dUYnlv?=
 =?utf-8?B?MmdSUXRUcUE3K2pvMHF6UEhCOUQ4SXhSRlVrTVRWRllmQ3JRVDlLbDZCZWF2?=
 =?utf-8?B?M3p6Q2p0M3pxaVcralc2Tmx2WWhOeFA5cHVYVWNhRE5RNUhMclRvdTJ2U0Ns?=
 =?utf-8?B?bEMxckgyK3RnMkorMlVFRmFiQzUzT1BJQkZXUEs0cHp3dG1VbzJBelNxa0l3?=
 =?utf-8?B?Rm1qZjN1VUVTaXp3SlJIa095aEp0VGNiTU45UUdPcUlUaXNuT1dHQ1BSVEor?=
 =?utf-8?B?NTBKUzErbUhDVStWL3U2UEY4QjdWNHRYUHR4QmlJYjBzcVhYQnUrWUNwdWR3?=
 =?utf-8?B?empUdzZHcEsxd1c2TDF6SGNhZFl3bjBhQVgzcHVYYUVJN3dWTldic3ZXUk1C?=
 =?utf-8?B?VnZKSGlWNitKd2ZzOXFzM0JoblBpbU4vcXJFcDJkenZXSXE0b2lpdVk1RlMx?=
 =?utf-8?B?Ni9VUEhJTFdnZ29CZUdMdHptTE40cGdQQXF6bWIzOXd6MGlyeWFmMU11N2N4?=
 =?utf-8?B?MTR0YVRHeWNaVHArdVBnTWdnTHZ5dWZRZ1p3MmE2WHloaWp0cGFmYTNWOW0x?=
 =?utf-8?Q?SHFNv0gJeL6n2tDyzT41R9FT/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2b2e45-0940-4fd2-7ad0-08dd6d4354a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 15:23:30.6437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bA40vACE4Qk5GlfobRf/mc0XMK9zeD1y0aWnPXa4sje/l8SVtIUIhNO7O2Xdd0j59MrImImPZcelKaXbYTBj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBTd2F0aTIg
PHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAyNSwgMjAy
NSAyOjMyIFBNDQo+IFRvOiBHYXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNvbT47IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggaS1nLXQg
djRdIHRlc3RzL2ttc19wbGFuZTogQWRkIHRlc3QgdG8gdmFsaWRhdGUgb2RkDQo+IHBhbm5pbmcN
Cj4gDQo+IEhpIE5lbWVzYQ0KPiANCj4gVGVzdCBzZWVtcyB0byBiZSBmYWlsaW5nIG9uIExOTA0K
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjc4MC9z
aGFyZHMtDQo+IGFsbC5odG1sP3Rlc3RmaWx0ZXI9b2RkLXBhbm5pbmcNCj4gUGxlYXNlIGNoZWNr
Lg0KPiANCkhpIFN3YXRpLA0KU3VyZSB3aWxsIGNoZWNrIG9uY2UuDQoNCj4gT24gMDUtMDMtMjAy
NSAwODo0NyBwbSwgTmVtZXNhIEdhcmcgd3JvdGU6DQo+ID4gVGhpcyBmZWF0dXJlIGNyZWF0ZXMg
YSBOVjEyIHBsYW5lIGhhdmluZyB0d28gZnJhbWVidWZmZXJzIGFuZCBtb3ZpbmcNCj4gPiBpdCB0
byBvZGQgcG9zaXRpb24gYW5kIHRoZW4gZG8gY29udGlub3VzIGZsaXAgYWxvbmcgd2l0aCB0aGUg
Y2hhbmdlIGluDQo+ID4gdGhlIHdpZHRoIG9mIGZyYW1lYnVmZmVyLg0KPiA+IFRoaXMgaXMgdG8g
Y2hlY2sgd2hldGhlciBwYW5uaW5nIGF0IG9kZCBwb3NpdGlvbiBpcyBzdXBwb3J0ZWQgb3Igbm90
Lg0KPiA+DQo+ID4gdjI6IEFkZCB0ZXN0IGluIGttc19wbGFuZS5bU3dhdGldDQo+ID4gdjM6IFJl
bW92ZSBleHRyYSBwYXJhbWV0ZXJzW1ByYW5heV0NCj4gPiB2NDogQWRkIGEgYnJlYWsgY29uZGl0
aW9uIGluIGxvb3ANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2Eu
Z2FyZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9rbXNfcGxhbmUuYyB8IDk5DQo+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMgaW5kZXgNCj4gPiBiOWJmMDI1YmQu
LmU0NTU1ZTkzMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+ICsrKyBi
L3Rlc3RzL2ttc19wbGFuZS5jDQo+ID4gQEAgLTg4LDYgKzg4LDE1IEBADQo+ID4gICAgKiBAZm9y
bWF0LXNvdXJjZS1jbGFtcGluZzogICAgICAgICAgd2l0aCBzb3VyY2UgY2xhbXBpbmcNCj4gPiAg
ICAqLw0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBTVUJURVNUOiBvZGQtcGFubmluZw0KPiA+ICsg
KiBEZXNjcmlwdGlvbjogVmVyaWZ5IHRoYXQgb2RkIHBhbm5pbmcgaW4gaG9yaXpvbnRhbCBkaXJl
Y3Rpb24gZm9yDQo+ID4gK3BsYW5hciBmb3JtYXQNCj4gPiArICogRHJpdmVyIHJlcXVpcmVtZW50
OiBpOTE1LCB4ZQ0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBwbGFuZSwgcGFubmluZw0KPiA+ICsg
KiBNZWdhIGZlYXR1cmU6IEdlbmVyYWwgRGlzcGxheSBGZWF0dXJlcw0KPiBXZSBoYXZlIGRyb3Bw
ZWQgVGVzdCBjYXRlZ29yeSBhbmQgRnVuY3Rpb25hbGl0eS4gUGxlYXNlIHJlbW92ZSB0aGVtIGZy
b20NCj4gZG9jdW1lbnRhdGlvbi4NCj4gPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0
eSB0ZXN0DQo+ID4gKyAqLw0KPiA+ICsNCj4gPiAgIC8qDQo+ID4gICAgKiBUaHJvdyBhd2F5IGVu
b3VnaCBsc2JzIGluIHBpeGVsIGZvcm1hdHMgdGVzdHMNCj4gPiAgICAqIHRvIGdldCBhIG1hdGNo
IGRlc3BpdGUgc29tZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIEBAIC0xMDAsNiArMTA5LDkNCj4gPiBA
QA0KPiA+ICAgI2RlZmluZSBDUlRDX1JFU1RSSUNUX0NOVAkyDQo+ID4gICAjZGVmaW5lIFNJTV9D
UlRDX1JFU1RSSUNUX0NOVAkxDQo+ID4NCj4gPiArI2RlZmluZSBQTEFORV9XSURUSCA4MTANCj4g
PiArI2RlZmluZSBQTEFORV9IRUlHSFQgNTkwDQo+ID4gKw0KPiA+ICAgdHlwZWRlZiBzdHJ1Y3Qg
ew0KPiA+ICAgCWZsb2F0IHJlZDsNCj4gPiAgIAlmbG9hdCBncmVlbjsNCj4gPiBAQCAtMTMzMCw2
ICsxMzQyLDg5IEBAIHN0YXRpYyBib29sIGlzX3BpcGVfbGltaXRfcmVhY2hlZChpbnQgY291bnQp
DQo+ID4gICAJCXJldHVybiBjb3VudCA+PSBDUlRDX1JFU1RSSUNUX0NOVCAmJiAhYWxsX3BpcGVz
Ow0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkDQo+ID4gK3ByZXBhcmVfcGxhbmVzX3Bh
bm5pbmcoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgY29uc3QgZW51bSBwaXBlIHBpcGVfaWQsDQo+
ID4gKwkgICAgICAgaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ID4gK3sNCj4gPiArCWlndF9wbGFu
ZV90ICpwcmltYXJ5Ow0KPiA+ICsJc3RydWN0IGlndF9mYiBwcmltYXJ5X2ZiXzEsIHByaW1hcnlf
ZmJfMjsNCj4gPiArCXVuc2lnbmVkIGludCBmYl9pZF8xLCBmYl9pZF8yOw0KPiA+ICsJaW50IGog
PSAwLCByZXQ7DQo+ID4gKw0KPiA+ICsJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIHBpcGVf
aWQpOw0KPiA+ICsNCj4gPiArCXByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKG91
dHB1dCwNCj4gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4gKw0KPiA+ICsJZmJfaWRfMSA9
IGlndF9jcmVhdGVfcGF0dGVybl9mYihkaXNwbGF5LT5kcm1fZmQsDQo+ID4gKwkJCQkJODAwLCA1
OTAsDQo+ID4gKwkJCQkJRFJNX0ZPUk1BVF9OVjEyLA0KPiA+ICsJCQkJCURSTV9GT1JNQVRfTU9E
X0xJTkVBUiwNCj4gPiArCQkJCQkmcHJpbWFyeV9mYl8xKTsNCj4gPiArDQo+ID4gKwlmYl9pZF8y
ID0gaWd0X2NyZWF0ZV9wYXR0ZXJuX2ZiKGRpc3BsYXktPmRybV9mZCwNCj4gPiArCQkJCQk4MDAs
IDU5MCwNCj4gPiArCQkJCQlEUk1fRk9STUFUX05WMTIsDQo+ID4gKwkJCQkJRFJNX0ZPUk1BVF9N
T0RfTElORUFSLA0KPiA+ICsJCQkJCSZwcmltYXJ5X2ZiXzIpOw0KPiA+ICsNCj4gPiArCWlndF9h
c3NlcnQoZmJfaWRfMSk7DQo+ID4gKwlpZ3RfYXNzZXJ0KGZiX2lkXzIpOw0KPiA+ICsNCj4gPiAr
CWlndF9wbGFuZV9zZXRfZmIocHJpbWFyeSwgJnByaW1hcnlfZmJfMSk7DQo+ID4gKw0KPiA+ICsJ
aWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnksIFBMQU5FX1dJRFRILCBQTEFORV9IRUlHSFQpOw0K
PiA+ICsJaWd0X3BsYW5lX3NldF9wb3NpdGlvbihwcmltYXJ5LCAtNTAxLCAyMDApOw0KPiA+ICsN
Cj4gPiArCXJldCA9IGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKGRpc3BsYXksDQo+ID4g
K0RSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gPiArDQo+ID4gKwlkbyB7
DQo+ID4gKwkJaWYgKGogJSAyID09IDApIHsNCj4gPiArCQkJaWd0X3BsYW5lX3NldF9mYihwcmlt
YXJ5LCAmcHJpbWFyeV9mYl8xKTsNCj4gPiArCQkJaWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnks
IFBMQU5FX1dJRFRIIC0gaiwNCj4gUExBTkVfSEVJR0hUKTsNCj4gPiArCQkJcmV0ID0gaWd0X2Rp
c3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwgMCwgTlVMTCk7DQo+ID4gKwkJCWlmIChy
ZXQgPT0gLTIyKQ0KPiA+ICsJCQkJYnJlYWs7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJaWd0
X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9mYl8yKTsNCj4gPiArCQkJaWd0X3BsYW5l
X3NldF9zaXplKHByaW1hcnksIFBMQU5FX1dJRFRIIC0gaiwNCj4gUExBTkVfSEVJR0hUKTsNCj4g
PiArCQkJcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwgMCwgTlVM
TCk7DQo+ID4gKwkJCWlmIChyZXQgPT0gLTIyKQ0KPiA+ICsJCQkJYnJlYWs7DQo+ID4gKwkJfQ0K
PiA+ICsJCWorKzsNCj4gPiArCX0gd2hpbGUgKGogPCAyMCk7DQo+ID4gKw0KPiA+ICsJaWd0X2Fz
c2VydF9lcShyZXQsIC0yMik7DQo+ID4gKw0KPiA+ICsJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5
LCBOVUxMKTsNCj4gPiArCWlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBQSVBFX05PTkUpOw0K
PiA+ICsJaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7DQo+
ID4gKw0KPiA+ICsJaWd0X3JlbW92ZV9mYihkaXNwbGF5LT5kcm1fZmQsICZwcmltYXJ5X2ZiXzEp
Ow0KPiA+ICsJaWd0X3JlbW92ZV9mYihkaXNwbGF5LT5kcm1fZmQsICZwcmltYXJ5X2ZiXzIpOyB9
DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBydW5fdGVzdF9vZGRfcGFuKGRhdGFfdCAqZGF0YSkg
ew0KPiA+ICsJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLT5kaXNwbGF5Ow0KPiA+ICsJ
ZW51bSBwaXBlIHBpcGU7DQo+ID4gKwlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gPiArDQo+ID4g
Kwlmb3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0KGRpc3BsYXksIHBpcGUsIG91dHB1dCkg
ew0KPiA+ICsJCWlndF9kaXNwbGF5X3Jlc2V0KGRpc3BsYXkpOw0KPiA+ICsNCj4gPiArCQlpZ3Rf
b3V0cHV0X3NldF9waXBlKG91dHB1dCwgcGlwZSk7DQo+ID4gKwkJaWYgKCFpbnRlbF9waXBlX291
dHB1dF9jb21ib192YWxpZChkaXNwbGF5KSkNCj4gPiArCQkJY29udGludWU7DQo+ID4gKw0KPiA+
ICsJCWlndF9keW5hbWljX2YoInBpcGUtJXMtJXMiLCBrbXN0ZXN0X3BpcGVfbmFtZShwaXBlKSwN
Cj4gaWd0X291dHB1dF9uYW1lKG91dHB1dCkpDQo+ID4gKwkJCXByZXBhcmVfcGxhbmVzX3Bhbm5p
bmcoZGlzcGxheSwgcGlwZSwgb3V0cHV0KTsNCj4gPiArDQo+ID4gKwkJaWYgKHBpcGUgPT0gMCkN
Cj4gPiArCQkJYnJlYWs7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgdm9p
ZCBydW5fdGVzdChkYXRhX3QgKmRhdGEsIHZvaWQgKCp0ZXN0KShkYXRhX3QgKiwgZW51bSBwaXBl
KSkNCj4gPiAgIHsNCj4gPiAgIAllbnVtIHBpcGUgcGlwZTsNCj4gPiBAQCAtMTQwOCw2ICsxNTAz
LDEwIEBAIHJ1bl90ZXN0c19mb3JfcGlwZV9wbGFuZShkYXRhX3QgKmRhdGEpDQo+ID4gICAJCXJ1
bl90ZXN0KGRhdGEsIGR5bmFtaWNfdGVzdF9oYW5kbGVyKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAr
CWlndF9kZXNjcmliZSgidmVyaWZ5IHdoZXRoZXIgb2RkIHBhbm5pbmcgaXMgc3VwcG9ydGVkIG9y
IG5vdCIpOw0KPiA+ICsJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKCJvZGQtcGFubmluZyIpDQo+
ID4gKwkJcnVuX3Rlc3Rfb2RkX3BhbihkYXRhKTsNCj4gPiArDQo+ID4gICAJaWd0X2Rlc2NyaWJl
KCJ2ZXJpZnkgcGxhbmFyIHNldHRpbmdzIGZvciBwaXhlbCBmb3JtYXQgYXJlIGFjY2VwdGVkIG9y
DQo+IHJlamVjdGVkIGNvcnJlY3RseSIpOw0KPiA+ICAgCWlndF9zdWJ0ZXN0X2YoInBsYW5hci1w
aXhlbC1mb3JtYXQtc2V0dGluZ3MiKQ0KPiA+ICAgCQl0ZXN0X3BsYW5hcl9zZXR0aW5ncyhkYXRh
KTsNCg0K
