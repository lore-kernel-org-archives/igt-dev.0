Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AECCCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264F10E142;
	Thu,  6 Nov 2025 09:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7Ie+KTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B318D10E142
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762420595; x=1793956595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EjXLnePcq4j5xzJWn5sd55yff5cLTPJiecWmsDaQ17A=;
 b=j7Ie+KTJ9L5fOfx+JLQ8LypLB0zqSucoRpO1+qX+8mpeMiHaryc/S0oX
 9YfW29xl4h2/6AgZfC0q46MDAqaFckkmUwizvAuIbbfW2VMAUvlIKkfqf
 YhZGg1hLc7rw3GLGkvxWkFjXxEaBj8yPOsNg6TUcdpahJQ1lZR61UAV4Y
 iW/KLff5GY0yYkNI9FJ2sLURcLtPUsFH7hdSf/BAFekExRrV/g3G2exFR
 OXJzFZBqSCGal/s5GJw1nEZn1GlHPizKntXmTJuEmd8qr7KQuhffTCzyA
 pND83jQqWe4VzJXzxvagpyd8DjdE89L2Q7so6OAn0V7YosXYUbEFtrEqO g==;
X-CSE-ConnectionGUID: 1JfDh2vDSFmVBayLh//Ucw==
X-CSE-MsgGUID: +lGX9i+fThK4PTGfppQjpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68202591"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="68202591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:16:34 -0800
X-CSE-ConnectionGUID: ZAiwcRAzQfe3uhCfa47HVw==
X-CSE-MsgGUID: Rhgv7GhkTNW9Oxtif6M98g==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:16:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:16:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:16:33 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fn0kCfvaZGYn82IH0ug1rU7oCTZycr18cOzMLCz6FLfI63EGb/igKHh3bocm1EBrhVNrCeVJD9g6TF3TB7hxvgvk9Re3AkyJh8o3NhKcYsbmY0KHZcZHctQq2RjM9mtEp7ULhXeG8+7vs12L8Q/mQpwMhAQjBwoKc2Yscoysx/YKjZ/CZp8R/XIfKnqyIhKu2EtH6GTCrBK2IKMHrALGyXSDNDPixhIDEftrvbrUyA/qLnQfIHTpZ2JTbHAZ0WVaLBKL+g+lDlBThCH9kNfsFWnYNxMqPTT3faNsf26/LpSib7kIDhHfJKTxGjuEdilzhwEkacOKh9ol+akzj2ITUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Es8cY853o4kRhkGIYhygQSJh0G0WilGwPRCW8y7De0=;
 b=KIv6cKwHZ6pnsyIDaAyuUIAb7/duX+alrwYPoVyDP2NJQNmJ1NI4O9qovG96ibCDsF1a3Fekjc1fPMux5XB4Yy4MqgpPgTbUDQqTBNQuF5w67Lj+ZovcisdRy2j4FgC65C5HH4WdirqykCADVUEH6NnpJP61a5+j3F4BqZ2YFDVbjvicc0ldHu1pfkzYDBEDrO9ZG9IsPoGZIpbo9d6deZamsfOKjE3bc76DV4Byj06Abcn5djq8BW1D3f51lpEEIkghIldshvW+xiPbrohItXKyti2cg0ZGl6tsN8oTHLqxPAmDEkL9txTVtsCkOqtSRXSR9roQ+VufIQ8FjWT5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:16:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9275.013; Thu, 6 Nov 2025
 09:16:31 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Index: AQHcRvp7IrHotEByOUaNYD03gc7jQLTVgvWAgA/oRnA=
Date: Thu, 6 Nov 2025 09:16:31 +0000
Message-ID: <PH7PR11MB60538DD9E083CC89F4AFF5DFE7C2A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251027044824.2995891-1-sowmiya.s@intel.com>
 <20251027061057.2996401-1-sowmiya.s@intel.com>
In-Reply-To: <20251027061057.2996401-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: 20419316-8740-4b92-8d5f-08de1d152cb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yul5vVkJFt0pGRPnigRBKDu+SwZPiuW0+Gp7TVj60milIbxIUv7gq6+IBBXk?=
 =?us-ascii?Q?O4/2XKWzRb3pct7JEoUoNk1RRealMEvnesoeqL5cOKl+KmTa4tbIDc/BdI8u?=
 =?us-ascii?Q?yONzxvg9vR+hMZJ/QUP48+TE1CIdwT2MufuZFVOpcg5tI09/JPMKa2ZIosQ4?=
 =?us-ascii?Q?ctQuHkxuprOzNVYQLp6vEOPFW2Nh5tzekp5rlLb8nHmrkjRZcF3Tdkr20oBQ?=
 =?us-ascii?Q?+14iEGbQfHr3p42SqpR3K8R4GVhaw8taQ7DmuEsQoQIh2MlD9On2jl4BJFxU?=
 =?us-ascii?Q?M6F513yxpkDXrOizOsv0DEkHw9EhcSXrzf8Z2uwDcZML7lAD8bGIHhkBDC37?=
 =?us-ascii?Q?ncBogWmCipp2ULG7EFogZu09e1/a+eRI+ms0Vv4LnzagbFBTbGosXlF1Es06?=
 =?us-ascii?Q?JnPKf/l6p+J9LAHXbhIpCrvuf0IAEpgCVB5FQhhEtwkJ5n3yEKCNQL2YZ480?=
 =?us-ascii?Q?2SrLmohxb716XVr/7mjE41lMJwHwT0cV5w4bF3j0yUvszGHTZIys629NW6MA?=
 =?us-ascii?Q?AuHXIMP+CPhUlt6mko5OzB3b3YwlHb62l5TDq++oQBJ/kj9kw8yKAmab8cEd?=
 =?us-ascii?Q?WLqO/NKfa5IaDcUXPlSZx7VHbwcvhn1tXdUHfzAoNyl95Ua82Sn59RlX8te6?=
 =?us-ascii?Q?7xnlwyfAvb/bghNE7JzlMvZiaL44//dcb7hVr1Oe1Vawc2cV9C1QCUvjujCA?=
 =?us-ascii?Q?GiLLqOgGobYkwucA5pYcn3jKLf5AhiR4QA55m/i7czejhaA9dZbK4MBC9GaO?=
 =?us-ascii?Q?A5NMa9LNECWIzf8n7rlS6OI2JzykanIrFvrW/HovJ7+je4KfMT/m1XpVHhZD?=
 =?us-ascii?Q?fMTDm4/NZd/p1L/yaA74R5Dra649qFP6ps3M+WdCHuWLxff8OM59k8EBOeH7?=
 =?us-ascii?Q?dj3LSkWwjB/S+nSkhU4vCyRYBRQmwSZF3XuuIwg6+iy++JxEgUGoliPrNa1J?=
 =?us-ascii?Q?cdXa7S/cFg9mkhzTcsYmZ9ENaC13YuHw8IrMCEGxiNhmYmU5eNPDUiN16pkD?=
 =?us-ascii?Q?xftMATi2urUwusWCqMbJdlpVHtHviWtNrMEHJHWOk2MWpC8jCEh0DHdAcJjD?=
 =?us-ascii?Q?TlkB4R+xIEmmn1q4l02AsfZoJ59bbU1qNkdrXd9A+A09v9/cuNGIw+X+1o9t?=
 =?us-ascii?Q?/AtgMf25XoV8Obm5sTn3DGV+xv9VF8a0T1skh7z6/rDjXMRX2QRPc9+JHC6X?=
 =?us-ascii?Q?wMJScVVysTb3aJuj02Drz0KkSBRRUpBFkvwsuBmBKFSsJ85HYUVcZOQRRKCc?=
 =?us-ascii?Q?yme19mDxZVh84EwTq02+AyuvXYwBKLk5PhX8/6bXJJ/jXjAT05wHReuhuFUo?=
 =?us-ascii?Q?4R3RFpw4CO2KqMkde3kgMhWsxX65GdABTXFKRawmS/HwiauY/+o2YrgxMVIn?=
 =?us-ascii?Q?oqdPNsPRG+4OPRDSZTFnxgw4+Pq2/JC88rfsXalZlFVsc3eYP1cuFjP2cA4I?=
 =?us-ascii?Q?2ohriPYJXJfsjef2StfkvY5cTbIYwXqIdxB4jmuElYh5INPpMaesMm9fPAXp?=
 =?us-ascii?Q?CI1kzmB7/F+z3e8IHX2a+6dtnyMmLhaPfRKD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UZrx4PK+5LdXVsgpueILQpHjUt+2TKTaEVuwsSbHtUWkgyzPD1wnTOGquwMz?=
 =?us-ascii?Q?oqaS3aFvVZ9T9kWH+cb/20+WnvVsVI1C1nVGSHp+hXnhZmFF6ahv3pR9GvY0?=
 =?us-ascii?Q?Q60bT8zKDHv6Cr+c8r8UIMjhllw8YOtc3/L39+eSdAHaf1KcGAHLBhetxFki?=
 =?us-ascii?Q?y2IrYHPHefzmaXmJ6GggHpmYAiYbkcX5EHAMV3XW3LAXBz0as6spREL9/L0F?=
 =?us-ascii?Q?WbqpTOf4aBDLoeO7pPjze9NNCDn41/P+Fe32a+C5LxGUoTMhbf9/CrPb9Ekb?=
 =?us-ascii?Q?hWIWtMcsWDGbfz1YIXzZesPmid+uqiOZPtbJCf5Cl3ClJea345Rqvv+flLIB?=
 =?us-ascii?Q?aqG/Ma8hZmuDRchIS717SLb7Ce9K36KIcm1iqjj8QKfKmEmT9FIRbAYba8kD?=
 =?us-ascii?Q?R+6VYyyQ5nuKCt/d2twoIlL693qZ2PQqH/32LmwvARphO3vrhFpBsWoM69nk?=
 =?us-ascii?Q?Bipl1jV0Zo18c0jUv+ED3akV9arFInx202sLNaDUWUfNBBlg7e6hZaHhGnlD?=
 =?us-ascii?Q?hFywtzPFjwm+BsnAP2up9Y90yI6BbeSQB6utBalL96OZwahvZooNOJXPAqcz?=
 =?us-ascii?Q?TyKQRIpoUyIQj6mFYzELlhUfRFP0tDS9D+N1/eguGS8XDKudY/xGxVbwuFf1?=
 =?us-ascii?Q?+FfU/DF8r/uZrFpTcOUMcM1Ob78W0UZJn2YQlBkua6sBSkomJzl9TvDXya7z?=
 =?us-ascii?Q?z7aey0LckdZ6k3Iwmg3CltnWanjN8SgjgDJRLK7WbSOjPTVW1rSPz6IvI0ox?=
 =?us-ascii?Q?w1Wm5ADYLCwn8XH7vdFl9bRMB8oXhcPyGR5niwM6TzU6xhNkxrfGgtniFfAl?=
 =?us-ascii?Q?MVsVxGUPE32wowQ57hre5G/hroMwUnh38a/KJK0tX0oAX5AWDl/D21Z05Ydr?=
 =?us-ascii?Q?Zk8jBtCAhn5AXs+WJxTSWVeq6LOtHuSITs/VBZ6+zlrHBUEhcObH7rjCzX2a?=
 =?us-ascii?Q?uTrgaSLcVcQSCc8hMSDTxMgzSChxWaWCPCFqBb8Mln4dJhUUgr67fPx848R5?=
 =?us-ascii?Q?0SCcPkF/O+a17U9ZrvApChwkXuUapDCa1dQ1C4jiufQOFk0kssbeWmPgVV0L?=
 =?us-ascii?Q?iXTtZpPrkY933y+4ZLZnJx8Id98r6P4osvZwNSPEJRNSiwh2pjb16q1NAHmO?=
 =?us-ascii?Q?mW/EbMXSPLn24r+rx2qRFH9rmnoOV5fIcFpqFSCmyMPigahA/sTY4MNHiMzU?=
 =?us-ascii?Q?XzqAUH3F1ZuzWeE98vfsA4U+wjFn/v2lkd0OzqGMbbbHRob4UgmpXA/aBKwu?=
 =?us-ascii?Q?f4MSYBuvEvUrYaeVNjbRVIczi4v+0ZpMchHtpYAoSevanhiDl4lxweT1vS33?=
 =?us-ascii?Q?Y7LYuwCMyQ72bMTTPQzGwlNvKWRaQaFTfxlHV9WdXipRreApBRsZbaDt1uPl?=
 =?us-ascii?Q?/a4c9LcFFhQ4WUpgJygdKkNjR6y2xOO/EkmVPFZQTEI6EYoAe+8oUq2PrAUo?=
 =?us-ascii?Q?T0va5r+p+rwpCdDTRWkza0KMy5tu3LJlBr+ZF0oIpiX2no4W/rzsXROVerdI?=
 =?us-ascii?Q?0s7/gvnNnLO7P+JS3YV4bZfodlreSHDwYDMCiA01smOXJoJlnwWNvB8tJTcx?=
 =?us-ascii?Q?5gygHHPdbJv/+qAWjLxqpkFFK5SjNMUotfAj7mw5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20419316-8740-4b92-8d5f-08de1d152cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 09:16:31.4457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVRZGali1vL+cJoA5iW7htSkAzC45rXlNlPx5hn1rqA0Wr6npwWEl2bs0OkJDQT1YOMlmPBcHUowAseIMebZJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Monday, October 27, 2025 11:41 AM
> To: igt-dev@lists.freedesktop.org
> Cc: S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages =
for
> skipped subtest
>=20
> Add info messages for subtests that are skipped without having proper inf=
o
> messages. This provides clearer insight into the reason for skipping.
>=20
> v2: Add switch case instead of if conditions
>     Also changed the flag name.
> v3: Reframed the info message
>     corrected author name
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.=
c
> index a13830965..3c54604c2 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str, opt_handler,
> &data)
>  	};
>  	int i, j, count =3D 0;
>  	int pipe_count =3D 0;
> +	bool info_flag =3D false;
This is redundant as this will be executed even for modeset-tests also.
Instead, declare and initialize it inside the subtest.

Apart from this code LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>=20
>  	igt_fixture {
>  		unsigned int debug_mask_if_ci =3D DRM_UT_KMS; @@ -1216,6
> +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		igt_describe(transition_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>  			pipe_count =3D 0;
> +			info_flag =3D false;
>=20
>  			for_each_pipe_with_valid_output(&data.display,
> pipe, output) {
>  				/*
> @@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  				 * panels with long power cycle delays.
>  				 */
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if (pipe_count =3D=3D 2 * count &&
> !data.extended)
>  					break;
> @@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str,
> opt_handler, &data)
>  				test_cleanup(&data, pipe, output,
>  					     transition_tests[i].fencing);
>  			}
> +			if (info_flag && !pipe_count) {
> +				switch (transition_tests[i].type) {
> +				case TRANSITION_MODESET:
> +					igt_info("Skipping test: invalid for
> internal panel\n");
> +					break;
> +				case TRANSITION_MODESET_FAST:
> +					igt_info("Skipping test: invalid for
> external panel\n");
> +					break;
> +				default:
> +					break;
> +				}
> +			}
>  		}
>  	}
>=20
> --
> 2.43.0

