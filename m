Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF470D3A694
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 19:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC8410E1DC;
	Tue, 29 Oct 2024 19:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXuTSEXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8001F10E1DC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730229309; x=1761765309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhQkjBBwkj5Yt7br7aQyw7GhNZ6tHtmAl8u3AMnBeIs=;
 b=hXuTSEXbi/1i6nrNhej4mID9tCdg5iQIZrD4AzOx5VLrjGXSEOTKF0lM
 ACZJDKNYIjWXHiFJr1afhgMC9odJdrZj3uD2TruYNIdW02lAnEN4yNlAF
 0FSNgqtzxImGUaPOKEDqmOff8YM/nyiPRFePTjrDDNHBSWqxrVFS/Xb/H
 FEPb0SlqvCMV8NWNRbAGsAF9+yrt9qcYHZVow3bZcHVJQ5S2xXGOZSZSO
 jRCdF1oUao4WS/CSKrjPpQc1/UeIjiGPAvhCDQC59+d3OXzyv0CkvuLRN
 DYihirRMWyBdsoxmFONQmJbwbj/vpsjdfrR0eCNmqCkiL3m6m4W8YXsjm w==;
X-CSE-ConnectionGUID: MbQibqUzRx6fSEpLF644ZQ==
X-CSE-MsgGUID: QrnrOY0HSGKrystP8ettvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29746013"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29746013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:15:09 -0700
X-CSE-ConnectionGUID: kyeiBhMfTAKnhpD67DgnqQ==
X-CSE-MsgGUID: M8atyVfmRHC+FYzKE02mjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="86813891"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:15:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:15:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:15:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bwp9LT+Bfou6WsE6NayGG24mVmFh3jwOJA10g3e45qW3PVtV8X+LikaRlyZ5XgA+ExkCp0YbO0qW2Qh1gYwpCdyoM1O9hKDbj5TxRUgWICocfOHxILR0Z/2apJt2v+tIENIWd+sZC78jcokq6nFzSOtrKm+IgdQdtXJXhpcVvZFrqGUzA+RLs7NnTajgGiwfgyHR8b1JtnaLmg3C14nBMB2kVMeTRY5cjyrJpYU0WZxuz2FpmTqJsUX1BPxDUV1bQUeaBu8G0UjA1DlAAQVh5UgeQYIg+DKu9RWInxaTgctuigDqTeawwbOBn8DpTXiZRPSUAG2ks3P5i2S4JDvt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhQkjBBwkj5Yt7br7aQyw7GhNZ6tHtmAl8u3AMnBeIs=;
 b=Kco57rCMqaMPtUV3Ujsixee16VaSJphKFnkKtX4dngeMEqNTuu7jfnn+UO/KgHCKOPuPYJ+lRc8yJGjNp1+dv7K1e9769h4aBkKqz9Poxo3LsaQNb4bKebn92swjNseiZUSgfXR917//UL1v8rEhfO7X2xRO1DBq1r7LNKexsKg7bBAmtQXKiQe0sKxdY+vw7ky52W29+R8TlDBjxIQd+ylJOe+PWeVQnRynIiLM9G9J0o2etqoyTYXLn05nEyxKTadcivnIuitqZ9Zycf3Qdq1r4eB+IKJ/U7n/2ek738o8LCXriMYUzWNzUxbGtor4Lrr6PRFXHoa9vcbvqVD5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 19:15:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 19:15:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Thread-Topic: [PATCH i-g-t v2 1/2] tests/intel/xe_wedged: Ignore more dmesg
 warnings
Thread-Index: AQHbKi+oW983B5KLuEq252ujT4KdrrKeGKSw
Date: Tue, 29 Oct 2024 19:15:04 +0000
Message-ID: <CH0PR11MB5444DC44BFF8CE88DA1A6DEFE54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
 <20241029182259.125117-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241029182259.125117-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV2PR11MB5997:EE_
x-ms-office365-filtering-correlation-id: 022398b2-eb62-471e-4e0f-08dcf84dfe43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnNlRTZTalFwNXB4ZzViZEZ3eU9QS1ZodzlwM2EvV1MrS1FyVENXdzg2WSsz?=
 =?utf-8?B?QkFTb3RtOWxhZjBFV0N5ZWZiaGV1Si9wc2ptQ3dVOEtsK2MySFMza3RBYjJL?=
 =?utf-8?B?RzNOanJpTXRvdGtrWGlWZ2kzck9SSys4bnZCL09ibks2ZzJlcWVrZEVpZ1Zl?=
 =?utf-8?B?OGxZOGttMWkwU1d2YjQwbzEvZVZHOFErZFFaMGJla3ppUkIyRUhOT1BlNUVV?=
 =?utf-8?B?dU4xYkxuRk9ucHJzT2tkb2V3dG9Dd2tpdHpPaTZFZ1c4L2hlRFRPTi9heHJM?=
 =?utf-8?B?cDVvSjdNZmErczhoZTJMU1IxUDNvWUhrVXlCVVNQTHBMZTNzMHluTmh6aW5j?=
 =?utf-8?B?c0IyQmxkZGhBaEUvbCs4ZkgyaFhaRzZsS3NqeEpYV2h0VlIvVU1ZQlEyc0s1?=
 =?utf-8?B?U2NaYi9GMXlIdU95L0t3WlFjK2srYTFTa2lzVEJHbUw2a04rcjI1cWtHUGx3?=
 =?utf-8?B?bnNSdjB6S0dzRHYrWGt1Mm5zNGJ3UWhPeDQwOHdjMmpFZno1K2dHYnoxS0Ny?=
 =?utf-8?B?T0N5SEdCeDU3WEhKazJObitZay8vaW5EQk4zTUJ1MEJENU1lclJtNnA0c1Z6?=
 =?utf-8?B?R2ZFVG00WGtCZ1ZqV1hUOVNIaU9RQkpOeWFaN3BSTFdzQ0Vnb3BycENCMUtu?=
 =?utf-8?B?aGxYWjhFNmlPZ2tQSUdYWnVIMXF2NURHcG9XNWdoRDkvbS9tRS9KRHBvbFpn?=
 =?utf-8?B?bDBQTUVoTm5IdjZaaFNyc3ZpRnhHc2lzWXMvdXlOMjZFMkR4S3UwbXM0c1Z6?=
 =?utf-8?B?M3Bwb3BteVBhRUxZVHBJWUNhd255M05NQk1aaldCc2JLRjVIYWxOdmwzVVRI?=
 =?utf-8?B?K2k5c3dmQ0NIY09pZVAvcVg5bDJINllOZkdnN3l5aXJmSWc1TnNTL1VTYlc3?=
 =?utf-8?B?US8yS01MeU9aTVdEQ1QzbTUzZXF6NGxuaDdOd3pnaWVyQ1ZvNlREaDZsYnlK?=
 =?utf-8?B?THFVemxNaFluSkZ4ekpmN0EwMFp6THdmeCs3Ry9jRXQxaS9HREdka0MvaUdB?=
 =?utf-8?B?UlpIWUgrZ3ZybVovcXJYdm5JcWN3K3RvY2xNWU92WUd1NW82TEVsaGxZY3ZB?=
 =?utf-8?B?K2Q2LzJHeWN0bzBSUmhkRVBSUTc2WTNYU3NvMWU2NWdiMUxvMitJeWJzNzlp?=
 =?utf-8?B?SFc5MWJtT0d2UGJvZjU1cTJaMUt1MnJwalVFTEVpYVF5NEdqUnVMMGZXemhi?=
 =?utf-8?B?WWNKNjduYy9NUS9GVXhxV3VWS3NFeGpsQ0NDSDRjMGcrbTRBZjFPSTVHTmpD?=
 =?utf-8?B?Y0VmVzV0MWRDRDBUak10TUJ5YTMxbUtsbTRETUg1eVFjMEN1ZE9yeG5aQWRi?=
 =?utf-8?B?ejl2ZWZXWGhHZSttVERuTm1FTXA1ZDF6VCtnRFIvcVEyYVFWT0RwTjdzSS9I?=
 =?utf-8?B?TGRaODJLVGdlaDFCKzQyUXlZR1FGQWlBeGNwa09sYm1kVVhocEkwZ1I5UDhE?=
 =?utf-8?B?R0NEakRPeVppUzBBUjBSQXA0ZUI3cFkwMHM0TE9VbHkwK3NrOTlSV1Q5LzZR?=
 =?utf-8?B?ZEZSR0ovUnBadDFRUVJNdWFyNDFLQUcxc2JsWUdWVlZOMklyNVdEaU5NTllV?=
 =?utf-8?B?S2hnTTBMUEtJbkJaRng1OHlLaytIRCtFNDBqV2kvVGpnMXg3RUtWS1R6bXJ2?=
 =?utf-8?B?QXZwVzRYTVNMVnRpVVRiT3IwR0ppTkQwRklzQnZJbi9XRTVreGcvTEVTLyth?=
 =?utf-8?B?R1VMZ3lGV2xxM29mbkNZYU12c1RsS1ZTVGJsN1hHZEpaM0MwT01POGIvRzdY?=
 =?utf-8?Q?z9jjqhz0q4q2CKYZ6pnwnqtt+fbsRYIeoA5krIo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WExYTmV0THlldmZwT2hWTFg3enEvSm5iNElyM1d0THE0U05hemtEMjRKQTN6?=
 =?utf-8?B?VGhWT0xLeTFlOThTQ2pLRm5WcnNmVXFyakROUGNNQVdWVzZRb1lkeVhQbW1r?=
 =?utf-8?B?bG90a0paS1NFbWFVMHE5Qkc4TkdoY1dIancvR1dvUWpySHNpL0VIWHBlRmlE?=
 =?utf-8?B?QlRoN2txc3J0cU90K3VLWCtJWjU3UHd2UXljWFRXY25DS2xkSGFldEpSejFH?=
 =?utf-8?B?azZWWmZvSFpwbkE0UElTVnoybWc5a1ordGdOU1hFVkR4SEc2bEp3NHozZUh2?=
 =?utf-8?B?TlJ2OVZhd1NlR3NvaDZKMzhRQXg1VC9sOEgyRHpMMFU2MlBBTSt5bzFCeXJU?=
 =?utf-8?B?elNlemxnUi90Sm5udFZwYjNjSFEwa1ZaN1hxU2h4SVRWSlYwTEJkRDFMN3M4?=
 =?utf-8?B?SlZJNTVUOXRkQkN2eUYvRUtZTWJNd3UvNW1ZTjU1bmtKdm9PUkxlRDBIZkRa?=
 =?utf-8?B?UnBFWlljOXpnaVpWaDBwNzhGNEtmc3lUa2V1RzFsbTNtVWV3d1hXb1dJQVN4?=
 =?utf-8?B?eXNtSlBDN3M1UzEzNFVFMjUyYXljYkV3c29GRytQV24rM29PSEYyV05DNG1X?=
 =?utf-8?B?emEzVFRoTGszYjFFbmhjTEdRR0FnSEZUVFBpS09XSmxWZWpHYnlwTVJGOHps?=
 =?utf-8?B?NWNtYUQxdGw3TmtTbmkvVzBpandZc1dYUTUvM0lSTzBKUlFDQ3RIWS9MM0NH?=
 =?utf-8?B?NmtSTHAva3hvS0Z0aUhTSVRJQjZPdWpNUUMxWnVLRDQ4cW1xVDB6WktCbEFk?=
 =?utf-8?B?WTMwbTM4enk4VWRobWhFRThGVzVzdmNNL0F1dkI1bDc0Qy9FTkV3NnlCRW4z?=
 =?utf-8?B?TVgzTldvdHdYVGE1OFJObHhCVkFOQlZWeHlJR1hlVkJ3TWthMkF5OHQ1azUr?=
 =?utf-8?B?T0liQ2wrOFZsMWNJUXZhK0toMmc1ZW0zc29LZkMwRWtPY1JuMlZXWjJmU2I1?=
 =?utf-8?B?VEdlK3gxaHFaeHI0eE0zK0FJUXJYMmNFVjJJS1pJZFpueEMvNWVKYit5ekFh?=
 =?utf-8?B?T0c2Vi84SGRSMzVDUlE2S09vTEp4TTFEUkJwSXI1eVFYMEI2SnlhZVdSd21n?=
 =?utf-8?B?YXlmZUxyeGUxNEJLMlRibFJNQWNNV1A2R3QweGVhNjZlcHVEMjJ2WHo2QmRq?=
 =?utf-8?B?NUxjWW50WE1yTWUzU3hkcXhBZjZnUDNSWWRpOGZwVTRvOHE4UDFXbS9KQm1n?=
 =?utf-8?B?bGREQWZwMExOS09pdENxd3F0VzQ4NEt0ckYzWjBLZWVpOEs3MnBVM1U0ZWIw?=
 =?utf-8?B?TEtSYVY5QmVpcGl6SklxaTljMFFScjA5aTg0ZmRSYklyNW5Wd2pkc0xmWDhu?=
 =?utf-8?B?RFBjc1YweGcxbkkyZ2djbzNodFpJdG1mR09GRGZQTStjc1VFNVlzcjBSWTYz?=
 =?utf-8?B?VWorR3pwM2oyQThlS2dGRWpONkhkUUk5OHM3OTUwVmp6eTdtVWVmRWIyUjcw?=
 =?utf-8?B?SG84cERORmhVeTRmbmdhYWVpQncwSXpTRlU5UWRWV01PZ24weW5kbE9CRTc2?=
 =?utf-8?B?OW5xTVkybENOak43bXdWaG1nNktUUzB1V1FQamY3UEttS1dJanQ0M0hrU0sx?=
 =?utf-8?B?WnZtYjFCM0J1RUplQ2Y4MzZrdXJEZXRCdjlvMG1KbUxxOW8rV3B3TElYRitT?=
 =?utf-8?B?RXNxdVFzc1lJWmkrbnp3VWhXMldQZUlNUElGeStSWUxZL29qdUtaUTdFeFR6?=
 =?utf-8?B?ckhvVzZQM1JwMUZRbzc5Q0p0M0hyKzlBc1FReDNPQXhUcjl2Y0JHVHlXRmZF?=
 =?utf-8?B?cTVBTUlhZGJCdDVIYjlFRy81bHYxMVk0bTBHVFJXbDdSNVhnaC9welNjc01u?=
 =?utf-8?B?T1RqcHRsYnU3amx0aUd5QVdOUWNLTFFKSVFwRFdBdzkrVUE4U3lVR0pWRktI?=
 =?utf-8?B?eWxteWhjc2lFZ0hoL3dKNlErbTFNR3VNOVBZS2hnanJITnVzK01NYjAyU0Rn?=
 =?utf-8?B?R2p2K3k2MVVKRTJScGlFNnF3bHRpek93bVI1enYxUzZseURBV1M0RmFIaWpr?=
 =?utf-8?B?eHEyc2tJMi9qaVkreEQ0TEdUZnNhUFc5S0ZNdVRjOFliZFFlRk5aZ1U1WmFo?=
 =?utf-8?B?ckRkc1pBdjNQVnNpU0tQdW5KUmJzNk5kRGN5VDJXamtSaUE0UGg0d3BlWVlF?=
 =?utf-8?Q?H2si/X9FZhfZIpODWv7oErsmE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022398b2-eb62-471e-4e0f-08dcf84dfe43
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 19:15:04.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcJUDsl7SZ5X42HH6vPp1b4rXuL6Xiv7DzNg6BykTCSuM60yyzl4hjrBGmbZJIsgJW9gU8gtr5b91uDLxDcWaM1qRk0kV8xRJTn9J0C9XTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI5LCAy
MDI0IDExOjIzIEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLYW1p
bCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBDYXZpdHQsIEpv
bmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmln
by52aXZpQGludGVsLmNvbT47IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6
eW5za2lAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYyIDEvMl0gdGVzdHMvaW50
ZWwveGVfd2VkZ2VkOiBJZ25vcmUgbW9yZSBkbWVzZyB3YXJuaW5ncw0KPiANCj4gVGhlcmUgYXJl
IG1vcmUgd2FybmluZ3MgaW4gZG1lc2cgd2hpY2ggc2hvdWxkIGJlIGlnbm9yZWQsDQo+IG9uZSBj
b21lcyBmcm9tIGRyaXZlciwgZm9yIGV4YW1wbGU6DQo+IA0KPiB4ZSAwMDAwOjAwOjAyLjA6IFtk
cm1dICpFUlJPUiogR1QwOiByZXNldCBmYWlsZWQgKC1FQ0FOQ0VMRUQpDQo+IHhlIDAwMDA6MDA6
MDIuMDogW2RybV0gKkVSUk9SKiBHVDE6IEZhaWxlZCB0byBzdWJtaXQgZ3NjIHByb3h5IHJxICgt
RVRJTUUpDQo+IA0KPiBvciBmcm9tIGRybToNCj4gDQo+IDw0PiBbNDM4LjY1MTQ0MV0gID8gX19w
ZnhfX19kcm1fcHJpbnRmbl9zZXFfZmlsZSsweDEwLzB4MTAgW2RybV0NCj4gPDQ+IFs0MzguNjUx
NDc2XSAgPyBfX3BmeF9fX2RybV9wdXRzX3NlcV9maWxlKzB4MTAvMHgxMCBbZHJtXQ0KPiANCj4g
b3IgZnJvbSBrZXJuZWwgaXRzZWxmOg0KPiANCj4gPDQ+IFsyMjYuNTk3MzU4XSBNb2R1bGVzIGxp
bmtlZCBpbjoNCj4gDQo+IHNvIGV4dGVuZCByZWdleCB3aXRoIHRoZW0uDQo+IA0KPiB2MjogbW92
ZSAnfCcgdG8gYmVnaW4gb2Ygc3RyaW5ncyBmb3IgYmV0dGVyIHJlYWRpbmcgKEpvbmF0aGFuKQ0K
PiAgIGV4dGVuZCByZWdleCB3aXRoIHR3byBtb3JlLCBjb3JyZWN0IF9fcGZ4X19fIHJlZ2V4IChL
YW1pbCkNCj4gICBhZGRlZCByLWIgYW5kIGNvcnJlY3RpbmcgbmFtZSBpbiBDYw0KPiANCj4gQ2xv
c2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vl
cy8yOTE5DQo+IENjOiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBaYmln
bmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX3dlZGdlZC5jIHwgNiArKysrKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV93ZWRnZWQuYyBiL3Rlc3RzL2ludGVsL3hlX3dlZGdl
ZC5jDQo+IGluZGV4IDg4ZTVkNDdmMi4uMTIzY2U2Mzk2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9p
bnRlbC94ZV93ZWRnZWQuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV93ZWRnZWQuYw0KPiBAQCAt
MjksNyArMjksMTEgQEANCj4gIHN0YXRpYyB2b2lkIGlnbm9yZV93ZWRnZWRfaW5fZG1lc2codm9p
ZCkNCj4gIHsNCj4gIAkvKiB0aGlzIGlzIG5lZWRlZCBmb3IgaWd0X3J1bm5lciBzbyBpdCB3aWxs
IGlnbm9yZSBpdCAqLw0KPiAtCWlndF9lbWl0X2lnbm9yZV9kbWVzZ19yZWdleCgiQ1JJVElDQUw6
IFhlIGhhcyBkZWNsYXJlZCBkZXZpY2UgWzAtOUEtRmEtZjouXSogYXMgd2VkZ2VkIik7DQo+ICsJ
aWd0X2VtaXRfaWdub3JlX2RtZXNnX3JlZ2V4KCJDUklUSUNBTDogWGUgaGFzIGRlY2xhcmVkIGRl
dmljZSBbMC05QS1GYS1mOi5dKiBhcyB3ZWRnZWQiDQo+ICsJCQkJICAgICJ8R1RbMC05QS1GYS1m
XSo6IHJlc2V0IGZhaWxlZCAuLUVDQU5DRUxFRCINCj4gKwkJCQkgICAgInxHVFswLTlBLUZhLWZd
KjogRmFpbGVkIHRvIHN1Ym1pdCINCj4gKwkJCQkgICAgInxNb2R1bGVzIGxpbmtlZCBpbjoiDQo+
ICsJCQkJICAgICJ8X19wZnhfX19kcm1fLipkcm0iKTsNCg0KSXQncyBzdGFydGluZyB0byBnZXQg
YSBsaXR0bGUgYml0IHNpbGx5IGhvdyBsb25nIHRoaXMgaWdub3JlIGxpc3QgaXMgZ2V0dGluZywg
YnV0IGlmIGl0J3MgbmVjZXNzYXJ5LA0KaXQncyBuZWNlc3NhcnkuDQoNCk15IFJldmlld2VkLWJ5
IHN0aWxsIHN0YW5kcy4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMg
dm9pZCBmb3JjZV93ZWRnZWQoaW50IGZkKQ0KPiAtLSANCj4gMi40Ny4wDQo+IA0KPiANCg==
