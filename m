Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F58C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D3A10E522;
	Tue, 25 Mar 2025 09:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiTKz3qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A210E524
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893563; x=1774429563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mYiYKD3iJixA/Xj8IYCuOT1ioWY/gFp3FghKZ4uH0TI=;
 b=ZiTKz3qmVtp3cRYjpVtNEwGMoQbjThLYZD5XiQB/eR1v1wrmKnwu+qTr
 gL/U9ChWeJ33kLwnG7zK4oahy0ewtdDkZIBLRGknCZwVwc7xmXZtY3ZUS
 glWbAO12+lNp7moEIV8nW8HelA4nNoXpeJhfpinuHXdEKn/qLQmDDkoKz
 fWNPiQgNwaGy6CiKwZMIXGGOLtW5LAUaTNoMkjSrLOYPhfK9RI91iI1cU
 DO6/+UM7umxVNaFVJf/fRk9rgWli2d7zGR250vRwPrGlw/FwbejXPbsLW
 1SGlGbwVt/KHenypIEhgeY3Xww05cEDwtWVR2fkndQKC3UooxZ3YZiD+u A==;
X-CSE-ConnectionGUID: qcileZH4Sqa6bhsoOLmRNg==
X-CSE-MsgGUID: uysLpZiLQPyu47RbFsHVBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43286631"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43286631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:06:02 -0700
X-CSE-ConnectionGUID: b/IcgEpATvWJleGyCDcVzQ==
X-CSE-MsgGUID: 5IietXIERC+/pw8FT7Nlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124345944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:06:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 02:06:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:06:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:06:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDKn9RwJ9XTS1CvAuYoFgRlmGQ8dc4rLuyuDJJWzDqFdX9dd1+AyaWrxH5exQ4JGEPwXPH24raPgZGVo5V5fXecK4iV66n9gaeKWc28zWnzvbib3ODMmGJNSP5DUkHaM8sGPiLfFpvWUcWaJCABo88ta/8qYbidru7kGHRt89ul3v8m3fYCWvyuaAjWzEbZmfAQ4eIhmkpeUNrcIiUYUTARFb3BOzEUD6L0hSpr6kHpaVzBt+fHtcLxB5EJbfx6qP5GyVKQAGJPwwSrZbpQcrHwIYe+h3xHTcCn/x2ygMp+aYZgRE0y0FLpKEPhnhHccB+5Sx32SzAR4YPfZKCbVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOjvxHZ/mG2q5bom/iiktrIyTjNzMMscIx4PpbfL+WM=;
 b=M+/7PyrDl5AQZY3FDbVGaJMM5s+je3wnA041RS8kwu0msFS1THD13RI/OR8TaUtk4UyO90wmAOU34tQXHmWfl5ZbHvla9J+EN8U6LYyc7jPpA/+ciVBiN/8YWozO1O8Cl79GT9WmBZPrKO7DvXbuMAQxW3zdKqzz17stisj15VVcRB3oTWtTQ4+MB4ikt+0ko0wtoJdwQBrEZgLx/+uGcgIw19Q0Ao16c40JH507Q9a/7pu0HcNyE3RpOPbNcCs45LIKAW/9Xc+sknqWgzlbjoLRguSCvLx616F31o4kVaGGEqsBt8415CPbQwgrd5dUXGg9SxNXW8kVOvPzLggN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:05:59 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:05:59 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v6 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Topic: [PATCH i-g-t v6 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
Thread-Index: AQHbmJCVdiqtP1rVvkmQ/2oJPVfwFbODbc2g
Date: Tue, 25 Mar 2025 09:05:58 +0000
Message-ID: <SJ1PR11MB6129A0F44DB66160B2044C94B9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250319052905.2624650-1-santhosh.reddy.guddati@intel.com>
 <20250319052905.2624650-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250319052905.2624650-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7679:EE_
x-ms-office365-filtering-correlation-id: fec429ec-37ed-4a60-8fc5-08dd6b7c4257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D8oihp4n0cxBZq0ONQA0PMrKZ3gu1M6VWa6KVE8F7oUaF2xz1lrXGLL5aPQD?=
 =?us-ascii?Q?4QNw0cNa7yxFjb/ww0sBxxHqi6i6wLXdhcPMR19Dktl7HgIPZ02C/8IBPzH5?=
 =?us-ascii?Q?wIlb4DPsiVbpqf3QKI+bo0Hp2lIQ+3ytrbmbhvywBPCWdt2FJtwdPzZ0OF/w?=
 =?us-ascii?Q?jWJwZxAwiCnm0LV8VKnPYs5lH+wDClba0oEDRzG1vQHoZilvOVjzOmUz6CrX?=
 =?us-ascii?Q?aY20I4+T4pGz3K+uQ3lXXtStc9rWP8pSCW6P91eqIjZxjI6u3XQDq6u6UqS7?=
 =?us-ascii?Q?P/mVgvZl8Iaxckl03nOrc2c+6zxwMZ2NGp1QyuImmU3b0PgKhyj3UNlPaWSZ?=
 =?us-ascii?Q?1VBdhQASzlhnWFWssXFSkexr857Ekx9N/td7W+12K3pCwtQigZQCCQQGZ4xf?=
 =?us-ascii?Q?rQ0eXLY3TvPQylh27XbDTyA0kfRJcvnNg8y9cfI7gppu8XPTCUkDD3KJTdLT?=
 =?us-ascii?Q?DU1Zr7y+kMpOHXYAwvfBGnLbi8ZlbHXmLA5MTE2ZlOTTEgA+T6MnTyu8cgZY?=
 =?us-ascii?Q?Ucz6MIR00K/hwaVBB/vVjYrax+tawbUX2VNqodbSrI7ObPAAxbiRteCWOrF7?=
 =?us-ascii?Q?w+DnB0raZDAOEGAdHFRkDh5O/+sRTsH4wsfiYpLdArv4sQD/2t9LBtFeovex?=
 =?us-ascii?Q?UoWt5XvuPtaZKA5+jgOFvYafHsMtU5/YmS59ePtq6r0GFy/Uwy0exdj5u3te?=
 =?us-ascii?Q?7yhR8//1QWhsg/HFL9fSBRyBJDvbcn9OSJupL0h3jIXNqwYObp5wB3+8wDan?=
 =?us-ascii?Q?U/OzEnUYpwxs0ynFLDmn11nLBzLflblbYRH6BtoP00JLjI9bHn/+s8FoIAnY?=
 =?us-ascii?Q?RihQJrXHQBRZ4msvHIHq2uavg9YUqEug92ysBzbKEuNI8w9WhL/iXf3TA8Lx?=
 =?us-ascii?Q?Elg/jYbTsR0c8oy+Dg+0w+5C0Qvzs8/Lmqxx4mb4qmiO2MleOiiae73/DwZ5?=
 =?us-ascii?Q?zpsK8P00yvj78YvRkMyigu1gxd9Y8qU4X4q2M+uH50bJkf+fEB1pFoVXjpHL?=
 =?us-ascii?Q?/EQ/FdWZPMJ/pIb1OOwCh62v7/P2uBZyxLMXl6C8GbTIEvDOldVtY7T9rEc6?=
 =?us-ascii?Q?SWWivOWayQ0SAt+Y6ItaVj6KZ3rVYUpi6t5sxpGqgqPziHoSHtXLMW3QLfG7?=
 =?us-ascii?Q?SQ612Mrfkwc/RE+ZZQZHqBKsTKFHpBAwNUmg709pywo0C2NckhhAyzLutwzR?=
 =?us-ascii?Q?Ceog0jyT+NbpKfRGvipIXoYHzndu4u5ulQVk9aPO1qqyw64IC80InAZvanE7?=
 =?us-ascii?Q?yM3NCz6drpqB5WdHbhTIawogSWCWPYiNvPHv868XYXC51l7mF6ZqB2Pu1OId?=
 =?us-ascii?Q?/6fi38o+Xeho12+lqu4OqXtNXovhcrgkacxwxfzSWaLAreo0ETgmeckP/JAq?=
 =?us-ascii?Q?0f7tQIzKCiLb3IuN8RWWnWLH1/Ym+bXHw7JlOQrv6cnjy8ejRLON2Do0kf2Z?=
 =?us-ascii?Q?1f9J38ZlC+pP7zp8863j1ZWozbLxbmWG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DF/MzOoTt4lRekOzXFv24fB6O0M6Z45gN0c5unYz2eN4CszlTm/mPoLM3UDy?=
 =?us-ascii?Q?ZQ1FNS8BgRLEpmbHfcSZpXYftzmnrSX6tQU2w9JHj08IM4oo4GzPQYHVYxFq?=
 =?us-ascii?Q?mPQVQnib+qAgcuCApjqJFpCmBDDEeZ0x+F7sSdrdKPHJ5c6RqvE5WSr4RtUN?=
 =?us-ascii?Q?LKP8/DMq+1YGCK4ZcagDXCuFbbuxQm7T4hBf6bdntbwaiIP1eKp+ZEcUYvvC?=
 =?us-ascii?Q?79YSObNVLiNOR5stYBPO6OAtlnSClj7TVy4O8VeFGg+H9oPZtYzz74GO5ywn?=
 =?us-ascii?Q?nlOVpzMv9a60kZI4fIE3XONKRNlMb+XJp4n06zHLZnCDPiXeXBefUlO/GZTX?=
 =?us-ascii?Q?677F7XdcWI8D5pP+45VxcBQjAR7A7BMfCMR7aH+fyskll51Y3mM3GF5Sx78i?=
 =?us-ascii?Q?qznrtsvJy8Nny7dQux6tPVKy52hK92nGCX55pAW1DuxuPdcGsEXaVCZFH9Pe?=
 =?us-ascii?Q?lL97M1fjYalcZMlO5SQhTdUHou4jzqoYEsXyrKjdsMppvyKqBIK/F44+TJes?=
 =?us-ascii?Q?8ZwM0cH4F6xJ0KJCEQDyuuD9Zzn2X4EJl9F4BazrJMvV72rqkfgB8dT0kIlx?=
 =?us-ascii?Q?inZe8siKV/p9YmOQ4ixv0Jd6TFN5VhvsKzc73tGeKZ/IwJvqYWucXsHBSAyQ?=
 =?us-ascii?Q?j48XBJMmh9AUBQA4FWZHeOdNV4QYLDO3Gu7lERFjOiKSI8p2MkSq7zBUjQiP?=
 =?us-ascii?Q?C/Z+Vxcpf3rin6Ls5LFoj1z1f+eA093jyu12UR3zrYbG0HFmF0MBmOXb6x6Y?=
 =?us-ascii?Q?qIdmZ15kNAl5bP/FjlbFT9SGe9MXei5a0ZzHdLYKunnZ8I2TuQoYjBs45eUR?=
 =?us-ascii?Q?VspSHSKlmgyiqrG6JvGnDSBtt1W45kpZPlqXgwSWYc/FGG1Whfv9WoJfNpdE?=
 =?us-ascii?Q?5z1+lqgkFqIfOF+5IICHhmNziuXKzr0BeEgYMHsxQ43L94pS4Oz6XUyVicDK?=
 =?us-ascii?Q?/EbFKx70f7DtDK3V6ccY7PX/aii0C2KdsKRZOYLmOrng0nQCXKM04a9VEUwh?=
 =?us-ascii?Q?95QnQ5flF79TJUomTJrhJyLyITGI2+9XQl702hc47ZIba7CX0ho/3d6/04kl?=
 =?us-ascii?Q?TmgOFtVGheRq05CfiXfFm9kRWx/actiWOkcSx9lAXfS4faAM3GmtqcrKMPWu?=
 =?us-ascii?Q?fnWg5z+zm66tGo64HHZsDRwRT4OwbEC4J/L3WzTJZqzrf/2iPEzseailliMp?=
 =?us-ascii?Q?GnoZCfyDfVBWyqE2P4+6gfV9mnfZ+VkyBKe3jZAu8UJh1Exo/ZgLhvm9WiGS?=
 =?us-ascii?Q?L+tebRVReQHSTuL8XX26/Njwhm59SoORZCt7KVnbJoetyRN/gj+OsqxT8uiP?=
 =?us-ascii?Q?8Qmn4/GdRYortiK2X4/a2MX0klO1cPs722/g4c+Ht5VkYV0n+zkxohhNNNNz?=
 =?us-ascii?Q?WWNkUxqSWrC3AVyoxCDN3KU7/S4UN6rcLQnu+XkK4EopLbZJBcWZmNZwacoD?=
 =?us-ascii?Q?Giy/UkFtDE7hVovX8D3E5pxdepnq+gTL8aQJP8T49YfphAsONRxdnvo5M4u5?=
 =?us-ascii?Q?3jYu7KEMpLlqePxylKMqbTItTyKHxkCuquDHinfYtkRQR5xAVM8+1/saw7oz?=
 =?us-ascii?Q?/ftKIHuj5q3E3BBbq8VQvfC93p1PUrzmuQv561kboDIg72LmgRQbTAlgU7OG?=
 =?us-ascii?Q?Ng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec429ec-37ed-4a60-8fc5-08dd6b7c4257
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:05:58.9551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSkuQQJZ1KQ2Wnk/J2kk9Faf/0T1n5/eAKHiUdr7WRCGAkqFI+KDgLn2or+vN1CGS80y2lPSB3qtoi3AxkUEza39cUQTTD3PyBA+CGthwJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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

Hi Santhosh,

> -----Original Message-----
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Wednesday, March 19, 2025 10:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v6 1/2] lib/igt_kms: Add support to retrieve async
> modifiers and formats
>=20
> Parse "IN_FORMATS_ASYNC" plane property to identify supported format
> modifier pairs for async flips
>=20
> V2: Add new fields async_formats and reset idx.
>=20
> V3: Improve commit message , remove unused declaration (Chaitanya)
>     Introduce structure to hold a format modifier and its
>     associated format list.
>=20
> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>     (Chaitanya).
>=20
> V5: Re use local variables for async formats and free blob after
>     usage(Chaitanya)
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 53
> ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_kms.h |  7 ++++++-
>  2 files changed, 58 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..35e385a41 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -701,6 +701,7 @@ const char * const
> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {
>  	[IGT_PLANE_FB_DAMAGE_CLIPS] =3D "FB_DAMAGE_CLIPS",
>  	[IGT_PLANE_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] =3D "SIZE_HINTS",
> +	[IGT_PLANE_IN_FORMATS_ASYNC] =3D "IN_FORMATS_ASYNC",
>  };
>=20
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D { @@ -
> 5759,10 +5760,12 @@ static int igt_count_plane_format_mod(const struct
> drm_format_modifier_blob *blo  static void
> igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane)  {
>  	const struct drm_format_modifier_blob *blob_data;
> +	const struct drm_format_modifier *async_modifiers;
>  	drmModePropertyBlobPtr blob;
>  	uint64_t blob_id;
>  	int idx =3D 0;
>  	int count;
> +	const uint32_t *async_formats;
>=20
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>  		drmModePlanePtr p =3D plane->drm_plane; @@ -5796,8
> +5799,10 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
> igt_plane_t *plane
>  	blob_data =3D (const struct drm_format_modifier_blob *) blob->data;
>=20
>  	count =3D igt_count_plane_format_mod(blob_data);
> -	if (!count)
> +	if (!count) {
> +		drmModeFreePropertyBlob(blob);
>  		return;
> +	}
>=20
>  	plane->format_mod_count =3D count;
>  	plane->formats =3D calloc(count, sizeof(plane->formats[0])); @@ -
> 5822,6 +5827,52 @@ static void igt_fill_plane_format_mod(igt_display_t
> *display, igt_plane_t *plane
>  	}
>=20
>  	igt_assert_eq(idx, plane->format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);
> +
> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
> +		return;
> +

We should initialize the following variables to NULL/0 when property is not=
 present.

	uint64_t *async_modifiers;
	uint32_t *async_formats;
	int async_format_mod_count;

More on it on the next patch.

With that LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>





> +	blob_id =3D igt_plane_get_prop(plane,
> IGT_PLANE_IN_FORMATS_ASYNC);
> +	blob =3D drmModeGetPropertyBlob(display->drm_fd, blob_id);
> +
> +	if (!blob)
> +		return;
> +
> +	blob_data =3D (const struct drm_format_modifier_blob *)blob->data;
> +	count =3D igt_count_plane_format_mod(blob_data);
> +
> +	if (!count) {
> +		drmModeFreePropertyBlob(blob);
> +		return;
> +	}
> +
> +	plane->async_format_mod_count =3D count;
> +	plane->async_modifiers =3D calloc(count, sizeof(plane-
> >async_modifiers[0]));
> +	igt_assert(plane->async_modifiers);
> +
> +	plane->async_formats =3D calloc(count, sizeof(plane-
> >async_formats[0]));
> +	igt_assert(plane->async_formats);
> +
> +	idx =3D 0;
> +	for (int i =3D 0; i < blob_data->count_modifiers; i++) {
> +		for (int j =3D 0; j < 64; j++) {
> +			async_modifiers =3D modifiers_ptr(blob_data);
> +			async_formats =3D formats_ptr(blob_data);
> +
> +			if (!(async_modifiers[i].formats & (1ULL << j)))
> +				continue;
> +
> +			plane->async_formats[idx] =3D
> async_formats[async_modifiers[i].offset + j];
> +			plane->async_modifiers[idx] =3D
> async_modifiers[i].modifier;
> +			idx++;
> +			igt_assert_lte(idx, plane->async_format_mod_count);
> +		}
> +	}
> +
> +	igt_assert_eq(idx, plane->async_format_mod_count);
> +
> +	drmModeFreePropertyBlob(blob);
>  }
>=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..78d6a7ee4
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_X,
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
> -       IGT_NUM_PLANE_PROPS
> +       IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_NUM_PLANE_PROPS,
>  };
>=20
>  /**
> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>  	uint64_t *modifiers;
>  	uint32_t *formats;
>  	int format_mod_count;
> +
> +	uint64_t *async_modifiers;
> +	uint32_t *async_formats;
> +	int async_format_mod_count;
>  } igt_plane_t;
>=20
>  /*
> --
> 2.34.1

