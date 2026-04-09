Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E5BE98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F8510E0FF;
	Thu,  9 Apr 2026 03:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckiGJgbv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E181610E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707106; x=1807243106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9YRls+ASjfNX1Qzh5rnFTHrL7SB5/nqqcL8o+S6/e/8=;
 b=ckiGJgbv/sCdH+9Q6vFqY6VQkS2cH90TqieYyQsehdr8J6qI5BZKJNRl
 USzojGXcrYhG5AeUzWKyM/bA17uMg4hzee8wdzMZ6bWYqLnKjul9e2mmN
 eAgryzA6L/6dDz3+b1m+LJtzMfNT+rYHc+XY+BPNuQANJ342D5pWMOudF
 JnGXJskAF7951gi1i9OErcaO3xuQ5ovolUiNpMhJF/A+PaptRZdYac1uP
 rGkSAlWggaS54GFnj3KCtGHH01THI7CmsSg7lmCAJizFw6fNcApbWcWg9
 87A95PpLUB/eGzdhCxvWu9XXqr7ZEF6J5FUsWebCCo7a7ANe55gOtSZPM g==;
X-CSE-ConnectionGUID: y+H9cMKkQu28hAN/tKrt3g==
X-CSE-MsgGUID: fLRNQSZPR4WPUsNbVGfFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86993030"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="86993030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:58:25 -0700
X-CSE-ConnectionGUID: wfhg8l4mSqme+95AEnt2aA==
X-CSE-MsgGUID: EzCLTSe6QlOeYs0ng2NIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233032742"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:58:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:58:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:58:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaUqN+O1T6e3XmkmPrjjbmHQ4qxmAWjk4iqG9zkZdVCAARgTQlgmBc/UhSGHTl62N2esGuIqBnAd2T3stv1hPAWIF3w5Q+qhkLaRActIct3tHNmD6NBLe0RjYJHlXeH0WUSVDv1iF/iYB0gKkWaRQOJaOF6DUYqTXDbUB4kn6mShvqy294KtixTPHaMnsnDKOssh02dKQShccIEotcDiQ/wSGTPZ2ALmWnMibFWMgmR7dzKlzvktCuno7M8NqtrGe4YpoIFFZ6GXLMCsq1C++GNuFzdWC8yh0nNzQct7qpAtv7CmMu8coc2bbDPdD8s2m9hHi3vx8jLaDODTsjyV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph3TlxFkTnkS/UJJnkLwCAKLOMmHasA9Q0r6e7JK4cE=;
 b=SWhL0kvTmdZZCQi3ar8beiaB+24XOrzGOao1G+X9eaxT9EOowhHasW7Gk5f8EcVa+Uiv6iWkmGTZmKlk8PEWgCXn3MhG8enN1zMApHar0gDLgAArsiJmzH3tQaD4HwDlDbr0N1tr9F4sAhAqa1w5Dabh3v1LtTyTFKDVDi97CZJsA65xVqxvqEnhkL+T5XmtAP+saYpHphOxjbZdGCLwZHpT5PhB3RQQc2E6XiDVrZHZYsnBh7Hmrn8EjhbwaANu3JydhfdPQqkZeLO2TrVX3tYPtlyynrhrBb2yiBWrw/qLMqdylnTNkjrr26VWjwQMu0OO3+9IXdpXZK+pjk5iOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 03:58:17 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:58:17 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 2/7] tests/intel/kms_dp_linktrain_fallback: remove
 mode from data
Thread-Topic: [PATCH i-g-t 2/7] tests/intel/kms_dp_linktrain_fallback: remove
 mode from data
Thread-Index: AQHcx5ViM1/lzFNoskKHI6bN62d+f7XWGvGw
Date: Thu, 9 Apr 2026 03:58:17 +0000
Message-ID: <IA1PR11MB6467FC01F1C3F7B95E2CFC09E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <03424800c9ea0e5f3cb4c1fa8de62e5a58f79b21.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <03424800c9ea0e5f3cb4c1fa8de62e5a58f79b21.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: 048ef41b-9e26-4481-33f5-08de95ec3b72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: g+BKDuj9TToDy/lc3mTQxmNt2+8Bh0Tf7EtivUGKjmAv0bOPVdULQ64bOV3OJSbSBRGgF2LJ80bEolech1TbhMWo59NtZRp+dkhV7UCgMcMMRtUIsTvaWukk83caOLwnuRH+X6Gqr5oEO8t+wQBOgpnPe0rrA/f1xTW9PYbkcZyxdgzJ3P9Rx0l3d4DKl4h640qB/48kzyLJKLVw2gEOFZLS/Sss7O6cTneaGbzbqvTyX10IOgCgw+tKjeD6eivbcmtk5ElM6UVEh6OFu+LBWh7UfMB+Rgx1hN9+WfZxR4ZNgC1bKh/tQSCvTxfj3HiOyAFIlwwim4HNzu9i310cj/add5MPfL9j/YDg6YEHG5fThT4wFi3he0qk+DqVg6V08lkNQTYSB3XaJ1mRqthi10EJ7GzHrL24P9SZHt2HIEUna4Git2LD4iBR9GZ+etKkILE9hZ3yFWxh9rj33vlCPxSqAVFGdSZHe6Tu186uc4b3NsoTbGh7aKT5wMxy9EwVlluzKBRtAIWW1m7/R40EMqyykQ+P0RhW/L6q63Zg5wHeF27SVzePFNyGQRDS8LqhaQVpkyUBQnGYeTfY1IBK+mz50k4L//Rx24q422fNPo68bQixdo7psWN4GCtF2EleGBtFw9+rhYCqbfLDQACa95skOF9lXDOYfXWzdYNEuVofqTLXeurtoJ0dXRoXCXhJPvswm0FuWXmhZtTYaHnO4X+3qLBtbZqJzjT4HR4e3XNfv/gNZk7UMhPlHQ1MrRhGTJo752dSmcKKq5LxTv8e7up1wYVAxNFO/+RF6vWS3B0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?89c9Un1Lajh/esLL5Ku+85BRjCkyQzCtN3wg5HMF+v9uP1Ud6ArtoBb/q56G?=
 =?us-ascii?Q?uA4GaUIjx3xEdt3iIjtbFFQJSrWAsJbq9hNUJcj/rwH6+MnQ+ccOQLxY756w?=
 =?us-ascii?Q?3CMArvwK8ygfG20w3EFiuSN/oyPoD+UPGVhUR9XsR/QZzlE07n2PUM+ZvamW?=
 =?us-ascii?Q?9Hnck536QUHwyWmR3qrnqjauTZjMjVXwkl5/iYL/z4fCng/obn0wfc5HzaBR?=
 =?us-ascii?Q?ZIRw3ja7vRW/1zuMwDwDJ+DwXz0RvzZPbqM/ncZI54S3idocq5KPTbzafbwv?=
 =?us-ascii?Q?1/gNMETqQnukCtEZ8oflSJ4540AA8FbsB+wV/ScKlxgYoWLO/P4UXcJGxefU?=
 =?us-ascii?Q?3uxmS8PmQ6MASF2b++YaP37ty9WgzXZ8ldc1pVSpC4ra88TXTfbt8LG9s73n?=
 =?us-ascii?Q?yEWhHV88EhPQKc5BdFXzFXae1PhpHEqqYQnMPwiKlZn1vQREYVdxLXHqxpp7?=
 =?us-ascii?Q?DBvl0SAi5Jfgf3i5ExAsmpok8fSrKPi3XUTw9pdLpkCZb24xjXNzSKuIQyF6?=
 =?us-ascii?Q?4maxuSLkxxZEF2nvdkiyj1r34cW6kH2tka6FDEh8IeOIy/RsuWl+QqxLfvnF?=
 =?us-ascii?Q?zVFGu7sE0gne3XYB6YO+M2caofogpnr6V6jgepidCrSCCWTBtvSkcL55QY9/?=
 =?us-ascii?Q?6T7Olhv8JHuD7mqIyjMOK4UenubruJ1vE7qJ2/7jfU9bFPbqyobOCVMP3pNY?=
 =?us-ascii?Q?ajSwEsQIqd9uj2WkxJpSGvx+TP4s+zGKAlGhxJphWHes+BzgM36qdDnQdU1I?=
 =?us-ascii?Q?P+OSGlEETor9RtJFJYF7GkHdKzsCCncF6FwZNDG7ea/lFt7Y4A9XbXHP4TIq?=
 =?us-ascii?Q?K1aeuUeGYig1TA5NX8NT/VmHfEjWL/Hl4QcnuYQHUjxuO58Vd/L46hzm6rSV?=
 =?us-ascii?Q?sSVixuqXEkkNU/V+W0dVf4x6MFiY9wR9HxocAJAsVGmhPY+ChhOvD9aO0nvK?=
 =?us-ascii?Q?Ajn+2ZLB2iOU4wXOnH459xPtpoqhjTPkMmxWnYQ24ROjuw/YMIvGbPUkOC3/?=
 =?us-ascii?Q?etgv8Qv57vVQ0Xanteo5dJnoMNz3t5crMi8fu9q4/3oL0OsngFOL3yelnRYK?=
 =?us-ascii?Q?Iv2NTzbcQl377NjA2PFr9CHFL2FjOVobrG/Pbt9+or2RscN9wmHFWQo0HtLq?=
 =?us-ascii?Q?OgW5mV9BQPvE52eRF4WpDzDyau5s9gzA0WyJVm+3T+KoWMtg7v92VVRDXJN1?=
 =?us-ascii?Q?rYcwylM2Rn/nqo4T3KzolpTXwPyb2AAbSD/PcrQLQJELcXcL7fWY1JmXisFv?=
 =?us-ascii?Q?pADsI7s7vy1QHtx2EanWHSLqZoYlZb8GB8u1POhf+mZ8r+URHd6+sEX7T1ql?=
 =?us-ascii?Q?/hUUQW3/7rx5gtPjwG2bmvGBTsIj/6IsJtoQCImLrvwwPi5VJQw0a5hXDRM8?=
 =?us-ascii?Q?LQ6F3sILAkf0MrBX92+wdrxKIXQSJ9aQzZbvvY2Ctpe8b+xek1dzwfa50DMM?=
 =?us-ascii?Q?U/E2uTRkurHKFtadj0cTlWrHtsJfxz+uTF7t5ApWYxm4ZdVStq6FpU6/aWKt?=
 =?us-ascii?Q?mibfO7mubkYG+phlrk1noW5RLM6awvm/CTmjAKz5FKw7Sk+jNQtaP6v3PxlK?=
 =?us-ascii?Q?xavXyqfG9Mo0+t8uSWvtuwaIIYjUjMjem1Ek9t+UQ+zxKz83Plrx92Z7MrKI?=
 =?us-ascii?Q?JnsT88GVpWl0BkDSfAz2RM0uCB1CWoumnUdh35Ut9lm6dEY1h9H6JiGAymkP?=
 =?us-ascii?Q?bIy2v5dvvgRbQWzmDtF5roF+qKndHH1lU3eI6VvbPGfUa9L44Uf9LpTE12vO?=
 =?us-ascii?Q?eo6JqEd23w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l2Our2v/SpRVpP4EzNkkViLOtad0Z1/xDbFa9i2tmUSjO7YgoQvIVrHhna54I/nIfUiXeSE34JKkoZ3s+7Knvy5pAGQzl5pHCGHVe1RFC9ukfajflkNI+/kI1kAo9pxj+tuWz7nQ9sRuI9KIAFb/AQMvJI/aXi7llrCLvg9689BswyAAutmMwJhcZL8tmM9OU5+QwW13O8fXF9D7DtsdMTfJQZIoSfsdoATXzAJ7FzHhHkk7teUmoyPLgcFV69NOpz/DzC8S+JaTfkYlSwNDYQuu0ZGPslewJYBda573miXf/6gr0EF5MROWDzshQRu67jIRFc3bRQEM7jfVq7v3Yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048ef41b-9e26-4481-33f5-08de95ec3b72
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:58:17.5143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBw99mp8GiVncrTPSteFsnAgVtWEBuyq2mty0+sePtHvIpJpxHZjCksSeSwUhLBe7CP7Sbt7GUh8TfiDhpBXMA==
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
> Subject: [PATCH i-g-t 2/7] tests/intel/kms_dp_linktrain_fallback: remove =
mode
> from data
>=20
> The data->mode member is only used within the mode loop. Just remove it.
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_dp_linktrain_fallback.c
> index c09e9ce36928..2db5422c211d 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -38,7 +38,6 @@ static int traversed_mst_output_count;  typedef struct =
{
>  	int drm_fd;
>  	igt_display_t display;
> -	drmModeModeInfo *mode;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
>  	struct igt_fb fb;
> @@ -477,12 +476,11 @@ static void test_dsc_sst_fallback(data_t *data)
>=20
>  	/* Find a mode that doesn't require DSC initially */
>  	for_each_connector_mode(data->output, mode) {
> -		data->mode =3D mode;
> -		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -				    data->mode->vdisplay,
> DRM_FORMAT_XRGB8888,
> +		igt_create_color_fb(data->drm_fd, mode->hdisplay,
> +				    mode->vdisplay, DRM_FORMAT_XRGB8888,
>  				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
>  				    &data->fb);
> -		igt_output_override_mode(data->output, data->mode);
> +		igt_output_override_mode(data->output, mode);
>  		igt_output_set_crtc(data->output,
>  				    data->crtc);
>  		data->primary =3D igt_output_get_plane_type(data->output,
> @@ -495,8 +493,8 @@ static void test_dsc_sst_fallback(data_t *data)
>  						    NULL);
>  		if (ret !=3D 0) {
>  			igt_debug("Skipping mode %dx%d@%d on %s\n",
> -				 data->mode->hdisplay, data->mode-
> >vdisplay,
> -				 data->mode->vrefresh,
> +				 mode->hdisplay, mode->vdisplay,
> +				 mode->vrefresh,
>  				 igt_output_name(data->output));
>  			continue;
>  		}
> --
> 2.47.3

