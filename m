Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957BDE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544FC10E043;
	Wed, 18 Dec 2024 22:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7bRTTng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595E410E346
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559575; x=1766095575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pMFqwIJcZ2On591J2fVJLj4pe4mUgQhhWm7k4IMiCak=;
 b=T7bRTTngSlYhp7qFR6H3WgfVhDWAJUg2JLsOkt1msPjKd+jlcTuDEf+1
 H841eXp4/2yJ2BLxO1dU2NDpqi8GfhrARrQ8kpLko62iVdAPAXvLgy6R+
 DWl60n3u3YxMySg22FY+cUuIhpTNI48K1OAaoJEQVJinbqv3oabUXUnBn
 dB31zn5o6jHqyY5qMSFRl7TbTTCmnP8DaLAwl6nxojrxnGpEIOlvaPU7a
 zc/gAt825WepU0aZ8++vsD6EKS4l+YKja+TxpLTIxdI3nAVN6xAwFJwmz
 rxOpfCuyrcpW+1xqp9CDaiJPxEZaBC71+JiZjLRonsctgGouBAtlut+tC w==;
X-CSE-ConnectionGUID: p7Kh96D7RliXwsokImCDJQ==
X-CSE-MsgGUID: DZ9Hcn5ZSIKQWX9no/7aUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60438646"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="60438646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:06:15 -0800
X-CSE-ConnectionGUID: FOUIfVCBRjS2wgI4UrO1rQ==
X-CSE-MsgGUID: 3e4FdkuVQTaARc+8Rdb7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121253066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:06:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:06:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:06:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhgVQSmZ45ealJK8k/dvRqQSL5ibgfgxijlnVnrMYK2ZLq4rv7ddUoSEHHgL7eflvB9WB5xbn2yI9h2n8lWA0rsL/ISVp23iDsMbcz7e5sOQsk25K9Qp75e6Mw1+FuqH4Gu57wRrEwGlGRn504c6lumIrQVqVpcVX+IDyYDqxjoGff1fb+GSZTXwBMOcK1EGZTygG1cRKVFntjt3Gw2/qczvAe4mqAUmUaTxtyWBiVJq/XGJeWikgYCNI2blbgXh6oepz8EY8otyZihT366/BIveN+y0iB1smpT8HPzEKZy1zY4TibmCR9fB1PK0ZzytnnTXFuooJGlg/59lo3MCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAZxceXRB9nF4ezt6GOkuz50Y8z4xOwk1GTeBl31oco=;
 b=Exhorxer3wXLe0CcGw+VbX1Srsq3L+8NQj9uaaIuPAmnBSu4goU69Kqfq9BGBspQO4kgzj4QRLSoC7YqkgRmGDLRepJUzfTv5ZhtmiXeOMFO1XKYCSjxVvIsTjXkNfbXLGwUUqZkcaIKBSQIDdaHU92ERoQCZMHGs/CZsV+lcr8Yl2NMXle6Kc+NvDWYMze/6d1VijZBbc2fxhfAe6AWOqquLKonknK7WCvztka89mNxITJL5uOJSd782UkCIRBAWjmy5XjFYY4q5AGf71SChS82Hkm4z0ZYuPJBbdX4auk4kFtB9GUB9cEq9MZxxsMhUNqZcuk3PoENtESMJAgGvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 22:05:44 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:05:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 6/7] tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Thread-Topic: [PATCH i-g-t v5 6/7] tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Thread-Index: AQHbUZUEsbdjFTiYakOg3+CMOIrUzLLsi09Q
Date: Wed, 18 Dec 2024 22:05:44 +0000
Message-ID: <CH0PR11MB544455E20E54DE1D979ADFAFE5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-7-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-7-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6267:EE_
x-ms-office365-filtering-correlation-id: 0cd02e86-bda3-472e-d4ed-08dd1fb01ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?he1t21QzjkVuHvzzN5CLVN1umDywK4bbJGu2Tyn7Je88+D0sTNeMDe9HujO7?=
 =?us-ascii?Q?veA6kR4aDU7L1D/Bb+3yfFvJrBASaAhKjnl0uLaMwdFvWd9peJPDaIzH8RI1?=
 =?us-ascii?Q?cY8oQCpTm61ElRuO7g01cbvMTOWPlglx+S39EqdOQq2coRqAy58U6ueG+80h?=
 =?us-ascii?Q?0ERrlwUdyn/ip/ecjS+fBZ67mhvYMBROjgiwyTbNg0UDqR3d6FEP3iSmxZq1?=
 =?us-ascii?Q?FnsVOWybnu87L1g9k1vxtVbZ6OHaloAtzaHiN3E/I1966n25ry0gVbH3WyPH?=
 =?us-ascii?Q?wNR/aZ/+kBEs3vre1jr0sfcZMg4o9/KrVnrXPuwS/oqhQSVEHf/1o1pN8KNO?=
 =?us-ascii?Q?xt2EEn2HGmGx4qZQRElRNeTUtG6PQzVouqWOhZEa7rlgvnnZj1I2E31y4Ias?=
 =?us-ascii?Q?2+Hw2ufJckVQC+TkVOuoXCsyHL7rkDEWyNrZfZdF1r2qU949fJaN3A3nUk6x?=
 =?us-ascii?Q?H4+Yi9gdAkY8bushOKe7binbCyCpfZrd12KyNBjfvLFslCzNNf8AHIyrVGDf?=
 =?us-ascii?Q?uUM1+E5oHOXw7+QzfTg36r0rQ6QQMdBD+X7G37GZwXW4WuYZXXLf75JfUFkH?=
 =?us-ascii?Q?Xo3QkhWTdoYnUiBK3XWsMKo23GnrZQTmNeDRl7s3FgNtnJU0iV4Nd1m6yzRB?=
 =?us-ascii?Q?iVWr/IRiIkVG6yf+jXBx52z2drE6OussSGqaGxIWseLaIbg8aLb7fL5/0NaH?=
 =?us-ascii?Q?P5cF5nGX/3dzLAHV2DW6rTvUeRGUSDF09PAr/XxMURCZ9PQ/i23IZGgKXiLn?=
 =?us-ascii?Q?BuJmNi8blMi2GmDNMeqG1U8blzj8VP+pNeHGT7uK3Ek3e/OAJL95GUOOiPbE?=
 =?us-ascii?Q?fUMbPLHgrS2Ut+LncC2IEq0AJdyYBlFcTo/LhFY7Dx8ZG0zZhQahI8RyyciH?=
 =?us-ascii?Q?0O9omYaVWtPe3WTBFRUuhJi4FmxwQ+3UjDSYMwefJB+5qceb1wV5RV15oz36?=
 =?us-ascii?Q?k5pi8ATkUwWzCGdKz1lf2u0dj91Xql0yPlZRcz4YjJNSzTScLvLXl89sMyv+?=
 =?us-ascii?Q?3891Fxr7e3QCZOyjyiBhCHuNv3EcyeS/X0pvzRU6N289KAyGg3UZofbr1sVd?=
 =?us-ascii?Q?9WlzS33RFeZ/VY3jy1XlqquBQTegwUHy4GcNpfHV/iKWtSeDt5y1EJDACLke?=
 =?us-ascii?Q?2+idgoBPwmCH7RVZ1klsRn97AfR8nX6VnEk3rP4lZTr+GQ97Q8wNrqgb8g1f?=
 =?us-ascii?Q?3a1qOY7MO1M6HvMjahSK560C5cBScjAtQfa2K5yP2GFN68EAKzpkEMo4MPIY?=
 =?us-ascii?Q?4xuMl9y2QcUm5MmRr2Vzf7MJG3fgqraB+JuH7lzcuhDxRr1SOHH3CHEg8dds?=
 =?us-ascii?Q?QgkmBuRHIqLs91M1l+7UqRIgfKKla3zJTn2gplr/mddMh2ffkJlx3g57YV0F?=
 =?us-ascii?Q?upi4xeLYMoJ1SMFL30gVHygOvyZu2OLpEjhHAXRqnp8EyrQsq35uTZn555+y?=
 =?us-ascii?Q?Ky8YD29mkp+XFdO41ecLaZId7AeckuLW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?281lB9zrYpurbRY9QwwOAMrbF8ff9zq2IcqHKTrt1YqS3Fj+mof9vdGhqTKY?=
 =?us-ascii?Q?op1TfIBctXSd0IBk3R8F1Py6CUOgmqRf+buciFwVU6Ci8g36T1EXmanUXxUb?=
 =?us-ascii?Q?peg7AE7FoshBQOmcl1rB9fbm/FxDmIMjtMfNVIgL5GV5wbnI/UPO/UDRNIRp?=
 =?us-ascii?Q?OQ/qpK5QHF5oOb1rKJgACBuekk7Td9bRhHb/X/BmNOpZb86AqM1W2n2dFauw?=
 =?us-ascii?Q?uvvB8miI7NktZezlR5e5NRE3GZ7oL2/eGFxaZbgQSGMyxUjRMT8G9FSK+v81?=
 =?us-ascii?Q?Sp0eIsGYt6b9hIV5rNV2ZVVACjvDQ53x8FdaSTMT6S6KQC+1h+403jayzdoc?=
 =?us-ascii?Q?nsa+IADP8wbljJIpS/L3mO+ce52iAbyz7AK+XTyJfGU2xCdzAOJ7Ds1bud91?=
 =?us-ascii?Q?L7N3PjZACXGo5Az32sXsCAlyZlHxMm61/YKFctSKpIiamUzJdKjMQw8CB09c?=
 =?us-ascii?Q?ZpAeOFwEwhQ9pxuN4zY5Pivws5IFT68SVMBV9xhuv03hVcEXy8qa1T1OALzd?=
 =?us-ascii?Q?FeVb9Wxi3/1PxawLlO97KihZlCp5HxPYAlXgLEXCFZ40Q1M3NiHAzPuPz19x?=
 =?us-ascii?Q?Pzx3AmeQUWCPBuqCjfOp5UDNo0mx5fFpHJbjdN9SmizoDrTcsmsR/Wq+MkBS?=
 =?us-ascii?Q?sZJa/stW6F+Y1IdINrmJXvMhm7x3qVBa5p/CzeGlpgH6TGnYiCCd/uXd7IuC?=
 =?us-ascii?Q?39d3fkYdDR0PmbwsXjxwMWoZNI+sOWGZujisvJ+dWry1scmplhaznVK9mlQe?=
 =?us-ascii?Q?S7TLfV18gKhzMX06DDolumrfBawlBBikjqV2K/WlsC63UJ1YBWDTP7QcYF3h?=
 =?us-ascii?Q?KoHrsWPMvI7BlKKt/bFP6SRNOUH0Ydm80UcJh4Ghl3VZ4m7U8g8fW/ZspJBK?=
 =?us-ascii?Q?p3D4rN7sq8ZCn3Ivbx717yYV9iSpTMII7Jq/4HMqArOkoot1hV39UmFuCFgj?=
 =?us-ascii?Q?cZ5UOeGteshL1kOMMS4JZBAcyPQhONfKVVgW5R7yiAx8n8Y34FxdOSgUIqm1?=
 =?us-ascii?Q?+RlVCLH3NJultWSyaVIg4TIg8y3agvNEDQqbzIlHeLe1NqQfUN/kGSRV8oJ8?=
 =?us-ascii?Q?g1kXzqICbk4+ZlhTdzDOynjmetJ+cjHiiWjqg7L7om+evJo2lZUm0FNU1OuP?=
 =?us-ascii?Q?mIPVMKaXHuUZrFm1ThDiiKA0m0CDg/glqhWY+KbbMkZnFuLY6e5ejlsxTsOI?=
 =?us-ascii?Q?5BaV9Q92doiZf45QOtO9kRcucdzlyJqvIGW7k8AtDS/qPQPOHxIYcE6qMqJb?=
 =?us-ascii?Q?74E5cYbZoZVBEWRl0F2v3jypsZQRWFuDeYXRRtuH6SgJ1UG+9xeLQh3yQu3j?=
 =?us-ascii?Q?838Ji9TFgHXchg/O4uSh6VzNAG4STeCqEBHhjjCFo6PcO+aLzRQ+hb9eFnJ6?=
 =?us-ascii?Q?bHbXdSoX4Y8Bd4Zs5/YRgTBZyK7w01CG8YrfWNp/J40vb9AqVcOLHQrbGkKb?=
 =?us-ascii?Q?lbVBwXmWHRbBetX1NI/sRrQllIMS0XOLeJ6W4Tl8+Yddx+L21CLEjLQ2Fjbk?=
 =?us-ascii?Q?gaeu4v3cj9liwsvuUAeqZu9IWxyVKtTvJldnV/u99zeTFf1hj6zT+wvzUqYW?=
 =?us-ascii?Q?jnfTriC5f+lzEEhKrYBQIveUp1HRgsnBVtTiD0ILOJUSWtYfUpGfmFBN95rs?=
 =?us-ascii?Q?Nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd02e86-bda3-472e-d4ed-08dd1fb01ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:05:44.4765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3pDM3nuObVzv40rfybXELhSFBEeV2LFb69XUzj+Jzj4gq9p3l01xlhpywmObnNBBi80RjfPXQUp+MxWR+awjjPiamAnGOYxhPVF55u2wEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 6/7] tests/kms_cursor_legacy: flip_vs_cursor_busy_=
crc was requiring any driver but used intel x-tile
>=20
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>=20
> switch flip_vs_cursor_busy_crc to use linear framebuffer instead of x-til=
e. Xe3 not longer supports x-tiled modifier.
>=20
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 4e2cfde17..1f082df2d 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1679,7 +1679,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *=
display, bool atomic)
>  	set_fb_on_crtc(display, pipe, output, &fb_info[0]);
>  	plane_primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[=
0].height,
> -				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_in=
fo[1]);
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info=
[1]);

TBH, I don't know if we want to unconditionally switch over from using I915=
_FORMAT_MOD_X_TILED
to using DRM_FORMAT_MOD_LINEAR.  We may want to continue testing the former=
 for legacy support
purposes, if for no other reason.  Though I'm also not particularly familia=
r with the KMS system, so
perhaps there's little reason for us to continue testing the old format?

I'll leave that to your discretion.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> =20
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>  			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> --=20
> 2.25.1
>=20
>=20
