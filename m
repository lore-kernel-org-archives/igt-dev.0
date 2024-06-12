Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A95C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8B10E029;
	Wed, 12 Jun 2024 11:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwJUdpLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A00910E029
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718191168; x=1749727168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l/9s7guXNhifxjzVfaHXugJ7pfCnl2zFpcZxIvW1Y0M=;
 b=CwJUdpLe+2P8M/3Cu42zz4IcxkgFnXalrmqKvTF5kBqDDKQT+y65l7Fd
 R8eiUpSJIBo1rhIF2ux8m8bfimOi5103KbBMR+zH0grLQ4XfQXWwbraP5
 j3KHSpIw0aIx0uNCEJjniNR6suw80KFv9lwNMtx+9W7Zv7NCG682nWzwR
 K57j6ISLZkygjOg9k03WhLbcyDVomgZZTP8zL9xHGkZVvFov5OMI/gP6V
 CcC8ULuoDIVy+4SrsQE0wzi3ktJ8cSzFShR4Qpwliz/mE79sNz++ozSWA
 kkhZLW9DsVuCBQER+XyVti0sWSd8d9t+FeKfwE899iKfKRCUm4ih4dRII g==;
X-CSE-ConnectionGUID: w5iY2vloSECpIUivBqPOFg==
X-CSE-MsgGUID: 4a7X79WdQC20TjzB2HHJyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15116831"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15116831"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:19:25 -0700
X-CSE-ConnectionGUID: evlX6SFRR2adB6Cwce7++w==
X-CSE-MsgGUID: J1wMvJR+RkSwKRuAHhwiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="77210734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:19:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:19:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ1hZ8FvIrpuTK4DzNK6XAK7nuHhCbawffeiywDTC46rGAdoRyvbSvoOnSJCpQRb52LvZdKiKJRgEO6K85brLaMzUPha0Lcwk5SznEGgIK4/s9zL94gCufAM384b0lZ0gkrOT4PhRGaDzvJi2J899aS6Xvfdhckpn+w+wmaxUVU0t7zAHonnVHGIjofsBCzSBZpTpf083Xy+7FIYet1UcCbwf6CZjjh0OPlHJQui7SAKEg2o1LYToa1zgfLzm0RC6ksbPidYCZtROxD7jCnl+bYiADSELC9n/6SGScnVtqDo0SoVksJF65b2tmV4sMiMrO5iSKt/bDxWMYHiloslaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebw4MwROOL7ZEJbGWwW8M5j/ARPj6oBMK53aY06wg7A=;
 b=ePm3cqMxhvqklAz9byuOQd4QZ+icJsWtviR5+/UtozN2p10fDLlwkHNgk3jJi2ycgHFzGIQ4NMdqkEFPyRbgRUoBRWWR2/25rvSiPE3du8B9KedV3HPDUoJUmpNbdT6MGnXBdWIX7GgeoEM7qS1+LbQPPa+KvPVLdrZaJHN1s6HftYMldXMxBV+pSG3cEikbgd024mnolrtCfHND5DSuPN4nNOHIuC+qTy1UN1aGAFtOy/KOl9Fw2K+bGLjWalzD5+l1oaskKgSPVVODSehlrJiErvC3VpNxldnKBQ6qSGzVVOVNjmUMo/L1U7iFHMcOw0YjA546HCSrOmmEpT3p3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 11:19:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:19:21 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 1/5] lib/igt_kms: Check validity of the selcted
 pipe/output combo
Thread-Topic: [PATCH i-g-t 1/5] lib/igt_kms: Check validity of the selcted
 pipe/output combo
Thread-Index: AQHaiXycOPDsdlFq3UCXrfbza8pu47HEYZIQ
Date: Wed, 12 Jun 2024 11:19:21 +0000
Message-ID: <DM4PR11MB6312298035D182237EC4DB0790C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
 <20240408061221.291523-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB5921:EE_
x-ms-office365-filtering-correlation-id: f02fe561-c2bc-4e18-260b-08dc8ad18241
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?LTyqtzcLSGZsViyBZ4iRxIXKn/V9Rxdz9pKrZQrC8BRsQTn95uBRAov9eOHV?=
 =?us-ascii?Q?Zc8EUSLrSqHskjlUJNa7nfHet89/JrEpUJqYnnEZpF7BhLWDBfoyAWS1TwF7?=
 =?us-ascii?Q?7VQObiIMoEvuAr8F6rKJ2yZskJRn4PiEYG4rXjU6MkfrXoqw7Zl7bc+9ZyU6?=
 =?us-ascii?Q?28emLRP8PeOPeb/9VquT58g7MWw0FdwTp8ej7Vr9+aVegWpkAA/O3MNgy7fD?=
 =?us-ascii?Q?pB4oyGstOpOVMein/gQtrS9yGMigjum+1RUk6siQz5RSFnO1hJhcXdyViYLV?=
 =?us-ascii?Q?gqWbpcxNYyM8XCsOiFGvKIYUbIUGb0qldODyqG7t/oTPRq1BVrIoKCe1U9sb?=
 =?us-ascii?Q?wQsC0UyKflpvLC00D4t0Y0vmGrtqGxf91tyiySL52VJGzS+Tq/LBOuhpmkRd?=
 =?us-ascii?Q?OIlWZ0ToCinaiaQ7DKVcmelStduooLPUjOnfr9a5dNAxegw9egeOVSZYdYLE?=
 =?us-ascii?Q?QMpVNEefgo4tYSWPFwT/ETedrAcxJLWiOg/V0DMWC9DPmwE1hT//InxzNK2U?=
 =?us-ascii?Q?WBin96EBEO9Yn5/NxImaCE0o4+xgzkC+1U5We5lv6tRWGeWkDZ7Jt1MpUAYq?=
 =?us-ascii?Q?DDVY9XHq4O+GB3mDNIH2fogybX3MvBKzH8Iar5NEQikzjh33+mLchwZgl5nd?=
 =?us-ascii?Q?c2AiCyTHi4sk3mFBRo7NGAAzSOe/34zd1dVgqZWG+cex4py4Wzvt19++A0Tq?=
 =?us-ascii?Q?0WYikEtBp1ZF3wGPZzvouLT9Q3I5ZA2CGh+1OchcHY5JkMR6lz1gM3KutNck?=
 =?us-ascii?Q?pNnLEv7AV3jcwlYww6BtCZuzAq7P74fbOlQuawsxwQ7LQNDY+em8DKt8Wa8S?=
 =?us-ascii?Q?JpZirQGbZ/7eqSDhLB0anriv+3P+Wlm/s0daK2bG+lHsfJNcjldNjy3JUgtG?=
 =?us-ascii?Q?Yo0d0IwtRR+w7Bt9+2GBqbXjg3IpCkt2uVuOeZ61DPpvedMJRhkdUrtc0/lp?=
 =?us-ascii?Q?P5EgDGPUEYL3qpvzBoafk3irZEzt0O3s3yo3WqoeqViw12qHi47cOyeISveY?=
 =?us-ascii?Q?Kewmr0rG0KjCqs178fY1BsecTnzI1y3WcZo3heJF065TrTkbUvzpuwB8S/pO?=
 =?us-ascii?Q?lLvt2zozbKwJtEwb9A8Qy7kcEiI30636x6RmsNEmBcvSyDRp2Qdg4YKhQanP?=
 =?us-ascii?Q?T5z4hr5E/k0Uop+KCmyXSaZfZIN+1esb2h2J+3Dg/fvsiiFv4YJSY6FjoPKl?=
 =?us-ascii?Q?Z7iHNqTWjuasyQ9Jw4jBMKLDBzjo9I8xlN835PdhIwheNh+jqodDanq1lv0E?=
 =?us-ascii?Q?8vnhefCv+rI4Aq0zVyVpQVgIiYQ+xB6Q5rSinM7saMTDQt3JFzYy8gkbV18p?=
 =?us-ascii?Q?FYz5eOLNGG3bcjDaDnAyG0m3E9t9YEzqghb0spL3umBgb1R89F0AaCTLCtKw?=
 =?us-ascii?Q?uumcJhA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?je8V2bEXvNDAAyLQmjjMZ2E2EByTDfuWJiF+tHmlYb2nMBDk4xJipqxt2Wi8?=
 =?us-ascii?Q?SbqJjKMWpX1SHWvzkx/oubUPJ1+MnBb7eopiiaKufbKioG9lJZKHAeMneEjB?=
 =?us-ascii?Q?FbVvUB8mhy2CnOXquXVMQtcA5ngLwREefCtsbv9u49JgOKMKuyGeGvoeC2Su?=
 =?us-ascii?Q?y3ZHtAP7iMSVqGN6WS/k9dbFnKPdzj1Bb6vkkyVNZrpHi9SFPFYRweu+Cjag?=
 =?us-ascii?Q?Rv/y/b2Bijs3cjrUR2N+FvBqky6G02gaYBU/4t19qH/m702Cd0uekfyeVG6V?=
 =?us-ascii?Q?xKpAZIvpTTeIGxBThIYMgOzQv+10Fb6QgBgtQuRYi3lnurnCfv6HzzuV6tSk?=
 =?us-ascii?Q?SJk24QQ8/wnvqpwyyKY7D2Rc1maF3ORJ6VO1GRxF1v4wu9mkDkn7LDfzkUBI?=
 =?us-ascii?Q?XDBznREdOIHYkdXkPJjWlMB5HQUPfeTIuOui7Ejvm8KwyqF/0fll9N9vkkce?=
 =?us-ascii?Q?2sjld5Rfcz83KYS+rEvKi14XDQBXc0OUOekIVdtro+r2GixMYNfa5aqKE9W3?=
 =?us-ascii?Q?423C/o4kRr000wY3h4k2MepEL4fS2vGGPw7EC/nhbKJTcP8uZqnTgMjOoVdP?=
 =?us-ascii?Q?x6I6rhizhBdTevjxpbFrJeIzlzW2HwPu5XeA3y9leuSjltVWZJdqfEsJWhOB?=
 =?us-ascii?Q?dCBaYooi3A15XAqGak3zpW7kwKizobSSUXX8naeJAtBShped8LDfguuSBj//?=
 =?us-ascii?Q?FRh2lMMaVMl+o/21J5wMpgNcezVmkHQn3vi9EVmZbAYN9ct0Pdw4bLTWIxAH?=
 =?us-ascii?Q?8RMeHmpuKj3lOc6GsHC5+JDfPmzuHVFBExbTsxZm0HmTVPKjPAbAvs53GfER?=
 =?us-ascii?Q?SrRhgX4bw4AgOVhL3rfkkIJdw4Vea4ZO+j16DzUO40FYaW5lLurJyybGhXqw?=
 =?us-ascii?Q?ews74v2ygOo5a5nZEjlGEzy1SJ8pPARNSK/Mkon9/F4Mn2inADGIDd6uKsys?=
 =?us-ascii?Q?zfIbzqP6bG/KQ9FbhjTM23+/0MyZ0tRo2Tayd7Tx8mIgaGekSS0mmrrHzOoE?=
 =?us-ascii?Q?Vjekri7slXZXY9A1MQuglCHS6gcCD2BqqkjyZrkztsyyjLT2gXUdN0ugx5xF?=
 =?us-ascii?Q?FfAq6q4PjkNtdaCCQD6FsMYGyrCGr3ahNPRTAwBEYcHhOSOlRhhnJbRyOPj/?=
 =?us-ascii?Q?aHJkDFcEufIIf+TSyzIU5p/JzGlQJWFZ2IC4KT3RGY60YdNDj4+UMIVS3ZwG?=
 =?us-ascii?Q?7zQ+6LB3Sf6WEL+JDI3ne6EEokdO3CnXJRg1IMw2DAAsDCWwbwu1SmjF1d1r?=
 =?us-ascii?Q?icJ6G9RPGYksiY8cT8AXJB1hJrhC01A7xbwdoFvP2JgpU1M/fn4VcJwo+FW2?=
 =?us-ascii?Q?qEqZnCb4Dvn5UhwWHEQ51V31O9fV3WxIHSpcgQwW0cRuyQi6BYPF4nzhmIeA?=
 =?us-ascii?Q?FeftxhFEJye5IKcAjx4vdHcMF8lmBexKJxCO4Wnckc9TUgUt2dDGP3efJU1j?=
 =?us-ascii?Q?Hu84Oq3+Lp+nPA1610SCgSVLOzNFFSxqMMbacYcJeLexU1aXpyfkQbqGruF/?=
 =?us-ascii?Q?9F4mdC/7TKgKibJnrlzJoBtmV3dwxsxgmc75vBS16wvDTJ9nqgIF7b7nDb/C?=
 =?us-ascii?Q?mS/OOsrbMzgCAUExk7E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02fe561-c2bc-4e18-260b-08dc8ad18241
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:19:21.7430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97JHAXGp/kGJDKqprP9Bx0XJny2GciL3DOrQ7IPnTcxzecd4kZXpIjXgYdNcESIVZWiafWs7fbHYbnLweCr6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 8, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 1/5] lib/igt_kms: Check validity of the selcted
> pipe/output combo
>=20
> Add a check to identify the selcted pipe/output combination is valid or n=
ot.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2a518eb8d..8eb3b877c
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6347,18 +6347,21 @@ bool
> intel_pipe_output_combo_valid(igt_display_t *display)
>  	int combo =3D 0;
>  	igt_output_t *output;
>=20
> -	if (!is_intel_device(display->drm_fd))
> -		return true;
> -
>  	for_each_connected_output(display, output) {
>  		if (output->pending_pipe =3D=3D PIPE_NONE)
>  			continue;
>=20
> +		if (!igt_pipe_connector_valid(output->pending_pipe, output))
> +			return false;
> +
>  		combo++;
>  	}
>=20
>  	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
>=20
> +	if (!is_intel_device(display->drm_fd))
> +		return true;
> +
>  	/*
>  	 * Check the given pipe/output combo is valid for Bigjoiner.
>  	 *
> --
> 2.43.2

