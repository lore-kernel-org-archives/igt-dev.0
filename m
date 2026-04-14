Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F95EF531E6
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 02:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CD510E059;
	Tue, 14 Apr 2026 02:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqNzAOw0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF44310E059
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776135330; x=1807671330;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q6yDM0XdPjXCx/lkUQhlo3TCZIir+p09Wv5EhN0cmKI=;
 b=UqNzAOw0VuE2Q5Qm7J+K/yrqixXxwiZoEKxRcC/lD+lieUrg++jdNIZV
 kqOAAFcUNrWgWRCW+EXLubvBMZ3mtISO0m+dCovx9Yr+EV6HE3nSNmvnW
 SFePXPS3HLAl2+M8/EZ26U7xEm01n46S3g+vALZwL0WriLxNlPR2PYwu1
 5Zb4e29thny002BM5oAsm77g0gQZ3QawOYXmGKw+U0cXGO3t+vBf2XmMb
 O/9QCAQ6upvyqZq23M/eI7BY02wFjG5GCKz1MiZmUvlJtnDL1rxUWojFa
 FUMuiut7DENQ1yEBRX/1adV70ERHgcc3iHsK5cWWcGku1tnJ21A1zAElQ A==;
X-CSE-ConnectionGUID: DZPXSJrlT3OOb/QCDartFw==
X-CSE-MsgGUID: LoVUYY1WS9u263pghhSfBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94480210"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="94480210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 19:55:29 -0700
X-CSE-ConnectionGUID: gSaKbRPpS92bUuxv9JKE7g==
X-CSE-MsgGUID: 9k1IprSlSVepecvzEbjt9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="226791989"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 19:55:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 19:55:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 19:55:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 19:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz8KH1RZvuvtSIB5INSZF6Xr/CMbHJEv5H6OZI2Jn5jKMhYTjLc1YAsr6wlu6y9BWholde2rHMrB/m4RNlc+uXl8UGdbOqOOBTPWjQhgnxfN58M4+G/xzQpjNHmB306C1kzkM8s/gcfCiZitywi0cAqgFIvJEqAsoUMtZxPijdJuWicXyMzcsVUCsOa56ykN+UN5LQZUc4OIQ+Kc5wWYIMTmvhMPRb12fBUQddiOsY06pRvx8+s5IByNclj4hpzLc5QWt6UT4HM9NiDJuYbD9bHar2Z/1pDACieOWHT+KWnRo3iXtZVBtP9YtzfBOkADc35xPBynhR8bidj9zmnvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mupSMZaTrTI3WW4BRPCt/7icDr32RZAs352MPmWg24M=;
 b=OOhezzkM+jyNY2hgGXqNS7gFkfedDuTFrHJ5lL8Ebbrya91FRYolH2ATdggavLCnybJXwC+mcL/D8eh5wOtIR7dQLzNHueWDmxmU3L76eQj13Oq1bZYsOVvqD4cXsd8HNZBEGuuiDFQMjC0NTV8HtE6J8s6zkI17XO3TQKaTZFIYllKKjPXF1Gk6SLmjNXS3wDbvDMVy84ZTUOrNDQT74rl+eW7cmNVKo0hwCGH4jf+f+xypL5SL+ANvfeIT++k9TGdnfcpWa1IYYl2u48ueSQ2BxxDnEpNMtnQ82fMyLWepsPtg6Cich5N8d4zS8J0ORLP7861MC9kXipKjGkJxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DSVPR11MB9766.namprd11.prod.outlook.com
 (2603:10b6:8:34d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 02:55:19 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9769.020; Tue, 14 Apr 2026
 02:55:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: John Harrison <John.Harrison@Igalia.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v3 3/4] tools/intel_hdcp: Show actual HDCP status
Thread-Topic: [PATCH i-g-t v3 3/4] tools/intel_hdcp: Show actual HDCP status
Thread-Index: AQHcy56H2Ee85UH+kkm86hN5fhIly7Xd3K9g
Date: Tue, 14 Apr 2026 02:55:18 +0000
Message-ID: <DM3PPF208195D8D795433878E48BC67364BE3252@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260413233629.771034-4-John.Harrison@Igalia.com>
In-Reply-To: <20260413233629.771034-4-John.Harrison@Igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DSVPR11MB9766:EE_
x-ms-office365-filtering-correlation-id: 687deadf-a898-48b7-ad39-08de99d14365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Xlrlo6mIXMgRRp4RHSMfgcOUyCf2XqTnwV/zbbuZEs9o5t5JqHc0PqQFCpq+G8aKHQeKo906RaxqzHN6d0Ka3jR7geo5JF0dS2VcVUeTzDL3HFFIjb1wnFaQHYeMfQ8SxfGPmWFmG4p20d4pF5PRMDT7nrtRyont86rxCWIPMYv5MqA6XVfMu3H/P4OfdfBcTXnRAqNHqF5KC68h20WQGg8xW05c/+XxMy5wbzLbHoVwddUcqXljSe3c1Oaj0BCSiBtabD10fTY47t69GbsAyYpF+ucl3tEhcc5+g+7lI2a/0xS+bftejV8eiBU5uyg6KnW/NKnkjEaDpp5cQgQAaQDMJI/ATO+SsNeB+YG/CQ4TulY1qaSBe9wEWPXYWs5ciiQ7wdYeDD7jeZ8IYPnm1+mpTzqQEPiU/OotXkRVsbm8Uqsh5kRM/Ckyu3amp38miYahhaNatks24vMt7OFZc2s0+ugOlxC3BPtXxLseausnbGrhvFUJvQPxTkGrK+vhJtkHHQJ/8CjRAXqHjC1CjfE4j/mppz+airLn62XFrlgsaancJKq2brFPvtXAkhajXSIoOjqIqnjFWCaUbgxN6qkK4lJvcqdyzvregfYZuC0jNLykL3Vn+rUJAmqDV2CjcAH9zuowPV8T6cIWqWzU3/1RnG8hISTwthnPeVs+YAvW/Zs1pYEq31VN4TmeUCPAcNfanbUi+w8BWQOyIj7T0QIhZTSq5TpwS0JhUPSIgWtaouSDUIpe54FiQFIOq8ZFRwoyBg1u4ZXnlOeubckZWvhWKm20cPRgSlGJ+VOS1hM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7geXX+pvgaZMnt30PCjC0wRkooVsdwQ2gev4T+AIeaUFS5d8vxHe3PMQv0jN?=
 =?us-ascii?Q?z+y3dzyJZWNZ13NbNompP80/kGqkUHv/oeGg6nPCn15tcsZnwKXqelRcpUlu?=
 =?us-ascii?Q?nujRSqUzAv8FHV4fWXN32Nmrq4VodwdtMN10a4gU9O3hDz4N3tu98gP70bWX?=
 =?us-ascii?Q?TBt1CW2TBSPWzXsrm/jPlUDH8YCAcO/rFlHcFRFiz/4scpsrjZALUBvluzH/?=
 =?us-ascii?Q?DRZn8mEGXEdFURSA8hrGWseK6DCn3VCpnxi708RU56O04lDyxeJLLztSRWdD?=
 =?us-ascii?Q?UYSLw19Gnj7AGktw54Pq4K4aT/+PzG7yj9bqGXK2ioqEmDnOcTGi9gF8Ch+M?=
 =?us-ascii?Q?COj6lkkfuTPWezXzbFSzpKy2q7QMJUiJ2k671K5zGd1sLN9q9jWJxjB2QZ4X?=
 =?us-ascii?Q?3EtZAMOkwGYL1/hgF8t/qEff4OCv/rGdui5A419TG3sepS/CoyQJsGw2FeLx?=
 =?us-ascii?Q?Yd9+6gNLfeSwBvWIIxa6oD88nWEq3Cyy8Pp5ADMHyJM2erXzPD1b4V5xfwHg?=
 =?us-ascii?Q?sV+GQmqn39xNeFb2RCDTsw3KQq4oLQdgkW8NtXc1IPgfxQxcJmYeOwS+KL8j?=
 =?us-ascii?Q?Z6z7G1pnG7R5LKZprQNhwerZIqVGFWugzoM/fMkUioP49e0w3BcYEVMBACqD?=
 =?us-ascii?Q?tbzHGhBjAIz9beMyiD2enr6C8ibdFDFgNFDmcGHfgj+QtaHsTBZUwZ37kMcp?=
 =?us-ascii?Q?KKvZys/9A/TY5hNabcDyWDkNjMMwI+fxvkdoUw0pP6tSFmY6xsBAm60rnD4T?=
 =?us-ascii?Q?oHWY7QyA7pd0F5IB4cUdBA3P1weAN4pkQ0trgXSzCEfK4VX6EJ5ZSqNXzzhC?=
 =?us-ascii?Q?JgoWRvHfLnf1OOcSP6qooYQ1ha3zxs0k7DHuDvFyWZ1C4iFfXeJmH8f0ZIlo?=
 =?us-ascii?Q?aEXGJllWftKvqLKtP4zX0ut3cH4x7rmwbLsfH7kcAQX1ZBe4F1zvQMf5wh74?=
 =?us-ascii?Q?gYnoA/HgvAT64GXwBR+uok0NEctWJsdI+L0iPyLnIUnTehZn3DThzuciGcUB?=
 =?us-ascii?Q?zvImxi52zGOteneM51ciQ5GrghTAEPsPNyXYpw/MeWLZ1OEE3tZPKTBKYKSA?=
 =?us-ascii?Q?H2di5ve0EeETyfCFo/58Vetz5DsNOfgwlgDs6EMgOsZEtQakl+9/KiIpFixD?=
 =?us-ascii?Q?BnddDF5izGPeWhizc4bqdDrYP4D0tA/YUFaQXuWxNgnXilm0Z3mpVCqpbhnk?=
 =?us-ascii?Q?7QmGSeW7ympshTcfsxpkoGJ071MgASbbLBpyGc14YqcR0AAJJSvRicIaNFsL?=
 =?us-ascii?Q?XGni899DEvLdtjxP+kM9df5XbrTiOLoocyMeUBfHrsefbzUuOQHzK9jgTB5D?=
 =?us-ascii?Q?1W+Kw33GYt4WNL2zUEzVR+XJG62oGlYG/Tr2UJPEnsOWAM2aqm54Mw7PmukJ?=
 =?us-ascii?Q?V0KN/qorXNXTLrpYoTze3o+jQLoUiYf0UItzmHzMLBN0RLqnlz+zX/eINn1N?=
 =?us-ascii?Q?gbwmekK3ijwSgiZl588DmXYtlZcv89CQbnyyP3IRBvIMK9fNssQUhAP0ijdO?=
 =?us-ascii?Q?j0UARzYmL7wqKmLk2sABGr13XVkGOI1YdWOoYd5hFT6Obj/uKMiNq7yeNbUY?=
 =?us-ascii?Q?iqdnBJV0reJ8ohhFVKT/PTusK/uFngelbLPitnsTZAZe/v6yQdawbJVZVRz+?=
 =?us-ascii?Q?TDvgyNGSDQ2o1pwPaqlrVfEDX1kUjYl/ljYPO92MzckHIvuTL1IBeEJrD5gR?=
 =?us-ascii?Q?b6EiWMyPpQAA8O+BIR5TNJdjIZReMLvPfI+noBH0ILt/gDGaLjsnwFSZS2HR?=
 =?us-ascii?Q?7qRhTbvR4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ff32zltZRUyiZyOxOaUyO30cz0rwuRwXN7vYPVnba5OYuBM9Cfpvs5QIhwYl2ccH1wUK/7yOu4o4pHWBE/jr9xwjs8yh5lX6KeNxUbVF3y8mCSOKksMeygl0QGl/4fCcyWvN7Zc7pal0Ww+65GBBc9IZgUtELfzldI76/4G7jBYNNu548i1jdIjweM9KGnjB2PjHK51Z3yPUqsHu2t0WIq0qqtM9C9Ezhmit78RL4K5CrO18BXeBMCDqHDFCfsg4EyTrhmDVWyEKzrJxsZbulq3NP667qVx2QCOfy5epHrD1YK3eGdbeoQmPXEyaWTciKH8yuPgHuUtdcqMAaRSD+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687deadf-a898-48b7-ad39-08de99d14365
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 02:55:18.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dClj4BJVOxRyZ6w89MvCsM0EUeW0jCd0EKDU6YC+CPlv+cO8vEYLB0Ow69bOs2GiGJjHC6HUDPBXCetiQkTIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9766
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

> Subject: [PATCH i-g-t v3 3/4] tools/intel_hdcp: Show actual HDCP status
>=20
> The 'video player' showed what the requested HDCP mode was but not the
> actual status. The menu system does redraw the screen with a special colo=
ur to
> denote the status, but that is immediately overwritten by the player thre=
ad. So
> all you get is a very brief full screen flicker (to be fixed in next patc=
h).
>=20
> Instead, add the current HDCP status as an extra text line of the video p=
layer's
> output so it is permanently visible and clear.
>=20
> Also, move the enable of HDCP inside the mutex lock with the internal sta=
te
> change. That way, the newly added 'enabled/desired'
> line does not update in advance of the 'requested' line (due to the video=
 player
> thread being asynchronous and managing to turn HDCP on while the menu
> thread is waiting on the mutex lock).
>=20
> v2: Split into two patches (review feedback by Kamil)
> v3: Fix text positions by using helper function
>=20
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tools/intel_hdcp.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index 4dfeda594..c12=
de06df
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -485,7 +485,8 @@ static void *video_player_thread(void *arg)
>  	struct igt_fb fb;
>  	cairo_t *cr;
>  	igt_plane_t *primary;
> -	const char *hdcp_str;
> +	const char *hdcp_request;
> +	const char *hdcp_status;
>  	double bg_r =3D 0.0, bg_g =3D 0.0, bg_b =3D 0.0;
>  	enum hdcp_type cur_type, prev_type;
>  	data_t *data;
> @@ -512,22 +513,24 @@ static void *video_player_thread(void *arg)
>  			prev_type =3D cur_type;
>  		}
>=20
> +		hdcp_status =3D get_hdcp_status(data, data-
> >selected_connector);
> +
>  		switch (cur_type) {
>  		case HDCP_TYPE_1_4:
>  			bg_r =3D 0.0; bg_g =3D 0.7; bg_b =3D 0.0;
> -			hdcp_str =3D "HDCP1.4";
> +			hdcp_request =3D "HDCP1.4";
>  			break;
>  		case HDCP_TYPE_2_2_TYPE_0:
>  			bg_r =3D 0.0; bg_g =3D 0.45; bg_b =3D 0.45;
> -			hdcp_str =3D "HDCP2.2 TYPE 0";
> +			hdcp_request =3D "HDCP2.2 TYPE 0";
>  			break;
>  		case HDCP_TYPE_2_2_TYPE_1:
>  			bg_r =3D 0.45; bg_g =3D 0.15; bg_b =3D 0.6;
> -			hdcp_str =3D "HDCP2.2 TYPE 1";
> +			hdcp_request =3D "HDCP2.2 TYPE 1";
>  			break;
>  		default:
>  			bg_r =3D 0.0; bg_g =3D 0.0; bg_b =3D 0.0;
> -			hdcp_str =3D "NO HDCP";
> +			hdcp_request =3D "NO HDCP";
>  			break;
>  		}
>=20
> @@ -555,7 +558,10 @@ static void *video_player_thread(void *arg)
>  		y =3D draw_text_right(cr, font_size / 2.0, x, y, timer_str );
>=20
>  		/* Draw HDCP status above timer */
> -		y =3D draw_text_right(cr, font_size, x, y, hdcp_str );
> +		y =3D draw_text_right(cr, font_size, x, y, hdcp_status );
> +
> +		/* Draw HDCP request above status */
> +		y =3D draw_text_right(cr, font_size, x, y, hdcp_request );
>=20
>  		cairo_destroy(cr);
>=20
> @@ -598,8 +604,8 @@ static void stop_video_player(data_t *data)
>=20
>  static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
> -		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
>  		pthread_mutex_lock(&data->lock);
> +		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
>  		data->hdcp_type =3D type;
>  		data->video_start_time =3D time(NULL);
>  		pthread_mutex_unlock(&data->lock);
> --
> 2.43.0

