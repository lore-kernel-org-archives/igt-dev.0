Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFEBC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 04:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226A10E27B;
	Thu, 29 May 2025 04:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMrnRXEc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9593310E27B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 04:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748494662; x=1780030662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IqjJSoGYX+N5dhdiznLiwNz4M02dEJQjgxW0Yjj/esY=;
 b=hMrnRXEc5LOOdYRd+AInAJOdPkF9x4F26qslrmGVO7B/wxAvBJykXBkC
 vXQ7aKYf8KwYPVyYEjIwX5GBZ1F+I+1QqUdHistFv5bBo8J63ntPAqen2
 ZVR8jjh7mWHao3AicBfcikQv+n3myO/dU/vTGV4zgWMkO1W2hjklBdcHz
 dPDp6elSXVD+Zcp+ejH8b3pxWKVeIACtoiV9LAj3NY8adbYDd/xd5oLs/
 Z+hek8V23fI/VNYr2WmW113L5sP7MFzL49CwwVuH57abbAxi/zvcTGkLl
 U7amrcCLf3v7kKfnz+wjdJB7g9Y5yQlsgeJs2TcslIw7LTf097O892bZN Q==;
X-CSE-ConnectionGUID: j3SHK6fISkK5hET65+hBig==
X-CSE-MsgGUID: ODSQ9z9DQcK6T2ByRoE7Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50598204"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="50598204"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:57:41 -0700
X-CSE-ConnectionGUID: vcVLXrB8RxuotWl1witygw==
X-CSE-MsgGUID: tYbXN/eAQRSumgIY+GwLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="148314370"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:57:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:57:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:57:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7VCUBvvhduY6vgpStl/8XfhAKVY6KFmv5Q+bfDLH1b67tUnXhHeDAOI1Xe7W+langqX41Z+T7d+Q4g4lXaMcwhhAu3Np3ZyIL0TfQb8rrODxVazQOMfpydbonkr9LF5N7wBSyeEEE10kwzdpy5zvAHa04i49o8/FbY0LJ3bLWLKWSJV04+TVC8lW/99V5XfxVg2jt0YxmsfK0hzrN2Yqvrak+5llN9UZ2YEjrb/ZFhyXUI6gRB4n705T1OPlzS1Z3UTXZXnajwtYL907qcL1DreNSVYh2jUbBvha20XDglKlATS681tQdDS0gT/9Hhsh5d8zt8tgJqVTo4rN1w4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqjJSoGYX+N5dhdiznLiwNz4M02dEJQjgxW0Yjj/esY=;
 b=DhUCT6XP9TO6A2g6UaH6vF0Qvt7vOLdhaAEEX66WzCp6a/QYusz/epAihypMy1Ocg6t+PoN2VHkkHGc4r1siJRdSB0MGqIHIamVhXgQrATf+X8NjMed62+ziGoIZkmNbtPjWBfg9OPYWHIMf2gEb55VS+ChG2FgNbETD//z/Nnjxwc9gXSKCHnpypYIt28zW7rG2tvyP9xMMY/QQQQSJNoOHZLtEbGmMH3mcLsyovID9vVMKCS6O4VNYt3EHR+/xT7cxOGbFKyY+kYj5gdtaV+v/+2s0o97S/py+/+QznpYqDFTOQkpLhx9c8Eim+vvPGevCgI+2a4QMWVDx7Gcdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 04:57:33 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 04:57:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 1/2] lib/igt_panel: Skip hdcp tests on
 unsupported panels
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_panel: Skip hdcp tests on
 unsupported panels
Thread-Index: AQHb0Dzc3Ocdus2y5k620fPyhiFcN7PpC8bA
Date: Thu, 29 May 2025 04:57:33 +0000
Message-ID: <SN7PR11MB6750E9C684084DB7AF4760EEE366A@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
 <20250529015522.298460-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250529015522.298460-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DM4PR11MB6309:EE_
x-ms-office365-filtering-correlation-id: f034b7ef-566a-4b26-0a92-08dd9e6d52e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YmhEQk9YL2NiMVNiNFlvSVlUaXovTDl6bSt6TzJHKzM0RVJ0czFnWGtEZWtE?=
 =?utf-8?B?MXREM3kxakVEano4TUg2SXNBRjRhNi9KN0dhc3JtNFdnRUNJUks2MEFiK1BT?=
 =?utf-8?B?NDdFTTBWQ0puMXFSUXVvOEFTZjlCUkNzQ0dJVDY4MDMzMnhMS1RuVGlxNGZC?=
 =?utf-8?B?SHgxazlraW5QZEE0RzROMzJBckNZdFlkckpGR1JnMHlBWUQwelVZOUVFdXE3?=
 =?utf-8?B?S2QxTFhhNzFWamZFTFBCYUMvZ3lhaDVEU1lqTlpIM3FZV1E1djlvcTJsQzZT?=
 =?utf-8?B?YStEcGlwSDA1R3dQTy9FbTFkeXZtQW92S2RYQWZLTk5hanMra3gxcU10MUFG?=
 =?utf-8?B?T21PNytKbXZZYndzUG5pMy80U1NTYy9pdkROREE5WHRReVZvcFNzMUxhb04z?=
 =?utf-8?B?dUlqNVBCVGZTYUNkN1pTWmxXR1FGeDZPdHVrdWVPd0Q0ajhUbjI4YktEY2dR?=
 =?utf-8?B?ckJQUWhjYmRqemVHZlJSamVIcXdHajk1MXRqdy9kNjExU00zN2J4anI5WmUr?=
 =?utf-8?B?SHVNTkgzT3o1d1pPS1FRNVgzdWpxR2UvQ0xFNVJ3NTIybHB2OHRaek5WSEp0?=
 =?utf-8?B?d3JuMUhmS2V6VXZjdWNXalNzUnhWY0tzV3Y3OFhZTCt2dHBkSU5IV2hoeFhM?=
 =?utf-8?B?M0JSZy83bkQ1eG5Zd2ZlL1dPUytMd3RXekVkTVFjRXR2WXp1cm9VU1RsTDZn?=
 =?utf-8?B?MDE0aXU3VlB4QmJuUDFrdWUyd1dKT21DQ0ZuQzJLbVBjVWwvYXBUQTNWK2NS?=
 =?utf-8?B?VWlUeVY3NGNya0JDeFAxRmFmS0QwanJLZlZXaVQ2QUh0WnBaR3NpK3dKNU1G?=
 =?utf-8?B?cjZabEZFdTRpV0orYVN0Z0NTbGMyditGU3dWQzRFR1JWTGJJWjVmRnp3S3dD?=
 =?utf-8?B?OWVLR1BhQjdBTjJjYitVMGxQOXNSOWNqTnhZaTVMSUJMNEg2QndIT2M5VXdl?=
 =?utf-8?B?Ni9KS2pwVEM3REVORTZaVkZ3YTdPNTZZZ0kyWG00aE1DdjhjOTc1UHdEaWEy?=
 =?utf-8?B?ZldXQk9VVXRuRE9PdktBVGZuaHR6MXZGYnhpOUZIbGRYaUZRQ1crUS9oc2s0?=
 =?utf-8?B?SkNLbUtpeGUzbjJQSzVUZ2VpSEV3Z3FRN1R0aStmcHpOVlF6WVZvN3I2S1Rn?=
 =?utf-8?B?dDNzSDdpaG5kSkRLcXZ1UHNTTExZM1JGK0RsN29IbWR2V0gyUmdTL0podEFy?=
 =?utf-8?B?MDlUS1NNRlFPaUxiY0l1cVRySTZMSXpXNFBMTG1OM2NkSGtYQ0oyZ29ORWZL?=
 =?utf-8?B?U3A1RUFPMEl0QUx6WUhoU0xGZ3QyV21yM0l4Z1d6S2Z4Wm4vZjduWE1pMVQ2?=
 =?utf-8?B?U1hIQzZnQnhiTU9lcFhBUEZCN0FaUkNNU1I4dHZrenpNZkowY1g5OWNlQnEz?=
 =?utf-8?B?eXFFNlBYWFUyaTJlNE5OTVBocktNbnNJV2VWeHNhbk5aS2ZHMHRRWDE4VUdn?=
 =?utf-8?B?VUF0cmhVU0loMlJGRUwwODhyZzQvQlZJeDBCWVltOUFOaWlGZjFBK1FBL2sy?=
 =?utf-8?B?NU9LU2srWUlkVmlZRkhJdWNCL1Q1TGY5VDNuclhua0E3UHhsalVncFE4L01B?=
 =?utf-8?B?RGMyOG5VQXh3eDVYclZJMGVzODNOOVpISzRab0tOME85SDJ2NEtvamxqRlVH?=
 =?utf-8?B?MTVKclNjRlVUMHY3YUJZQkZtRndTd3oyeGwrUnhUNHEzdDNGVjYwc2JGdmY5?=
 =?utf-8?B?YUJzSXBGNDNkVTBUKzJSbVBpT1VTRnNrZStNZDVEbkxpaGhud2hRNUZEanRO?=
 =?utf-8?B?bkh5QjdIc2VCMjg5ZWdua2RsY1kwaUlBMWhtWTBGeWNYeXdUK0ExaVZQU1RH?=
 =?utf-8?B?YWpiRko5WE5FU05QQ0ZORGZUTEg3WFg0YmM2elNGS01WVDc1MTlTVDYxVTRC?=
 =?utf-8?B?UC9HSXd2THg1MTRZQm5wVjFzNlJuMEVDRHVzL3djZXZuRmZGWUJWdmM5RC9S?=
 =?utf-8?B?L0F0WFgzcDBvNW56Tk5seG83L0c1RE5WanpYQWtrdXlEQ0lLVHYrY0trcjdK?=
 =?utf-8?B?ZlJvRE1seklnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDFyUkNDTWhMK3lhVDFKV0phM0thR0hjVDF5TXdCcWtSditsangwTklEU0Uv?=
 =?utf-8?B?ay9FU25scms5ZUtVajZvWjY2WDQ3K3JodUNuRHFudVBiVWg0RGR4SWx1M3dH?=
 =?utf-8?B?amFFc1dZYU5xZE1UNitOeVA4cUorYUNpb0pUTSttVEliRC8xZEJBdjE4bUNT?=
 =?utf-8?B?NWtITnF3d096eVdHT0JoZGhkMlZNc3hFNi84TmI2eGJnY1hkcWtyenNVVDBN?=
 =?utf-8?B?NkJRc1BxM0QvbzI5bTRtOTRsN2xobDhNQUc5MDZDVjduVXRpYy9OS0V0NmU3?=
 =?utf-8?B?R2FINkpOUUwrN3kvaVJ4ckZheUhtMm5lRDVMM04vOXQ5ZTNSUWVVQi9Ib2k4?=
 =?utf-8?B?ZUVxZi9mc3lUeFRzdFlGM2NpQ2sxaStpalhBbU42aGNGaFgvRU91NjJrMjh4?=
 =?utf-8?B?dCtFQUlkKzVJMjVwSzEvT040SUNqVlhDaTJZaVN5UDJyMEVrSmZrRU93M214?=
 =?utf-8?B?SU9mcmdIcGpQY0hMcHdJZ3hXTVdGaDRZT2h3UVB4RGU2WHJiNFBWNWIrUlpO?=
 =?utf-8?B?czExWXJObzB4MUwxODhWaGhjRGZHNXE1WE04YVNtSkcrTmF0SkdmSXhBeWhC?=
 =?utf-8?B?Z01CRm5jZHpnQXJIeGErRElRa0Q3cjdPa2RtQzU2NklBV2VVNnRqaTd6UjlZ?=
 =?utf-8?B?NHZ1NHJDcUJSZWdTMUloQ3I4a0dPalZXa0RuY2VxMHVjY0FmMnhwRkNKQlhB?=
 =?utf-8?B?RkpGUmdObnFXVkNGN0tteU9IZlhaMG16ejR3cGNNd2JCejJOcytkdFBJUjg2?=
 =?utf-8?B?T0ZLNllOYy9uMWtvY3JvSFdiUXYycUJpd2xUK0dpTW9hTjgrY1NqSU80d1NF?=
 =?utf-8?B?V3o0UGQrM3RYVGRUM0ZQUzFBRGRnZjFBNU5vUEpodjRPci9EQlVCTFJYQ1A2?=
 =?utf-8?B?UlFmVTkrZUZiSGs1Mnd2djJkcVUzeWNZRmpyRk1Uc3NvOE9XbmdBbVh5bXp3?=
 =?utf-8?B?YUpvVGJHMjZ4VDB6OHdFUE5QeC94Q0FBQUJHT0pZSTkzYjRFYU9YZmlybCti?=
 =?utf-8?B?TUtKVlp0OENzMGpwV1JvTUNNMmEvUDd4L3RlRWd1QWVFYU1kZnZwMXNJQlY5?=
 =?utf-8?B?SVFzRkxvenpibUtxVVVXMHpobzVYeU1ZVWNUSEVaeEdXUVBiMTFtYjFDTmww?=
 =?utf-8?B?TXlNcUpCdWJ5bXpldzN1T3dnOWk3S1IzUUJ1aTBRanhXMEE4M2lyZVR4Mkdw?=
 =?utf-8?B?MjNsNkRpVW52R2NGZitBTUxZUHVZdkNtK1hTSDZsL3JjZUJ5RHlIWmhlQld1?=
 =?utf-8?B?VTA0Mjd0VDRuVTlmSXY5WmVxWUNyd1BuaWJRd2tMSTArQ1RKYTlqT2FjdGRU?=
 =?utf-8?B?dnQxQitReUs5VFdKcUZqTjVVeGlhWFRuRzVCcDlvbzF2WXJpbE51ZlN0TEdl?=
 =?utf-8?B?bVl5cjF2TXMvTXZCenY3SW8rNkJkc1JpcWhiZFpVUDBzcSs0a0M3VGpXODlo?=
 =?utf-8?B?WU5HUHgrWC9XRCtSeElPQU5kb3NUNEpnYXlUeXppOEdGQmhOeVhjSVlnS3Jq?=
 =?utf-8?B?V3BneTd1NnR0dWxDRGordWt1czlvNmppOGs5V1pSOW50UlU0dmF2SExCWWVF?=
 =?utf-8?B?a0xTRlhXNnJvVW5sSXZyeGdaei9TZm8yNndCeWw1dDVyeXlhZGYycjFMc3pp?=
 =?utf-8?B?a2JrREV1T0RyaitMOElkNlJ0bmg1V0J1ZzZyV1hRMG8vMmdNT1EwREtLREls?=
 =?utf-8?B?OXJIYUtPbXlqTFRlZEhFMm9yTC82NFhQVXhkNTJNZnZPK2FlclUwdmZSN2kr?=
 =?utf-8?B?WnQweDE4WEFLYWF2MTZlU3JSU0ZiQTdOa3plM1AxUkUzWDhXNWVHaUNCR0ta?=
 =?utf-8?B?MWFLc3ZiODVoTlkwMXh1MVlRM3NTb3NXVDdxaTJtTWJkMjJrY3JzQlJoNFh6?=
 =?utf-8?B?azcxZWVrWmJNcStDbThFZzRFc0o4ek5iRldOdVpNVys5RUYvQk01NXdoMHlQ?=
 =?utf-8?B?bHVZbXgvUm1GeDlvcS9QeEwzUWZNL1dXWVgxQzFoRWFsbW1lUHpGRkdOZktm?=
 =?utf-8?B?dGRDRUplYm1iT3F5M3h5RHVHR0lWdVdYNXJudEgrZ203d0JBQVlFeUtxVjJj?=
 =?utf-8?B?YTRQQ2tKRldDaVFkaG1JUkM2dzFtNXhxMXhlcjI1cmdLTlRDMmt1LzRmdzZD?=
 =?utf-8?Q?ynRwFzES0WdEd2rCcrYxPi0AF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f034b7ef-566a-4b26-0a92-08dd9e6d52e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 04:57:33.5663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lXfuGtyjE35gTgpJCpUn8pY3XXb/sza+B7Rglu3vFGGi7snVKUba7pZ8kvQ+JVpWM1eD0Lc1Vt0KSbPK2rfvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
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

DQoNCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDEvMl0gbGliL2lndF9wYW5lbDogU2tpcCBo
ZGNwIHRlc3RzIG9uIHVuc3VwcG9ydGVkDQo+IHBhbmVscw0KPiANCj4gVGhpcyBpbnRyb2R1Y2Vz
IGEgbWVjaGFuaXNtIHRvIGhhbmRsZSBzcGVjaWZpYyBwYW5lbHMgbGlrZQ0KPiBlbXVsYXRvcnMv
ZHVtbWllcyB0aGF0IGFyZSBrbm93biB0byBmYWNlIGlzc3VlcyB3aXRoIGNlcnRhaW4gZmVhdHVy
ZXMgbGlrZQ0KPiBIRENQLg0KPiANCj4gVGVzdHMgYXJlIHNraXBwZWQgZm9yIHRob3NlIG91dHB1
dHMgY29ubmVjdGVkIHRvIHByZXZlbnQgZmFsc2UgbmVnYXRpdmVzIGFuZA0KPiB1bm5lY2Vzc2Fy
eSBkZWJ1Z2dpbmcNCj4gDQo+IFYyOiBSZWZhY3RvciB2YXJpYWJsZSAsZnVuY3Rpb24gbmFtZXMg
YW5kIGZpeCBjb2Rpbmcgc3R5bGUgKEthbWlsKQ0KPiANCj4gVjM6IFJlbW92ZSBleHRyYSB3cmFw
cGVyIGFuZCBtYWludGFpbiBibG9ja2xpc3QgYXJyYXkgaW4gdGVzdCBpbnN0ZWFkIG9mDQo+ICAg
ICBpbiBsaWJyYXJ5IChTdXJhaikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIFJlZGR5
IEd1ZGRhdGkgPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2
aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0t
LQ0KPiAgbGliL2lndF9lZGlkLmMgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrICBs
aWIvaWd0X2VkaWQuaCAgfCAgMSArDQo+IGxpYi9pZ3RfcGFuZWwuYyB8IDM1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBsaWIvaWd0X3BhbmVsLmggfCAxNyArKysrKysr
KysrKysrKysrKw0KPiAgbGliL21lc29uLmJ1aWxkIHwgIDEgKw0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCA4MSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL2lndF9wYW5lbC5j
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL2lndF9wYW5lbC5oDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbGliL2lndF9lZGlkLmMgYi9saWIvaWd0X2VkaWQuYyBpbmRleCA4MGRjZWExMTIuLjYyNzIw
MWMzNCAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9lZGlkLmMNCj4gKysrIGIvbGliL2lndF9lZGlk
LmMNCj4gQEAgLTIxMCw2ICsyMTAsMzMgQEAgdm9pZCBlZGlkX2dldF9tZmcoY29uc3Qgc3RydWN0
IGVkaWQgKmVkaWQsIGNoYXINCj4gb3V0W3N0YXRpYyAzXSkNCj4gIAlvdXRbMl0gPSAoZWRpZC0+
bWZnX2lkWzFdICYgMHgxRikgKyAnQCc7ICB9DQo+IA0KPiArdm9pZCBlZGlkX2dldF9tb25pdG9y
X25hbWUoY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsIGNoYXIgKm5hbWUsIHNpemVfdA0KPiArbmFt
ZV9zaXplKSB7DQo+ICsJY29uc3Qgc3RydWN0IGRldGFpbGVkX3RpbWluZyAqZHQ7DQo+ICsJY29u
c3Qgc3RydWN0IGRldGFpbGVkX25vbl9waXhlbCAqbnA7DQo+ICsJY29uc3Qgc3RydWN0IGRldGFp
bGVkX2RhdGFfc3RyaW5nICpkczsNCj4gKwlzaXplX3QgaTsNCj4gKw0KPiArCWFzc2VydChuYW1l
X3NpemUgPiAwKTsNCj4gKwluYW1lWzBdID0gJ1wwJzsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkg
PCBERVRBSUxFRF9USU1JTkdTX0xFTjsgaSsrKSB7DQo+ICsJCWR0ID0gJmVkaWQtPmRldGFpbGVk
X3RpbWluZ3NbaV07DQo+ICsJCW5wID0gJmR0LT5kYXRhLm90aGVyX2RhdGE7DQo+ICsNCj4gKwkJ
aWYgKG5wLT50eXBlICE9IEVESURfREVUQUlMX01PTklUT1JfTkFNRSkNCj4gKwkJCWNvbnRpbnVl
Ow0KPiArDQo+ICsJCWRzID0gJm5wLT5kYXRhLnN0cmluZzsNCj4gKwkJc3RybmNweShuYW1lLCBk
cy0+c3RyLCBuYW1lX3NpemUgLSAxKTsNCj4gKwkJbmFtZVtuYW1lX3NpemUgLSAxXSA9ICdcMCc7
DQo+ICsJCWlndF9kZWJ1ZygiTW9uaXRvciBuYW1lOiAlc1xuIiwgbmFtZSk7DQo+ICsJCXJldHVy
bjsNCj4gKwl9DQo+ICsJaWd0X2RlYnVnKCJObyBtb25pdG9yIG5hbWUgZm91bmQgaW4gRURJRFxu
Iik7DQo+ICsJbmFtZVswXSA9ICdcMCc7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIGVkaWRf
c2V0X21mZyhzdHJ1Y3QgZWRpZCAqZWRpZCwgY29uc3QgY2hhciBtZmdbc3RhdGljIDNdKSAgew0K
PiAgCWVkaWQtPm1mZ19pZFswXSA9IChtZmdbMF0gLSAnQCcpIDw8IDIgfCAobWZnWzFdIC0gJ0An
KSA+PiAzOyBkaWZmIC0tZ2l0DQo+IGEvbGliL2lndF9lZGlkLmggYi9saWIvaWd0X2VkaWQuaCBp
bmRleCAwMjY0NTM0NWYuLmJlMGNjZjUyOSAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9lZGlkLmgN
Cj4gKysrIGIvbGliL2lndF9lZGlkLmgNCj4gQEAgLTQ1Niw1ICs0NTYsNiBAQCB2b2lkICpkaXNw
aWRfYmxvY2tfdGlsZWQodm9pZCAqcHRyLA0KPiAgCQkJIGludCBodGlsZSwgaW50IHZ0aWxlLA0K
PiAgCQkJIGludCBoc2l6ZSwgaW50IHZzaXplLA0KPiAgCQkJIGNvbnN0IGNoYXIgKnRvcG9sb2d5
X2lkKTsNCj4gK3ZvaWQgZWRpZF9nZXRfbW9uaXRvcl9uYW1lKGNvbnN0IHN0cnVjdCBlZGlkICpl
ZGlkLCBjaGFyICpuYW1lLCBzaXplX3QNCj4gK25hbWVfc2l6ZSk7DQo+IA0KPiAgI2VuZGlmDQo+
IGRpZmYgLS1naXQgYS9saWIvaWd0X3BhbmVsLmMgYi9saWIvaWd0X3BhbmVsLmMgbmV3IGZpbGUg
bW9kZSAxMDA2NDQgaW5kZXgNCj4gMDAwMDAwMDAwLi5jODliZjkxMjMNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9saWIvaWd0X3BhbmVsLmMNCj4gQEAgLTAsMCArMSwzNSBAQA0KPiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAy
MDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPHN0ZGJvb2wu
aD4NCj4gKyNpbmNsdWRlIDxzdHJpbmcuaD4NCj4gKw0KPiArI2luY2x1ZGUgImRybXRlc3QuaCIN
Cj4gKyNpbmNsdWRlICJpZ3RfcGFuZWwuaCINCj4gKw0KPiArLyoqDQo+ICsgKiBpZ3RfaXNfcGFu
ZWxfYmxvY2tlZCAtIENoZWNrcyBpZiBhIGdpdmVuIHZlbmRvciBuYW1lIGlzIHByZXNlbnQgaW4g
YQ0KPiBibG9ja2xpc3QuDQo+ICsgKg0KPiArICogQHZlbmRvcl9uYW1lOiBUaGUgbmFtZSBvZiB0
aGUgdmVuZG9yIHRvIGNoZWNrIGZvciBpbiB0aGUgYmxvY2tsaXN0Lg0KPiArICogQGJsb2NrbGlz
dDogQW4gYXJyYXkgb2Ygc3RyaW5ncyByZXByZXNlbnRpbmcgdGhlIGJsb2NrbGlzdC4NCj4gKyAq
IEBibG9ja2xpc3Rfc2l6ZTogVGhlIG51bWJlciBvZiBlbnRyaWVzIGluIHRoZSBibG9ja2xpc3Qg
YXJyYXkuDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAqIHRydWUgaWYgdGhlIHZlbmRvciBu
YW1lIGlzIGZvdW5kIGluIHRoZSBibG9ja2xpc3QsIGZhbHNlIG90aGVyd2lzZS4NCj4gKyAqLw0K
PiArYm9vbCBpZ3RfaXNfcGFuZWxfYmxvY2tlZChjb25zdCBjaGFyICp2ZW5kb3JfbmFtZSwNCj4g
KwkJCSAgICBjb25zdCBjaGFyICpjb25zdCBibG9ja2xpc3RbXSwNCj4gKwkJCSAgICBzaXplX3Qg
YmxvY2tsaXN0X3NpemUpDQo+ICt7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBp
IDwgYmxvY2tsaXN0X3NpemU7IGkrKykgew0KPiArCQlpZiAoc3Ryc3RyKGJsb2NrbGlzdFtpXSwg
dmVuZG9yX25hbWUpICE9IE5VTEwpDQo+ICsJCQlyZXR1cm4gdHJ1ZTsNCj4gKwl9DQo+ICsNCj4g
KwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcGFuZWwu
aCBiL2xpYi9pZ3RfcGFuZWwuaCBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiAwMDAwMDAw
MDAuLmI5ZmI4OGNjNw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2xpYi9pZ3RfcGFuZWwuaA0K
PiBAQCAtMCwwICsxLDE3IEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICov
DQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAq
Lw0KPiArDQo+ICsjaWZuZGVmIElHVF9QQU5FTF9IDQo+ICsjZGVmaW5lIElHVF9QQU5FTF9IDQo+
ICsNCj4gKyNpbmNsdWRlIDxzdGRib29sLmg+DQo+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ICsN
Cj4gK2Jvb2wgaWd0X2lzX3BhbmVsX2Jsb2NrZWQoY29uc3QgY2hhciAqdmVuZG9yX25hbWUsDQo+
ICsJCQkJIGNvbnN0IGNoYXIgKmNvbnN0IGJsb2NrbGlzdFtdLA0KPiArCQkJCSBzaXplX3QgYmxv
Y2tsaXN0X3NpemUpOw0KPiArDQo+ICsjZW5kaWYNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvbGliL21l
c29uLmJ1aWxkIGIvbGliL21lc29uLmJ1aWxkIGluZGV4IGY1NDE5ODA1MS4uMTM5ODU1ZjJlDQo+
IDEwMDY0NA0KPiAtLS0gYS9saWIvbWVzb24uYnVpbGQNCj4gKysrIGIvbGliL21lc29uLmJ1aWxk
DQo+IEBAIC05NCw2ICs5NCw3IEBAIGxpYl9zb3VyY2VzID0gWw0KPiAgCSdpZ3RfZHJhdy5jJywN
Cj4gIAknaWd0X2xpc3QuYycsDQo+ICAJJ2lndF9tYXAuYycsDQo+ICsJJ2lndF9wYW5lbC5jJywN
Cj4gIAknaWd0X3BtLmMnLA0KPiAgCSdpZ3RfZHVtbXlsb2FkLmMnLA0KPiAgCSdpZ3Rfc3RvcmUu
YycsDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
