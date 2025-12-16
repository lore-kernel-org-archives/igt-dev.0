Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936D1D5B161
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 06:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EAA10E0FF;
	Tue, 16 Dec 2025 06:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0mHMbfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D31F10E0FF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 06:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765866312; x=1797402312;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zwnMRGdoUNBpjly+ScYXQ0rYCehhM+8YkrYIKxLq6nQ=;
 b=l0mHMbfYhf1jQAWnOYDgQtejGJ0SoQbHLXICkymI/4VJLu0K8fEsgD+f
 blagJsLe2YNF2/9J1PkT0N4n8/i4KY0a4eDtBaapIw6h72IczdY8Pwg8e
 2T795hSfCHMDxqSf2Fo/3OAS7B883kQIFczW/PdibpNT1vWH4ySZqAkLf
 P237UzUG9eUvn8ZyFSgCHz2K7+0/S+XAV+A3381L4y7kOuWLjhNjcHXYZ
 Gs5sR2XI/jlh4FMlHwmWPM8YTDNaf3l6CiNvkVoT9STb3kMb60VOp3lFx
 JGBcNFQ5KhLWA1+Re/dsu5xvWYBZrX9x/3LbX1/dHllAZz4H92Bpd7A/C Q==;
X-CSE-ConnectionGUID: S0qL20hmQMiQfTbpyVmXHw==
X-CSE-MsgGUID: oes9i081QvWz1AFyLSl7IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66765159"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66765159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 22:25:11 -0800
X-CSE-ConnectionGUID: oxkxZpuuQVSUJsW2VnaKtg==
X-CSE-MsgGUID: JEj92pgkSuCTIhXtBIsFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197212370"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 22:25:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 22:25:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 22:25:10 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 22:25:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N416XbgS0Lck7w+nAKUugYvN2ri5g1c5VqOSfvmrbFBbxfBwOAzbLP1LRCRX7VaeMnZvzjPh0P0QEh8Dam1eB5ns3T5RAAEYKED79PQXrw/B9rcyYr3G3gwEHDZItLBscDvDEZl+RVeeS4QGP8bwCX1q+0cRnwJINCHVDHr9d8I7U2gGf+0Y6e1dy+ibAzdpEClZKu4YquybjjjMg5E8GmbCSqHD8swPeP4Zr6++EFU+njQuBtm5iePK+ioJ53Q9LPN69ngWc7QujJE0ECA8X277rJqKFuSs3/UGmMT6Y/V3jdDSaoJxXnQTvT9CEiiy9PdtFqwW7JABmzTbyLktoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJszDo1258w41GdGGWinpJLUdOV1o6UEbYQggHYTRts=;
 b=nhdFePPx+VnxRDZbbdavT90Pd5yZmD4vfGSKw/KAujpis6mxrXdukC4oet71fZCPfiMfS0O1fU7Bhu0KvYHziddOwGtB0/lsXfXGTvSLTw8XkK2uDbk68dEGHxxyGLogkVlMpcpDL95GXY/PyLTZYkjTnWA6u3ophWi42TUnhqV7l8uZ6F2mfSaEcPQaeSRDcHu8TsMim5herw05Np/QuFw8IKsgYYhAAUosoBWuN/wlt5NyVF606Gw127kYkdN68rS6mW2dC0Pv9y9Gz4a+1+Y82uAhSTPJ6XnIR1kbAQ70+GLiPseUq+kY0Cc4WBED+mDjjBHj08ILocxauZoZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Tue, 16 Dec 2025 06:25:02 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 06:25:02 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v4 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Thread-Topic: [PATCH i-g-t v4 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Thread-Index: AQHcbaB4Gjqqsa8/wEm6iXsQ69Unn7UjzYmw
Date: Tue, 16 Dec 2025 06:25:02 +0000
Message-ID: <DM4PR11MB6312548A99FFF21E8525234E90AAA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251215085500.2900416-1-karthik.b.s@intel.com>
 <20251215085500.2900416-3-karthik.b.s@intel.com>
In-Reply-To: <20251215085500.2900416-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7460:EE_
x-ms-office365-filtering-correlation-id: 28d97dd0-f492-4fca-7c88-08de3c6bd85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tLcU4t60342JlHPEW6lj8F21PeJwrMYeCs9m4ghqnDwfXn6mgQlt14LTneFS?=
 =?us-ascii?Q?c9SKVVFBQ/mmC34yaB9aHPa31OadnfCgEe77Wf9YBa2yqLp9zc6FA1NGv925?=
 =?us-ascii?Q?Jv9ZHxnFDHBud/dNkYZ8o35JggrCd9IeNRW28zVgU+u1bKDVV5Dc+MLe4gb3?=
 =?us-ascii?Q?DkO4kbcSv4bgKxjSvQbJmP7timK6WJFG0vfRaeFMtoJsa20xTrgmguNZPYZD?=
 =?us-ascii?Q?bB4iGOfgnfQzpMHL4mTundLmINkZwrf3RTO6v/i6uKls6YgGxpJLDb0Gf4wB?=
 =?us-ascii?Q?RvpOg1UqfuCspYSGqSx8a1UiU9QUY7qt/fgTtqhhdKBid/00B2lWiriXxHBM?=
 =?us-ascii?Q?dYNzr0GW2FNTcsvaDXn9JzOYD18V8ZVBbg3Y+pDFZtGmrVyJ/V8Ha9ZIGxQj?=
 =?us-ascii?Q?ddW/O0iI19LPvKnoe7aVAlUxR/VWA2I5KejpPX46hhG8Z0UMzmtfjm7Ic1vM?=
 =?us-ascii?Q?/JAifi6D7AVSSQcv0WwBF0fKDgAdPJklbTUm7wNFW9n+IXkUuTLo9zsN4U3t?=
 =?us-ascii?Q?NAvaHWKdD0eUHNdSep+4Tlnxl6ldJUK0mjzPH5+0gUz4QtG8IK2V8bGv4VaJ?=
 =?us-ascii?Q?i7X+CKhREzmLjcECqwoq4d32crcDkjJMa42NRcous2zhIm39t37WDZl/AAlo?=
 =?us-ascii?Q?Ag2phn+d9qlAfs4twFStsnkf2o+ymUePaW014xJa1+nA7OMkY67jozM+1mHu?=
 =?us-ascii?Q?gZ6qLTf/b7dM8AQVktolJgJX5La6d1xAphD/HFpiBoRlgK/DrgfjDb2O6jgw?=
 =?us-ascii?Q?uNtCQyQGY5GjXwnp7myollrf842mW7qb50lf6QtPegKEPl90L2Y3M47V/iSI?=
 =?us-ascii?Q?FEH5QjksS/i0KAeNoLZg8xb44lFR3hgp01YFt1RM39h5IZOb6fQDpjoOmmCc?=
 =?us-ascii?Q?AOyXb5KlPn3/jlmLn2B7h6i8DzPxrFYLLi9Z5Pj4TOrx/sY0y4aJeJ4Z03Vl?=
 =?us-ascii?Q?TKQtmWDor3ZZxskYmLZLcCb6w1uIQNtipHBi0dYLimMhnxgh6tOjdoWW+ycV?=
 =?us-ascii?Q?0y/xVXB9u6/ojxlyL0XH+e95HYdvhiBtnYh9h9oG+YeSOgwxi4EXu11FaANy?=
 =?us-ascii?Q?Zvsv3ehTmlXCGkVt/gXKgY35MPXhMNy6ZzemqHmiuXfHiOpswUD7g/qNY/TI?=
 =?us-ascii?Q?nh1O1oWM5PKToM+z2PjFE3YRc5NYThGTlwTm3OfZvgGRdUER9feW78hRo0oe?=
 =?us-ascii?Q?fFOfgTk17ovPTQVHpR+Y/tuu43XOCIFOhFrnVmKVXLE14SyuJr15xxHz09J3?=
 =?us-ascii?Q?e0dgv9sgi2WoWfPldXwTUTg/SO56lMb/uS9KvJdbuhYlbv8vhsidKF1oJ5ol?=
 =?us-ascii?Q?1n3p1z8gKkR8gORB2vHZAlO/3kI8mBJClPrB2+3e9RT+Osq5QXHe3RacSwa/?=
 =?us-ascii?Q?bftE0QMYuurKiu7Qj6WClt88zEqIDfhiab9TAwhP012ZLdop58sHqcIGi+zu?=
 =?us-ascii?Q?RDVe8yCuuMpbm74MOsaE+DGKaaLdTrXxoRvaYo38fzddHa6FayqP/zm1leFf?=
 =?us-ascii?Q?I8JVZpLw2B1tebYR23IPnW9mcf15X8NxDFiZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0o8mo/NpuxEhAbdcO5Iphs9yOXJd+RIx5pe5e7OxdbPEycHLmc8ztFwU6kR5?=
 =?us-ascii?Q?5Qk4PW5a5Bouie4+d7nq5r172ORPnSopUHM7DDSv2bTfBgcrvoKReSMgKC5I?=
 =?us-ascii?Q?/LsBk+bXzbHDrEm+xTxD93CKFEcRmd8EKK6RDkZo6D7D/dogaFwh1yIUmnzV?=
 =?us-ascii?Q?ch0y/zKn83rvoJshnj9Y6zKTCPEoptpw9dfnapA38u8NEryIS7F+FbLIaMAF?=
 =?us-ascii?Q?Vsz/4efxsSiHiL6JDwGXfmaqmFzLjuzlgOynaZa7zs5Czd/vIG4VE01HHOB+?=
 =?us-ascii?Q?AaiVEkk2vQfYQYNbMg7RPisaMkBTlEq/sc2kwAzGpWeuXBPARSriq4XzpcLM?=
 =?us-ascii?Q?Uo8yhpwGvyFsWkS7UezW+2xgra6lEsDzA/o3Ifjj4tf3HO9ZnnjBnK+Jx+xB?=
 =?us-ascii?Q?q1ZaLaRPiDt3wQLz4LJEEmXdaL6do7GM097J+LmetV47eCwmXsCMJ+YeJ3P7?=
 =?us-ascii?Q?3trEFvy0WNKhRU4MSTGZ/BtHvhJc3omiOd0uyTXcq0b/r4NRWJ5drGdLpXoo?=
 =?us-ascii?Q?XJn9N0eWQlUUjpg+IUKrf3M1R5FwG74zZTw7saEsKsSzNLHG2enUhkN3QNKK?=
 =?us-ascii?Q?CDW6u3zHBJtFK56Yv85sz3mP4l55j6heq+n2oB+NA6flqZGRFlBM5qwWuo31?=
 =?us-ascii?Q?3U/isBKyaVxmQkYBk8CQ/aMMDn+FTUDtLr5dv0ysU5zYQdryvhDyMBgb96Zv?=
 =?us-ascii?Q?SY7C4CbYuiwaqnBydmsAdnKhSRBLBUnKg1f77b4iJwRNDyUkZNEc8MbV0+z/?=
 =?us-ascii?Q?R6wTp7a+CGfgQCpEvb/DbdAAf0/9K0kAxa7/TVOlDtBO9qZYq3loWbqwAT3A?=
 =?us-ascii?Q?fElA7UVNjZgZKwHZGH4PoPD8wI+4hT3kCYcOusNOND+TVBlymfQH6/UV+ccs?=
 =?us-ascii?Q?KS+wPROpjzQi/KSG+PR5qmbDydPYR7QaQ9B0JDVCWwh9lMibUnflPdMIWeg2?=
 =?us-ascii?Q?+jLapIIH8MvfUGHcwu7BYm0Rw27L3RbiaDlSESOj0Z2LpLFmcXW2X5XQRzqo?=
 =?us-ascii?Q?rMEO4gd8Lj/e/caFTE5jEb6pdSPraBrP9dRD0jF8TCAcRHYDU7KxNSaRQOH9?=
 =?us-ascii?Q?HHIGVo4OVSQ1Cq3/8Uo5KtekkT1FpxqpJeGisuq6NOACD8f5Exx+me31HWXh?=
 =?us-ascii?Q?9fiHfYrCo53fOBuy8SdU69KYNr343cR6mkeZBsAiA0i924RWoTWBv35cPQHS?=
 =?us-ascii?Q?0nacD4sKHz8i4bOkF2v3QZePHfs+2nK17w45BSLyRRq9Q0vuz7naHU12F/ta?=
 =?us-ascii?Q?ALfbl+KQ44RaUjJTfUKUYyEJhcvOtv9dpEUkHjcRWvICBKWWtDSB1EhoT+69?=
 =?us-ascii?Q?d3W+kM27dJq25OPOM8gP0kqTrn3zizFqElVYWBw/dU7IY2GXbZhC+gkKZgGU?=
 =?us-ascii?Q?hDNm3YHmtXp/TKQoa9W82N0QuiyAIhAzBdIuEdAD+qciJH+uTuaxNwZChan3?=
 =?us-ascii?Q?Vtd6f0MbW6N73+h5+2Y2/gqL1XSnN+7ZXhBNkj89BoAW2Xo8GhGlDmbHAvCk?=
 =?us-ascii?Q?Yfp3JdOKzccMe5HTuAnUwBREzOCxm67LF8UzSAd2mmPC5Ui8zssXVvve+w0d?=
 =?us-ascii?Q?jIZ2DWcW34/bO2PUh0c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d97dd0-f492-4fca-7c88-08de3c6bd85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 06:25:02.2370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4yVjpdQi8eO7NnilX2znOSOYblunI2oe4DaK1nEDvv2iPChteB9YBGsvQT1RYeX8aVRjbd5Oi0iWRkb2rnFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
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
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Monday, December 15, 2025 2:25 PM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>; B, Jeevan <jeevan.b@intel.com>; B S,
> Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v4 2/2] tests/intel/kms_joiner: Add function for pr=
etest
> checks
>=20
> Move igt_require checks in individual subtests to a function which is cal=
led from
> all subtests to avoid code duplication.
>=20
> v2: Use enum for various joiner modes (Santhosh)
>=20
> v3: Split the function for big and ultra joiner (Kamil)
>     Use igt_require_f (Kamil)
>     Minor Styling cleanups
>=20
> v4: Move force joiner helper to lib (Jeevan)
>=20
> cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_joiner.c        | 93 +++++++++++++++++----------------
>  tests/intel/kms_joiner_helper.h |  5 ++
>  2 files changed, 52 insertions(+), 46 deletions(-)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> f8e684b47..9af94bc62 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -101,6 +101,7 @@ typedef struct {
>  	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>  	enum pipe pipe_seq[IGT_MAX_PIPES];
>  	igt_display_t display;
> +	bool ultra_joiner_supported;
>  } data_t;
>=20
>  static int max_dotclock;
> @@ -179,6 +180,32 @@ static void set_joiner_mode(data_t *data, igt_output=
_t
> *output, drmModeModeInfo
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>=20
> +static void require_ultra_joiner(data_t *data, enum force_joiner_mode
> +mode) {
> +	igt_require_f(data->ultra_joiner_supported,
> +		      "Ultra joiner not supported on this platform\n");
> +	igt_require_f(data->n_pipes >=3D 4, "Minimum 4 pipes required\n");
> +
> +	if (mode =3D=3D FORCE_JOINER_ENABLE)
> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +	else
> +		igt_require_f(data->ultra_joiner_output_count > 0,
> +			      "No ultra joiner output found\n"); }
> +
> +static void require_big_joiner(data_t *data, enum force_joiner_mode
> +mode) {
> +	igt_require_f(data->n_pipes >=3D 2, "Minimum 2 pipes required\n");
> +
> +	if (mode =3D=3D FORCE_JOINER_ENABLE)
> +		igt_require_f(data->non_big_joiner_output_count > 0,
> +			      "No non big joiner output found\n");
> +	else
> +		igt_require_f(data->big_joiner_output_count > 0,
> +			      "No big joiner output found\n"); }
> +
>  static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_out=
put_t
> *output)  {
>  	drmModeModeInfo bj_mode;
> @@ -554,7 +581,7 @@ int igt_main()
>  	data_t data;
>=20
>  	igt_fixture() {
> -		ultra_joiner_supported =3D false;
> +		data.ultra_joiner_supported =3D false;
>  		data.big_joiner_output_count =3D 0;
>  		data.ultra_joiner_output_count =3D 0;
>  		data.non_big_joiner_output_count =3D 0; @@ -574,7 +601,7 @@
> int igt_main()
>  		is_dgfx =3D is_xe_device(data.drm_fd) ?
> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>  		display_ver =3D
> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>  		if (is_dgfx && display_ver =3D=3D 14)
> -			ultra_joiner_supported =3D true;
> +			data.ultra_joiner_supported =3D true;
>=20
>  		for_each_connected_output(&data.display, output) {
>  			bool ultrajoiner_found =3D false, bigjoiner_found =3D false,
> force_joiner_supported =3D false; @@ -630,32 +657,25 @@ int igt_main()
>=20
>  	igt_describe("Verify the basic modeset on big joiner mode on all pipes"=
);
>  	igt_subtest_with_dynamic("basic-big-joiner") {
> -			igt_require_f(data.big_joiner_output_count > 0,
> -				      "No bigjoiner output found\n");
> -			igt_require_f(data.n_pipes > 1,
> -				      "Minimum 2 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data,
> data.big_joiner_output_count, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data,
> data.big_joiner_output_count, false);
> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
> +		igt_dynamic_f("single-joiner")
> +			test_single_joiner(&data, data.big_joiner_output_count,
> false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("multi-joiner")
> +				test_multi_joiner(&data,
> data.big_joiner_output_count, false);
>  	}
>=20
>  	igt_describe("Verify the basic modeset on ultra joiner mode on all
> pipes");
>  	igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_require_f(data.ultra_joiner_output_count > 0,
> -				      "No ultrajoiner output found\n");
> -			igt_require_f(data.n_pipes > 3,
> -				      "Minimum 4 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
This should be to check ultra joiner right not big joiner
With this change code looks good to me.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> +		igt_dynamic_f("single-joiner")
> +			test_ultra_joiner(&data, false, false, false);
>  	}
>=20
>  	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>  		     "when the pipe is active with a big joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner
> output not found\n");
> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are
> required\n");
> +		require_big_joiner(&data, FORCE_JOINER_DISABLE);
>  		if (data.big_joiner_output_count >=3D 1)
>  			igt_dynamic_f("big_joiner_on_last_pipe")
>  				test_joiner_on_last_pipe(&data, false); @@ -
> 670,9 +690,7 @@ int igt_main()
>  	igt_describe("Verify if the modeset on the other pipes are rejected "
>  		     "when the pipe A is active with a ultra joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner
> output not found\n");
> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are
> required\n");
> -
> +		require_ultra_joiner(&data, FORCE_JOINER_DISABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>  			test_ultra_joiner(&data, true, false, false);
>  		if (data.non_ultra_joiner_output_count > 0) { @@ -681,12
> +699,9 @@ int igt_main()
>  		}
>  	}
>=20
> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes"=
);
> +	igt_describe("Verify the basic modeset on force big joiner mode on all
> +pipes");
>  	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "No non big joiner output found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum 2 pipes required\n");
> +		require_big_joiner(&data, FORCE_JOINER_ENABLE);
>  		igt_dynamic_f("single") {
>=20
> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>  			test_single_joiner(&data,
> data.non_big_joiner_output_count, true); @@ -703,10 +718,7 @@ int igt_mai=
n()
>  	}
>=20
>  	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum of 2 pipes are required\n");
> +		require_big_joiner(&data, FORCE_JOINER_ENABLE);
>  		if (data.non_big_joiner_output_count >=3D 1) {
>  			igt_dynamic_f("big_joiner_on_last_pipe") {
>=20
> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> @@ -724,14 +736,9 @@ int igt_main()
>  		}
>  	}
>=20
> -	igt_describe("Verify the basic modeset on ultra joiner mode on all
> pipes");
> +	igt_describe("Verify the basic modeset on force ultra joiner mode on
> +all pipes");
>  	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "No non ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> +		require_ultra_joiner(&data, FORCE_JOINER_ENABLE);
>  		igt_dynamic_f("single") {
>=20
> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, false, false, true); @@ -745,7
> +752,7 @@ int igt_main()
>  			      "Ultra joiner not supported on this platform\n");
>  		igt_require_f(data.ultra_joiner_output_count > 0 ||
>  			      data.non_ultra_joiner_output_count > 0,
> -				  "No ultra joiner or force ultra joiner output
> found\n");
> +			      "No ultra joiner or force ultra joiner output found\n");
>  		igt_require_f(data.n_pipes > 3,
>  			      "Minimum 4 pipes required\n");
>=20
> @@ -754,13 +761,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "Non ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum of 3 pipes are required\n");
> -
> +		require_ultra_joiner(&data, FORCE_JOINER_ENABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>=20
> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, true, false, true); diff --git
> a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h index
> 8a6f8e5ad..6d21e7eb0 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -17,4 +17,9 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  				  uint32_t *used_pipes_mask,
>  				  uint32_t master_pipes_mask,
>  				  uint32_t valid_pipes_mask);
> +
> +enum force_joiner_mode {
> +	FORCE_JOINER_ENABLE =3D 0,
> +	FORCE_JOINER_DISABLE
> +};
>  #endif
> --
> 2.43.0

