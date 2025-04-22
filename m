Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BE2C369D3
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 11:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490B910E087;
	Tue, 22 Apr 2025 11:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="megsd5xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BFC10E087
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745323115; x=1776859115;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DvF2MuMS+nuz8W8QHDhcpp3ARJyI+qt0Slujt/YHhgE=;
 b=megsd5xlt02/+K8QAQJsvbf+q2HuxILABivzXXxfci/klfiu9Tr+9Nol
 p1RuAM162mfORNf0AjmdjIwbaA+JeYgqZn0w67I3T9nM2tlNwIV1thIBc
 s5b5GBmGh7P70yoHuxSYpq6yTCy/4bjdYK6mej8Xvddv0tBgLhY9A5yoh
 kRUszw8MGcxGcvXtM0KbwCz2hf9VLzpSRsBSQznGtuwI6LEb5ZL0tJ4/7
 tGLyDg2oV9CC30653cjGoZ3uB5y5bG3yUT7VvbjNscs7X5G6oEn2NZeob
 Z7v0tc+YVrYNXwiSWeWkzgTi9kTs4cZTDE9RhgBrmNJwn9y/tY6IUgRqS A==;
X-CSE-ConnectionGUID: zwYrYewCSRmzH/W2UZqF4A==
X-CSE-MsgGUID: 6jCcBap7RFqZujrHaaaPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47060544"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="47060544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:58:35 -0700
X-CSE-ConnectionGUID: XCOmdGiHRH2E7EJxQrGilA==
X-CSE-MsgGUID: O7gzFJ0VRVyKBrXJsyCLcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="136074857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:58:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 04:58:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 04:58:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 04:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1R0A0h2JKO/aB1uwZWczxB87WTgVlzfBpfST9OM27km7Q6kwV/Atu86GAXQ/Nq3pb9ZA5hg0XMkj55rJenhtoRobOMSdBEZ075Rd9bfje9BNtRHHQPb4hY8rw2eXlfYmIcLJe+BrqLlK3sT+j2p/9Brqyu5DUfehT9WPiWaOtflYxwPdg0hbnoit9/M2BkFutuZUrOECKR37lF3ycqf8LKHMkvwolFMNDmhlxfLrk9lGR6J3qiJcZeZYNoUK9X0ak6M0+tPCAMueYmdHY7irEGnf046oECNlU+DQaq2Qj5+s1phWVStHVMbFPdNjZCWXhKL3KL+rtTRXZE/60uaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEarVLLse5Mc1M9O8vsZcFbklIGfnlqPCJu20bkojWI=;
 b=iEBGP1RaQ2Xo834qtmm3D8rc1o126VkzPko7T/24xve/JgUcbIGmOnm3kqp+hUn4DtjyDDAwi0lkmMdb7vMpoJYushifdhi0WvBrmEG99MRb3LgrpZsC8dIXskiaHqtc6It65crvpWrki7Yoiomgh8dd75lo8DdVwi21imcUn9R8Us/L4WzyK/P/aitZRJtwFaES2bw/3r+0bV4gCgBuI4MPed+Xh9/5mL2NkFuV/M0CcMtTa3JM5a02qDBL0zQZKazkgNbGBS3mc4SqPJ0elueIzNIXHXLeWsGKkE47kjwMhGw+CW9jj7W0rAuHjBvPVlfj5pgIGPvL2eyZMZAFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 22 Apr
 2025 11:58:29 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%6]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 11:58:29 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_module_load: Fixed the skipped
 test issue
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_module_load: Fixed the skipped
 test issue
Thread-Index: AQHbs3P3XfL/skKUDk6EHfVRJSq7MrOvjb5g
Date: Tue, 22 Apr 2025 11:58:29 +0000
Message-ID: <DS0PR11MB7264272D287469D8C1FFA140D9BB2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250422102936.2950388-1-sobin.thomas@intel.com>
 <20250422102936.2950388-2-sobin.thomas@intel.com>
In-Reply-To: <20250422102936.2950388-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CH3PR11MB8212:EE_
x-ms-office365-filtering-correlation-id: a48080ba-a59c-4a3a-9c61-08dd8194ff20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9bmzX3ks4Ey3VaxkY50w0cZsL3TtogufOOjFtahWswKVbiBKWrBETBLXAdY8?=
 =?us-ascii?Q?8eHTsOjqUtMqIKfiHFHo9fjluIFM2hLJSzBMhmZBlnsHo+tdp5AQYxkMdfGt?=
 =?us-ascii?Q?VTSry8XP2JepmtbQnx31iheQa5urWBKSpYtK3uXDnaylvhnshcHhmrITRZCB?=
 =?us-ascii?Q?KaZhwXWKXHenbgTpBreP37ZwIlt8i9F9n4cKwu7kXP9/FoWO9+eablBfXarY?=
 =?us-ascii?Q?sz49KtM+cy8I6VAwE3eGdFoScu0Utqja6VdaSuaKh1CB7ZlHIu03RCi3780c?=
 =?us-ascii?Q?T0bVu+EyHSbr6tRyLYUU6SlEdjk5kMPb+j77yLIvJpnKWm/F3Cs7G2rhny8C?=
 =?us-ascii?Q?PjGbyQ0YWUMXmFtEqcudl2GjZ/m+Yuu4wU5sBcSvTyAEmg49lOFNleuDbA4F?=
 =?us-ascii?Q?sU2y+GdIXD745pagw17iya5TEV2zsokSVmlrZqt6WfFBCr6BByxeSYo0RGmQ?=
 =?us-ascii?Q?nzU6Nque7hkZyrpK03BiYTqU3SGtsdspcy71NJD/BgmDoTsq/2+oy27w+5XR?=
 =?us-ascii?Q?tUccBUKSAym057CRV1giHvqZYv5TmhvVb1jt+9MBWPCYCx+nh3DqBHxE1Tev?=
 =?us-ascii?Q?rHCidpz7Je0L0/A20A0W6fowj55nZeo9uZPWSLsCkCJwZSNKAyecrO3xIAHK?=
 =?us-ascii?Q?N3f7OyHb0fEVKuVoUEOVzI2AEjWXJPNcY1jHMxDQw6JLgaQy9RciNKr+f4/W?=
 =?us-ascii?Q?SNucFpDDN59DIMhlQC0itT88vjEGrgaROnRE6tXwi1udw7ex5mvBc89KOimm?=
 =?us-ascii?Q?3eWleJaxOg91NxjSBIn2ZWQ0dxX/H1lVDvvqcnVdGVhxeJ8HeEfZ67ZqaNaU?=
 =?us-ascii?Q?VH2XEjMMtHFLcIvqH5B8WGU/tTM2vc7RbLi32e/8lt7tg99swokUMNiqwOOH?=
 =?us-ascii?Q?GsALJqvDpUvVYIdKmP5+9uFbyx6tuQdJZGWCNylFKvYwJq5+04eOA3sOsgoN?=
 =?us-ascii?Q?x9nJOjr8bLTZn0A8rrCeaJ2yaehJ43+8p8bJ9swBfDk1pNV2G0IBSEfUN+HK?=
 =?us-ascii?Q?24QSs2o5xHttV9BDpXuhQpA0VeQ849RNxG/2pAeCCXSeLlJ8YWUgF6hPzYPi?=
 =?us-ascii?Q?8NJUxSjISH2+KSuV7CCivzLFIiJI+dqARP8a6lGekWhc7OK+YRnePjPL9ACf?=
 =?us-ascii?Q?ikHsbCu9a1STIsFVw/SPes71bJqsNvxHMPs4wCHdB//3ChdEwcWBgINrzajU?=
 =?us-ascii?Q?BbOEd7RrQRA/Q2R6IaroRmdTmxQdG5NP/3ihQiIm/nsABaddJAdiT4qdgyfr?=
 =?us-ascii?Q?pmzH8IE3kwrc37SCo5h8pqP9Q/vUFmy8W1wW9or/42Hub/t62oAJ4yF47ea8?=
 =?us-ascii?Q?CCsJIJqJt5r7pGu2fASvtjMZOJm3SwYicF2jnAdyy7a5Kgx78MbAJZcKoty7?=
 =?us-ascii?Q?wYR5sEsV/xy0XVEwjI7vg7UVdUE5iQ41RRMadFqLUl30+cv1eLUO6dhX5XTX?=
 =?us-ascii?Q?WAdiss68sfO7ENYWHNWUssj+ulQJ1gAjPV4uGY/bpZyKE1pH8JsnUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UyeidT/47iacCveTEwJLavoZIdPWgbWGM/Wi6QoBWeIjEC83yJwr4qjl5d50?=
 =?us-ascii?Q?X7ziFdudZuvfmbmXPd43INdAhzgnouPl1l+94w0E7nZ9smozQukpZlkr0sjR?=
 =?us-ascii?Q?6d3QW+2uxvaeJ202BkcBe4thHCyW/1qTjpnNwH17GAxGOnSWnHPUda+ptVY4?=
 =?us-ascii?Q?+ssvLYfTuOyBKaqo9K+SLRCyphc2suOW4m41WcEEbvjDHbEWjooegscexjQp?=
 =?us-ascii?Q?PCU8PVjdx2DvJow0NHn94Qcggabu7rwcs+HaVdpD3glolzRRoGBD1FCLfXWq?=
 =?us-ascii?Q?09013ktbmaebVOrO4/h44OWDd8f3Y4lP6Af85ufYNptc35jjmCgKgbs3BycV?=
 =?us-ascii?Q?sI7RcoZ3f0HauxQ+TL9g7OS5Wjg7IxyWl/T5eytpG0p4qdNnhb7aEjF8/ACu?=
 =?us-ascii?Q?ey0RoCnV/cbTDoKMTKJ4TUtMfCP3KmsN4QTqBXdcRQAbOzpZPzZSie6S1l9S?=
 =?us-ascii?Q?7wAzVerHW3MT2Ca/RcqekTLmwwged1uaQ322N0EirF4TnYJimlyPpVPS1OgD?=
 =?us-ascii?Q?6A5P7XJE26IUzMnRu7Zf8PbBivEw/5J/+7o4cDp0HkHdFlXw4QI4P4dohfiF?=
 =?us-ascii?Q?b9RRABzurUZQWtC5LOijM/htmakSEnZ16/HN4+utRg+u0grQH/hCUYdWU7n0?=
 =?us-ascii?Q?Jg13phjSwjnUC8MJIgJgbxeKW69m9bY/zRJMOBJiwRjQLgj3EOuFTzfQz/VG?=
 =?us-ascii?Q?ffnB4m1rgKCMRKTH7mq8Ks5D4D/uiGW8wxmncN2XBGNHOZ6i2qdr7D7HNdM+?=
 =?us-ascii?Q?JY2J3hgbZ97nO5coCjcnhRksJbyOE5FJV1f5yO0HS0xnsfGRoqVkJOdaYPsg?=
 =?us-ascii?Q?GJSKcU6RdAWgtdt+ZWdlV2sFuljEDEKVI5ZdEdDCy7MBr0To8/XYB/sVkc7c?=
 =?us-ascii?Q?ysABGvWeaXeRsHjkziDxsqbrizn8P/T/0wSTXwfzHEqjADGl7SUMlffgFAdZ?=
 =?us-ascii?Q?XCTsx/mkE///iiM8d2SxzskjpWMKyvlTUyWxhv9T47NMtqVAGhR/YQRl8BaY?=
 =?us-ascii?Q?TXZLAmNBgFqJkExzwXYQUY+V7q6dkLR6sMvaTlknmTpQwOZf7ua2YYgBtGDF?=
 =?us-ascii?Q?YUr6gY4x/Xx9JXv0SPhFVJI4OHoQaBzXNfVZ0tX/8GNnuWATZasbnMKfp7yW?=
 =?us-ascii?Q?aWk6AyLi4cfXsWgFdSQjMvXZMfWeN+xE4ZhCmn2cdCc0YNm+R4PZGLgCy1A+?=
 =?us-ascii?Q?QfRR8gXCkDgg0w6AKP5NydUszPI4QfMeWYFos2zOkzrRIeeC81ENetZ4+ns+?=
 =?us-ascii?Q?2fj4NjxDktyALQrIntPqbMBlmvTHa87HhylBfq7AUJZqDz7Pbgo4UaovILgH?=
 =?us-ascii?Q?qXxe4xmTTgKILg10ruxZw04vFbcatD1YSUj7gxeElsAgJUdehvHHtgBMX8+h?=
 =?us-ascii?Q?wRvovhwBLUl38rX1Oj2qs5Nz2imLtYtCOcQzt3hRf9dXDQDAOTH/0RJ9iXB2?=
 =?us-ascii?Q?gT8x7PZ5PJWZqHJkQlCUXvZMWg30aHhtLMiygqeJsmRcPlzdto8x1gwzPXcS?=
 =?us-ascii?Q?a07oGGbRkJH0nhMn2Dc9vSxCQWacKUCDH3JjIgJXAsqZpooksx8vJtFSI96N?=
 =?us-ascii?Q?smoeYYTKvSXETbrM5P319nzqjx2cGDzXaNxlEoTmol1rfVAUrQB+WnApi52y?=
 =?us-ascii?Q?ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48080ba-a59c-4a3a-9c61-08dd8194ff20
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 11:58:29.1622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ai2MYR1orTreVppGQZKsPVK1gS8cS3zbueFbLXnXyjUtnvsU0eZ8qO1jL6Rk6YfizIkvXFChqipccBHF95DR10eGoO8ejos38DzseQwdRE2MviTeDVn7lgQUCpZyAC8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
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

Hi Sobin,

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Tuesday, April 22, 2025 12:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_module_load: Fixed the skipped =
test
> issue
>=20
> Fixed the xe load test getting skipped by unloading the
> xe driver before loading the driver.

I am personally against this change - this is essentially making the load
test a reload test, which we already have. On top of that, test name and
documentation vs its behavior becomes misleading - this test should
only try to load the module, not reload it.

Skip does not mean failure. It means that the module is already loaded.

Thanks,
Dominik Karol=20

>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_module_load.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
> index 83e37430f..15cbfb51f 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -120,6 +120,9 @@ igt_main
>  {
>  	igt_describe("Check if xe and friends are not yet loaded, then load
> them.");
>  	igt_subtest("load") {
> +		if (igt_kmod_is_loaded("xe"))
> +			igt_xe_driver_unload();
> +
>  		for (int i =3D 0; unwanted_drivers[i] !=3D NULL; i++) {
>=20
> 	igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
>  				      "%s is already loaded\n",
> unwanted_drivers[i]);
> --
> 2.34.1

