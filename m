Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96839D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487A010E368;
	Mon, 19 Jan 2026 06:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzN/LlvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9410E368
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768802488; x=1800338488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=POsHccvn+NdjcrlasdtP2tRn689MoJuvUTkqaf+yelA=;
 b=VzN/LlvJKvAzyMIuSnSrowlmGgyfvg2UrlAGdOzb7AoIBMw4pwE3yTbA
 /4Mvehsg0OtF5zWz7oTQEhIYq2h/ZHrUZp7uNpdD+UEeRMjRx+r+8zvSR
 0IzvZgdC4Cx5iK40z8E2V9wbH20Q3XRk9Y3YEEni8a2JQA7K0pyGx/fLQ
 ot9tY2ft7stDea5q9imT5pmyHHfQLhaAD7vjrdu4v+qhLt+zIc1/JzgGb
 bEiX05He/pJ/Wcmc7yV/jU3cmU78xeIpUS2+PGhUOgTEdUTn8Vf9D55ci
 sH1zhqEkF4o0+Yz5Jx8sUSq8HGMGlDU7PO0yY6rjvobINknfW9FXrX9ZS g==;
X-CSE-ConnectionGUID: ADJmMlkDTFOwIh4uBGrURQ==
X-CSE-MsgGUID: eqfYOLRRTvSmDEmZqQNLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="95483104"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="95483104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:01:27 -0800
X-CSE-ConnectionGUID: AUbSQecKTBCc1hVlEVvLgw==
X-CSE-MsgGUID: PV7NArt2Ruqw0BomFWXGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="206137826"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:01:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:01:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:01:26 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:01:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2rpp4PNVipAM3WuoPi7fz/uk0J2box+/3m2ntU8zl78kSXW9qLNEWrWs3ZaHVLFji5oWTpRmY9IliR2xMfCPJJIgj7Gk9/X8PHwOjNgJ3vPYnL4Knj4z1QkGjR0z6AEDP1MPevtcdHXhQJaJhVI++Oh4L6vA9uaa0dCkCltHUaN+fgN9U0L0ixmNIFkgYYyWBTtXbn+P80H9eY6arhhA/Ww2ccjEN2150UlKavwXYrB/7TbGjuApZKX7ZTo/n24pwLcYYZEw1HtBQWnQUdhB1g42BHPDpTJEaFrlUsorCz1s0K+ArDoVr3o+RBDAanswD/5o5m8hXR6wUk1QeImcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aRTctReKfUiHVl9U4lcgkS2zTlWYM8zpOlQpdulaxc=;
 b=twKoJlvWhc3nG6nE1s+iFpo+5m7BJWexmWT0mi68pP10zErxWWtDJJLDX1mgCVwv74z9WEgfib0uwjts0hLn2nepHDnNWAsIXkXZVJe7nRWYrfLx+S7qEHcVAnKm5L1daUaeDa8ndmp0dAQb+KKl+7WXCuxyY1RSiCHbXkyKmBGLUMYxkPV57V6bD6cx0GDcNUT3xydH0QEhz4UILHAx1VNtD6e60Ik69udxW9RgfgZG+RWjIwXuVMky2c/QUP662emcZQqK0yfsFMQMtjMhPXqK7U7U/DhY0tSY4V+/rz7eEaNyfpYstlA3zEC0CPbzSa+ukGN8OJdG0fVE5ZK81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB6721.namprd11.prod.outlook.com
 (2603:10b6:510:1ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 06:01:21 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:01:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Topic: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Thread-Index: AQHchq62ubL6WLn8v0a8uuo0dj3ztrVZAhwAgAAB0JA=
Date: Mon, 19 Jan 2026 06:01:20 +0000
Message-ID: <DM3PPF208195D8D8208F4FE6913A56503CCE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
 <DM4PR11MB631227E6A3CF40A741D48D7B9088A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631227E6A3CF40A741D48D7B9088A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB6721:EE_
x-ms-office365-filtering-correlation-id: f5a350c4-c0b7-420b-97e5-08de57202b38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?skirsC4A2UrX8KaixmHPWo/bciFwLnquYuhdD7CXdDJStkjbiO6R+2ED2D9J?=
 =?us-ascii?Q?hxryBePh71mOeC5d4wLFU8SUo1HshCUsJzOVGvDcsrNseElMu3JnvzDDd4Kd?=
 =?us-ascii?Q?ZzNC7bUcV3VedOYReqLAvQjFs1wUA992SG9vXcc4vqYFY/29qvAlAQJVgOYq?=
 =?us-ascii?Q?23zr2GyUZMWifwdThAtwpvQ1kRFBHmTgqlvEiN3Z1syJm0c3u5Gx/e7L+x+R?=
 =?us-ascii?Q?l3v1b4/fLyehujUVTk49ZgCiC/OmGqCpfUcd9M1NxFRFSiC64XbczZmHXgYp?=
 =?us-ascii?Q?QSa+8R4tnz6Drv5n9DNvj2nLKCVwJ9r7ntTdmZmY+Y4cjiP/fnkcBN+6536S?=
 =?us-ascii?Q?qiYw0j0hJTnalsSAD6Ie3pT0A2xi/KueCGs/cSWunowEvKn9R1MG1TvY55xb?=
 =?us-ascii?Q?Urp2sfPB7Kg/uTy5dpRfTdLdegkU6IfSPYDqmfHMPxlmCC/aSfMOgD6JVjxn?=
 =?us-ascii?Q?w45K8bnd/p2KoyOn7pdxUAlS9tHqEb8xY5cPg+74U+lKH+p3ZiOz+bju9m8q?=
 =?us-ascii?Q?PdIaGhlkFz5yxgY6nj1yCQvq6meyDuhosacwm/JJXjVEDMfnNhl9XrBT6vqI?=
 =?us-ascii?Q?dE+CYltcIROAQngPILNLgVoOvPCga+m5g674W3cOTau9k6xN31rK6lerNASL?=
 =?us-ascii?Q?QxJIXpTuQpaNKt5CNI6kpgKoP0lpIArxy6em3cgDF1/JykRRpWspqqIbFoiu?=
 =?us-ascii?Q?7NtnQtn8ESVsl+M7lIhC+kMPnmW5+Ub0YpJh0ojZeNEvCs8d6erfY/hvj0GK?=
 =?us-ascii?Q?aCkc4l7tQ/B5qAh6+HUV1dOMm6bWUPv4xCSiA/mCeSZl5034b2V+iC8HaxwI?=
 =?us-ascii?Q?vtGdohO/lyj4EZzpog4qPiDhL/oXn/3KGU5f5VjUie7Ne/My2iXQ3aVWc6Rh?=
 =?us-ascii?Q?484CgxsnFeam7bEZUfYE0Hd7zMLZ1WvOmTji6KDhPXNvmQoOP/ur5gz/OB4M?=
 =?us-ascii?Q?17qZRI3+4mMhFuJlKn831UyDMh1r3G9yuUaXwtE1Gdpk1Ku+c94a8UbSXqgx?=
 =?us-ascii?Q?OX9hx4W2CLAN/sp9+wIPwrP0sv1OJY/bWDxEAOAnMniuumBbriwP0NYN6ca2?=
 =?us-ascii?Q?0jlo+wNrVtzYYtx2yEHyaDB1Nxhp7QafQjyz1rF+ZjuTvQMxAqRS2OMsRckZ?=
 =?us-ascii?Q?j1/taRPkOMR4l+z16A2HAORDOM2xYRvw1cmedZ5Sv9rHuaG6XpmqG3V0+1zt?=
 =?us-ascii?Q?vbWLVMDDOWH1XtCtgf19QDeelo+mcRIFFiX3xyi3DCM568C7ahfyaTxWq0/I?=
 =?us-ascii?Q?Hwgown1XSYOmLLwjkZ/DVZntvbG/H0cERfvAFyK42XUznjVLoBYOlJVXjykh?=
 =?us-ascii?Q?d9pEATGyQQFhXbQfzOrQB2JFRGdzKAh/ymIUMJO1i2GkakjBGP69XooKutpQ?=
 =?us-ascii?Q?oh+QSV+icPQSxxQFfI7NOMz0xZk6Hs+fT2h1Ze1Q73rh/UpQG1NFGvFNbZuG?=
 =?us-ascii?Q?39zTcFWVj7r/CBAnWvXZSPc46khkVjcf3NN2DlfouBLV5EMJ6zZSEDYpi7Wt?=
 =?us-ascii?Q?0P8/h682hoUiFqLCo3PbO6GY1VoHe/EsHIGB0R9mEcW+uAOfWgdTqEWsmT58?=
 =?us-ascii?Q?iipKcfDNeYM9U2nWzdC/2vJ6PGnL6ov4iG4T5Fk//0RAWQQdLp9bBUfLU4Xf?=
 =?us-ascii?Q?2dtZqxSz4VSlnNFgRqm8bNY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AwZkkjkruJ+qJ17M/8jC9QhubrFqtd7t6xezRNJSarqD+7oLiUEKFNStlF+U?=
 =?us-ascii?Q?L1N/LiH70vrNdBZ0Lz+8EQ6UT65xGKF7E+ntRordsWJ+zCoXuyaSPsT4+TJA?=
 =?us-ascii?Q?bGnxiy3+jfsRW94yc/jj0b+QbjPk+GGg5qjYJYLw/zAcrqbQ+MSnYfwND4Ku?=
 =?us-ascii?Q?v43Y3xpjnsEPaV9YT19s2GS7vwEZJXui7NWgWWpYlfrcoGq8W7meW8Dq4nb2?=
 =?us-ascii?Q?rpFllki2pVuc0iosU63q7vrXNVKxpkKETAXv5CKSJo+XF+kYGhoQAdBM9ybc?=
 =?us-ascii?Q?BTcv48j44BcD+dMl+tMkFKAsv9dj0sB64qdx+GdudQ/c7EERvcXvoXCtgylZ?=
 =?us-ascii?Q?lEczctYjaTNnMEjcacJh8kG2cczkSdY6wtO+HUGaPHCoxg5g5dEOgIXcd5v6?=
 =?us-ascii?Q?MkRtiXpqboQ8AL9J8AnYyGPgLM8m1YrNcTtRHUiSs0PIit3hTdep9ntnyHRu?=
 =?us-ascii?Q?UDrNDbiLWJxyrq/BK9N/AU83kVDzbiZbqphRK3TMuZgTP1JgM+cktUz7pd1G?=
 =?us-ascii?Q?9PUYDsukaM6uHScYg+cDeDzYan521lu8++kbmwo6xS146mmsr7vLrpcUO5RT?=
 =?us-ascii?Q?V19m7C/XLTXTZ9JBwhzyseLS3X+pICtn8AlkdUUw61Y6TFgTE0Q1wApraxsq?=
 =?us-ascii?Q?RgC4iDyf4FVN+ypulTYjOVgyec4AQQ9Q95HtMVSeQf6gITx2Hklkuv5v6OO+?=
 =?us-ascii?Q?OzBziLnf+CTkYp1rAQEcy17rmwYY7bnfasYopkkV4ogbzXrf1WxoFPbgh5LQ?=
 =?us-ascii?Q?dZiMdCja1hcoshmJlEDbCNlIXGoJhvW2/maHPRPqvVrVSoFej0M6Z8mRo/1J?=
 =?us-ascii?Q?V1utpDVtHEgEkC1PUHDn/LB+cQ5DKJG/eoz+I6Q6uQeRDPIXPs1ovZDdKiEV?=
 =?us-ascii?Q?2XsIGxyiTjgsiCsh1s8TM5Y4IlbX+kvm3gOoId5pfiZP0vmQ988M+yrveWAn?=
 =?us-ascii?Q?hik9+fRX4Xanqh278KFI9CSlSw03f5GML0WsnLvYT0C325duaPLP3eCv/DmN?=
 =?us-ascii?Q?y59L2cFJ8+R5NxWfa/hdjwIfMH4WSmi3umLzBvY5gjF5iXVZ/xcE9G2+rnWe?=
 =?us-ascii?Q?xjnxO3frPzsCWmc2t4Yq/yYefc3XhDQBPoVwjLpIp4ozoux4cJLSEMtr1dZG?=
 =?us-ascii?Q?hp65Hk0ZcOinXLSbVv8wRvgfgfWP5LrXr9E3an6XATc5JuXfFZlci8NpcxAp?=
 =?us-ascii?Q?Tre2DJK00Mc+qyNHcKzG01n1m8tkUOgg1pu7eg0xcXW0BcbFLBjTX5AxnF+Z?=
 =?us-ascii?Q?EpZPZLvLW6ajrFTHu3bHOEVm131wjshYLDflCZaEJd5euk3aJoRQZXkbFL1T?=
 =?us-ascii?Q?w3OF8P2RmRvNVung2qcIQ8qy6DSS5eR0AlRIDF1KZwoOFmXAZ7vZeLDzxfjJ?=
 =?us-ascii?Q?vQaet8XcyPr7CeWyTHiGiCoiEh59LHDb2gkZqgF6Y7H8+wNCaLPZoBHMb04T?=
 =?us-ascii?Q?TfIwFJqgLA1D+h2gMzTiO0V7Ym+wQmwbXuhLTJh040TOEciK9PL1kF/y8nZk?=
 =?us-ascii?Q?unyPKjrrwNe7YydxUWxTYnvAfPqmZ8d+XF6FoV8d8/hTbKuESg1wSkjsYzZp?=
 =?us-ascii?Q?Z6bGAURGw32de0VL/qymHkoa7AGegj7eJyYqSA8mrPmjg9BMinCDIBkicsl1?=
 =?us-ascii?Q?iLij73ED2z0P9zIx17uppMi77zf+pg9WiUHlhoo0QeyD2uaT7NEF4vK2OulD?=
 =?us-ascii?Q?1hxT27sC2obNlGMlEYam33aoB+CRmY/JsBcM2caEkywya4JeD9QqKmnlSBh0?=
 =?us-ascii?Q?RXMNMukmcQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a350c4-c0b7-420b-97e5-08de57202b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 06:01:20.7612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9cXkjnw2ObD12jUBPvvEIxEs8THvTtQ6Dg6cSm0492Ucnn6J9tI3/wWoXxaojcf+RmZnxUvAptBaimhJ3DEZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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

> Subject: RE: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for=
 cursor
> fb leak
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Friday, January 16, 2026 11:40 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t] tests/kms_universal_plane: Add vblank wait for
> > cursor fb leak
> >
> > Add the vblank wait even for i915 as the legacy path uses the vblank
> > worker to unpin cursor fbs.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Can we add fixes here if we are closing any bug.

I can add a closes tag rather than Fixes since this change is coming from t=
he updated kernel=20

Regards,
Suraj Kandpal

>=20
> > ---
> >  tests/kms_universal_plane.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> > index
> > aa5927cdf..9ac6d01b7 100644
> > --- a/tests/kms_universal_plane.c
> > +++ b/tests/kms_universal_plane.c
> > @@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe
> > pipe, igt_output_t *output)
> >  			    COMMIT_ATOMIC : COMMIT_LEGACY);
> >  	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
> >
> > -	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> > +	/*
> > +	 * Since unpinning of cursor fb occurs during vblank in xe, i915
> > +	 * specially in case of legacy commit we need
> >  	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
> >  	 * 1 additional vblank because vblank event is scheduled before
> >  	 * unpinning. Therefore add 2 vblank wait to ensure that all
> >  	 * cursor-related framebuffers can be removed before counting the
> >  	 * framebuffer.
> >  	 */
> > -	if (is_xe_device(data->drm_fd))
> > -		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display,
> > pipe),
> > -					  2);
> > +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
> > +				  2);
> >
> >  	/* We should be back to the same framebuffer count as when we
> > started */
> >  	count2 =3D intel_gem_fb_count(data);
> > --
> > 2.34.1

