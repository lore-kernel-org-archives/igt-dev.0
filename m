Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A7E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 20:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5323710E3BC;
	Wed, 18 Dec 2024 20:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rx8EmymQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943A810E3BC
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734554229; x=1766090229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OLU99q6kMnTCCmGgT48g9mCn9su6KmsapP1yj6LJbK8=;
 b=Rx8EmymQgossX4RjEuRCc7dim1Z9QTkFclI1+402mYIv4nWKDJNLFM4C
 UqCYhPXiQQPZN+n3lQYoJlxG5NeFbh73vkH/kVJ1PiaGQH8BjVzz6NYTq
 AhZYEMw9GytkxYdGietqSyYE2evbOobeN99WMHX0/pfZACVR45P0f9a7f
 cY2cq46kz4a0UjVuKCrbY+GI51x9bZt0sBZCanHBa5FgYx2jIyUVgytZ5
 bBpdRAEUqOqb57tAkIFsybXcNcmka5qlS4iN0JN/RoqnTzzCINf4PnN3f
 ylcBg+4mIAmwbHto0TFZYS8JpWy0gauY2EarFjyHdBUvodPJ9ApQndC0M w==;
X-CSE-ConnectionGUID: 1mHzpf6+TV+Uy+XPeEczvQ==
X-CSE-MsgGUID: 4qaNy8ioQVO4gxMpXue4NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57525979"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="57525979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 12:37:09 -0800
X-CSE-ConnectionGUID: 5Xk0fntWRgSePHj2flVyIQ==
X-CSE-MsgGUID: 4/J2T6p7RXuScLSV9ttEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="98528606"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 12:37:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 12:37:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 12:37:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 12:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiJlqHA5J7dk9uJgMN22Ke+BiiDyCorcPlq9GghMktUmOxKugxrkZl5rh0Yg6Dx6ygu7Gd35oegUlrjgEsx/xCicPcwGQf7t7u7E5gl81cFNfhec+lCuBN5fBEYU92//pMjrDZ+epeaYLJxRD9DNZ4sIsYRfjYjPLWqUft95Tx1sSg4axtngJsy/s2C91nVTGlPiMRp4+ygtaeDgIj2/kx+MwwWF4W7hlIJz09nEKQcWz7/704dQwbXJnFUoGzd6nULlSp/FPJo/MQkI1pX2z+1BpMRBGc7cKcZALSGK7gQYlf9gDFKY5YaAfuEgERgyUaz9lW46uSBAPt/TvG078Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud+z50WjftzHDta1wATZ4tLuJ/e+EINXhWev2Tj30xo=;
 b=cde7IijX73t2fZ/CexrpAvDrE/BkodyhcSiiQpLUHmrSzcM0T05zcQpHjbTI4FqQlV+vNZYQFqJmvD+FA+DC92eE45IYIlYIFjHWBBHxZm1mo/F7y+wNrX5S6IPcDqmn4oTE+J8w00itxz3Ww0Y1X66TrNhEqzs3yesgx8qMst/xwswkz6kE83G796LExAP/YW2XkTOqbx6wH6gIRaNCZIEMVUGsWlksevg9hoxvLb+c9Fz9sfmRiPQR42Aj4vfIuF7lJenYlzQIrp9XX8Ub+trAmU82R3ibbxu1lPIVtqOQQf0eGjW4tXeowk1VuY5jRVqlM9KOuBIsL3b55Zrx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.23; Wed, 18 Dec
 2024 20:37:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 20:37:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Thread-Topic: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
Thread-Index: AQHbUX+8gI4vJ4ztUUOu1n91pqgqE7LsdIuA
Date: Wed, 18 Dec 2024 20:37:06 +0000
Message-ID: <CH0PR11MB544413277C824C3B1CAF3DC6E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
 <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241218190418.126565-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6729:EE_
x-ms-office365-filtering-correlation-id: 2d2f4cc8-6f27-4fc4-eb86-08dd1fa3bca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KqYgRwTbXabtvCQHyrTo7ugg10Oc4PZaiKiiPm/g1eNGR1j1rwrDNbdCaHRH?=
 =?us-ascii?Q?+sLuHne7YrA7JjgIAJlfuCmFMPuBe1lcczlirDmvEWEDSUYlz/jvRWCqEIwF?=
 =?us-ascii?Q?e1eJsEm9rqbPOd4LKOtDfUwahsj1zl0Z0WW3EvehmZpOWmqSR2runcFOPeGA?=
 =?us-ascii?Q?nu8XHgx9Cm8gVIi9y7CVkCGwIovq7jKEc7YurHd/RuaY0LnCO3eZu6ED0eYZ?=
 =?us-ascii?Q?g7McpMY4D+ADxPz5RLrfbHDtJdFQQq57oNEejvC4bo90evjbvOIU508RKieK?=
 =?us-ascii?Q?McmMyrXjK2yDQAFnNJPWM4I1rS2fh5pRMaO6DvY+D4vOiNlpe5egFZE44fzL?=
 =?us-ascii?Q?HEaPxOHjMcHgeNPEA83lbsLFnDpzFenEutJfdp3XDlI8PnvnVnI1sb6i0hIk?=
 =?us-ascii?Q?dka8unpFGZY4p4DUbUG9tXDCgtOtAa4JJ4Aek1qoWadcJb4GGwsXOK+v3gCW?=
 =?us-ascii?Q?uWEDPsJfoA/QHRpcBr1RbSuLELU0foM8q3ATAR1jBryj3snrYkeEiel0m16i?=
 =?us-ascii?Q?IjJGHnzg/SKLBa0c9mCGP7+Ayw/ygikwsuscYU9NgCwJp6BSiAWK9XjB6Jz2?=
 =?us-ascii?Q?cmkEExWDwwiYZUfInicT1ra4n8MG7vekxIbKuNjRh7DRS9b8KfEmnsSZilqs?=
 =?us-ascii?Q?yJDXMqoVotJ2CruGxfPewyfYafegd4mT5e9eTUrxVcSR0M/x+tiVAqcr70yD?=
 =?us-ascii?Q?2LHgG8CNSGEzcAAokftNRVUzEM4NWAKNyQP3RQq6NlPO8LQMHuynfAVca2kb?=
 =?us-ascii?Q?wNZL03cfeOkX3zRE8f2CZK5cDOunAnHKIn0SImxOxJpsYy3fFyBmn5ffODZq?=
 =?us-ascii?Q?PjOTremxxkvK0iQ9jVqc23GIr9IeEibEr/1aBgFH85OiDhh9qnk6pw9Tehqd?=
 =?us-ascii?Q?TdVrML8TK0E6fLClotp/n64mYTAMX7fo9EwXM0sGl/CQyAFQ+0xUafS5NbFg?=
 =?us-ascii?Q?6DZmx6ILCStalBFKHvummStEoBhTHruE9D2if+4lyFrRK9kAqKTGRsWz+9MK?=
 =?us-ascii?Q?dB7sZM2iuNCC5QxuTXiEgxq3WyFljQgB+zLsm28u3iEDMu02tmCcWL3YVt/H?=
 =?us-ascii?Q?KjjMW3ujFFeCuxNE3pAP6e2tCLjNQsi3/8nzAH1yrxG048y/Tc988kVVUT8t?=
 =?us-ascii?Q?GQzzgVjzWy7I9gLyiduLB4sCMWhnbK4aSgkA8loTXURwY7SKVcBDjupFPrCE?=
 =?us-ascii?Q?NX9ujkL8b/A+dauBR7q4wF/Iw42Y2jVh9BjFSJSf6asVyE0ViH+0XtH6/ExG?=
 =?us-ascii?Q?s4Zaf2YWDF+4dnX/0r1QmNhVmpJfEov5lvz7GspY7LkR00vkjzW+fzcN6Muo?=
 =?us-ascii?Q?gZy56O2kQFKSsel9kV7nANvXk8CC7pRQDZlwH18PbgJRvr25XAMNPOFAcgum?=
 =?us-ascii?Q?aB206JY4vSzIQEyfev8cjDKXn9bqMKzSOvw3SoGb+sAcz1/2YZzThW/GsnqN?=
 =?us-ascii?Q?hzhExgLJL4CpRyxfdFKF6aZIySqKst3l?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qTS7/0UrwqcR27wS2EaeGA10Zr0MXCZuJDgs+Qy0rkdlHOJvJNaQB9Q7VgSy?=
 =?us-ascii?Q?1ufTEBnBkHAt7qhrrmbo+DcuyShK2D8O5OtloyscnPJwErqcl387uufjx/jG?=
 =?us-ascii?Q?KuvJezNHQe3cGwHXk9K9h0kUV6Q7Ba8hbWYAJ6kLRchEUn3OzMLLrQhlKF+e?=
 =?us-ascii?Q?jDlHGnPCD7f9mEmluHy14ajJFGulydQS1wCfDnxsaLfP6feeypKmvOlP0PIj?=
 =?us-ascii?Q?K6lGkAZZBmE7ul0+3g9MdSS2CvH0JOMypFOBCrmwgRduQsH7d2tvSjLXN+Di?=
 =?us-ascii?Q?IyGuRyO5kPjKXlXFvA5VMSaG/LdzhlL8fuL27cygBptQEIiso055K73D+oDA?=
 =?us-ascii?Q?oDyA2JhMA9dqGmEypsyQ3rwm51wSsEY1xzZtMVzgtc6xIsIhktv2L9oU0lSH?=
 =?us-ascii?Q?h66TompV0Spw256v/S47bygL4Z9jYh/Z5xfdl0xKn46prN6Kx9csS0MDovc6?=
 =?us-ascii?Q?earVmkR1ZVKSFpc452PlI3aeqv9HrLesMNQmklViolJ73/unaj9Ui+P+XBmN?=
 =?us-ascii?Q?YbXTW+8p8wG4TwAF40AcYOIekWaRKsrhRTqCZZF9q116JCLgU9UK/YdwyPpS?=
 =?us-ascii?Q?J9PAHWQqcQzbw4QS7swvOvm4cDvftcz3Emw9xF0qhG5ldz3WOfPtTnVEbxaI?=
 =?us-ascii?Q?lEkt0suHS2Ruu/z16mYH+odd7z988KQwieUw0vT39ITzHwfGZ2c69ZdXIh98?=
 =?us-ascii?Q?9OKfVYo/lnFr3aNvp7J8R6UuGsSJzIsUBqdiIs/YiVz2WsKOdcqhgNlIYf16?=
 =?us-ascii?Q?JVfnAqDn3NkjDljB07+gYIbgwBIhlPO7zxv1k8z5XATjvAkhKPGVC00bD36z?=
 =?us-ascii?Q?6F2S89UoB52NXCPs5D69EDqw+vFIcAXniCNanvPB7HT1xSaK/6q7Jk6GYVvp?=
 =?us-ascii?Q?iXLG8VLin79CXlTExZUQzxAFkXagjxZSIs+aQxLZlkdbJaSN833bc3g18OCs?=
 =?us-ascii?Q?Hh1HqcfWLpHDEAaxI4VT5Tw5vHIf5aYs7RIcJCOuXYArvLwXzilpbZYDRyeG?=
 =?us-ascii?Q?uWMgfuC/Q2nLpaDDw93MwUUK+ubdaB0knzGuIvNviX/sTCJVBhJ+IZRlpJzh?=
 =?us-ascii?Q?HNhG/oGPAzjHB2pqOIpCotHsa2Rx6oI0sod0PQSNqSjALRZpvyJ3Yg1F0lnD?=
 =?us-ascii?Q?3L5LfSSLCVjnAslv50tecKH8Qyj90nxTWchY6BvXZ4H584RvbZg+jfXGBjY4?=
 =?us-ascii?Q?NU5Z5cEsk1FTzlKPexZ+ZVwlSZVn+Pt59EYKAAlvgmvRDStCGSfYw3talZwH?=
 =?us-ascii?Q?LRA/uo7bo3MWaCfL7+BBocGBE6M5iCYbQRqUwVSjwz8Y6xadkFK15cODp9Oj?=
 =?us-ascii?Q?H9op3NcVH0LK4FlcMnYBkP70mV1uAym4vmZj5TQj8GdwTZHQfAhkCxCHDC9I?=
 =?us-ascii?Q?zTXx6V5YxIydLORdz12+jh+w4sh71MWv5m/3z6rPZ6li9D37C4Y5DBGeuiNi?=
 =?us-ascii?Q?8giWfwKHScEe1Raz1AEAQuYobGIKJNjtsHqrr1YYqZre1yjsCOrn17HAMJ4l?=
 =?us-ascii?Q?2xLzaJr8Hz9Uz/XD0k9nEiHlmY2dE3m0h0agOIPnVeKDNR6kziGgdsIrQKwI?=
 =?us-ascii?Q?c+x20UeuL5sb1jK7mODttcA0bmTqkJBaE2nXZOf6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2f4cc8-6f27-4fc4-eb86-08dd1fa3bca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 20:37:06.1218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEUuHu/l6Bq+9Q6K5FYIoDWkVgq6O+PsggBnwdwnis1PrlpAePoewZn358QxaDPJynBgjtTvADzfuXF0mEfmQVSstkdFFCrO1jpyaVOVh/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Ko=
nieczny
Sent: Wednesday, December 18, 2024 11:04 AM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/core_getversion: Added raw-cards subtest
>=20
> Created new subtest raw-card for checking all cards without
> loading any driver, so it could show what is loaded on a system
> after booting.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Minor nits below, but nothing blocking:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  tests/core_getversion.c | 39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index 0842b7db6..989ed2aba 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -25,6 +25,7 @@
>   *
>   */
> =20
> +#include <fcntl.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
> =20
> @@ -45,6 +46,9 @@
>   *
>   * SUBTEST: all-cards
>   * Description: Tests GET_VERSION ioctl for all drm devices.
> + *
> + * SUBTEST: raw-cards
> + * Description: Test GET_VERSION ioctl for all present drm devices witho=
ut loading any driver.
>   */
> =20
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's=
 "
> @@ -83,26 +87,47 @@ static void check_all_drm(void)
>  	}
>  }
> =20
> -igt_main
> +static void check_raw_drm_cards(void)
>  {
> +	char fname[32];
>  	char info[256];
> -	int fd;
> +	int fd2, count;
> =20
> -	igt_fixture {
> -		fd =3D __drm_open_driver(DRIVER_ANY);
> -		igt_assert_fd(fd);
> +	count =3D 0;
> +	for (int i =3D 0; i < 128; i++) {

Nit:
128 seems a bit arbitrary.  Is there a max card count macro we could be ref=
erencing?
Or perhaps we can create that macro locally as a part of this new test?

> +		snprintf(fname, ARRAY_SIZE(fname), "/dev/dri/card%d", i);
> +		fd2 =3D open(fname, O_RDWR);
> +		if (fd2 =3D=3D -1)
> +			continue;
> +
> +		++count;
> +		check(fd2, info, sizeof(info));
> +		igt_info("%d: %s\n", i, info);
> +		close(fd2);
>  	}
> =20
> +	igt_info("Tested %d drm devices\n", count);
> +}
> +
> +igt_main
> +{
> +	char info[256];
> +	int fd;
> +
>  	igt_describe("Check GET_VERSION ioctl of the first drm device.");
>  	igt_subtest("basic") {
> +		fd =3D __drm_open_driver(DRIVER_ANY);
> +		igt_assert_fd(fd);
>  		check(fd, info, sizeof(info));
>  		igt_info("0: %s\n", info);
> +		__drm_close_driver(fd);

Nit:
I see we're moving the drm open and close calls out of the fixtures and
into the basic subtest.  Perhaps it would be better to do this as a part of
the previous patch, rather than here.
-Jonathan Cavitt

>  	}
> =20
>  	igt_describe("Check GET_VERSION ioctl for all drm devices.");
>  	igt_subtest("all-cards")
>  		check_all_drm();
> =20
> -	igt_fixture
> -		__drm_close_driver(fd);
> +	igt_describe("Check GET_VERSION ioctl for all present drm devices witho=
ut loading any driver.");
> +	igt_subtest("raw-cards")
> +		check_raw_drm_cards();
>  }
> --=20
> 2.47.1
>=20
>=20
