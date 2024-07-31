Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FFFC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 21:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B305310E6DE;
	Wed, 31 Jul 2024 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmbMWxR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3216010E6DE
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 21:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722461875; x=1753997875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Sa8m9cRsgHjQWnx0HupNb70468K4vQf4O9RrQGzb+0=;
 b=GmbMWxR1FDEbTqz7LKM1tZHtC837YSXNip4T93z1BKPb6Xp8ZfbRol6m
 6C2IoAEWlN6NVoal97OU6w7IGqYZ2gXY+xF9yt9uEGXb6c4NdHwjbkbFG
 2XFFIrVwE02MqvdYyUug8+B/E1+6MD55VfCb/xbv8hgTTX/3W//evqkVN
 W76TcFV97bgTajPGfQQ4aDNswN3i+osItRBi3l8AYajXhRI/2glIf5fX8
 3ORiqx/VnggHmKRz+DT//hIrHBYQWRyyJ7iKcbKqzyAaqgroDYDr5hy+V
 +qT48u7mQ7BWCfUrLASDFBXOlvHhMXt/M97Insw/H/x586JrH2U+XaPg+ Q==;
X-CSE-ConnectionGUID: 5q3/a5igROWdzPuKf0pNYA==
X-CSE-MsgGUID: E32d6udmTQyzRkuddGbNeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31778504"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31778504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:37:55 -0700
X-CSE-ConnectionGUID: p6B0FxqPR26zAZd5PXEApw==
X-CSE-MsgGUID: iRtqGzKTQKiJNlp7ThqCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54473514"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:37:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:37:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:37:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:37:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LellGZxh+OmFg/hK1vzupglSIH1cwgmVe5tGz82rkE1wHvsIWEyfRW+SkLR6wkBL53cmN6jl8ak6RpH/hCPKPm+BclxwvJtXBrifq8u2VwK9WfCa9qIBih8Ow5Ha/05oWu6qun3BrnamsATp0d0HmaCeVR7tkd8nLmnMoDuQr7g1Cry8g6cwuYfcPjzMtSiMsPoPs3grQ9MaUZ1qnPHGQbCyYwTnqK35H4eDEsHPLBTwCGcWDw7V/VXkHDdsp/kJenc3Z2c9E3KZmLcQYvbfeDRkdrV1wWJjd4JjbUrB8O1XCfhGJRiKQOwAzKS2hsAE0nZpcmoQcw9KFqey9HAI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFWONc0C5NAXb2SOX1T0vHSQB6aNEqdBkaahtZP7bY4=;
 b=IHRShVgjfhDltKPPoxI5NVSGYyPKPqkI3+MjN3CDrPskVcFvsrqgnhV973F40MUsr6SK2GtlCdp2lmEgYwpRxQsXe+evXccOwtYvEUu2l51KK4l9FtYWxxhElGgL8W81P9W3z2JtXkPMBvgxQpUZtHp24O+KsuOlOKLFXjtRTLKd6DxSoopKP7AsGJte9EwWnPRqVh72AnBHa3xY4ye7RaX8lXFp0qZuRZMbdcRNbKOkqBy81HebK52CT2c9meKG1bnk8VuVacABuQEP8nUgRByM3WGUfpWuBOkmvZuheqfGterGZOBh8MTAEduWSG1+sVQKO+kgl+rkr1hiH/OMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4890.namprd11.prod.outlook.com (2603:10b6:806:117::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 21:37:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 21:37:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Thread-Topic: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Thread-Index: AQHa4vrDPZqj5PTShEe4JJs4VskXkbIRWKLQ
Date: Wed, 31 Jul 2024 21:37:51 +0000
Message-ID: <CH0PR11MB54442755F0CEF31AB5F722D4E5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-3-lucas.demarchi@intel.com>
In-Reply-To: <20240731033504.1426640-3-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4890:EE_
x-ms-office365-filtering-correlation-id: 65d03f9f-3e72-4b34-2735-08dcb1a907d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?X9Fc3VOkxzVSxWEhlMJzCqq6wUVjDy1tCMrbTraSKdBSP4/3tY00ITtXxIb4?=
 =?us-ascii?Q?sQl20+iO8AmwOtfyiNGDquKZEIM1j5ldQaO0kxnxHvJvI3xNRyF1TgP4kPnt?=
 =?us-ascii?Q?aOnFDxR+xUQ/2jk3JInP5Cb/8FIox8VbJmrPWpJlQXRtqyUawrSSzb6/r5Hu?=
 =?us-ascii?Q?bvxuIdfo0IIsi3kJH1NxBCwmXgU0kAlpi1KniVV+B4I2E+JnwbrHhdogoStF?=
 =?us-ascii?Q?YZAzZTDrZ7zjYTRLEsX7If8jlt5E0JvdRiiIkZczIUQppcWSOaGH7YbTSWo7?=
 =?us-ascii?Q?XLia8U72aM9r85ouzWOlOAyo2DhbPcv0fLJV7+j5NyZHz3tVM6JxdJroYCmP?=
 =?us-ascii?Q?zhsvsM45QGhMbeZeLaqyqS++R6GM0eNy19TiphlAjjUOjxF4KLiBKnrT/1KL?=
 =?us-ascii?Q?9xMYrQ6f7pSNcXSxmwZLd/5btjGNhqArOa+CxSrxi//P+y9ftJt6WF57byEi?=
 =?us-ascii?Q?AmQRv7FbKMTSec6ToScFK3qURbgalP1pdZfPqP3ieCDvjV+Sy5kxdm7dv8kc?=
 =?us-ascii?Q?bsPANKF+kZr2xW9veYf/VWf/R6+nF58oquneDg5AtXayBsI3wug1FEEeuDtH?=
 =?us-ascii?Q?zYgDTiGARfenKuXmG221lNZXRVQQPariUhw2aGS1CWdqO8gw2v53uw8x30HH?=
 =?us-ascii?Q?5r8miLLaj3y9OZeK5ZQbKA9QekH9YBHlYFO239zjrN2QvI1I1OONeu53SqFP?=
 =?us-ascii?Q?wxJGr/M+dnQZgZ/OPn1NRASXj1bXpolJA7RgVz6wV/mJvqra/BkmPkeK1qqf?=
 =?us-ascii?Q?Q7yg5f7H8ib8lmsQg3ZF/NIKTvqavT+9wncDENc2h/vdwTpZsvgvfMJFTLWH?=
 =?us-ascii?Q?hh/WDHOXezWLbPr+V477ladCtRq347qS5PqKwTqWSKH00cn3pgNuMAcVFAKY?=
 =?us-ascii?Q?wBe9stdpAikxTl7fyHwM5Go1KQg3qfqzFFv1q/lLOWMMjH294FtQ4bHntCLl?=
 =?us-ascii?Q?ongNq/51hVA+t4sXiJRXWC0NfSuOkqgoQ16a3fGg0ac9Z0g/ggpaKhWaXCbR?=
 =?us-ascii?Q?os9lT5vcCqEpVhnEzLKWgtS0KC3406ZR4JIX0bxlsg3zILjYWxCbHjIHJ5ac?=
 =?us-ascii?Q?KoS1C/bdr4/mP2WAjMY+vi9x9p+v6O7kmIYbce78cUn2UV+1+ynJH0WpAx9T?=
 =?us-ascii?Q?hDy7vk3j5SWs7XxiY1+u9FMl9n5rQUXdCs0G7Cf/3jXjGwzoHFJ0DPI+NSqP?=
 =?us-ascii?Q?rIBrkW/VzgoBnKCYNmQCcmFWlw6/vxNAIUvCO9i8jNDh1ofLIJNiCrZsDPPh?=
 =?us-ascii?Q?UaHipJWVGqcjNWWx3DqLzjE+92aduXk8C+0d7KpI7Cs4eOU3gqRYPLngq1kc?=
 =?us-ascii?Q?3agUDX3LMDyBJg5dH0BbZKUxkMfB4Sw8JO66fsPT24cvgGpnRw/PspgrDMGw?=
 =?us-ascii?Q?0gWqA8lRcJrYM6G/hzeW+pTw80BxC2dg3A+m/z1fR9iZkHG+WA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u3UkL6ENVK55eOiap+lr/FxetyYWiXPAp4ZhIN2x9bzgLb/cGUq+uX0ipFpx?=
 =?us-ascii?Q?bUPidjdAbZGiGFOtFG6B5G6LGbYm3CS+dgJjY+MN5IYikwAeiUTIO5fbFUkm?=
 =?us-ascii?Q?dLIlzdBPz9aB34nYHKZEXZJ8jMQ4CDcTR8UF2Fl7TAFrpQooY351/kvwN1dh?=
 =?us-ascii?Q?udNBgU80m9QozLnJoRhkTTGcUkHs3LnmrjSKtgKb6sMoUt83rOM+8KKppfyA?=
 =?us-ascii?Q?j94LJmLJ1ZNDr8vTps5XwtDKApSw3DRvyrewmtUJltHztTJ7fchxgaGpHXDw?=
 =?us-ascii?Q?IP6vhYcZYavJYtKEDOfW8kKMcLEQ2Z90Ad2dIpJuVV/552qX4/8RmMxN5nHf?=
 =?us-ascii?Q?tbJA2GnAur2X4qhzPHT6c65b2kZ61gkPJ2/9f9TdiBHfJFv16yX+5LqhHziZ?=
 =?us-ascii?Q?ymgxTOAunCwJuAaK5OLDl9Vde127qeEzFN+TmwNhf6UlBQPaxLIvMP9u4XhV?=
 =?us-ascii?Q?pGhpLxS8bRS6bAxU2MZRVTFBXi+AsuSgDplEevQR+skjbwwsTEfZ4Hhww5LD?=
 =?us-ascii?Q?1MHfyRb/SS2XNFMu+tbULsK0uSDYhQbVw4UN4BOFq5c+nPwJYZgTgnfRRAxA?=
 =?us-ascii?Q?MoAxTfpoGSZrIiVl5sqnWO1kHMug0uK6tJ4RSWrRWHMA9Qfi09cNtDjhhQb8?=
 =?us-ascii?Q?nMbpycb5HQWsuXhu2plYcmCKkSZ3gSK0nJsGozdWKZOjtSxjc2iQvg0cXQN+?=
 =?us-ascii?Q?IFcOd/3BbFogKfRKAFDO+MPBGzXw0fwqmGUUY0fC+c1zap3h0kAWdEHXNskW?=
 =?us-ascii?Q?LirpUAn9FhtEzXmcj71+zJy6ryxWYidZPBSdW1OSIZbJ75Teqiw0YFMS7jFS?=
 =?us-ascii?Q?smbR7LtovZdAQoAbjr9A20jAtYhCXCZHifv+6GciYdGwQFMdXbsMAZ2NPGCD?=
 =?us-ascii?Q?5FeSIPzFuRu2Tv49cDfWcEZ6b3paxz43ACWFDd5GQYXWW8z89+VlepaqKTQj?=
 =?us-ascii?Q?C9oljG257M17AZatbRUMsUqFo8W1IzOk3BZBGX/8ystHgwRuLnyN71S/lUGZ?=
 =?us-ascii?Q?WnOjmbIoPjV21rXuNdhQ/akWfXKXW+E3d6d4HwYsk0tg49+Y8aEhGGPs3qbB?=
 =?us-ascii?Q?liTo5K0hJFEJzc+R8VPTPzCO9TFgflK1d5IFGnz/gK2LA2bM51p8TGdsDCIt?=
 =?us-ascii?Q?a9hXybh389rFD9WAuJKHh8HUy9xZ9ZvONGDg25NZKEppB4SoesWCJGTw1JzR?=
 =?us-ascii?Q?eUjAlV8J7xSvNuaVD7DuuvtrTOOVzJFrB4Em90lpk6u6uZAzP5SfFCdFCIEC?=
 =?us-ascii?Q?4prVgzI8JzTkyONJd4LS+joTm8ECELaKxtoGR67b4VxDo2leRjfjCSkCrI+Q?=
 =?us-ascii?Q?o6hzIpnH5odMRTpCVeuPgqWS7veibTBMpDieslHN1Pdgon84nGTP0CI9fhQr?=
 =?us-ascii?Q?VVISBYnZwlqKZGKGq3ffqlT7uf2xIklHoR4XkpcNYvyTcTEP9y6jzpW0E5zc?=
 =?us-ascii?Q?Lhm4l9IAFhPZpCS1KYtluDhLg3YRemZSpT9FTCBXVgpK1BrklVSHoFWjyO8y?=
 =?us-ascii?Q?Zy8VNrWCxtWs03LIPftoSl02SKRK+boC8XTTlvOcFFPhteKlPiDfLlxcQwFh?=
 =?us-ascii?Q?KYG3/ehv88oNzsXKVdMF4JvOk9zqmlfcy7AcVH3T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d03f9f-3e72-4b34-2735-08dcb1a907d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 21:37:51.8534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQ6K8qxChUgxZONqEfTm+p+8jaYJ7moLiCjRyyx6lX5apuyvWkH0AOeoP1vQBv+cDIifD0U5PVDa1j0qoMyGGWrEVmel4QrbeEcenj1p5P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4890
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
Sent: Tuesday, July 30, 2024 8:35 PM
To: igt-dev@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
>=20
> Use READ_ONCE() to guarantee we are actually reading the memory written
> by the GPU and compiler can't optimize it away.

Has this issue come up before, or is this just a preventative measure?

At any rate, this change doesn't cause any harm, so I won't block it.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 3adacc3a8..43a7a43c2 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -166,7 +166,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spi=
n_opts *opts)
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> -	return spin->start !=3D 0;
> +	return READ_ONCE(spin->start) !=3D 0;
>  }
> =20
>  /**
> --=20
> 2.43.0
>=20
>=20
