Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FD6C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 18:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D461510E013;
	Mon, 23 Jun 2025 18:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuS3j/pq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955E10E013
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750702357; x=1782238357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3PF7x/leVCWHZwpaGgj3kjC8moaqLR8zscpl6kNUy/g=;
 b=DuS3j/pqooLPMqa6CgExm+zLDP5b9Bd9vpL2R95dhF/Q3RMwet8E0OeH
 Ui34qztlQ1zIhbG8fqkZMKACCvG9CuWA5q4oQV+QXjhVjlKzNYKje1t1i
 SJ670r5x3fDj207Z4Xb635T4GgE1AjfzNKqP0N1/ph9CNXbrMHCfOb5Km
 IyI2jjNjYYiNtrH7kaa/bMAIuMSfl/Mngd5PL1rOx9PGOjYMo6loPTQBL
 Dk/iGQuWviJJf3yCn/nLYK5VAYwsZoemL7iibc9YCoY+Jr3tVnEoRK2cB
 huEatPGbyG7mC5dhMgRXc65r15NE2gtZ+MH5kJOdwbHPKG97HlpddgQtt A==;
X-CSE-ConnectionGUID: /32a6NloTJiLBZvQIDqG/Q==
X-CSE-MsgGUID: d3dEoFOCRLK2co/MqlxoXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63982563"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63982563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:12:36 -0700
X-CSE-ConnectionGUID: hRXBbIIySDiOWwZaCdcD6g==
X-CSE-MsgGUID: WA4qS0Q9SCyqaXallL8wSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151148292"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 11:12:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 11:12:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 11:12:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 11:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kvd1elQMNw2UgOgm4eIxBkc0r/fLI4RCYwD+ygvkvSx0zhGO5BvtT3ASbtwzdhMFrbNW0/ZvwV7kOEDwtoP0eBbZZiN0IassBUdA4rXk5wYXaSeASJF9Gu4Wt1tVBfB1vM8AeCVacsmyg2Ff+y8wt83CsoTzBo/715iN7icSFbKQTftn41bJ5rwm2aiBnJUNv9NuMvo3q37zPZhvB/7rpnqPv7tIVfbZ7xCbrFqDq5Vi4o3Z3YXKCOzBaegzuemtr33EViMld42C3hCa6V3IaRoy+m+vF9Ygb5t8CLSMu1yHg2QhTa7lQkmNjWVsDTdrhbZHBB7kzLzi3b/LTrJZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crKQKYnF7WYzuX0SOzO5pAnx07557r/F2sD2FTzdU3Q=;
 b=UEckBXD41f6Ie3umkC3iAnDa2Su1s85wAYMxSBsUsPFwbpSI5ewc3SrQbr2VXDLk/8JssjL8bf9JepGYz3Rlk704ib3tNnaiTyak0zM0F0SDtajZfy/IOi7QuNYudyULggmvqurvGcb6P2PTCT+SJEWK5H3jySBPLkIOBuSdHUA1SyCFCNFN1hwO/tQsucIx9iV8Pfet7SbeNS3+Mtx6VpeEIYFW06bC7LEBPGcAxepQzD2TWD9gTO7kh6LXjz3zBv4rUnJkBsetvfQfNxngIZ5oV0o3Rc/DvEDqMnvHGQarEfLB7t/sdDLsR1EOM8LRvyaB+chpckbqXMYZ4um60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 18:12:20 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 18:12:20 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v15 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v15 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHb5C+mObU915T470eHcYYoIH4i67QRDDVg
Date: Mon, 23 Jun 2025 18:12:20 +0000
Message-ID: <SJ1PR11MB61290DD45655C6021C1D46F6B979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
 <20250623110918.606014-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250623110918.606014-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|LV3PR11MB8506:EE_
x-ms-office365-filtering-correlation-id: 0215dc75-5345-4b32-affc-08ddb2817ea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wlG7Rj6kwlBIy0yKP95J6I/YIABjzbAtazTbiCYhYXp7mhCbFQF5fX2mM12I?=
 =?us-ascii?Q?E9ZgcmXRNoHRVt4JHCPC1PIjtkAFNs2gKt7dLKEEcqUsM6PBSp9lAbn2iGw5?=
 =?us-ascii?Q?1vmiU4nOLYLD46f8k46xXi3Wm3Fyz3mhRu18wcCNP/+EWkggQv0gtpZiZek0?=
 =?us-ascii?Q?SKShuAeHlZzyK4ogWllidL7xr3hcDjkESzhi+2sZRkvNZr+Aqu/438C4FMF+?=
 =?us-ascii?Q?3mSbuJlWYugFd4An7PV6lg65z778pXIKFMdTzw2fqQo3Au1FXUr3xf/3tIDO?=
 =?us-ascii?Q?Y7XenrFW/GMFpEnTpj/H+MTuhTwShNherLe72VrOYXnv3h5sdqp+gb9knM5f?=
 =?us-ascii?Q?A1Wcj0cmqcavebE2W0Qaxm8FKYV/aLg8WwZsog+0yQeQ2+xFpYFgoAV77Rfw?=
 =?us-ascii?Q?EuTcVfGJ9pFSofc6NX/ck84MDjjIjNMCrIisfMPQ4JrM/22PAKXFXeAPbGQH?=
 =?us-ascii?Q?nZoeuZOxgQqRCGlbgIAA/zCJEKqkf1m8/TWLBH5iv9ICoLmBwisug0KjaBOp?=
 =?us-ascii?Q?fDIQDO0Tfb/0MDw+vXZJY927fR/R0E+2IiaZ9PWBCuubb1DPA2Ju2yWiL6K/?=
 =?us-ascii?Q?9ZV8JFZz/w8lb+UOrNIs5S7Js5p+obmKzg/+0OMRGcKrN5/uBX0BjsIBDxqt?=
 =?us-ascii?Q?vflbEp2p/ptfklrlgchg9DR+hXSzjWKT8StmfTdYO6Jz9zo6fSlpUKPeYviO?=
 =?us-ascii?Q?j4W4ztYdrjjc6twGzNj7Mdyi+78DDrsBWcErO67D0R4WU3o/hwsQF73cR2U7?=
 =?us-ascii?Q?1sELoh74AuiBiYljrrp29Y0o4ivheUrQ5++shjxU5W9wU5jniXWsQEzmgdQH?=
 =?us-ascii?Q?IFjc0ej4VzaG/Mlx9R8904PiiyyeRc9zi80Fl4SHIxSEVlD8SykIovj2nTDv?=
 =?us-ascii?Q?z9EtxdTyVSADBd+Tkqiq6bYKqOaQWIIRrdCLHaSCkPS4X/GJqhU6/sSdXmNW?=
 =?us-ascii?Q?BGwiq7gl07BXjPJJLPrgRny4IT8ZXQTQlZMv0OnM61gCTtciGdVrohY6LnDd?=
 =?us-ascii?Q?C7dybmvKuVrGR6POdJ1fUq+hIAJP8JIsYDDMDU76IPQ846ez3gdcICnNElrr?=
 =?us-ascii?Q?gu3cynzRK8rU1YeNHiEYmYvbAaqLOoaW9cORPVzvzhraw58Yv47UbXVlhh1+?=
 =?us-ascii?Q?TTryiIz9hKUl6uAuSeRYNAzgPCnS7KAUNoPP+5/IKimCsahIy+2OEVA9Ksv8?=
 =?us-ascii?Q?JlYEGatGTlZJK1Skd3l/a8YTFfHEi3RsaYuLm9/iaBZIleNUQVV7UX8AmYTa?=
 =?us-ascii?Q?1a56jpN1WQcH/hlLfmTKTLWLXZ2DruleGNhMX2/oThkPcB5dc4nVIPdxFehJ?=
 =?us-ascii?Q?UQSKm1UB6xb5zbdhzIA0ZnOEf5jEsUUeNnpH3xZGSU2Mq2VBJPGjgYbkyJsq?=
 =?us-ascii?Q?1X9lv9Bemczp+SmbfYTiVrt7j2BrtCG/f11GU+AgD8GKVg9sIGaM3p4wqdUY?=
 =?us-ascii?Q?G9Qb8RZoPkLzbtcKNhKsRwThPVI93yCQiE8edFJxFLTzF1EkV7yDXieutmUw?=
 =?us-ascii?Q?WjdbrA1Sc8z7LAc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D/4fYyqnN+JOlbG+mjLOy9TPuWdJaBZExZsvXPZBYEJNtZ6h+vL49p8bVrQw?=
 =?us-ascii?Q?5rqK7aAriDIYczYIbwjK4xeOAJgPywzxKkStFfWeSaamKDx8pT5LywZnMaGZ?=
 =?us-ascii?Q?ujB0JVoLq0W+Qwr5MoZSMGQRxW5LaLb72jrUlpT0h9+qQLoC94JUCLIQH70v?=
 =?us-ascii?Q?rstNuQbOAOpP6su4AQyRM47rqNKJDYY9APZ5wIR6S2kH3ujxs1z3Uazwi1rQ?=
 =?us-ascii?Q?LhvJHe69nP2db9/E5v0qRqHIdleClJCsGfunn+PG8q8/IoJJkibMojYbQO2W?=
 =?us-ascii?Q?DXa7nEyKRd70MVK55jcgdxofZoWBIo7ZJOH86EbwsKBMK6GBP0uw/lXVKGv8?=
 =?us-ascii?Q?rTk78wK+80U2wzge6jlJ/PQahwmkP8zAfERawnWc1nnHbCM+VCiDj/bTv7yi?=
 =?us-ascii?Q?Cpm/+bli7TODZHUf+qDOesVdjYL2qdAxrwGoFYx7TbEKlrwleCKAAQgDmY1j?=
 =?us-ascii?Q?bBNVqK1QH0pC2TSPJ/51+gcwKjMYp/Kxxru0TPEDjzpX9duq3RI8KeaN64HV?=
 =?us-ascii?Q?gHsPczJQUqYcPyb3U6ftxg+jfO3gnElr0v3MeXuxUre3lcVgM78BVSfdvW1l?=
 =?us-ascii?Q?SjLhjLN/mFfNebGdP5v36wSeQpqPCFVQMisxluO4vuG00tUZyosNLEN4k5BU?=
 =?us-ascii?Q?dfw8hMtSJnbGosRlk0fWQLvBp4SmPjm8AocJV6GjiVorzVxaxOV1XKhd1Ty8?=
 =?us-ascii?Q?H8ORR+mjRHz2TZdebbjV+ZN1D1qg21TeKhuObnBNdlzCprzMRFNDznogtsyw?=
 =?us-ascii?Q?pqWigx7VKigW8cGaHB+4Bt+/TuxQejtLZZUqRckuJhlxvGYIyzsMNaSkavdQ?=
 =?us-ascii?Q?kJot9fvffD37HHp5zNZtnIL8PBkZQE4H6NqYjKUodUaWsf2mEzGEBfWmwd0w?=
 =?us-ascii?Q?1IQ37PZ5bh1h3hQ0XYJMBkh43s56HM3lEeabYbc5VtdxtoWtch422tHS6tfa?=
 =?us-ascii?Q?Ng8XH7AexMIgYuQqTDu5NDtHoWQuJey4bpixnuOniQYBidwX9MEM8dtiEW+B?=
 =?us-ascii?Q?AHBcIXaZrwJSQLZeEviotfZuWgXIM0wRMJDIbmSjvHlKT6oesebcuJ2XNOLs?=
 =?us-ascii?Q?uRWv+VHDPgUp+XLzGn3CrzVJvaHeaAnwmY0UVYqsCRskkw3XnFhAP8qpiqN1?=
 =?us-ascii?Q?TncKfcdPxb+i+NFrRG+ohvrQTnm5eJQD7j9iZ7+K8a84Bs/dDaOgxkc23u30?=
 =?us-ascii?Q?B1serQCgSfBmfQkQxwd+F3c4tCqMlaxfeuiS6KZWZZWElz26a+zxW283/hrp?=
 =?us-ascii?Q?FyZV/CueZtOkTRh6v9N8Rsqgzmloir3jYzSascmVAItlWmr/i7anuhLDeAXM?=
 =?us-ascii?Q?UjUdZEY7/ZZiciFhWdheBpo5JRR8Wr7Sttd9KtJGBeijhPZ830KDfUfW7+8e?=
 =?us-ascii?Q?0RkGeSnULTc9vjeu08SoPmF863gL1ZSVVOeQB3q7B/UqPuXLDE1xb3gtxTj9?=
 =?us-ascii?Q?Tx/qiO0wrgGq0LijOr1a+iwH9aJ0O5dWkuQ0fbLLvlCDZopkHjUWRefLiOQK?=
 =?us-ascii?Q?5ZdaeOeVuigsMRPI0d97lpiwVn780idtP4pTrVDUDk6XFpY6i6OTXIbdFfNv?=
 =?us-ascii?Q?YfnDiCHqs11Iwd6FV+MYva1jABYLX/+QqLlcq3qeljg0cVAcRY2XsaamY8UA?=
 =?us-ascii?Q?WA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0215dc75-5345-4b32-affc-08ddb2817ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 18:12:20.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIvDp37FLknDVQX18hugGQSxcRxZVe8vE98zWwHQTareOitG4Mlf7QSlWpNoJJJTKdnB2nkyrLY5auHr11aURmQtiEw92AmeE/V2zHid4Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Monday, June 23, 2025 4:39 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v15 5/5] tests/kms_async_flips: Skip Async Flips wi=
th
> Linear Modifier
>=20
> Skip the linear modifier subtest on unsupported platforms
>=20
> V2: Remove platform check and use in_formats_async (Chaitanya)
>     Update the commit message
>=20
> V3: Fix crash
>=20
> v4: Handle the case for linear modifiers on platforms where
> IN_FORMATS_ASYNC is not supported. (Chaitanya)
>=20
> v5: Move the linear modifier support checks to run_test (Chaitanya)
>=20
> v6: Remove hard coding pipe and refactor to move checks inside run_test
> (Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  tests/kms_async_flips.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> e176b2a28..5a7daaf07 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -799,6 +799,23 @@ static void test_crc(data_t *data)
>  	igt_assert_lt(data->frame_count * 2, data->flip_count);  }
>=20
> +static void require_linear_modifier(data_t *data) {
> +	if(!igt_plane_has_prop(data->plane,
> IGT_PLANE_IN_FORMATS_ASYNC)) {
> +		data->modifier =3D DRM_FORMAT_MOD_LINEAR;
> +		return;
> +	}
> +
> +	for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +		if (data->plane->async_modifiers[i] =3D=3D
> DRM_FORMAT_MOD_LINEAR) {
> +			data->modifier =3D DRM_FORMAT_MOD_LINEAR;
> +			return;
> +		}
> +	}
> +
> +	igt_skip("Linear modifier not supported for async flips\n"); }
> +
>  static void run_test(data_t *data, void (*test)(data_t *))  {
>  	igt_display_t *display =3D &data->display; @@ -814,7 +831,11 @@
> static void run_test(data_t *data, void (*test)(data_t *))
>  			continue;
>=20
>  		test_init(data);
> -		data->modifier =3D data->linear_modifier ?
> DRM_FORMAT_MOD_LINEAR : default_modifier(data);
> +
> +		if (data->linear_modifier)
> +			require_linear_modifier(data);
> +		else
> +			data->modifier =3D default_modifier(data);
>=20
>  		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data-
> >pipe), data->output->name) {
>  			/*
> --
> 2.34.1

