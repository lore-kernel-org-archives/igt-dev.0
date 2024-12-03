Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFFE74AFF
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 22:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFB310E276;
	Tue,  3 Dec 2024 22:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSFKX/6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751810E276
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 22:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733264691; x=1764800691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fRoheNc9F4W8tu4UvyWVNfg6WAs7HF47sgQChTytHDc=;
 b=PSFKX/6vw+abzIA7sTeu1CufSnzzvLVQs21nzRB1B3RSSQHZ4M2HicKp
 m0/XG41KuE3A9UnPoEdW/Mw7/6HvX/gNxv6ePHXuItsk3hulvSCfUoYRs
 oz40eMiuO+kMTeskMMMGAwFF7LcyeH8n0Vb/oDa8IXhtt1N7idr0ttyJi
 EgbAjzB9JyoCJsJI0dNXvY8C6SztG78E81RAXarqkN94HQhq8nl6NHwJH
 ILiKg4OdteebukVRlo88xdVsqbL0Vr3lv7BV8AuqP65Rw+LEo9MLvnqI8
 NGncYbrHB/gN8/Emf9uZOYSROHMPgrQ3D0HD9fkU+aZQfGRbUUCD3LiFK w==;
X-CSE-ConnectionGUID: 38eiPrQsQ2Gx3eD2zsexIA==
X-CSE-MsgGUID: UeT5+ph5RBaa6PmryPk2/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44169369"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="44169369"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 14:24:51 -0800
X-CSE-ConnectionGUID: iF9sPIvmThWClx3fqmpoAA==
X-CSE-MsgGUID: wyGUemERQPKGDi47LcFcHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="124514912"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 14:24:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 14:24:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 14:24:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 14:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA4qPRWZ38me0MzjvV80x/3ZiBDVAXUzCUA1sgyC8iVFt6w4poGp5FJ33PMdVCIDSyUO+LhZl0EqiuFeqJ5vA9vgAOe8zoUsZTbUCNJg/zoQ4JN7Da+jgXI1uv6ykigxj2/XBO03zTW17GT968S+xi+S+e8ODa/k4rQ+QTxOwv67vmszlc2ONFrlMQox/fQEAoiJKeuGIl9N4Lr4pc8xF7EEKzEF6hyvTR/uiDxN+H938toIwrcZULMC+IQGH/f3teq/Um58+RuP17CDI8eeUggjzhLrdSq/CzGNRTfzIb0IiogUcZalrCucrjHIaQH8iRTVln8Yj4Atv6MlXQveWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riIzoIOzJKK5n8XFGAHFXrEkHa8Q0Kpye/pY0aUix78=;
 b=FfuNkGJ1AEn7zLCHDMHW5cQemAcgPmuR8ck9RFm/W/DwupserUG0CN+8/4px2mtO93cRqazLC5QCEr/W5xwYOF2LK6+mMS++9/1KAAk+B6LzS6bRW3tAIWnkEnlMYg6sKzCz7Z+/UJgZlrsefK1FYRNJB55BUn8D1CIwNfu7ovKnAyEXzHFQyp0weU4YJo966bE5WgJporkgGlGV/r5GvKlbaOvM0XHeimKzCrpHNIMAHMMDmj7o0TVhea/EYhPylCt8MvTmI68x6Uf1xwCsn/jmamy23lR0YLDgzbYXLAciiG7cNRCG11U9VdNoerOekAnkhGNaPVpfQeRi9opXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7670.namprd11.prod.outlook.com (2603:10b6:a03:4c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 22:24:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 22:24:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
Thread-Topic: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
Thread-Index: AQHbROUxmnefma6qkkiW89smCu+H8rLU2UeAgAAh3KA=
Date: Tue, 3 Dec 2024 22:24:46 +0000
Message-ID: <CH0PR11MB5444070CA9CB4B59F75DF9BCE5362@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
 <20241202180816.47538-2-jonathan.cavitt@intel.com>
 <20241203183115.zrfg723eh2y7oteo@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241203183115.zrfg723eh2y7oteo@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7670:EE_
x-ms-office365-filtering-correlation-id: 3efb844b-41d3-4bf8-2784-08dd13e94b0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/WML9ulhs8JSEuvwGLXCxFhkhRUegTDiAAV2i+66QLGQeOAlvGLOLNzjINAb?=
 =?us-ascii?Q?2vvcUSk09t7P+7vrH3Rp2tKc+4uBVhtfes88CEVziWLGU39ztSkZNDqIr72z?=
 =?us-ascii?Q?1cSUVDCw5SDXe0dIlw3BzAWyt5l71zSPgtdfLZ/sohgM75SIWM7soDJAcnBE?=
 =?us-ascii?Q?T5fYNt8A0a0eM+qInDjHK74moAlskZiAHd0MCFHWmuObdUbp2vMCp55wGWuZ?=
 =?us-ascii?Q?7krbmFnVinhQZLAJ3COg4BbroDP2IlmV9L1ogLFCNRq0MiZsz6cs8QGSH0fP?=
 =?us-ascii?Q?n9p8IclXY7a/eU6ytTOMfml3uRfI+1Z9nvuSjhdOINhKk0GgSyE0COxKOH6W?=
 =?us-ascii?Q?nzGy2kyyWeGBdvtri9qb4dmtkb57X8fiHWvEDSD01Ivn8Zx13AYyRp8MxHmH?=
 =?us-ascii?Q?hEom4EqKyvBVfTirlUD5R1+vbkkBcUbtMZS35yp9efUVvG8zwhf+XbgU2GZa?=
 =?us-ascii?Q?mlChcBIoHXiodZAKmoUQTPunD0VOpYGwF3mLq+gK5Xd8HD6auotj2B2QXoi9?=
 =?us-ascii?Q?adv1ipvpfXtxwl5LWC2HSqL0tEw2PZi5sFt64O7kdWd+B+sGRgSpscxDjgCH?=
 =?us-ascii?Q?ALK3aI8zc+Q5i1THSUMnnEZfkoqv1ucR7KxKIH2Zyi5unTdp9WHkNj3bP+kG?=
 =?us-ascii?Q?Zp9eKQa9bhWofWiCykm7EiMkqxyS5QKCd9mTHs1y70JldFjOVzFEOvg+kloi?=
 =?us-ascii?Q?6wYFivGuOEhw4qvtjpapnfwJ+uwFo8lsJpNkTU/yU6EC9WPxRlq62ouIYCWK?=
 =?us-ascii?Q?k1d5R44d4i5NciOv0F8NygSYFE4BAf48ZdGig7EQp+Ol1DGxMBdY1FsTqM8l?=
 =?us-ascii?Q?8E1IZo7gNnSB7dzjJtFC7/jhEKSO0QOJluJjWgYj+pxwe/8bxDCQKwayk3pK?=
 =?us-ascii?Q?x2TFboZU/mO847No81VczVNedHF9zCWJZwDC6KEIARW8bNEu2MX8LtLtdQ6C?=
 =?us-ascii?Q?kGbBf/4ZWmi+0WN9bZzkvQbdmckOhTTr2x3lE5UxoUEsyiZYFrF7oimEbCHP?=
 =?us-ascii?Q?z5WHUseiwspCoNXXEyahk7AL+BD+vAI6Q2e1kV0wNbjhB35tYwXnQIbe6GfR?=
 =?us-ascii?Q?QPST3MSh9zMSfXLp04nNCwTTZBtAF9vR+C48tR92CJh1kauGEniOxCmhH1Gi?=
 =?us-ascii?Q?wwjyTacto24M5bXRgH5chNSjX3w5YeOuNoQGwLEzJPDKxkX5UqvY0jKMENEv?=
 =?us-ascii?Q?wEXZrW+xjto0dzDhHO91nkXVWCceI40erotljVBgz8kQzQMFa/T2egjEwvTQ?=
 =?us-ascii?Q?gSelLKTWH+/Bf5Pixz4bbdZJs9vBQevveaW4BT9jCvSEuzjN0irYh1WAEJ3P?=
 =?us-ascii?Q?acFAsYGvl4RBm32XM/c7k9hWfIwwLiQWkLa5JEgPNIkJMvl1q3t4f5L90I92?=
 =?us-ascii?Q?eUva6LHphOzg440zndQalpR/f7dqBtmh+vyR1prLipa9I8sK5A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8d0QiWkWqRqJ5Mk/1576fjGlInsoTN/UWkeObNn7VwbtyZsP9eECM86nbuHS?=
 =?us-ascii?Q?Mjgn73E0PSzwpmKgLv91pGJXFd2l+bp3eDy+UsJUj0TSMSzYbsdhtjiHR59r?=
 =?us-ascii?Q?Cb9WlQ91S+sSgwDyUa4K+C1DIoAEbedE0S5wGU7a5KRyPkbKisJA3PUvT4lj?=
 =?us-ascii?Q?3f+KHiEE4RkORjRcEduoobekcoVgyfJUWOPM5G9Oup6j3Lw0S98F0+td3AMT?=
 =?us-ascii?Q?d67VAM6I3kKAaUhYcZSGOjcE4XohV1cFQ6ww8dxLQDOcjGAyZF25DgbvzyKJ?=
 =?us-ascii?Q?6cXwoUY0P35JCGVQ/rsyYCUpOYCEfZrBKOgSRXzh2b8EetRKl7tnuifY5jfI?=
 =?us-ascii?Q?P7hCYRKR2fD8Wy4LlyKft/HPVoo8n3XNHt0/g9V3+bOsHwpSsd1wX7j5dbb0?=
 =?us-ascii?Q?xVGxUSG0vTwd5TG9ATVL90TS2otYn9E3lQAKZcaWsNqup0JhlRnASnCiOclA?=
 =?us-ascii?Q?YMxq9vO0d4EylU3aTf5ouc3ldn2oQABTl7qSEQSZ1ILC54G161DMb4pURbTX?=
 =?us-ascii?Q?QhO65vb9+UqNFGkqZakc/nTDt6Iu71bUBg6KCPanmcMo0fV5pgTadD4pqScy?=
 =?us-ascii?Q?TrT0IqFwtQESalMTy+WI3vhgK0aS1zws7/xoXQTEkdtstQqyoL8o3sK+7o6c?=
 =?us-ascii?Q?XkRFMbPaQblMmBzdrwOgMkggADTtyJnJo2HeP6mElfzWjNMHCMUdH3DpOA5w?=
 =?us-ascii?Q?m4ODJL5SsdCe9x3dKK0VPL30e/9fHg1dfO9G6WmX5JbHuusRflwqluaF+pxe?=
 =?us-ascii?Q?B2zG8U9NI+taH6Vz58JezYU8YI5BOFX8JhGguWvsO1K/AwZ3QznqYd6gvtg8?=
 =?us-ascii?Q?b6KJif5ouldyRYvQ8Sp4vjwh3LaO6fi7qoXqu/QpX2jVII75sY0VM83eH4MW?=
 =?us-ascii?Q?Vi7HZeFOMoXk2uG5qNCi90UjSW+grOYEM1JX2+ieZoQi64RNJnV20/LlFNc6?=
 =?us-ascii?Q?LbOjqvuta+VjNvhoR1n89XNiq5Hg0zNLZTnQG8jPHENPwcwtiPfL+OWvrZO3?=
 =?us-ascii?Q?+V9IOvJ1EdX9UWlC4trFTBOV+8D9I/3Q4Ea6v6fiPUlHX5PWMjm/WlY38LgD?=
 =?us-ascii?Q?mhnXlpyDF+nbna2ipB/RziQexnrYmNTLgea5GTguezKBiKF1SQ6ZEAf5TnQV?=
 =?us-ascii?Q?Bw3d+5lHdxwXS3zwV0KxFVTEBxNSKePzGHuaUmntwwx9YwI+gYUhTdEJsKdH?=
 =?us-ascii?Q?73Whwk5H9e8qGD9XuRyN8gWCFZpnEShlCZ83edj4m3rsZW3Dce9gmf5u+Fj+?=
 =?us-ascii?Q?E/KZyukw5gLjWpRDpqNxGcTx7rPi3FNrU5gUiCbnRHt9BPLuT05JdZ8bf7cp?=
 =?us-ascii?Q?1xPMNcmU5JzfSVLI+R/CU9LSgWTx2Wb8jtn8cfGBtuORfgTUZ5/iWQIU3p/6?=
 =?us-ascii?Q?M7AHM/n1I0KLb/RPIst5yPdxhxBS+i2KWtM94Z5PYvr04VzN9+wpiwWRY/nK?=
 =?us-ascii?Q?JkbCka2BhSPmICZy+waTzeamWP453mbJLp3HsAM2gc8o+7nHqlCL9w2SUeAU?=
 =?us-ascii?Q?1Qdr5O3UnqyJgyO4cJrJBdTuT57LAYJr+gXAOuRnMotYtL3U6Hao9OVGY2yp?=
 =?us-ascii?Q?0iHfP2ys1nyBp+eRSBa4cqQVGsi01J2/nJxaGyY0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efb844b-41d3-4bf8-2784-08dd13e94b0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 22:24:46.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfYj7RXJuITEeE90U7qQQPxXh9VsL5T0CO3dg0EwgndTX+qfdf0uXn4MEF37lky1gi6PWQBcP789E+t4I4PLamVCH8tbmglm+rP4j/E00Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7670
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
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Tuesday, December 3, 2024 10:31 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.co=
m>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@int=
el.com>
Subject: Re: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
>=20
> Hi Jonathan,
> On 2024-12-02 at 18:08:13 +0000, Jonathan Cavitt wrote:
> > Create two new helper functions, igt_sysfs_get_engine_list and
> > igt_sysfs_free_engine_list, that create and destroy lists of open
> > engines, respectively.  The list created by igt_sysfs_get_engine_list
> > can be used to iterate over the set of engines in sysfs/engines and mus=
t
> > be freed by igt_sysfs_free_engine_list after use.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  lib/igt_sysfs.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h |  3 +++
> >  2 files changed, 63 insertions(+)
> >=20
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index 00d5822fd3..efb071bfe9 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -1307,6 +1307,66 @@ static uint16_t xe_get_engine_class(char *name)
> >  	return class;
> >  }
> > =20
> > +/**
> > + * igt_sysfs_get_engine_list:
> > + * @engines: fd of the directory engine
> > + *
> > + * Iterates over sysfs/engines and returns an array of
> > + * opened engines.  The user will be in charge of closing
> > + * the opened engines.
> > + *
> > + * The returned array will always be terminated by a -1.
> > + */
> > +int *igt_sysfs_get_engine_list(int engines)
> > +{
> > +	struct dirent *de;
> > +	DIR *dir;
> > +#define ARRAY_MAX	16
>=20
> Use cont int here, like:
> 	cont int max_engines =3D 16;

I'll do it, but this seems very much like we're intentionally pushing the
definition of what a "magic value" is.

>=20
> > +	int *ret =3D calloc(ARRAY_MAX, sizeof(int));
> > +	int size =3D 0;
> > +
> > +	igt_assert(ret);
> > +
> > +	lseek(engines, 0, SEEK_SET);
> > +
> > +	dir =3D fdopendir(engines);
> > +	if (!dir)
> > +		close(engines);
>=20
> Add 'else' here.

The manual page for readdir states that if the function fails, NULL is retu=
rned and
errno is set.  Passing readdir a NULL pointer is one such failure case, ret=
urning
NULL and causing the while loop to exit immediately before it starts.  In t=
his case,
the returned array will only contain the terminator value -1.  This will es=
sentially
report a size of 0 and cause the test case this is used in to result in fai=
lure.

In short, we don't need a contingency plan for if the directory failed to o=
pen
because readdir already handles the "failed to open" case in a way that can
benefit from.

>=20
> > +
> > +	while ((de =3D readdir(dir))) {
> > +		if (*de->d_name =3D=3D '.')
> > +			continue;
> > +		ret[size] =3D openat(engines, de->d_name, O_RDONLY);
> > +		if (ret[size] < 0) {
> > +			ret[size] =3D 0;
> > +			continue;
> > +		}
> > +		size +=3D 1;
> > +		igt_assert_lt(size, ARRAY_MAX);
>=20
> Move this assert before assignment 'ret[size] =3D ...'

If size =3D=3D ARRAY_MAX after incrementing size, then assigning the termin=
ator
value -1 to position "size" in the array (see below) will overrun the array=
.
I can move the assert to before the assignment, but because we need the
position size+1 to be available for the terminator value after the while lo=
op,
we'd need to assert that size < ARRAY_MAX - 1 at that position to account
for the later incrementation.

I think that implementation of the assert would make the purpose of the
assert less clear, though.  Also, we might hit some false positives doing i=
t
that way; For example, if the engines directory has 20 elements, and only
the first 15 are valid, then we'd technically have enough room to store the
engines and the terminator since we'd not have to store the last 5 invalid
elements.  However, we'd hit the assert anyways because we wouldn't
check those elements beforehand.

The alternative would be to move the assert back to before the assignment
without updating the check value, but then we'd need to check the size
again outside of the loop before we add the terminator value.  Not that
there's anything inherently wrong with that approach, it just seems a bit
inefficient compared to the current implementation.

I'll take the second approach.
-Jonathan Cavitt

>=20
> > +	}
> > +
> > +	ret[size] =3D -1;
>=20
> Add newline here.
>=20
>=20
> > +	return ret;
> > +}
> > +#undef ARRAY_MAX
>=20
> Remove this.
>=20
> Rest looks good.
>=20
> Regards,
> Kamil
>=20
>=20
> > +
> > +/**
> > + * igt_sysfs_free_engine_list:
> > + * @list: list of opened engines
> > + * @size: number of engines in list
> > + *
> > + * Helper for cleaning up after igt_sysfs_get_engine_list.
> > + * Closes all engines in list before freeing the list.
> > + */
> > +void igt_sysfs_free_engine_list(int *list)
> > +{
> > +	int i =3D 0;
> > +
> > +	while (list[i] !=3D -1)
> > +		close(list[i++]);
> > +	free(list);
> > +}
> > +
> >  /**
> >   * igt_sysfs_engines:
> >   * @xe: fd of the device
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> > index 54a4087918..86345f3d1b 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
> > =20
> >  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
> > =20
> > +int *igt_sysfs_get_engine_list(int engines);
> > +void igt_sysfs_free_engine_list(int *list);
> > +
> >  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const ch=
ar **property,
> >  		       void (*test)(int, int, const char **, uint16_t, int));
> > =20
> > --=20
> > 2.43.0
> >=20
>=20
