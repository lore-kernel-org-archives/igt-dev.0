Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB72C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 07:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA210E1B0;
	Mon,  9 Jun 2025 07:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4g0hm14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1C10E1A4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749453340; x=1780989340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mY/IVPoCOz7S9jvBfTKv9oG3RVRgNhmErG2NiJyQE/A=;
 b=b4g0hm14WPeuD1eXkar1WS2VrC8oBIxwskcpAyfFdrt78eQdZ5oxDRzr
 forIJYW/ZWIKGv8FfNBCnnKWtedfT7ju07u3sdTeiKg20YTRdAIGOS+iK
 C+VqJV9uVWu1WwRWGVnm6vCCeRCTVHs62SGIoOq8enxv/4nNGAzQa0C3J
 NSbWQCXMsG5hYTVZ5sx3SFC/ryneDja54faTyv8bYNlVSzwR+gUMKMh5a
 2mLHoOlXAxhkrIBWW+lppcw+8RqC0nYEUL1pfSAZjqjvTzpbvqMRvAlth
 26kSiQJCX3yM9+BRw2au6mhA4GOuKqb0LE0keCHtMOlCAy5IkwkdRhU+o Q==;
X-CSE-ConnectionGUID: XRgCVGlPQACM5VT3XzxVCA==
X-CSE-MsgGUID: sie3GbBQR52fjTI7FPJX1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55186924"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="55186924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:14:29 -0700
X-CSE-ConnectionGUID: BbfkzPuZRBqZl0O2PJqrVg==
X-CSE-MsgGUID: ym8xcpIXTpiCye/dI1Ih6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="147016770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:14:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:14:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 00:14:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 00:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1pzY3SQqW7MVgEz7bfORB1JEc3ARZlEfl4o0zKJ/1m/h419IWAtx8oA8c9pAHqBz+gIVAVrV6UYMsu/tbgoJUtQ5+sPaH0ipZyUncS2OK+5djxcJ5jlQixjO7TIrVCg9PBU/Yjm2KYf2V2DxWzmnpZ0BKJl799gOPBJHy/PbeA+PqHHUrORADCSB5xmApUH/yUrU/ZSCFt5Zx6yO9a6l8KMhKMWnYBJatwlq7L4DYskMbTDFBdLPwvKYkjm8cbc1ysVdzWynSAeQcSBuZAxwcWBsvqFLVNe/2wq2LhMbh7QrIgMqJR2Ir0FkJYJFMgFJ3BYEtHQD/VFIQWLWKL5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wg5vlMKMTp6sc/SMiz4xRcr2qn3r/SNIaMulXW2Frg=;
 b=ycuN6rkRtsVPKjepZ8Svvc+eqWIMz+z0EuhUcd3KfBw+EkiJ9AphwEq4e4DWQUOhASsut7ybRQn9DlCH29CNN+N2+PWDnfLVp8kGzOZ1asWsToSaBsgIe9YOiuRHGBGFj71KjeE9qOsG0himl+nbU7dkr7JY96fWLeBqJaaFM/AVeBVBKZ8kwgt0J6QnwjwHdJqDzfRgYn/KwM32z2dlRgfsNMIpCtsy501hXfKODzKTcZoa+fT1tFm5MfC/nKYD05paYyjJ47k6M/aVXiMsV4rjpja2oyB7eg7iacitR8fu34y6C47v+vZXR+NxZ5HWNn6+6t8/mTtZ+xboMqVacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6098.namprd11.prod.outlook.com
 (2603:10b6:208:3d6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 07:14:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%4]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 07:14:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Thread-Index: AQHb2QxKI5+NTcW+e0+quCf/xj/Ng7P6afAQ
Date: Mon, 9 Jun 2025 07:14:25 +0000
Message-ID: <DM3PPF208195D8D68D36A79D3019903318DE36BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6098:EE_
x-ms-office365-filtering-correlation-id: 3ac59553-31c5-4e00-2678-08dda725443f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/BQHP3c55jpoWeoYMpSE27PliZTj7UlGWEgojNBKU9kZAoISzKPdDD4XF3u3?=
 =?us-ascii?Q?uBx8UfwV22BZe9JexRKxRj6NnaIDtvTlMh9GFMqjjMMo3gwMDCWqFakiW6dC?=
 =?us-ascii?Q?4Ryh8X2TTbUXQmgbDSJAlUGTK6Jv4EjqkMaF+fHxc5Fx2Ad0/xYle91YRJnF?=
 =?us-ascii?Q?fLK854hfyP67IoqvoM+2CzSwdCxyJWGqvH2+zcTNCUr2znhyUgJzWJBvyJei?=
 =?us-ascii?Q?6IrQ2V0qXfSVmlSzvpzJO9W5eQyXIeKlty5SjyMad1HWnt1OIKlcPyqu1TU2?=
 =?us-ascii?Q?1XJgVVfLWfzYfWKpR7ZAP57yQyvacshrZEkMSfNCf017lB2uwlZc7EJU78W9?=
 =?us-ascii?Q?s9SmZ/9KP27u0hVMTrwk5FjFuS0n4kRuYVL3hTzWA625xz6+J0DkoHBC5Pmu?=
 =?us-ascii?Q?4BRomo0Dde7qA6Lm32cJRdAsPapBK05SB4djFvkTBgKpe0FatfON5juDvnpc?=
 =?us-ascii?Q?vGTXiV1BHSL0X93PT0bChzNXNSoAGJipOiRV6PgAkkot2Ru5IynoeNT3r+cV?=
 =?us-ascii?Q?bG8M3NNsSLSeV4CYKaCxaVEeEk/MSaBohq2owBiSkKT72kb6HzIajkFYyGuP?=
 =?us-ascii?Q?6f1iX2ZUpsKD4TRJToqZwZc6kUlBbSFV6wO/wV20OPHp1XYySLtQyFr+JJ52?=
 =?us-ascii?Q?raSEgEnFHfRxgrtNTUocirupwRM4/nway3fGV3QJctO/bpI7T8wzdHdFmRpd?=
 =?us-ascii?Q?UpJmI99J5OQ7zzD5HxrBAXLcY1WtOxnbpl/wCaZRfT/WVIgnDT+XCK7A/xz9?=
 =?us-ascii?Q?d9yhk7tO1SmozsWKvK6rBilW5Vdrgs+Cv6yXIB+cctGktPtQ28cjYsJskeKy?=
 =?us-ascii?Q?FVkwpsN8ywdTyhwvS+0BNh+wNVLhD4j1P6VJ5BBKPmLfXxCksgfpDX+L5/ne?=
 =?us-ascii?Q?5WbCZW5DRjRihepuWYuNayVgufSWoWAyo9EcewLWtaM18brNW15+Mg6YoJlR?=
 =?us-ascii?Q?TfM/4Fajh+vTDiUfvL8itiBOyXnKTISTd4xOLNd/1UpxRg1ateDEpx/qv4/w?=
 =?us-ascii?Q?rRrt05Ab2fswniwdWA0tz/R+EyoR2B5U/7QTNA3cigdkWivMusCnOsvuiMJe?=
 =?us-ascii?Q?fXDBxWDcjLF15HZjjL5EfY2EzdM7QnOoIwSIi9jb+Zt4J9Jk8Qz8Yz1vJnSr?=
 =?us-ascii?Q?SjxkdWHdYBHvWB//NLpKwnG7HMR/KuwSIz7TzEKXn6LFfl9wHcxPiknhRDT6?=
 =?us-ascii?Q?IeXJtPHq+aGwzRGVZBl/TiN8SBmrqIWuy5Am3ix+D+UBiMEeI/iV5EX2i3w2?=
 =?us-ascii?Q?EgacWdsbOLmCHnWZHmTUyntVONN76HxhinA496qXX3lXiU9T4aSjBUoB54gT?=
 =?us-ascii?Q?DE4gRmCZkRQ+YnF4s0yEt2S8/9dqBtAwQtviggIBAKXb0x/gMNFBv/sj2qk7?=
 =?us-ascii?Q?uLMFKkljvXO0Jl0bnndd6C5DUcW3TVBhqUvi/q1j7WcmPq/+0Brs/f55XhFB?=
 =?us-ascii?Q?zulhVu4CjCbean4OAVWRD6C6PK8FFQucVB8JIKk9uuXSjLGevIRuFA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pkIyh+dDxKUuSxKGTekEjfax30NNyRUE1Qrmkxj6Yb3h0ZOHrp0LU0x4ut14?=
 =?us-ascii?Q?UjhXUtD3wmMRyBccGaSop/A+/I8fRHqsBor3XFqlfMUKjw3hOjgySHtG/RPL?=
 =?us-ascii?Q?qOnqFlVlQJ/aw1a7Mt/7AaC11xKTqUjsQNTFtp8U515El9pKzY5oEFBHfaAq?=
 =?us-ascii?Q?rTx6a6rZnbCiYWuwu0RAcX2KWby0VGJv3KNF5gtwXSX8gnO75/WFF5Vm3T1R?=
 =?us-ascii?Q?HmgJniJipi9c1aMSIxJjXcU7oVbKUVHdMGP1LxIbM1cN8WipoTzXlBcuj2WQ?=
 =?us-ascii?Q?+INCGEN+kQwfR8wcuCFlD8SyAqoapuLZCv9HPbj2gKSDNRfN5kt2Gfzc8tYd?=
 =?us-ascii?Q?L3ii6/NQ5Yo4mmBXRCtXglUoAALxr98B7EgIIELhNoSloV4owrv1APOYXniJ?=
 =?us-ascii?Q?LfUB8kkQnMC6dDsfEgeRSWl5OrlDednVzb/FI7QRARH5th96+rvWys00hYQS?=
 =?us-ascii?Q?pY8HNzyYDa0ZJFJ2OkB5DoA1RtGu4xJ5+4r1ubNv6o6Vs8oV9wIRdXx7T7Uo?=
 =?us-ascii?Q?8H9pOvq7w0ZHrjzxKJ4xRBJ2FIzevYjbftgKnj9CI74dB+OlX459zu+gHF+k?=
 =?us-ascii?Q?j/YgPNC8wpwsXOele3YIytl5tD+hvq5J1M4QN+rhn384Zu0Hj+8Y5JocIS1x?=
 =?us-ascii?Q?L1kEOgQpMaZ6DOglY4Q74z59cx6ZkVeyv65v9dBZesPiLETUH9XzFITUgoDf?=
 =?us-ascii?Q?NAj+7o/EYmENoX3y3Op7e//5W4m3ry3ByAYnbmDa5irONQP2sD6pJOG2qPTh?=
 =?us-ascii?Q?/tYLeDSAEFTYEFH03aFOnJiPXerTQuGarKeFJJtW/FitEQPRqaRBuucEjhvy?=
 =?us-ascii?Q?99ML9U15nLFrJ6XZz2A9Z81wCHavJUnxl6dnvSVZHjOgsUF8rqeCNkk3WU4v?=
 =?us-ascii?Q?byBcL5DJ4FDqWQCGsYFI78dVuFGbKVHTKQFbzavdTqJZVAoyG8UCVP3fFAHS?=
 =?us-ascii?Q?wYVZezSuQC8Y6Q00UMCFnLccuuOR/012lVdl/GXKybQ7VCOU5uJB+3uGyGDx?=
 =?us-ascii?Q?JN1uYrRyBrBFrgMddn14njkXwUw1oN+fynQQr/X49+SfEEEU5jgVraiY44as?=
 =?us-ascii?Q?teSRGDsjrG043FxWpuP3ip1BAOGDAhtw3Sl7WH9YuPjwST/wUHo7UD3DAfnd?=
 =?us-ascii?Q?S4qwtcTgyrUMxwzpu+vzHrMV1+f3N3Btr6aDWO9mNWkio9V3xdebq4wtWUhT?=
 =?us-ascii?Q?dN1IOu6u5vVW0ZHTLTxbtc/AppuOO9oqtPv+SzHWWLHC0FZfgr8GGLYlbTM8?=
 =?us-ascii?Q?eXR86FP9J2qnRdBFnQV7jxrp7ViTbzLk11HhTa2qKoGl+PrPp0n/N3G753Qx?=
 =?us-ascii?Q?Nkxk3s8bNszhA/FZMCnSa8Q44Give0hZF4bQpWBOdfuD2o7H8TFGR8VFy6hf?=
 =?us-ascii?Q?wzi2tllapz8+oX73wvWle67uoDqixav34sLnvW8za3ovgQ3VfzwqIrOIZOcO?=
 =?us-ascii?Q?kD5qUI1KhFE0hCs+4Zp+54lCxja8RnDdKq8IQMG67a48TF14dSsiMBOA843n?=
 =?us-ascii?Q?tOn+fhIhDiSO/bpVTPs7BPDfyt6dQ+ijPD2CFBA9BNaqOaDEN8Hyil7svxtM?=
 =?us-ascii?Q?89awJnSP1NlAZuP14WY9js3lXff8v48BekWUAdm0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac59553-31c5-4e00-2678-08dda725443f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 07:14:25.6699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0KbTzgMc0KLu3EP8Tv/0cjvR9Qsq9cUEMebShmAPFvdS1MQLuIx32ABDmjYnL2u6NZAiHGMSLHCMVk2JUyxEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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
> Sent: Monday, June 9, 2025 12:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
> names in blocklist
>=20
> Avoids false positives by returning false early when the vendor name is N=
ULL,
> empty, or a single whitespace character.
>=20
> log message in kms_content_protection by printing skipped outputs instead
> of asserting.

This should be a fixes commit because this is something that was missed and=
 should have been a part of your last patch

Regards,
Suraj Kandpal
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_panel.c                | 8 ++++++--
>  tests/kms_content_protection.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_panel.c b/lib/igt_panel.c index c89bf9123..c51fd7d54
> 100644
> --- a/lib/igt_panel.c
> +++ b/lib/igt_panel.c
> @@ -20,11 +20,15 @@
>   * true if the vendor name is found in the blocklist, false otherwise.
>   */
>  bool igt_is_panel_blocked(const char *vendor_name,
> -			    const char *const blocklist[],
> -			    size_t blocklist_size)
> +				const char *const blocklist[],
> +				size_t blocklist_size)
>  {
>  	int i;
>=20
> +	if (!vendor_name || vendor_name[0] =3D=3D '\0' ||
> +		(vendor_name[0] =3D=3D ' ' && vendor_name[1] =3D=3D '\0'))
> +			return false;
> +
>  	for (i =3D 0; i < blocklist_size; i++) {
>  		if (strstr(blocklist[i], vendor_name) !=3D NULL)
>  			return true;
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index b0d0b0234..51fc1d3be 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -637,9 +637,6 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  	}
>=20
>  	for_each_connected_output(display, output) {
> -		igt_require_f(!is_output_hdcp_test_exempt(output),
> -			      "Skipped as the panel is blacklisted");
> -
>  		for_each_pipe(display, pipe) {
>  			igt_display_reset(display);
>=20
> @@ -652,6 +649,12 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
> +			if (is_output_hdcp_test_exempt(output)) {
> +				igt_info("Skipping HDCP test on %s, as the
> panel is blocklisted\n",
> +					  output->name);
> +				continue;
> +			}
> +
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> --
> 2.34.1

