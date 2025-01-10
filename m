Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B7E7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 03:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB2B10E4BD;
	Fri, 10 Jan 2025 03:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyKmZ2s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353AB10E4BD
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736479089; x=1768015089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/mJ6p8Kx2pGtkQxcYrw4dUYmN5/sMi0W52teIX2mr7o=;
 b=HyKmZ2s99vQw27bsCic3SwCGGwRsbylC/pqOySemMOOGhdj3JBfaSdsa
 BKSgE4ZYpKBx0U5RaUPbS3s9BYzogfLJiBnEFurg/yX6Yij+RGzfJaSE9
 MD2tI2eVwDs9v7OJGkfkCLJNtGGARUoGzQUfSpfeveKO+ejhqN+jOQCSg
 DNmYHEELVWCagc/X+bazTABEfaF9+tr4WEBHXnx/MZ8qW4LmwYcNiQ2cB
 ME/7XQIZ9QwF8cP4rSnTxjVTR0tR75V/z+c+MzcaIZegG4EleH5N6eImx
 PrR/SNhOY6pig/Ce5479vS7XMNKhPxqzMAK7e4taomqk9lX4TPOiv+3Xy g==;
X-CSE-ConnectionGUID: slTw88DzSUWJ4kI0TovdnQ==
X-CSE-MsgGUID: Q/2Ov++HSxeN0NyD4O6lRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39585600"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="39585600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 19:18:04 -0800
X-CSE-ConnectionGUID: pXrjhpK6ThGvSUcQSP/l5A==
X-CSE-MsgGUID: GRg6tdm9Tkq6NumIZkbZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103401529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 19:18:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 19:18:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 19:18:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 19:18:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXJi8ByYjlutApWNnYUTIVH25Vh14fjPZtmy9luFbIoipD1OEqEJG5TaLfxiWMs05GPlabnKKxIjyQwLpgNZbN3bTbsmiMazbs2IhPaPwZmlTm6S+yRYN4j4GI9QOuOR9MU/hqdAnjk+lA3RItPk6pVljrn4gzpk4vdBq8R6xxZvp8S/wpj406m+ORE2EcLDP0n+QmqDBM+VKITS7rT8LkgQPhJuKau46HA+ifKzkSfJ7xBmqaaTzTL9fXaoYwJ4d4Zz4ynC46d4EH9mKps8zzD3lOSwvYc54KEr3dRzYm1EQWUNXNA3tO0S99vgJxi6mJGluflm5giugwcz1WdkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2cqAWuZRZ36CjhjkE298sYVU3h/vW6RPbQBUvVAALg=;
 b=AtsBsUR6Pz+m64qEzfidmLEPAHDS5Gx2sItFXeh2Kxaip3Mudkvj2paGZS/gyxm7UnVHpj29lLGfvhbxdcktC2L4+DpElaza4VA7l02lo+soran0qkldCGrsyXQoHZaE7uVNWFMezr82XpEYslJrju8J77F2wy/X4Pr7baW44SqhzR0k3C/KU63q+57P9mMB5WnLjpU7HBW4jlAms/Jzeb3XplMfCxwtORbqvvYIq3xYCuydQJxAr98kSbzPZp6zbzSo9eh7HHb5oLRUUfwl0hYeD0zlwWwjj66SzgWDd9Og67uBbQdQ7d7/BlkAg6T1gEe2xaEUqSw5hNdGgXbbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.12; Fri, 10 Jan 2025 03:18:01 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 03:18:01 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debug
 loglevel dynamically
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
 debug loglevel dynamically
Thread-Index: AQHbYrhQGQYg0n/dG0mLmEH1pnIB4bMPVtag
Date: Fri, 10 Jan 2025 03:18:01 +0000
Message-ID: <DM4PR11MB63124D300E68A76F0EDD419B901C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250109170729.47646-1-pranay.samala@intel.com>
In-Reply-To: <20250109170729.47646-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA2PR11MB4843:EE_
x-ms-office365-filtering-correlation-id: d699f6d3-7447-42d3-3fe8-08dd312563ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dvCIxbk3u75u82zZz3wfluQXI0lGuXaE6Zy2mCAX9Nt2tv/vqxnU/qeU/nD1?=
 =?us-ascii?Q?FNjSIp4kqmKNf5q/TInR5rfm9n8tT9SMzitrZNJRqQ8EmmntXD1Qckg+iMXV?=
 =?us-ascii?Q?wFL+FNLq9T7WiF3z3bY8qsPpA7cSaCismgYjUhyJNt7DXFM6Pm2RWUGdND8+?=
 =?us-ascii?Q?GmQgNKc3IkbJjqVurXNmSKUT1GWIPlQXXMiB8CN8axiNrMKyqc59VbWiRhik?=
 =?us-ascii?Q?BWwd9Eg8MmJ7/5uwvvE7qCkXl7E1ippo4xdbkBHCpvLPryD1SnXiME+sR61p?=
 =?us-ascii?Q?qC3xlGSfgtwOlDLhxTOe8V0HRZnCkQa7ECDounQUA2kqQ+uLfdSWVSOjpgEj?=
 =?us-ascii?Q?xOaXb5HnpTbi5hKYmwaWI/zVGBhy7nbLEfJ99Pvtxb8PXp3MIffc+Ywsym5+?=
 =?us-ascii?Q?BpGaqS0tp5qGBn717QzsWs3Ot4CJ5ss08956r7r8dn8roEoj3Uiy5OmkIQpl?=
 =?us-ascii?Q?f/Rzc0rJjtFRp2eA8vjQi3wD2bjAnJI1rwWq+5dcGgcTd3t4NCBP+6G88Qf+?=
 =?us-ascii?Q?i1aoRj2CkTt3Gu9wqhDOJobuzMBHrf9vU1aZsiWBNW00FcqoCEnOXgc0Imm1?=
 =?us-ascii?Q?PqlSpjgdDC6FZAAZ22SFUaSHg82vOyrBXwDVgAGZ79HNpRYcchPaZagDTEqh?=
 =?us-ascii?Q?bXTRD5Q+seWs5sKuG2lGC77T99eJFlfVd8diA18+okGntLjBVbE/zMmlmtV4?=
 =?us-ascii?Q?6mYeZG77tIJUq6CoVFkcifBGTEH4/DJuTkLwWk3EdCu+D8tQlOEVFSIK7t2Z?=
 =?us-ascii?Q?a+TCF2tPKsW9lj6mo1J/BkUMsz6uwwIBHynkvCKb3+/7UiehiIHBgSf+X/TY?=
 =?us-ascii?Q?bz0WlQO7rDGN2z9t1M2CP2I5CkRFCt8y8OzrBgDXCGEF2wAqSxt05pOC9LOp?=
 =?us-ascii?Q?pDYG2zUxm0qWhU2V0PKu25tgjhBiw4gbA3nCbaL2h5WcUcf+J1+EZYSYSV1v?=
 =?us-ascii?Q?ffQq6eBXxp5WGRchfjqdWIoYzQEdMz+jBfnSGUh6ribYaG0xGxs/SSxHQy9k?=
 =?us-ascii?Q?LPEyLtwam0rjv/txJbP6hsWVCgdLBVQqzWzyV9iATiUFG0ByEluGibUXFSIl?=
 =?us-ascii?Q?lRORXiUuZzj28A8IJXQeKXYRp/jlU5p8C+pwFlI6LLske7ZTTbHa8ssXBe9F?=
 =?us-ascii?Q?RYtjgO45TSGzd5X9mLLL22obiLnUfOp2hLdShBdFKW1QpHJIpAMl15fD0kIP?=
 =?us-ascii?Q?+rrWwiY+xS/kEfPmLc4ucOAyf/vHZxHc20Sb43DKsmrSHZHRnI+LB5yROTvx?=
 =?us-ascii?Q?Fo1dgYNAAXaCmxTtR0Ofxk5fGjwa/0f38o1U4eVuBd1dNCKXyxrBKcsaSRc9?=
 =?us-ascii?Q?u8QplX0FlRjQcL9i3ZesgRHULRKzjG1+1fOrn6ealYI0xyWsM/YRFng+INPq?=
 =?us-ascii?Q?AWLgsQh0Lnl+r1J2UeF3CeFepV/PA08V/OKUXctdNlkwzYIO6f2q1BmIw4a2?=
 =?us-ascii?Q?wyoeX8tRljeb9JS5WUmQvSLt2doMzdmI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4piRZziibJZrkVef/c9l1Ue1qOUSvsuTMNAbgthXH+UV9dAwJ7CLpptJRuhe?=
 =?us-ascii?Q?sQwGbk8qObg1BzuBfIIKqoyFntDDSDxZgeaBzm2+K6JLYOKDF4imJlowAH0B?=
 =?us-ascii?Q?clZWy548c6BLYVqtj2LdkhDliSAhbompCX1BatC9Zsif8feKeZQlsFIjZ9B4?=
 =?us-ascii?Q?myB+yGSkvTtqc45bI3hyyknj1A1EKlVjftncnT9KfCHdZgRG3q3V0j+9DcbI?=
 =?us-ascii?Q?y+NUVGpRBEqS+hRWwd3voCXUsO9dl8TsYLVBOeWO2pQ5K8FUrr5Yd6MOYF9d?=
 =?us-ascii?Q?NWUk0UuWCnmbarBn1+cMjIScRWtwZNXe35nkrwj5eCf/+ptm30pJrfp0JKiQ?=
 =?us-ascii?Q?QQWraJcrJ6q+RpduYH1lc44ZXzthY8rwJyU8MQ5ZoGTgW7KJhFE6s5vYfOQ4?=
 =?us-ascii?Q?/FPsWYRhiTkEz5T+0XOfyK9dPsrGvoDlWWH2LfB/5+NDU2XALSaQMEMjmk8/?=
 =?us-ascii?Q?cRyJfKwSx++j9oFXTzZ/7mx3T8Vq9oygDXuo4hyDuBkIIyfJXuDy0hMYb2RV?=
 =?us-ascii?Q?N/SN7MKQZ2t6gx4s+Ac4bORBHlR/V+9lB+t/9wPlUMgETD798A/AeEqqSP5Z?=
 =?us-ascii?Q?QRkTnhop1j/ygbcu5T3EHBACcoj/nc21+fsK5lh9SDcw5nJqUQ1dP5qMgt3N?=
 =?us-ascii?Q?P5pLk6F2ekXQb1b4MgbZ/9WZFjnOV4w9iM+zQj0NkzORIinv3sEXuI28wjp+?=
 =?us-ascii?Q?PJYI5lV1o2PH8mAaDonzwaDBwEYVNCqAHg5lkH2nTl/ScsoWuuZjiYmOXQsJ?=
 =?us-ascii?Q?elM8QvNUaMDb3NCzSsU4uqJTbFfZAJzI+ncU5dBtQQG4YkqZ8Q8HEM/TtoPb?=
 =?us-ascii?Q?DuNwbCXPQvrKDyEnHZQslg88XYcDKofNlvGR//dtjn546O/FP5fwu/Nt0nHE?=
 =?us-ascii?Q?1sc2ZQRLJs3X0XEXtpulxNUgZZatsXeI+/XJWf1qOsHBHaAnZn1zssAfWTlu?=
 =?us-ascii?Q?iD0FGZklc7yERvSlXjdg7ZVOYJmXZ1jAjR0VPx0YL4txEVK0gBlSt6CLRub3?=
 =?us-ascii?Q?+viel1RwuktzeOvPtcGGTRkgfb4IVyrl1YUHgMk+LVb4xF8FTPTFI7mpOXnQ?=
 =?us-ascii?Q?PG2WqRyCVYYg4mNzrsTk2vOzfiN62y2ERk4hQqT4gIuLi7spT1NlqcakXedf?=
 =?us-ascii?Q?q00BakjgEYGTabhWR2ijCZRBnNa8O6JZOlWkjFIk2OaQaM/gx2ugcY1q81dZ?=
 =?us-ascii?Q?AwR9LTxOiR0ZViqkyOTO5CAoSrvoUDFMrnAf1ifX32WWZThs5mJzWvl2i+if?=
 =?us-ascii?Q?ibrhYMAOAGmBljU4gY10p2PdxsNe0TqByB6DGe4DgzcirWmcBbNvxxg/nx81?=
 =?us-ascii?Q?DhNDjnYuOXNhX2iLS0zeKT9HqusrYQ1tLCBFvKl6XDROw9sddbSg3sACIYe9?=
 =?us-ascii?Q?z+2e+E32M3d0nva5cPRUz/MRFwiQylz0HW6KgD8hvwPsbwsuPLdy+f9KZOjb?=
 =?us-ascii?Q?p2s+RCUN2DGtxGTFUqCtNHQCbWXEteafJHHB6A8RWNReHoKJ4lDmVZC30DIs?=
 =?us-ascii?Q?hdlfnOw8ipZgvnvVmrwIjZrWacIKvXM4X/LQsiubyXPtPfG9LpXSalgCrnGB?=
 =?us-ascii?Q?96SbRTNCZ5TU9ynvJog=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d699f6d3-7447-42d3-3fe8-08dd312563ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 03:18:01.3086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76vq0zAnT7Lry9Gexxx7g4cmYREklU5iZ0e4Op6tCxbUsqScio1aLiMm4F6ohVlCu6aPP/n5k3o/Hlh5Hort2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
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

Why are we reducing the log level, Please mention if we are fixing somethin=
g with this ??=20
Else we cannot do this.=20

Thanks=20
Jeevan b=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Thursday, January 9, 2025 10:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debu=
g
> loglevel dynamically
>=20
> This test is getting incomplete on CI environment because its logging to =
many
> logs.
>=20
> So dynamically reducing the debug log level to 10.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..415005774 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -14,7 +14,7 @@
>   */
>=20
>  #include <sys/types.h>
> -
> +#include "igt_sysfs.h"
>  #include "igt.h"
>=20
>  /**
> @@ -391,6 +391,7 @@ igt_main
>  	data_t data =3D {};
>=20
>  	igt_fixture {
> +		int dir, current_log_level;
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
>  						     DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
> @@ -398,6 +399,14 @@ igt_main
>  		igt_display_require_output(&data.display);
>  		for_each_pipe(&data.display, data.pipe)
>  			data.n_pipes++;
> +		dir =3D igt_sysfs_drm_module_params_open();
> +		if (dir >=3D 0) {
> +			current_log_level =3D igt_drm_debug_level_get(dir);
> +			close(dir);
> +
> +			if (current_log_level > 10)
> +				igt_drm_debug_level_update(10);
> +		}
>  	}
>=20
>  	igt_subtest("dp-fallback") {
> --
> 2.34.1

