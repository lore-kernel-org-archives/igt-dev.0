Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED74CF34A2
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 12:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A352E10E236;
	Thu,  3 Oct 2024 12:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vj5lAXp/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659EF10E236
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727958569; x=1759494569;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GUQfEvy1Z5nbAleTsKrINlPuAnFcgTUKHCzfeKsdSbE=;
 b=Vj5lAXp/1h2SujccTzK4nECkzV3f27l4hH+6rjzgVvvC7s18ktu3oHqF
 1S5N5t3JIs0W5goiB2TcAslLU4OukAJ15NlZchZUDtbZKDzRPKac7cct2
 1jzulTEHWHrFd9LEorlDmHyvbf/r9oNHsnXVmO9tAeT9nQQwZLjnlUS3+
 dkg9iLVRGAm2ZjbV4kK0LFQXdUmLdz1S3awNvkClY9hLg+agywNhgIqLO
 WtKgH4Gdm7nlZcioHOEpc755eTXO07wqQzQk9ILBu05zu11uEpUmsJ/qM
 A4H6WkoP0WZgWX2b/3NMrZFB227LERgBZrhRsP4Pgr7hBMsk9xYHMsi26 A==;
X-CSE-ConnectionGUID: AZkvqGnAQ8isxhbfTiBNgw==
X-CSE-MsgGUID: CshD2Y9sTH+ZuQc3nabFiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44675658"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="44675658"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:29:29 -0700
X-CSE-ConnectionGUID: u13Q5bZlT227U50MMMmQmw==
X-CSE-MsgGUID: E1pQ93xnRX2/86aM1vrARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="105103000"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 05:29:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 05:29:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 05:29:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 05:29:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 05:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRTiBnKM9Xp9oJUU1KkKAX6JB9nmIYBgQadrSWwwl8rvvnlLeiMP7in7Kh+F9XhszEq9jKCoTFhnTFuHMeYwkZXC56b96gT35dO/YRc6ME9o199/MI+8ZHfF7CiLmOLfChDpGjDguREy/6tNozx/0tfL8s5XiN7DqRs4nnWnPYeKG6neGZLBL0/XP9m1XtELjKcy6e2pLofoMMOATMsMF3DRxzPD8XSL8obr7g3NXhIEqoi2MHxz8eQAJSNz3PkVP1vq0CPO4k+m4iKHFuc3wv1Ty6BOHuEXJ1slT3vgM4IWW0+gGHJ9moR+orC84utJHNIskOKkGV9i5dWnIL1TtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulkskLwggGAUhX1/U9noobn209FsKCjz4NiWWlsUERE=;
 b=eCGTzLmjWsT2RFQ9MeXb7xcMJ9MoIC/rE3CNsBk5X+tby60LUc1JGls3qfKfhZu4yB00ykvuTZUEhyg/DbxnQ8232NAyUaJ0EEjyRMmY06LiXdmiDYrc6UzliiamNugMcLt9rmdMZ6lwl0bXfyU+UqCx5gXKM6pFe2HY9FFqAFfbEzhCAWk0gIDeVACCTjz+bMvxdaSS2uqogqh2XOZoDBIuqHLIXbjExtDtovftq6dO5PopShoilRsTkofDUqcNNWdthLINluT7WCFYcn7H+J6LPovpV4cchsnVfA+M8ziqeNuSc5SR8SKZXxfWNYeTKOv/SAmEaC+A3BQcrLZp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Thu, 3 Oct 2024 12:29:25 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 12:29:25 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_lpsp: Add display version check
 on external panel
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_lpsp: Add display version check
 on external panel
Thread-Index: AQHbE2Vnwa6oue/JsUSDXyg6Q+c/O7J0+OXQ
Date: Thu, 3 Oct 2024 12:29:25 +0000
Message-ID: <DM4PR11MB631244045F5D4F4BD10913EF90712@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240930181839.49977-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240930181839.49977-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB4929:EE_
x-ms-office365-filtering-correlation-id: 550e2819-7726-40fa-2816-08dce3a7048f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DO33aTs5lrxTOJXWra6zbvL8zEqFGe4HD6VKfy8BhJZmIVNtsg9Psg2N67WX?=
 =?us-ascii?Q?+6EfmQ7EkXjx9Q1yrJ/EvEWSYXQ9zVVT5gx/NbO6gKrNDYAJ3sVP9QIAJONc?=
 =?us-ascii?Q?rBhFKcPJXSQpY23Ov4KCdogLjKwuGtEkRjxiCAR7qylwW+J/eQNChzLtvFTB?=
 =?us-ascii?Q?yo9iFkgOXt/QMRZXg4tOmXnubH3KeGa6Noulcj6Vipt0P3oPQPrrIeA6Y1jk?=
 =?us-ascii?Q?bBJSCUuFvAb1wmtgh7PvXJQPwgIi8j4Y74yR8diltnas66y/czGndCRjMJ0v?=
 =?us-ascii?Q?zbm9wvCXS6srzoeAB2Qf/ApUtMTUqxhSET6kDeByASHLxj6Un8HkbiKjnxfR?=
 =?us-ascii?Q?8WlpMZmo3e60434V4ZunlJzAagxDfCHBOMpnHY6ZcgafvJoDf8XuOIl+uuYu?=
 =?us-ascii?Q?O1h1IoU3fh5qQtViKQ/Bd8xkhw9EJeH13UCsa+vY0qbH0M8REl4C4HpQ/CIu?=
 =?us-ascii?Q?9CIGpQprea//6q+zM5k6w7KVufAUPEaaIQihy58IqtwL4s004RYUbsAnu8YQ?=
 =?us-ascii?Q?nGRu4WVjrpYSMdTks6h2CftKrG4MucN4/fYMYACpdwH4IQbfB1LFsd125089?=
 =?us-ascii?Q?S0TRrM5ynBu7YeUxG8cX1KiPc3LLeB4RwGY31BibzQgXV8OsMpdcp3QVGjTL?=
 =?us-ascii?Q?ERIAO8hFJoeHE97M5yceAEeUnvwdPdEREzFGCawcesrZAbenrE16BvZt5Puy?=
 =?us-ascii?Q?LxeGaURJOQsLspZvA/IXhtJtuudFPeUYsQpbzofLBjq8rzA/kmb24n1KWgY6?=
 =?us-ascii?Q?ZH2/l8KKfRXEVxaUeOUnXNk8qVajtgzAJTpRpbPb88w+xHYX17oGDNtp0Z/M?=
 =?us-ascii?Q?vzQ8Lg3+KfRNAbjDOTd/wUPmqVRXcgdL3hxJVRCe54NFyiY0T0LLVfcHU4z6?=
 =?us-ascii?Q?AlnQEMOl4/b0CD950N7b4iiQME0J4F4RFFMUby56qbs1gSuMGw8B1FSR3Q5o?=
 =?us-ascii?Q?uSE5O002NJLwALaUPkUfb/0vBc2F+Z+csRJmr3kQ+8UHjhelxS3RZnV+wTYj?=
 =?us-ascii?Q?SKISzCPfKHB8RdMXNf0NZkgMgJGYRf5K5rZaAHmk48KuwOzNxxulB4WNrHn5?=
 =?us-ascii?Q?0TDthMZHo+MkVKz5xipBtBHpxnd4y4x4qPfIiiCOSn9Pwxslch2o7kvvNGtQ?=
 =?us-ascii?Q?YTMOE/4OhDjC0xyfzP/dYIl+M9Rd69+KQwczFAaMrfU3RzADsHmzNLMb59PN?=
 =?us-ascii?Q?C1X1ukpOW65iRlRFzJ1uTqvehmlLkcctYIk05VpCcUD2pxXfHZBPXbM5vlxG?=
 =?us-ascii?Q?+vmjO+lCpN/g2omzo9xvMDxMEfblu4eBKvo6+TkGF5WSpwiXruF65FiHphVN?=
 =?us-ascii?Q?5d9e0tQuf7GHm0ttdHG02NaW6yYBsjBJ3amOr9hiUb5+3Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zFtKlmzjuIwO0oTgLzKEMPTdh/tA6ZgMU5Vf1a87OHdD3hbir9YNOsuyptus?=
 =?us-ascii?Q?nbNcaO3+NEkgp3JYq6Jn8owP8fTAwFeGqU+PZpCLTF1GvkSzXWaGFT9OuKuU?=
 =?us-ascii?Q?+xgtMl2txHGagpoZZSh1B45yekVdwBIQrN43/9uju3EmQEtp4heKc8PHZhb3?=
 =?us-ascii?Q?5CR0wBMrtW+hqmK4XsS9ZFZuKQVw+B06nqlNHLGA1wTGJbE9qarYwMBqoJnu?=
 =?us-ascii?Q?mWm+YCMSrE9WMF0TVWRdfBKuwptDjrg3QMsRt5OSnBOFSKebArFmnIBPPBqC?=
 =?us-ascii?Q?PS/ekl/K3v8hMUPfBrWiuNXTwzRHtI3iC3mmHZWwxLS9FKQ6GGqEDQL4FxcB?=
 =?us-ascii?Q?Bx3OLL2UjdEVmsCL/zZ7m92vHZCbWd+T7UWxZxtRq2irDc3Owju6nFEEeuhX?=
 =?us-ascii?Q?oz9SV1O94XeehN6G/kljzBdDB0KERBtXKii8LI47XssJ4UyPfL5KjekojWvZ?=
 =?us-ascii?Q?YioyivANnhH2ql3s6e0Lc1iKtUje/ZF5IZ93AxBX/8ZX5bTii5UhcS+oxsvB?=
 =?us-ascii?Q?/z/4O/VonSzALlpsFkc4z/y8Ru3C1LD/t6TNil0B4tRmu7NkSrudZNEXhqcA?=
 =?us-ascii?Q?vyftEt5z6EQUBjUExcIsi8u603oW/IHzMlDx5nEMma4Aiv3sFeayBf6T2Eco?=
 =?us-ascii?Q?SvIRzvwmeRuBFGAlehFy7xmlczUNVL4L0/f7uXlQejXA3R0LwCD6oxlxBcAq?=
 =?us-ascii?Q?voWfZKFWoQmqqDzn8uIdDjR4KkXxTZ57A+F80k1wSZFNAnLpUrf0HLGz8/mD?=
 =?us-ascii?Q?DjKeb77kaOO1eRvlK68VxRP1dLV+hKFS0ZnZwH4AJ8F85VPS0jarWlcxzvgA?=
 =?us-ascii?Q?Nwg3Lq1z2noho9cgqnKEQe04WadkpUXRx4wxcpsaP5ZB+6a67LU9qf8wB+gk?=
 =?us-ascii?Q?DBeLMGG08QhCCX6RjYkhpajbwr3xAunHM+jHuV0BqEmUyPcghAnPMFiXGaYw?=
 =?us-ascii?Q?BDAmRBGeGyykk4NaenZNEKrsmiwHzp7Md+QNscNYKLgyoMpzE2IyOTdKm9kH?=
 =?us-ascii?Q?cc0SrRtLqBHvPhPFjXh0qkZ+gMrqNM8n7Ir/4QmvTqa3BA2HTp3sKS0H31kZ?=
 =?us-ascii?Q?yE2FGBm/StxLxcj5qMeijdVIWsbhRlwkX/y3Us4399XIB8rXX9VEix5uUfYf?=
 =?us-ascii?Q?OegH8xI6o7yGSNscJwoSfgdu3g2voG3+gM8SKzhCYPKouC6yOzOlFqd9Ww86?=
 =?us-ascii?Q?ih+6ZMHgh7l1TMKG8E3HUDnrL7igsmtpAxfmZNfWkf0S/X3lhR5yNfr0oiS5?=
 =?us-ascii?Q?Oh0QTv2v0yvMsGP7ndMLmyTA3S985nys/KpPx+dAUQP2twg0ORWMLAwYawq4?=
 =?us-ascii?Q?aq0EYQXJNyI0u7qPQWNxgdiERiXLSp5hWjauUbid2FE4UGRVmTQgCd+geGoI?=
 =?us-ascii?Q?C48MIRTNUGZxYlpS03Uj2femnpv01pYZoyqfp9UPMScSBFehAloFcuNG5wy6?=
 =?us-ascii?Q?VTAfb5tnrNjqcRRddx4rc8pTku63qDwja6CTswA9Zo8PMK1X4h3KhYAQ6FuX?=
 =?us-ascii?Q?02Rkugf/p9C7dLMpAjohT9gTcH968peNTcSCZ/wVh6CCFA8rTFI6ZbAN6XUC?=
 =?us-ascii?Q?TumE5o8FIHBX8R9pKdI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550e2819-7726-40fa-2816-08dce3a7048f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 12:29:25.5135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJ88sxgS42tfE3M/SEdwKdE9udf4R31oGfA1FU+jl4ld9SV83l+EaOJNGG9XPyctmO7gi0YpV6L3n7YyS0YLPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Monday, September 30, 2024 11:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_lpsp: Add display version check
> on external panel
>=20
> LPSP for external panel support from Gen13+ onwards.
> Skip the test if only external panel connected on less then gen13 platfor=
ms.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_lpsp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c index
> f9ac508fb..889da42de 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -227,6 +227,8 @@ igt_main
>  		enum pipe pipe;
>=20
>  		for_each_connected_output(display, output) {
> +			drmModeConnectorPtr connector =3D output-
> >config.connector;
> +
>  			if (!i915_output_is_lpsp_capable(data.drm_fd,
> output))
>  				continue;
>=20
> @@ -238,6 +240,10 @@ igt_main
>  				if (pipe !=3D PIPE_A)
>  					continue;
>=20
> +				if (connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +
> 	igt_require_f(intel_display_ver(data.devid) >=3D 13,
> +						     "LPSP support on external
> panel from Gen13+ platform\n");
> +
>  				data.output =3D output;
>  				data.pipe =3D pipe;
>=20
> --
> 2.25.1

