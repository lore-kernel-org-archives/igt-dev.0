Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6499AE77199
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189110EA39;
	Mon,  6 Jan 2025 22:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVbyCe7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D3110EA38
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204309; x=1767740309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=puPVRPXFKLeCRomyiAOJgDeojdGVgcC8cSycsyBPyag=;
 b=OVbyCe7kyiTtkDTlOsuXDMSaZZjZJx3ok/uwgmhfXodMrKdG+6Qb2HkP
 Jtb5bDKdJe7Rl8k4KYB93s8SDweVe1wk4IxGCO0scDamX+NVKuh9sI+mD
 5JLKFCWEq70FMXNUlKZiEF3za9Upf7EQzv1pThcsghRNfaDG0b9zkrukp
 8Ly6SGs8aeuglNH6brbjrNds6fb2aGa7c9vZOhYQ3OrV/rrziEJrlstQY
 3Ayz6NpFcfy7Fpgxb/h1f5r9uzKmfCTNh4B2oZ13MB9s+tks5zG5K8d4C
 IvLVOH3hTSazd0R+cBGpUEy7GqyWCZbkEFf5CwQjIl61/Y4S5isDsTGzc w==;
X-CSE-ConnectionGUID: mN/KjebESJ2BUqcnZZdQzw==
X-CSE-MsgGUID: jtVuhJk/S6iyS1BIAP0jbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36383081"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36383081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:28 -0800
X-CSE-ConnectionGUID: C3NW5kA0Tuqir+C//8PiXA==
X-CSE-MsgGUID: IyPDn+jcQFegukP/eZ/Z5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107535729"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:25 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UE6yC80pjFzgxyBYMI5VJvwqQ2tPOyaCLcMW6/1R2HCektQ2Dkn5WolsUBJjQR5y/6mrtdx6p/Lq+0RAqKFokH/JRzmIeaKaBr2G2uVupjkmSdtUj0F+f3q2x6ufCZY55JaF4MdfX1dh2RJ1U7CC1njWsIk/Q/nuTWoQNRYvVHbqoWyqHRbbD1807rdo33wRluWeRoLr53dmZMoWU6IWEkQhkXG4FT5xKz5JyrtqMxt5p4PiK0QL6SOuPDyKOkTakySXJnN2IYGBnB9oDLZj7k05DCmVJBAhG/yGUJcn0niayWKWSIzepgQ2IODWPlaijKOQ4DybKaEe0CQT5obf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRI+kZNurnJCWL593jqO2HxX4zGWQ9lAO4GtUvCNb6g=;
 b=mgTAIeaXoMbJCztrOVySNcCmqoEnTFrrdmn4c6W/22+srEMAsJuGPaGK9HRbYW9hx+6tHnKqkrriQKQ/GTuSZYo4rPH2MnMspMsLbBhveCphiWvvDRTynFcnXJMayqp6hKfEeWcv/3DA3jCiGxyVpSi+WkV+7M4GBUs3nCZUuALfMzrsv152l5BjE9/e4NdIv2qQyBfMYWqNVBAbh91ADhts1fKmH9H5axouOQqJqwHczBeRuBHiMKHP5n3s/RULWcKHvFJeOyLajEsXFAD+yitkdS/DUmK6GP8hIXXLGJwju6WI0WsnFKp5fE9dA4upinnYSPEG/8Fm/Hj2zifp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 4/8] lib/xe: Rename xe_is_gt_in_c6()
Thread-Topic: [PATCH i-g-t 4/8] lib/xe: Rename xe_is_gt_in_c6()
Thread-Index: AQHbXniOOW3TXlUM5Em/UMt0T3y9H7MKUCpg
Date: Mon, 6 Jan 2025 22:58:18 +0000
Message-ID: <CH0PR11MB5444CB9235595AB7CCE9742FE5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-4-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: b6aeddf0-db51-458f-2e0d-08dd2ea59c4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XpwHd7LDNx5idrk1EAwZ663H+WHNAVE+d92+u5SpkWoA8a3w4IbO/qSyF9E2?=
 =?us-ascii?Q?uvOIwcUx25BRZMR5EsTpPmrAfSbMrx/X8K0QEbmCFfulsQw6hzKHHkt+XeNy?=
 =?us-ascii?Q?nWRLA7YyJGOZSqzCzhu9sIgMvDstlRkniyFEOxzTDoYxs3TAZxR/dqjYTnb1?=
 =?us-ascii?Q?t6ftWrTRhkkZdbYUUCoUUZLWnc+7VQBO537gVNXP6UJeS8JVorH4uSlTNELa?=
 =?us-ascii?Q?kHxfDkvZXWlB//KaKmTJ/YVy794ecEFYyqgV+oURi7sLTtUduOZHUj2uzx8j?=
 =?us-ascii?Q?LOElyzWE6p0LiyEqNNK7Z6Kta/U9rGiJMZuWWbwJqDSNG+2SwE4Ul9TnHIeH?=
 =?us-ascii?Q?hqx2/FgPYDGfhn6PSAojLCqsDd9DcMFY/9Z6AZZIIkAsqpnMon8aarSChro5?=
 =?us-ascii?Q?Z17WI2Sp2kgeTtlJgCrU596XCEG1jasRGMWYvDLTxeE5js1xy9oal5Gbc8j+?=
 =?us-ascii?Q?XZ/stdDfN/3sPVdMfXqBG3bBxfIB5KKdNA+b22pTgrmHn/t30BYXGANPXCIh?=
 =?us-ascii?Q?VepDc2L6RBk/Sdz5GK+dFGv8Ian9Z1ZyJpSWlCWgfB+K2o4Vkwep/yDahN8/?=
 =?us-ascii?Q?2NGBKPMGn/rXc+o4p0xHtS0YV4CMbx9wFzOFzqHna+ZP6m7hjVN0T3saN2QS?=
 =?us-ascii?Q?WvjKlCx5Qd0L6pN+TwuxydYqJ+4HdHxVQbf1xYu28UKOP7s4/AmMsSzByqCG?=
 =?us-ascii?Q?KSb5dxLwc1q2yjOjgigJ0tjzEmJUDUG4GesdA0OOXkKgQPZhJ4+dVhiTQKsv?=
 =?us-ascii?Q?IIueneyYTSAtuWHurEsBRSKXXGd8N5MFIdF3pFJUNgDSNyo3a+4oP6+4xER/?=
 =?us-ascii?Q?/Fjs0MmJ7meGTt3ldYVFiwxSpjU70pNQ1l/my9LQ/vSKdfTyPqJpUVYkh5Zb?=
 =?us-ascii?Q?vObHFioVgQKKlQD02k16wj/7IC99UD8Cuuh4wMiA8Sr+fGKkUGCv8z1B0T4d?=
 =?us-ascii?Q?Ax+u6GGKEX4owe+I2eknR2GTfGKMwOLDmIxlja7Nz7KWhEUG04EGm2TTHRuT?=
 =?us-ascii?Q?sVfZysCpUsmmrUoyrG2ZuB+GfosfyYxWQ3IGPcG85kW8ubk3GPhHXGuGvXyZ?=
 =?us-ascii?Q?FpczGYFPdpyDgrBO8Mv3mQ/bbZt4gwBSPTdOwGURuZmvdgdRTTD+Q3d4voAk?=
 =?us-ascii?Q?4invCv5COi4UTIYWeJ4lmof1N15gOYCgkoTHZogw388XJYLZkSvgKYCZu98w?=
 =?us-ascii?Q?xarwkUBfusof3/DvgF4w14zMPqVirYxzbEcQFLZYDDoZUvZn+p0PMMVzhROE?=
 =?us-ascii?Q?RSc0g7aVFcGbya57whLCdrlI1Ao91D6n/KqCD/39dyy/gasqvldDPEm6Yebb?=
 =?us-ascii?Q?aKME9Q1MajQzCwUaFlUwffCEQfEPjUEPMMFdMY3VYwd3MdXew0bXzWeuY4+l?=
 =?us-ascii?Q?EAkMEEeh7cs6oZt+FzPY2fqLNmuPybEGRe71oWZBSRx2/yNrTG3yGOQbKwgQ?=
 =?us-ascii?Q?KdjkgAefplQrRMXZlRm72w8vxnl1XT7O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6wUb2UbPBUFYOmsS7nLO9CqySBFowwWcJJPVaJnJio4YPK8KZ+hwySZQsYJF?=
 =?us-ascii?Q?6jh+nFbgGPmzveMvhFnaKIrcTcNuugAdxfN7vnYOY+SkwwOGOBnWzosBfWVT?=
 =?us-ascii?Q?SnJDOUF5lUuiEElygpn+ullahcGgHbm4/git+LZrJmZWTpP5xxnW3KavTN+/?=
 =?us-ascii?Q?svXBc8M2ufxF4sPJvMYL/AsrO3mvL9NBOAZMm68rnkvnG9VG5hW5KxNnuLYh?=
 =?us-ascii?Q?lKtbkRCccUjiaUENkVPd9krIsflgyvnGUZV6/bsXwzCEdJiU1pYhtDfTL/TA?=
 =?us-ascii?Q?y5qcRAQFYAw7EuYX3z+yunhCh6Z2rFuDYi2k7eLRbJ5yPOdHzUffKlplzFjN?=
 =?us-ascii?Q?j8BuBGUoRZvPFBO/+f9yxNf/fKpB3+f5fzyL8gP5dSVSJfCuu0ZNQrlX6Js+?=
 =?us-ascii?Q?pGgnzitpJB8YE/FRp3ffsRUz6Jj/jYkpL69YrWMmDKAPeJxmooGRqG2m3yra?=
 =?us-ascii?Q?8rjk6VLkfLMxYvEGFOjE6/ZE0v54WKVC1J2cz7a0D93+iBv9eXBpKfVWvFL8?=
 =?us-ascii?Q?eY/F+JruWNo371AeGJqa9oo0WS1llOgz4Ko6uLmmt0I3ZoDC7syV07BslqhZ?=
 =?us-ascii?Q?mucg48P07xekhsQMt2XIcRL0xiib8R/ew2Mv+YUJtwqoavO+3LwlUjzvK342?=
 =?us-ascii?Q?42+yONF7qJdlirbE7UpZJw3Jm9bYsrHaSJkq/3bB+X2Kuvx/zVlaGlZr2DRy?=
 =?us-ascii?Q?UnXj3E+GRhCdquxtxGnBmoVKKJYeA7cHhH8CNshsKYGK3mFjGxKtp69uyTNc?=
 =?us-ascii?Q?IctqzaB69GbDXgLFcaN1OuaxxQgSiszkBtg82alWo/kmB60wmrqQU8TtSQhD?=
 =?us-ascii?Q?JvVxluADBc74KM008TIoi7u1WnnTyFhbTgb2jIfwg6/9tjCart3h6BrmIaT3?=
 =?us-ascii?Q?iIr7VsFPgNQF+O4FUAXAhto0hAN0/q7ITLZpKaOWEdvYV3SmfLhNlwjaMwJK?=
 =?us-ascii?Q?q9rgNzZwTbfwhejNi+m1oZKxOFyZUiN+iLUk1M/sJ4aNK0MyBnBlcEKI74Jo?=
 =?us-ascii?Q?NNwwoZN17FxR6pFzBVt6Dfz1dNISiT4VjBL6U1f5Zv5bMGLI3JGq/GWgiebl?=
 =?us-ascii?Q?1FhnDnC174/4kvb8dMxWITzjW6lg4Mwjvu+o1biCIQiArOZj0NHay5M75HSe?=
 =?us-ascii?Q?wpEBDG101QwL/S53XqselXfkoHYdbrtmwBK9yxNUZccbu0LH5TWyMTdB4dkP?=
 =?us-ascii?Q?ibj8pfxsWEnelEr7T4wrJAhChppFV9MjiMjfGC9cHfICMXu5SKX/a7NHgPOp?=
 =?us-ascii?Q?UTzsLkrWzcqfprkY9+tX1mknUqmT6CYj8HnzYz9PpwZWzjfUe5l7i+o6UxJ2?=
 =?us-ascii?Q?PKO0vcz0IT1Vf0l11M/q4cMGKvxm1S3i6+0rzzCdg40fFN26qPjewtbqVNiz?=
 =?us-ascii?Q?COCn3QwVnvOGP7QAp6uatUOMGQ0KdHUOG0MRvBOWbheHJKdc3TiyPotL8eBc?=
 =?us-ascii?Q?ID9shEkSrQ7PFO20t2H3w1KiJh+mi5TwnRVBO6lmtAqXYZjXPg6YUyyuLntH?=
 =?us-ascii?Q?c4mqPcm68vmlaMj3tmL5kR9RnBoLEj2E9zWgYMl1NVe+40FiZG21zfvr4la5?=
 =?us-ascii?Q?JZClFQ0umEg4REev8vS9M9iiqfV7gjIOkU1szL0q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6aeddf0-db51-458f-2e0d-08dd2ea59c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:18.3031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhmbamfKlYCU/TQY8V5SJF4x1Y7ZOx87ezfdiwJgAwU+zhtXVifB5+60CISqZ1LJrs1xoYQ3YgBpeC/PrzTYtsmmXG0XfQqNWtmvncLU8oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/8] lib/xe: Rename xe_is_gt_in_c6()
>=20
> Use xe_gt_ as namespace.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/xe/xe_gt.c                |  4 ++--
>  lib/xe/xe_gt.h                |  2 +-
>  tests/intel/xe_gt_freq.c      | 12 ++++++------
>  tests/intel/xe_pm_residency.c |  8 ++++----
>  4 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index e1f353b41..6f1475be0 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -176,13 +176,13 @@ int xe_gt_stats_get_count(int fd, int gt, const cha=
r *stat)
>  }
> =20
>  /**
> - * xe_is_gt_in_c6:
> + * xe_gt_is_in_c6:
>   * @fd: pointer to xe drm fd
>   * @gt: gt number
>   *
>   * Check if GT is in C6 state
>   */
> -bool xe_is_gt_in_c6(int fd, int gt)
> +bool xe_gt_is_in_c6(int fd, int gt)
>  {
>  	char gt_c_state[16];
>  	int gt_fd;
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 47569cec3..511b31149 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -17,7 +17,7 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t=
 ctx, int ring,
>  void xe_post_hang_ring(int fd, igt_hang_t arg);
>  int xe_gt_stats_get_count(int fd, int gt, const char *stat);
> =20
> -bool xe_is_gt_in_c6(int fd, int gt);
> +bool xe_gt_is_in_c6(int fd, int gt);
> =20
>  int xe_gt_fill_engines_by_class(int fd, int gt, int class,
>  				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANC=
E]);
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 5d806cf15..2ece2e6f4 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -200,7 +200,7 @@ static void test_freq_fixed(int fd, int gt_id, bool g=
t_idle)
> =20
>  	if (gt_idle) {
>  		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
> -		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") =3D=3D 0);
>  	} else {
> @@ -215,7 +215,7 @@ static void test_freq_fixed(int fd, int gt_id, bool g=
t_idle)
>  	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
> =20
>  	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") =3D=3D 0);
>  	} else {
> @@ -234,7 +234,7 @@ static void test_freq_fixed(int fd, int gt_id, bool g=
t_idle)
>  	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rp0);
> =20
>  	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") =3D=3D 0);
>  	}
> @@ -265,7 +265,7 @@ static void test_freq_range(int fd, int gt_id, bool g=
t_idle)
>  	igt_assert(rpn <=3D cur && cur <=3D rpmid + FREQ_UNIT_MHZ);
> =20
>  	if (gt_idle) {
> -		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
> +		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
>  			     "GT %d should be in C6\n", gt_id);
>  		igt_assert(get_freq(fd, gt_id, "act") =3D=3D 0);
>  	} else {
> @@ -466,7 +466,7 @@ igt_main
> =20
>  	igt_subtest("freq_fixed_idle") {
>  		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>  				      "GT %d should be in C6\n", gt);
>  			test_freq_fixed(fd, gt, true);
>  		}
> @@ -484,7 +484,7 @@ igt_main
> =20
>  	igt_subtest("freq_range_idle") {
>  		xe_for_each_gt(fd, gt) {
> -			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
> +			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
>  				      "GT %d should be in C6\n", gt);
>  			test_freq_range(fd, gt, true);
>  		}
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c
> index 18e5cb6c3..0b48a1c79 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -210,7 +210,7 @@ static void test_idle_residency(int fd, int gt, enum =
test_type flag)
>  {
>  	unsigned long elapsed_ms, residency_start, residency_end;
> =20
> -	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C=
6\n", gt);
> +	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C=
6\n", gt);
> =20
>  	if (flag =3D=3D TEST_S2IDLE) {
>  		/*
> @@ -300,7 +300,7 @@ static void toggle_gt_c6(int fd, int n)
>  		igt_assert_lte(0, fw_handle);
>  		/* check if all gts are in C0 after forcewake is acquired */
>  		xe_for_each_gt(fd, gt)
> -			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
> +			igt_assert_f(!xe_gt_is_in_c6(fd, gt),
>  				     "Forcewake acquired, GT %d should be in C0\n", gt);
> =20
>  		if (n =3D=3D NUM_REPS)
> @@ -309,7 +309,7 @@ static void toggle_gt_c6(int fd, int n)
>  		close(fw_handle);
>  		/* check if all gts are in C6 after forcewake is released */
>  		xe_for_each_gt(fd, gt)
> -			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> +			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
>  				     "Forcewake released, GT %d should be in C6\n", gt);
> =20
>  		if (n =3D=3D NUM_REPS)
> @@ -406,7 +406,7 @@ igt_main
>  	igt_subtest_with_dynamic("gt-c6-on-idle") {
>  		xe_for_each_gt(fd, gt)
>  			igt_dynamic_f("gt%u", gt)
> -				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> +				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
>  					     "GT %d not in C6\n", gt);
>  	}
> =20
> --=20
> 2.47.0
>=20
>=20
