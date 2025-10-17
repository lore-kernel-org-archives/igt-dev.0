Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027ECCD199
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 04:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7500210EAF5;
	Fri, 17 Oct 2025 04:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvN6+sSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7671610EAF5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 04:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760676597; x=1792212597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VwdUaMseINjsm1MH7dfkPjDodrHXq2XF7P3Nw8ZOibE=;
 b=DvN6+sSWzSWX7HWx8zd4hMeStATjk4qFq+BLctxcFc2oVO3zmNYuf1Dn
 Eqki918FSsy5HUNofMyawc82evGD4zEmBdt/xyiN2RIjqlLs3MSZqVAiR
 9EJn4GRASUjmVd9F5JPWao8vjG2xJ4uNuIg7u3u+yASGHyv2LnFrZ7ztg
 8g/5pTZcmKRBwHp4GLaN0jy2dWWYwXV4m1NSgF5td0cJYBKL9+oSCDFXC
 W/kopxiutoh7wlrRX6MZ218MZyOWxhETe2/oGjNHd8++UYfHcM3MkiE33
 q1vaOdagyqz2HTbIlRbE4qY98w5/FQWvXrIlYuJyNuKHZi/aT+pUJZWYr Q==;
X-CSE-ConnectionGUID: c/I/RMA7SNWM5GUkjCmotQ==
X-CSE-MsgGUID: zezC2K0DRfuC4n6vZ6fvGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="85500867"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="85500867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:49:57 -0700
X-CSE-ConnectionGUID: eWKOQ++DQcaTEM2fsBdCUQ==
X-CSE-MsgGUID: XMf8HaVAR26Lp5bLDA0dBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187721943"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:49:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:49:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 21:49:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyrhv0MtGtIf2EHse5emA9NgZ+Zdyl8WXEvzEFBi4BANcmgXA5yG9/Fuy0nA6/aAiAmsS2MBOgVsbtYcUux49+jBAAqAegmzAJ2z5IE2CRD97UhgVxIQTTvqQE51pcN0ClGD6ClcWwWx644ZBIuUzhxHzoXLmxrIWxwSog3c53vDf9vhQTyFvxCFGk8hscipVnvMzjR9V53BD+rKjOqB6G3KGAVvFBqAprvnv9FFSyAEkoC0xV+1Fczwy8jhwnlWEebWpl71Y86IbqeRBK8xR8NilklyWwO4eU3dgzdoNQIcxCFNi/yvJEXirLQZDAtTy9NXZY/HCNDp2vbC8r0JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLWQXPVQffwvleYkxUKZVGs2sDpPR2RHQUEB9CjBQQs=;
 b=EGAF4l8IyrdlgVw4jMTFUNIZa78c8jZ+f6GfDZ+c0GMQOhrW60MYE+Ms4DP6NATBflM2f5eLeAWt1ZKnWUs6A509l+wPMdlKssLR1lGvvmX5jKVVPYKEoeiXgBTY5/DhdxFBpbe+S5asFpMnlIxFcZn/lmhJfh0HeNASetUy/gZB52Zz/KmZxRArL0BksEY4g4vEGgkeHcpx4VNVbKp78LsTKoZLAStXopX3wnM66tA47Qz5IqcJg3m4S21T9O2I4/BBfP7KftKJzBfdoIAIgewDPI6SL6oFmhGNqAOC8b2Mf9MfEVbIOEyUJRPNNP3tesZHa2KSTuVoKl49S3mjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 by DM3PPF4C690C788.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 04:49:55 +0000
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c]) by SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c%5]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 04:49:54 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask
 to reduce log
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mask
 to reduce log
Thread-Index: AQHcPOF4/KFnnuILvU2LkR8cDiwbXLTDDzUAgAK5JOA=
Date: Fri, 17 Oct 2025 04:49:54 +0000
Message-ID: <SJ0PR11MB681464C9C0E2DB0D795749DFE5F6A@SJ0PR11MB6814.namprd11.prod.outlook.com>
References: <20251014082330.2936489-1-sowmiya.s@intel.com>
 <20251014082330.2936489-2-sowmiya.s@intel.com>
 <PH7PR11MB6053CEBECB5A9C30557FAFB6E7E8A@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053CEBECB5A9C30557FAFB6E7E8A@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6814:EE_|DM3PPF4C690C788:EE_
x-ms-office365-filtering-correlation-id: 9571a32d-7a3e-496f-d27d-08de0d389d4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Zzu3bj1M3SKzgp//J+ar2mWh6fECo0b98tRTW52fZVIKGpWNbDprwgbRauXJ?=
 =?us-ascii?Q?4kj0k2pt0CM16HxojlEJC8Udn+En6h9mx2zUVNzCPlPlULe+q47M0YIS6gIs?=
 =?us-ascii?Q?1pwdpIUkPMa9RPBRHAaqHx7fzcf8sv17WHFLKN8zTDjw6NwDcJHFtRbRAVJC?=
 =?us-ascii?Q?GL8BKQH7br+oqbvJT1xOJ6ZJl+Bg9sVaautgg76HtDzVEcFWB75G3ES7mciy?=
 =?us-ascii?Q?y6JD/yErBNVYDTsMkB+LfQTZcCeiP964KPOOi83I94l604Kvf9P0XBwH51ui?=
 =?us-ascii?Q?zOx1kYtfhAU0EZHdxr//fFMVueoC3eO0VuxfkRsiHaVYsc+tQebaUsRZayg4?=
 =?us-ascii?Q?hDzfFGhxAefV4IhHQ7igJGBcswtvr+prBvIEWSTcFxLWlJKM5M0ZYrDfwrGR?=
 =?us-ascii?Q?Vmm6Aii/23VsrKGMKZ0DJo9Tzft/qlTA1uA9V4B8coUyLnMD4Fto+9bNQPJs?=
 =?us-ascii?Q?m74hJ6vJNFpmEiGhD1RjlgohJuUr5hrYf0acwdRVL7j/GqFselscGMCvjZrT?=
 =?us-ascii?Q?WYZVz0JQ3DhdhPpwAbbpu8YUx36eprny2DENR2obzA3OI93oeGCHhxh6OHZv?=
 =?us-ascii?Q?8d8GioEGq2Gmfg4B79aE5JiN0nFpttlFN3eGf9mGK1RgIAhWy31CAFB1zq9K?=
 =?us-ascii?Q?xQqARhU51BTFJu23hICHgPhon7ytbdFbjl+NrrHc/mNUAbYSB8k8gtCC5ZVD?=
 =?us-ascii?Q?xK+p9xVaFHfn4J5iQZjXG64QMBrPahQxD4z8ZQoDZGErw3e06h5iBfZjF5oq?=
 =?us-ascii?Q?eLOq2KFX4EarjFs1UBvKJcbn0DzF7Q/zr4BkDTPb4B0N6ZLlbWXMx6/93coi?=
 =?us-ascii?Q?upPNtg1F7/J0FSYlMe1VC7Vp+cDTzlvQFIvYTS55U2MoSQzAkM2G25PXY7io?=
 =?us-ascii?Q?wh42Xko8U7Mr/7XVtN/WfxEHPHWTjnZpcmvlUFuAHnaN7PB6sdVcN904mL2R?=
 =?us-ascii?Q?FDonMsVj/RJKFa6UHXZqJbOL5FzUlEDYN8ulqT69VBWe8Pd4JyBGHes0mdI1?=
 =?us-ascii?Q?Y0mDAWcsoL5UzvOWvxLInd6O3Q7bKjobl47EeCip0t6EM7S918T94TNVTiXF?=
 =?us-ascii?Q?KfsDdJuo/nc04sSFM8Kc94OzGToxWslKJ5suPKqFpj1lkBIuIij9lHsYsjeO?=
 =?us-ascii?Q?U5gWkrsOMFepXjsfn2T/YkCH4wa4XWtC3GYPUT/Y3qKdApTi3C3V7TqLyElG?=
 =?us-ascii?Q?SIAoZSTRqx0s+iRMFx7rPgE3GrDUCU0Jj/SvaRkmI7wl36hy3dDUJgzkXAWk?=
 =?us-ascii?Q?DlHZBBVCyD0wbqGzRoVH6t+AEU3COIudDP8ylqdBWeYIajif6s6Vt5StF6VO?=
 =?us-ascii?Q?NyT1JVhjN9lSvriGpgPSsy9sX3ksTp5Ur958ij/LVHDxQOTS0WGYS+8CT4wL?=
 =?us-ascii?Q?tqAOsry8qn+vL69aiR9/+BqET/7zEmGRjw4GNiTXFZAHeuEi1i8PD3ytt2Sk?=
 =?us-ascii?Q?skNv7s9EFY/MOxM1+kFKn7OkRZFAxd1jdmYtzEmV4duZKnx+lM0kk6pJs9Xf?=
 =?us-ascii?Q?1EF7HnfT10wilk8w1jaCegGmweTDWL378rcu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6814.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+RYKcf0Di1UeH218ocaGNjZl7LdUUUKF1UoG9utfRC871osXng6GClzrefne?=
 =?us-ascii?Q?bgNYummwBVSRADUbUZRxuKXNmlEeMgNDdPBwyL+wlfE3DMR/Q7+SUPY4oke2?=
 =?us-ascii?Q?Le/Hx3gMDvJQUtm10hrYtLqUvysFkQTbOu2tb3/bR2psbbAi1L2Pwgf9wAy6?=
 =?us-ascii?Q?CPWmCoo56kq5VYI7IGO46kMmHwWOhfLUClm0PFBQ6UlXvfTd1awz2j69bbwi?=
 =?us-ascii?Q?FMtlmeBWzobJ4mUFxo95Kkm6asRRSyufPi/q6dhefGET0ps0tAFHX343hAKH?=
 =?us-ascii?Q?V4MapOetLrKOQVqrQMznR78ft6IDhdn/CaLikbWaD1g55JbQy+R/tvgyyR7c?=
 =?us-ascii?Q?VclrLhIdwmJsBcLk1mQiucmdo1Tllp1y+IEHuu3rRGFzReO0Ptru/Xa3UJc2?=
 =?us-ascii?Q?8LsTQaVM1KL01Dx7TfmvCBWoJQyCMxqfLiTSj1TnT6zBghJ98b3oxKxEevF/?=
 =?us-ascii?Q?0agA10NpfJ0bFryplyyUgljD3v16kB+wAyCjTvi5UpxKI5W5j+UHkrcEkPIH?=
 =?us-ascii?Q?zEclyBpJVaUIyun2Ph6A/GUyvwb1g8zP/J7UhF++ORgX+beHvJ0d6soJKLC+?=
 =?us-ascii?Q?W0xc84/WSASdPtVNgi7lc3puZrwvraDPGA9kDcorGfXEvc+ye+IunPpQWmbr?=
 =?us-ascii?Q?Q6sTShmKT7zYAKwfaCjh+meCFcRQEG9MPKo6ffYU7nrfilOXZ8ykk+BPoydS?=
 =?us-ascii?Q?J3pcrtksfOMn1gatfWuRJc2f1gqa/mK6PMAssh16kD3y0zLyivJRLOfnXsjW?=
 =?us-ascii?Q?SLm1FrRw8ggvshDSqto+IwDgnUY9/u1u0C+2LEyzD16VC80hGzvMGEyUpeO4?=
 =?us-ascii?Q?4GIwcRTf2WkumsKMSK+Z4Zlyn+4A/BwSnJnA8FhdHcF9AeerlkFWyYCE46eV?=
 =?us-ascii?Q?ORcHnHl1KrqSU6CXpEkxq8qtptc7dvw/hilP2PJQgYd0/N0l5SypnDtHYsJ2?=
 =?us-ascii?Q?LsEpRQOVGQ9reSHy7mnFHL141je9ngXCkFSSbgNwOQ00msNrM/fsBMbs6g9R?=
 =?us-ascii?Q?S2V407ny0WFCERVMLRq/X2/NfKdOyDoxAnNS7UJNmwk3nMzL4zGTo6nNYrUE?=
 =?us-ascii?Q?898PKF0CH+rIyuBVHzWJ6aTgH+hnxvRvyWu51RBjhdRpYmdZdfixHQ9s+Q1f?=
 =?us-ascii?Q?zD+UXm7QBaG0SRgBI5OHMhNCYWPNbXMm55OzAzh52XwSAr7ZQ17y0xrzStJa?=
 =?us-ascii?Q?SG/337S5ytK+jkX7qAph3J17nM2yXuZjGccJGcARYYCcMdRsyw4DMej3eG9C?=
 =?us-ascii?Q?iqYwK4nNGD0DjR6OkXGAacZVDFZ0bTneq7V3b5gdyD+wQitt2ZfF2JVENHW2?=
 =?us-ascii?Q?l3a8pIVzQCjx9IgVmFmKKW46M4XSjYoBfPljBwWBIL14dthN67EIVY2pYcR9?=
 =?us-ascii?Q?e9xi1gBP+RLpzWP3Rw4xzgBeCK82SuQjmX0HFYH0D9mULsyuyQTIX8fk5lPU?=
 =?us-ascii?Q?BnzXMLH3ljiAnf535DoOg0EG/+nTDIsAGtmUGghnlZva/TWALg58ospGwjAl?=
 =?us-ascii?Q?R6JwfcW/7d/gYyVgxsCxQwELlDzsGTLFVKUb3yYJZ0FP9S45DKPnn9+VEEHR?=
 =?us-ascii?Q?3eym1AME6SkLpSODYB8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9571a32d-7a3e-496f-d27d-08de0d389d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 04:49:54.1138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrDYHM7/tGuNkpC9yfv2le3dOa0EZiODtmmYUbAyXbGwdTAWIkQdYPRiuYH1v05ZDgf1Q7lIWPtzmojZ4O5j2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C690C788
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



-----Original Message-----
From: Samala, Pranay <pranay.samala@intel.com>=20
Sent: 15 October 2025 16:42
To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug mas=
k to reduce log

Hi Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, October 14, 2025 1:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay=20
> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_cursor_legacy: Change debug=20
> mask to reduce log
>=20
> Set log level to low for subtests that fail due to disk limit exceeded
Imho, The message conveys the intent but could be more concise, e.g., "Redu=
ce log level for subtests failing due to disk limit exceeded errors."

Sure, will change.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c=20
> index
> ed1c77d55..3eafc0e30 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -2061,6 +2061,7 @@ igt_main
>=20
>  		for (i =3D 0; i <=3D flip_test_last; i++) {
>  			int j;
> +			int flag =3D 0;
Imho, the current use of flag works as intended, but replacing it with a bo=
ol type would improve code clarity and express intent more clearly.

In rev2, I removed flag, as it is not needed to update the debug mask
>=20
>  			igt_subtest_f("cursor-vs-flip-%s", modes[i])
>  				cursor_vs_flip(&display, i, 50);
> @@ -2069,9 +2070,22 @@ igt_main
>  				flip_vs_cursor(&display, i, 150);
>=20
>  			for (j =3D 0; j < ARRAY_SIZE(tests); j++) {
> -				igt_subtest_f("%s-%s", tests[j].name, modes[i])
> +				igt_subtest_f("%s-%s", tests[j].name, modes[i])
> {
> +					if (strstr(tests[j].name, "flipA") &&
And what about flipB subtests?
Aren't those hitting disk usage limit issue?

There is no failure with flipB.
> +					    strstr(modes[i], "atomic-transitions")
> &&
> +
> 	igt_get_connected_output_count(&display) > 2) {
> +						flag =3D 1;
> +
> 	update_debug_mask_if_ci(DRM_UT_DRIVER);
> +					}
> +
>  					flip(&display, tests[j].cursor_pipe,
>  					     tests[j].flip_pipe, tests[j].timeout, i);
> +
> +					if (flag =3D=3D 1) {
> +
> 	update_debug_mask_if_ci(DRM_UT_KMS);
> +						flag =3D 0;
The disk limit exceed issue is only on CI machine and executions are done v=
ia igt_runner.=20
So even if you update debug log here, it will anyhow call exit handler afte=
r the end of subtest.   =20
I don't think it's necessary to update the DRM debug mask again.
Correct me if I am wrong.

Thanks, Pranay. Updated Rev2 accordingly

Regards,
Pranay
> +					}
> +				}
>  			}
>  		}
>  	}
> --
> 2.43.0

