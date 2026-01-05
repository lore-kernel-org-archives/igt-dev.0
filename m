Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B6C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A4810E138;
	Mon,  5 Jan 2026 05:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgLY2aF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355AB10E138
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767591992; x=1799127992;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BClnH6KjtHKq8rPlRfqzKAEyJBVvnyI/GkWVQ/ww9hA=;
 b=KgLY2aF+QiGBLDa4gd/EQLIUE2GM1ZhhSfs3udNwia3lU3IguS6f/Ag2
 eZy7TXX8pAplwPkPCQ4y7QtO1R0A9OH7tH6XdvqKuC8xKmaBKG0Iutprb
 LrV3uCwuKHCrD9LOiFbswMIPkfo5WKnu43qkXMfc6XGZQ105K/RziTEKH
 cnrK5x66LjEgoDuGwji6gxvbDSr6ySrXeDnq0XU+44KD1pADqTL37lmXA
 xHYwBO3i/3yYKPjHIByDB8NIUqRH9m1LCGO6pprAYpnfzXriAZCh2EYt2
 8fZKEoZtKIyCtI1TLXJsGm7IxkiEsxRCBs7cnkuXHb1wzHUno/WyhmSbc Q==;
X-CSE-ConnectionGUID: 2wW0/pLuSk2Ek7kLATvHqQ==
X-CSE-MsgGUID: MD34A+FdTACDbkXRTHfBEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79678988"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="79678988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:46:32 -0800
X-CSE-ConnectionGUID: z3YciczxR3+PoV7cFPV22w==
X-CSE-MsgGUID: dYUU/EH6SAiwj1sEH6P+DA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:46:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:46:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:46:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:46:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEG+aZeR9mNESTLXtGIdzOk1cMOu26yEnVQo0J/bul9jkPpYK9qyV22oVbA4NHRUg703I90VJMQE+ULHEm/3nCAw9oiStr01kRRVdSOIHv3DtzXdmD7KC2Zb9yBH+dCOTOwuFdAew6NqvxhXBs6p/dhCU0XmsEznssB8RllFJ5vS9rDo8qxZD9GxV3S00y2ao1EN7U5CUXks6bhS7Pl/8qMD2Uw8HR9QIElQB5FvWmBEv0GPFXU5MO1G0ZhK9QDpYOH0SYJTWc0M0eE4SOGCSMCKGqVmaU/NgG9Bv/49KiT1K/CHA20x1joCG+GH+bCwwYgBRNyWOLiUoQHzu7U1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BClnH6KjtHKq8rPlRfqzKAEyJBVvnyI/GkWVQ/ww9hA=;
 b=QdzQahG8shQ3binTxlNlWkkBguopP9d8yrQEMHe31vO9HAFppUzsy5FiB4QScfU9G72o2RypgEEMjO8QnsoecUww3eMezxcoyn7inoC3cRaqYZeoCHTlLjLteMh/ai4GD626xd6yuK+p2TWqfOwwILkJqV/44fcRKDJMobNz83tcZyc2rOdFixFaE6sbHzoykBJh4IXiDVWt3ux48W7MewUK9ubho4wsLSbuqVhBdSFUENqwJwYo46yPCVtL7gGflej0BIQL6Onfm7VMT20bWUGxd7kMj91rQ33C4QNbOiuiFoghrfhUIZGAaH5pcdvG8VQP9grkbAAao387VpMN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:46:29 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:46:29 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v13 01/11] drm-uapi/xe: Sync with madvise interface
Thread-Topic: [PATCH i-g-t v13 01/11] drm-uapi/xe: Sync with madvise interface
Thread-Index: AQHcfffJQVAofE0saESoYyEjAY8UI7VDDcNw
Date: Mon, 5 Jan 2026 05:46:29 +0000
Message-ID: <BL1PR11MB5525F7EF3C9F67357CDAFB8B8486A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260105040000.181183-1-nishit.sharma@intel.com>
 <20260105040000.181183-2-nishit.sharma@intel.com>
In-Reply-To: <20260105040000.181183-2-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SN7PR11MB7491:EE_
x-ms-office365-filtering-correlation-id: 8f7727be-f872-427f-0ea2-08de4c1dc60c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MWVDam1STWJtRWcvei9WUmFTK1pnNGJKV0xYSlE2RUdaczFTb2lnY1JwMTV6?=
 =?utf-8?B?TE5yZGlVM0g2dmJHbklYSVIxUGYvRW5qYXpaYlJVaFVSY2cyTXU3bk9qcGlU?=
 =?utf-8?B?bWFjRWZHMVM1VDlsdjJVZHE5cElPMnV6c1RWTGRabVFuNWJ2NmZvejREamJh?=
 =?utf-8?B?OFRPSlZtSkdVdG5mS2FUYmxHVlQ5MjJnT2tyU2RleTV2WkpZQVJnOTBYSmdB?=
 =?utf-8?B?SzgrTUhVbHl2MTM5L3JnL1pBRS9XQm1IOTN0NjM1UlhHQkh4ODI5ZjBIOXVL?=
 =?utf-8?B?d3lrSE5PUlduOFlxYUVRNFdXVkRXbmhRS2tobUZMbXF1akdEOUFlOVNUZ3N5?=
 =?utf-8?B?eDdwV3JJODBaMjkzWkg2YmpMTERXNkRtOFFlTmw2ZU5ZUVEzcWNXNUZJY3lR?=
 =?utf-8?B?TUxTQW9lNHlaQStScFJlS20wL2JzZXZmRUFnbmZwL2Z6WjNNZ01iK0JqS1VI?=
 =?utf-8?B?OXdzWUYrTG1VaG1kcFYxMG5TMno0NXdyUlRhZTVubVBpQlY1ZkRTS3Y4UDZL?=
 =?utf-8?B?aWp0MGF5a0hwbmUxRHBNdmJ0WXB3RlNPTG9RVWhqSlo1eW12Mm5Cc1FyZ2Js?=
 =?utf-8?B?QlBQUUJzeUhGdEFpY2JNOWthZ1NYeDl3aTRHOTNvUVBqYzM1TUNsMXMrKzhN?=
 =?utf-8?B?eEphRmZFS3VWMjl2T1hYVDVWSXlENGUwdi9aQkFDbzhWMkVhVkNxTHh5MlRF?=
 =?utf-8?B?RjM0UVpEMnlpN2wrS1dQd2lNM3hNdEd2T3pUc3NIN2xDN1NsUFlBQWtOQzFG?=
 =?utf-8?B?ZEdUYy85ckZzMUJ4cnVTOWdZL0w5b2gxVVhHbDJXcUFkZUNRSzMzVHB5RW1u?=
 =?utf-8?B?TzlUekUyUElyN1JRemtxNXJteDdsb0Z3Z2JNdFhhY0dnWFdydStLQVJVd1hE?=
 =?utf-8?B?RUxIMU16bzdpNEt0Q1FhMGhpNXNrMnZhWFQ2dW5XZDRvVkcrU3hTMzhhdVg4?=
 =?utf-8?B?Y2QzMEZ2TUxFQzhBQy9Ea2d6TWFvNENVMlNra0R2K01VM0N3SnorcHV5dmtH?=
 =?utf-8?B?QkhkN2lxSDB6d3BzTWxoMTljUTZHejhPaHFpakJBbFplTW02MEE5dndMbFBO?=
 =?utf-8?B?QjEzNGlic2srRUEyeUpQUlNCWlBheXJBbnIwT0loenhlR20zdDFWRXM3d0kx?=
 =?utf-8?B?VDIxVmFtSjJFNkp1QnRYMExZMUprWnhRS29MOW0rUThIa2ZONGZMbjdEbTEz?=
 =?utf-8?B?OG8xbWxVM3pKTDdkTUZVY1VKZzRTTEJiTk9LSktmZm5hdFAxODk2UXc2TWVx?=
 =?utf-8?B?ODdEM3FUT1l2amRKak4vbFk5eDBzcFFGNGFuZmhJR3h5T3MwcFczeFhkZUxi?=
 =?utf-8?B?OHBwbXEvUjdhZ1hNSWd3bTNndmlDd2tiMTZuc2NOTlBZRm9Gd1paWGRnOUt4?=
 =?utf-8?B?cStCaHZ4czB2Vll6T0owbm5saVBldE5NaERDSTRIZ3FkWnJ3VTFtbEZDQTRi?=
 =?utf-8?B?ZkhVVWxpQkc3eUNzNTMvbG5jRlg4akx3R1p3YVYzeksrVEtXK1pBeDE1R2pv?=
 =?utf-8?B?VCtKcW01UGhjeG8wWWJacSs5UU1SZUx1bFFORWtWb25LTSt4dW52TW1HbjJa?=
 =?utf-8?B?RXJHRmpqZFJwb2xFYlBqT29pK0hFdE5GbVA1bVFCRElTWkxOSzdNWTdBQjRw?=
 =?utf-8?B?dE9EYXhFblkxakV4ekpGYzNlbnZUeVhDVnUzbFFIYnRFVVRKQ0FiK2o5K3hx?=
 =?utf-8?B?b0VwRjIrUzE1WHFYSnpnN2ViVWlISzgxY1NpVktuY2JiNCtScWpLd3NMcVM1?=
 =?utf-8?B?c1UyTi8vVjkzSU1hWFhqV2xNVGZhdE1nK2FRMTNhWnNQYzhoYi9KV3BncHBw?=
 =?utf-8?B?WWpDWldXNkdTUWhRL0FsU3dYdzdsWGRNRjg4UXJESk01MVZzRENydWVSYWNR?=
 =?utf-8?B?d2tzcEN0QWpRMUliUHdWdHNLbW1xcnpzdk9zV2E2Q2oxL3FzQ0F1U0tMQVA2?=
 =?utf-8?B?enozckllc2xGbzVSMUVFYzBBYWt1MXo0aFJnV25JRTEzejl1cE9UMzlEWkFl?=
 =?utf-8?B?dkxWS28vRmxmbWVQd1dEM0RrTlVmTkxaMEdVenFsUlk0VkZ3RFVCTURUdGtl?=
 =?utf-8?Q?jiScaA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTZTbXhxWVdZWG0zb0VHMEpyYVVXUGJieUhqOTcvZlhzSlZTR3JXYjhwTG5P?=
 =?utf-8?B?b0lMNXNBYzFUSk9BRWZiTXFDQ3FTZTlteXpzRlpDMkxUL045S3JvS2NNWVpz?=
 =?utf-8?B?TzNFVDhHbytxZEVvWlUyYzhqTTJEREw3QVVZOGZEN0RQK2NaRnV1Q2VlMDhJ?=
 =?utf-8?B?Sy9NMm81LzQrbnM3SUQ4bmo0WjJScHZIeUlmaEh4LzhWOWF2QU1iQTNOTHZU?=
 =?utf-8?B?YWJ3WENCVEF4ZnN2d1NXQWkvREtUb1Q5NlJKcVpWTGFEb01ZMjE3RkhSZEk3?=
 =?utf-8?B?OXBVQ3V0YkZuRG0wajJSdXVLNmNJSUVYM0lER3BjbFd1cWJ2b3kyT0RCUGxH?=
 =?utf-8?B?NTVuaU1lNi8yNi9RT3BoSnQ2TlNqSGJWUDNxaVRLWU55Tll5ZU5QRk1OVXJu?=
 =?utf-8?B?S0E2VWh6OGtHdTliZ0FuN3FVYStzRHlONmVyYnFoaWZkYTFXV3VvOGxSbFRh?=
 =?utf-8?B?elcvZ2svWnJackVZcm5yem9QMUJ0eEZ0RkpZNklDV2hid0hzbGJyQWUyLzJz?=
 =?utf-8?B?dnBydDJzYkYzZUtaTGFmbVFzODhFWEFkdFgvYUdGUE5hK3I2WkZVYndvU0xE?=
 =?utf-8?B?b1QxV0hSOTFTQ3ppK0c1Q2pGNjIycEVONitFMHJPYzh4dTJVQ0hEZW5CZzRu?=
 =?utf-8?B?K1lQd1pmclNacytnZ3V2NmtBQWZzc2NySFFNQzdGRVh2QVF6VHljbVBmSi9p?=
 =?utf-8?B?UFdlaE5uNXl3L1JySFlGZkR2SUMva2lKa3AxSEpJNXBMZVViWmNLUFVYWUZP?=
 =?utf-8?B?Z0RCdHlsakcrc2VMenNEbDJ2c3JNS2REVlFkQTVPWWczdkRNWkk1amZ4byt6?=
 =?utf-8?B?VHdpRS9jMllhNCsrQXhIUjdFRWdNOXh3a3VqNzdpNFlHRHZKZm1HN2hQRDhl?=
 =?utf-8?B?WDNEeFRWZnM0dHQ3MlR6R0txdXN1ZFZnR2NQQklaVU1LcEh5NEVDM3l0MXpv?=
 =?utf-8?B?NUd2U1lFekRoMEw2U0FyR2RpbkhMekxWa3JTY0tPT3RxcnlRZk9oRldCV3Zp?=
 =?utf-8?B?RG9QVDhPOUZEcnFpdnplRjBXV1htTHlYa1AvdmJ0V3lsTnhlNkM0TCtYbUpv?=
 =?utf-8?B?VjlRSjFWUTFOWThDbDB1VWd0d2VOTWtaVngrc09KSENCbWRhTVh5RDRWNy9y?=
 =?utf-8?B?b3lYSEJuSzRnV0lnRTgwNzE2RFZSdUxMVkpVTGdlRWgzNHQzUXpEWFBBVGNz?=
 =?utf-8?B?WU5MRW1kajgwa1pvb01CMmJNdDRrWkdaZStvTDRVS0lJSTJyUHI4d25UajFY?=
 =?utf-8?B?M0FRcFB6RHptV3ZKZzVYNVNOQzFaZVNTR0FJZ3RxdDRkaVVpS0RnNllNVjlt?=
 =?utf-8?B?S2UyRkRSZER1bDFEcWdKdjJTYXNvc0xWRndNRDJkekRTbDlES1JzTlBSMEpC?=
 =?utf-8?B?SWZMNjBOMkQzb2tuZEdmNUJnOTZCWHg3VjJvY0YyR0VjNmI3R2Y4dEVBaWFE?=
 =?utf-8?B?cXpteW1JbXJYcERsbnYzNjNuR3ltMkR6YXdYQXd4dmJXTDNzcHNuYk5tR0Rj?=
 =?utf-8?B?aU5NdnBPM0gxckRnUksxdkN2ZWJvZHh1M3pjc05SYWh4QUxBNnRSRGN5YUhU?=
 =?utf-8?B?ZlRBTGZGSUxlOTN1aFU5K2V0dFRMNTZRNk0rcTk2bDgydUsvT1ZSbzV1ejR2?=
 =?utf-8?B?SUpSWWJFd01yeFVUMkRkSVR6RzJCOFIzVll2SHk1ZDNXS09SVVhvZmtiWTJt?=
 =?utf-8?B?ZTlBZm9Ya0I1UkFMVzVPMitOMk1aVTNvSkZ3cXlxOFdBNmtlUHl5eGg0YVB1?=
 =?utf-8?B?ZEw0blQ5Q2RabGNJWFJYcXRpTUtmTnJ4S1N1SituREMvY3c2M05UaFgzQlpQ?=
 =?utf-8?B?Ymd6bVNvYjk5ZmhURzV0eUhwd1lMdS9VT0RhR3FsSkJid1gvdjdkTjdKTjdO?=
 =?utf-8?B?Sk5obk1aR0UycmR2b1Z1azZnZGkrUXR5bUpBYlVvT3BIOWtENVlvNWY2MlZ6?=
 =?utf-8?B?L3lud1lPc3BhT1JEUDlES2c3K1VicGdXV2EyKzBDeXNPTCtCQkY0bXJMTXA0?=
 =?utf-8?B?VHA0RWlEakVRTVkwQTVjQWszenhRUDI0T2NzMi9oTE5Gblp2WDA2bk5BWnY5?=
 =?utf-8?B?TTlMaVp3M2VHNjU3NTVmTFFpVkk4YU9MZ09aK2dyRlRiamhmbWx3eDFRemlO?=
 =?utf-8?B?cGpCa1NrYW9KRHJiWnhqc2JWZkVzNFdGQkpGWFhPNFphdGUrcnlPcE0rbEd2?=
 =?utf-8?B?SHVFRjJTUjNrL3c2L3prc3lxTGUvMCtERmxNR1dqUzlwSGNSR2pEUmZmRER6?=
 =?utf-8?B?UVhocmxRK1VNOStxWXZNTTh2MldqcC9HWFVucHU4Sko5cDFyZE9JSUdnVjZC?=
 =?utf-8?B?c3RxS2xQbk9BVE9IT3FXYmpCOGZhK3g2WDlpV3JRRC85aDhmUFFGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7727be-f872-427f-0ea2-08de4c1dc60c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:46:29.3032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzyPzvnJjq+0Zy5VG8Usum7hVj4kRALnBZol4ECgKthLinFvQIxdm5uOgggeAQuuqW83NxRt6npWx9umexGyF+4VZQf8XJ/50JndlUHw5+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBOaXNoaXQg
PG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIDUgSmFudWFyeSwgMjAy
NiAwOTozMCBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEd1cnJhbSwg
UHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIIGktZy10IHYxMyAwMS8xMV0gZHJtLXVhcGkveGU6IFN5bmMgd2l0aCBtYWR2aXNlIGludGVy
ZmFjZQ0KPiANCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBBbGlnbiB3aXRoIGtlcm5lbCBjb21taXQgZGZmNTQ3ZTEzN2JlMiAoImRybS94ZS91
YXBpOiBFeHRlbmQgdGhlIG1hZHZpc2UNCj4gZnVuY3Rpb25hbGl0eSIpLiBUaGlzIGlzIHRvIGJy
aW5nIGluIG1hZHZpc2UgaW50ZXJmYWNlIGNoYW5nZXMgZnJvbSBLTUQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBpbmNsdWRlL2RybS11YXBpL3hlX2RybS5oIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggYi9pbmNsdWRlL2Ry
bS11YXBpL3hlX2RybS5oIGluZGV4DQo+IGY4YjIyODM1MC4uYmI2OWY5YjMwIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2RybS11YXBpL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGkv
eGVfZHJtLmgNCj4gQEAgLTMsOCArMyw4IEBADQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiAgICovDQo+IA0KPiAtI2lmbmRlZiBfWEVfRFJNX0hfDQo+IC0jZGVm
aW5lIF9YRV9EUk1fSF8NCj4gKyNpZm5kZWYgX1VBUElfWEVfRFJNX0hfDQo+ICsjZGVmaW5lIF9V
QVBJX1hFX0RSTV9IXw0KPiANCj4gICNpbmNsdWRlICJkcm0uaCINCj4gDQo+IEBAIC0xNDIsNyAr
MTQyLDcgQEAgZXh0ZXJuICJDIiB7DQo+ICAgKiByZWRlZmluZSB0aGUgaW50ZXJmYWNlIG1vcmUg
ZWFzaWx5IHRoYW4gYW4gZXZlciBncm93aW5nIHN0cnVjdCBvZg0KPiAgICogaW5jcmVhc2luZyBj
b21wbGV4aXR5LCBhbmQgZm9yIGxhcmdlIHBhcnRzIG9mIHRoYXQgaW50ZXJmYWNlIHRvIGJlDQo+
ICAgKiBlbnRpcmVseSBvcHRpb25hbC4gVGhlIGRvd25zaWRlIGlzIG1vcmUgcG9pbnRlciBjaGFz
aW5nOyBjaGFzaW5nIGFjcm9zcw0KPiAtICogdGhlIGJvdW5kYXJ5IHdpdGggcG9pbnRlcnMgZW5j
YXBzdWxhdGVkIGluc2lkZSB1NjQuDQo+ICsgKiB0aGUgX191c2VyIGJvdW5kYXJ5IHdpdGggcG9p
bnRlcnMgZW5jYXBzdWxhdGVkIGluc2lkZSB1NjQuDQo+ICAgKg0KPiAgICogRXhhbXBsZSBjaGFp
bmluZzoNCj4gICAqDQo+IEBAIC0yMTIzLDcgKzIxMjMsMTMgQEAgc3RydWN0IGRybV94ZV9tYWR2
aXNlIHsNCj4gIAkJc3RydWN0IHsNCj4gICNkZWZpbmUgRFJNX1hFX1BSRUZFUlJFRF9MT0NfREVG
QVVMVF9ERVZJQ0UJMA0KPiAgI2RlZmluZSBEUk1fWEVfUFJFRkVSUkVEX0xPQ19ERUZBVUxUX1NZ
U1RFTQktMQ0KPiAtCQkJLyoqIEBwcmVmZXJyZWRfbWVtX2xvYy5kZXZtZW1fZmQ6IGZkIGZvcg0K
PiBwcmVmZXJyZWQgbG9jICovDQo+ICsJCQkvKioNCj4gKwkJCSAqIEBwcmVmZXJyZWRfbWVtX2xv
Yy5kZXZtZW1fZmQ6DQo+ICsJCQkgKiBEZXZpY2UgZmlsZS1kZXNjcmlwdG9yIG9mIHRoZSBkZXZp
Y2Ugd2hlcmUgdGhlDQo+ICsJCQkgKiBwcmVmZXJyZWQgbWVtb3J5IGlzIGxvY2F0ZWQsIG9yIG9u
ZSBvZiB0aGUNCj4gKwkJCSAqIGFib3ZlIHNwZWNpYWwgdmFsdWVzLiBQbGVhc2UgYWxzbyBzZWUN
Cj4gKwkJCSAqIEBwcmVmZXJyZWRfbWVtX2xvYy5yZWdpb25faW5zdGFuY2UgYmVsb3cuDQo+ICsJ
CQkgKi8NCj4gIAkJCV9fdTMyIGRldm1lbV9mZDsNCj4gDQo+ICAjZGVmaW5lIERSTV9YRV9NSUdS
QVRFX0FMTF9QQUdFUwkJMA0KPiBAQCAtMjEzMSw4ICsyMTM3LDE0IEBAIHN0cnVjdCBkcm1feGVf
bWFkdmlzZSB7DQo+ICAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLm1pZ3JhdGlvbl9wb2xpY3k6
IFBhZ2UNCj4gbWlncmF0aW9uIHBvbGljeSAqLw0KPiAgCQkJX191MTYgbWlncmF0aW9uX3BvbGlj
eTsNCj4gDQo+IC0JCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLnBhZCA6IE1CWiAqLw0KPiAtCQkJ
X191MTYgcGFkOw0KPiArCQkJLyoqDQo+ICsJCQkgKiBAcHJlZmVycmVkX21lbV9sb2MucmVnaW9u
X2luc3RhbmNlIDogUmVnaW9uDQo+IGluc3RhbmNlLg0KPiArCQkJICogTUJaIGlmIEBkZXZtZW1f
ZmQgPD0NCj4gJkRSTV9YRV9QUkVGRVJSRURfTE9DX0RFRkFVTFRfREVWSUNFLg0KPiArCQkJICog
T3RoZXJ3aXNlIHNob3VsZCBwb2ludCB0byB0aGUgZGVzaXJlZCBkZXZpY2UNCj4gKwkJCSAqIFZS
QU0gaW5zdGFuY2Ugb2YgdGhlIGRldmljZSBpbmRpY2F0ZWQgYnkNCj4gKwkJCSAqIEBwcmVmZXJy
ZWRfbWVtX2xvYy5kZXZtZW1fZmQuDQo+ICsJCQkgKi8NCj4gKwkJCV9fdTE2IHJlZ2lvbl9pbnN0
YW5jZTsNCj4gDQo+ICAJCQkvKiogQHByZWZlcnJlZF9tZW1fbG9jLnJlc2VydmVkIDogUmVzZXJ2
ZWQgKi8NCj4gIAkJCV9fdTY0IHJlc2VydmVkOw0KPiBAQCAtMjM1Myw0ICsyMzY1LDQgQEAgc3Ry
dWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSB7ICB9DQo+ICNlbmRpZg0KPiANCj4g
LSNlbmRpZiAvKiBfWEVfRFJNX0hfICovDQo+ICsjZW5kaWYgLyogX1VBUElfWEVfRFJNX0hfICov
DQpSZXZpZXdlZC1ieTogIFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwu
Y29tPg0KPiAtLQ0KPiAyLjQ4LjENCg0K
