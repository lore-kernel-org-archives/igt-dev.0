Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14617CA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ABF10E04F;
	Wed,  3 Sep 2025 07:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGnEJ59H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4513910E04F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756884994; x=1788420994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/RVxCz5ksNzLuBTZeQEY3UieyZMCGLfr8aqYbpmTg2E=;
 b=UGnEJ59HSLm/z4x6Ris3L4mWNA1UNmNUZUVRcBnpYr24tSfnEKr3fyTd
 fmtt8y0X7QH91pxbp7F69AIyz/W+PEXG4vGd0ylB2dh9ME2fqPd5shOCf
 4vZiQzLLqK+eHmtGBNLiMuAApXSoSJuqQZeTGe2L30vlLeuFMFfYs37JA
 7ue7aU3jzrjYvmPydiFxM29T99szOC2eFfp5CyVys32esoquhRebxaBZC
 BEaAcVJ6hg8vxRfwDaXblLqErAzICKUt8vzctl8el/W5ncTfp4NBJmE1L
 Fst833XWG26n9KDISraWUG1Gj+ZksuvuuYmwlED++bsGWt+D54muqyUc0 Q==;
X-CSE-ConnectionGUID: ubKrjH3iTGKrlfputbwxEQ==
X-CSE-MsgGUID: rfKp38SpSxWgUqPBFOmd1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59124565"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59124565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:36:34 -0700
X-CSE-ConnectionGUID: 1uqE6u1dTqekQcH4XkuWzg==
X-CSE-MsgGUID: mZHfpwIMRfObkM2Am5pSNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171390635"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:36:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:36:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 00:36:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/L5kLq2rBY22I3bkwo2bh9tScWrVJ3ENVmpn5oyWzfgwE0apeHXDeOxtF+zwHxIAxGaSbOfhrJ93CMa3gwHc7w97nayB20uzamyFWFraQB86Q1KrT3tj4LxL49hLF/p2q15MZj4PNecSYLLgh/N4tR+aBIjop3yOXtQAanAhgb54/bBs2MTpiDt4oVhoyRuaC3+Ves57hLLOCaE9rdIZcfZnrvlQ+Tqkhl0usR3qtRyTTbq7S7IpbG3YiUysKAq0LyasZJjQmvjf5fft79pu8oIBau8HmCPd6MAjyiU3Q/G72qaWM/JZAAkSq54PVgxSiCdjEAffb7MJWcveOGONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI7dzajV2c8jDjkx2NH9oJEkOI2E0omgh9dnFYLKdXE=;
 b=dM0DRCYm7eM08PHnruWuQNXbcW7iPZyvcu51rtlu7n04qX5ZwEWWs3KcEQt9mk0NrWYpb0zRkc7J1RNYL7LMITH9YEBCKXfy0IChePH9HTubvCAV6bio3akl9gPTLWTbW977IdLouG5PJYS8QHwYmxAtRJJEmiymBeXtdPwQTZ7S6+Zgv/EtDahOc2H211lt2cXXMMBNj1fJjDKjgqXhji6BLWvdZQcHgzsHfjwF4U2vWSJohjEjq8ZLkntAbl1jeq2zSVDE/7KeucjxCtovh5QL39YTLyl0n2oYSGDNr2y1Mud8fIDWH7KI2ghSOdGd+h/Xut5x4Kr9CV4WreJUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 07:36:30 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 07:36:29 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL+
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL+
Thread-Index: AQHcG+Kh6ZCgs6k7XkqRxzuM/vzzRLSAhv+AgACKmnA=
Date: Wed, 3 Sep 2025 07:36:29 +0000
Message-ID: <DM4PR11MB63601CCC511C7C3A10912635F401A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250902083342.104956-1-uma.shankar@intel.com>
 <CH0PR11MB54443B06C58AB3FDD1809EB9E506A@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54443B06C58AB3FDD1809EB9E506A@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW5PR11MB5882:EE_
x-ms-office365-filtering-correlation-id: 363384a0-70fd-404d-f621-08ddeabc9910
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TWH3KA13KiNTE+eOLZVWwxnheX+wn54TSjI6yKwLydL71IJvFwWFTREhsFBs?=
 =?us-ascii?Q?9bCpCrVyhTcorXXW60feA3/Tz/8wDv8CQZM7JNh7S7JBDt4Xy581zqG1umTJ?=
 =?us-ascii?Q?lbN8g97mcma8Z9RjrTvO6CTCU176gjkGv80h6/72SivvFOltwjXTqTO5sbTY?=
 =?us-ascii?Q?MPQ2X5SDlB85mCG2tIiTApJY2o85ws8ygXeDSCAJvhkKQQ+SixE4ee2tHDlA?=
 =?us-ascii?Q?CdKEmgAdOPdkKDkb5hEOmRB3XH+yzvnDtuSfUhC2qPfPRK+iGXSU350iqIuZ?=
 =?us-ascii?Q?e6c2xIubqyqL/PMVYyxmC4wo8jC5HRP/qS2ZImKcTXHRx4xatBDMB9bzQBg0?=
 =?us-ascii?Q?uJ3gFIicFI7Wz6SCuicl/wvs6dQksLbuqJeoJIE7zafQCxX0/RsRUOwdy7rn?=
 =?us-ascii?Q?b0Afbm/QXIvZAcT6AGkqXusEvVV7bTy+AJpphERPf+905gouoCu43Al2jt+W?=
 =?us-ascii?Q?lJ4xg4YLQofvAjelv/I9qR6fs4T9RDGn0gwcLJjFZ2qMiHVyBP/l083CcUw7?=
 =?us-ascii?Q?ACAA+DctrCrCL7sk2ePozeWUEdX6PlyetwLiHNq9lx2CpA5Cm+kRTQyj1ZFa?=
 =?us-ascii?Q?M1LiK74QZ9RghkWQqsbfMBeSEeeaLAExx6Dc4MbJ9u6JJsRg1p3MjrZHtbmR?=
 =?us-ascii?Q?LdnNfEAHw/VvjzZJYx8Wz9AF0Fj18vyLCX8vXoOkDB0lE9t6J2WjCuHTYY3O?=
 =?us-ascii?Q?5PtO16KVqHQQ4WUKhwVy20RuTDoSoPpjWYIXC9I8HKJfdIA/2bdN9oK/4orp?=
 =?us-ascii?Q?qAsBXHSAcQZ0fYLSy9ZBz8Z3lhJ1PgOFPHoYyFPe43K9g5aDLMhj9eSxi65P?=
 =?us-ascii?Q?w6+bndpoznD6ZoWKcjMrvt1J+A76JfE80fWKOcSCgzOOWmAaEi8EmHL3rTiN?=
 =?us-ascii?Q?x6To0+C5tfY2YaTvq1PGWJlDEzcQuaIg/3ZH5qG2ImyFrnko3j6xfuDk660j?=
 =?us-ascii?Q?mZXFmX5nRG/sdttclwNzXWIXRaL9Bk0wBOHg6FHjGCcYpmN3nhqC58FtElt1?=
 =?us-ascii?Q?JGlRNB5J7yUmkOc9QRSTPDLK0WgYyy/pMYAtBA2uNzVHSG/V57UIkuuoafG3?=
 =?us-ascii?Q?dgjepNJ7OVTS4yq8xql2ovV/jp4QaDiD2w3lQWQ1wy6OstKXCu8HUMM9kMuO?=
 =?us-ascii?Q?0wSeaFqKMrs0u6hXoYgjyJtQMVmNuCfJ2Gv2eaLPkMEbETrwRV6I9oPrzFPN?=
 =?us-ascii?Q?lD0jGtu2jlkPUPXbFYp9PN4EnEYeYcDJCuMTXdZOiBQpgZ03YPzIzZUDCS19?=
 =?us-ascii?Q?Ax9ydGXQFaxxgO23dTQ/uAPv9I9HcQWlWaJqjo/29eXRC4+GaUhh+WEwEsqd?=
 =?us-ascii?Q?fL+cFCoulK8rHTU1DpF/HpeeMM1zxclzMH31nUIODQPSg/fusxYMFk4fXcfU?=
 =?us-ascii?Q?hB72tYATA432vAMw6+13d1L0Gfw8G/mZwe8lZBnh39JvYjP8CCEYjzY0oiik?=
 =?us-ascii?Q?NneAqEtRCn7fgwgdDqheQr7IKsuQfUTrUU0j7RgQ9uG+ecpcQeE0Nw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZFRLZ4G/v/uXFB5b03fovdEOh2Xws63OTTUvjaKqeeupQl6nUgRwR0sKG51v?=
 =?us-ascii?Q?AjtapglS80W9pRqtWkHhBc+oQNGZ28yp4r4ldCDVULEl+0tuEtQXSEPGgw+B?=
 =?us-ascii?Q?jwd46eoo0Wk3frQ4an5mcM9rohhAggcRYzZJL+175ua6Qdg8lT80GOMiyKg4?=
 =?us-ascii?Q?KT2OIPF//Y728cuZLUJHNu4Ci9LvaN40N9AAbhO8oeOukLHRcKrfp5fAE5zi?=
 =?us-ascii?Q?CpD/TAFwHhRz4Ufl16s86Wo8AUEVBXb4p5F7xnMI8j0lNJxhiVXCHxhMIGYB?=
 =?us-ascii?Q?LyOEWeDO42fUqVpaKTS/EgqBJ61japceePmhNwRqXibE34IIZk58lbW27k3T?=
 =?us-ascii?Q?tgN2b55IwLLBWiCno176CKWbg3zE6IcssClRi/UnUYp9NwlIqMZ96TSk+ya3?=
 =?us-ascii?Q?v7Jd3j3WqVbpx2RKF0Kx2IvFtA2927VAGWCmkz9Hw5Ioqm+9c0soYchwTVRW?=
 =?us-ascii?Q?7KiK+tn+lgEv8vgut+W6u57x51HGzy/khgchKUMrYw86NvNEnFNTIg64vHLH?=
 =?us-ascii?Q?vd1QxoePVsDSV3jwScfE/U//Il318G7lxb73AAo57F97C1De3Qt1hRoZtkyX?=
 =?us-ascii?Q?EtOPZG3sm+v5ccJOZZhw4AfLfls7NR9jWGpc2o9km+5aRQXcPd8Y09ssq7w/?=
 =?us-ascii?Q?XRXj7J1djNeliRnRbaYOT41kXGZjWh4svUhWscpFNbgPZdpBRSnBar3UwWLU?=
 =?us-ascii?Q?hfpHHxW9pDH4WhpBtnyXCzLAEdBo9fLl+qoPb7BWNDs/xASaSlpChiDLXD4F?=
 =?us-ascii?Q?LT6ua6THs47XR8hSBl5Zb1IM7txW9Sd2A2aNyi/IMeuEdaWVnQaSN0DqU3XN?=
 =?us-ascii?Q?1u7kOogVtYUebEeYBwPwJdbFC9UIJrr2seoZa4l0qDKMQzoItwemXcAy20Pr?=
 =?us-ascii?Q?4sq7jWpEU1GTwLUHJPyJt8R4qXetJIuY1/agypHIUnM53WonbVjhKpWssA3D?=
 =?us-ascii?Q?j7d7FxoekgPtq1EyV/7gBl9FQp62GqnxddmR2WgMMJwB6nsH09khqtJHpyiK?=
 =?us-ascii?Q?5s2R57VSiHyp1WEP47O2fL0af2+K2ZeNM9ichlcfQB/PycIsXz+afaMlV6bW?=
 =?us-ascii?Q?UsULVLkcJ4jz4EdS20xsBMI/Bz4ymNcxD2O5Kn7NQR1vEW334LuKXYJDbVxM?=
 =?us-ascii?Q?VQrDhOaTaLI0pJp0FPmGiUzFUjlzrLBtAaiPAok49/NwiK5swfJeMWm8Ng1G?=
 =?us-ascii?Q?YEh2MgviW2a/VTDA5v4b5vkmchS7zj1kGGGHJ+OaONHFHtYb/ocJDMBi0XpU?=
 =?us-ascii?Q?C+7UPfwxZ6/PGwVw9Ewx4Rb0R/u2j9WSZjqO+hLz8jn1BfQ1LnOjpFu2K02A?=
 =?us-ascii?Q?rLvKOeaT599hzJGd6Iixp5ypBEloxGreUS/LkOFPftzNCozfNFZnLiHRkJWN?=
 =?us-ascii?Q?bS9A8ZX7apmfqd2oFN/CpJ+6YCXu9aVr+7iPUccd6Kz7+xaDRynDx0ex7lWY?=
 =?us-ascii?Q?e/kfm/oOCZhatswzU6kGjScMKdgT/ghsSKE3Oqb0JB+YdpD0d9gBinJxq1H1?=
 =?us-ascii?Q?h05t8oX05v7/NiT+Hpm5yAZGXcToOY7XRYXTy+F6KklqKkhJskY/tg8yGSRD?=
 =?us-ascii?Q?kXku2vK9+pUwGPu8mtHb8z8FC4CZ7Ds4fgGdKKV0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363384a0-70fd-404d-f621-08ddeabc9910
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 07:36:29.8974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpDaxYm/qgBGvOkx5z68yIIrl1haz7aNyVJTk1jShxIYAkAqJTNXM2QdcDJwy+DXfek7X+AMjbqESGRJVikHFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Wednesday, September 3, 2025 4:45 AM
> To: Shankar, Uma <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Shankar, Uma <uma.shankar@intel.com>; Cavitt,
> Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove F=
BC
> modulo 4 restriction for ADL+
>=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Uma
> Shankar
> Sent: Tuesday, September 2, 2025 1:34 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC m=
odulo
> 4 restriction for ADL+
> >
> > FBC restriction where FBC is disabled for non-modulo 4 plane size
> > (including plane size + yoffset) is fixed from ADL onwards in h/w.
>=20
> s/ADL/ADL-P
>=20
> > WA:22010751166
>=20
> The phrasing here is a bit difficult to parse and sort of implies the WA =
is the fix to
> the FBC restriction for ADL onwards, which is not the case.  Try:
>=20
> """
> WA:22010751166 does not apply past display version 12.  Or, in other word=
s, the
> FBC restriction where FBC is disabled for non-modulo 4 plane sizes (inclu=
ding
> plane size + yoffset) is fixed from display version 13 and onwards.
> """

Yes agree, will update.

> >
> > Relax the restriction for the same.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  tests/intel/kms_frontbuffer_tracking.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c
> > b/tests/intel/kms_frontbuffer_tracking.c
> > index 061e996cc..a97001770 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -3496,8 +3496,8 @@ static void scaledprimary_subtest(const struct
> test_mode *t)
> >  	do_assertions(DONT_ASSERT_CRC);
> >
> >  	/*
> > -	 * On gen >=3D 9 HW, FBC is not enabled on a plane with a Y offset
> > -	 * that isn't divisible by 4, because it causes FIFO underruns.
> > +	 * On gen >=3D 9 and till gen12 HW, FBC is not enabled on a plane wit=
h
>=20
> s/On gen >=3D 9 and till gen12 HW/For display versions 9 through 12
>=20
> > +	 * a Y offset that isn't divisible by 4, because it causes FIFO under=
runs.
> >  	 *
> >  	 * Check that FBC is disabled.
> >  	 */
> > @@ -3505,7 +3505,7 @@ static void scaledprimary_subtest(const struct
> test_mode *t)
> >  			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
> >  	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> >  	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> > -	do_assertions(DONT_ASSERT_CRC | (gen >=3D 9 ?
> ASSERT_FBC_DISABLED : 0));
> > +	do_assertions(DONT_ASSERT_CRC | ((gen >=3D 9 && gen <=3D 12) ?
> > +ASSERT_FBC_DISABLED : 0));
>=20
> NIT:
> It isn't necessary for this patch, but in the future, we should probably =
rename the
> variable 'gen' to something more descriptive, like 'display_ver'.

Yeah, will send out a separate patch to update these variables across tests=
.

Thanks Jonathan for the review and feedback.

Regards,
Uma Shankar

> -Jonathan Cavitt
>=20
> >
> >  	/* Back to the good and old blue fb. */
> >  	igt_plane_set_fb(reg->plane, old_fb);
> > --
> > 2.42.0
> >
> >
