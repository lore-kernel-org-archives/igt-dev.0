Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4191DEE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 05:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C5510EA9E;
	Thu, 12 Sep 2024 05:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWAwJWq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AE310EA9E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120646; x=1757656646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qDBGZASjRBnEuCvE0LbMoSdAWAJCT71wo/dVYGR+I7I=;
 b=mWAwJWq85ncQOynmJvxADzuQDexBlc+9HAGfVGnNjCx58Qf3COpJrJUD
 mCw+xCXUWyvjAugwVaGjt3Q8ZsVVEHL+0llfKXr2ylJBXz9vNQkns1G1d
 K78ahRR5q+B88+l6zUuN8DpxmI+YCQubSzQnaGT9pkjIqvSI1dSkT85ZZ
 hBJKQYe1dCQbieGfy3GedlbcG81sYZh/FHa/wBnQE/awBv8nrCByeVWhs
 WQGGRHjkKsAvkUAc6xB8Rfq0Te6+V/T2I0iTRE3dm/U3qg+lKa709BYtr
 CA7JSJHpWOuVH4+CLs/8+91DBJduh+wryI2dkRsnCxVhL60eqhOmYGDW0 w==;
X-CSE-ConnectionGUID: SaEhqEs5Sk26fgj7RtiSfA==
X-CSE-MsgGUID: DqpMyW1pQ0GMZxXUbhUoZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35523727"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="35523727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 22:57:26 -0700
X-CSE-ConnectionGUID: apYElasETNOwhXXNsI0KjQ==
X-CSE-MsgGUID: m+IUFCwhQHGgP1l4whSQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67654860"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 22:57:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:57:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 22:57:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 22:57:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 22:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxmsmtFtJRCqD3rrd2YQWr03xzSOjQyuAcErGu9KDbNH2kV2PCHP64vdlO24LK/2Q2r/hfY1L8QgGyvavIfLDxGmsnd/4BFcctzPIjzSQqDVg4d20M/zPg/JwkRqduwHaoe3xa08qn4ulQh/9ZfTsw57ZOnzxMb+szNSIZwqYTwf8Gy5nUN4BIWjoAHnGkDH+UNmMwxXBXHetH9fgJEIf1riw8tzB9HEse6tK6URomz4MTJ3Bjw6D2UMrMccWKZlCcblKma2QAibYIGmb8SAxIppvhXVmD419k6GUwEuWADyfYWdO45PSaZ6QCylsEo69SYv6fYSbM3qXNkQjvALQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MjtHDA0za2T0sCLPra0ibhH6RBck32Mdi2w/tgratE=;
 b=kCli70gifCwczErTQ5Cqr+8rPvsdgLlFYXhxpl1HgrybKErnw3OGlERzzHrdTeNHb50Zwxh5+CAUcoRa+PDHGkhDQ/YTcY7PIw+KLSOKEwdcXI5FgDxc3Sr6Bv+ucFsFC3zZRo8md0K572mzhJiJPb9ff56MDyTd9m+XKkx9u3bYXM1kXfghD8pionVzaLe1FPlf3WqXmGOt7qjkkTOPsUDd9i65+MHbX5cdu7xi3Nfeykl5ONNl5lSUog7kwFIbSglDaNQYUb5m5Hp8vbUivaS0CgWHWe/jVuEF6rUNhhtnHARAkIXpMLU9JHKPpdDYwtJ3fxs5Yebo0Bgrbj9C/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 05:57:22 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 05:57:21 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link
 rate/ lane count for connector
Thread-Topic: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current link
 rate/ lane count for connector
Thread-Index: AQHa9yia889jF1V9MEWAnlcUBHTL7rJGFnQAgA2reqA=
Date: Thu, 12 Sep 2024 05:57:21 +0000
Message-ID: <CY8PR11MB68891D8C3B956ABFA95A4D4BDA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-3-kunal1.joshi@intel.com>
 <ZtcKVEMveXWJVCO9@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcKVEMveXWJVCO9@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: 7e02fb24-12c7-4f37-d699-08dcd2efc45b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?l/Z0Gm93CJnQIYxaqtjgUlbAhEvHHt2Gouy0kqFM959hhT5rhely/uPOXhRK?=
 =?us-ascii?Q?ri0LQWyoLVsPQdfKwpcL6a5xNokY0x7yz13iBGjOfRAhZldFjCyqv18PtFqs?=
 =?us-ascii?Q?DrwtoZbsNwMdSbw9EjtOf/0NrgShhWo2Jg4rO+bJrFLYj+zZr5lpaY5XDTrN?=
 =?us-ascii?Q?oZhrVEiYYFmhdjCvDcT4Cuv7vvklJ+ywjI1RVE17gzTNzEIc8YfQfQps/LHr?=
 =?us-ascii?Q?j42UmaBGg7XQU0PzZGUM8KRc7rOIGacwI8/oU8lKWA02jxVXgZeHJZz5gSz3?=
 =?us-ascii?Q?MqaztzmYIQXmVVCZ/X/3GMiUVC5w5UYOF4xj2vQrR3R/Lph326eb4w5D9n09?=
 =?us-ascii?Q?jcc1n2JkP32DdEZpyLQAG9K9SGVhUsXgRMzzWfF2mo2BzlRx7vhpCYGISWs1?=
 =?us-ascii?Q?FVSkBLWLOGtlgO6EO7I63LvkMCZLPkb+yeMzBZ3MGj0oxxRtvGTq3uOFM+X7?=
 =?us-ascii?Q?7V4FDMGAkFqYgRWnVs3Kqlb1HXQnIw4b0iZC1B+AB7v7ZQU7ld7OdSNKeV7/?=
 =?us-ascii?Q?8O4QtJP/zglqSWUDq8ZHg8chCZH4+ha3AQb3qoneu6rYjMizq5CxX8TeKu2i?=
 =?us-ascii?Q?GohVN0Sq2D2rmwE1ZUUHjCopUtkNljVkDvmxjReXi9dBaiEEKltkvf/7ROb8?=
 =?us-ascii?Q?wq/yLy+VcWc/AUywctN7+egn8o2VJ4US3Sf7W+16DjjqwOGQid+t2Av5+un3?=
 =?us-ascii?Q?TgC21mQKbhRrcJMssa9+uMGgii3c+x7Y4M51TOBwxbQhv+WAAqM5G4qVtXqM?=
 =?us-ascii?Q?TytXPeWB290os2B8tpksQSHFlKNt7utxhgMZ0xip+GmD1CL/rYyrohZUWFqU?=
 =?us-ascii?Q?rrghSZ6QKA9CUuTWzpe8DGyqX5O02fxcPjsRAI16KrALM9mg7aB8753yQ9rm?=
 =?us-ascii?Q?QT0NMw4ezZVUKFJITKboO7dfcG+HfcWoRd6/zGC0fzmFZuoF7Cc1mlkxehnv?=
 =?us-ascii?Q?Ny1myR7Vr5Xkr/sTvAVtz3GOKzcZ5g0KDg9PWE4lOfn62pYVV4dKMNRbneK3?=
 =?us-ascii?Q?EF4WyuJqAt7tji3KkPS9e6exMlS7mkyPrE6zgfxRA/QODgWt03GULw7SP8Xk?=
 =?us-ascii?Q?oMNrmfU8p4uE1e9FqdSDpsCGYSnZERT02hzkj+8ic+y0W3LHVcO1OKVwSHBq?=
 =?us-ascii?Q?wJmSy4cBfluIlNnNaXT5h6e45fZRoGXnJsoNkzA+9W2vXvMdSnrr+SuSBnF6?=
 =?us-ascii?Q?yb054qFWnPGqbanOjlp5o+6LK6E3vG+UvLliVWdDDypz4p5CjllcCAVk4lGt?=
 =?us-ascii?Q?Sj8/l2Vh9REPy6UoZmx89trakjZkEA4lsQCKF5TF9NcFAw+x3Nx3Tohq3Ywl?=
 =?us-ascii?Q?JxzteSAZ6aTxvqcRR0GSSzurMLNf77YuerRFY8bou/f2vkgt1VRDZMonSpW7?=
 =?us-ascii?Q?YruOXe61VKLd+lsChylMZWay0v7j61fG77LmkSWE/4eB7FmyzQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fdnoKApKYJrINYNNzXWUmPeouiVl6es8o16ZHm2joRW93Qz27fAJO/cwCzss?=
 =?us-ascii?Q?HmrW5wZhDEZsAG/NJyjs9o9rFQHPLKmwhU5sfpfdbOCrhTXnhV7OCJHPlvh8?=
 =?us-ascii?Q?l0MQA0h5g7E1ITgDFK2RhsZHtrFGMZYrZF/sB0pxDDvJW2vK2B+dVAose3Jk?=
 =?us-ascii?Q?hE21XL52PJVumg51YdRRqXjMzDRFs+XYgMiDGiLZCI3Dnyq36DzPChblsxqp?=
 =?us-ascii?Q?k9v+P8JRydiswe7KA8shUF9cexzvgwpNHW8ZIbodeiKjjdffMoDYxs2IZhsE?=
 =?us-ascii?Q?FhQVZQoRUEzQ3OGqbPY2oBVV1ZRr91oPTd4QgNGBErM92XWuqz3dqLXh94TG?=
 =?us-ascii?Q?Mddy/c1gIBKRrHpL3aUQmq8IMvyR2utrvyR9tP7rAP7cyzau1/nxqOGHDbE6?=
 =?us-ascii?Q?jXCBT8hh8SP7ABgEazDs9HnHMb+LHJP5KhqN1sd7XssScAxNFUJHpy1Mcah/?=
 =?us-ascii?Q?/Tu3NDCot+pFRJ0DYQa6Y8qPwBzPTEocf3kz7oBozEsy5QBuu0LB7/vL5/kT?=
 =?us-ascii?Q?ZwZBuXvun5mGIEKsnYXB7Wgb9NAnwxlHTMSQGhLs5OEgPVaTm+YNTqZuC5QI?=
 =?us-ascii?Q?8aPlDrcuvwQLZlMzuueZsHYwSGxuhpCZbQMe64vG1NsqiWFjfFFBvbRQbSjM?=
 =?us-ascii?Q?9G1vJ64lmwwCjdMiD7EHcToHD7kMPqKPl+q3EtbMK/pwgw5tEroqKSs6moTP?=
 =?us-ascii?Q?pJReRCT52T6E3pvih+tvsPgUH6VXTOS/0AcGWYItum0BVKUUaol9afPpOvIh?=
 =?us-ascii?Q?Y4b3fAwafoJOr98ymgH6iZIBFyO+aPmIaZ8DU73nVH0lCrSFqEfRM+nywOgl?=
 =?us-ascii?Q?YBQEVGBLpzYRYrirgqtRJblR1gNcTg4xif6pSzSsnO8rHhdTbb6uUO01cVHw?=
 =?us-ascii?Q?RHTvUyE1wel3CrPwtZl8lImOIKrU1rNi1hZgGYeCJfFNFAkldT/PgctXoaP3?=
 =?us-ascii?Q?x5cRqFIugoLsAJhM9XyP1BQRtyO1dcCrFsQgXI4GSUOhmXtl6L1A7+EtoIbE?=
 =?us-ascii?Q?1WptgHqZZBUACY8vF6qP7AfABG/p9ueP9hwfRzahGzBjTgK+l3NDN2zldbjG?=
 =?us-ascii?Q?s/g6XtN0jH3DHuTvAa14kyPuRQKaq9jRABnSvFFphapenwYoeKgJbIwWjcDK?=
 =?us-ascii?Q?06b0xWuh8x6fZ9qFjVhj5I1065/AsWz0l+ragtofzyRjymqvqA1teAqXeAC0?=
 =?us-ascii?Q?2U2S80q5qjoyyStY15YPngEbic8sfUjc6QsqWjyXH8KVSOuHbyiYSoxWTtMA?=
 =?us-ascii?Q?VlGRx6/7s2dBrAV5rJwVudT432KiTJqwLBOu4UryLzuxqAUBU8LCu5FCzrVR?=
 =?us-ascii?Q?/A5SrV23RjZyOiUFDakgHMmTTFJhwJcZPCB7JYLcYJRoMVO2W3BBGIoNzTWW?=
 =?us-ascii?Q?2qwTAYiK6O47ZbKsqfM0LBEe8IFZvd0RdJJBojliF78W448BtfY5kT6ILJe8?=
 =?us-ascii?Q?mVo3SE2S6m7m0ZVAPQJmnOYFxZZnPZ4/Y2JeN3OP8rdiKytvgT0Dz+7fZPf0?=
 =?us-ascii?Q?cJEEC4rLgZOW+EzlxPUpUvKqnvJghIUrIzZvRQfOmuwxjBbMtlzuVDFCw02D?=
 =?us-ascii?Q?MsYviuoN7zzxTUCoJqBx2jISTfmcciHYJ27HyGEC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e02fb24-12c7-4f37-d699-08dcd2efc45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 05:57:21.2820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk2CYNfa0K3eaFRACb4TwgWjRtTRCf67pAYMQGCvS9IYFysWq2s/eLHpt9dtCIogrsK6rw47xDai7LTRF7PVHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 6:39 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/14] lib/igt_kms: add helper to get current lin=
k rate/ lane count for connector

On Mon, Aug 26, 2024 at 01:36:00AM +0530, Kunal Joshi wrote:
> i915_dp_force_(lane_count/link_rate) debugfs files expoose current=20
> link rate/lane count for connector.add helper to get current link=20
> rate/ lane count for connector
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 58=20
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index dd530dbab..4ef7f4d7f=20
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6705,3 +6705,61 @@ int get_num_scalers(igt_display_t *display,=20
> enum pipe pipe)
> =20
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_get_dp_link_rate_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Link rate set for the output.
> + */
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd,=20
> +igt_output_t *output) {
> +	char buf[512];
> +	int dir, res;
> +	int link_rate;
> +
> +	igt_require_f(output->name, "Invalid output");

It's strange to check this in these library functions. I'd think the caller=
 should make sure already that it's a valid output, how can it become inval=
id in the test this patchset adds?
---------------------------------------------------------------------------=
-------------------
Was extra precautious that some using this API's may pass NULL in case,
but will remove this check in the next revision

> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf, si=
zeof(buf));
> +	close(dir);
> +	igt_require(res > 0);

res =3D=3D 0 is also valid.
---------------------------------------------------------------------------=
-------------------
Thanks for the catch, will fix it in next revision.

> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) =3D=3D 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) =3D=3D 1);

I suppose this should return the rate used for an active output. It should =
be the one with the '*' marker, regardless if the rate is getting selected =
automatically or forced. In case it's forced the selected rate could be dif=
ferent than the target with the '[]' markers (if the sink doesn't support t=
he target rate). So I think this should return the one marked with '*' or a=
n error if such is not found (when the output is disabled).=20
---------------------------------------------------------------------------=
-------------------
Ok thanks for clearing, my understanding was a bit different.
Will modify as suggested in next revision.

> +
> +	return link_rate;
> +}
> +
> +/**
> + * igt_get_dp_lane_count_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Lane count set for the output.
> + */
> +enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd,=20
> +igt_output_t *output) {
> +	char buf[512];
> +	int dir, res;
> +	int lane_count;
> +
> +	igt_require_f(output->name, "Invalid output");
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf, s=
izeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	if (strstr(buf, "[auto]"))
> +		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) =3D=3D 1);
> +	else
> +		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) =3D=3D 1);

The same as above apply in this function too.
---------------------------------------------------------------------------=
-------------------
Sure

Thanks and Regards
Kunal Joshi
> +
> +	return lane_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 999921f9f..9d42a2b35=20
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1247,5 +1247,7 @@ bool intel_pipe_output_combo_valid(igt_display_t=20
> *display);  bool igt_check_output_is_dp_mst(igt_output_t *output); =20
> int igt_get_dp_mst_connector_id(igt_output_t *output);  int=20
> get_num_scalers(igt_display_t *display, enum pipe pipe);
> +enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd,=20
> +igt_output_t *output); enum dp_lane_count=20
> +igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t=20
> +*output);
> =20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1
>=20
