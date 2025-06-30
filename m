Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA7C7EE39
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 07:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3871410E206;
	Mon, 30 Jun 2025 07:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nr3PeTlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9F310E206
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751267609; x=1782803609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WY+89ojZ4tPk3oO1SbWJNjINVtu6UTXjC06pIlCn1uA=;
 b=Nr3PeTlbqVH+sjYxsYprJ+uxoNHGa069YcHq8KQaav7Tsz5nhdR6Ro7W
 wJ4zJwtKEw/pTKrVUYNoNEpFJfK9QC9jaARv84/9uOeZt9xXdCYw9t2pL
 6lAgS+9M3evp46QXWIBs4rGAVQq5LPskBaZq8F6rVewADwtyanbA7Zmw6
 EKHTjbnYeaLag+G3SiGvGHQN6mrbVhfubn22TD8mxm9gLh4Fi4q5pMIrX
 e5J8VA//lY41e0e/6ASfJHHrYr8Ju07ctev53BdM/GM3s+7VznfkuRUyj
 zJTPvRT0CJL6mhqYvC4gt3oB4qJMxErNVFrSbu5Y3MQZ+Yr/cwjsHBr3m w==;
X-CSE-ConnectionGUID: uCLWzYUuQ52kDDtGL9if2A==
X-CSE-MsgGUID: a7aFeZedRrSPPJXwnUDgWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53359926"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53359926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:13:28 -0700
X-CSE-ConnectionGUID: 7bSoVQKWRHCBN57VnofX/w==
X-CSE-MsgGUID: wlvdNqd2Rcag88ZuNyMdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="157651503"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:13:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:13:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 00:13:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSR/LUxrFqE12rPaiirWgb5fIgu/EsmVU89WbNay6S79T+4CtCtoNIXCmRHsM3Mxdej7NYRPClvSojc61OwqXlWwEs9XOr6O0+rbh9GRr9HUva1zuNfE+Gdf2EQ6vqiNPJ0f51r5OD1v0MugPOw54sgMqfIqbJJZUstc1O7TAzvG6wmGna4YanV3Ryorjvnrdr4O2T3FXVFh4SvmLqGMT2RJeqqFSoL9IRMKZcJqwi+NqjemDZKFNtERCESjbTc0sZdbCvknwjg63K9j5vmNZKF5U0zYRMUrL+oUzKRqbsyhIpGSllQzBY8ntx+QEucsf71r4LHVbwFsAdUNtb8nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW0DQMAs+cJU+zU9CilvZ/UaSWcmmP62MvNZK8pmE+U=;
 b=OCqkAls9VxYwSakdSNAV/BydruhQZuykMIiDHjPhKRrg5oVOfGLrKWlXOBxKOCIrLRkRJEYDLftRag9IfDQUMOIQtHsFs7VLDWt95MSSslh8AxGjRP7k/LnmwkO2O+5G7NLTtpVcEHdrBFwqHQEXXVy8pj7bnWuLTdRcfnLS8TrqmAHVx6WnsBb/hEOuBbLIJVkFOgXGUfNwJMjT2mLu/NebBCy3BPIkLKyUy8DJMmty1IqAjZ+BwfOphL1tlr17cRtmO8MqFupr487OPNmIrqw2iJ/qYEhPCYYHc64VUEuglwV5vQr47TkkguSxg9lDOusmatbfYQYumoJ7hl/egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.30; Mon, 30 Jun 2025 07:13:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 07:13:20 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 2/5] tests/intel/kms_dp_linktrain_fallback: rename to
 tests/intel/kms_linktrain_fallback
Thread-Topic: [PATCH 2/5] tests/intel/kms_dp_linktrain_fallback: rename to
 tests/intel/kms_linktrain_fallback
Thread-Index: AQHb5cuWHx9GywjH/UWCGg53dUNjRbQbUTEw
Date: Mon, 30 Jun 2025 07:13:20 +0000
Message-ID: <DM4PR11MB6312F7E7F3F2BEAF0527D8969046A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
 <20250625123402.3929358-3-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW3PR11MB4684:EE_
x-ms-office365-filtering-correlation-id: 2b5a2b9c-8518-4eb1-ced5-08ddb7a5980c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?O9Pa/d5EzKYo/zVAp2PBEtrJ2UKm/lt7/ry7upocyAhQM1lwx41FQqpmJ7eC?=
 =?us-ascii?Q?PH0qUW0H1q1A2zzAP7vvGDGJvgQeI171t4AcAg+QS8ERmj6acamtqWXd6sqW?=
 =?us-ascii?Q?cigF+z6PV0waYwvr2h1d0ZEwlshNaCFiZM9eHzCNP2wUTTGEyhcEVCTr1+2q?=
 =?us-ascii?Q?QgwIKsIbEwDtEnuxfhh5Ypz7EbZ9/aRmz5gLYODFNSaxUnR5YKKuQLpwTFxZ?=
 =?us-ascii?Q?3Wqe3WOql6UaIgfe7gLs3I5H2hybRkYw1yD9HZW6kEmr9/TA7udnDaCcZ1aQ?=
 =?us-ascii?Q?QuK9+DAI3sBQRR+fbzTYUoCbCBBpVy8G1t0eqchWxMfIfMCBitXamEB2vKiT?=
 =?us-ascii?Q?oqmaPUEfMs+YEHpsph6o1cXvQXi7RySxqcN3m4eKhah0zE77MWYWC2BUSj8l?=
 =?us-ascii?Q?9XzuN2dNAkq0upEmBpmuUq6fOLJDO355A2XNClg55q7JImkaiB0iqR603eFm?=
 =?us-ascii?Q?4zwAV55A3KDCJo+mtRre9lwj9ZvCnCXpXvWNNAUN7ijMxIe0AnUnavqeXywr?=
 =?us-ascii?Q?AaN9huca/kIqQgCxgCgiz1pnW59x5NppGuwia/5QcPhwiZPfLRBkhPEkBH9U?=
 =?us-ascii?Q?2IfaxPiXQ1CtaIODJaPMs2XxtxTFbL0xSbsT14/LcA56TJmlhjzZSHI46Dh3?=
 =?us-ascii?Q?G9xCApCmdzM4ufqcj9gpg46nMcqPXPCZqTm+/MT3Xk9pvM2tqo3/Pionc/xc?=
 =?us-ascii?Q?9NLtrNmt/f28skzgtHvcy+NwVSdgbkkYoYeL0EA5A0sItBAe/55RV7jNuYn0?=
 =?us-ascii?Q?oBlVK2iaUKVE4KszXiQwjtBKZ3N653tpawajbGDCrgsCniOx2f5mtduM+QGY?=
 =?us-ascii?Q?LWfK5sOaPd26tBZMcWHjQkIygXo3Kdus0S/gBD8h7lOrg1XioR27pWVgMCXv?=
 =?us-ascii?Q?3woYEn2QexG7BkCmQM+0ahggTOLv4my2muoVxVriBqQxKS3txD/+inn8korX?=
 =?us-ascii?Q?+ph1kccX4JMoAMWThydyRgijTiNIftqexEJcs0Rh+GNxMPLtenTK5wprh48e?=
 =?us-ascii?Q?WX63lUnyvq9xhwmaY2FXXT7LIkapDDD+RbWlbK/+cZINN0maRpVPplyV0X7z?=
 =?us-ascii?Q?0q82ykCtevYaJ1jsPjtBmmEeg9+Coby7E0c1eEAcx/UkEZowoiRqwzZULt5b?=
 =?us-ascii?Q?7TiY2+Jt0k/WAZwN8TI8zvsTlj7ZnysgOzXJ91YnX9vVOu7Qd4dC6o67DpYc?=
 =?us-ascii?Q?OS9kbnGgl7Hpyi0rDFDuZnUDb9pyLu+dOPe8EMJ9Lmy77RcAM46aP4GodNDc?=
 =?us-ascii?Q?5IeGRCvkQhoIi9D1SMq68uvAeqhCue937hxKbNCyK3W0WtqoCbsIBYJ0HvDm?=
 =?us-ascii?Q?xbSDHiHB5sZwbLITwVug+7Gigkk99OVwUsAzgoQAYG0X+yw4dqb1JGfmYp9z?=
 =?us-ascii?Q?RhCQ17VaWqdT76laIRBBg+OlLqJjCvagx/OhQVddeeXlX/nuWOCczBCJYo6t?=
 =?us-ascii?Q?uqR68rDmbDPsfNdsas7PdSOo8nJmIXrmgQ7OW7lrKe2rhabGIULSag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DCEgZLkEKZnbaWcOY91PO9LHHnqStlRUykGJ5Hn4tizkJA5SXOihkSotSCx0?=
 =?us-ascii?Q?94OlymdyJz5jvz35EsioeLeCJxEiwin5ey8xulgCFOCvRIOAl2/6tIOxSXBT?=
 =?us-ascii?Q?5Y+ALtdmRQfByoT/7Hecvfn7uWS2giKa/vc4Q7vAsqU3fbavQ6sIt45WqQ90?=
 =?us-ascii?Q?XPnM2vLkGQnwvZOcOS9mID1npe1heFFgf6oE1XhknK6N3weGoz4d5FXCbXE/?=
 =?us-ascii?Q?C//dXM4Kr2N5pZ5HldYx/hl+/DSz5O8wuQf2RnoEZ75tNfcNTiiEfzd+qDjk?=
 =?us-ascii?Q?oqrTxX9GsYzeDkqJtuTB1OxHHOSTzqpKl1mXwyoqP9WjeNPp0YnN6jw4RVpd?=
 =?us-ascii?Q?QRXgATmtxdO7kmcX0v/OncHabCacZMqw+hPUiSOeNcBjDMUsTeYU+K/4UNYx?=
 =?us-ascii?Q?VKM5ytG9Xin9BQbvw3gOd/Allt40eH0lBSlO66PJ8/KiV7z0R+39x+JNpX2a?=
 =?us-ascii?Q?QjYkvdP4ZJnDiTaAsbZk5Z11ivtijV1Jf7N6VvU7FibIxDaLp+x0QUKsDZJu?=
 =?us-ascii?Q?plXfp+hjfLVxTxn9YOSs03Roj+D0yMuxHPAne00yGl5KBE9IulrcQ3nPYLgt?=
 =?us-ascii?Q?BggAxZ2/hG/z23vUFBIFK4ZXgVb2MTqIQhMf4z6ettd3F8RPuU25hyL1egXs?=
 =?us-ascii?Q?1ZMttwfS1Mf8sw71s0VxRAqwVdp7XPRwLv1t7hdFnI895ZQjNf0/Dc7hHIFU?=
 =?us-ascii?Q?yN2gBbZPtk+MfhqH+55fmE9nrqrEPEB3WqI5LBGimNgxNEa9wII7SlOjBlah?=
 =?us-ascii?Q?UVJwQ6JDtAM+i9YFLn3z2IKrVuP0MwWbEqvdMZ+ESxO46rE9esKSWaI8H3I0?=
 =?us-ascii?Q?oC4mGtm1DjEdrNNSZYysa7IaNPn8MFn3lWR3GafLU3X7kTker3V2Zoqklfnw?=
 =?us-ascii?Q?kESxRQ0FKYvR5aR4MoGTZwvnrj5nP/LI3mNWQ85eiQRHfMhRGg8BO1gbqZZX?=
 =?us-ascii?Q?3l+29xjWmrbQkyCB4Z8Hm4IySBG2+ZRtV5Sj2tTOAejsj0GXbgtrH/0EW81T?=
 =?us-ascii?Q?5Cx6dY3s/8jtTJXQvtoP5/sYJpmn5gUd626umADGQDHc/LKL99nVIwRGvX/k?=
 =?us-ascii?Q?+7hNd4RhIgVa0iI7nAFZQGN9OCtqVM8JmbA/x1KhjFK/Fw5bjBAqC92bJtbz?=
 =?us-ascii?Q?z3qSYvr1KrtkBs/PnvXO0rtIdSzAmZXKPeM6Br+do79P3guuaf9qpdR6Rysc?=
 =?us-ascii?Q?HY8bno114NQDB5G9Z2bH6YJ4IzAa9mDtAJr44EETumvrqyxcDmuEOwh9GEa7?=
 =?us-ascii?Q?qgYzSCaBNCIZHcB+Ru1WV8rFPuDaogHTO9jDInAzc1UTICAr6G7IyAyViLXL?=
 =?us-ascii?Q?efCNLVwD1lRbvAWC6EM16Rps5tiJSwCA8haPMuz1YttBUpdL4rl9Ww35Wi4O?=
 =?us-ascii?Q?xOPm6nN99VvwHfvuGLFSpgK0XJPeQ9VvHTA8YAhuulBnXqQDdWDcXPrqyYWb?=
 =?us-ascii?Q?dKfxZOAFeIkZTtyscbte8LG1Sf9A7lvUigcTLzyAoRsyy1XTHtWGBA8ry8md?=
 =?us-ascii?Q?GsAV8gDVRQzqfU+y7Tujuw/d1WYRI2FIQ9/VOK7M/aS9drP6yt0RZVZ6oTJ7?=
 =?us-ascii?Q?BRXt8ochE/EIoBUMMko=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5a2b9c-8518-4eb1-ced5-08ddb7a5980c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 07:13:20.4901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8rLnTnjSUc1fBlEBdg+2lYBaYhm3dWnvr2VnRJXdfovRoVdRHZmAU5RkybOatKiJK7fYcdfYWm5hZKW/nMrMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4684
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Wednesday, June 25, 2025 6:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Deak, Imre <imre.deak@intel.c=
om>;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 2/5] tests/intel/kms_dp_linktrain_fallback: rename to
> tests/intel/kms_linktrain_fallback
>=20
> rename kms_dp_linktrain_fallback -> kms_linktrain_fallback and update mes=
on
> build for compilation
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  ...s_dp_linktrain_fallback.c =3D> kms_linktrain_fallback.c} | 0
>  tests/meson.build                                         | 8 ++++----
>  2 files changed, 4 insertions(+), 4 deletions(-)  rename
> tests/intel/{kms_dp_linktrain_fallback.c =3D> kms_linktrain_fallback.c} (=
100%)
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_linktrain_fallback.c
> similarity index 100%
> rename from tests/intel/kms_dp_linktrain_fallback.c
> rename to tests/intel/kms_linktrain_fallback.c
> diff --git a/tests/meson.build b/tests/meson.build index bfaa84389..1bbb1=
dd90
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -245,7 +245,6 @@ intel_kms_progs =3D [
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_dirtyfb',
> -        'kms_dp_linktrain_fallback',
>  	'kms_draw_crc',
>  	'kms_dsc',
>  	'kms_fb_coherency',
> @@ -258,6 +257,7 @@ intel_kms_progs =3D [
>  	'kms_joiner',
>  	'kms_legacy_colorkey',
>          'kms_link_training',
> +        'kms_linktrain_fallback',
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
>  	'kms_pipe_stress',
> @@ -374,14 +374,14 @@ extra_sources =3D {
>  	'kms_chamelium_edid': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_frames': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_hpd': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
> -	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>          'kms_link_training': [
>             join_paths ('intel', 'kms_mst_helper.c'),
>             join_paths ('intel', 'kms_joiner_helper.c') ],
> +        'kms_linktrain_fallback': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],  }
>=20
> --
> 2.25.1

