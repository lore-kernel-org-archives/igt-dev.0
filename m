Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A08FF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 09:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A824010E640;
	Mon, 27 Apr 2026 09:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUepfIha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B6510E640
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777280643; x=1808816643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C9REcUVCFKos1nVCtrkCVJ4BxkUZBzUeimeuo9tR/z8=;
 b=TUepfIhaUBsk3Y/G7QodNdqjiOw4F8BN3OiAWuf08EpcuXOfMue/Yfq0
 b8prDIGd44+FfWk/m1gkb08+JTWWmSz/0HNnJ1On9zkwNvI3b41y3/Sol
 JCxUN17Ghlx6EtdGrArDhycIQR9QirtJVQeM1oT31BJ2PIO2OjnKsbgDE
 ax6g4EwH8jdXQ8QahtwlekenM0N9oeMtOtAGyRxOFwgws0balvfYTT3fM
 CnE5Nh8LZgidoGZVZ80cGCwkhrhbnZi8pQI682bE0Ydv7LRKvWmkRxmL+
 x4A/CrL8lUrzHLlMinJ/KIrhH/g3OknObZShLCah5UKgorbOGRm/DEr0q Q==;
X-CSE-ConnectionGUID: H4h6ShxzQoiDWNXoUswqGg==
X-CSE-MsgGUID: Q8cq6P1oSkC5xk/nR3nmFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77321880"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="77321880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:04:03 -0700
X-CSE-ConnectionGUID: st3uRImNSsml4PajkCdCxA==
X-CSE-MsgGUID: 2iBCoDF1RpCtaMwvbk3okA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="237910406"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:04:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:04:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 02:04:02 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 02:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT83jJCIBF3dqzWJySKqLaAoArt5CzttiGzlBoYMSIoKPFYuaiewp7eEtK2EQRow76OnEVTe9ycLNZ4xmu7BMi0Bo8kRGHPMlJ6d3saDLywevNL1lhWzCvs4O+yAADO9ptTrqYO1yHICdIfW2F/zPl5YCpEf2XIStFj1N/9gcpDgImPuD4gDKMbvjCmqzPZKtXUuko9oUOooTbfdQsledky5jp5hshnYftq0b90FJOgI3zpfWbtekus9ctATURBWx9rpjYz/SFi+Zvs7BhzRtfOHLai+R3NmPuaghU/hG28h8MG+18nzz+9KnNTwrFk5EzkOxRQnJyGKzde3jINP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIR6RPPsxRmRzvgUHBY3rJYQekMoi8+vHDFGO2rm4Dc=;
 b=H9xSQR+bzj65GlMbBzShkajvBGXuRVoMi05OJ/IAK1zN9WlMCfzpvO6m6O+mM3OXNVP+jaS2PLSNq2XtZh+zr994j4UwG43hQvjyfOfk0Z6QBBMgeVTXoLAire8VdUgK0u0Eck2DHYTaMNMWpSVBZ6d9dbrPrs42nuzbQuwaZLomHMFvJjQpovBqzOsBR7ht7jHLeUY2JykL9HMIqjNsclnWC3rODwDqKapDj5hYgHMyt7nyPLDgYb3cU36EPj+AGxIzDJGQqDCkzl9NCk/Sh2hvMuR5anAQ5DKlIqLAAqW570aWZmReBXlNqV3jSPL32j5Y1hOs2Ixi1+oUgKkJ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Mon, 27 Apr
 2026 09:03:56 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 09:03:56 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] lib/igt_kms: Add MST bandwidth-fitting
 support and helpers
Thread-Topic: [PATCH i-g-t v1 1/2] lib/igt_kms: Add MST bandwidth-fitting
 support and helpers
Thread-Index: AQHc0VLF7a9r3II0+UKdeOBtHP/WqrXpbKSAgAj8/7A=
Date: Mon, 27 Apr 2026 09:03:55 +0000
Message-ID: <PH7PR11MB6796954BA10F2F9426D92254E5362@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260421061114.2262809-1-sowmiya.s@intel.com>
 <20260421061114.2262809-2-sowmiya.s@intel.com>
 <c34cb162b9ed31f40153a375348f52d7d2ce8b5f@intel.com>
In-Reply-To: <c34cb162b9ed31f40153a375348f52d7d2ce8b5f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jani.nikula@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA2PR11MB4939:EE_
x-ms-office365-filtering-correlation-id: 7308dbdd-d141-4bb9-79df-08dea43be98a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: n8p6W+GXeT5d7Ia5MEHvdeY+DjdY7skEyjNMFvTpjjdSXPOOYSzWfEQ38pHqzwG2bLtNA/EMoJX3el1f0lzfY0wM1p7mtgS510uC3WuQM4I1vOAGUMPc+C8GbKpRdvMHIGC1NWTXdmQhfdQ3ymbQptJtak+lIUzfKegvwY9dsEIbjtBJMbVICA+L1imZL9mQJUFQZtUwnc96DyBwp5Efkd7mXQk951YgzUtmA9fT/Hmj+pA/pgBy1tC+5R1F1Wko4GYVadMMqcZtmU0p8ljaREV8UeDzLLEGQ9cNv/AULSMsu8hWex6WCY2cXlUXrHeexhmA9Vn0kq7cmjqd/eFNIvBDEgcUYdorOic1I40y9tU4YoLU8Jzg1WUPWFyAbp1r+M6XQxRc4Nxj8q0O//6Q5zeb6VP70O+8ByHkiz4r+hOfsYgRYrWZ/QMjO/U4aJxNAq0OcrXsd61NIo7j/R3Bx5t8vUhe/sEgsncz/Cfz3/iXz/46Yha9eeQHJHtx9hgpT9nEeXqBHLb6KiaejaAc/Xj7SNt2nE69s9ItULpSl+Lv3W23v/+eeCn5pGFH1FqK8gPTjI5gdKWwLn4JspECTg5YDX+78ZIwGXc+6v2I8z13oXVefcch4O6/RZ7AtBuOiv1i/DnV/pXNq4VYtMkfZCMU21QlMmev0DwkEmZ+8fBkq4AzV/qa8JWgM0Ijhve9AwZGZRMMj7DKR/NhC74eRqD2BCEx0y7cYiz7nCporztJTggzwsU05R8ssUUpMPNKpD/S3M6V3DiGNZ/UBjR2F52hDNpI7juLOKAXd1L9LrM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dULs0sgYy0zJC8PBe3E51B6oyKVVft0AKgVWXg+RHkoAEAkRfdladJ6kntsI?=
 =?us-ascii?Q?Jk4Ir3n2cyBM4QcPdg4QOJ8IzOHc3wx/oBZC/sHDhEo2aGTPJVQWgwgQXuhN?=
 =?us-ascii?Q?s3d/p3Jhu+3/Whs5ZvMR6EAvUGlcFgqJUWfkTQy6w8Z8sx1fa5vTfbpIpKqP?=
 =?us-ascii?Q?KiVn1AMVkug8KptTXpuo06Ao5LRpIPb1qx7/mODum5sTZKmqXUj+TOQSAjw3?=
 =?us-ascii?Q?6MigASVjbIn8CSAlPgByQ+h6uOfENwWX9llq32lCZK3opf1W8qnUV3ecg6EZ?=
 =?us-ascii?Q?WUr6JNo17uubcekoR8LQJjPmzDcLYo1Om/cMU7QrqYwogV85EGvSCNFQODBy?=
 =?us-ascii?Q?wylnE34mc1TpXfXFN9ieWxYTEdX6tYNH791fXwFlxrOHepUvxFRsTzvrAFK8?=
 =?us-ascii?Q?4Tpaz/rk4EanFYt5D7Zwq8AK9bXqiyueUHIkd9okIC1cSug9PxmrtW5SzsAi?=
 =?us-ascii?Q?qeNxA9r2V9UKtXUEGyVhSYL2P5e6yncszOP1uui+a0VJ3M2qodjo1QVyazfC?=
 =?us-ascii?Q?9IrWKVsSSPDm4A7o4aO1sXThVlmM1dANaSCaV5jx8vrMDH2I7Ka7xfEg1FPV?=
 =?us-ascii?Q?Pp7xmDgNbQ0LUTzu72t8JjRfBEBwUJACGf/5UsjTT9hOQCNCPE7BNn8AA8Xy?=
 =?us-ascii?Q?xwuxLmZekf479LCoeRkE7TmJldcKmcRzYJJ2tmzF3hGlCMlFliwWFWum+/Pg?=
 =?us-ascii?Q?UKlVZBlTgwlRY5CVHvMlqps1incT69qEF2kUkyRa7vA0wgts2iNd1H6/z5G0?=
 =?us-ascii?Q?WuVzR2gwHNDTOO5LgEckyBxM/z2HtMYb4GmQLplJLccP2aP/DRX+bMwZkx+j?=
 =?us-ascii?Q?0rFNh4VdrjyiwVJ0mECpYlzrUzMs2gklot3qpb+YXk/zXoBNMB+qEUVDfGzF?=
 =?us-ascii?Q?2pYJY61Le5HJAATrjU3Lpg4B9rbiCMrH60bYXjTYEgjy5NAHu0uC6s0eTGC6?=
 =?us-ascii?Q?XwMBx8huE7jM4JPcAKsA2YP8zdaxIL29qF83HzGR149Zwoh7T6uRz+Jrp9cq?=
 =?us-ascii?Q?c9JpLs3o7M0h6n06DSfvfHDzbxTktd4SX3HdDhYQJK7SLIgS97axqvQY5ihs?=
 =?us-ascii?Q?FEfAr5oIUxw9vofdpBsI+o1IU9nEhTWC8W035g9Va9M/G6O/wM6Ny1bfhZYa?=
 =?us-ascii?Q?B7wKSiKSSV4UhPn1LN0te3PZsi+G7Tg2QmghCD9n1Zzqz41CKNI8i5BI2EKN?=
 =?us-ascii?Q?mGZSfp50C1ydRRJyn943063EoaQB1qMH6vMJJ67l5xnuHtlMj4hs82Ri7bNY?=
 =?us-ascii?Q?n9MQ+i6qJES0OvS3c+UimrjCtm63IeMP+1JoqboYZjeg4jqyNxeKV/Zez6qg?=
 =?us-ascii?Q?IJdR032LkKS0XrpvVJbD/rdK5k8CmoXiwU+Hl5+EMVwl8WS47QgJ/1BEGegY?=
 =?us-ascii?Q?jE+3aK27LfBLpFQsFumwOwJrENJU0lQxJcTypomqhM3oM7Rls/yclv4fHFcs?=
 =?us-ascii?Q?qTcPqO/MerrU1gssfHQafX1AkayiXyJS3QFUyGEECzw5JLL9HZOsA5DxADTA?=
 =?us-ascii?Q?JpvCIs0AE2osnLBiWKDkpL2jgvJqn1M/H6hbNNeQv1XGjDOzEh0766XwHl1K?=
 =?us-ascii?Q?uHt+34NiEc+0q3VmsA3aK3foU1dt2U9ynq7GHtsMN9OUPfTwVkPJAHHDsXpH?=
 =?us-ascii?Q?v1PivBLYB5EN2xfwZ8eOt2CjijgvP2yONjzV85H4tdxOYUCYYIdMtceZyKHW?=
 =?us-ascii?Q?0nrAMrKDNjLurWFI3h/c8+Lbw49caVFbP3Cjqydqejgcef5F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CIlzbChO+hgOFCZKeTEejVFzV+EtMuV+Q/m+as0Vr1FHs53RYZoZJLh64wQ1HKeIH5TzYQrFmVPIIq8lOpy+WhHmi7pipC06Co5Rv97z/h2atWt0vcEaPUexIKQShWxQoQLe8ndxLti5r2jF86fBCOzish9QpxJUQXm59InnHEqrOFMBKUVU+jf3Wqjdb9FJeTZrCfy7IuM0JsE02Gyk7JUFh1+RxwN+FzoK0nC7jk/bCZzT01sfj10/qCfjX7V8vpS+IpB0TJDxaaM9U3LIAmV/LFPhdZh/oPRstQ8BjPW2L2oXyEfoXfSjkTv0ZYr/eDDG94B2CvrZfklIJ9lrXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7308dbdd-d141-4bb9-79df-08dea43be98a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 09:03:56.0961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FsrT+3od+LzBdpWIQMfebYjcjLjBEbm3xhzTZipkGwRKSwvbGsHkrZ4qFOtLXEwKxTLpl28fTqaOu8lP9J4//w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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

Hi @Nikula, Jani,

> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: 21 April 2026 17:39
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_kms: Add MST bandwidth-fitting
> support and helpers
>=20
> On Tue, 21 Apr 2026, Sowmiya S <sowmiya.s@intel.com> wrote:
> > Add helpers to handle shared-link DP bandwidth fitting for
> > MST/daisy-chain configurations.
> >
> > On MST hubs/daisy-chains multiple streams share one DP link and a
> > joint atomic commit can be rejected unless modes are chosen to fit the
> > link BW. This will centralizes MST detection and fitting so tests can
> > request fitting only when required.
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++  lib/igt_kms.h |
> > 3 +++
> >  2 files changed, 36 insertions(+)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 2d758b63c..0c7965954
> > 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -2744,6 +2744,7 @@ static void igt_output_reset(igt_output_t
> > *output)  {
> >  	output->pending_crtc =3D NULL;
> >  	output->use_override_mode =3D false;
> > +	output->bw_fit_applied =3D false;
> >  	memset(&output->override_mode, 0, sizeof(output-
> >override_mode));
> >
> >  	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, 0);
> @@
> > -3227,6 +3228,15 @@ void igt_display_require(igt_display_t *display,
> > int drm_fd)
> >
> >  	igt_display_reset_outputs(display);
> >
> > +	/* Detect MST outputs after they are fully initialized */
> > +	for (i =3D 0; i < display->n_outputs; i++) {
>=20
> for_each_output()
>=20
I will update.
> > +		if (display->outputs[i].config.connector &&
> > +		    igt_check_output_is_dp_mst(&display->outputs[i])) {
> > +			display->needs_bw_fit =3D true;
>=20
> So that really means "has DP MST output"? Why not name it according to wh=
at
> it actually *is*, not what it's used for? Or add a function to check for =
that
> instead of caching it and dealing with all the troubles of caching.
>=20
Since MST may reconnect during HPD events, I'll remove caching and always q=
uery the current status as needed.
I don't think a new function is required, as igt_check_output_is_dp_mst() a=
lready provides this information.
With this change, display->needs_bw_fit will no longer rely on cached value=
s; instead, it will directly check whether active_mst > 2 and apply fit_mod=
es accordingly.

Regards,
Sowmiya S.

> > +			break;
> > +		}
> > +	}
> > +
> >  out:
> >  	LOG_UNINDENT(display);
> >
> > @@ -5372,6 +5382,7 @@ bool
> __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
> >  		int ret;
> >
> >  		igt_output_override_mode(output, mode);
> > +		output->bw_fit_applied =3D true;
> >
> >  		if (__override_all_active_output_modes_to_fit_bw(display,
> outputs, n_outputs, base + 1))
> >  			return true;
> > @@ -5441,6 +5452,9 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
> > {
> >  	int ret;
> >
> > +	for (int i =3D 0; i < display->n_outputs; i++)
> > +		display->outputs[i].bw_fit_applied =3D false;
>=20
> for_each_output()
>=20
I will update.
> > +
> >  	if (display->is_atomic)
> >  		ret =3D igt_display_try_commit_atomic(display,
> >
> DRM_MODE_ATOMIC_TEST_ONLY | @@ -5461,6 +5475,25 @@ bool
> > igt_fit_modes_in_bw(igt_display_t *display)
> >  	return true;
> >  }
> >
> > +void igt_display_fit_bw(igt_display_t *display)
>=20
> I probably haven't always documented every function I've added, but thing=
s
> like igt_crtc_for_crtc_index() are pretty obvious.
>=20
> I have no idea what this actually does.
I'll update the function name to something like igt_require_mst_link_bw().

Regards,
Sowmiya S.
>=20
> > +{
> > +	int active_mst =3D 0;
> > +
> > +	if (!display->needs_bw_fit)
> > +		return;
> > +	for (int i =3D 0; i < display->n_outputs; i++) {
>=20
> for_each_output()
>=20
> > +		igt_output_t *output =3D &display->outputs[i];
> > +
> > +		if (output->pending_crtc &&
> > +		    igt_check_output_is_dp_mst(output))
> > +			active_mst++;
> > +	}
> > +	if (active_mst < 2)
> > +		return;
> > +	igt_require_f(igt_fit_modes_in_bw(display),
> > +		      "No valid mode combination fits available MST link BW\n");
> }
> > +
> >  /**
> >   * igt_crtc_refresh:
> >   * @crtc: CRTC to refresh
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h index fcbb6a5ad..5c60e7bb4
> > 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -506,6 +506,7 @@ typedef struct {
> >
> >  	/* bitmask of changed properties */
> >  	uint64_t changed;
> > +	bool bw_fit_applied;
> >
> >  	uint32_t props[IGT_NUM_CONNECTOR_PROPS];
> >  	uint64_t values[IGT_NUM_CONNECTOR_PROPS]; @@ -536,6 +537,7
> @@ struct
> > _igt_display {
> >  	uint64_t *modifiers;
> >  	uint32_t *formats;
> >  	int format_mod_count;
> > +	bool needs_bw_fit;
> >  };
> >
> >  typedef struct {
> > @@ -1286,6 +1288,7 @@ drmModePropertyBlobRes
> > *igt_get_writeback_formats_blob(igt_output_t *output);  uint64_t
> > igt_get_writeback_fb_id(igt_output_t *output);  void
> > igt_detach_crtc(igt_display_t *display, igt_output_t *output);  void
> > igt_get_and_wait_out_fence(igt_output_t *output);
> > +void igt_display_fit_bw(igt_display_t *display);
> >
> >  igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>=20
> --
> Jani Nikula, Intel
