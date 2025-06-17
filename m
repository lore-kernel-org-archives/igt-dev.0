Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44354C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 09:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DDE10E5BA;
	Tue, 17 Jun 2025 09:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyssyQz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50B10E5B4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750152919; x=1781688919;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0TnOLHNWHT7V0H1D60IWaCdgbM7E2ltEa/VXK+vPlpQ=;
 b=LyssyQz7QxKTrwn6gNrCIEdb8swi0MAkbgzXLm0JSw6vqDC09W4ya8m4
 ocggWhNgVCG1Gq+ppb169whu2kkuE3gvfow2AcW6VlYTLPP24OzNPp40Z
 j/58vTsKeXZx5lbVaqvf7Tt5BVKWW8VgJgl5qTwIIDjpe5Qr4uu2nDrJt
 mJJ9Gzyt2irq+m++y6Vwxyok885K02Ol2tYrT4Khlrl/eP2xmhkLmUcw7
 Ba22NFTJCiEKaOzLDsXg+2P7cg9HuedipAdsFS9mrDZ2Z8FyuKJ8U84GS
 /CDh33KsqPWmfMQKMj1hh8K67X0sqJOsn36s7T90uFOOUDeL3CAQBVFIH A==;
X-CSE-ConnectionGUID: BMX1Rt41SJ+D661UvfRGgA==
X-CSE-MsgGUID: w6hGOehkTf27i5ygtk9gFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56122631"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="56122631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 02:35:19 -0700
X-CSE-ConnectionGUID: 4u/jeiM2QI+eyMJKYlxKxw==
X-CSE-MsgGUID: oq1wrN64R5ywJnSKECBJGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153488716"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 02:35:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 02:34:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 02:34:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 02:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYxefX1dlO3ttkDCcyliIH0APywjYaC7OTIxYuMi91Ca/5+wYxe7b6eZXovILnn/c+bCvbzjzAdZcywafayOXYd398tH8DM+wqHascRWPE0ADICwmsBTuwYb4HHFetF2km8aP8rj7hIlxbAzRazJK/1bgLmJ5xwWUbMhxS0Jj5aovL42Z4ncXsFqzCR3DSIIWdnxBweG/a/ZCCXTPXkrU1u9NtPGbm+phVizMyItpHbpwcI56SlaFmtUlYYpqeJjl39KOeWp64vfC6N15R9ozT+809NdruxH/EO5XAzGNXjQmR2HQeIj+iOUbjSnyqGZ9Eucj9FSXmPOTPADR7rTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2e9IHiFyQapathZf89aKl735HYP00+zRTek03z//zU=;
 b=MA3oZs3kQy4F5l9G0UgnmTxPCrSdTnqFMpb+RKM+OC6Bt+l4O5OJ6Q4x0K31KCn6pUiSaydN7d6s+cNACIAIZDRggJ1hV6Ii+7zRVlRkdVCna/5s+N3t26DCY9OBQjrNHjTyePSFDD0+DvgQ7AsTj5KehGcIuf9FEhWl+HMq7z/O0FXmB6hYHSFMAsJTb+G6AhGNSHzHTMV5I2VGUfFqyaefzXpAIfVkTsfAGeXlJjVyS1AoVB2U0hcGFjOBTqCAipZGsxGkWSfUfXM/9u+3hm0LtreLSpzT7L0eJE/VBgsKl6ik+Q7x46jGjJb4RufIHSt1o0QJNgx9hv+LwUjrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7714.namprd11.prod.outlook.com
 (2603:10b6:a03:4fd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:34:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 09:34:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Skip empty
 vendor names in blocklist
Thread-Topic: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Skip empty
 vendor names in blocklist
Thread-Index: AQHb21j3NRXs/2ODYE2rgsrRFQcaArQHHycg
Date: Tue, 17 Jun 2025 09:34:10 +0000
Message-ID: <DM3PPF208195D8D9E4CFE92C42B5D04BEFFE373A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
 <20250612051326.430330-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250612051326.430330-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7714:EE_
x-ms-office365-filtering-correlation-id: d484ad4c-24aa-45f9-56c9-08ddad821d9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lfTJNw4a1F2LmZo6uDfRScIL7pymL0ulspFfNTzGrUTSqgavmDlo/jY2xTUg?=
 =?us-ascii?Q?FnE/nvK+ISNSr/U1JgCFyPswBIPXpff7oDzKHqFH9o6uI8o2+px/l4SDW307?=
 =?us-ascii?Q?RKOctbgejrVbqDC0BPdIf2wrgItZdDiLbuRqHwe6mnDN/lrjTXGNwuisulFx?=
 =?us-ascii?Q?i0zGJ3+VwuHySuMuBVk0fzw2421To/a7p7YK6zwO7W95R3iiRbWVudEdEg6W?=
 =?us-ascii?Q?nB8JoieXuhMiekibSCD6KVZ/IICcBTk3kck1X2ccJOfc4L3lwIRP+NZ2JzW4?=
 =?us-ascii?Q?LDc5akeo7rpp4y1im1IAC5bz786yMzRLLevLJtkSj70ZDtOb+F/O6R2+tQj/?=
 =?us-ascii?Q?Hr8gq0gz2SLm1dW482D/Y7nSroL6vXGrlvoMUgxNetv+utXwmuBSHwy9k7H1?=
 =?us-ascii?Q?CAWiA1LucHYm8Q2XaDSXyjPCG60WYSHqNlYsfLtqKo5EH3CrR4e5HmbBZPTe?=
 =?us-ascii?Q?FzBmm3x45G78RW94dmyGXO5c8XHlVwZMSq7ucSsVOOTcnZETB3qQr9d8FrlM?=
 =?us-ascii?Q?OZGNwhrK2UxaAB0yYc8lsWE8U47BCC4Uh/qr83zzgdlworQ3i1xT+/Jvwtra?=
 =?us-ascii?Q?LU1mwfQ1feIzaOhdeVACOx3oPs4Fdqouhw783fgPjW8YP7aNn0CxQJ8mYsOb?=
 =?us-ascii?Q?OgODeN7s+shnWlDqgpxlZzHSowexClpdWEMxLUg5JIUCLPkjXoZE/Lxi9gCC?=
 =?us-ascii?Q?Atif+Xi5PPm0jQ/xppavMw1iVT+k1WA+2v4nozbCSFKZpPsukIROrGSTTS2c?=
 =?us-ascii?Q?L8DthO+2sQ8GwJ0fGiwZUePIx4SeY8/Pc88B0J6viCt6PBTSvYAVM0fi/Wyl?=
 =?us-ascii?Q?TbtTXlkMJ+c+2LdpvlVHdm2IEo/9ltBTx4VpRnoKbEWaKdYa1nVzObq4DWKO?=
 =?us-ascii?Q?OVwVE1yzHesg9etWEMYj2Q9+aeuCAdwY9KoYhy7sVy55YAZGAZCdsTziVrhR?=
 =?us-ascii?Q?8KivYtzhH5X6mSMxfeqZlePLxH1naIBwn7w8e3NK+xIvBvFhuLtUNBhfLGe5?=
 =?us-ascii?Q?sjj9H7LIGH/+enDQ5M0NWVyW7uixLiZVB8/1IfssiYZNs2X+uzWIuiMcG7Il?=
 =?us-ascii?Q?/xxR7mzzEV4bQBEvNnC5lerdTsk1QzKVIty4BoBvGrZZdNqe4NL4++pQEwtt?=
 =?us-ascii?Q?4cgS+r8bqaju6InAULCrzO5GzIfitPjh1Yc5MtJDLxK7L/fui5X0sO9P6n+6?=
 =?us-ascii?Q?YQt9Ps4F5jT22BKMJz+5cAx8etk0syZgY9bRdJG06zQFog59R1Mk0Uv3nzKx?=
 =?us-ascii?Q?WhD1kUWQ1rBgXdGh9I/3X5tXWbhakI5WeY6m++gilQVGrgj0LpKGgYGIfgWX?=
 =?us-ascii?Q?Ufv8MOfSJxaWfrx92J8dtj4wg5xHlCAOY+CunYuxM4FGh4/DuDGyvcTLc/Fz?=
 =?us-ascii?Q?LfvQ86aAw59e/ddvWQ8YUwRIQ/OYJAAZeHlcWuwDhaV9lyaxoGnpjDGq0Z6d?=
 =?us-ascii?Q?3IoRc1R3vLwLn2GWeaXd0w2+XbX2nFjtUwEvsqCuZMbfHY0A1HYJqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xKCOqgaoGLsMkbwYLc3Hmb8dZzr2gCDuv6nknVYq+XHXc16LpB45qROJXroh?=
 =?us-ascii?Q?yF8Ybu6eayIkkdJxwpEOY/3bhpCLNQGQL49rnAatJuri/GWytKSf7EFn9LqU?=
 =?us-ascii?Q?Ieu6QOIgQVBtoP9V+mD7CHuYT2OLTHUgqQ8e9yYysS7P4bFeJcC+4pQVe8W2?=
 =?us-ascii?Q?FnZyARwmogSW174IeaosZd/WcLQhLtGMKyobpvutnTFjIcsaQub9Ah9lMJPg?=
 =?us-ascii?Q?h1IGWdGpuAYnoVwkMf5+0bvqN4CKDQ2I6w9MC9PthW2YDryfcviGCeHQwFOf?=
 =?us-ascii?Q?rn1wgGFzL0lh37wqDyEdhYbGikIUxcxV3jLd8LMxqav+aB3xuWxjXNOeLA9S?=
 =?us-ascii?Q?ltZh+FSyBbdyUBmCcxIbRn49LDl9HKMz9+IZbNnlMwLijUMZWvHNGKz2LRnQ?=
 =?us-ascii?Q?/Z2RwTpj0GyeNDUje5MOjrRYwcQZ6Djt2PbXruYwtXff1fC8T8x6kVKHm0nE?=
 =?us-ascii?Q?3p+Mh99DMN2kZZ2Y9wJ2sx8T/6Axi3grsYkb+NOaa2RgXbzlqHPU6qvXRkFH?=
 =?us-ascii?Q?6DkGZm7lk6lUDzL3SVfIpDgJbQ3dEeCKx3Z0uOSp64jXaBskBI2cvK2mMrKa?=
 =?us-ascii?Q?JFldWzTLlerWQQy/UVoleLPhkHpReOk88zVtuIy7cHo6x8ZKPoeHex3hHM+d?=
 =?us-ascii?Q?WCQhSNuhsZck/1z7SzYh484OYQabibTe/2DioF3RmsEfC8YUGbFAHunBJ5YA?=
 =?us-ascii?Q?kJovF22pIwMDHmwkvfo/9QvJqCmHeq/yI40Uhf7S+FVTtZsUL9TZE1OiCYdI?=
 =?us-ascii?Q?um9/Gb2/capQzV6nkSLeWTNVcpR8WiNa04oyzOzILghj1ZBbbaZU7edufg1Q?=
 =?us-ascii?Q?5UMUzZ6MhnbHB7kuGb92srnA+zGCnytA8MI+QujbHQW2oLHl68aVpqeqxcYY?=
 =?us-ascii?Q?5NRK4Gg9Lishf1lTMnfyWIhNBcUUhsHFJPefYEYu/Nj/oC4pfkeye/vpMDVo?=
 =?us-ascii?Q?jsFLnPhF9jR7Bp4x3x1Cyo1jV/MgwDAJt/JzBQBfWl03zz3+LXHTzLX/wiqC?=
 =?us-ascii?Q?jK+Xk1n0yZPmklYw4sPlMXZhw3mJfilaOBK0jwa4mTGdtmllXHlKvakLLaRf?=
 =?us-ascii?Q?lPPTGcc0go6fRweooh5l0K++fEQP9d7n84UbCMghx/Ub9MS9jSCYyPoVPXuy?=
 =?us-ascii?Q?MtlWwkbv7M/a9k7n7cGM7BcdU+ziavx2HZjixiZP046MYZrKaX+Enw8kN049?=
 =?us-ascii?Q?mWLfz5zcoW/bhh7LQJOc0ahv2Y1XVmGaTECC/tRakjSLRiovXnXxXgsM+lrh?=
 =?us-ascii?Q?TE/3VTmxX57vFvrwgvFtf+kABafSNkMxAm58W/E9R17+5h12TnX9MXkBD5W5?=
 =?us-ascii?Q?7Y4rADe8PDomgsoR7hoYiu/VgwoBsoe2eDQCYtGDcgtc0mJCcDiiUVAgRafT?=
 =?us-ascii?Q?+uWcIsdl3RAm4aREPJAvR02glTSVsOlFMI5aUvMMcgO7A0EfpOYfO1i8Apzt?=
 =?us-ascii?Q?qK2XapCJsRKNbrAbXdYFOZA46r/kBngQiKlHJZmdDtWjAF1VLSiJ0mxSTvKB?=
 =?us-ascii?Q?GosEhrnlodnRMuScLgpDkllJje/mHszvBdawEDaWdMV/WCk6RVAmYAb5UkJb?=
 =?us-ascii?Q?0pKaf/wqz01TYUcoHrQMw1a29ERb/LAeGdQe4U0+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d484ad4c-24aa-45f9-56c9-08ddad821d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 09:34:11.0310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nCcPeUqOevdSrquSUJFjzTZd0MJmF2z07RaGYhGxYhzsMEa33lCbXJ0zVEI+GZ8g6pa6sNuzRXZhEZzrnoEJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
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
> From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Sent: Thursday, June 12, 2025 10:43 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Skip empty
> vendor names in blocklist
>=20
> Move the blocklist check after hdcp support check on a connector.
> This will avoid unnecessary skips when multi displays are connected and o=
ne
> of the outputs is blocklisted.
>=20
> V2: Add Fixes tag (Suraj)
> V3: Split to separate commits and fix indentation (Kamil)
>=20
> Fixes: 6a256bfe3025 ("tests/kms_content_protection: Whitelist check for
> panel support")
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
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

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> --
> 2.34.1

