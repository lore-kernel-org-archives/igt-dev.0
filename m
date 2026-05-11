Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A4CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F3210E461;
	Mon, 11 May 2026 03:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBFgdEm7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5679B10E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778470851; x=1810006851;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=STG2TFxHmkRFgVTcZfXXz1OMhp46u/BjsrsoIZMSKuM=;
 b=YBFgdEm77HXg1N0TO1g9hlSLE0Vn4PCBskojkqy2GUDS44pZgGl8RfLJ
 mPD0iJflva+cVocQASbUDZPEfTSUTwhtLodgStvlk7QICs6CuNsTDbiix
 1po/pBGN2vv8T1oAifB8Q2KiINddRDQNIoTCvNMzbnspf9HkLLsgg2ggp
 rkK33V9OMGinpFQWEicpslzSvqIIrWdRZThi821v4V0Bp9z8aaKwf3Oz7
 Vp2kSktN5l+XaF4WEzGm5QoF38A1/AgUkVa1/9RkGakcgqakQ6ExJL0dD
 6IKVdQVFQ1Ot1fUTSUv8hDeCrJLdg61elPXawaCGLTSTLNd2kFbOPXEjO g==;
X-CSE-ConnectionGUID: tuz04gR9Tji0oRwVxSpQsw==
X-CSE-MsgGUID: NmkAvfGySIa9dV6eFysM/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79374596"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79374596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:40:51 -0700
X-CSE-ConnectionGUID: poBP/N9FTAGyRQaP2qDsUg==
X-CSE-MsgGUID: 1mikTaOnQuaU0biR5qEAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242323510"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:40:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 20:40:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 20:40:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 20:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvyOCl32EWw61HANE84N5H1ktMNs7vzFljK14P1UxtJLDYeIJ1o5iYJ7l7b3yH8kk98R7XxFtCIXHM/Nz+mrQBLgXvuQmQ9TksoXd/68Q1EuVvDXGa/bZ1v4zbJVOIhbQC41Ekr8SbzFDtw9seecd14sKZitTWq/3/ylnV1JZ8XJ6wDjbwpDART+lXmTDNN/Vl/GYrogHDWhMsxqQ2TelNdDKqLwziHIWbZz3bdb2NNIaj4hJF2wd3MBarVS2Z2G6FIek8WG0JKP8XB+bJ7Pu85ZzEt+Ambe/aqROsv9MsWh03nXtESKsonjgyXC2kxJyV2HakzeoUuXduCFDB2Dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ajZb9MaGIsYtFQLu86cnvyceTx1rYWzi0/0zEw0kFQ=;
 b=jlkXaaf8+f4vgo9UxgjoPDNJKdEnbQWWFjHrAIhKexyzPtcheMx9U3LK4wvuATjCOMcnfXyJCaT9ANaOtAQGT5aaK98PzKUD8YnTE2c8oJcKziQfq+NsTfjk0bL+3/lFBRcyE1yMNnESU53uG7myh+20XACIlDDy18DhSIP4IuWtpE1e9H0M5fJ11hxKtK+l6UNLtV/zGZM2tATtiiDhv5k1VObtgxqYV3ED3V9ERLaDKUyNZlxq7DVbh39hKjXKhHvNEDgbQbq9pfojuz+Qv6TNHbgzPtRHsd22gFA42obS31/6fX5rl9MFeaaAhj180NkY3XjdVfhMkBKhtuGzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS4PPFFF98E87FA.namprd11.prod.outlook.com (2603:10b6:f:fc02::63)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 03:40:38 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 03:40:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sebinraj, S" <s.sebinraj@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_explicit_fence: Rescue pending
 IN_FENCE waits on test failures
Thread-Topic: [PATCH i-g-t v2] tests/kms_explicit_fence: Rescue pending
 IN_FENCE waits on test failures
Thread-Index: AQHc3TlTIMd1k2k04EOnUP/jH0dLRbYINEUg
Date: Mon, 11 May 2026 03:40:38 +0000
Message-ID: <PH7PR11MB6053CC2125D99D5D620C8199E7382@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260506091442.2241511-1-karthik.b.s@intel.com>
In-Reply-To: <20260506091442.2241511-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS4PPFFF98E87FA:EE_
x-ms-office365-filtering-correlation-id: 7034cdc4-3443-41e3-55ed-08deaf0f1193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099003|3023799003;
x-microsoft-antispam-message-info: OSNAhjXJxtT5PLolt7tuT29B5iLQTelMR+lwaaqJ2oWUeyqbdP8oIkX+RY/gcB3LiB9anlrn0GXBu+I7UajDGjmuQS0Qrfv/xcPcd5Ljr1QOdvH/IgUrT0T/gf5ji0WhSRkMCx62+6iKQ9x4gVqUVXcqZYDHYYEtOc0YjqiiaDYl+0f/Flxp3G72wlNkF7QWBXycPS+j2xqnIBTyge2hJ1/sh+2hpXPv3uv3DlJkCCcyw60hrqIAspMW8+ft80iyezlDNe5zlBLdvOHZQatRPPaelyORqP5DXtoCEKjqzR1CFMqiQC6F1xZrDGLmUuOGYNtotfn2iO2Xk7X8LZNHFst5u0JbAgmg8zFpaLjZCaEqmio91OpFQXxsWuvhwI3aAU63eq0TBGPBgHAaE9bfKsTEF3jcO6CZh+ooVenkP/m5cMGDTkRbeGdpRedErohKoENGc9SbS6isvuKBO8hPi0eyNSXi12hJuOktGA3DmoT4BFt53dW5THLsRDqfGN9eLkJO8KB+/RIevAj9ZrYvQMxGCXSxSsQQ54CoiqVJoHtadIf51FFX4g27ZnNr/2Ia7CPgcTYcrQt/PIBQl79rFqet6zMSr12HYZFhojh40RhT6km7h0okN3kO3p9JlL+J0CrzEpgc+VFNfXQyug3BMP2FlwVgQA9q48cDicdKK0qT3+QHM1r0Lbgvdyng1oHPpWhuocHiri6htlVQWSWcDqC6bLfDP5hXWK45LZRjP9jZGiKW+YQ+EG9EO/mYlt86
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ArYphiaKNZj3KHhARyHb8cUuVQVV6z7VP5xMsZlSLg9HU70Szg/YfAW8n5/Q?=
 =?us-ascii?Q?K4A2pAEK7T03qbzICXlSruStIrHYfEcDgHrjfsXiM/d3mW2P3epFNAXsSjdW?=
 =?us-ascii?Q?MDHeSTkVWssOVBbbJjR1PqId4L9XI6RetJzmkU8E9O4BILVl/Ub5Sm8FVMjO?=
 =?us-ascii?Q?Fx+IDiE3hctj0TTJxdZlIh2H5ImiArjAlfzKC+Yn2da5yeo3yZCJ0XoTiWJC?=
 =?us-ascii?Q?RZNoHWLkdovlzXiNIWNQzyl2pp7Kca77AawSoiLyQf2iTgtHKmIrTcNNmiOZ?=
 =?us-ascii?Q?mGb1VsrJAwoxBLF6MKnqsdLgy9nwJ7xL3E/yUKiKboe2sRRMy+kXcvFyFgkt?=
 =?us-ascii?Q?FJZvIFHXdytg/TI9GYLnynWONZL6z2Iu/PWVdoRAXivLGW1CAG88aGY24/yd?=
 =?us-ascii?Q?rXaDl1wSuIWQsHhFBgeHGQTcM1FhmhAY7sIcjiDUBIgY+U66jpB5zDYP8i7x?=
 =?us-ascii?Q?4bkBgknjxaM1A84RpEn+K9Zd46jbE7d7X9e16nGeToJfDYKeM7WST1sbE/A0?=
 =?us-ascii?Q?3egiN1w2SXTNlSwzgIxUta/2TZMp0d3iLMzfXx/qKM2vqPuy2flVIWop96JA?=
 =?us-ascii?Q?+oBoNjYaDDlL3LB16J0DpYVWvR19rK4+ZJ62WeNcrnEs7vbDxo31j9NT0mVQ?=
 =?us-ascii?Q?ElVO/iHndXfd2jZ5mFtkJl6OKvMmLn9LNdDEacKAXmlMP5CGr8g3seDlfS1E?=
 =?us-ascii?Q?jEcRTBKKV9IXAiqWrFhTPYLtmGvXrcVPuGuV7w70nClLHvU+BD0AqH47dmsL?=
 =?us-ascii?Q?xdsiMVVWnhQQSGRed+or9UW1w3gistvWyb3vD5e2Ao4zXxepyRI9jjaIaquQ?=
 =?us-ascii?Q?JqeztY7tplqtNubFxcYEiuRf9QLN9c7mbskjVdl6T2B0shcAghkVhDmlyaHG?=
 =?us-ascii?Q?RDc0sXCvgcNYNsB9XtLNMhNrpogq7NabPi+u39EmNVGqXMVFWkomeuaJDTM4?=
 =?us-ascii?Q?B6+kqIPkm1iRywpVsJg1UWk5txf5iK6TI1K6t2bt+rLU749l5ce2D1BG5VPm?=
 =?us-ascii?Q?BoM4AxJfU8AauIBERAGOS0Hx4Wfigw9d7V5mfUIzdxN20qCRdTcp51Tp99r9?=
 =?us-ascii?Q?aEXtd5jdrep7h6pzXQLp9zLdzpgugGyMQWxYFmgEKe7ucb158frOKCCK5q6L?=
 =?us-ascii?Q?1MsCeRX+bTVt5f8XpM5tkLwAjJCAj0KPBNQ8LA/r/dVq04yh4S8eMl6KjYJI?=
 =?us-ascii?Q?BrYWbtWbbOaZJXXu/JCptduSQhOWGfIRxnPEiFOJqyi5fRnVzB0tWotXTh1x?=
 =?us-ascii?Q?sLKR0Ym5aluGutBD/vPH7iXcv1QmRVvipRApvFFdGqkud3l6ZmGPMuyFWgdC?=
 =?us-ascii?Q?XywUeBtW4I/Fz2Dm+NMhtv0HEU2BJBpaNEB+b+L9PyhuOHqo3zmHjcF5MbxJ?=
 =?us-ascii?Q?8ntVD/t+vo+VBrvwde8eJBvhhK5FJux/yOMS0X+OSgAVpIIWoPZxeyAfYJES?=
 =?us-ascii?Q?YHT63E1rxySzpP5kd1y9BkFm//kRh8/x730sh4+aOsnbgYOEVRQDw5KhN5++?=
 =?us-ascii?Q?jRW294VxjcgeJvd6CB2kf2PSYV/pCSFM5o0fzLSZyxCLyBp4u+q2EUMMyY7U?=
 =?us-ascii?Q?SpqPg0vbbjIcRh1YN2hvYeQynW2YzNi5SML+gzOfRj/aqRxjUTXv4+cO/gL3?=
 =?us-ascii?Q?sun7kWWVUkyVDCT4fEjZdF13wKpRDW21OSEJy+TVe8uOoaj280MPJhLh5xxn?=
 =?us-ascii?Q?9iBMu6e3gza1JqqJ2pvlfx2BFMQQa32kL8RfNXoqw/avxq3dDe4tIKDf56RW?=
 =?us-ascii?Q?DlRknl2Bmg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OT5JsSliIC/Xb0syrWH/HorAsCklllRfWvr+XsnSXW4xt2VOb8TdjPpq90gdPFN3onFP5mL8NO0H2lCBGfT7AIu870GVUBRM437TyhYXg4LIHCTMwviP12tchfGsAScQ4DnCC7MK2d/yVFRTkW0XrH0j1oEsl9o/pm6OGDl/Z8mrY2ScfVtOHOze559SD5x2T8Ir90OzT6fsdpxHXYb24u2+algmQU/rgsKM7I3kA4Klb3W9ENEL/NagoHFi4uO/FzrncATyqf4qYXC2tgGaydW+NgzcR8xFrj/jpSKPEdvkVu/v01U+3eLSN9AZRh9j3fWJmCMFoYBFxpOQiX/fzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7034cdc4-3443-41e3-55ed-08deaf0f1193
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 03:40:38.6802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oxysfoo+TksKB0JpjvYek0tm93RVw9uBFoA4rzY8YUjtqlr2NuP6wj3B5+f2zh9eP+hfncHAnORVfVXAV0BzYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFF98E87FA
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

Hi Karthik,

> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Wednesday, May 6, 2026 2:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, Krzys=
ztof
> <krzysztof.karas@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_explicit_fence: Rescue pending IN_FEN=
CE
> waits on test failures
>=20
> Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
> commit and install an exit handler to signal any still-unsignaled fences.
> This prevents cleanup hangs when an assertion fires after commit submissi=
on
> but before the test signals the blocking fence.
>=20
> V2:
>  - Drop the redundant 'active' variable
>  - Reset timelines[i] to -1 in signal_pending_fences()
>=20
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: S Sebinraj <s.sebinraj@intel.com>

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> ---
>  tests/kms_explicit_fence.c | 44
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c inde=
x
> 2ec9bf39d..930f5a970 100644
> --- a/tests/kms_explicit_fence.c
> +++ b/tests/kms_explicit_fence.c
> @@ -68,6 +68,38 @@ typedef struct {
>  	igt_pipe_crc_t *pipe_crc;
>  } data_t;
>=20
> +/*
> + * State tracked across the lifetime of an in-flight atomic commit that
> +has
> + * IN_FENCEs attached. The exit handler uses this to unblock any
> +pending
> + * commit if an assert hits between the commit and the point where
> + * the test would otherwise signal the unsignaled fence(s).
> + */
> +static struct {
> +	int timelines[NUM_PLANES];
> +	bool needs_signal[NUM_PLANES];
> +} pending_fence_state =3D {
> +	.timelines =3D { -1, -1, -1 },
> +};
> +
> +static void signal_pending_fences(int sig) {
> +	for (int i =3D 0; i < NUM_PLANES; i++) {
> +		if (pending_fence_state.timelines[i] < 0)
> +			continue;
> +
> +		if (pending_fence_state.needs_signal[i]) {
> +			/*
> +			 * Best-effort: advance the timeline so the kernel
> +			 * stops waiting on this IN_FENCE.
> +			 */
> +
> 	sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
> +			pending_fence_state.needs_signal[i] =3D false;
> +		}
> +
> +		pending_fence_state.timelines[i] =3D -1;
> +	}
> +}
> +
>  static void setup_output(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display; @@ -242,6 +274,9 @@ static
> void multiplane_atomic_fence_wait(data_t *data)
>=20
>  		/* Attach IN_FENCE_FD to plane */
>  		igt_plane_set_fence_fd(planes[i], fences[i]);
> +
> +		pending_fence_state.timelines[i] =3D timelines[i];
> +		pending_fence_state.needs_signal[i] =3D !should_signal[i];
>  	}
>=20
>  	/* Swap overlay colors to detect scanout changes via CRC */ @@ -
> 299,6 +334,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
>  	igt_assert_crc_equal(&crc_before, &crc_after);
>=20
>  	/* Now signal the blocking fence (overlay2) */
> +	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] =3D false;
>  	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>=20
>  	/* Wait for overlay2 fence to be signaled */ @@ -353,6 +389,13 @@
> int igt_main()
>=20
>  		data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.crtc-
> >crtc_index,
>=20
> IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +		/*
> +		 * Make sure that on a failure mid-test, any unsignalled
> +		 * IN_FENCE that the kernel is still waiting on gets
> +		 * signaled so cleanup can complete instead of hanging.
> +		 */
> +		igt_install_exit_handler(signal_pending_fences);
>  	}
>=20
>  	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay)
> "
> @@ -363,6 +406,7 @@ int igt_main()
>  		multiplane_atomic_fence_wait(&data);
>=20
>  	igt_fixture() {
> +		signal_pending_fences(0);
>  		reset_display_state(&data);
>  		igt_pipe_crc_free(data.pipe_crc);
>  		cleanup_crtc(&data);
> --
> 2.43.0

