Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD082CA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 17:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D7610E27D;
	Mon,  5 Oct 2026 17:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7qEGXB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057E710E27D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791221387; x=1822757387;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JevINwEGFomdHfvVxP+thTq5WL6mMkRCoTPYy5iDhrk=;
 b=n7qEGXB1eFjhNUt7Eo/llW0YiDqjWEgNZKmjK68GHSubtxbvgxQe0Iz8
 F2IkijALfgBF/mXTlLXjTzmo4lXCEYf0weWHoZtIN8JegJOe654ZIAJ6V
 xXtM7lthYYWtlkl/VH83RW3Q6Yq3plRSzDCEdG3r35DNLqyY9+iCDnx0B
 GxcrUsjaNqDf9auSodA/29AITxp/WyS2H75e6RBoHPs3jZ8SJ52908gDz
 m9RW3JH++7EGQJRpiCGDE7Cu7FeAc+KJxgJNbtQeTDK+RFWvgaZhmAmDb
 XBSATpYC/FrliiprotNPfrPyd6qfShitSQ9UxcCcAbQPP5aAWKwlNTlxF w==;
X-CSE-ConnectionGUID: s8maDi5oQVe/uGssPqU0bQ==
X-CSE-MsgGUID: bPdVhKLNRWOMLz2kW1qlRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117416206"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="117416206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:29:47 -0700
X-CSE-ConnectionGUID: gpfkAyUfRcu6ZUy6rET4Hw==
X-CSE-MsgGUID: qLuDR5UVQ4aoW5gQ6qzHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274673192"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:29:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:29:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 10:29:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 10:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MudDCj8ymabHtz/sWJLRhvAqyoj+/1842zhzcbR1NmfxL2VyHmv6ejlLq+jfj9AGRAvm+miFE9ApjHVzTl/Mox6tUJnKqGYWF75TXqlwjVFUG0bIS9TJVfFw71vvPCQig1JrQZSOTHbstA588oOS+Rr5sbiR6iaWJ+2sbkAZg6Y1kKIlu6o0wrKSL0hNHn3KCSAaBuRc+2gUqShhaP4zGGF1gdZPLU/L578TQ4xwmHtRU5Yw5Pcw2dwrFQeLG/dQ92D/lHwav5s6FF8IxrOwgbZvMI7MAMdYkySlxmKA2BTRKR52dsPVtb2LJsOC7GyfJSHr4aFLgRMHyY/lGXnW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfhdqrq6JqcDOrmd/7FxHeQ3OOPAS+TKRcbvmysUlRs=;
 b=Itpea9wbKMzraT/3VrWLwTnvsWALN0knrOAFssBAjwLEXvFIa9b+Fe+7QUEZXuDV7RBWt1NWnzedV0wTVHxcsYKyElgaR68dacvsZziKD0kxuf2/CqzW9l01SQ/8k6yfeaGlkSF0qFo/CPetjNahN2ooJ+zBGKQ8rGeb9NL7d8xjPbenjD8okNkdD/PsVsiigzohU5CC+YpNnydoxuKIPsk6fxrTVQmloO5aCqqshVxmpNMhBwnuVkac5lfsZUDkB8UW/aT1wEZUstBqIHh2QEIPZkAy6lFZVvnfKcJ67CGPopUrC3hkfa271sTPlYqrFAMUklj8ivw1p1uToQnSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by EA8PPF8DD15FF6B.namprd11.prod.outlook.com
 (2603:10b6:30f:fff5::795) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 17:29:42 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:29:42 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 3/5] tests/intel/kms_alpm: add ALPM test harness
Thread-Topic: [PATCH i-g-t v1 3/5] tests/intel/kms_alpm: add ALPM test harness
Thread-Index: AQHdT/GpWyumtHKeLEWWUtZuAmjF6LbvPQzQ
Date: Mon, 5 Oct 2026 17:29:41 +0000
Message-ID: <MW4PR11MB577627FE125C0FCFFA3640D5DA962@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-4-sowmiya.s@intel.com>
In-Reply-To: <20260929090454.2796967-4-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|EA8PPF8DD15FF6B:EE_
x-ms-office365-filtering-correlation-id: 8fdd34cb-b9eb-4f04-efa3-08df23063d97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|6133799003|3023799007|11063799006|5023799004|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: RCfttB7AVGsZxMxJzMzgSSMEVSu+W9FzeqYVbp2yKQkTvyd/6BUpUSEFVGXdizM8wZRwwNJT27EvZIXBG0TaanpC+TqshXWomobiqA6Nnkf68KpQzvfE2z475k6xsIdYG+b6uyp8ZFtoM1RN322b5JYixMPg4nvI9o3XDwrQ/7wwvJjl2H6cZjkiFGgfcTGbNUNKUnkSi+8QTHHzLw3PfpYSJ4YBHbllo+JhFchUwsIXFZSLKnssEDXvh9omF25le9KyJHTOPG27G+lf9VAzvjwEZIrigeOF0CXxltb5PMq+jZhTU9nco4fBnBfGCqU+McMhwKLOD/aTNYtBQRXZBMof9Zc80FQINjX1PzQuYq+Ek4aeYxNHL6kVz/9mTMOfG9X17YLeOtexUDXLyGNeO6PNQ6hvDLCpW7CjOaZf52QzbJSmNvMl4dywjbX/VkrGw0o1wAWIdubKso9JYywqSVbu+9jH1ZAL3MoCNdync4RRrYA/0nDZOJTqEvu6QBecLyei9aIoeIdCzH6ZgApYzL3t+iCxLpbQu0zn6rufrl3ekOHlC2L6n5GStS3ZlsgeSz1KQqIOzjT5VTbdBA8tegNqP5P7m3RDMlwNa76Q16QDy2eTYn61zo+zNk3dnsmeB39BvbQ08pdJZCQsaMJft1gtQ6WZISaj+0gGOtvA/t91fYIsLSNqwatNsMB07mLt+UZgyh3nptFVwNzQ8LspOFdfAWs2Z1HceLfApfKJnV4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(11063799006)(5023799004)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xcJRraDtCpWQvHsarVAcx0It3AxbpxsRHvp2hhSesz17cB5t40KX3x3l+U5l?=
 =?us-ascii?Q?xcRMGV64FGDk4wHjZ78XuW06blsYQUR6QKyTD/w4jHkmKXo73Nh8gMhJldcc?=
 =?us-ascii?Q?xu5klMqze71A2EfUYOUd1ytwyCpy8ztSU029+XF78Q1BoVQedEC9u7azcUc4?=
 =?us-ascii?Q?XJZJCRBWqjUVfqOTBGrryaEV1+DZstTi0YOMb/GEtezgu/9zeQWkWMpl5U8o?=
 =?us-ascii?Q?lPAss0+Ki10HXd3dI3J4jki+Vfy/elhCg+Mu5atYhfhIBxOd3zHzSs79n0tc?=
 =?us-ascii?Q?JekCbgopVhB7Xw3AWp5FvcYv8xlfPg7n9GBe2HYnGzFQVohiOajeVCTRSVJT?=
 =?us-ascii?Q?MHgaDcpuESzGNaf+7X74wZfjwrRUC65TbeJeQt2kR72MfLtNYX0fwOat7s9l?=
 =?us-ascii?Q?iSSjYnff6aCaCiY57ava0GT4kJ0B+vn/YS3M0PXBpb6AmeOzgZIOEuMYacXB?=
 =?us-ascii?Q?tqtTwoYhdchrJL89MHhYJQslhKVjV3bVcSuxOLpbzPxWpnaQCb2BNQjnf+k7?=
 =?us-ascii?Q?ASbQj3vr2j/rsg5Mz+KCGLIS+8IxQONc00I+J87ckOgmBJVbTiylY6qwR9Ib?=
 =?us-ascii?Q?vBNPgiYKg4DKiRhzS9Hq89DwyAYR+jzoa/0v+683/w+tVTauT+H7uGp815CD?=
 =?us-ascii?Q?Sh94sRLsWoIm/MLYPRXfOU/9KDRR3u1nAY3kRugYtw5TU0tMkeEnNffSqbdg?=
 =?us-ascii?Q?H2BsE1Xw90fH4A/IsZ5ScEUYNoFlRHPMcPq2sxSiGb+Td0NL8LyxL1Ul3Wri?=
 =?us-ascii?Q?UpYyZVISI+uG5d4kgVxZbrJmNrznsFB2hiy7BHcNPM2g3qJErrT1ocAat25B?=
 =?us-ascii?Q?dY78pZQdumdMp4WAEcvyvPBRcXosIMG/jz72JRtm8qnT4WodPvZb/ku/BdQQ?=
 =?us-ascii?Q?kHgn7XcJfqMb8+FpHn6LYKCObSqFRAOu4hM/9Vjx2fTU13Ivn801jEN+jnwy?=
 =?us-ascii?Q?RDZBS77sR5+ZCnxjpn5wD+f20XXFGVXWncK8AUeCOkfJMmuiNpXEs7blbQMR?=
 =?us-ascii?Q?une2EhoiQYSgULMhk8VWptZRwoH1yhRIXGkpMsnpBNnYpgTUsiEvCKItfbQJ?=
 =?us-ascii?Q?lXY0PEkK8dk3OPxnKDy6+xYtyc67LFas5tWG7GFYZsMqCLBNEt4KY1VgJVAo?=
 =?us-ascii?Q?+MxBbyCXl5B1/6jl8A34/WwKbI6nHPNIy0B+LapSJTTRkhcxHjpzD/SW0M+w?=
 =?us-ascii?Q?5rCHlxqYuS4aIfdh3JwMSIsCO3JsEWtM5tDZmRsqyZlJcrDMl0GU9VpBCYuj?=
 =?us-ascii?Q?LcrS/j/n3LI1SUvcW50Kb8DyHdd/7p8NfeR9LCCdt1LSPsgfua8XEgCDwrBl?=
 =?us-ascii?Q?rWhGYKZP9aCGYLDxjvmfooPOudbe/BkZulgOOCtnadmAnWRwIBOXObhmTKj6?=
 =?us-ascii?Q?tD3s0Ffv1d7UtQgxqhXfDIrV7IZE/HIQThsa1CuUacZAFg1MF94RFfcKe9Ld?=
 =?us-ascii?Q?J5QfYjRsTRhll6/4/DG5cgyDHFYEpXJ4iGS5B+uzjxuiF725g6pNm/CHumZy?=
 =?us-ascii?Q?eVEufxBGWN2dsKF3+2HnAbOtS1VLUt66Rup/veFMtuhgZMbZ9LYV9wWygfx7?=
 =?us-ascii?Q?jcx6dEPjqU7D0AI8FJQ2j/eaITSNAdIVjwDrB2A/4I4ypLRl0AsvUsR7PIMJ?=
 =?us-ascii?Q?z8PitlV8Eqk2HkFPA8b3YsN3IslLolH7qk16zt7+hod0QdnfQGYp2DauKnKY?=
 =?us-ascii?Q?ZK0X4qqqdrlDD0iY/jz9tFh8/yZ7wuKrgeoh4ItLqHzmPM/MhZLBlw4q8Go3?=
 =?us-ascii?Q?USbtZfnSkw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: otcATIoUpwlrtPXHf+M519OLr0183I+fZtfwsGcDkxTizfhgcGTk6lZAGYUoWQgWkIODtNqGwpUIBXHIfcEkgTKKq/8PbGc3j88Gw4rKYwnjGzpKryPbHPW08yPM0bXFArT+VPpFjwv4iubbCSgKYf3qrMicxsBvBgu5EwnANay3sH+swUzFUBWm5TN1EV+R6yMw3gT3recVTif6knZrdUi0Qk8VE4WsE/hJKDJHFZyYIxgSnO/5IeNTs1/T8L/3eWMaBxfH56L+vVyIujVvD93LR4Wm+bsyp94H6QBxvt5YGoMglW03NQwKMGoMQsNqnfDk2dtztg8jF3NNNW3/BQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdd34cb-b9eb-4f04-efa3-08df23063d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 17:29:41.9966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d650CyKn/DUcv0foCcCh20x5pOI4f097JiuKwnnTetpAJEVQZUMcXSZSm3iQi0Kxhhd9gtbawFXixwBpqnAdog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF8DD15FF6B
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

Hello Sowmiya,

> -----Original Message-----
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Tuesday, September 29, 2026 2:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1 3/5] tests/intel/kms_alpm: add ALPM test harness
>=20
> Add test_setup()/test_cleanup(), which light up the output under test wit=
h a
> pattern FB and tear it back down, and run_test(), the
> igt_dynamic_f() harness that enumerates ALPM-capable outputs and CRTC
> pairings and drives a subtest's test function over them. Used by the ALPM
> subtests added in the following patches.
>=20
> require_alpm_capable() is now called from run_test(), so it no longer nee=
ds
> the __maybe_unused marker from the previous patch. test_setup() and
> run_test() itself have no caller yet at this point, so they are marked
> __maybe_unused until the subtests added in the following patches call the=
m.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Assisted-by: Gnai_Claude:sonnet-5
> ---
>  tests/intel/kms_alpm.c | 81
> +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c index
> dfdccd74e..b38e7f8ce 100644
> --- a/tests/intel/kms_alpm.c
> +++ b/tests/intel/kms_alpm.c
> @@ -306,6 +306,51 @@ static void alpm_dump_status(int drm_fd,
> igt_output_t *output)
>  		 status.lobf ? "enabled" : "disabled");  }
>=20
> +/*
> + * Light the output up. ALPM on an idle link is reached via LOBF, which
> + * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the mode
> +is
> + * committed without ever setting VRR_ENABLED; the driver still runs
> +the VRR
> + * timing generator on the platforms that support ALPM.
> + */

This only holds for alpm-lobf; on a PR-capable eDP or DP, ALPM comes
through Panel Replay. Also, VRR_ENABLED isn't "never set":
igt_display_reset() in run_test() explicitly clears it. Since LOBF
depends on that, You can mention in the comment.

> +__maybe_unused
> +static void test_setup(data_t *data)
> +{
> +	igt_output_t *output =3D data->output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +
> +	igt_output_set_crtc(output, data->crtc);
> +
> +	mode =3D igt_output_get_mode(output);
> +	igt_assert(mode);
> +
> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode-
> >vdisplay,
> +			      DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +			      &data->fb);
> +	igt_plane_set_fb(primary, &data->fb);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
> +static void test_cleanup(data_t *data)
> +{
> +	igt_output_t *output =3D data->output;
> +	igt_plane_t *primary;
> +
> +	/* Clear any output mode override left behind by the mode under
> test. */
> +	igt_output_override_mode(output, NULL);
Nothing in the test overrides the mode, so this can go.
> +
> +	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_output_set_crtc(output, NULL);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(data->drm_fd, &data->fb); }
> +
>  /*
>   * Preconditions shared by every subtest that expects ALPM to actually
> engage.
>   *
> @@ -319,7 +364,6 @@ static void alpm_dump_status(int drm_fd,
> igt_output_t *output)
>   * skips. A sink that can't actually support it is instead caught indire=
ctly,
>   * by the subtest's own post-modeset wait for ALPM/Panel Replay/LOBF
> failing.
>   */
> -__maybe_unused
>  static void require_alpm_capable(data_t *data, igt_output_t *output)  {
>  	unsigned int ver =3D intel_display_ver(data->devid); @@ -354,6 +398,41
> @@ static void require_no_audio(data_t *data, igt_output_t *output)
>  		      output->name);
>  }
>=20
> +__maybe_unused
> +static void run_test(data_t *data, void (*test)(data_t *)) {
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		igt_crtc_t *crtc;
> +
> +		if (!output_is_alpm_capable_type(output))
> +			continue;
> +
> +		for_each_crtc(&data->display, crtc) {
> +			igt_display_reset(&data->display);
> +			igt_output_set_crtc(output, crtc);
> +
> +			if (!intel_pipe_output_combo_valid(&data->display))
> {
> +				igt_output_set_crtc(output, NULL);
> +				continue;
> +			}
> +
> +			data->output =3D output;
> +			data->crtc =3D crtc;
> +
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      output->name) {
> +				require_alpm_capable(data, output);
> +				test(data);
> +			}
> +
> +			test_cleanup(data);
> +			break;

Two small things:

  - Only the first valid CRTC is tested per output (the break). That's
    fine, since eDP PR needs pipe A or B and A comes first, but please
    say so in a comment.
  - test_cleanup() runs outside igt_dynamic, so a failure in its
    commit fails the parent subtest rather than the dynamic one. It
    also runs, and commits, for outputs that skipped in
    require_alpm_capable() before anything was set up.


Thanks and Regards
Kunal Joshi

> +		}
> +	}
> +}
> +
>  int igt_main()
>  {
>  	data_t data =3D {};
> --
> 2.43.0

