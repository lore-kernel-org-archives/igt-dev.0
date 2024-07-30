Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E803C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF0D10E313;
	Tue, 30 Jul 2024 19:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvN9UH51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AAD10E43F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722369246; x=1753905246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tiwPP0Up6eCNSATW9XtejO28cGTXpHlcha71SxND2IQ=;
 b=WvN9UH51i77a7sR3Eu9q+PtgUpRetVLY6mIsM3EVTdsnNdtSueiTv5D/
 1ix4xdBUAfGJcurLo+zb9RtcL+rbmhzI5dLXQpdciaKVLXDYOi3FtMdHy
 hukGxsU2AiQP7T4zgumxeue4XzlbHMbNYxsDr2/B4kUWu+y1yFEGI0Kjk
 Y5RfKbk6bV9MXog+C8dcVgVXq47NQRXVOEqIk4ZZe86iFd+j8l5NsRdYd
 FJmJOguoKucPWssUDa9/wBBKDhTiifdoVs3tJdZBFFlawuqRltcT4xtIH
 5pjBJ+u45LB/INtlVDuSokTzU7aV7Bo2eEAStZuj6sNfCWqRp2CaNuNK9 g==;
X-CSE-ConnectionGUID: 68ykuHIYQrOiurGhxjJSIQ==
X-CSE-MsgGUID: Wwa8r0BdRPWf+oy5zaHoRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23976321"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23976321"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 12:54:06 -0700
X-CSE-ConnectionGUID: rLZFYhKpREypo7VcDoXqZQ==
X-CSE-MsgGUID: Pn3pzjf7SIa0telMmXOLbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54362119"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 12:54:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 12:54:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 12:54:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 12:54:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 12:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXkHYrVDVPcQrZs5L+yRIbNgcZzFqKY2OQKcqCjk431iIHAL9i3mEYjvHkf3mgndr4LBzcvLUpzDssNZNWEEG7xL0CcLU5qFINVUeMozEQLvoQzOp+fgf/MhvoKdzjPNIs7dwaxry+McCjHtDCXEMi2IQSwTuMalY53L91LlGQju9C6knBurAcBnlzc5EQ7lNo29VuFZF3bkKUodOw5z25lB5D8Gq5ln6gXV99pl6cE8y7e6Fw8pj//QUxZnRSOgOYF2/ov+Jpz+ttwXExUa3aLm96nW8/jYz7Ar8YrR6Ec4yVykz8GqYj0znkm1qtPIN8any4/RB+ncAbHczqnOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBf/h3rT07UMuKyRNlctpxqYNu9JVcjpAhLkBtXINjs=;
 b=RdbKHYi5YnBv98Z6uAP+lr7Gzrvck7iLcpn7G5hpiZy2HaRdkdrvq3MZkbQKz5eleO4OfY7GgbqNMVXGUoaJKXIEGxeUpuPPr2nvQo3rZYLnQL05o8yqyFZeBxhPMxecXvboR54CYZ3S4rByOZaySPfWyrVw5FdjOvOgt0UzAkalMLsucRig1leI17qMwF/Vr/3iWxOh7j1BQtNMG/kRTxHzmichkJ7asKx0PgF5F7noIyav+sGufXHFGZ4+TWxk0jngxIk1B4pSD0I5p8w7y2hL3g7DPKkkZySpztEDCeBR7h8xJ0Yh3MVodDjOWiZ4d3PLxlMVeSrBWM8UYhS4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB7079.namprd11.prod.outlook.com (2603:10b6:303:22b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 19:54:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 19:54:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if
 'gtidle' attribute is missing
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if
 'gtidle' attribute is missing
Thread-Index: AQHa4qCHpeVZHuLWrkGKrXb4cvd0qbIPrpug
Date: Tue, 30 Jul 2024 19:54:00 +0000
Message-ID: <CH0PR11MB54444F8C977927046212F03FE5B02@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240730164232.286232-4-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240730164232.286232-4-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB7079:EE_
x-ms-office365-filtering-correlation-id: d9312b51-421d-402f-580f-08dcb0d15b3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cNvHYSp6G5CE7eyHvxjsvP7dWaGF6c8Vm0B0CKo/4Ymbm3aZChO24ZOLElSN?=
 =?us-ascii?Q?mIrvZVj476uaE3YN/sycUmOyH+GgNlMM/4fDtPY5Lt8CxPgtcJll8cXlO1nX?=
 =?us-ascii?Q?Ew58pxxv5b/jEBYrUf4EHJMYe7eBwN7KMtdN3pLQEBNZYgafKefrQ4H8Iy/8?=
 =?us-ascii?Q?RTmVq5AiDbgtkIfa62nFWjQw76tO4CUrXVpqktVSauv2ZdIER46cTxjH2stp?=
 =?us-ascii?Q?SBXvyvuaGcS0nCdj5iiyR5gnvhqGcUw96nMavx2PKnKKoB5uhzQQGxftcfqa?=
 =?us-ascii?Q?ihxnGim4bxanlYnU9jGAltW+psJ5uXIhZy+znckhQaC0Mkpa4HUeMI5uM8bT?=
 =?us-ascii?Q?SckLG9hG3H5ynC/1kbNovpTrwn5whKc59X5bK2NFJ62JnKIY37vw4CVQQYHi?=
 =?us-ascii?Q?9Jck3mGMa6EvjwCegmK+cF8cwD31bJ5UjKDh298tDWPH2oF5FRP53t6D1oUl?=
 =?us-ascii?Q?3rnYpntjZCRyI7prbx0vyqCitucN00WoEOqjjhX17BFEdG1N4qeJBCDpE+6X?=
 =?us-ascii?Q?C5dt5xzhwCDLwByRQMGAq76GTlSReF1cAFxtFailp7IAToOvbuROOwoo6ifZ?=
 =?us-ascii?Q?K35lZoM40QddBaHgXXX7TuTRSiETIPVA5QkVUCT2LqLFHiYNSNZhoO+ivCaX?=
 =?us-ascii?Q?DqPr77He0SYirmMqkAthzppPOlyEgupgW3hMoArbV/Q8GL64VFgrnw+6+eNs?=
 =?us-ascii?Q?rmw+GtoMKny4bXIyPvKwfy1wadOEZsimmg8IGHqRtB70kDupk3ufoW9+hAnc?=
 =?us-ascii?Q?qhYSRboR43RzWFXcrnxcQW6NyhEDOTFp57ZcuSoUn42CpLnUQOf1wAssTFxa?=
 =?us-ascii?Q?yC62U68gDPb2HQW2x2xmfdDGfYsOjTpgblKJea2RR7+voVI30F5CPABsOXBy?=
 =?us-ascii?Q?hxLjDw7Ubyr8Z6i3PrnpR5jZ0wvQ0YiS/icphzbWAfspzVEEQeHoOkB7dOrA?=
 =?us-ascii?Q?46sN89TStxX0vCi0QzF8fw+aTXZdHCZtsKTQD1m9dfGSvJjGebIEjshfmFfD?=
 =?us-ascii?Q?XXa8Gki+c1GYbEpjyF0cY+TyxDmTsEBYFRIXZpygsaqwu24jUeqq+HtCYGSK?=
 =?us-ascii?Q?TyxWIeE87uKWAcf8GLU2R31rRFykKxP+vymf48m1mLMyucanuPikkctEGBSX?=
 =?us-ascii?Q?FJUp0kXnQ7cKjPhcB0dw1bJnou7jhoRzSJpyExgqIU+uirZZcp6gwlg6DIuL?=
 =?us-ascii?Q?MiRvqnTCOQMC8D7Lny3hkW5tD1KBGd97ihwDnuCJ7NMN7wn1j47s8NAJIZcv?=
 =?us-ascii?Q?w91bB675df6GamAyNATbp4UF+fIw85KMdIkszkrE7ebXitZogFOVIMXbDrRV?=
 =?us-ascii?Q?EvgfiBbvc48H9g/4adsDU9bv8ysHGR4XlC5PdgOyk/EkIqzqJRC+jlhsIZUm?=
 =?us-ascii?Q?ZNKn4AD04jUsVbs8bX49XfkoeTBbu8SQzYTJFhIHBQUriRXv6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3xKZ0tzL69XEMA8GX85KJ16DreXaOw78SIogHMfEyh2VGEDBRQBvHjNifPVM?=
 =?us-ascii?Q?AnbItrKyPTmq5fqC/+fikXow/wAcqQi3z3tDTzvT9RR7AfQ2l6030jGrS59e?=
 =?us-ascii?Q?WInfo9FI/JvCnQwGnlB77hO/Y6F80AMe2Q/CAEcaJOZncHv26Gn74JDRYWMf?=
 =?us-ascii?Q?+HWFL7tsVhGWEAwxeNNdea6DToRlaLjxWj1GAWfewESswMSib9Ib5eo/dc8N?=
 =?us-ascii?Q?DjkFf4faf83gNXfVc0a6P8MXp2o/thvlPsDEW4szey2wjvHhHSrdYNgrOQpr?=
 =?us-ascii?Q?v+mUMExRSc5aBEVs+7+/IrP54ZVCrDwtomFquUbrbj6HEDlzt4aMVuriF3kW?=
 =?us-ascii?Q?SD168Hg9cR5g97rC9nUtlufznjZ73wahxNc4Yb0tlJ5mgCVrEPRtOqdmjK3N?=
 =?us-ascii?Q?FMxUpiQSBmIjMFVt6XFmSaVbmqf0uUPxs/rFpJ4C1/IegYG2K5ZHX+s/Mjdq?=
 =?us-ascii?Q?jq+Sy99eexR3U9krZ/jWUrQdR5BS6gSrdSoRe2mJPPb8+DYkm5aujfyLgCLX?=
 =?us-ascii?Q?lRPKzKURBK6F4GoUA4EFHD27heoy0qLmU5RpHOuWW6woIsY+I9XTw9aYNaKW?=
 =?us-ascii?Q?8TrQm6KZF0UfbWJuMksl8iCblcV7k4uSrl2LRhvgoCMU2NEy169K0kCw98H1?=
 =?us-ascii?Q?TWehRB0h3jujCV+VrWl3VyiQUfKIvomAmRv7AmzIl/AIRDsceS3TNhzC+dpw?=
 =?us-ascii?Q?qT4jWCuXo1YAQ0XZYwZrVdsTams1f+3+1K0RTwfggzP48u7UmKhpuQW8IzG+?=
 =?us-ascii?Q?ded6EhrktRcNRWLSGDIf6yb1+VRFK4Zdn72JnO5fLVjHntHmp2uVhBiZITPL?=
 =?us-ascii?Q?P2UJsp38SdxAooaKhzQXeKuSNmz32emxhf3xL504Wm5y5kgeruwi4g8GHVvJ?=
 =?us-ascii?Q?HrZ4w9BW0MLPaH295p4rw8f1hfdL/RCn5KKzHFTRaVQHFg9R2wAqjxHW5jmn?=
 =?us-ascii?Q?AafcOV4lU+arV+yDZnK5e9xl4rcM4m5xJrq/cDOPoI6E2bmueh4r9J9ME/GV?=
 =?us-ascii?Q?rqW8df4zcS7E4EiFUufWb/6BiP2oVLH3i+8y5Oex/EnK8gXDTraZRUXbVgWL?=
 =?us-ascii?Q?IWObYKaql0hg+UN0UJ/7DjzxcWvwbwxio0GwrGi/TwxxovlcIr1mbqJWI9aA?=
 =?us-ascii?Q?7TlOKb2S0PsAiMUrl4pZJxAns2oZ2MXcgz8rStBKS8dtgTSCNqY5aNhfjVX6?=
 =?us-ascii?Q?k/c/33GIoOUD61V7F8CX212GOtTFpzw86WdJMwypLJQfaxW+TDrT7zfgxPno?=
 =?us-ascii?Q?VEks4p4iuJ0YwjI1A7SCK0IpXg2wZgxwXJpPlfM2a7bdd3J+SO8s3x6YaOJH?=
 =?us-ascii?Q?9DihCrvduEInEJEF+7lNhPSQneivXkzkgM9qRdvCV884KbC34KuaTcfvIvg8?=
 =?us-ascii?Q?tWBVc9el7zVVoxN//M0GJdwq8Gf+5zmLcpOgVlFkzIM6FFKcgqCPuDdUVy0v?=
 =?us-ascii?Q?bKZlNaFmSw9aJmf9i4NvxXYnY8ekTdil6F63D2xKEHedgZaXC7O/2Dn5OkFb?=
 =?us-ascii?Q?p+NBhsl8bUZAWwym3RgO7MndENcRZOssJ3TR1CKEYDHy3LsGwGtnjw/cUNTs?=
 =?us-ascii?Q?KiAM+zUrTSJJGxZSnji4/v2z1mOXg37xH33PHs17?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9312b51-421d-402f-580f-08dcb0d15b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 19:54:00.5039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMBTIXHzdTVY+/V9NKIAY3Evb9QdYObZ1Kw487AbqDGrOJfEUzK0464gxriM9M13IkswLPIoJw7t9inT2Nn+IC6DTMcjdc4JAQzJnnzFvjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin B=
ernatowicz
Sent: Tuesday, July 30, 2024 9:43 AM
To: igt-dev@lists.freedesktop.org
Cc: Tauro, Riana <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel=
.com>; kamil.konieczny@linux.intel.com; Laguna, Lukasz <lukasz.laguna@intel=
.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm_residency: Skip test if 'gtidl=
e' attribute is missing
>=20
> Add an igt_require check for 'gtidle' attribute to skip residency
> tests on VF devices where this attribute is not present, preventing
> test failure.
>=20
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm_residency.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index 51735d887..dda4d56fe 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -317,7 +317,9 @@ igt_main
> =20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> +
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> +		igt_require(xe_sysfs_gt_has_attr(fd, 0, "gtidle"));
>  	}
> =20
>  	igt_describe("Validate GT C6 on idle");
> --=20
> 2.31.1
>=20
>=20
