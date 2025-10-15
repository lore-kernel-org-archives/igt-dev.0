Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A04DCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 08:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D1510E283;
	Wed, 15 Oct 2025 08:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZtLTy2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6510E283
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760516648; x=1792052648;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4yi37IH3si6PFY6xikIjemjgMHzUjIvXrmPUbVfE8PY=;
 b=EZtLTy2R4Yf5/6jjMtMDNU695brk1EWgQLDbBZeeIZ0hlwd8MiguA5oB
 Qyd8R7FZkJK0ThDvmhcl/Cgk0j8fNJz9KKzbDnqP9i3zCv9n5JKEjhhtD
 lRVoetGs505hOMgX4yAcPf0vah1ukxd3VDNZ34hqwx9wODy4ccijeCP/m
 tfGFNyasAAVfBHNpk/oGBeXSprU6Bb1GiSm+f8uDBtO8lLa+CHB7F6YZ6
 JJ9Xp6Hv6yl0/czHXA6XCCCZmcewfMXEquGDdZxyuFEP7OGpGJHxXujrj
 m0UlgRpDniYG9i0Tuw5vuRsybjcgeRuEYEbZD0YwpsirnRgQllmtiQJOF Q==;
X-CSE-ConnectionGUID: oyt4HNghS/Gp2+NViMW1bg==
X-CSE-MsgGUID: VxdDU842Qi6+txfUFTtEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88152799"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="88152799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:24:07 -0700
X-CSE-ConnectionGUID: BXCJFDZDR3ykYxfN/TPoTQ==
X-CSE-MsgGUID: MuY5ILInT8+riC8yhdsl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="181903165"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:24:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 01:24:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 01:24:07 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 01:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgOMg36WpEgtAhRyhrZm+xjYsfcFCpp0StlvPbn4EJluvq3ftVW3218kElwXb+D6TF27XoCKPnvdS1ddcbxv9KYoTWsoOT9zVtNcWKU0LCCes/VBK6IrUxOqE0dQNcyfitWTvdcAvb4CpxZEag+Mrnd/PYtLa/WiCVKqMMRku6ycuwGtoFyTenOWz9PLWTTb3X6Gff37DHJ0gLIj9S2Ge4Rpk02pVZvkw2stN5oOj09sLVTnm0tZwrUlAupCwD3BRM6nbHSAORcN5xziATOMlyi+BOXs0GKLFa4TM2YxF3kRh0EnHzDYsFDhUS+tzInBgH07ftmsPJDuZFjBUke8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTMxDMs7n4cYyJdDB6WxOCA3tjX7ZA6Vc4E6YE4i3Co=;
 b=j0KiLjtbIq975X6yfmpIriDb+mtd2DA/FHGrZMkKvjzgMi/ZRgH8CBbqfc9OBGFu2ER6mzM/T1ZAaTLCykF2PbI81ua6JnikJ64UxmGmkrmPkctFwEflwzPjLtKGjBXob7TFhNp+Bx3pX7tTaCR9DXn+e6mqALdkHWMWRkiCvezW/EVryDkn0wb2EtmNDGmsE1SPG60RDBxHwws+Fn03ZKgsZRXyGdi4RDVkafoO31+JocDX69eFnT4EOWgE50KK2zO2ZILC1tdXTgcw01BYn10jKoEjdI5H4/E3KarW5bsjmqIh4PeGHMmscU/2Xa8abhpuBX929+K+IW5465Xp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Wed, 15 Oct 2025 08:24:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 08:24:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4 1/2] tests/kms_vrr: Dynamically verify LOBF
 across vrefresh steps
Thread-Topic: [PATCH i-g-t v4 1/2] tests/kms_vrr: Dynamically verify LOBF
 across vrefresh steps
Thread-Index: AQHcPaZJHuMoLlPX3UOTFf52RFvtg7TC3qFg
Date: Wed, 15 Oct 2025 08:24:03 +0000
Message-ID: <DM4PR11MB63120B842A8F4B1EB1CCDEFF90E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
 <20251015073508.448186-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20251015073508.448186-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW3PR11MB4522:EE_
x-ms-office365-filtering-correlation-id: 967020bd-387f-4776-83b7-08de0bc43366
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yc/QWzeyMJVaK20oJt3inZZoG+1095aHqdmPpMIlTm0w7PJUd1wQu1VRwWhi?=
 =?us-ascii?Q?XudsJR7ypJAomOCHHDOSdErvlf5KfB60JQFTwSmpTYPNuw8IHJysE/angYn7?=
 =?us-ascii?Q?YU3gAQjHGgzKGUMucUP7+v/MKBD6Gl/L4BMV5uDr5sA3XfHtM0Z7G3Yn71VY?=
 =?us-ascii?Q?yDrLD2ie2aw6a3Sily2K4FJG0HYsHv1pyrNaonlcjmb90mkm9wNGKX/OEdRA?=
 =?us-ascii?Q?uHscZDQiSUaRcl4wIStPsw+OO4l950SUgcIrLCUU2J8MHDC/q9lEBNIJqf36?=
 =?us-ascii?Q?XEAKNiUtCVqP/Uxz+Mj0LCdN5OTfrZ32dV9cck4lLjMCO7fb25MWX8Ljnvfb?=
 =?us-ascii?Q?IkaAiZHyfFhm55Ffur5e7jk/zS0Bj+1+2T2OQ6kEkfytrUlvm5Sv0cI61mSP?=
 =?us-ascii?Q?sZmh2jRreKEjkAlImjxXvCKpllIllwmyg+QKRvwIRZ3FFRxvQkaeL+QNS8Ae?=
 =?us-ascii?Q?ln19L3SO+GoD1fACtcRkvdD3hJOeIacV7zLqM0E75+aiz3Hr4cSuNxixu3hY?=
 =?us-ascii?Q?rczSxcqyyQN0ZMh2tZ+fhZDLIR0tbwnX5PnxoFIPkvTtXbI9tkDiy4Ctcucm?=
 =?us-ascii?Q?HrPsf4qQTRuNFFReud1+b0YJFMmsrptbhh46x0pKtvAATlmDbJY+CxN7kfbm?=
 =?us-ascii?Q?LWf0Mdq22Y+uTHYdC/ke0XVFapUiwG5cKzVkozWPxsRtor7VBgq39X4//p4Q?=
 =?us-ascii?Q?/axjVLo0D/JE+c3ICRDEbLBQ/wENrqHTNsMRdlguvrkJAEy6cJ+Yu+E+J5w5?=
 =?us-ascii?Q?B9vYBG+zFLKxam/54pKqHu1NZcJPcvHgbzUjUb9vn7TXVsfETxYkM/VlXtgW?=
 =?us-ascii?Q?Ax8AlxPNolaT8NhSrn+lQEP6t4KPb7NdupEkyrBOjQbc7xRBzchq/qraakpN?=
 =?us-ascii?Q?lK0/dBw+g1WnMbVZYIidpDYvDjU0fxjx50mZOXNVcviR101mymklobfq5TE9?=
 =?us-ascii?Q?3prO4fa3cYnPim+OnTfq6eTKVy/rIjYnjarTjC3ay1Fy5szL4Wdj0lWlN052?=
 =?us-ascii?Q?7I17m2uRi0kqSWas/7PDABgzPJbhy7glRf7sFjqkZzuQkPzRFWu3uy8sTahK?=
 =?us-ascii?Q?ts9o4lrIqPLBLLmxaAlW+a9i/lkjCFmpJRZDWwYVEnZYwSCoui19knC/c0H4?=
 =?us-ascii?Q?a+lR7nv7+xP1Xmh6jbl6W+M897cCzDxE2FtI4g1hNAnvfPto1OaA1H4jt0RO?=
 =?us-ascii?Q?cY03XxwOgH817CFykzEOj9fi6wvi7sN+ZiO2eVOYCAWUQ6livQNEAZsfs1Ou?=
 =?us-ascii?Q?oUGWOauqIui5XvN+vxFNNR3PvX2SNiP1KXG6FeOrH/zRqf4mK1j53NB6uSTo?=
 =?us-ascii?Q?0syR2dj8W5rjEAqSnOXbtzuyHYD3AJSR5ggQEa8NMwr2r0kYVbtGnN4lhtil?=
 =?us-ascii?Q?FbDkh4ldlDqWUE43qaPmN4wPmymtAAHUEbxFlbHGgVYORhwmIInFIv1dcAS9?=
 =?us-ascii?Q?kDUFDguGYNWqNZrc/nX9MoIvdCuvB+w1hpVhaR1hWmus6l9Xzyh94n9XSzTu?=
 =?us-ascii?Q?/2OIJqhg2F8791VTtm3lHjcvvOW4r1+MAuoX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fH13AYwFHQqpw7cdk9hyAZywE1FJ4Lg7gKEAqrO3uNN/xRmjhE75+RpBITWX?=
 =?us-ascii?Q?7HlAb4DoQQJNnR4s/gWSdfPCGKpxDUekUnJRvU/UEoLR9+LQAflu9dRdZG2X?=
 =?us-ascii?Q?LxuEi0joEhGK840xMAxsjr1wLR6HqSmrHoCjPfuGYHne5g6FbuH2RKHe23D2?=
 =?us-ascii?Q?AUoVB+YLTQnmIh4Iv+VEOrOvf/k0FcKV35gyrKIa2QGaSLa2f4fErd3czBGL?=
 =?us-ascii?Q?B17dR7mqP9mHKPJ31JHQJee2+Xm5CtobMpb4sZqQEid84XyTwa8mRlmfnc1D?=
 =?us-ascii?Q?kjX46GncqD6vBiM+cLLEOrUx+W20DdrVuecUxd9eTmcoDC+kpj9Kl3QnBonn?=
 =?us-ascii?Q?PaOFjRxXEWg3xxl1B5IKzji/D0i9kBgU6LoxH7atmO0xa7cJG1NKjkjFMX4P?=
 =?us-ascii?Q?Nl8FDUEZJ7Q+hbjgQTA+oMovyPawfnDgILy5ZsATRbhMLJrn9UjtiucV8N/V?=
 =?us-ascii?Q?+cajVP7bV1eVVIPaVa9R+1o62+VgkuvlPJmOJ8VX6cD9Z1n4ZffMUzixQ+5b?=
 =?us-ascii?Q?PEbE3EW+jcFP1B0yEEVCY+zDlLAqAYrAF2MRK5IZbInFDZrY1e/HX852MU9s?=
 =?us-ascii?Q?sz5dCB5r3a3xlBdtEHeBkXbYvFOu2rZUfaInbSIIMIzbcgUTJNbgE4yG/Qud?=
 =?us-ascii?Q?gbkuAxXgEEvCEeXXI3y90/CSSh03CRzZsNfIF5vpbJkdc9ZUUoY/hRC2plGR?=
 =?us-ascii?Q?oT3UiXnsQXsNO2IgcGQ5OrCVFU5loNAevtNYnXd26dByiHjHNG8+XucwigfW?=
 =?us-ascii?Q?hNKxFVvA9WH0JtiDuVEdVcFyewT2ROiUVm7Y6MmhXPb2BlBfNqmOmLaOMCfq?=
 =?us-ascii?Q?dLgWCw8teK7bU4H+q8+SLFLGgmxmFsp4vvUOpIcWWkFKqExEMgS3YrRdWavj?=
 =?us-ascii?Q?SSCvp9eElu/V0kPNVijGJD8Kofw2tIkwiVUgBcchHvsTTDQB+nlhZet9GaVP?=
 =?us-ascii?Q?c+2Jig8CxVgJIpxgkvm1rVOGAikhhvVbYMAoVDDg4O5EZPgq5JHeYWWgL1lE?=
 =?us-ascii?Q?kHW6d9EJ/Obwz1xMFiGKJ+mby6goeigZUlV8VK27etWaIFBJA36lHj9mtP+Z?=
 =?us-ascii?Q?fZ/Paj6N85HgQDIMjaatNhhkpnCEkruCgYLghgCO5l/olJZAzrqLlnTRnS0p?=
 =?us-ascii?Q?IYT96zORXnCsbRCRg5q1W7CL3fGvtK89g9b0BZ2cn1edVH7+e4kK12ldaXtH?=
 =?us-ascii?Q?NPCdrGjk0JqmU0nu7/4oCAox+Sgi9xcLqNgh75nHR9yLSBoCZMHHzSK/oxO2?=
 =?us-ascii?Q?LUVJdH+VBw6eP0ISFULctOW0AlBD8m2Jj3jzc3u05WPK6e9XhzdUN2DFaaUC?=
 =?us-ascii?Q?7F/VvEOdDCXnB58r+j58BDbqpxfgYFIg/fAfjNiyZLiNVqyIU0k84KoOfKzh?=
 =?us-ascii?Q?C+nnB1mChLjy+NMhuY6foNxG/w8gTO9asBUK6Or3pCoAnpXhyhqvmrrBrddf?=
 =?us-ascii?Q?dlMsF7BYLMO19qdQ+sm/6gCrl9K7mqeXt23GnNw/Y9SXPPAPkTcdMGXVJCnL?=
 =?us-ascii?Q?fdJfxaPw+mZji2TKGFZvekqKuJGDrPNebR+ubiGsPziBpdSy3cfoAAK1KwLf?=
 =?us-ascii?Q?oH4FKtw1AjyG1M5sGrQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967020bd-387f-4776-83b7-08de0bc43366
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 08:24:03.6574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ZEfKIKPZmuntKJzH6+ohCuM5t8ggOmRDU0OMx/rmcTmpLeQUYP3M/hHhIslBydmtl9nJ739qMZ3QYPUTNmqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Wednesday, October 15, 2025 1:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v4 1/2] tests/kms_vrr: Dynamically verify LOBF acro=
ss
> vrefresh steps
>=20
> Replace the static LOBF check with iterative vrefresh stepping to detect =
LOBF
> enablement.
>=20
> v2: Fix corner case highlighted in review comments.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 704620a7d..580527c59
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -870,6 +870,8 @@ static void
>  test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t f=
lags)
> {
>  	uint64_t rate[] =3D {0};
> +	uint32_t step_size, vrefresh;
> +	bool lobf_enabled =3D false;
>=20
>  	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, pipe);
> @@ -879,11 +881,24 @@ test_lobf(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>=20
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> -	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name),
> -		     "LOBF not enabled\n");
> +
> +	step_size =3D (data->range.max - data->range.min) / 5;
> +
> +	for (vrefresh =3D data->range.max - step_size;
> +	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> +		flip_and_measure(data, output, pipe, rate, 1,
> NSECS_PER_SEC);
> +
> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name)) {
> +			lobf_enabled =3D true;
> +			break;
> +		}
> +
> +		if (vrefresh =3D=3D data->range.min)
> +			break;
> +	}
> +
> +	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>  }
>=20
>  static void
> --
> 2.43.0

