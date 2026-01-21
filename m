Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCEFCA5FBA
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 03:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069710E02C;
	Wed, 21 Jan 2026 03:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG4Z8p8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCF610E02C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 03:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768967012; x=1800503012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3tGVtuKREbNci4f66AOxCr4YmFdh4AdXtUSd5D9g4Ks=;
 b=lG4Z8p8X+C0RYCdiYqDh8DsM/yUbcgjbOYM1jQ2a2qs0T7wo/TTzvRqN
 ozNrzMxyfWfzLF4oBLziDebeYVJA4XsrQHULdzUsZhmOsuKX7ZdxL+g4R
 UH4MqtcWRxdB/SPMUy3UZLI7r1WSsxs9vCgivmcZjALOwl3IavISpiOie
 vaoeeCSFFeVZbUIJezrCd4leiXhsH3jHLa/ZYMhCeSYk1bikEnkUTlBxp
 2//uNFIB7K93ZLpROqyBtDgHTgLzNLji+PlpvcJSfqYLA/b+Nf4DQixJK
 +2sfy7BDQqLNHmHeGdInK/SxzEgYWMoDnVRZZVxMWYkSUmrbAYRwETIVB w==;
X-CSE-ConnectionGUID: obFEgnBgR6exoYNo3CuLRg==
X-CSE-MsgGUID: tMUrnvjsQVK0UcCCujqilA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95663086"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="95663086"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 19:43:32 -0800
X-CSE-ConnectionGUID: L1gxZQRPSRCVVe2wElQPRQ==
X-CSE-MsgGUID: SCKcQdKnRDiDWxYDmqrQeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="229271980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 19:43:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 19:43:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 19:43:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 19:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAnZwDPomQ1CXlB+wMwitL1spePWQivC9cjix2gGuqeMdyWwi1nGeNtRek/39x+zsnathZgCUeg/GFQJAEmz4CKR/zYJgPdZbHjA5GRFufsg9yykXXenaZTNLtMfwS+D9rb2mVT9FHg0P8fn1dcJseSDhTe0acxmrDb8XletL/fe0iZJttGRdmzcCBptvLSCiSsTWy+aCUoMiFwy0z3kAfs/6M852j4y3ROFkSE/fa5mv4e+NuEt36UEET432YZ1usDDjulQNin4lJJ6xsmxm/xrl029CEXYDhMRN+1MPEwAPDYDPbuU30FFndeZsSJRVET1FSuEw5WDP+sLtTNVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djnm/ZFrgi16b2BT6040Y3YdVzYHB7JueOVmMqi/G2Q=;
 b=a5qc5TtVz/oosaq1WqMypLyj+SUgw8Vv/rSZYlmV+Cc8HwiItCC6v+s/D/KQgFdbSLxGLj/UqqUWwCLura2KDQeXDo+ZMzZhzpSW1eNLuKqgQ6ftLX1Nyrd8VhSyoINYIB7KsKskJpeqQsp/DSAw7uIV5qEEGqlPrDmDnMWQsQilwovg9K4zT53+ot092CCnlq4EifPsz3hLIWbF62XoSwJASFtBM4aA3U6Jbp3ws5cO9lxEpf3Akm5mOPNBcG5a3kG4GuS3GN2kypX0x9xJq3HgUzai2CVGIYbxEP59OBq/H43kRS5tdf1iC7ZbCpwWNDJsDa6LLosvBjDmFzwOaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 03:43:26 +0000
Received: from IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::fdb2:e2ba:9504:5adc]) by IA3PR11MB8937.namprd11.prod.outlook.com
 ([fe80::fdb2:e2ba:9504:5adc%7]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 03:43:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH][V3] lib/igt_color: Improve fb compare time
Thread-Topic: [PATCH][V3] lib/igt_color: Improve fb compare time
Thread-Index: AQHciofMu8KKaHju7k2X9QtgeVOJVrVb+tmg
Date: Wed, 21 Jan 2026 03:43:26 +0000
Message-ID: <IA3PR11MB89373D89E5D3EEAC5916CDBBE396A@IA3PR11MB8937.namprd11.prod.outlook.com>
References: <20260121033801.407475-1-alex.hung@amd.com>
In-Reply-To: <20260121033801.407475-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8937:EE_|PH8PR11MB6610:EE_
x-ms-office365-filtering-correlation-id: 8b8e42a8-1314-4f12-b335-08de589f3c36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?IyMWEtYxLjG20yjlutWEFWugZ08l1AblMms5EmMDXgmgrc6AL//4tbyzoqS7?=
 =?us-ascii?Q?TawmoQo7ou1uafnlG0uo1HOy6z312HzQnu1DQ1irjAVpspEMV/MIkIExIHpK?=
 =?us-ascii?Q?IIumjo0xrjQ7lV5xOwVEmNrDdLAjGT8ZXVb90FSihgkB+sXYDYw3oC7Ec0t4?=
 =?us-ascii?Q?kxzHrxguv/O86khKhj1oQa5Dk+uCCyg/wJZhr8vNsUqcjoFQUASrpWNwhNxl?=
 =?us-ascii?Q?MfvNgP9LXYa/QYd8BV/jkwjecKRZTqSrQnT9A40DfLfTNFr5ZK4i22HLjAWd?=
 =?us-ascii?Q?JtAaJ2yB1XJkGqRLBOT24/YNVGudqkj89v2O249+17vclYMSHWgDAZfkkT+u?=
 =?us-ascii?Q?rEK0q26jldxdFO1Z6P9DWA0yjaOlomrnPl2yy3ACIM63hMiqLS916UuABg/6?=
 =?us-ascii?Q?QejEiyYqgYsHeFrjO+mwilMLH2uKJhECk7xaWR/FXsjljh+Vpv5PjvwC1HEF?=
 =?us-ascii?Q?mtDg4RCii16Yd+tIDCZIGhfgCTgCwPD2P6266BieE3QTYYeoO2rzmjoWZfkE?=
 =?us-ascii?Q?AGm02bcrxCjp9Y2MezzGgcdWZnnzV9NIKQpAzv199wPOkvdBFjuc04c5dWtO?=
 =?us-ascii?Q?KgGvx7do7e0Duq7TIwpLBXxInO/ai18a84zfN3crMPRGjmIEE000QfE8WRW+?=
 =?us-ascii?Q?OKxEML9LIadKoOIKvDTKSP8d4zOiII4YpnQkRHFFuSZsSyxievOznoxcvPJz?=
 =?us-ascii?Q?npEMSIIK5qHtcbwASMJIVb6OFLm6I9+9hc6r3jvAafrwMGSttnW+w5fKV8++?=
 =?us-ascii?Q?USZhvZCtI8EL/ERG949gNKp/RNZkVEy0tBQkH/G6VUoA5fl7P2RToFVqeKHs?=
 =?us-ascii?Q?QeCnqPPlCwwFNqnRpxtAd6AROfDHBLdjwdOPd2lNeLH2x2hAnM/x2WQCsfut?=
 =?us-ascii?Q?l9Hft3ka+qbz/VIyjht12wkBg2Ll8Vp2+gacbSqjnEAXFk7wgIlZfh7OOlQ9?=
 =?us-ascii?Q?1Y8+CMiBYe3S0++S9LQ1uxliEHkFUb1F4m+l0crupS/y6KBNbHF40cY7PZJK?=
 =?us-ascii?Q?3L9lJIyT0nnvqvo+gYb3rUp27TI9Z7chqSS4rgS960J4d7B+b0s1vhZBXD16?=
 =?us-ascii?Q?/gGThCGKcK6vBIJq424G5pRW37aImrVkC5uJJU2cG9scHmNvZ5dS6eallTTd?=
 =?us-ascii?Q?LzuAA7LfdIrlhDV+IvBjhsObAYO6YfEkXdI4AkiQ4BnvuHhIIKSbHXkqik+u?=
 =?us-ascii?Q?a/kVbJKJx8qIZwt/0QQWTq4j/o4+NHfWN9jMKHmMiET88FVmbdP9/0CtO5FP?=
 =?us-ascii?Q?P8CPvLISjFLYE8xdu7Rocz2pikPsm4yDaWXnsvdV3pFklCUxtVtDaDz1S1IV?=
 =?us-ascii?Q?csDBWKsKKYhfPd0T5cbCGOcLljnEbmHRbr1A+6hBfGxcSLkDDx1bfZL/M8l/?=
 =?us-ascii?Q?JzgUr8wuXNwDTggl+17NMAmNb7em3tyOPlSC5Emn3XcNVsMNdUg9jP/BhanR?=
 =?us-ascii?Q?ssJDPciYQTaS/mw6npRX+/iGco2dhGkL4FRLodgPnnA8HeeZwoWIAEl7bohm?=
 =?us-ascii?Q?li3s7lCjHCgHkjFKWvCbyPQwcNIvWUBqDHh1Y1TXYrJDmIVcfYtfaPJRqvEh?=
 =?us-ascii?Q?tlnZi8+W9PNreJA4AVbnmHEFfyqA6o6UiuDfrqrkqcmAxKhoreHDB6GuYrpZ?=
 =?us-ascii?Q?AN7EVrfy0b9vE5JyHQT6Pe8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8937.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lwnLz7ASch4tNdejutfRL9kg7LgOvCs8OZGsiTx+AUHA1MTXQ2bMW7Xx+l0m?=
 =?us-ascii?Q?YnJEjYRB9sYf8U5r+lmFlDTVECr8lYBeSl5uvkahsiGgIGB+WOU7yRLNHr2Y?=
 =?us-ascii?Q?86m4G4lF2K0FSiVgBt2sK3TE596KC1j9VCnYm19cDto+mUSAu3UdB9MO7QrF?=
 =?us-ascii?Q?rMXCElSb2qj5dSvWlDfrnDQuyCZ4+/YNHdRN30dFVf8sFVm3ROWuggm6hJth?=
 =?us-ascii?Q?3UUmY0jDfeYxJoCcLTIOwkuiPNpjyDYAu3Vv6hoy6CL/We4W6on/9xb5HDU+?=
 =?us-ascii?Q?yuvazadlKW+Klst+hAgFO6h9EGNgXPn1Q+40/aIfe44vo/ly14TmiVRh86RG?=
 =?us-ascii?Q?zUTNThuwAoWQU8OqvvftilydYqMIKT2C4FT23y9j/0J0mHcENh8j6AQ0qWhC?=
 =?us-ascii?Q?kPYNAVkjpS0OUJmVGLPaDKPOxD7wm3CRLGKb+mfke4cB0PDj+5WFuGVG8IYQ?=
 =?us-ascii?Q?GSu/toArdmd1nBG62IAMZp4gAWbKdhREbgSv5ILkwosOxo+wDHpnXFhcsch2?=
 =?us-ascii?Q?2IJBac+dsCnM/5p4YAFfKtSDtF9RjcvU7PbYJKUwlPxLZHWx7qgNenT7Xhy6?=
 =?us-ascii?Q?kWnM143NzEMkwOTHz5/IIkjN44DKbAI+tLCzEOBcIS2eB4Z7lVzt0Z2HuQAR?=
 =?us-ascii?Q?aEk/EvQy12EfU+PpiF58dRNfotjlUotxfO1I+jZUlAe9NBOMGFSQANDUabRm?=
 =?us-ascii?Q?B3PUQFo3Kb/aDbV4iZs+kFTpFf1cHrkd9/PBJpWhPHMyUtMRcny8oIi20fz9?=
 =?us-ascii?Q?I9A6WqgGwbjyfhTJjJVnlEk/zw7GNyTb1neqykIPyuF7ZkDZ4vjhUVlRjHTH?=
 =?us-ascii?Q?rSMuVMtitg/ixKivfTNgMoedYOlo+IST0bl47TGuZemPCTzHFxbXwQDSJqOY?=
 =?us-ascii?Q?b6QrJum1CCctlevfypIlloh5VfAMZWdLWvsEK/kAhFdNZKhNObn2aSMX7TvZ?=
 =?us-ascii?Q?ij2usjU1C5JtrGCBjSR0Z4wxRRqKZaMjbqmbSL3JpVhTFkV8JFF30Ab1DqO/?=
 =?us-ascii?Q?sRCpgleZjDN4izXTAr79FFDTjBaAxfbZbMQyoAjf3ZTQ0NJqzl2Ts+dKjvas?=
 =?us-ascii?Q?crU3xOIwhtgMJQDGARAXwSHlCxMyzG9PDdCRQwIt+zsxre3UZp2UDpAFcD6m?=
 =?us-ascii?Q?jKXSkwEu/IyHgkuI3pEQMhhsW5AcxYOsWBWFZmvXJ2fheCESwaKfYQ3LT2nn?=
 =?us-ascii?Q?UDaJX/s95DsNcnAJwdAm00TiN5V7bdHHNhlIMif2/3dINdlIJHQvZa2bc0Ep?=
 =?us-ascii?Q?ImhhzCemQomcTzNVoV6EHXXwor35w0tvEx5wck3Uyup8inD/0ufIFq/wNI02?=
 =?us-ascii?Q?MCAasY7KSCVce4eAnch7DRafLZ1AyOuoS3KLZwDrJOGCXp+8JmE8C+6BrC6T?=
 =?us-ascii?Q?mWNcbAIYY7T71Q3Lqv43QI1FeMnb2lyQUxhR94CijS4jjjN+5eezQq/MDEYp?=
 =?us-ascii?Q?yVLUzKXDBrJBSL5uSSffS3efZQQt3QyupP4R0lSpic7EkS5bQYriw5Rg+nyd?=
 =?us-ascii?Q?k/tn4Itn1wNcBejhAgd9/kFaPfHKG9ozmscksp+vN8ultipXVFoBNjAXHXiU?=
 =?us-ascii?Q?aOAZSAyFxiud7cpEkB5QLwCKxhIS5IsUFEsZ2elWVkAnwWzbSlenTQ92FqSF?=
 =?us-ascii?Q?mkT+lRXocwy+dxulBC5CUpnyA52JBLLTRUx0FHpPeBQ2iy/FAhpAd6aUY74e?=
 =?us-ascii?Q?iS3tylw5of9MTCYlWo3RcaC9QPBTgt5K8SP64EwT/TwcxEJacTVZBtP/1PhH?=
 =?us-ascii?Q?1kQ9yJt9ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8e42a8-1314-4f12-b335-08de589f3c36
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 03:43:26.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4TTsKCivDX1gqDjBXXEHBk7QGuYh3rUjwvRM2sMYZU7PzzrNNtTk2+8SxZ+bHmVt2KrlHIAxmFVS5HzQ2hj5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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

> Subject: [PATCH][V3] lib/igt_color: Improve fb compare time
>=20
> Copy the memory to cached buffers first to avoid slow memory accesses on
> dGPU.
>=20
> This cuts kms_colorop execution time on dGPU from 1 min to 10 seconds.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> V2:
> - Change Improvement to Improve in Subject
> - Update comment style
>=20
> V3:
> - Move igt_fb_unmap_buffer after cleanup so map1/map2 are always
> unmapped.
> - Handle partial allocation for cached_p1 && cached_p2.
> - Replace memcpy with igt_fb_map_buffer to more speedup.
>=20
>  lib/igt_color.c | 41 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 7 deletions(-)
>=20
> diff --git a/lib/igt_color.c b/lib/igt_color.c index 4d94421ba..54cfebc40=
 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -575,15 +575,38 @@ bool igt_cmp_fb_component(uint16_t comp1,
> uint16_t comp2, uint8_t up, uint8_t do  bool igt_cmp_fb_pixels(igt_fb_t *=
fb1,
> igt_fb_t *fb2, uint8_t up, uint8_t down)  {
>  	uint32_t *ptr1, *ptr2;
> +	uint32_t *map1, *map2;
>  	uint32_t pixel1, pixel2, i, j;
> -	bool matched =3D true;
> +	uint32_t *cached_p1 =3D NULL, *cached_p2 =3D NULL;
> +	bool result =3D true;
>=20
> -	ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> -	ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
> +	map1 =3D ptr1 =3D igt_fb_map_buffer(fb1->fd, fb1);
> +	map2 =3D ptr2 =3D igt_fb_map_buffer(fb2->fd, fb2);
> +	igt_assert(map1);
> +	igt_assert(map2);
>=20
>  	igt_assert(fb1->drm_format =3D=3D fb2->drm_format);
>  	igt_assert(fb1->size =3D=3D fb2->size);
>=20
> +	/*
> +	 * Copy WC memory to cached buffer for faster reads.
> +	 * Reading from WC memory is extremely slow so this is important
> +	 * on dGPUs where framebuffer mappings are typically Write-
> Combining.
> +	 */
> +	cached_p1 =3D malloc(fb1->size);
> +	cached_p2 =3D malloc(fb2->size);
> +	if (cached_p1 && cached_p2) {
> +		igt_memcpy_from_wc(cached_p1, ptr1, fb1->size);
> +		igt_memcpy_from_wc(cached_p2, ptr2, fb2->size);
> +		ptr1 =3D cached_p1;
> +		ptr2 =3D cached_p2;
> +	} else {
> +		free(cached_p1);
> +		free(cached_p2);
> +		cached_p1 =3D NULL;
> +		cached_p2 =3D NULL;
> +	}
> +
>  	for (i =3D 0; i < fb1->size / sizeof(uint32_t); i++) {
>  		uint16_t mask =3D 0xff;
>  		uint16_t shift =3D 8;
> @@ -614,15 +637,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t
> *fb2, uint8_t up, uint8_t down)
>  			if (!igt_cmp_fb_component(comp1, comp2, up, down))
> {
>  				igt_info("i %d j %d shift %d mask %x comp1
> %x comp2 %x, pixel1 %x pixel2 %x\n",
>  					 i, j, shift, mask, comp1, comp2, pixel1,
> pixel2);
> -				return false;
> +				result =3D false;
> +				goto cleanup;
>  			}
>  		}
>  	}
>=20
> -	igt_fb_unmap_buffer(fb1, ptr1);
> -	igt_fb_unmap_buffer(fb2, ptr2);
> +cleanup:
> +	igt_fb_unmap_buffer(fb1, map1);
> +	igt_fb_unmap_buffer(fb2, map2);
>=20

Nit:You can delete this line not required anymore.
Otherwise LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> -	return matched;
> +	free(cached_p1);
> +	free(cached_p2);
> +	return result;
>  }
>=20
>  void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
> --
> 2.43.0

