Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4D8C28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 05:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221E110E0E2;
	Wed, 26 Mar 2025 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOBZb8hG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FCC10E0E2
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 05:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742965494; x=1774501494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=27Xb98ALqqWFSCaVldyOSgwzD8LFU5/XeQ4FS6Zd5Go=;
 b=WOBZb8hG46L/pdGkPOoSXwGPFdPoBUtY/Jc5y2FD7OtRvf9xnsMZBauL
 H2TVxdNw2iPCqrKllnpV2Vji5vpVm8NKPe0ByNrlgA+f3YQGOrkn/5UCl
 8nKeRZaQzMQKpcpS/kQ8ovJApPO8ZtZu9ej9KnCpN6Llmp4Es+VNDcVPp
 OHhdfuf4ZPJdBPD0wb48WEfWhnl49Y4Q58aEndqrIHi68G0Wv8q0uJlNR
 GcAFfqwkK/glHsyI3m4VeoxdK71mjJpdB2ihL1jIFU0XGkGjGCde7ynyY
 UlXCFUvjlFmqAxtgAn0iPmMgCqVbV8rLhsl2FHrBsOI8NowfM/J524eFQ Q==;
X-CSE-ConnectionGUID: mhndcbh1RAK+sM1TRek47Q==
X-CSE-MsgGUID: ID/vmPVrQbK3OP10BFqn6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48111867"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208,217";a="48111867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:04:53 -0700
X-CSE-ConnectionGUID: 9C6VoYu/Sk6xmNic1mBDtA==
X-CSE-MsgGUID: uZMTSR2ITwGFXLqa/AmxUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
 d="scan'208,217";a="125090835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:04:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 22:04:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 22:04:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 22:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL/1wGCcW42zMbgmD0ziPbADcq0HKLKsTdgyICg88rhvy8hMJhhGDwGyJ69Nexg1EpbsSZtbx+h/fC4nfQHlhnBS2piHm/8T4b2lj6HMm7/yfbt+HfAc2jPa9JL0M8d4raa4yzC7NMxl95VWFlQP2612H6CacbSQAI73aSYdSysQrrTpCccyrySyc1TXzD+KdOABiLcMgcNyNYHGNO1Q+TvbRloi4Urwgkhg6tabCR/EuQ7/l1M3q1K5W72Y38ANDDFqdFbIr3K+0jbFQ9y8AR1kdAz3b9hpGcZE00SW1R3j6fiucz8EnggJdOp85z7xPeClpd0IzoP6ttX79MM9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7ftk9kNFF2tQmzrgjfEKSisEDM4MwHdNUAMwr+jsL8=;
 b=iWBlO/48ugxGZlo4GRcyPPLrg0pCweXZCJZijq9MwPBvZxGYpz1mZlKJ5QSSeNTWJyjnmLXEaWL7E77Ic9WxXVfvE3MH9Y2HztFt5ogp/rch1pJNfLuOdYoNVTQYfEAlFlrVYx6DrI8gkSXJeblpFKGsG0OZFfiwvgXJUp/nk/Yg1R6HgCSUsj9kITm9fLqJ9XsGZCu3SA1fPgYOyFMe7wV4M4TzBqunWY4oC5Vmr9rmoAT0HZ7Al5R0tsRhudEszNRBS7i8GlW3p1PlbLOvdtBrWiA5qrEK5YhvSbxo3D74sv+JbuBKTxrtu7j5VZ/rd/rkSnu/e+/9nywwVTiytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:04:45 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 05:04:44 +0000
Content-Type: multipart/alternative;
 boundary="------------ZyjbMcRlswtPaaUy4oNwsSgp"
Message-ID: <43e2d9ef-7f5f-4c35-b4c9-0d671bd7724a@intel.com>
Date: Wed, 26 Mar 2025 10:34:38 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNf?=
 =?UTF-8?Q?plane=5Fmultiple=3A_Add_dual_display_subtest_=28rev5=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250320103243.823164-1-karthik.b.s@intel.com>
 <174247077355.57365.13536383760007693026@18a75f3d1eae>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <174247077355.57365.13536383760007693026@18a75f3d1eae>
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb68336-3c20-4562-21ee-08dd6c23b8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGxJc21CV1Z4UGJkOEpWWFZZSGJEWU9HZ1g5VXpSYmJqM1NvQm1nRTlpUXlq?=
 =?utf-8?B?dHllTmExblMxTEEvdUpFRldpY0tHTy9taENXKzFXZ3hNRWdPM3BSem9vR3gr?=
 =?utf-8?B?SitkUU1rckpaVWJpVEFCcnZzcS9kSlBlZ2xSRFd6dU9MSUMveFNvK0E4NGd3?=
 =?utf-8?B?WmFNOFRrdFIzY2lDT01TVlF3dGN6YUF1blJKbGhHSWlRL3ZsSi9tSGttYW5i?=
 =?utf-8?B?aGNSWWxrUCt0R1BUYThPaUJydlJ4M3BSblRFVWZHL0FKaFNwSXVlT0dud0JQ?=
 =?utf-8?B?cDBITVdhblZKYktaTUN5TFBFdytFQmE4OEdidTczbUZVUGdTQzFMWHJqcW9M?=
 =?utf-8?B?cGpzSndQblpqcjcrKzE0NHRlK2orNENGblcwYkVhbE9wOUZ0S1ptSzJMTlRo?=
 =?utf-8?B?QTJKYmZkU3NoUDRsRzVoekE4V3pWUmFRc2xGR1k2S1lOemdFS1h2dVQ4WHRS?=
 =?utf-8?B?NDNiNGpWTnQ4aVV1QWRGY0k0ZUozM3ZOZWVLRStHMUFDTVErYS83UHFyVkZp?=
 =?utf-8?B?Mkwwc2dneUJMT1RKTkplazV0Q1FZb090MlJaV3lwTzNZb2dsNzZORlM5am02?=
 =?utf-8?B?R3ZDS1FVSmV5U0sydjNHSXg3eUNjTUs1dDFrREJyVURGT2ZBRFVXTFVLRHV3?=
 =?utf-8?B?WEtzWU9zaHdZRTJtS09MVWNBUUZBckJkWXBpSUdzTVJidkNoMW1MK2pvVFo1?=
 =?utf-8?B?TEhPS0dUaEd6amxoN041MTVWVUlNbTcwOEh5MWhISzFua0dXODJCRXFZYWww?=
 =?utf-8?B?c3BUaXZJVDFnVTVGd281M2xoaWlSRXh3UnlGWGJqbzZsemlvaUpySjhtdGw1?=
 =?utf-8?B?S0NKVHZ2WW5EOXh5Z3JsNXF2T3NoMWZoOVhyNFFGRHZWb1lCaW9aMTlOZkV2?=
 =?utf-8?B?ZGY1QWNmblEwYktNRmN6SkNkeEJrT2pJWVVyUi9IOGJQSlhxNTlrREc5VXhO?=
 =?utf-8?B?eTNHaW1Lb1cwU3lrSlhoc1JINGtJNUdIVXlWcFdwbmViV2RHYXJaWkNhQzNO?=
 =?utf-8?B?S1A5eUVXM3ZSdnNtRUp0d3kwMmUyWDE1V3JIbXlQN1pPWVg4cWlhNDZuZnhi?=
 =?utf-8?B?Q1JwSCtrRU5HNExHSFRMeFR6TXJkZktPZkRNamJKaEZUT2diY2Y3bnBzeEZC?=
 =?utf-8?B?ZDF2ZVZRcDdCUTczVTdHeVMvOGlNMDd3N3NFbEI3ZnNhOHptcDlEc0NycFZO?=
 =?utf-8?B?dzlrSGNDWDBobnRxd2hTemYxSE9mQ1pVVFhIeERFanNoU3ZFTXZBVThtckFO?=
 =?utf-8?B?d0ZOOUYyTHJXbmV2SWNoKzJPbklxZkZlb28ycGFBZngydlRmQjB1ZGovb3lU?=
 =?utf-8?B?L05EQ0M3OExtY1NCZUd0TUYxZzNXM1R5cStieitWeGp1THQxb2cwM01SZjVq?=
 =?utf-8?B?cnppN3Q1SVh2N0dTcitoUXB6UHNwNGp5M2pCSmhzVzF2Y0owbnRxTEltSFBS?=
 =?utf-8?B?NHFRY0dOWW13Uzl2M1RnbEVieDY2RlFhZHhqRk9zV2ViK1ZZTVVRV0hQKzhx?=
 =?utf-8?B?bE9tdkRZYTN1MlAxdjBiM29JUlJGZW9rd1d0RERMcTYzMnVxanV3Ty91bUxD?=
 =?utf-8?B?Sm50TUt6WnFvV1d2YWp6S3N0cjQ2dUtITVB4QVk5aEZYazluQjByeVpkdS9B?=
 =?utf-8?B?RXpMVUNzdVgzUTZzOUpqZUtYRHYzTm8wZHBEY0hYMnVJUmFoV1d4RVRSaHVK?=
 =?utf-8?B?UzUxZitjTVh0Z01BdTdQSTM0VGpZZ1YzUWl6MHZOTy9Jajc3VHcwTy82bEY4?=
 =?utf-8?Q?vx5b3fEqiM+pIz3sGhppR9aR5dOE/ftU64314hI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDV6aDA0UC9WSk85UUNDc3NCa0VLUExWT2JJc0w4WENkTnNWZGxPdVRXcUx4?=
 =?utf-8?B?QVkrdGpxN1JrcGRPZzlpS0JJWjBFOEZISVFSNVNsYjJQaUNsRXFFQjEvWXVy?=
 =?utf-8?B?SUxFVWlWVUJIQ1VNdGVCL2gwTDI0Ny8rblVLa3NBOXhVMm0vRkRkWFA4dGlB?=
 =?utf-8?B?bWwyYWY2Nnk3ODdDMkNQNTNnKzBTTmE5ZmZuVzBTU0d4V2NSNXRaeEVSOTlL?=
 =?utf-8?B?RnN5RVU3eTNhY2tiNytVZWtwc3Rqam1pbmdHWWRpQXlWdEpmck13SkFHMTBJ?=
 =?utf-8?B?L0NiNTJ0Unh1Z29XY3hpa1VQNExDcHlST3pvQ2U4ZytJeEdKYWNTSFk0SlNB?=
 =?utf-8?B?dmNEYmJVT0lmUStFR24xYlZnM3doYnZMN0JsVkVJVkxhd08xRUFpNGd1Mk81?=
 =?utf-8?B?aG0xU1MxUnV6aXk1NEU3WmoxQ3NhbFY3OUZFaUFUYzVRNHNlVm1rSUxUQXFV?=
 =?utf-8?B?bWJaT0d3SmZiSEZCQXZLUjRWdWVIZ2dGc1pQcjBPQ3ZzMzA5WnlvU2IzUXpj?=
 =?utf-8?B?U3N3WHNzSXZmOU04alVqQkpLb1l0TzZVaC9FUStETUVma0VyMGxsTVBiWjE5?=
 =?utf-8?B?V3FPWG9rbVUvVkdPUUE1VGduWXcxV2lWakxZRnNGdXZZT1ZtNUZFS2phY1BL?=
 =?utf-8?B?VHFRRjJDU1NrUGE4bmNwc3VIQ2RNZkNCN1BXRkdDbVhTVXNGNHhkMmNtQVFy?=
 =?utf-8?B?TW1ldlg0Q2RaOXRrcWwrV3ZyZXcveHo5SkxFSC9DaVJQdGhYRWFxdkVkUDA4?=
 =?utf-8?B?akxROEtaNzA3VkR2NkNlMEttaWZyd0s0RzRxdGhzQ09qY1dEUUs5NWtHQXd0?=
 =?utf-8?B?LzdmeGsyc2htemsrVm5OdENwWTB4RGgwTlNVMi9XS0dyWjNXRGEvMXhhOXpp?=
 =?utf-8?B?YWpQR2Y2QjErSFg0dlgwL0dMWXRxU1U1UUkwVXFOQ2FqRlpsWDJrN0R2Sjdw?=
 =?utf-8?B?YjduWW5qMzZxL3lyZjczekpuL0d3TW9RWm9rUjRIeXF3NjJ4Q1hYUHBxQjhJ?=
 =?utf-8?B?Q21rWWl3ZDRyd3EvOWlZYWgzNXhuWEFveDFEZVVGVHhvTzZHa3VtQjA4QXZ1?=
 =?utf-8?B?S0doMVlVSFpramRCRXF0eXdKWU1SaDZOWXRnOTQ3MlRSMHF5ZmpydkhpRFhN?=
 =?utf-8?B?R0NyL3lDbTFaMUZqd0FWQ1dVZnBZUUEybFA1MExidFBSV28zYkpqcSttYy82?=
 =?utf-8?B?QU5hbFRRSVFNODlnNlRsakp4NkREeFdiV1hBQWxoZXB5VUUxSjFTbTZzc1Mw?=
 =?utf-8?B?QWxzcGVlSlpoZVpPbE4vR05abkNYS05sYkNSUUw3bjRoSUsraWZSMDMvd0hp?=
 =?utf-8?B?bEdzTEhoNVBFNlZhUUJnSVNYUkVsL2hpYjNvUis0dkphTVVqV1hyZ1U5bnpl?=
 =?utf-8?B?dXptZm5hODNaL1NKNTVjVmFPRnRqMHY4Y29XYWh5cUU2MTR3R3NHVHJrWFNB?=
 =?utf-8?B?dWpWZUxUOTd6Nko3LzUrT1ZEOHFaWXpiR2ZPLzEvUE9sTnovc1Jva0RwTFdz?=
 =?utf-8?B?VDB5L3UxTHF4aUpLM0JWMXFaRnI3V0t5TnQ0elBxRUVVUEN6dDhUQ0VnNEdK?=
 =?utf-8?B?VG9WYkdJN2tTazNVZmtsOG1XQ0NCbDA1T0tJV0twMS9yOWVKK1NqclBhK0Fv?=
 =?utf-8?B?NFVJd3Nsek9ra2ExSWNFaTZkR243T3k5czlPSjRIYVpzMmEwOEozK3k2U0xj?=
 =?utf-8?B?MTVvWW5tNkZzZ2huN3dQRmRWZEVWSjlWKy9LQlYrcWJSNUJHTnVuODNBWWEy?=
 =?utf-8?B?NUVneTAzb1Z0NGRYeDN3YlpnWlpDKzM2MHR5T1dydm9OWDk5bFVqSCtCWXE1?=
 =?utf-8?B?NjM3N1o4UVdORDlwWmNIeEdJbURHTjlRUkRDNk5kL0ZSODRyQS9kb24wWGJp?=
 =?utf-8?B?ckF4OGJVRTY2U0s1bmQrRUhkQ3NhbXhwWC9Ya21JdU9GRmM4alQxT01zaXk1?=
 =?utf-8?B?K1B5alN4ZmFkdmNsNHppSVZoSnlIMkFNUURiZ3VoUHlLRStzL2NQakhYUjQx?=
 =?utf-8?B?N3ZZQVB4TGxxZm5GbVR3Z1EreVViZ3pOTmlTbWxMdGc4enZvRnFCa3VkZHQv?=
 =?utf-8?B?MnpRWDl4UzVnMnNnU3ZGRlYvc1d2NjVEUmlCeS9nK2NFQzQ3SXRadXNSS2g5?=
 =?utf-8?B?WEJwZm9pMmwwc1p2WkNaajh2amtYaEpWeDNiVnNQS1VSRG0yMWc0ZVFrTjBr?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb68336-3c20-4562-21ee-08dd6c23b8e4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:04:44.8738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OGf0TEbUQG5ToeVnWME3lSvjLV+Vf1qyyDvv8fLG8U6b2dzfKTGzPlJnUfd9lfmDIx0UIb9IUrYa4G1CYuq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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

--------------ZyjbMcRlswtPaaUy4oNwsSgp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are unrelated to this patch. The newly added subtest is 
fully passing on both xe and i915.

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12801/shards-all.html?testfilter=kms_plane_multiple@2x- 


https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shards-all.html?testfilter=kms_plane_multiple@2x-

Will go ahead and merge this patch.

Thanks,
Karthik.B.S

On 3/20/2025 5:09 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_plane_multiple: Add dual display subtest (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/115855/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/index.html
>
>
>   CI Bug Log - changes from XEIGT_8276_full -> XEIGTPW_12801_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12801_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12801_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12801_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4 (NEW):
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-4.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none (NEW):
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html>
>         +3 other tests skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf (NEW):
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html>
>         +1 other test skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html>
>  *
>
>     igt@xe_gt_freq@freq_suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html>
>  *
>
>     igt@xe_oa@buffer-fill:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_oa@buffer-fill.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_oa@buffer-fill.html>
>         +1 other test fail
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8276_full and 
> XEIGTPW_12801_full:
>
>
>       New IGT tests (77)
>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o Statuses : 1 pass(s) 2 skip(s)
>       o Exec time: [0.0, 18.32] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.74] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.80] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.81] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.80] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.84] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.79] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.74] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.78] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o Statuses : 2 pass(s) 1 skip(s)
>       o Exec time: [0.0, 18.20] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.68] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-b-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.78] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-c-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-d-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.81] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.83] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.68] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-a-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.68] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-c-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.63] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-d-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.78] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.64] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.84] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-d-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.70] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-a-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.81] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-b-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.68] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.79] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-a-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-b-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-c-hdmi-a-3:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-a-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.73] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-b-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-c-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.64] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.81] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.71] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.64] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.65] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.66] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-x:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12801_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose:
>
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@core_hotunplug@hotreplug-lateclose.html>
>         (Intel XE#3914
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914>)
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2233
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         (Intel XE#3768
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>  *
>
>     igt@kms_async_flips@test-cursor:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_async_flips@test-cursor.html>
>         (Intel XE#664
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/664>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +10 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#1477
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +18 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +8
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +4
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +25 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +19 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +138 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#4416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +3
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +3
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>         +19 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +10
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +11
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1
>         other test fail
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_content_protection@uevent.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#4210
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html>
>         (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +2
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +2
>         other tests skip
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (Intel XE#4156
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156>) +1
>         other test skip
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_flip@2x-dpms-vs-vblank-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-race.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>         +10 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +4
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2932
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_flip@plain-flip-ts-check@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +3
>         other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +7
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +7
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +41 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +36
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +43 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +31
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +54
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb2-accept-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html>
>         (Intel XE#2340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html>
>         (Intel XE#2340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340>)
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470> /
>         Intel XE#2853
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +16
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (Intel XE#4090
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>) +1
>         other test skip
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-fail
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>
>       o shard-lnl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +14
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +3
>         other tests fail
>  *
>
>     igt@kms_plane_lowres@tiling-4:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2493
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2493
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +6
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +17 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +14 other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#736
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/736>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html>
>         (Intel XE#1131
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +12 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +9
>         other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +18
>         other tests skip
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_psr@pr-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +32 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +1
>         other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) +1
>         other test skip
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +2
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html>
>         (Intel XE#4278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278>) +1
>         other test fail
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1
>         other test skip
>  *
>
>     igt@xe_eu_stall@unprivileged-access:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_eu_stall@unprivileged-access.html>
>         (Intel XE#4497
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497>)
>  *
>
>     igt@xe_eudebug@basic-connect:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_eudebug@basic-connect.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +14 other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905> /
>         Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905> /
>         Intel XE#3889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_eudebug_online@single-step-one.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +21 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_eudebug_online@single-step-one.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +12 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_evict@evict-beng-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-null:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +29
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_media_fill@media-fill.html>
>         (Intel XE#2459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459> /
>         Intel XE#2596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_media_fill@media-fill.html>
>         (Intel XE#560
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_mmap@small-bar.html>
>         (Intel XE#586
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/586>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@force-load.html>
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_noexec_ping_pong:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_noexec_ping_pong.html>
>         (Intel XE#379
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>  *
>
>     igt@xe_oa@buffer-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_oa@buffer-size.html>
>         (Intel XE#4501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501>)
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>  *
>
>     igt@xe_oa@polling-small-buf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +5
>         other tests skip
>  *
>
>     igt@xe_oa@syncs-syncobj-wait-cfg:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_oa@syncs-syncobj-wait-cfg.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573> /
>         Intel XE#4501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501>) +1
>         other test skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#2236
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>)
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_peer2peer@write.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_peer2peer@write.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_pm@s3-mocs.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +3
>         other tests skip
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_pm@s4-basic.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>) +1
>         other test abort
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#4268
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +6
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3
>         other tests skip
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html>
>         (Intel XE#4351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         +5 other tests pass
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         +3 other tests pass
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html>
>         +3 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
>         +4 other tests pass
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html>
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html>
>  *
>
>     igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-3/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_module_load@load.html>)
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@xe_module_load@load.html>)
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html>)
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4440
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_content_protection@srm.html>
>         (Intel XE#4132
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@kms_content_protection@srm.html>
>         (Intel XE#4132
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_content_protection@srm.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#4528
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4528>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#4528
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4528>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +16 other tests skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@testdisplay:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@testdisplay.html>
>         (Intel XE#4540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@testdisplay.html>
>         (Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#4540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540>)
>
>
>     Build changes
>
>   * IGT: IGT_8276 -> IGTPW_12801
>
> IGTPW_12801: 12801
> IGT_8276: 8276
> xe-2825-a958e31a81b3267201c85b6f171419586afa792c: 
> a958e31a81b3267201c85b6f171419586afa792c
>
--------------ZyjbMcRlswtPaaUy4oNwsSgp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are unrelated to this patch. The newly added
      subtest is fully passing on both xe and i915.</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12801/shards-all.html?testfilter=3Dkms_plane_multiple=
@2x">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12801/shards-all.html?t=
estfilter=3Dkms_plane_multiple@2x</a>-
      <br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12801/shards-all.html?testfilter=3Dkms_plane_multipl=
e@2x">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shards-all.html=
?testfilter=3Dkms_plane_multiple@2x</a>-</p>
    <p>Will go ahead and merge this patch.</p>
    Thanks,<br>
    Karthik.B.S
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 3/20/2025 5:09 PM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:174247077355.57365.13536383760007=
693026@18a75f3d1eae">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_plane_multiple: Add dual display subtest
              (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/115855/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/115855/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12801/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8276_full -&gt;
        XEIGTPW_12801_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_12801_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_12801_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_12801_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_ccs@random-ccs-dat=
a-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send=3D"true">ABORT</a=
></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a=
6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-in=
terruptible@a-hdmi-a6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt=
@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html" moz-do-n=
ot-send=3D"true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4 (NEW):</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_plane_multiple@2x-=
tiling-4.html" moz-do-not-send=3D"true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none (NEW):</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-=
none.html" moz-do-not-send=3D"true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf (NEW):</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-=
yf.html" moz-do-not-send=3D"true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_c=
reate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_device_create.html" moz-do-not-send=3D"true">DMESG-WAR=
N</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12801/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html" moz-do-not-sen=
d=3D"true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@buffer-fill:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-8/igt@xe_oa@buffer-fill.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12801/shard-lnl-7/igt@xe_oa@buffer-fill.html" moz-do-not-send=3D"true">F=
AIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8276_full and
        XEIGTPW_12801_full:</p>
      <h3>New IGT tests (77)</h3>
      <ul>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>Statuses : 1 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 18.32] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-b-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.74] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-d-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-c-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-d-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-a-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.81] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.70] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-d-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-a-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-d-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-a-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.84] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-b-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-d-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.79] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-b-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.74] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-d-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-b-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-c-hdmi-a-3=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.78] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-c-dp-2=
:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>Statuses : 2 pass(s) 1 skip(s)</li>
            <li>Exec time: [0.0, 18.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-b-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-c-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-2-pipe-d-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.68] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-b-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.78] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-c-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-d-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-b-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.81] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-c-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-3-pipe-d-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-b-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-c-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-d-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-a-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.83] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-c-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-2-pipe-d-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.68] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-a-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.68] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-c-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.63] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-d-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-a-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.78] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-c-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-3-pipe-d-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-a-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-c-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-d-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.64] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-a-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.84] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-b-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-2-pipe-d-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.70] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-a-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.81] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-b-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.68] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-a-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.79] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-b-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-3-pipe-d-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-a-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-d-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-a-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-b-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-2-pipe-c-hdmi-=
a-3:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-a-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.73] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-b-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-c-hdmi-=
a-6:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.64] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-a-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.81] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-b-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-3-pipe-c-d=
p-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.71] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-a-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.64] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-b-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.65] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-c-d=
p-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.66] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-x:</p>
          <ul>
            <li>Statuses :</li>
            <li>Exec time: [None] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-y:</p>
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_12801_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@core_hotunplug@hotreplug-late=
close.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3914" moz-do-not-send=3D"true">Intel XE=
#3914</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2233" moz-do-not-send=3D"true"=
>Intel XE#2233</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_addfb_basic@addfb2=
5-y-tiled-small-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send=3D=
"true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-ed=
p-1-linear:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts@pipe-a-edp-1-linear.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/911" moz-do-not-send=3D"true">Intel XE#911</a>) +3 =
other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_async_flips@invalid-async=
-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send=3D"true">Intel XE#8=
73</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_async_flips@invali=
d-async-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send=3D"true">Int=
el XE#873</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_async_flips@invalid-async=
-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873" moz-do-not-send=3D"true">Intel XE#8=
73</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_async_flips@invalid-async=
-flip-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3768" moz-do-not-send=3D"true">In=
tel XE#3768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_async_flips@test-cursor.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/664" moz-do-not-send=3D"true">Intel XE#664</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-se=
nd=3D"true">Intel XE#1407</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-as=
ync-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658" mo=
z-do-not-send=3D"true">Intel XE#3658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_big_fb@linear-16bp=
p-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Int=
el XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rota=
te-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE=
#2327</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rota=
te-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE=
#1124</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2328" moz-do-not-send=3D"true">Intel XE#2328</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=3D"true"=
>Intel XE#607</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_big_fb@y-tiled-add=
fb-size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=
=3D"true">Intel XE#607</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1477" moz-do-not-send=3D"true=
">Intel XE#1477</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-n=
ot-send=3D"true">Intel XE#1124</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true">Intel=
 XE#610</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_big_fb@yf-tiled-ad=
dfb-size-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true=
">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-asy=
nc-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_big_fb@yf-tiled-ma=
x-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24" moz-do-not-send=3D"true">Intel XE#1124</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displ=
ays-2160x1440p.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2191" moz-do-not-send=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-4-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-no=
t-send=3D"true">Intel XE#2191</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send=
=3D"true">Intel XE#1512</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=
=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) +4 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@kms_bw@linear-tiling-3=
-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true"=
>Intel XE#2887</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">I=
ntel XE#2887</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send=
=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +27 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-se=
nd=3D"true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe=
-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787" moz-do-not-send=3D"true">Intel XE#787</a>) +138 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-d=
o-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) =
+34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_ccs@random-ccs-dat=
a-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-se=
nd=3D"true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_cdclk@plane-scaling.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4416" moz-do-not-send=3D"true">Intel XE#4416</a>) +=
3 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cdclk@plane-scaling.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel XE#2724</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_chamelium_color@ctm-max.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>)=
 +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_chamelium_color@ctm-red-t=
o-blue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE=
#2325</a>) +3 other tests
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_chamelium_color@ct=
m-red-to-blue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">In=
tel XE#306</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D=
"true">Intel XE#2252</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_chamelium_edid@dp-=
edid-change-during-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-sen=
d=3D"true">Intel XE#373</a>) +10 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"tr=
ue">Intel XE#373</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_content_protection@dp-mst=
-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true">Intel XE=
#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_content_protection@mei-in=
terface.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send=3D"true">Intel X=
E#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_content_protection=
@uevent.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send=3D"true">Intel X=
E#1188</a>) +1 other test
              fail</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel XE#3278<=
/a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1188" moz-do-not-send=3D"true">Intel XE#1188<=
/a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_cursor_crc@cursor-=
offscreen-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"true=
">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel =
XE#2320</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Intel=
 XE#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-434/igt@kms_cursor_legacy@2x-nonblocking-modes=
et-vs-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt=
@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/309" moz-do-not-send=3D"true">Intel XE#309</a>) +1 other test
              skip</li>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-c=
ursor-atomic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cursor=
_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2291" moz-do-not-send=3D"true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_cursor_legacy@curs=
orb-vs-flipa-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"tr=
ue">Intel XE#309</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-=
flipa-toggle.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send=3D"tru=
e">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">In=
tel XE#2291</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-se=
nd=3D"true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1508=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4210" moz-do-not-send=3D"true">Intel XE#4210<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1340" moz-do-not-send=3D"t=
rue">Intel XE#1340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_dp_link_training@non-uhbr=
-sst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Intel XE#4=
354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send=3D"true">Intel=
 XE#4331</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE=
#2244</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Int=
el XE#2244</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc=
-dirty-rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-d=
o-not-send=3D"true">Intel XE#4422</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4156" moz-do-not-send=3D"true">Intel XE#4156</a>)=
 +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@kms_feature_discovery@display=
-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/703" moz-do-not-send=3D"true">Intel XE#703=
</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_feature_discovery@display=
-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2373" moz-do-not-send=3D"true">Intel XE#23=
73</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_feature_discovery@=
display-3x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/703" moz-do-not-send=3D"true">Intel=
 XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vb=
lank-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel =
XE#310</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#142=
1</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Int=
el XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"=
true">Intel XE#3321</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-=
hdmi-a6-dp4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_flip@=
2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" =
moz-do-not-send=3D"true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@kms_flip@2x-modeset-vs-vblank-race.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@2x-modeset-vs-v=
blank-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel=
 XE#310</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-che=
ck-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true=
">Intel XE#2316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-in=
terruptible.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_flip@=
flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"=
 moz-do-not-send=3D"true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=
=3D"true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12801/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html" moz-do-not-s=
end=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-se=
nd=3D"true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2932" moz-do-not-send=3D"true"=
>Intel XE#2932</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-d=
p4.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel =
XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2597" moz-do-not-send=3D"true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html" moz=
-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-e=
dp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886" moz-do-not-send=3D"true">Intel XE#886=
</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rccc=
s-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>) +1 other t=
est
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-dow=
nscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" mo=
z-do-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745=
</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-ups=
caling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-=
do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</=
a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downsc=
aling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-d=
o-not-send=3D"true">Intel XE#1397</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1397" moz-do-not-send=3D"true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-d=
ownscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +7 other test=
s
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_force_connector_basic@for=
ce-connector-state.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send=3D"tru=
e">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" mo=
z-do-not-send=3D"true">Intel XE#656</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-=
do-not-send=3D"true">Intel XE#2311</a>) +41 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullsc=
reen:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" =
moz-do-not-send=3D"true">Intel XE#651</a>) +36 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-=
send=3D"true">Intel XE#4141</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a>) +2 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do=
-not-send=3D"true">Intel XE#2312</a>) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1469" moz-do-not-send=3D"true">Intel =
XE#1469</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-dra=
w-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz=
-do-not-send=3D"true">Intel XE#651</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send=3D"true">Int=
el XE#2352</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@fbcpsr-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send=3D"tru=
e">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-=
send=3D"true">Intel XE#2313</a>) +43 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
 moz-do-not-send=3D"true">Intel XE#653</a>) +31 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not=
-send=3D"true">Intel XE#656</a>) +54 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb2-accept-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2340" moz-do-not-send=3D"true">Intel XE#2340</a=
>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2340" moz-do-not-send=3D"true">Intel XE#2340</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_hdmi_inject@inject-audio.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1470" moz-do-not-send=3D"true">Intel XE#1470</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853" m=
oz-do-not-send=3D"true">Intel XE#2853</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_hdr@invalid-hdr.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) =
+16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_hdr@invalid-metadata-size=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel XE#2927<=
/a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_joiner@basic-ultra=
-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel X=
E#2927</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_joiner@basic-ultra-joiner=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel XE#2927<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send=3D"true=
">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4090" moz-do-not-send=3D"=
true">Intel XE#4090</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_panel_fitting@legacy.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2486" moz-do-not-send=3D"true">Intel XE#2486</a>) =
+1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_plane@plane-position-cove=
red.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel =
XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_plane@plane-position-hole=
-dpms@pipe-b-plane-3.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-sen=
d=3D"true">Intel XE#324</a>) +14 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_cursor@prima=
ry@pipe-a-hdmi-a-6-size-256.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-se=
nd=3D"true">Intel XE#616</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-4:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_plane_lowres@tiling-4.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/599" moz-do-not-send=3D"true">Intel XE#599</a>) +=
4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2393" moz-do-not-send=3D"true">Intel XE#2393</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493" moz-do-not-send=3D"true">Intel XE#2493</=
a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2493" moz-do-not-send=3D"true">Intel XE#2493</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">Intel =
XE#309</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-rotation.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</=
a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-a.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n@pipe-c:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-rotation@pipe-c.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
763" moz-do-not-send=3D"true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-25@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25@pipe-b.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
763" moz-do-not-send=3D"true">Intel XE#2763</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_pm_backlight@brightness-w=
ith-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send=3D"true">Intel =
XE#2938</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_pm_backlight@brigh=
tness-with-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send=3D"true"=
>Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2391" moz-do-not-send=3D"true">Intel XE#2391=
</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/736" moz-do-not-send=3D"true">Intel XE#736</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1131" moz-do-not-send=3D"true">Intel XE#1131</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2392" moz-do-not-send=3D"true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel XE#143=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"=
 moz-do-not-send=3D"true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel XE#1439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-d=
o-not-send=3D"true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel=
 XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3141" moz-do-not-send=3D"true">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send=3D"true">Int=
el XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-=
sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-n=
ot-send=3D"true">Intel XE#2893</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-full=
y-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do=
-not-send=3D"true">Intel XE#1489</a>) +12 other
              tests skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_psr2_sf@psr2-overl=
ay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"=
 moz-do-not-send=3D"true">Intel XE#1489</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#11=
28</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2387" moz-do-not-send=3D"true">Intel XE#23=
87</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_psr2_su@page_flip-=
nv12.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#1=
122</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-434/igt@kms_psr@fbc-psr2-curso=
r-plane-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">I=
ntel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-no-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@kms_psr@pr-no-drrs.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) +5 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do=
-not-send=3D"true">Intel XE#2850</a>) +32 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send=
=3D"true">Intel XE#2414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_psr_stress_test@in=
validate-primary-flip-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not=
-send=3D"true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@kms_rotation_crc@prima=
ry-rotation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true"=
>Intel XE#3414</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@kms_rotation_crc@primary-rota=
tion-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel =
XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send=3D"true"=
>Intel XE#2330</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_rotation_crc@prima=
ry-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=
=3D"true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=3D"true=
">Intel XE#1127</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">I=
ntel XE#2413</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_setmode@invalid-clone-sing=
le-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel X=
E#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send=3D"true">Intel X=
E#1729</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@kms_tiled_display@basi=
c-test-pattern.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send=3D"true">=
Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@kms_tv_load_detect@load-detec=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2450" moz-do-not-send=3D"true">Intel XE#2450=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#=
1499</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@kms_writeback@writebac=
k-fb-id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE=
#756</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@kms_writeback@writeback-fb-id=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a=
>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-6/igt@kms_writeback@writeback-fb-id=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@sriov_basic@enable-vfs=
-autoprobe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"true">=
Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@sriov_basic@enable-vfs-autopr=
obe-off.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send=3D"true">Intel X=
E#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_compute_preempt@com=
pute-preempt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"true">In=
tel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engi=
ne_class_compute:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engin=
e-drm_xe_engine_class_compute.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl=
-2/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4278" moz-do-not-send=3D"true">Intel XE=
#4278</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_copy_basic@mem-set-=
linear-0xfffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">I=
ntel XE#1126</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@unprivileged-access:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_eu_stall@unprivileg=
ed-access.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4497" moz-do-not-send=3D"true">Intel=
 XE#4497</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-connect:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_eudebug@basic-connect.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Intel XE#2905</a>) =
+14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">In=
tel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3889" moz-do-not-send=3D"true">Intel XE#3889</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">In=
tel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3889" moz-do-not-send=3D"true">Intel XE#3889</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_eudebug_online@single-step=
-one.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Intel XE#2=
905</a>) +21 other
              tests skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_eudebug_online@sing=
le-step-one.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send=3D"true">Int=
el XE#2905</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_evict@evict-beng-small.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a>) +=
6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecque=
ue-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" =
moz-do-not-send=3D"true">Intel XE#2322</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-null-defer-bind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-se=
nd=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true"=
>Intel XE#1392</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_exec_basic@multigpu-onc=
e-null.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE=
#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_exec_fault_mode@onc=
e-invalid-userptr-fault.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=
=3D"true">Intel XE#288</a>) +29 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_exec_mix_modes@exec=
-simple-batch-store-lr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send=
=3D"true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_live_ktest@xe_migra=
te@xe_validate_ccs_kunit.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-se=
nd=3D"true">Intel XE#2229</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-8/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send=3D"tru=
e">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_media_fill@media-fill.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2459" moz-do-not-send=3D"true">Intel XE#2459</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596" moz-d=
o-not-send=3D"true">Intel XE#2596</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_media_fill@media-fill.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/560" moz-do-not-send=3D"true">Intel XE#560</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_mmap@small-bar.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/586" moz-do-not-send=3D"true">Intel XE#586</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_mmap@small-bar.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/512" moz-do-not-send=3D"true">Intel XE#512</a>)</l=
i>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_mmap@small-bar.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/512" moz-do-not-send=3D"true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@force-load:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@force-load.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>)=
</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@force-l=
oad.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378=
</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@force-load.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_noexec_ping_pong:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_noexec_ping_pong.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/379" moz-do-not-send=3D"true">Intel XE#379</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@buffer-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_oa@buffer-size.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4501" moz-do-not-send=3D"true">Intel XE#4501</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2248" moz-do-not-send=3D"true">Intel XE#2248</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@polling-small-buf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_oa@polling-small-bu=
f.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#2541=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
 moz-do-not-send=3D"true">Intel XE#3573</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_oa@syncs-syncobj-wa=
it-cfg.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE=
#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573" moz-do-not-send=3D"true">Intel XE#3573</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4501" moz-do-not-send=3D"true">Intel=
 XE#4501</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1420" moz-do-not-send=3D"true">Intel XE#1420</a>)</l=
i>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_pat@pat-index-xehpc=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2838" moz-do-not-send=3D"true">Intel XE#2838<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" m=
oz-do-not-send=3D"true">Intel XE#979</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1420" moz-do-not-send=3D"true">Intel XE#1420</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838" moz-do-=
not-send=3D"true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_pat@pat-index-xelp.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/977" moz-do-not-send=3D"true">Intel XE#977</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_pat@pat-index-xelp.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2245" moz-do-not-send=3D"true">Intel XE#2245</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2236" moz-do-not-send=3D"true">Intel XE#2236</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_peer2peer@read@read=
-gpua-vram01-gpub-system-p2p.html" moz-do-not-send=3D"true">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-=
send=3D"true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@xe_peer2peer@write.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2427" moz-do-not-send=3D"true">Intel XE#2427</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_peer2peer@write.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1061" moz-do-not-send=3D"true">Intel XE#1061</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_pm@d3cold-mocs.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_pm@s2idle-d3cold-ba=
sic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel =
XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/366" moz-do-not-send=3D"true">Intel XE#366</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" =
moz-do-not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-mocs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_pm@s3-mocs.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>) +3 other test=
s
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_pm@s4-basic.html" m=
oz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4268" moz-do-not-send=3D"true">Intel XE#4268</a>) +1=
 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html"=
 moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4268" moz-do-not-send=3D"true">Intel XE#4268</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_query@multigpu-query-inval=
id-extension.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Int=
el XE#944</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@xe_query@multigpu-query-inval=
id-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE=
#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt@xe_query@multigpu-quer=
y-mem-usage.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Inte=
l XE#944</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disab=
ling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_sriov_auto_provisio=
ning@resources-released-on-vfs-disabling.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130"=
 moz-do-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-n=
umvfs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-d=
o-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4351" moz-do-not-send=3D"true"=
>Intel XE#4351</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displ=
ays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=3D"true">=
Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12801/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-216=
0x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel X=
E#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/igt@kms_bw@conne=
cted-linear-tiling-2-displays-2160x1440p.html" moz-do-not-send=3D"true">PAS=
S</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D=
"true">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12801/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-at=
omic-transitions-varying-size.html" moz-do-not-send=3D"true">PASS</a> +5 ot=
her tests pass</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-ato=
mic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-s=
end=3D"true">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">PASS</a=
> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/=
shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" moz-do-n=
ot-send=3D"true">PASS</a> +3 other tests pass</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interru=
ptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true">Intel XE#=
310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2801/shard-dg2-435/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html" m=
oz-do-not-send=3D"true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1280=
1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html" moz-do-=
not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:<=
/p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndsc=
rn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"tru=
e">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12801/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-cur-indfb-onoff.html" moz-do-not-send=3D"true">PASS</a> +4 other tests pas=
s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send=3D"t=
rue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/718" moz-do-not-send=3D"true">Intel XE#718</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_pm_dc@dc=
5-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE#1435</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/=
igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send=3D"true">PASS</a=
></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-=
1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-8/igt@kms_universal_plane@universal-plane-functiona=
l@pipe-a-edp-1.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"t=
rue">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12801/shard-lnl-3/igt@kms_universal_plane@universal-plane-func=
tional@pipe-a-edp-1.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459" moz-do-not-send=3D"true">Intel XE#4459</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@k=
ms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send=3D"true">PASS</a> +1 other t=
est pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-lnl: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8276/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
276/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-l=
nl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8276/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_827=
6/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl=
-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-3/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/=
shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-2/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-7/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-6/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-lnl-6/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/=
shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-6=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-4/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-lnl-5/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#3=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2801/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/sha=
rd-lnl-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12801/shard-lnl-4/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12801/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12801/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1280=
1/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-=
lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-1/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-5/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-6/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12801/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12801/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2801/shard-lnl-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/sha=
rd-lnl-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-7=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-3/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>)</li>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
276/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-b=
mg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8276/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_827=
6/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg=
-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-2/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/=
shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8276/shard-bmg-4/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shar=
d-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-8/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12801/shard-bmg-3/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12801/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12801/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/s=
hard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg=
-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-1/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-4/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12801/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12801/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1280=
1/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-=
bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-6/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>)</li>
            <li>shard-dg2-set2: (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_827=
6/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-d=
g2-435/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_modu=
le_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8276/shard-dg2-435/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8276/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/sh=
ard-dg2-434/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-4=
64/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8276/shard-dg2-436/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8276/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276=
/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg=
2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-463/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8276/shard-dg2-434/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_=
module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@xe_module_load@load.html" m=
oz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12801/shard-dg2-466/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12801/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-se=
nd=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12801/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12801/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/=
shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-=
dg2-434/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-43=
4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-433/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-464/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-436/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12801/shard-dg2-463/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12801/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
801/shard-dg2-436/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/sh=
ard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg=
2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdm=
i-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-=
rc-ccs-cc@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-sen=
d=3D"true">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-no=
t-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +6 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a=
-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-=
mc-ccs@pipe-d-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D=
"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-435/igt=
@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +8 other te=
sts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4440" moz-do-not-send=3D"true">Intel XE#4440</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/=
shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4418" moz-do-not-send=3D"true">Intel XE#4418</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-7/igt@kms_content_protection@srm.html" moz-do-not-s=
end=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4132" moz-do-not-send=3D"true">Intel XE#4132</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-bmg-2/=
igt@kms_content_protection@srm.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-no=
t-send=3D"true">Intel XE#1178</a>) +1 other test
              fail</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-435/igt@kms_content_protection@srm.html" moz-d=
o-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4132" moz-do-not-send=3D"true">Intel XE#4132</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard=
-dg2-464/igt@kms_content_protection@srm.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-inter=
ruptible.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"true">=
Intel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12801/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-inte=
rruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel=
 XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downsc=
aling:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp=
-xtile-downscaling.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4528" moz-do-not-send=3D"t=
rue">Intel XE#4528</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to=
-16bpp-xtile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-se=
nd=3D"true">Intel XE#1397</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp=
-xtile-downscaling@pipe-a-default-mode.html" moz-do-not-send=3D"true">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4528" =
moz-do-not-send=3D"true">Intel XE#4528</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-lnl-2/igt@kms_flip_scaled_crc=
@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1397" moz-do-not-send=3D"true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-mu=
ltidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidra=
w.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311=
</a>) +16 other
              tests skip</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-i=
ndfb-multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">I=
ntel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12801/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-m=
ultidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel X=
E#651</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullsc=
reen:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr=
-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"tru=
e">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12801/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn=
-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D=
"true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">=
Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12801/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true"=
>Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tr=
ue">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12801/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn=
-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=
=3D"true">Intel XE#4141</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-mov=
e:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-spr-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"=
true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-s=
cndscrn-spr-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D=
"true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p=
>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-=
multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel=
 XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12801/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mult=
idraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#=
2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tru=
e">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12801/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D=
"true">Intel XE#2313</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scn=
dscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-sen=
d=3D"true">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12801/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not=
-send=3D"true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-full=
screen:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scn=
dscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-sen=
d=3D"true">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12801/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-n=
ot-send=3D"true">Intel XE#656</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8276/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3374" moz-do-not-send=3D"true">Intel XE#3374</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send=3D=
"true">Intel XE#3544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12801/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-w=
ith-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">In=
tel XE#362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12801/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1500" moz-do-not-send=3D"true">Intel XE=
#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@testdisplay:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8276/shard-dg2-434/igt@testdisplay.html" moz-do-not-send=3D"t=
rue">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4540" moz-do-not-send=3D"true">Intel XE#4540</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12801/shard-dg2-432/igt@testdis=
play.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send=3D"true">Intel XE#=
2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
540" moz-do-not-send=3D"true">Intel XE#4540</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8276 -&gt; IGTPW_12801</li>
      </ul>
      <p>IGTPW_12801: 12801<br>
        IGT_8276: 8276<br>
        xe-2825-a958e31a81b3267201c85b6f171419586afa792c:
        a958e31a81b3267201c85b6f171419586afa792c</p>
    </blockquote>
  </body>
</html>

--------------ZyjbMcRlswtPaaUy4oNwsSgp--
