Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8F0C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 10:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FEE10E3E4;
	Mon, 17 Mar 2025 10:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M42SiS5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0564910E3E4
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 10:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742208985; x=1773744985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WWWIWXPaFtLbvRGVPS7dcra2pjZN8Swql3PnrEddzT8=;
 b=M42SiS5KxSFcmUi9h0JkcokGsuJtrpnWXGsJpFXAf2Z+oZ6FOqZ2+KXR
 J2Mm84tVS05v2oZdPJ8tRcFNGuUJgXttMCbHkJZqztBAdcp79chAwYdr/
 m93lCTQcDnl6RTdZ1BvRVscetwSRO8lDVJIwBtnj2XK23TsPHqd154RTT
 Aoi1yy/pvSbwprcFc4QPxoHG30NjD1fnx1Q2Q9/LNLh8U+feXiqhuZmfi
 vK8b80Yy8M+5UZIGeFc/T4xMWE+1OsLuLQzVl/hYcucx8OL32k/lpC/N4
 08P6bocJor1NPxGhbI78iMYB46bmWmJ0xjTL29dED/R0mnYgHJBAtAfy1 w==;
X-CSE-ConnectionGUID: wjafxX4qSmqJFjSuWDEkuA==
X-CSE-MsgGUID: VufHu0x7Q2iD+pgbqkWTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="60688152"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="60688152"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:56:24 -0700
X-CSE-ConnectionGUID: QNIbYF8oTG6LafQerUV4dw==
X-CSE-MsgGUID: a73UGEEvS/GgRi986PLfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="121861617"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:56:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 03:56:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 03:56:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 03:56:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ho5UQSyVwUJspUmlMhPqOS+8YyWc5E+KQOX/kX6lJllUVUCGEic1Mwn5jrXi19usILf8c+CI8Y9LM+01wynBRmEsgE6NydQK07ZmkE7iE8OaCg4Vqsr/34zSjZkunGxSMoYOsB7fMDgXps4IdVpgRyMwNfIopZx6Udm+HNkbIgPZXTGOHndo1fAtwtyQfg//mKUEhUgUzplhcThv1Ymu7APhOD4QtG18XUpCpkujeAF0jaDXQg5IY4X1HGq9lZHa6GrncuMgit7kclL8iFUNEXShO0JZfUaRCTjVhiryTwHFpgGotMNMundeUKKcs4SmwAVFOEZIzwe4gj+zYiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYrCqqhwR1u+YC2rc76U9KxxjmcO3xgF2gOu2XxYXFw=;
 b=iX6DkMTRTL7WTuP1PJMxdlxehyp0vBlF+ydyKGlm30tHUu5G7Qu3vdZ+Rffoysd9l2tWBPsfKAWT8gzONRbZLR001KxBQHruQawcbc8dTpoNqcNVc4DKIZijmF5LwKdAryjUuU5B0K17TcjdCsbEyH59NLRjv5X01TW4+K+BEf6Opf5q+5Gyb1k9xedmaE37JDcSvGef2L0irzUFVY6Lp3Dohid5FokbfFF514PGgjhn9SCM07BnKsoXeCJ/7GHzr3JIt/3VYIfuJuYfV7IZfByPjoOWfzIshmOsfDPjWi36RDAjKakRR1xP4rQmvEKwj+hIZm0OOlOhRSp+KraHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:56:17 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:56:16 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Topic: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Index: AQHbkmPeo8/xkf+PbEycwelrlaClvbN3MKhA
Date: Mon, 17 Mar 2025 10:56:16 +0000
Message-ID: <SJ1PR11MB6129FCE95C8B423A6E191F30B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
 <20250311085422.2573860-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250311085422.2573860-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: ee7ed52b-fe11-47d1-9303-08dd65425796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R9ytgy3GpXtCr8qXDaOwJGUD1PYMaVWjwgKAhKAz40Itj0DUvC0i16PE87M+?=
 =?us-ascii?Q?OD21P6oPlpv3cNQJV0Ksm4XRz1xe7aNilqOr9AT4jvm2bDlLooO0ZEB0PeoX?=
 =?us-ascii?Q?AbGXd7jA2hiw8tevanDju5Adt0ridJ/Ky9vdDHOJcCUlDXDrml2aVeXW2eUS?=
 =?us-ascii?Q?c2cAlWFTPOmKhOcg5mEcp5at4LyqrzRCwa3TJdiZql4i2tpIyP9JNpjY1pNS?=
 =?us-ascii?Q?p00PDvjxCz55pmLrgand3hObCyU6M/gcHpp8s5r3tlCGP/28nsTFaqPDcKMh?=
 =?us-ascii?Q?MC1dThzJ5QwkoWEbeqhJnFgJ1NyXR39Rhw7hIMB2gCuT3d76/DCE06nSaFVh?=
 =?us-ascii?Q?g0MYuhlcpWiARLzYw/x8TgrebFhoxik1z9KkOGOibcQtjC/9hvZ9TSMWTXzf?=
 =?us-ascii?Q?ToXmU1OVhu1hbZF2s3go1cQepsEY2alMoCgPYib7iuvum1ehp9oYV+5BIIeD?=
 =?us-ascii?Q?LBtJs9QUjkvfcRZL1gfUVMMMz7Yn9pIb7hSBDrnmU/KMX/Eoy3mA6PKTbtiw?=
 =?us-ascii?Q?Foyy3cy2hkIVOP98Uil1oc9mWk7B4w27qfiQJPWbbcrGcw6e5aDHUwswpkvc?=
 =?us-ascii?Q?4w05Hjr7H/zy2gN0M47jZ70jo1BM4rHSmOT9TrLv9Xgfvu/c3hjCe6Poh1GI?=
 =?us-ascii?Q?CmONkTJrLCHEZfjS45l8qTbOrESXgCwcjiP+/JIm8/8drVTUzHvIkyNZBjPW?=
 =?us-ascii?Q?w6JfBReeK+XLfd+LM9CVHouv2E9ZOapcZtO9cU7oQgYTj+gzMpk+7E+TH5n5?=
 =?us-ascii?Q?w12u+/sxY3QJo5A1akHBq5wucleNnNoNXH06Y4xEjeyyhy/WBphWDcq9u2VL?=
 =?us-ascii?Q?Z+t8NhHSMel9+MLksntr5olYqUpjid7dh/GDF+whMC5HpsDdHT+y9Q7rdaLE?=
 =?us-ascii?Q?LxQvbYK3vOR74oRvn3bzIYXLOOQgOqqWz2JWIsVAlzdzpoDEWvbMr2p/e4B4?=
 =?us-ascii?Q?lK6ssKlmKvUolEyE1+UHiAf4kGxVu6IdVcMkHH1InaT8oeTFnq3OVWQkulRr?=
 =?us-ascii?Q?Yc2UZ3IPvi8V2jlUefmjn+cbwQH/7EI1SSdb1jwxAWLByTqtrSbiCg4oQ1Xa?=
 =?us-ascii?Q?KA2LKioKo1L7+6pQ2cqy28ae1XtxaTlHvO+xqWkuxM3Omod+XnnhTYlTlFl+?=
 =?us-ascii?Q?Be86RFGlH6W4cM/JkJUYX+TD3ApsVfy1/06ZscTqcblc9Txbe3Xrl62TQo/P?=
 =?us-ascii?Q?/+JhvY1xHYyxTBlVAaigg99vVZ4Zlyke+2Nwd+/ce62w/sil5/1GHWa7lhBp?=
 =?us-ascii?Q?gZ61XvC4+qacGIxRrJztcyrXbqcJotBoV1UYrr6sN5Q3nBlxS9uXB9lRY/+L?=
 =?us-ascii?Q?8Qm6ZCjKpIGqspE19AIPVweEvC+JujHqv8uHhD0KDUwa+LlOclIU0vLuhjH+?=
 =?us-ascii?Q?vMLEdpWLybzymt36BHrmcCPiMB3VJD5yjoMlrjpSWaFSMBx1qYUtkfg6xiny?=
 =?us-ascii?Q?xaVzE/S4nXR8C3brPaKfyM/X825vQGwf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+HiZRRktML90iC0vNPxaLuEkRpdZzWnY2pXqRh6xXGBFWOVavwmdQF8PGWdC?=
 =?us-ascii?Q?Tqa1jG/hGL7ss3ZpbLYSrQ1ULxBGWF3dRb3Swmbb0RWybEt149BIKonj2rVX?=
 =?us-ascii?Q?/f+cB3DZTGdemK9Nf2i1xIBHLvNtPrkwvllzDPmWZju7pSMlMgEWxsffIE2g?=
 =?us-ascii?Q?HfALvozETivdYGLs925IIYfUER4rzs7J6lhmTm4bGOxjo90upA0Ksi8FDJkx?=
 =?us-ascii?Q?t4fkJOjRYdMqAHGQFv8YbkBwKwCc1XvmKoDPd59kEFqbRr7ILlwwA/bXNPNI?=
 =?us-ascii?Q?GamqiIWrg20Eg9yRJ2QjpZgfW2L7DUptj4++6lAOVSU1qN3jPSSbTko6A5EU?=
 =?us-ascii?Q?hGiMXPZYpNAUC0qJjoFwvZimNURbMQpHtiJC1xBu3Tu+b7bpKyT39SN4C7Aa?=
 =?us-ascii?Q?Y2myBhobHBQcuAoPF0U1lv15OqQ0721xQwOvccEonBibaXpVRE/uHcsSdzWZ?=
 =?us-ascii?Q?+kNR5ENZ10E4ATxy9uw+5pDYc2hC8DXJJ3MBaJac9Rc3yTwE08NlqZlaTKrL?=
 =?us-ascii?Q?61sJRGnb7NsuHMWZEzT9cz+uxERz6oQJIwRESErSVO0temNuHo120RBazSVL?=
 =?us-ascii?Q?a/V5DJ+GGoxPS2LJp6WSU60qKB+q8eqoRAeoigJ8BwzdP5KpUh8WaEg0xXzI?=
 =?us-ascii?Q?43YfD6vj3hIJunH60iAKRlD4Iib+vXLF9L9IrhuysWGJ+fpeeLYUx5b1VewO?=
 =?us-ascii?Q?2NiDDZKSGAGarejjMd6uImNyogrHzRvUrzeNhoqkuUf35Flz45m5Q/EKM0by?=
 =?us-ascii?Q?kbuQSM9OdXvod99anGgC4NOBUk2EE0u8Pa2xJ8HYZ+viVwacawmkRcDeK2gc?=
 =?us-ascii?Q?1F1WlmM1XY/pBOkkbhF7TEKoazvDA7uH8972h3em6R6d03h4MvZJlaQ8HJdw?=
 =?us-ascii?Q?7ybCHZL8bdrf7t3MhxwqFEMszl0oAr/ACptUt3yv6+pi05MsHbM81OwAF9Bj?=
 =?us-ascii?Q?xONoNUIY1NqXLNsuuNiDcGLrCdO1AUb/t6wUiP9BL08K6KtffADrYGILXPU/?=
 =?us-ascii?Q?wH2C48rNicRAf/04mAK5ghryjD75/Ixt98T0k3sN6ZCqG2tzIiOAQjkfqcJA?=
 =?us-ascii?Q?ovWy4n8ggvUi8HM12H+bI5tyltUKMHL8xhralJMJJvHNBqJCafiHR9n4L4PR?=
 =?us-ascii?Q?eZoyB0zonDcCWtrNfw45zDO/1ev1q0kR/vL0Iy1y6x+FpsYR36eaMsjqyME8?=
 =?us-ascii?Q?KO4QMkpzoely+E5y9hymoJMPmAs1t6fi0v1d4WX1EmuV7h+Xb+lw7T4dunLy?=
 =?us-ascii?Q?ZGJQY/ekkw0TfVjX5DcQXriETcPeEn8U1Y6LxO5hRM8p933z4bJrNlI0L2Hr?=
 =?us-ascii?Q?sAFzRc65w0Is6+aMg/bcWFNiaiD8pFd+sGA2YQV80lj1rZOafktnULv5rpuK?=
 =?us-ascii?Q?bKoUNPLVqmrnorueTwK5FzEvwWR3OwSoVcFafTrflG99o2Buj0q2PrmlWnJF?=
 =?us-ascii?Q?d0DWRfgjpgceu5IymR1vgp1T7SvG4I99MCQbP1XIWpyQvCK8KhgoQMBvTbn7?=
 =?us-ascii?Q?2vINWV4XEv9lXOBKhNKTYqL4qylTuYaR6B39bBzEZ05JYpOpddHmPrMcqVTQ?=
 =?us-ascii?Q?cyot+8oZjPoCihrh1QY17MvzQvzJD+EYHSucxyKursUFdSzWrUXvyPmaL2/2?=
 =?us-ascii?Q?Jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7ed52b-fe11-47d1-9303-08dd65425796
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 10:56:16.8125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7b9ejsTsVFrgTG49M3NV812qSBGiBl7F7zuyF3MFgWAxI2oyC8yZuRGmQIA4GKBad1n4bkeB4en2q/kvHjCajIn4HSk/HzkkNvEmlzJw1hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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
> Sent: Tuesday, March 11, 2025 2:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async=
 for
> async modifiers
>=20
> Utilise IN_FORMATS_ASYNC property exposed to get the list of async
> supported modifier/format pair and improve the test coverage by iterating
> through all the supported modifier format pairs.
>=20
> V2: Improve run_test_with_modifiers to set data formats based on async
>     formats.
>     Update make_fb to use data formats instead of hard coded format
>=20
> V3: Update commit message, remove complicated iterations (Chaitanya)
>=20
> V4: Reduce the format+modifier combinations to reduce time needed to
>     execute the tests. (Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 76 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> da426f753..0e2b0afec 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -36,6 +36,7 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "igt_psr.h"
> +#include "igt_vec.h"
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <poll.h>
> @@ -122,8 +123,14 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	unsigned int plane_format;
>  } data_t;
>=20
> +struct format_mod {
> +	uint64_t modifier;
> +	uint32_t format;
> +};
> +
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -193,7 +200,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>=20
>  	rec_width =3D width / (NUM_FBS * 2);
>=20
> -	igt_create_color_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb); @@ -710,21 +717,75 @@
> static void run_test(data_t *data, void (*test)(data_t *))
>  	}
>  }
>=20
> +static bool skip_async_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) =3D=3D DRM_FORMAT_XRGB2101010)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	if (modifier !=3D DRM_FORMAT_MOD_LINEAR) {
> +		struct format_mod rf =3D {
> +			.format =3D igt_reduce_format(format),
> +			.modifier =3D modifier,
> +		};
> +
> +		if (igt_vec_index(tested_formats, &rf) >=3D 0)
> +			return true;
> +
> +		igt_vec_push(tested_formats, &rf);
> +	}
> +
> +	return false;
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
> +	struct format_mod ref =3D {};
> +	struct igt_vec tested_formats;
> +
> +	ref.format =3D DRM_FORMAT_ARGB8888;
> +	ref.modifier =3D DRM_FORMAT_MOD_LINEAR;
> +
> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
> +
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
>  		test_init(data);
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			struct format_mod f =3D {
> +				.format =3D data->plane->async_formats[i],
> +				.modifier =3D data->plane->async_modifiers[i],
> +			};
>=20
> -		for (int i =3D 0; i < data->plane->format_mod_count; i++) {
> -			if (data->plane->formats[i] !=3D
> DRM_FORMAT_XRGB8888)
> +			if (ref.format =3D=3D f.format && ref.modifier =3D=3D
> f.modifier)
>  				continue;

What is this check for?

The rest of the test looks logical.

Regards

Chaitanya

>=20
> +			if (skip_async_format_mod(data, f.format, f.modifier,
> &tested_formats)) {
> +				igt_debug("Skipping format "
> IGT_FORMAT_FMT " / modifier "
> +					   IGT_MODIFIER_FMT " on %s.%u\n",
> +					   IGT_FORMAT_ARGS(f.format),
> +					   IGT_MODIFIER_ARGS(f.modifier),
> +					   kmstest_pipe_name(data->pipe),
> +					   data->plane->index);
> +				continue;
> +			}
> +
>  			data->allow_fail =3D true;
> -			data->modifier =3D data->plane->modifiers[i];
> +			data->modifier =3D data->plane->async_modifiers[i];
> +			data->plane_format =3D data->plane->async_formats[i];
>=20
> -			igt_dynamic_f("pipe-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
>  				      data->output->name,
> -				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
>  				      /*
>  				       * FIXME: joiner+async flip is busted
> currently in KMD.
>  				       * Remove this check once the issues are
> fixed in KMD.
> @@ -738,6 +799,8 @@ static void run_test_with_modifiers(data_t *data, voi=
d
> (*test)(data_t *))
>  			}
>  		}
>  	}
> +
> +	igt_vec_fini(&tested_formats);
>  }
>=20
>  static data_t data;
> @@ -757,6 +820,7 @@ igt_main
>=20
>  		if (is_intel_device(data.drm_fd))
>  			data.bops =3D buf_ops_create(data.drm_fd);
> +		data.plane_format =3D DRM_FORMAT_XRGB8888;
>  	}
>=20
>  	igt_describe("Verify the async flip functionality and the fps during
> async flips");
> --
> 2.34.1

