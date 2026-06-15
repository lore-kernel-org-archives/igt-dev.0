Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFC8CD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 06:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBC210E1CB;
	Mon, 15 Jun 2026 06:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcEpvC6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39210E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781504151; x=1813040151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wBICiUFjfbP2y+soxq1qYiQUvLzBg2iRfKZZLjlJ/FE=;
 b=NcEpvC6vajLscUMg63DG0ddBRZT5gEGaveGNRiPyYYEzrQUqn+DERYYQ
 LxIi8hZsRUBO8E5hYC5duWWwE0nhxfACGDy0dZUIylfw2vU1w/0Fpd9P6
 nwQSzeFpEJ1mwf2Pg3IgY11hW+R6kKrWMQD5pCPUzD0qLSVYuIfe9Ses9
 NcGU7l3BbLodo7AV2DIsUnK+6nmQ5rMnNdCR8PjFSDVBsWuvjcsxNYcaj
 2JuL/WfTHNhHGQ6YBaKwfWqG1vFSySkr4qSOfWwGVzW/H69pfZR7QTPah
 241SIftc41ZMXa8jauQUFw7t5e5UD3Z7FaiGpP1gPQ/iTeugn4ZbT8GOJ A==;
X-CSE-ConnectionGUID: zqEnDJmRT62R3zOiuVL87A==
X-CSE-MsgGUID: qyaKmK0XSt+neA6rJmsE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92557583"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="92557583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:15:50 -0700
X-CSE-ConnectionGUID: aEiAN6upSl+F90fTIXv2fQ==
X-CSE-MsgGUID: 1tdpnzCgRqqdOfyWenOeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="271068135"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 23:15:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:15:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 23:15:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 23:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1GP4f/9tzjjxsRPG6tPFBGy4SOgZPCOBNgixODUxy9f66Rc9+NKbZ4sSXjzI7k4nUqTLTkiA6W6SPOwC8Lyl26ZC5XLw0vj1sc/2KPZ/LSUrA/9oMITNLtI7Mat9lYQ2oaq3bkgnJ5W+N8fxfjWlm8NtpUNJqiuYRVIXjM7HFIJcgWnhxwOFyRXcIyzphIbmPZN7pDbWLernVVN05GXGeIEaRL7g3J8JwVBQrQi1KH01CDrfVow4uZsFZdnPhccM1KFT0GE9Y8WnElkicsE91I0TghnQJ49AuFUHSZg5xc5+Oo9ZOZLeb2RItwXIaWGpNB0Ww6PX5OE6GLU671e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2LQ7X+D7rWhbRFw8fyuUwV1DvEUYy97Auxjrf6WdY0=;
 b=kszFRep+bTyQHEn57/6mFvHyE8FhITIcXJ5m39+zpb70XcWlhIoOv1Q2NFwDY41kA5FTIsFn+YyHHkEzBljNC/c46Zih01vfAb3BssO9oMKG4d7PJ/I1LN1Zw/b7uaTrEefcSfdG7v54dlffnaOr4f3ISsSg9SY3bCY29eBOICrZS8ueR4awmRhe0CZgclLfl0MDL6RTo+kcZGIntfCPpIXQ8XejX2Bf68awvC7cmgG3yWsgjCl3rQf2ro6+J3/mpqNtsDVk1gMNdQCcDUNlCTvXourya9aDiwlDMA9bTN2RmUPe7Eiw7q5GFqIEg3IKT1PLkJaOm4UN0oEvYp+5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:15:46 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:15:45 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Topic: [PATCH i-g-t v2] tests/kms_rotation_crc: concurrent cursor
 movement with rotation
Thread-Index: AQHc6/FHDuZ+S8pVq0eaVHkOywt2q7Y/QaxQ
Date: Mon, 15 Jun 2026 06:15:45 +0000
Message-ID: <DM4PR11MB6312E1F84FDE6FD880711D7790E62@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260525024348.763823-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260525024348.763823-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM3PPF453C3BEC4:EE_
x-ms-office365-filtering-correlation-id: 83cfbb4f-ae33-4dd0-b874-08decaa58989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|18002099003|22082099003|11063799006|3023799007|56012099006;
x-microsoft-antispam-message-info: 8QFjKRua/+lyH5ozk/AQK+aKjXgL52As2LgI0Klm+Hci+0NwNl3b8O0mjobKu6KExtjpCRHv8luIiukvZ78rjKHYmbEEvbsT6O7JkoSCABmYcgxZ1c4Mbwjiw3McG1rIjh+iRyINOXJjt+p2u3OBTPmPVIwqOpNwspRGU7g9ahO4r2T1nSheDmVkN4BSQHuMtIPjC4RugJ2Tm75VutOsQ+oM/MvEASGbwlGyFsJtEUdVnPQhJ4CxKNn27yhkUv/sThmgYoEhJ4VwaPzAtPjW7ZhDaZFYBRHUjFT3x1k8F8mbFmw1WfAM3dezI9kiGCCpjyJjuXR0d+Ky8lLX2oIeh92S00Ok1YmCU8UiK0GOm0OcT0cAw5ki7XAiTrGoVxCKP3Ow/cFFgVeq8Cfp6xTdBRSDb52s07pv3L+dLoIqLg/7+BVmQGdmrvL7TrOikKol85Xk4dvGBGx1LXVxOM6Sf80J/6Hrpv7d0VCmz/iYm8RNtuJ4FggnfeE1ApyYY8IdMMsK8EMLJGhJMTsydh6ZrHoH2PaERKoYQwdivpAcZp8zN+TmRd3M0GZ+PItRPINEUvgxaamjtLmpzXFN0LPqbO0fda3V/dI5yD/7kuiOZMpAgQg5A9K0BfTJ7oYOcwx330PvH8HkBzQmvAjTMeZ7HWZoetw1QAH4+FFmh6Amfa5r/5KJn2mwMbCVrOFjcm9dpqqakCqF3LeK6H/dc3hkBybUTY3bzIkrF7XVCA5sBYQ4m8d6lNiF47R1UmZbuL+D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(11063799006)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mS632IsN+sFp4UDDKYG9pmZNijY0kbWx5ODWswzLdL/f8vS+mN28WdBjQa7r?=
 =?us-ascii?Q?HAS70w6hnYmhTKNrXAbEnzeNVTMaDTcX45DSEqI5Ml/lLMJkVqp2pzj54DwQ?=
 =?us-ascii?Q?TDPTYCluWqNSrMXvN/g4nuqIHA+Be51xV3ETkCYkI4KSEqKW87WLKwlFuvSB?=
 =?us-ascii?Q?a7UEc3PO/WqlSVMhXjrsgrw5/kH9DZEtmX5L8h0wGulRPL93Luf/x/DbfW/2?=
 =?us-ascii?Q?ehD72GAtkeQfEsOw29BQDcESMUzNCXePdeLgwgrrV1U6Sj4uBg5YfLDho/pP?=
 =?us-ascii?Q?DfR31s1JIQJAhyOL0crRC6m9Nvw5dyk0vtCCwuiMjXuY1ZpBoa71aiXz70WM?=
 =?us-ascii?Q?iZ93ETOARJlW80Bukx54VtAskqCNTrF4E0TcCqpysxFld2RxhuzKbLM6DMAi?=
 =?us-ascii?Q?uCwXADJr74Rps/sdhGBjrofHmCr2pnPODlAygmyJDuiihtNeZUJ98Pc+XQ1Z?=
 =?us-ascii?Q?/jYstWvToW9BugyS7R0UaG3SEGyT2FTBPrG6t269+By0pQW5JbQB9/Dn4ObN?=
 =?us-ascii?Q?HqLFTJN2DGL+WePl0WnlyS72hIsJRsn+BFDEmNhvzFYZMRTkHsFfoI0z5TXs?=
 =?us-ascii?Q?jhQB4sBp0mxTPI2wnp9U764eVNt6PVgnM8LkF3XOckI05ZXPoJSfSyL40SKg?=
 =?us-ascii?Q?83SpYDQq7fblR+WtbsIYbKbfepvVTAATLqoqCDjQleabe1nwu1GqXsEm50SH?=
 =?us-ascii?Q?VjkGApBAtGGmQl6qWmUhpOymKsZR+Eb9hK5Q1zjrKpQQSIc8Sdgl+SZf90J+?=
 =?us-ascii?Q?MtWhTr1rq5xx0ubQFkB56L5Og4A98kyqqXYSPT/5UVLg5UQkONw570n6iXDT?=
 =?us-ascii?Q?VhbRxe7uLm4tvpdzXUvMllOa3tt7oYTPlnyqlZy7bnGIdgLA7QWL5Fy9y3iG?=
 =?us-ascii?Q?M5bizWpjAYEqpSaU014LzTu+ZZxL4rXlTCBdzxtYLBNPKqM1xoY8JLB/F0cd?=
 =?us-ascii?Q?8wD+2AXbJ/w9oHcEA6nfRRjmqknL/ZL0hrP1TRFHQ/v1TkchACtx+t6AhAYF?=
 =?us-ascii?Q?pJGc8v2nSnc303Dz74AfCOWlFVevWalj1puAnibS0ElOindJRo5TWjbtfl1k?=
 =?us-ascii?Q?RCnm3P9YVItC56g4NsPLstu81cD60UswRfnC29e68Wb/KV56yaKt4SkAOlQU?=
 =?us-ascii?Q?pDy/rp5uIbAgIF9sk2gghsAwS90pjFTa7Eu2nSVzbQLbB7vsqSBvog9GKxIC?=
 =?us-ascii?Q?Ss+UvWXyYhsyBCysX1DVBizwxmOaMJnFyA6Psp4oTBApQ86JSsdmYkMjwOvW?=
 =?us-ascii?Q?i13+7vkOBIiBo87MPk+DXjY/MkEcHJ/DT7O7SMlBf7uaB3gLiEgFh67r7mw0?=
 =?us-ascii?Q?jASPLIm+hQJ+SUIe10axQN8oRzNyj1JQXN7fpSGRigcTEUU7RsTTNIxEPn5a?=
 =?us-ascii?Q?1PtRMov6MHipzTDWGTZXUhsoB5N6DbErLXAaqkSO8ODzVOvqf5pwr0LncME2?=
 =?us-ascii?Q?6YDZ7thrnwgi0ZPZHnlB1Y2CtsMYFWJlvRVs3x3d9OqQuXxRJJQgOtn4QlWz?=
 =?us-ascii?Q?XHM6VeOr7cP9PvRiT9vQRuTwxrOjT/t6ILTSg1j6oMu/Hev5mp3ao5G99Z6h?=
 =?us-ascii?Q?D/E06fQ+K41e2+GOGkLUDokQvxUzCgx7/0Mr6BW7OUlGv4kRmUpnGGqjwnTP?=
 =?us-ascii?Q?NhgdvOwEKjdR8dqd4bod1g7z8qVSAzh28t8dxle4qycgD8HSCFt5Pbq2W6/h?=
 =?us-ascii?Q?PXfcpP2setq6nlJmTC8LgN2iFXIkoyyRQ1wpyM0ilejNb+gZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: REoZUuyBRv37nOsfe5gw75AlZmAOCeGRF2SY1HMVbpX7JRmIFZq/0Wd0dR0ynNB1T7NxN/wCXomUnd6zj8we6bSV+gS9mnncHShxVZMCmQi2OhallFzM70wZRZsExsF41XfbDYDy03ofj7TyIHCTPnjhTjdlBaaDmO9IxEmkqX0T0//GbZU9xEelVUjaLh2YrIQjgvmyQQSsNcYXsIVk7hWIb50Kxp8P4/9ZDnfmJntDQzhAzLfwU6vbRK420Lko64QdYIxMSUVxSfS1n9pUa7hNyqPU5ELZzsIcWmWAR9RwjOs+ibtVFuTOx8gKdyVM8sJlOPKBIL+9gHEu68ClqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cfbb4f-ae33-4dd0-b874-08decaa58989
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:15:45.8788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pgg0mW2Tipxs/Dxhkeq27jg7RU51VeaGrXh5zxLs49y5hp9ZXy8gS/tE1ILD9i6umxpZYyv4RJwIvdyozL97Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Monday, May 25, 2026 8:14 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; B, Jeevan <jeevan.b@intel.com>; Reddy Guddati,
> Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_rotation_crc: concurrent cursor movem=
ent
> with rotation
>=20
> Add a new subtest to validate primary plane rotation 180 degree while mov=
ing
> the cursor across the screen.
>=20
> Use a triangular pattern fb which is easy to identify rotations on the pl=
ane. Use
> CRCs to verify the plane rotation with cursor movement doesn't cause arti=
facts
> on screen.
>=20
> v2: Remove hardcoded cursor dimensions, rename variables. (Jeevan)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_rotation_crc.c | 198 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> 4a249ed21..0a3270139 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -68,6 +68,13 @@
>   * Description: This test intends to check for fence leaks exhaustively
>   */
>=20
> +/**
> + * SUBTEST: rotation-with-cursor-movement
> + * Description: This test draws a simple triangle on the primary plane, =
rotates
> the
> + *              plane by 180 degrees, and then moves a cursor through di=
fferent
> + *              screen positions.
> + */
> +
>  /**
>   * SUBTEST: primary-%s-tiled-reflect-x-%d
>   * Description: Test for %arg[1] & %arg[2] degree rotation on primary pl=
ane @@
> -118,6 +125,7 @@  #define MAX_TESTED_MODES 8  #define
> MULTIPLANE_REFERENCE 0  #define MULTIPLANE_ROTATED 1
> +#define CURSOR_EDGE_SET 16
>=20
>  struct p_struct {
>  	igt_plane_t *plane;
> @@ -274,6 +282,80 @@ paint_squares(data_t *data, igt_rotation_t rotation,
>  	igt_put_cairo_ctx(cr);
>  }
>=20
> +static void paint_triangle(data_t *data, igt_rotation_t rotation,
> +			   struct igt_fb *fb, float o)
Is variable o really needed to passed ?? More like a unused variable for me=
 which can be direct as 1.0f or something.=20
> +{
> +	cairo_t *cr;
> +	unsigned int w =3D fb->width;
> +	unsigned int h =3D fb->height;
> +	rgb_color_t color;
> +	int i;
> +	bool rotate_180 =3D (rotation & IGT_ROTATION_180);
> +
> +	cr =3D igt_get_cairo_ctx(data->gfx_fd, fb);
> +	set_color(&color, 0.0f, 0.0f, 0.0f);
> +	igt_paint_color(cr, 0, 0, w, h, RGB_COLOR(color));
> +
> +	/* Build a simple upward triangle using horizontal strips. */
> +	for (i =3D 0; i < 9; i++) {
> +		int strip_h =3D h / 14;
> +		int y =3D h / 8 + i * strip_h;
> +		int strip_w =3D (i + 1) * w / 14;
> +		int x =3D w / 2 - strip_w / 2;
> +
> +		if (rotate_180) {
> +			x =3D (int)w - (x + strip_w);
> +			y =3D (int)h - (y + strip_h);
> +		}
> +
> +		set_color(&color, o, 0.0f, 0.0f);
> +		igt_paint_color(cr, x, y,
> +				strip_w, strip_h,
> +				RGB_COLOR(color));
> +	}
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
May be not now, But if feel that all these framebuffer creation for Triangl=
e, Rectangle, Square should be put into some
Helper and should be reused.=20
> +static void collect_current_crc(data_t *data, igt_crc_t *crc) {
> +	if (is_amdgpu_device(data->gfx_fd))
> +		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +	else
> +		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc,
> crc);
> +}
> +
> +struct cur_data {
> +	int x;
> +	int y;
> +};
> +
> +static void set_cursor_positions(const drmModeModeInfo *mode,
> +				 const struct igt_fb *cursor_fb,
> +				 struct cur_data positions[5])
> +{
> +	int cw =3D cursor_fb->width;
> +	int ch =3D cursor_fb->height;
> +	int x_min =3D CURSOR_EDGE_SET;
> +	int y_min =3D CURSOR_EDGE_SET;
> +	int x_max =3D mode->hdisplay - cw - CURSOR_EDGE_SET;
> +	int y_max =3D mode->vdisplay - ch - CURSOR_EDGE_SET;
> +
> +	x_max =3D max(x_max, x_min);
> +	y_max =3D max(y_max, y_min);
> +
> +	positions[0].x =3D x_min;
> +	positions[0].y =3D y_min;
> +	positions[1].x =3D x_max;
> +	positions[1].y =3D y_min;
> +	positions[2].x =3D x_min;
> +	positions[2].y =3D y_max;
> +	positions[3].x =3D x_max;
> +	positions[3].y =3D y_max;
> +	positions[4].x =3D (mode->hdisplay - cw) / 2;
> +	positions[4].y =3D (mode->vdisplay - ch) / 2; }
> +
>  static void remove_fbs(data_t *data)
>  {
>  	igt_remove_fb(data->gfx_fd, &data->fb); @@ -1159,6 +1241,114 @@
> static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t *=
crtc,
>  		igt_remove_fb(fd, &fb[i]);
>  }
>=20
> +static void test_rotation_with_cursor_movement(data_t *data, igt_crtc_t
> +*crtc) {
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	int tested =3D 0;
> +	int i;
> +
> +	igt_require(display->has_cursor_plane);
> +	igt_display_require_output(display);
Can we make these checks inverted, first check for display and then cursor =
plan ?=20
> +
Can we make these dynamic subtest so that if it fails on some connector/out=
put and passes in some it doesn't fail the entire test.
> +	for_each_connected_output(display, output) {
> +		igt_plane_t *primary, *cursor;
> +		struct igt_fb ref_fb, hw_fb, cursor_fb;
> +		drmModeModeInfo *mode;
> +		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_sequential;
> +		struct cur_data cur_positions[5] =3D {};
> +		uint64_t cur_w, cur_h;
> +
> +		mode =3D igt_output_get_mode(output);
> +		igt_assert_f(mode, "Failed to get mode for output %s\n",
> +igt_output_name(output));
> +
> +		igt_display_reset(display);
> +		igt_output_set_crtc(output, crtc);
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +		cursor =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_CURSOR);
> +
> +		if (!igt_plane_has_prop(primary, IGT_PLANE_ROTATION) ||
> +		    !igt_plane_has_rotation(primary, IGT_ROTATION_180))
> +			continue;
> +
> +		prepare_crtc(data, output, crtc, primary, true);
> +
> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &ref_fb);
> +		paint_triangle(data, IGT_ROTATION_180, &ref_fb, 1.0f);
> +
> +		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR, &hw_fb);
> +		paint_triangle(data, IGT_ROTATION_0, &hw_fb, 1.0f);
> +
> +		do_or_die(drmGetCap(display->drm_fd,
> DRM_CAP_CURSOR_WIDTH, &cur_w));
> +		do_or_die(drmGetCap(display->drm_fd,
> DRM_CAP_CURSOR_HEIGHT, &cur_h));
> +
> +		igt_skip_on(cur_w <=3D 64 && cur_h <=3D 64);
> +		igt_create_color_fb(data->gfx_fd, cur_w, cur_h,
> +				    DRM_FORMAT_ARGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +				    1.0, 1.0, 1.0, &cursor_fb);
> +
> +		set_cursor_positions(mode, &cursor_fb, cur_positions);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(cur_positions); i++) {
> +			int x =3D cur_positions[i].x;
> +			int y =3D cur_positions[i].y;
> +
> +			/* Reference: SW-rotated triangle, no HW rotation. */
> +			igt_plane_set_fb(primary, &ref_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &ref_crc);
> +
> +			/* HW path: unrotated triangle with HW 180 rotation. */
> +			igt_plane_set_fb(primary, &hw_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &hw_crc_atomic);
> +			igt_assert_crc_equal(&ref_crc, &hw_crc_atomic);
> +
> +			/*
> +			 * move cursor first with no rotation, then
> +			 * enable primary rotation while cursor remains active.
> +			 */
> +			igt_plane_set_fb(primary, &hw_fb);
> +			igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +			igt_plane_set_fb(cursor, &cursor_fb);
> +			igt_plane_set_position(cursor, x, y);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +			igt_plane_set_rotation(primary, IGT_ROTATION_180);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			collect_current_crc(data, &hw_crc_sequential);
> +			igt_assert_crc_equal(&ref_crc, &hw_crc_sequential);
> +
> +			igt_assert_crc_equal(&hw_crc_atomic,
> &hw_crc_sequential);
> +		}
> +
> +		igt_plane_set_fb(cursor, NULL);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_plane_set_rotation(primary, IGT_ROTATION_0);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_remove_fb(data->gfx_fd, &cursor_fb);
> +		igt_remove_fb(data->gfx_fd, &ref_fb);
> +		igt_remove_fb(data->gfx_fd, &hw_fb);
> +		cleanup_crtc(data);
> +		tested++;
> +	}
> +
> +	igt_require_f(tested,
> +		      "No connected output can be tested on first CRTC %s.\n",
> +		      igt_crtc_name(crtc));
> +}
> +
>  static const char *plane_test_str(unsigned plane)  {
>  	switch (plane) {
> @@ -1358,6 +1548,14 @@ int igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  		test_multi_plane_rotation(&data, crtc);
>  	}
>=20
> +	igt_describe("Rotation test on primary plane with concurrent cursor
> movement");
> +	igt_subtest_f("rotation-with-cursor-movement") {
> +		igt_crtc_t *crtc =3D igt_first_crtc(&data.display);
> +
> +		cleanup_crtc(&data);
> +		test_rotation_with_cursor_movement(&data, crtc);
> +	}
> +
>  	/*
>  	 * exhaust-fences should be last test, if it fails we may OOM in
>  	 * the following subtests otherwise.
> --
Thanks=20
Jeevan B
> 2.34.1

