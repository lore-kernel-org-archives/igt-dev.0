Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A305C02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 06:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524B310E10C;
	Mon,  3 Feb 2025 06:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzHkJaTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8BA10E10C
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 06:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738565357; x=1770101357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zPkRKX4j6obUq1RIXGOJhJjVF7MYDGybEZdoK+ajtas=;
 b=GzHkJaTQroUzRyXq9g0Plbo/JKm3tnKI3ttWSFzs3RDVfVPQhjHTdDOe
 i7hD3Pr8/nYZzcZVTrwq9hpTbbG654qqxAbPsXoJi0WzO15qRkScFt2zN
 gY/JL0X2yFYGhtm9mNKjEsIS4mKM5R6AVad1Pf9tVpaEStbBsEiBY+6wn
 blsK8pvTvZZGgiKAql7E8W2hE8LULb7nlJxQSCRz9DdQf/MS2E35DmBxM
 DoJslfrH/rYDdl/A6sHFDhTtQf4hEz+ZH32YiI0KO4TNTV6cE6Vg49THL
 si3UhaitMVqvq6Gy+wWF4U4Zd2jcDwdpH9e59zOiYxSc3TATj33nar7nb A==;
X-CSE-ConnectionGUID: o+MtyYBQSbO7+XLxfjfZGQ==
X-CSE-MsgGUID: S1+8hQIdTfynt8dnNdeaXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42969270"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42969270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 22:49:17 -0800
X-CSE-ConnectionGUID: W8Jqap3TTzKAj3Zo7HOLDw==
X-CSE-MsgGUID: g7CtyqQwTbqtuELSxAjhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114225274"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 22:49:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 22:49:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 22:49:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 22:49:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDWUbmETHPsj3pq+bzhK9oGR5d2ER7sMBsUQDUX5mBBT12et8nYWRDZKvPC+hTWoX97kHuJUldKpC1N3yBUiCaKiRf3O9RDIRexBXpD/mtB+s/gkOM0AMrBJ+JaOJ/qbEmZNiOBe2vL71xiR4IkTdLTdoWA85pF7ny8OOTVwIVYG7Lli+NoW/2x9h4UOaZdhqKt5t2EV7sClWEKT74JWeVK1QdZdZsiZ9fHI8rff4jd629ZjwVeJmECJBfI4XbJTeoc5GPr+ADpGq1635o54OkFtT7jrcBJ7sXlyDS8IXSOz4nMil0BomX/aptd7KmNSrJwARIdiDGp7FiRzDa1wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCaApsg4QYiKiY6WO9D3v3/UyuA53WMWdkj8IIOnKfo=;
 b=NTMfm8ArzIiRBdJ9aViJZHESSNJQl+F1uWoPKd387Hm7ERn7+etQYaH+jmqRONzliVx3rFSK7dwpXl4tq9vrvJPvVn2QS9LORWYrcSCIh2cq+KL2AqAFf+oKa0YbFedZA2ip93h9vUcLsafvQtmBnWEVGEFAWu+S0ubbDy3gwQ3TWIM1z2rfixo3gVSeDXV04CfsLKX8mfDqWtaR49+79rwLuhZzXVEye4eBBGFDvFikuBywj3r8BEZ+FWgoe1m2LGHtBWuVk0TjT2Qr8eq+ykLNZlj0QLW/pkD2BxfQdLZbnF1fLY0RXQyzqubis8ElBixAF+SHhcrca7HwynUJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Mon, 3 Feb
 2025 06:49:14 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:49:14 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 2/2] tests/kms_vrr: Add DRRS verification in
 seamless RR test
Thread-Topic: [PATCH i-g-t v1 2/2] tests/kms_vrr: Add DRRS verification in
 seamless RR test
Thread-Index: AQHbc2/uagZu6qkFFEm0c9NiVE6FGrM1J9qw
Date: Mon, 3 Feb 2025 06:49:14 +0000
Message-ID: <DM4PR11MB631257D540EA044F4BDFA7A890F52@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
 <20250130235246.4142758-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20250130235246.4142758-3-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB7281:EE_
x-ms-office365-filtering-correlation-id: 55d47199-cdcd-4051-9605-08dd441edf76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Mxkpy4t37F3AgKwNjhLVibO8kxU6ejcXxWW+QHvFCMoIJFkLHQoE4/wlchWC?=
 =?us-ascii?Q?wN+EjF7drUAV6KtsHSI/Lpz60oQ0i4Lc7BY+IOT2NIy8nnv1CeHO9XQhgedd?=
 =?us-ascii?Q?ttkT2+St1vvb1R24nWpa9iSjsFQ9Mvcsm9qIu/YcRzZh5OBeeHvgRJGn73VA?=
 =?us-ascii?Q?6814JOkE8lhTKMP0xfeDR1jCvptA3APNAq2HFCX1BpOAcyg+HdL9N/XXTAMP?=
 =?us-ascii?Q?ZW65yXmEywNY9tefSK/LzH6WEvTgtAblu14i86XWbkfpiUwY5ZgCu/i2uqmJ?=
 =?us-ascii?Q?WTjT+AYwrgVAvTRm/a8dtIFhBbvTG6yPmo9oEdc5jUMXsVDouAqv5rwlljPL?=
 =?us-ascii?Q?KFpwGdvRrgKx5rYt8AUBFgT4QirgAndh3z/awff7DmpIu5tPd5bnkoMs9vHT?=
 =?us-ascii?Q?tlhRxEBOAxYKkfYSdBMxSTXK+TiuDVCMomLNlNRM9+QwhFfdcUrgldmT++lU?=
 =?us-ascii?Q?fvJmIL9eHNEeUfu2B1UL5JNBaFpKBcofwh46IOdJrfsCSfcwt36Do8feoFAm?=
 =?us-ascii?Q?M75L9M6bVGAFFZpjdzZDLrKYyENzHSu4mE4ep/chqX52JveZFoH16MHVfYkR?=
 =?us-ascii?Q?3ErBVAszwJvXNq9i0TSuQ+Tv3qfepQZ05KHltQLdvZJfbr2Cvwm0gbHb3jnh?=
 =?us-ascii?Q?tFkutRdSyH5HNGaq0VpvHko49MULGpweZXnaQQOEoHM+5xyecZrxwpLJbZnZ?=
 =?us-ascii?Q?ZDdJh4yv7X5d1kFPSv88rpTK6xzrC5Dz9HqXSKEiaq+PrV+MywTxlCMBW02w?=
 =?us-ascii?Q?PM+V6m5SfKcRkXeZ20BLG3e0vyyIIY/ijYPBNVSVSBSHVmpzFcxQc7QwGCGY?=
 =?us-ascii?Q?b28NunwhXn5zijpx0BgQeyJlTlfx+NeC1scMgvwgDQmPtAA/Xfo2LaFgbDDS?=
 =?us-ascii?Q?Zkg7myq1PlCTUGArESnaN96pdVuyLp/b781rGzigqidJ5rnVSedODgF0cmuF?=
 =?us-ascii?Q?0XvHPJKLe9FD9frP++uxsJ044LQ6tJ6x4NVOD28VBZMsFD0FJkpxGhx6pjz7?=
 =?us-ascii?Q?0Rj+lYfEoT7JYiKQrH/Tw4boLXhltYrpULv3P66FXwhh9RC109SE6JFUjd4s?=
 =?us-ascii?Q?e04cxfnoqzTq9fL+I3HSDugZxNRKg+RcUPU8THV2TI/7yQRPA629t0qPfIID?=
 =?us-ascii?Q?jew2QlHUOLwPoVVQpeJQmyWS6ndIgeiiFOLNQTi8LjV/ohrs4nlBQYOEWuhp?=
 =?us-ascii?Q?UcBOzw/gsFlNMtj+YdBkKc9q8OwaMOIDqKZYs1rl/A7qZ6x12x8KMrUWdsHW?=
 =?us-ascii?Q?sVYEjBchDAXYBRDA+fVbYYk0J4i26bkI0XVRuzsY+CadamCTMl75fQ7tjOiM?=
 =?us-ascii?Q?T+0dcdZl+8hDjncRHi6R3lwwcCZ2WGmC6S18ld2KGZRTxLIFWxIOcpCSrQ2o?=
 =?us-ascii?Q?9pmZBAtDH+C9VBYCdttEGvrzthOMSMx0JtHFOAU1wp7n0JYlsFzYpMtwqx29?=
 =?us-ascii?Q?vJh0dvvz1wEW5bERZR+TyYv0wvLY2ftb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8Kgs6GxHXNAvrBvZ8v6iSSB4zYypj+q/AedfSTuKw5Z0b/YNHaP4wkprpkwX?=
 =?us-ascii?Q?TgIhZTx53giO36X7sqWg1DJ5+wTGayKv1nAqo2tTup36gjHBi2v8rZTfwI34?=
 =?us-ascii?Q?pgiIgKE9rXNKJWJSEIy0lWh1lUqenkW33JgNlJ2GALMJYUSJq2BmgWklCuuK?=
 =?us-ascii?Q?EmuLmHEA9XvADv8QhXFCowZ0SetEw157yxX7wdQpKLfntq6FIB/bKKd9hh41?=
 =?us-ascii?Q?OqUmdWdE4+mH5SUHc98796ijlfEVbDPpdsOMVibrVQSmbW0OLOBBJ/2W78dM?=
 =?us-ascii?Q?eWdUqV8d3Hl/pg9T5MH2RNf99W52mwmQiA5Qzzowru6y1p6pcj7pwo6MWNLa?=
 =?us-ascii?Q?eG+D33kXV2SMVMy1YQrkbVzpEAmegsOi3QS7M2bRhtKEzxHrUk9PyK4xBAHK?=
 =?us-ascii?Q?eg5OuFWSmatpHMoAxt5Z44feL/GJyEnIEuOIWt4PG2hQ26url10YKx7IVgLt?=
 =?us-ascii?Q?rytifGI/8YQQPpynfteyRhaJjCdY7BY8v1hyYv0X1vUOpmRU+rc5T8xv3Q0B?=
 =?us-ascii?Q?OyfrdJjUmXeM7ORCBDZyH2GhiowM6VoVjWhSTnUnih+Naj0mV2EGLSigYek0?=
 =?us-ascii?Q?ByNwdlxCsMO+XoC7Z2fNxtSorYNlOvmdELU4F8sF0RY114uvjajcaEY2vAnH?=
 =?us-ascii?Q?tVBONdJUYDK8PZlo7NWii5yz+AgP4Q9iMsB+6A+Nn4UqOYUj3KC0yOtGKfdr?=
 =?us-ascii?Q?6srFlRQCbXb7W2dkm2vrcD+66qC0u5Mmd4YtQHP9xCodsnJ09eklake9GUVw?=
 =?us-ascii?Q?d6gRgFInUJqzpaGzNArRCyjpsu33wxLqrCKu6+AM93O3+Hn33hMrwmfjEYla?=
 =?us-ascii?Q?k0/lhDMfp5U7xTELd/3crrvHLkLmy6neF909C+9iL7ysX2Dsh2gJB4Gtj1ol?=
 =?us-ascii?Q?IIDCVDsENGxYap5y9MskXazGP7TZH0GJT1WFztKSjzWMSK5OqDzVPv5DNCgB?=
 =?us-ascii?Q?72ub8NftBAwhPZAk+E9bA0+WuwWYN0YUf6pbCv00dvjBnpJ0oJTgMzJxEjvt?=
 =?us-ascii?Q?70rEd4OfihxedmPULIHbDARrHgTWSC94r1KTz7lh4nRn9PRAUqlhWyuH6/8E?=
 =?us-ascii?Q?a5HtD9zl7CWO82Gt1Mr0U8xuzBfb8veWtWwC0eun8QKRVu7ww+RaK3UFrvvS?=
 =?us-ascii?Q?0q9MbFzO02wdIpExEoDQMyBsaYmPDBVkXOJynJ2j1eguCHDqxsT95F7zz1Fy?=
 =?us-ascii?Q?JlqlSJ3ToHPTkjliMjl9J/mOyscChOQdU+kiWXG/ax8xPq9lenOhfEPf8GSj?=
 =?us-ascii?Q?m7O5t1MZ8Jxq3Z9LZWt1DexH9gb2AUEH7ZWkU/rau3YJeowof4eflDtO4z5s?=
 =?us-ascii?Q?uxDQmXEsNJNxko/ZFR9qp4zm2Ew6LcnJGwGeMer7EJ6obp4IET6iXPI5NLSJ?=
 =?us-ascii?Q?StgWUypX+gq6n3ZDFfS8KwDGvFN6jVRTtIoJrwmxh7eoIGPjef2S7dinK4WT?=
 =?us-ascii?Q?O5IZEE1yP2bt92mnTEOUGwY3kp+dn1/GysEAMqySnJZM1d/jHkgcQMZEEN7u?=
 =?us-ascii?Q?7ODPNU0A4Odj7+l7P8NIJDSarkGqGjV0bSqRbHrZIMDFhPcPyAZN7Z0Zk6Mi?=
 =?us-ascii?Q?P3otztSHGjAvZGdHt48=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d47199-cdcd-4051-9605-08dd441edf76
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 06:49:14.4842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJuaCC9ZA153lYGu/x7SUjDsticJcEJ5DhUo9xLiVWxzLH8hU7nQ90M5XX9KxHew3pH7bAd6XfaghFzWbI5RFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Friday, January 31, 2025 5:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Sharma, Swati2 <swati2.sharma@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: Add DRRS verification in sea=
mless
> RR test
>=20
> Add a check to see if DRRS has switched to a lower refresh rate when the
> display is idle.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 43 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index fac7cb4f7..731f0c77a
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -707,6 +707,12 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>  	vtest_ns_t vtest_ns;
>  	uint64_t rate[] =3D {0};
>  	bool vrr =3D !!(flags & TEST_SEAMLESS_VRR);
> +	uint64_t last_vb_event_us, vb_event_us;
> +	uint64_t diff_us[5];
> +	uint64_t result_us, min_rate_us;
> +	uint64_t threshold =3D 1000;
> +	bool drrs_flag;
> +	int i;
>=20
>  	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" :
> "OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -717,6 +723,7 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>  	if (vrr)
>  		set_vrr_on_pipe(data, pipe, false, true);
>  	else {
> +		set_vrr_on_pipe(data, pipe, false, false);
>  		/*
>  		 * Sink with DRRS and VRR can be in downclock mode.
>  		 * so switch to High clock mode as test preparation @@ -
> 749,12 +756,36 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint3
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D 0);
>=20
> -	rate[0] =3D vtest_ns.rate_ns;
> -	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(vrr ? (result > 75) : (result < 10),
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> -		     ((data->range.max + data->range.min) / 2), rate[0],
> -		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
We have the handling already done=20

if (vrr)
                set_vrr_on_pipe(data, pipe, false, true);
        else {
                /*
                 * Sink with DRRS and VRR can be in downclock mode.
                 * so switch to High clock mode as test preparation
                 */
                igt_output_override_mode(output, &data->switch_modes[HIGH_R=
R_MODE]);
                igt_assert(igt_display_try_commit_atomic(&data->display, DR=
M_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
        }

Shouldn't this already handle the DRRS case ??=20
If not, I think we should add the handling part here. Correct if I am wrong=
.=20

Thanks=20
Jeevan B=20
> +	if (vrr) {
> +		rate[0] =3D vtest_ns.rate_ns;
> +		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> +		igt_assert_f(vrr ? (result > 75) : (result < 10),
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> +			     ((data->range.max + data->range.min) / 2), rate[0],
> +			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded",
> result);
> +	} else {
> +		min_rate_us =3D (vtest_ns.min/1000);
> +
> +		sleep(5);
> +
> +		last_vb_event_us =3D vb_event_us =3D wait_for_vblank(data,
> pipe);
> +
> +		for (i =3D 0; i < 5; i++) {
> +			vb_event_us =3D wait_for_vblank(data, pipe);
> +			diff_us[i] =3D vb_event_us - last_vb_event_us;
> +			last_vb_event_us =3D vb_event_us;
> +		}
> +
> +		for (i =3D 0; i < 5; i++)
> +			result_us +=3D diff_us[i];
> +
> +		result_us =3D (result_us/5);
> +
> +		drrs_flag =3D (llabs((long long)(result_us - min_rate_us)) <=3D
> +threshold);
> +
> +		igt_assert_f(drrs_flag, "DRRS not switch to lower RR\n");
> +		igt_info("DRRS switch to lower RR\n");
> +	}
>  }
>=20
>  static void
> --
> 2.25.1

