Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B89C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 12:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999710E866;
	Mon, 25 Mar 2024 12:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df7R17No";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B17F10E860;
 Mon, 25 Mar 2024 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711371171; x=1742907171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QC5t1dtdcdQekm3Qpbw/PqLWOT6i+gTJtYJmyVEkiV4=;
 b=df7R17No472f8ici20F8P7kK2+LpQ7BFOSCeWHNrHxSKvmUoN+PFVQZq
 o8CInZOWghNF5cpIr66sSgG+A8CbnlIzGxNsEYOPjizrU0iVOAkVRMQh0
 LlVFkn7DxvgK3zR0UU1EM3+J0Y8OhgsYw1tM4Oe9igwGmJ3S4BHve0/Ja
 dBvNKiTfU8WtK6mm1I+z/gFjuwf6CP6L9mKLPPRslUOWVKcyjDvITj6IW
 UgagtmF5bvRPygf0j1tvkSkUK7k1w1IoST1f3LmIWP/gkHr3oNll6+vtU
 bFN4JwhgJig7u9+JGEtJOH/GLgNWONOp173+71h4c5wJSUI4k9qcmC/8R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6224948"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6224948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 05:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16271956"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 05:52:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 05:52:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 05:52:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 05:52:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 05:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK1yK+w4VcoT+BDx3PJImpvmtacaIjlO2AMFDvV6sPwr/YiIENKGC+jXpnFmJd0w3DjBzV8/OwWmH1AdLsFnZTgdiUNVitAHnqbAuo+Hwus6M3LfdgRIGURNCaeC497vHmZVK/F0BLohZmOVJs15xIweepJNM0w0t1wysphpWWZh3M9lXsoCZuWeNTI0I3dqYUZJbkAR5QGr8MH+8QTA7GMcqTrirhV+HUJFJB2tyWJcce9x3mdUpMrirW/VGBXxa/fJI/mqsKnEHs14+Cif/mlk0YadziEu/twK8D3bYjU4H9T5aqdN/kIXGEmNkenohinPW3Taxi8ww+mVPlrp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC5t1dtdcdQekm3Qpbw/PqLWOT6i+gTJtYJmyVEkiV4=;
 b=h036Jd/1bZ0shEPNEGov6RINpuZiBHljRCgFMfzvmTCixNGFPqNTZxNpZAf3fd8P/SePCinNsV5F/gj0kEelvY2uX9MQaEdo8zc2TgXRX0ADdixPJ16jjunCUd53I1YDGAZkgtOyCA5dYAV1DJiFMMnPRDZQY92AUdGQFYiZcJvRiy3239f2K4OmC6NE7avuExws6w3Kgh78mulQDtoNckk7qzFgDBwyTkE5lCfLF0CxymxycMx4++aZeGDFAahv2C5NQw6d+Bhpyj7PF+nmm5jOQr0gvzj6sV21+DEfoN/0drKjkIoiAxK6/wdSTVonyG3X1bbAuEBhtaWNgUvLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 12:52:46 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 12:52:46 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, LGCI Bug Filing
 <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGludHJvZHVjZSBYZSBt?=
 =?utf-8?Q?ultigpu_and_other_multi-GPU_helpers_(rev14)?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50cm9kdWNlIFhlIG11bHRp?=
 =?utf-8?Q?gpu_and_other_multi-GPU_helpers_(rev14)?=
Thread-Index: AQHae2QGAzOV0YEnMkShF/p9KpAmfLFCJZ2AgAZJ/nA=
Date: Mon, 25 Mar 2024 12:52:46 +0000
Message-ID: <PH8PR11MB6753DA8DD9C9CFA3F237B451F2362@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <171100720036.938898.3335037622784355245@8e613ede5ea5>
 <20240321124923.fdlo7rkpygvnv6g7@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240321124923.fdlo7rkpygvnv6g7@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CH0PR11MB8190:EE_
x-ms-office365-filtering-correlation-id: 6b0db2c4-12d6-44cd-e13c-08dc4cca7823
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MVWAo7/HKoejKGkmgR36qHIHasZq6yAA3+U7AAokGRlBVg3j+tgkwAsiAF/ckeBchxnOKQw29RIOZ+Wsj7k1aumKD9p5MtAeMJfUXP7QyF38keVE9aWMR5eEbIf7WrGdAtGj4WJMGxXX1tes4O8BS3roruH/IqTqR32ieGIBBtLU5+wQ5V7SIqqAH7ks6//vI4l1TCF98fW/zkod+0sZZdYA3p2kAoomXLzN+OkOkEV98qcacPekklA3kDHwoCv+8VBL6YZGAS1xFf41/6EHJCbsOe2akSawx8nVkSN9W7pfceHvXkOofu8H/Irou7SJP0OcSUcfsyoJ4KQU8DdlLJAvbBCU1gPnZcTGX1u2QDzmSrr0k8x6hhhAXl/lAlfUh5uMDq8P8wezKk+orenOcoCO8qpAWEEsvgrvy6zkhGVo6utpdrYkMQHW8fWruqFzmIkQFzHdDspsWxOv4A5AFbVxXuG5Bx3QgjCwvGjlrINM7otSryyN6wu1x0lLcSzND2iD0fH0UBCdPh0ERVaNhxN2UZA6bF0GjhWIqW6j41nNI5DpqX5dx15xC8TQ5/7b3oyzDAxi9SRSSjdSC74JqSA8x1UZxRe9y2ryg2I8FsWgcZt2QZeds2JhHOW0gdLR30o0pFjI3ogGbqcw4Wfu3ZRNMeEMUAfWR4hwbk7uGSao0bTifbaRMFTTyODYJ9Sh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bCtDV0ZZTFlJcWJrL3Y0MWF4U3k2ai8vNHU4Q0tndm1wdFI5MCtGeG5TM1U1?=
 =?utf-8?B?NzVDTmJaV0tUNzZMVWhZVmpPQUg2b2Q2TG5vQzZTamk5SjRlMFZLalpkSTFw?=
 =?utf-8?B?RWkzRUFnM2ZPV3Y1bjduZXJtUnJVK014YjcycWZhZWlHUzFNMXlRQ1RWdklx?=
 =?utf-8?B?RTcvWTNHUGtJanhFK3FZNytlcCtHYzNJbFBBRkhOYlRzMlFzbkRPWUtmVW41?=
 =?utf-8?B?SjRzbVV4S3RDNWNNaEJVK3ptQTR2OER6T2hnZmk1VGlMMnlKaXFGTzFBMUl6?=
 =?utf-8?B?THYzeSt2aHZZekQwRTdWODU0c1dNNXgwVEJzZjM1bkpTUEUxTWVzc2VXVW5y?=
 =?utf-8?B?V2lnM2l0WkwrcktRUHRGYWl6dGV4TnNGVVljaEY5ZCtWYkVwMjJLT3R1Nk5q?=
 =?utf-8?B?c2FpQWdPUDJteng2d05rYVA2SlJ6eUpPNnF3Z2ZVbGxJNUxjQjFqZEJGcXFT?=
 =?utf-8?B?WHpWUW1XOVRSalh2UldsZDB5YkFuL00zWnk4YytBTEhzVlhveVZaazVxV3ZW?=
 =?utf-8?B?SEIwVVZBSHZObmtDSStOVGxKN2hWT3JNcUhWMVREeWhlV0JORHNhekNwQnF4?=
 =?utf-8?B?emNJL2w5VkVDbzhtY205eTk5MzJJcXcxNm8wTml3SndacFZCTkU2djd3L0Mv?=
 =?utf-8?B?SDJOY1pKWXZsanoxUnNjTHR3QjZlR0p5YXJMTjMyZHExd3k3aFdmSFptZDFq?=
 =?utf-8?B?emdkZ3BHeUcrazhyeXRzQ01jUmtEZHU2VVlKS2s3TjkyY3Z6S0cwdUJxY3lD?=
 =?utf-8?B?ZERyd1Nxd0I2L1c2SFUvNEpHbmxIOFd2SGQ1RWhwanFGdVNNSFZNWURlQTBo?=
 =?utf-8?B?ZFhtVS9Ic3NQdE0zbUNWQXMrMmswUC90RHhralNlTlg3NHpDVkdiL2lpUG1n?=
 =?utf-8?B?V1FveGptVklnTjdaN3p5MFBFS2pQbFo4VGpyNm5USTJIYnRCMFNkeVBjVC9C?=
 =?utf-8?B?bHFpWXhmN3JZcWZRUUMzalBsb3hLTzNxN0VBdmhkVm5Fcm9PZlNremN5OE1N?=
 =?utf-8?B?QUl5MXBUSXVrakVkc3YwdUVKSE5wazY5YkhvejFNVmIrak5aSVFSeDVudktt?=
 =?utf-8?B?dXRiRFBtOG8xV3RXenFUR3dIdGplUk8yVHl3VU1sajFjRmNZRzlMaDJENkxC?=
 =?utf-8?B?YmEwVEtDYThWei9RTzI1ajM3a2dUbktHTU5xdUtsVGFUYzNuSC9ya3lVV0NZ?=
 =?utf-8?B?a1dseWxUMVFpMnBRQnRXeVE3QVZWYzN0c0ljRDZCcURTZ2JENUFuZzVEVDI2?=
 =?utf-8?B?UkI3UUVLMmRDek5sZmJoNWJxNjJwRlFIa0hLMnV6Vk50UzRTQkFiM1dmbTFX?=
 =?utf-8?B?STgyMkN5d3pQeGlaS2VqT0dRQmdhdHJBQ2pVaGp3UHAvUjExSGtlY25leFVo?=
 =?utf-8?B?ckJqQUdDbkIrMDNuTkpCVTBYNERiZUlXeEtYRGV5bkpKeVp1WXFOdDV3QmNx?=
 =?utf-8?B?VFNFQ3FHK3B6d0RXTE1jYVIrU3J2R2ttME94ODgxZmtmc2szNWNrc0Z1RVh4?=
 =?utf-8?B?NGV5U1k3cTlDZXU0TER6b1M3SmpYcWJsRmRxMTdzNWo4ZzBqVDdjRGp2RzdE?=
 =?utf-8?B?cDNTOW5nL2g1U3VoelVBbkQ4bU12L2VRUGUrazJ2bG1TVGNhZDRIUWJVOVZJ?=
 =?utf-8?B?M2xoRHJVMG9MS0hlcWcybmlzVGE2aVIzVmtrd08raWpNTVdWZXl2RGFoajhz?=
 =?utf-8?B?T0RUUHIyUmxBVXRjRUF3UzJ1L1h6czJGd3Z6T1VMRGZpLzN2UVVJS01HWHR1?=
 =?utf-8?B?enhpYncyODZIZEVTdnluaStJRHFVVjVjS2hhVXZSNGxjbUdIQTd4cUxNSkVp?=
 =?utf-8?B?VzJyMEhJNkRFNzlOcDVTOFZBaDl2MGQ0dGRaQkNjQXEyQjlBa1VLRmRISW1s?=
 =?utf-8?B?NkR1Ymk5TE9sZTN1cmFBcjloNEowSXUyZW15cmRmT1RLR011SWFwUXFoMjV5?=
 =?utf-8?B?WEovSCt2VjcreWxlVjFvTHVUV21UekhMTGxFSkxXc0hMR0R0ZGJzN09YSmdJ?=
 =?utf-8?B?YjFHdjBzRTlFcXNEYmEzZ052R3A4bXYwTWNMSnI0eWREZUtrRVNmbU9aajBU?=
 =?utf-8?B?M01wRXM3UXphZ0wwTmVaSTdGS2IxUWthb1RRTlFPL0NmZmltMUEwRThBS0c4?=
 =?utf-8?B?MWJqOEdpNFZRV2ltVll1aGhNZWhvSFhsVFkrZVl3Qi8wS1lyMmNIUzN4YkFV?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0db2c4-12d6-44cd-e13c-08dc4cca7823
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 12:52:46.1957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sgSL8o0eUaXCWUFjNhAnMPchBF1kMoC8y8hEUZlEby1LVmpUCDSHEk1swHyaQz6B2dqyqOFIDVDXo/EgcZWI++V2Mgk6RAQCdBHyV192C9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
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

SGksIA0KDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyOTEwMS8g
LSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KVGVqYXNyZWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTWFyY2ggMjEsIDIwMjQgNjoxOSBQTQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IExHQ0kgQnVnIEZpbGluZyA8bGdjaS5idWcuZmlsaW5nQGludGVsLmNvbT47
IElsbGlwaWxsaSwgVGVqYXNyZWVYIDx0ZWphc3JlZXguaWxsaXBpbGxpQGludGVsLmNvbT4NClN1
YmplY3Q6IFJlOiDinJcgRmkuQ0kuSUdUOiBmYWlsdXJlIGZvciBpbnRyb2R1Y2UgWGUgbXVsdGln
cHUgYW5kIG90aGVyIG11bHRpLUdQVSBoZWxwZXJzIChyZXYxNCkNCg0KSGkgaWd0LWRldiwNCk9u
IDIwMjQtMDMtMjEgYXQgMDc6NDY6NDAgLTAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2Vy
aWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogaW50cm9kdWNlIFhlIG11bHRpZ3B1IGFuZCBv
dGhlciBtdWx0aS1HUFUgaGVscGVycyAocmV2MTQpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjkxMDEvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiAN
Cj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1f
MTQ0NTdfZnVsbCAtPiBJR1RQV18xMDg2Nl9mdWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0N
Cj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29t
aW5nIHdpdGggSUdUUFdfMTA4NjZfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJp
ZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5n
ZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGlu
IElHVFBXXzEwODY2X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1p
bmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVu
dCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZl
cyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDg2Ni9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNp
cGF0aW5nIGhvc3RzICgxMCAtPiA5KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IHNoYXJkLXNuYi0wIA0KPiANCj4gUG9zc2libGUgbmV3
IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTA4NjZf
ZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVn
cmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBnZW1fY3JlYXRlQGNyZWF0ZS1jbGVhckBzbWVt
MDoNCj4gICAgIC0gc2hhcmQtZGcxOiAgICAgICAgICBbUEFTU11bMV0gLT4gW0lOQ09NUExFVEVd
WzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9D
SV9EUk1fMTQ0NTcvc2hhcmQtZGcxLTE4L2lndEBnZW1fY3JlYXRlQGNyZWF0ZS1jbGVhckBzbWVt
MC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTA4NjYvc2hhcmQtZGcxLTE2L2lndEANCj4gZ2VtX2NyZWF0ZUBjcmVhdGUt
Y2xlYXJAc21lbTAuaHRtbA0KPiANCj4gICAqIGlndEBpOTE1X3BpcGVfc3RyZXNzQHN0cmVzcy14
cmdiODg4OC11bnRpbGVkOg0KPiAgICAgLSBzaGFyZC1zbmI6ICAgICAgICAgIFtQQVNTXVszXSAt
PiBbRkFJTF1bNF0NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0NJX0RSTV8xNDQ1Ny9zaGFyZC1zbmIxL2lndEBpOTE1X3BpcGVfc3RyZXNzQHN0cmVz
cy14cmdiODg4OC11bnRpbGVkLmh0bWwNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDg2Ni9zaGFyZC1zbmI2L2lndEBpOQ0KPiAx
NV9waXBlX3N0cmVzc0BzdHJlc3MteHJnYjg4ODgtdW50aWxlZC5odG1sDQo+IA0KPiAgICogaWd0
QGttc19jdXJzb3JfY3JjQGN1cnNvci1vZmZzY3JlZW4tNjR4NjRAcGlwZS1kLWVkcC0xOg0KPiAg
ICAgLSBzaGFyZC1tdGxwOiAgICAgICAgIFtQQVNTXVs1XSAtPiBbRkFJTF1bNl0NCj4gICAgWzVd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNDQ1Ny9z
aGFyZC1tdGxwLTMvaWd0QGttc19jdXJzb3JfY3JjQGN1cnNvci1vZmZzY3JlZW4tNjR4NjRAcGlw
ZS1kLWVkcC0xLmh0bWwNCj4gICAgWzZdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMDg2Ni9zaGFyZC1tdGxwLTEvaWd0QA0KPiBrbXNfY3Vyc29y
X2NyY0BjdXJzb3Itb2Zmc2NyZWVuLTY0eDY0QHBpcGUtZC1lZHAtMS5odG1sDQo+IA0KPiAgICog
aWd0QGttc19zZXRtb2RlQGJhc2ljQHBpcGUtYS1oZG1pLWEtNDoNCj4gICAgIC0gc2hhcmQtZGcx
OiAgICAgICAgICBOT1RSVU4gLT4gW0ZBSUxdWzddICsxIG90aGVyIHRlc3QgZmFpbA0KPiAgICBb
N106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEw
ODY2L3NoYXJkLWRnMS0xNS9pZ3RADQo+IGttc19zZXRtb2RlQGJhc2ljQHBpcGUtYS1oZG1pLWEt
NC5odG1sDQo+IA0KPiAgIA0KPiAjIyMjIFdhcm5pbmdzICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2Vt
X2Vpb0BrbXM6DQo+ICAgICAtIHNoYXJkLWRnMTogICAgICAgICAgW0ZBSUxdWzhdIChbaTkxNSM1
Nzg0XSkgLT4gW0lOQ09NUExFVEVdWzldDQo+ICAgIFs4XTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fMTQ0NTcvc2hhcmQtZGcxLTE3L2lndEBnZW1fZWlv
QGttcy5odG1sDQo+ICAgIFs5XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTA4NjYvc2hhcmQtZGcxLTE4L2lndEANCj4gZ2VtX2Vpb0BrbXMuaHRt
bA0KPiANCj4gICAqIGlndEBrbXNfY3Vyc29yX2NyY0BjdXJzb3Itb25zY3JlZW4tMTI4eDQyOg0K
PiAgICAgLSBzaGFyZC1tdGxwOiAgICAgICAgIFtTS0lQXVsxMF0gKFtpOTE1Izg4MTRdKSAtPiBb
QUJPUlRdWzExXQ0KPiAgICBbMTBdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0NJX0RSTV8xNDQ1Ny9zaGFyZC1tdGxwLTIvaWd0QGttc19jdXJzb3JfY3JjQGN1cnNv
ci1vbnNjcmVlbi0xMjh4NDIuaHRtbA0KPiAgICBbMTFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDg2Ni9zaGFyZC1tdGxwLTgvaWd0QA0KPiBr
bXNfY3Vyc29yX2NyY0BjdXJzb3Itb25zY3JlZW4tMTI4eDQyLmh0bWwNCj4gDQoNClRoZXNlIGFy
ZSB1bnJlbGF0ZWQgdG8gY2hhbmdlcywgcGxlYXNlIHJlc3Bpbi4NCg0KUmVnYXJkcywNCkthbWls
DQoNCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFy
ZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMDg2Nl9mdWxsIHRoYXQgY29tZSBmcm9tIGtu
b3duIGlzc3VlczoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgSXNzdWVz
IGhpdCAjIyMjDQo+IA0KPiAgICogaWd0QGRlYnVnZnNfdGVzdEBiYXNpYy1od21vbjoNCj4gICAg
IC0gc2hhcmQtbXRscDogICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzEyXSAoW2k5MTUjOTMxOF0p
DQo+ICAgIFsxMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzEwODY2L3NoYXJkLW10bHAtNi9pZ3RADQo+IGRlYnVnZnNfdGVzdEBiYXNpYy1od21v
bi5odG1sDQo+IA0KDQouLi5jdXQuLi4NCg0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0t
LS0NCj4gDQo+ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfNzc3
MCAtPiBJR1RQV18xMDg2Ng0KPiAgICogUGlnbGl0OiBwaWdsaXRfNDUwOSAtPiBOb25lDQo+IA0K
PiAgIENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xNDQ1NzogY2ZlMjVkYzlhZTJl
MWFkZDNmMjYwNTgzMWJmNmQ4YmVhNDgxMTY0YiBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Au
b3JnL2dmeC1jaS9saW51eA0KPiAgIElHVFBXXzEwODY2OiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwODY2L2luZGV4Lmh0bWwNCj4gICBJR1RfNzc3MDog
ZmVmMDQyMmZkMjk2ZjdjNjU3MjQzMTVmMmE0NTVmZmI2OTU5ZmIwZCBAIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICBwaWdsaXRfNDUwOTog
ZmRjNWE0Y2ExMTEyNGFiODQxM2M3OTg4ODk2ZWVjNGM5NzMzNjY5NCBAIA0KPiBnaXQ6Ly9hbm9u
Z2l0LmZyZWVkZXNrdG9wLm9yZy9waWdsaXQNCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBt
b3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RQV18xMDg2Ni9pbmRleC5odG1sDQo=
