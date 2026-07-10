Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D66C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 10:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187310E18B;
	Fri, 10 Jul 2026 10:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axj1fvQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B9510F84E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783680987; x=1815216987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dOrqip6g29wLgqP2G265rDfk8uNlUQbLGpuIXMGqw4Q=;
 b=axj1fvQg1pEMEcoTlW+8S20dcpxRSZSIXfmYcmlnCwbP2g3Uxw1OgbBN
 dNqcpmE+D7fiyGOZray8CIpljQnaR3f5EoO4bnTylWGKZ3rqfMuSilMrq
 UDoxarnNf3puO1P8c42vwBlCMS/0xGCkP5+ZltvSD11kkqzrHRLyphndM
 T9iWmCg+DmBCo4R8xVvhAaO1H9b7Hhzp1+4MONLHGLaNlIhnQF1xwTMI/
 vmZgJV53SNePz/Dab+LTVwvo5e0klSHZ4EWxFuOLImevGpgwABYDp5EfE
 f1JOiSNZF20H7FhE/xlKCK3fItAQv36mtnHeuz3D48+XMz1p/p7vynuRq g==;
X-CSE-ConnectionGUID: ZonLPeUvTTqnSXnjKNTLVA==
X-CSE-MsgGUID: 3rXyFBDLRjOczZkRIYvthw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83496308"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83496308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:56:27 -0700
X-CSE-ConnectionGUID: nMhCJHvSTC6wxD66k0VDow==
X-CSE-MsgGUID: 0acpP65KRFOyq2+CcwbB6w==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 03:56:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 03:56:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 03:56:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 03:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4rCCRF4vVvFSzwg06H8o0/NF0DsuIKB0opPCPyel1AGvE4HvTMfqBBhuwNEa+/LkMV+2qtKS62tbCbLBTlK9sL5ZCBfkToHXhhQDCspvJPy7DMJVctMmZ7MjV14pkzKLTgCQlWEwqFsH83SWcKrhNgznYS3wo6NueGrpeFn3JYE00tJ1vhqtL9QIxsoD6gEnY+PY+NIxQRcsYRGJj4sd8nYkCDkcnW4yYzTeenNrggpXgbUcTZq5K/D+b6hmxy11ylSj6MLgRE9X2ch5tvtJmQUTO5GRxJeb7ogZ++dQePF99kJZzP/f9Ly4gzSTnq2zyYqeRWvYL6Fr32PKbtiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+fx26Gv0iKr3+S5Co+3HfNkOQLtRSIEOb4OsMYW8Qk=;
 b=v/GDJdRBRvexpuiOY+gkXIZtxB3FhvlH+CppwAhnGf9lLXIUuJkUd+w6TbK9fvCmN6Rz5bIjdwqWSAd1fKNPDfru/NYBg+Pz4Mfwn3s1CZKJWRAziKBwk+nQ+sVnM3bl521yY5pa2mAEvJCGQHtjndGhR5bSnNwLi4HeYKqw+QlGKGoi9eW4Bwl7YjB82Oudm5XzqMMKsb1GAFhP/4HaegHt1S6jpRYRoF7hudfiMqpwzcSW67qDU+vZnfVmiBVofg6oN1C7o6JxCebvDrSpsaj15jHt3Qd1+Ac8T5cfWXuF3blvLHXPsQcuhMna8GlOxUZwACTU4Xe+/nMvfi5pdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 10:56:24 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 10:56:23 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_force_connector_basic: fix
 force-connector-state for HDMI 2.1
Thread-Topic: [PATCH i-g-t v1] tests/kms_force_connector_basic: fix
 force-connector-state for HDMI 2.1
Thread-Index: AQHdEFJ0+df7tt3jSkaJEn+yDeqAvLZmlMCg
Date: Fri, 10 Jul 2026 10:56:23 +0000
Message-ID: <IA4PR11MB9251AF85FE2F5B1835A49DE899FD2@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260710101924.2741256-1-sowmiya.s@intel.com>
In-Reply-To: <20260710101924.2741256-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: b55e1342-e362-4739-e28d-08dede71e20e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: HGOSAOB/mvIMC3hYiUNcVx/p29B1TMDLVP0pcFTt98rTc1YJ/jiesh39cras04s30ijMEYNkvFsN+2XR8XpZlZwUEXffjE/Y5wVRn9QBbGrYhR+tOmRrN1TOsuCisvzYMgul15waqCl8IF6kbxmL2eWCBiXg0WlfuHL2246YtQWekjVa4d2xM9NND0SFvl/djLxAwrPLbKv6f8dHNNNinabtGcZPa9eObj4oqw36AcYagTsk9TYolZVth7vgr5T2jd7OoppEBKe8tY8ue3w9Hkrl40rZR76zzjDnV/D4vwUSFGCiyTjqNFXE/UiMq7X+QAeDVl33bq/a0hl1Wx1A5sOy150QEm+EPEGgs5+nc5gTOBX8A/E23TdwnTXwyFo2d7eU3SUiCugiVF1HXUy9AWPKfHDybW5FfAf1RggHbDUaPMrbcYpBF4Pjeg/ppvxVRtddtxwgUmta4SLl2/4Vce1dp6OT2uR5XJMegSiUPG5LIYQvX3p73ipJ0OxYTmbz1o0vCciOBfCVIjQmQspzRPQ66PBpWFVmSo87ikEFEAsEsl5eX+NR2d7X9ZKt1h7EyEzZrjKgK470/hZSHlhbVM8bCBRJgcEpud8k/6dQGt2DqyvK6uYAy5g8dXrZ0+PgFtgmKfULnabsLyfDQ9g762RLD8WAG42P2Hyv6r9iJfJbCIrftPCV7LKxFEBEmz/bYYOh2Sp7Owc6YGMMgoEa385rXpWlDq2NRswATWeyfJ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F5AdcViKmERXSp6dEmZ4Wxfd7HKnDm6It7jNQFBGxPy6rlhV2mPl9bsqc75c?=
 =?us-ascii?Q?PKloQAhonR781SwpCHiu04KDW3v4uTD2NWkbCekmPvJRw0+Fgkq2bYs3GWR/?=
 =?us-ascii?Q?GA5kKth6AG0wEQssJGazPdsHuCykVEd6UeKZXgJDbcXbNgEE5dwPCaiHLcgw?=
 =?us-ascii?Q?R1TOYLsg9CsfyZK3wk+jzyS28mmW9a5DMUApKJ2lQfDt97Jj1vejZa2XLE9r?=
 =?us-ascii?Q?9jFPtQDVuLRj30Wlsb1JR9z+PbraAe//REG0vFQcrDc+oveSo5HtVfHFg7cA?=
 =?us-ascii?Q?eYDDT0Uf+HnDcKUrtLbdxRH+pIJWnLApYt2U6AulYQpSReyFyUQZw6XW4h1D?=
 =?us-ascii?Q?Ut0YtYz0MHt6DkgwHq0fedVIR3YfUavw/yH4KwRxIzKynCRLe1vXGuJjMZ8I?=
 =?us-ascii?Q?UHef52HlV+qykkvAMWhh8VXe1mGsurXiOJWaJI8lWFkqsoxZrX0Kxl2Cbdrf?=
 =?us-ascii?Q?gvGwQWHBvDB5LnYR1X1WAeQSnMs2/toJ2ushG340cjWusMiedNatZLfsAWto?=
 =?us-ascii?Q?zlDZs3S+zgFm9nbZnNLJPJjRzKcML4XC3HZUY7ZGrx4S5NnbraxkAQq2KZZ7?=
 =?us-ascii?Q?F7GhxI4WKSEJ9xyGG48dF39/KN27iOAWIvCgdrJ0EZ6Q3VPHtPcd0EG6gCsy?=
 =?us-ascii?Q?2d7lOwfVE2D4kvUZmIzfGt+ZEAKCYraQzUYkYgDjx0ftaF7nYzQdrkoVmc9a?=
 =?us-ascii?Q?JBjv0m8LNhOCucasd2bKeqcV9zovBvkq/Gp6UsHpUHler/DupmLNJ3Ym8WSb?=
 =?us-ascii?Q?ehwI+57tj+alZQ8ZcNbDWkkoUerf9Fi7I6JgzA8B8tUrwt2nm1NBJ6ycrG8F?=
 =?us-ascii?Q?LbU2HqQXHJ1tsHtAdfNQ91hI3EwP5x24IZeI+oJ7IiqLY5fqy36leN987zHA?=
 =?us-ascii?Q?vZhjxQxS+N8WjOoeCWhhoLmdJRiXWgpVKsE4S9Zre0CerRwx/+T/q0VNCXKV?=
 =?us-ascii?Q?0FLSSL0A8nAlHwq5UFe5bi0UGL68CDdB6vbKqV1c2m+w8mt0Qq5yCiKjJ7zk?=
 =?us-ascii?Q?gEsoNPEUQqjQXX6+Mx8V5q2TPNUD6OuRHiT4jgP4Rz0+/QlnLR5RUJiNkNq0?=
 =?us-ascii?Q?3ILRtXuAcI24nLgOG/fKNW1rEQGrLWPrBwFcGY1UrbqtQfbMwZ3kmYIGIKm9?=
 =?us-ascii?Q?V8H1T9VQgwTZYQk/+D2vtrbaKw5RY2Lw/1FlEVmLr8JpXJZUmPJkxB+S2bgb?=
 =?us-ascii?Q?mTDSM5T1WSUYUS5+T9yJ+60Bc7Fbp9AT0DXZIUtp6qyLiM4CB/+stZiOTQQj?=
 =?us-ascii?Q?5VBhfz/5KpzFIxSQuNghYESNmFCdwPnek+WLdVoH1qlciIga2mj7QZdI0jAk?=
 =?us-ascii?Q?NApaCK4IhG2bJ9Btfkl2kB7K0GVsvJhR11UhsOUxHM+4Ct418H7q19EbM9Xt?=
 =?us-ascii?Q?7uvaH0LMpioTGfAxszn98tLRqXgsdB0pTb9fwwaY6kTSqkBha6lwAcEgoMoQ?=
 =?us-ascii?Q?dvYX7suZmvxJniy3EFOhT6ubGQ7iXELWm+vFsl07WYys6rllpjikd3B+XKCh?=
 =?us-ascii?Q?pCbzi/glk4Ha5pY1jeKj+TT3N3hq993jeuVfcabxvVRiz08YshySnVJ3yxhS?=
 =?us-ascii?Q?FV44d3IqTpxDTGiZzDpV5dE7fy05HhziP4A4BXzHGzr2y+wz3JwAL8FyGBlq?=
 =?us-ascii?Q?UFqlM3pDnsFH6Nm9QH07Tt3IaXtqst3neKK1KzcgofIF5UrCSDlj3quIJFtX?=
 =?us-ascii?Q?gmPp8kOiKWpSBuYBNp7P9OLzDLHzBgxRNT8/d6EXuO7MzXnqu0FF2OiMfMX2?=
 =?us-ascii?Q?1DGn5Gt6zA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GI0bw1eYpTOPr7Gs2qMesp58C7h79+OTJjoOlv/5S3jvt2MttxjGibTj3aOhFaGq2Kl18Vqb3Cxa2isGC/VOxQByG+WSvqaOe53lC2jzIG7pypZtazaBrkc/P1q2HA8Y9txMM6CUYMFQ/0c2hdat9GbWRFsHzy2ih73fwWY8CU4p/XK6cdlw2OIXTSB3DP0CHdbsGCoQoxJACnD16WDI4Y+OvoOK2FWlZnN/zd3KnEIzaKYGJMZQQYpiOJbU4GjxmfxuQ1xHj//3ASQjOAKPC5zAeMLHHjFQM+VMueGpCnyU8POaJD/fUHAZ3gg7rKQvCT5F4DlpFv4nf6bE3+W95A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55e1342-e362-4739-e28d-08dede71e20e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 10:56:23.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bVCUJ+Z9evQXb4CP3iTepYSgC9b7/z1oXwa0pfnynD1SHDx5YXB2AyRx6GT+tUlDDc3O4qeV+f/35WOanGDxGL7ISVKHfzWB/fZWtzE0kU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
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

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Friday, July 10, 2026 12:19 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_force_connector_basic: fix force-
> connector-state for HDMI 2.1
>=20
> Remove igt_display_reset() before igt_display_commit() in
> force_connector_state(). The reset disables all CRTCs, causing the
> display engine to transition to a lower DC state (DC6/DC9), which
> cuts power to the HDMI PHY. HDMI 2.1 monitors de-assert HPD when
> the PHY loses power, so FORCE_CONNECTOR_UNSPECIFIED reads HPD=3DLOW
> and reports disconnected, failing the state-restore assertion.
>=20
> Re-probe the connector after the commit to capture its accurate
> natural state as the baseline for the FORCE_CONNECTOR_UNSPECIFIED
> check.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_force_connector_basic.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_force_connector_basic.c
> b/tests/kms_force_connector_basic.c
> index 4ea6b0e8c..ec8b0e25f 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -181,10 +181,14 @@ static void force_connector_state(int drm_fd,
> drmModeConnectorPtr connector)
>=20
>  	igt_display_require(&display, drm_fd);
>=20
> -	/* Reset display before attempt to use it. */
> -	igt_display_reset(&display);
>  	igt_display_commit(&display);
>=20
> +	/* Re-probe to get the connector's original state with HPD accurate.
> */
> +	temp =3D drmModeGetConnector(drm_fd, connector->connector_id);
> +	igt_require(temp);
> +	connector->connection =3D temp->connection;
> +	drmModeFreeConnector(temp);
> +
>  	/* Force the connector on and check the reported values. */
>  	kmstest_force_connector(drm_fd, connector,
> FORCE_CONNECTOR_ON);
>  	temp =3D drmModeGetConnectorCurrent(drm_fd,
> --
> 2.43.0

