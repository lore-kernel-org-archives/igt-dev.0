Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94504E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4863010E0DD;
	Thu,  9 Apr 2026 03:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1FG3XDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0828210E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707164; x=1807243164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vfbna8XmlwfnAFxpv0PpYC1jv9Sjq6tcMlG19jOciRo=;
 b=J1FG3XDv025+U8nqHk4UPF4NrIJCAZO5NS8RBQBqlXw9zvzj43Pt8oRj
 +ooC92RRorAWQ1Y6ATfxhMYoSnnQXQoHS6z/ImdH8EoxTZsLLmEEJ6mNs
 YEH+cxSsqyjxtVpALObBmtE/5MxQlkvBUW+Rlr/huJA7S6trXvwIzmh5m
 3gugXBwnI0u/1/hHOT//1r+iAr1vUwDlPvzlpf3j7slTjJO841BBCOy11
 aQAtOtVKcuGrRSQSRBL2DBR9FXc+USa2JhnVzRDLlMKzxpOqtDCZdq3rn
 rpqsaaiAxpI0I9PD7tGUClscong7vMBZ3uSQr5h9Q6W747hnI6XdqoYbT w==;
X-CSE-ConnectionGUID: KgD3/ILWRbq2DZT47JDAiA==
X-CSE-MsgGUID: kldmlgaYS1iWvs4ylAszbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88153597"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="88153597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:59:23 -0700
X-CSE-ConnectionGUID: NQpZxQNER/KyygkqetiTxg==
X-CSE-MsgGUID: +8C55/NcRjafKF2Q+91K5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="222145235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:59:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:59:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:59:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4CymUxrrP8j6hqx4CleEsaTIxZ1lqmexmfbeQ3b2ui/0mxFAN1u0lLjblOy1F7WAgN2goWOqYYloCiKmT1oj1D6VoYXH39lxu1iBHD8oozABUwBVuMfx7YkyaFEtuTMyFbu2UJGPDNmImN45QVlpuL7uX4DPHhkw35RQVQnvFwuIQOgNUKE2AFDNDJlfy3zaWlSh3/WqZgNojgTmfEMdYTiRY66zID79zFhIGginek/wrr5EqlDAlCLTfeXPwOrjNknMBCxhACrP1M4wdy9SAYNdpfxNgOMgPU/ABa33Pal6+Sf5mPgoWGyi/nCGRwS1TXwrTXPtji3pd4H2BF4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkxCQ/gQ/vmv2OxaNG4QIbu2/KnFst0YKWIkdG2mX5Y=;
 b=QOIu3I2SI2fcxOdKN4H+9Y8lgmFltuz/yLU6Rdoy637fw7ylqc1XgkiE2n+KbXbNJbgH02e5bk470xi7meMbQUgNyr3ZK9mgRJYOj29HWVHmJOSIeJ1RkfNjch6PpxbWLnUrkAsbUuxabhEPodlBGLi5esXB4pGm45h2ITTgm/fOqlEM49Qx/tfCu8SpNzbs5YlTOpuct8HRP3lckqz+GBLLwKWEGBBRgljIX9qnHg2dqia84uyxijTySFHWjxbQ/Am8h3LXyQDbZJa0VkxucaCcod4ZV0QqrWfeTFLXdcDXhqtpF10OQynTpHPlZLPMCosTyg4l7UyX0GENnUbpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 03:59:20 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:59:20 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 1/7] lib/kms: pass mode parameter to
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 1/7] lib/kms: pass mode parameter to
 for_each_connector_mode()
Thread-Index: AQHcx5WSM1TRHG1n0EGxp7RWBkoeiLXWG0HA
Date: Thu, 9 Apr 2026 03:59:20 +0000
Message-ID: <IA1PR11MB646783C784A0AC95C833F2EEE3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <0f11189bfbc9cf01ea2977e54569e57a7e569e16.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <0f11189bfbc9cf01ea2977e54569e57a7e569e16.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: 947693d8-4d3c-406c-cd79-08de95ec60c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: wXZm4h7NUgVR8nkzfZ5tr6bWn9T8u5SaDs0Wu8mpRb5y2IIo6EOlo42WPnIO2MaLyLLzFW/gsWqW0cYvGucHvYRGaxEmgi229+R+Epzz1nhtULyLeO1+ujEEytgqCr/ju87F+y4YU68pSWWC/q3oE/LxnDeYRB74zYNu/1PlovtnMxyInvv1R62oh32mtIyUspjEbs6A9+a8PH0b2owyOYCytd5NW8HHragtypIBCned7eC1uKxAPWqykd6e/k0WM+qVRIMDEjmSy8VWaoEKKgbA7vIi2CCAenZ41IzZ9mw2A701ITksW4JA5dizSRt5MUC7IIayB+40u/9+NEZdnyawgSWzkz9DeBhR8Z+orinqTPQaYjwwDS8f2S9OG7m7iGMWJE4+eDRdpZ1P03XxAqGn1WcFg5JT0H/m8W2x8/p7cU+WI5xjs2Fu80rqUmtIZh7GuK1JN2/WibfCR2WYpPjpj4XptTLzzU+TB9yXYDHKmkKO0lLhCQT5nubb/M+XSBbFTxDXXpdaso2h4H1+tbcAdLAp08gXWK7MRNhafpawLecUj8ur+fpd1GgZybvnAmfOsxAaLw9IeY1+cnhLfgAALb9lyJKHakNIax78Eur73PmrkrKDA2Iuf0qqZRPwWNmemikirK+qaau+zSs7WTwSc48AkP2BfsMD6V2T7BtkAlVJSIZxnVcrAn9oG4rgXcdmbH/PtQx1q47gCjPU9EQW22ncHNOZqiheiHZquszBqduZ/dvAUGYcRbCV7hUCD/6PLJ/YF30YzxU2bfhOe9l+60wFA5jiwyVBnm9bOBI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ik2nDx536ID4JdKChHtC3dMi0ayyvLhoneq6NkmQEZjDX6LIA0/HDVrtPwer?=
 =?us-ascii?Q?WJYv0sp/s4iZamFCnxHMsJpUK2z+/ad2rfG5mlEpsbL7i05+C0PNzJnMKmFG?=
 =?us-ascii?Q?/6vFqjDOq9MU+WrDgM8+TnyjShIMq2Hk1fSFn0PI7WTlhIUuJQKGLTVO/wE3?=
 =?us-ascii?Q?6uloo7m6azT4FnJ7ZWq2MailnxIPcs5FBA6d/aZdX1QXh8CXPlWAhzt7OD8h?=
 =?us-ascii?Q?uKxZ1QT5I7SvU8onQ2PT9rJcSfXEC8E4xD/8NHLfJ0+ouRGMh0e/awiIvl3r?=
 =?us-ascii?Q?beSmAfuSF1iLrmlZipJiLm+hQKb/C0ZOUpx4AC2aq9aDMLqrhgsrKgw3QAnk?=
 =?us-ascii?Q?JBFxdwot/vc71Fx0Whu9BmNxJ9D32hJXRBvxRhadQHgk2IasXIqmTg3WI+EC?=
 =?us-ascii?Q?K3V5hyo7fCmXKuuu7jdju32fyWR0XgViSeLPRAhZch07cn5HRxVJwc+KjOec?=
 =?us-ascii?Q?7SPzR7BqTLUQRq/y3U2uoAVGaGNoLfw7Y8RJw42ZhfhE+5wjqj2QxYowkG0b?=
 =?us-ascii?Q?EUygsVWrbABquC4pzlBwiwnDN8J1QDHVIxUrMZbFz9RdK4kI94/NLS3/cKjY?=
 =?us-ascii?Q?U0ejhyZGD1ef2i4+1S4jA9n/cbRmY/HzRo1QIftZ+ZF0/svOGoCms56fWRjb?=
 =?us-ascii?Q?hYjj99oCLFyFmulYi6vb1gIvT3YyiLaf+GvHYqY7yTg8JbSQHYHdr9NKvqkZ?=
 =?us-ascii?Q?Uu1gaF8Eu+BwBHpUN1F2tQJeqUIpQujV6PuqPg3peH3w9/UyGrgbkDMvOhJ1?=
 =?us-ascii?Q?YyQL+u6gggrqowE3BTW0Z6HgT8F2sHKSYiV4/YJ0NFsRjfrvvUgQ+Chwzfkg?=
 =?us-ascii?Q?9PLMptR+NiauGGtpGD/LZmwVZ1PaZTrkU/OTiO+O5tSzxHcpuyMe10PYcNSq?=
 =?us-ascii?Q?EO3c+5g3F8SdDYJ+XPCguKqVUsh3FWWY23cAN5OHv4VDZo01Nk3p5huilRlL?=
 =?us-ascii?Q?O8fCrW573AWfNFIVhFhS6VYP+dJqHYgTRjPOv8mV8D82WV3MXCfOrzHFshf5?=
 =?us-ascii?Q?u2iR8lxfej8060x0D+6V4WLrPrGx4P0RRzEU9SiKFOhZKCUvTocW9m6IovL/?=
 =?us-ascii?Q?kDxrEuy/Xo0fOK+TQd/H+xsEWAZeCeGC31QaOIgByUKF+xzcW3giBX2J4Uwe?=
 =?us-ascii?Q?B9GMDuP6eDb/bV72f9Ik6JToQeI3J5CT0v84fOmhDuff8K3OW62YcAjbMnWa?=
 =?us-ascii?Q?i4k8bGAsQMd6a02j+JiD0/oMAoXUnOzt+uSqfTClbxyoqB7cmoIE2tSofEe+?=
 =?us-ascii?Q?WIAtKCSNl0wUIc7H/NAnZACLkeJJrgDNjAiCxPMY1UqzM4ZkyQ7NkEOwe0eU?=
 =?us-ascii?Q?I7ympYMAth4rfq48Q/Gd0q6Hxwb5U/8GMhvE4iyFuHc05ZldJmGSJOvGK1Cr?=
 =?us-ascii?Q?10me9lZnt1WzpUbStC++HexexYnk9OPHi6B3IVgVetxyl1Rfb7dthdJIbMUY?=
 =?us-ascii?Q?WBJ8Q/AD4JymNnzfhJcDJSpP8scgYsv9tLLVsirQrDjKHy2XEpQNUCY3H+/C?=
 =?us-ascii?Q?hT07WQGcAFzrOcvkftdHHR+Uun7lopeAMrSD8BUAGUwW+AUkF81aiP7W/Rzj?=
 =?us-ascii?Q?FqtVWpQaYUnX4zPk2Ey2ihpTS/cNvgWNwWgPeE6/MAfSbZB7oPHzcruuK1jv?=
 =?us-ascii?Q?wdSSHXhIUvP6CmEwHisTdWKJhkzGA7sVGU4FVJst5iM9ksfOX2Og8IdcZ6tZ?=
 =?us-ascii?Q?4dlyXzd+C8U0s/KQ8axys2qnb0w/lISXKFMrLXMwNP4GJ3oU0Tfo++/SfPCT?=
 =?us-ascii?Q?KJZlvNDmYw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: woCSnRF56vXEN2wOvzG7DAh20QoSyFzvucrlG2al06vNq+ncuNRgpnyPKT2LqABP5mOG5xYilZl8lC0kv9gyMOLj7fLrui2y6NMbfKUn1AGwDF1gWVxCMZzWrlbNbeyjPw55kIsAMEs5ewDkAyUX9A+gkhxgQ1N5DR98F6Ju32qlwOWY9MTynP0Ab8mgVPvNetubIdM4qHyoa+KYekxj5hCHaYSKUNPLYr4fCYWRu7C28rF9QlsyOkLHnC3ghr2pNtrR+enwf4zgN4Htl8xDrlsStmO5GH1JiKdiAqB5IPNS6mYAwiTEHY6CMjGdcctzjohkLSzrUpXnASyiXWwtOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 947693d8-4d3c-406c-cd79-08de95ec60c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:59:20.1291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ll/8nsivXWJNN9KgLdpQIPl39/xi0bTGvKYVvbpiHcj20ymzvy+oyvp1BViSLwkT/DkSYHz7DVZeSl8RRWO70g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jani
> Nikula
> Sent: Thursday, April 9, 2026 1:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH i-g-t 1/7] lib/kms: pass mode parameter to
> for_each_connector_mode()
>=20
> Add enumerated mode parameter to for_each_connector_mode() to simplify
> the loop usage, and avoid the dodgy implicit j__ usage in the loops.
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  benchmarks/kms_fb_stress.c              |  3 +--
>  lib/igt_kms.c                           | 10 ++++++----
>  lib/igt_kms.h                           |  7 +++++--
>  tests/intel/kms_dp_linktrain_fallback.c |  5 +++--
>  tests/intel/kms_pm_dc.c                 |  5 +++--
>  tests/intel/kms_pm_lpsp.c               |  4 +---
>  tests/kms_plane.c                       | 10 +++++-----
>  tests/kms_plane_scaling.c               |  6 ++----
>  8 files changed, 26 insertions(+), 24 deletions(-)
>=20
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c inde=
x
> d9501ffd2fe6..f63490ce40da 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -92,8 +92,7 @@ static void set_crtc_size(struct data_t *data)
>  	drmModeModeInfo *mode;
>  	struct rect_t *crtc =3D &data->kms.crtc;
>=20
> -	for_each_connector_mode(data->wb_output) {
> -		mode =3D &data->wb_output->config.connector->modes[j__];
> +	for_each_connector_mode(data->wb_output, mode) {
>  		if (mode->hdisplay =3D=3D crtc->width && mode->vdisplay =3D=3D crtc-
> >height) {
>  			igt_output_override_mode(data->wb_output, mode);
>  			return;
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 04b1f3972307..2dbf9ec384=
58
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5361,16 +5361,17 @@ bool
> __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>  						  int base)
>  {
>  	igt_output_t *output =3D NULL;
> +	drmModeModeInfo *mode;
>=20
>  	if (base >=3D n_outputs)
>  		return false;
>=20
>  	output =3D outputs[base];
>=20
> -	for_each_connector_mode(output) {
> +	for_each_connector_mode(output, mode) {
>  		int ret;
>=20
> -		igt_output_override_mode(output, &output-
> >config.connector->modes[j__]);
> +		igt_output_override_mode(output, mode);
>=20
>  		if (__override_all_active_output_modes_to_fit_bw(display,
> outputs, n_outputs, base + 1))
>  			return true;
> @@ -6791,11 +6792,12 @@ bool igt_max_bpc_constraint(igt_display_t
> *display, igt_crtc_t *crtc,
>  			    igt_output_t *output, int bpc)
>  {
>  	drmModeConnector *connector =3D output->config.connector;
> +	drmModeModeInfo *mode;
>=20
>  	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>=20
> -	for_each_connector_mode(output) {
> -		igt_output_override_mode(output, &connector-
> >modes[j__]);
> +	for_each_connector_mode(output, mode) {
> +		igt_output_override_mode(output, mode);
>=20
>  		if (is_intel_device(display->drm_fd) &&
>  		    !igt_check_bigjoiner_support(display))
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index f994d91d3aa0..9a3fa980d8=
9d
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -802,12 +802,15 @@ igt_output_crtc_t
> *__igt_output_crtc_populate(igt_display_t *display,
>  /**
>   * for_each_connector_mode:
>   * @output: Output to enumerate available modes.
> + * @mode: The enumerated mode.
>   *
>   * This for loop iterates over all modes associated to the given @output=
.
>   * If there are no mode available for this output, nothing happens.
>   */
> -#define for_each_connector_mode(output)		\
> -	for (int j__ =3D 0;  j__ < output->config.connector->count_modes; j__++=
)
> +#define for_each_connector_mode(output, mode) \
> +	for ((mode) =3D &(output)->config.connector->modes[0]; \
> +	     (mode) < &(output)->config.connector->modes[(output)-
> >config.connector->count_modes]; \
> +	     (mode)++)
>=20
>  #define IGT_FIXED(i,f)	((i) << 16 | (f))
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_dp_linktrain_fallback.c
> index 91dde2a7dcee..c09e9ce36928 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -464,6 +464,7 @@ static void test_dsc_sst_fallback(data_t *data)
>  	int ret;
>  	struct udev_monitor *mon;
>  	drmModeModeInfo *mode_to_check;
> +	drmModeModeInfo *mode;
>  	igt_output_t *outputs[IGT_MAX_PIPES];
>  	int output_count =3D 0;
>=20
> @@ -475,8 +476,8 @@ static void test_dsc_sst_fallback(data_t *data)
>  	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
>=20
>  	/* Find a mode that doesn't require DSC initially */
> -	for_each_connector_mode(data->output) {
> -		data->mode =3D &data->output->config.connector-
> >modes[j__];
> +	for_each_connector_mode(data->output, mode) {
> +		data->mode =3D mode;
>  		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
>  				    data->mode->vdisplay,
> DRM_FORMAT_XRGB8888,
>  				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 39d00bb6e620..8138933d43b1 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -548,6 +548,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
> +	drmModeModeInfo *mode;
>=20
>  	for_each_crtc_with_valid_output(display, crtc, output) {
>  		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_eDP) { @@ -577,8 +578,8 @@ static void
> test_deep_pkgc_state(data_t *data)
>  	igt_display_reset(display);
>=20
>  	igt_output_set_crtc(output, crtc);
> -	for_each_connector_mode(output) {
> -		data->mode =3D &output->config.connector->modes[j__];
> +	for_each_connector_mode(output, mode) {
> +		data->mode =3D mode;
>  		delay =3D (MSEC / (data->mode->vrefresh));
>  		/*
>  		 * Should be 5ms vblank time required to program higher diff
> --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c index
> b0f79124e9e5..6d4e64da01fe 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,9 +166,7 @@ static bool test_constraint(data_t *data)
>  		return false;
>=20
>  	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
> -		for_each_connector_mode(data->output) {
> -			mode =3D &data->output->config.connector-
> >modes[j__];
> -
> +		for_each_connector_mode(data->output, mode) {
>  			if (igt_bigjoiner_possible(data->drm_fd, mode,
> max_dotclock))
>  				continue;
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index
> 502985f2353c..7962c733a671 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -505,6 +505,7 @@ test_plane_panning(data_t *data, igt_crtc_t *crtc)
>  	uint64_t mem_size =3D 0;
>  	igt_output_t *output =3D data->output;
>  	igt_crc_t ref_crc;
> +	drmModeModeInfo *mode;
>=20
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 igt_crtc_name(crtc), igt_output_name(output)); @@ -530,17
> +531,16 @@ test_plane_panning(data_t *data, igt_crtc_t *crtc)
>  		}
>  	}
>=20
> -	for_each_connector_mode(output) {
> -		drmModeModeInfo *m =3D &output->config.connector-
> >modes[j__];
> -		uint32_t fb_size =3D m->hdisplay * m->vdisplay * 4;
> +	for_each_connector_mode(output, mode) {
> +		uint32_t fb_size =3D mode->hdisplay * mode->vdisplay * 4;
>=20
>  		/* test allocates 2 double-dim fbs, add one more, to be safe */
>  		if (mem_size && 3 * 4 * fb_size > mem_size) {
> -			igt_debug("Skipping mode %s due to low memory\n",
> m->name);
> +			igt_debug("Skipping mode %s due to low memory\n",
> mode->name);
>  			continue;
>  		}
>=20
> -		igt_output_override_mode(output, m);
> +		igt_output_override_mode(output, mode);
>  		mode_found =3D true;
>  		break;
>  	}
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> 8d34619b328f..0941dcb4eb05 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -585,8 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t
> *plane,
>  	int w, h;
>  	int width, height;
>=20
> -	for_each_connector_mode(output) {
> -		mode =3D &output->config.connector->modes[j__];
> +	for_each_connector_mode(output, mode) {
>  		igt_output_override_mode(output, mode);
>  		igt_debug("Trying mode %dx%d\n",
>  			  mode->hdisplay, mode->vdisplay);
> @@ -946,8 +945,7 @@ test_planes_scaling_combo(data_t *d, double
> sf_plane1,
>  	cleanup_crtc(d);
>=20
>  	igt_output_set_crtc(output, crtc);
> -	for_each_connector_mode(output) {
> -		mode =3D &output->config.connector->modes[j__];
> +	for_each_connector_mode(output, mode) {
>  		igt_output_override_mode(output, mode);
>  		igt_debug("Trying mode %dx%d\n",
>  			  mode->hdisplay, mode->vdisplay);
> --
> 2.47.3

