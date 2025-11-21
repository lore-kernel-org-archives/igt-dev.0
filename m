Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD6CFA757
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43C10E11B;
	Fri, 21 Nov 2025 09:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1+LHBn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722010E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763716617; x=1795252617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rbapn6hDnfajJRBRSHTEggv4+yzKdFwFusdR+pGA9lk=;
 b=e1+LHBn4ksiKGARjcOfZ8IMSnw9itV/P4lkFA6yxAwDRJSmXLzF9Im4O
 II5OjRnDEs1Gj1UQjEkYQwBvgvsvZLV7bie5Mer2AonBjpG5c5t8uUPQe
 nMrQeuWmbRfTb/NPx2s6TpPQC66MZifB+++v98Vggsj5nD/NtGvEP0OI5
 rP90XYWbS6gCzcvgsBA19J/5dUzNHc5RSHxrGJ8K+8oae++Fh8yxcWgbs
 cUPOgCo8aoJkbDmFok+uyPWm1Z3EAqZTvDCRYoBCOl+LGXIRWVCcpjZan
 oNtlttI2Im/6oaF1kXuvLYYuM/5PZQ2bgyWtRZcknimqPl1Tef1ZbAbnL A==;
X-CSE-ConnectionGUID: cxqqYIH+S+CjIitbGmD/Dw==
X-CSE-MsgGUID: WqnYID2RRxurYt7lKLhEzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88456499"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="88456499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:16:56 -0800
X-CSE-ConnectionGUID: q2cqJIJwQaSBL61B0NMw7Q==
X-CSE-MsgGUID: L6oF6xerQdeSjFzFZNf37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191892521"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:16:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:16:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:16:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:16:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/xJGnerkl+P7xio1kt0p3X0b1bKGzpiyTNk0Wih+hFVmGJ531FxZYUTnF9gTGbPDkxE2vGPSuOoMk1wItzC/n75LmZtnlM29YYTkF1bex991lc5h5/gkwtNM0SWzV4gGMV6pxH2y4X77ewveH2jkqbzQ9gdqxeTTZnDI3yELYw0jphRGj5qV92O8nzIhX7mEYBrTvtFZw3s0RYQMWHfNg6faUx2BwzA9G73WeMiPJavmwXCEg6Kz2ldLLeXoNWwaGjIYrTGZ3ZHRz1woXYLTXbqWIzn6WnDqYPwJ51+7fjT/OF6OH7saakfs82SfAKJj2fVevD9NtiWgGXXWS1hJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo4CpgUfFqVT6dlUoh7JqfGgHLIqXcQTVv1fLJmpvxg=;
 b=dUx5pxPOpGI1VhlhnRxstMKazEbs98iIeOB90mG8L+8+ad1mIqJuMwuZd7PgHQW1Lwm75+oSvlXgb/f7VsLZPdSXQyaxO/+bA9+zvrZHsQgKc0u7iaUKB9Zpq7xSgc7WhWh6g+GXA+j4uKF8EVMRl3ucl9bipQPfgcmom/SPyk+X5v7cR11oDhqW5PiaUvWD31SUyh8gLqSHqccwkuH+p/Z4ftRiG2MSXtuXKUDGDh07XYHzLBeDhYArOSrOmldoTHWwCijykQGwk562kWApj7B7PEunziLxE4+ahzaWit4Ulcmwu9jJj1KVUCudGJrPxN1uTTciPGYo1D9KxG59Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 09:16:45 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:16:45 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 07/12] tests/kms_writeback: FB creation within
 subtest
Thread-Topic: [PATCH i-g-t v3 07/12] tests/kms_writeback: FB creation within
 subtest
Thread-Index: AQHcWqlwlEVTNpNa6EuaLnf8Olncj7T82HJg
Date: Fri, 21 Nov 2025 09:16:45 +0000
Message-ID: <DM3PPF208195D8D12A723642564662E9650E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-8-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-8-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6239:EE_
x-ms-office365-filtering-correlation-id: 2e287318-a18d-482a-dfe8-08de28deb11b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?yPB2kGYMi1SPhoasWgrTBkJ6FEmbO8q89HMCS0H2LV6wf6/5ixb8RmMIytJc?=
 =?us-ascii?Q?3zenEMfAkSGhLMR8tx6tS5Hef32kzzAAXGwM+Jkbqp94yjbbbYwBhl2YJP2A?=
 =?us-ascii?Q?1JTnSyA3GVxfoVeXCX+E3gAfJpWA5IG451UNM2BdE7rg0QoEyqhKfQXvMFKp?=
 =?us-ascii?Q?UtPLtCSHCruhPJkoe7JGN2le5v3nMinwLemYJv1GAUwF9TnsmrZvQDVMRD++?=
 =?us-ascii?Q?ur3sblFlCgheJmUskFzNxlaH8/rxa92vBh4YwfY2Ap7n9I5uMAseIEpIHzBh?=
 =?us-ascii?Q?MmZ0OhbgN7Xmgr9sNKZdJcHh1DTGOQ8rumRE7MIUhEpBhRFSb6I0fbtjYfTF?=
 =?us-ascii?Q?LJPdVcxMdg5pYQRQ83qdNjKn3xZSeAuU1fXX36K+CLInpbj/J+Tj5DHyOCpI?=
 =?us-ascii?Q?fJYx14ooYsKk4+Yd72xKxKvJHjJgAeTuMHTXuCI2oW8tLsSQKZhnU03zbOhL?=
 =?us-ascii?Q?QPsAibunC2K7eirpY0BUU9M7wt6BZB7rAIGgXFEAMsuFokOCkAwiblERYjwM?=
 =?us-ascii?Q?dNnQb2cN11TzZ3dGS7lMjkH01TK+mSk6raydJZOCeArV0Su8KBupSvUcmq2D?=
 =?us-ascii?Q?cOyxtY3f6ZmPrhmYHaEHdiPxa4cbcO1wHv9EaSjv30xeFV2EP9r6MLmKB8E0?=
 =?us-ascii?Q?gvsIkXUXE05InOws97yfrOfXtDBz2+E+iYpL6AAUBuvqBwgdb7RoPoMQ7TdL?=
 =?us-ascii?Q?ol8jNn9YQB04uD3xCt/Swzxje/JFqJ/F8isH4e6p59ZvXjCE2Q1mrCo2kn7u?=
 =?us-ascii?Q?FRsgjWFoYoetD2tsV69lgf8qh5pp+LjSidFpB18817uuG0JH/T7PkbuaVNwN?=
 =?us-ascii?Q?WTQR+hbxp5koYUezi+kgSp3IcPaxqdWxi+0TKYMOHHj5rHbU2IodAHYLsE6a?=
 =?us-ascii?Q?YHaoPAhRxjAVuDz/Cgnjx3KXFataQljRuGNKwHBRRz8IQdiDR8Dqvo11x4f4?=
 =?us-ascii?Q?dOVnlVhvYnAYLSM5L4wmJB86JruzGrC5bPizbspcsXz8AhJxvEKGC4sVEl7f?=
 =?us-ascii?Q?YEm+FHBZMAzRq2K8sgE4tWVILU5R7qg0bZcRRMmNpw0rCyAXM7UIIA9a47dT?=
 =?us-ascii?Q?mNzGRxXK4Hm1aPPKo/GiaX0XucIK9e8mgk7tvpzP5R5mtXWa0eZmY6IC2lNZ?=
 =?us-ascii?Q?VHcLoMeAV6PPX1RgxpcVJTZHP2u1n4lKumeIsuL3QF4+p2w/ooxYztyfr81c?=
 =?us-ascii?Q?hDEcU+FVYlzvJ2+A4KHsT+tZBehYv2jV8DNfZqloKDeV4GHuB/284qRc58QW?=
 =?us-ascii?Q?gQ0ZfZjKuGN5XqnEtbza+rEp/0RAi5BT0Z05mU5YDYKqFDIDkUNirCW6Lnvp?=
 =?us-ascii?Q?htDYfqT2Il5SOXWPCg3nd902bguoTJchv9nLmeyQFnLwU4XLU6qlcoMZ4f5J?=
 =?us-ascii?Q?+ipaTYruFVrA/mjsCXswKEBKVk6K/glbVjK0Vw8me9syh3TDND1HTWxOA92s?=
 =?us-ascii?Q?pqfnFdOg0PsMromyh+oUx5rSQlOUK5wHr1l1IJS2vfj9hC3AEIDi95Rx9gca?=
 =?us-ascii?Q?u5JSrt6EPlKPClmQzjRQc3E2Kqw4+YHWThuZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fCdmTckvRvTv/fRjj5PbBEWGZhRft/b3HF1apbko1VeQVr5xG26aWIMpVdWy?=
 =?us-ascii?Q?2N9HNANT8JovcQTOj1a8QkLNu4iQxqggh3as+EJCwiAp7l4Tpl66fW7p7wTx?=
 =?us-ascii?Q?N5EjF7tyxMSsBaBdW02I1YAbqlupjOpXE9dACTvX6yTxQKndpJNrmaWEaOc3?=
 =?us-ascii?Q?Cjd4J0v8tGpMsqNn/b6/nr4SPAeu4xaOt60nZOg4EkxAWdPgtKVfbCDL7Ccg?=
 =?us-ascii?Q?E6DqsDRne5/zhlT4P1wYvfBRCQibgF2lIXb333/40bK/OaGLQHsdSjM+5B5y?=
 =?us-ascii?Q?QnvIlcFDPdgSjt2V5g0L3K+uo2LXka0UUM0zmXKmL5YcAJ0vWmTAmPhQ2VMy?=
 =?us-ascii?Q?bRdunoiABpyfF0HTy9EszXF+8u0YQmiOSBfWKNkeOtmidx4L/zzD4bDUDLOd?=
 =?us-ascii?Q?sG7aZ1a/GgNuOqbb1T5j8ZZMG22uxPJk8xenqDWNU6BwEz1NSOsmKRUAu8zC?=
 =?us-ascii?Q?PZ4Jdy2KbFPiYNRHACvSCc3R0BCBq6LE2Y6dIvvnbwenOmTJxQ//u5COqmbR?=
 =?us-ascii?Q?kh5wD7SH94KbnKiWSKEpxE8W6Ctz531MAbSB2aP4cCOS4IpMwqhVix+NYKFF?=
 =?us-ascii?Q?WKTBPhfUEWCfPyorTVyOcSFvneCqakJdpg4VjfQR38b7ccs0bEhwGvVN7DCh?=
 =?us-ascii?Q?ACkXQlBGyY/8pWXcMBYhNFSF4Wbnx2X+5p3vBrJdh3tBWY+0tcHNkBHtvQ8I?=
 =?us-ascii?Q?4bfilcQsqqrTRECfGiHhigsuEguC7sR2ShUlTU8Zw8/A13Y7sHBtycVhAj07?=
 =?us-ascii?Q?oLg+toAMKZLsP8Bez7qbZStHSzOcEhSPGofFrWHz1jG1ArsC5CTEy6eE1Rd+?=
 =?us-ascii?Q?jj+8CIO64TZi1kq5FA+Er1GYPWsBlO0XoD4EraRurYwDn2b4OPD2S/LinB5H?=
 =?us-ascii?Q?0jw8T76vrt8KXTqAVByE6Phx04TjTK3oygcMYX6WXw7ZSPHJDcsxR+BUuvVl?=
 =?us-ascii?Q?gEbaF3rYbloQleH3iHqWaealRIyfhsXLCBEXVhbYPkTLnRkhfT6rbZvTEv6W?=
 =?us-ascii?Q?vXQZqR/jjKvQDA5eJ3op4XYie0ME7fLX9ecDdBNJ32R2fSRVy1y1UVqwEyPc?=
 =?us-ascii?Q?Em5UU1NOP3MxnMIBR8Dvbi8MhPr0JdFVObvcz0ekKzBk/ignDFQKBF0cTvPC?=
 =?us-ascii?Q?gc/kGE5exRs2LfJPEGRHmNm9FrsWAeAIhkRuCbPBQyhWv8Gbt42QjpJHa9aF?=
 =?us-ascii?Q?4EGaHwRBd8o3pDJrd9e2UCC8u1ABXnCHsociTMpP2Ns930ugFgkJvxkOVxzW?=
 =?us-ascii?Q?DOTFtwOR9GXX6s/aqMYNOlQLhSRnfTZXYT2gRRfFRTwb6d8nIfTKIEH/k/bc?=
 =?us-ascii?Q?TeU6ebXwAYWWXQs6WUX4YFmfxQTLXf6Pbcq2U90ZBr9vL86qiMQVHcCk6x79?=
 =?us-ascii?Q?BAOnxufE82nbd6NfN+m3mE4P0RxNB3UvLS2Q57azOvyCSMb8pNK53+J3ZAOo?=
 =?us-ascii?Q?Vx9BxuHTOkflKPD7UjsHX54lpFsXy9kfIfOOhIVOw+YzlM+ZtrZXOQrMkwmg?=
 =?us-ascii?Q?D/zrIIkPB4hHYgifSX8FlSu7ukkLUELtVZh9IVkmyYAgNMbKRMa3oRmhGRAj?=
 =?us-ascii?Q?ZqXWyZp89ykdRbpsdphjUBZQhWgPVN2VpAyQe42b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e287318-a18d-482a-dfe8-08de28deb11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:16:45.2211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6aeKVEdN2nEQYrCwIX13Qg3Uzi07gZFwEDWqWidDa4rPEhcxcG4XVC3rB8NnKxmmk98xDF9zdFUIowsESK13Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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

> Subject: [PATCH i-g-t v3 07/12] tests/kms_writeback: FB creation within s=
ubtest

Be better at creating subject and commit description

>=20
> Moved input framebuffer creation into the subtest to allow platform-speci=
fic

Move

> handling. This ensures that the correct format and configuration are appl=
ied
> based on the target platform.

And you are just selecting FB format if its an intel device or not let you =
commit description reflect that

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> d031a9f54..f724cd33f 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -688,12 +688,25 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  		     "(output framebuffer and fence); this test goes through"
>  		     "the combination of possible bad options");
>  	igt_subtest("writeback-invalid-parameters") {
> +		uint32_t format;
>  		igt_fb_t invalid_output_fb;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes);
> +		if (is_intel_device(display.drm_fd))
> +			format =3D DRM_FORMAT_XBGR8888;
> +		else
> +			format =3D DRM_FORMAT_XRGB8888;


You are going to be using this at a lot of places we can just make a get_fo=
rmat() function

Also we can just make a single patch which does all these where all we need=
 to do it change format based on device type

Regards,
Suraj Kandpal

> +
> +		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> +				      mode.vdisplay,
> +				      format,
> +				      DRM_FORMAT_MOD_LINEAR,
> +				      &input_fb);
> +		igt_require(fb_id > 0);
> +
>  		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay / 2,
>  				      mode.vdisplay / 2,
> -				      DRM_FORMAT_XRGB8888,
> +				      format,
>  				      DRM_FORMAT_MOD_LINEAR,
>  				      &invalid_output_fb);
>  		igt_require(fb_id > 0);
> --
> 2.43.0

