Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66888E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2319310E32A;
	Tue,  7 Jan 2025 20:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYxl+QfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF56910E79D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736282508; x=1767818508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IVyRYcqi0LW7X9cIMq7YjudNkv4DCXwK2sYkDavyW5g=;
 b=PYxl+QfFa0Xi+AompqnLYaL4ZGAkPocG0Nbo5kBe1/Yj8gRSRrji6RPE
 +cCdvz/dqxs/ViA95wFgHOF79ikRlXy34lhLBeF0cq9GYR3sr4z7mWJE6
 7RZw3s7+70glPORu7MAQ8RtJBK6Yion5kTTNRWujOAcs0LBkvpF9oaAHE
 G6VPAU1FAHgULlDpcoqDoPb4VmHm9F9yOD+32s2X/5l2B2RbZ5ViDnaKM
 h+Tf+l8nf+5Ur7P8hCH1N09hj1QhnsM6i2TIFtkLZO7IZlbwM61s2/3pu
 3vWq0WR7HeZNQLoVrG2HL+xYpxmYliovzpYY/WGnI2+Rn2v+1ABXUtk9N g==;
X-CSE-ConnectionGUID: GcpIieIeRbyJDVMqzQhYnw==
X-CSE-MsgGUID: l3nHzIMATqWoru9B8ULzHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47843553"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47843553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:41:48 -0800
X-CSE-ConnectionGUID: FA3gkHJvQGus6s6qq0QISw==
X-CSE-MsgGUID: VdDZYx+URYuMYtxvHqlx4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133729037"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 12:41:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 12:41:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 12:41:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 12:41:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7U4qBbRF+vnDE3Vu0gI2q5N2A+eqyGp3DqLhzw+dgB6phLlbdyXdhnXoq9WjGbobVb+XPjmnXudrbD6+yLxFfyWmZEgqLOHIkD2dCHCnszuLFQxGY7d8MALn8myQZOxoUJd8trjx1nSc0HvL0DG2sCx5Ajz0VzOlJdLmC6b0zaES6gcywoIBjbN5o4ikCFtVAyCXjAqVIVOKkYDzHN+vT44VgZKauU/wZqSFC/JsE2Ndlz/ZMZfQ15xS5VNdCE7rQFnpPV9JJcZvEPUzOrnbnTacGiFSuzaCMSPsczt6wULMCzo2oZ8K2ST4+Mngnt/xnIAynghOa/EynvjBLJYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOZ84A5aOucDr+Fk9YwLz0Kgjx753bs2oM+ghLpqRUM=;
 b=i+pktiB9KWeAOIUv6aSLTClI+eW/8J77CrXvjWIopB1Stm7Zbou1nUgWPXTTofxU2eV/zwZH94CJNXGdavCQGrL4XE09MW3H8+5imAqsfJxHj9DyPZ+vUFU7kTn9mwcDSzEb1OJxMxCGQkYfwOoLqjOpl3VEqnk+3tSK8GB5geTL0JO8rUySlgfJK/LUWvogCw+uhzPOy18E0d2PFBafY9dUh7ziF9zKP/XuFDYCdShp//B9dqUODnprbBdst8leTlx8bmTWhhaoyOpjzqdVh0H1j13XOvYjxUeAU4R3sS/78jlQ7PpHEDbPnFlmO+F+jzg2vUqIrcagbtcpcPya0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 20:41:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 20:40:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v2 8/8] tests/intel/xe_drm_fdinfo: Also test target
 class with others-*
Thread-Topic: [PATCH i-g-t v2 8/8] tests/intel/xe_drm_fdinfo: Also test target
 class with others-*
Thread-Index: AQHbYUKtgr84ZUxg6UmT2vs9/EuCU7MLxlKA
Date: Tue, 7 Jan 2025 20:40:59 +0000
Message-ID: <CH0PR11MB544434D2E1ED7C25FD624F0EE5112@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
 <20250107202615.1306306-8-lucas.demarchi@intel.com>
In-Reply-To: <20250107202615.1306306-8-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5278:EE_
x-ms-office365-filtering-correlation-id: 14a5ea2c-568f-47a8-06cb-08dd2f5b983c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D/DMTgx2ax+slQST1r0D2UKf8qFkVOUBFb/ItVqoPgKNoR2jNwApDje72eAX?=
 =?us-ascii?Q?fxkWKrkUwT68aZeeh5mVf75fKcA7p/4dMs8qfOgwGBTTmj10j1VRn7KwEiNA?=
 =?us-ascii?Q?neD4ccpT+iZm76AaFCq2+FHiIipdfFLkTTZeLR+ldgmlw9xIPI8+gA64vjF4?=
 =?us-ascii?Q?Bx0QHU57S6wqpCws9nVFtiG9ZjejErDLZQurDX1eoBMn2DZPF5hU3jDRNe62?=
 =?us-ascii?Q?uE8ceE8nFJ1Gr5fw/Aw4NLPakYc4CJTDNJOHB88bGLBr3Ii+E0bXNKeIXFVt?=
 =?us-ascii?Q?gGm2ZC4bwIgwLWq+JspDUpOpXDU7y1wfck5TBAFJUQot86rH1lNXH5ruvjtN?=
 =?us-ascii?Q?BVxxVPNMi6B2szzNRg08+DfzOeKKbcybbh+k/Pqi7UwgtY0oFCslO0MWmlTq?=
 =?us-ascii?Q?nLEDsm+PHgZTCdOWKIa6OfSKVkVF7XEGmkzhcKSyv3XINsU5Kc0xBmuoTH7p?=
 =?us-ascii?Q?2C319NLeC49FdLCOldYUcn9K1goXkOVK62W3G0vU2IiAq0sJF/pmFj48rwCM?=
 =?us-ascii?Q?zk5dVERgmYdwyHbxFGjPsuIrCR3o5fmQFj4bl7dEz4aOS1WYPluPIzhdYxWX?=
 =?us-ascii?Q?lRZvj1wzc8OMPgyefe0jieAL8RF5ePnWEXleBlHW/JXLq7M+EtAe9GSqqEgV?=
 =?us-ascii?Q?Ll8NuKfUHUbKLpz9mr0zwMFoWivQplUgOGiR76ImxR0vQAS+OD6EhPak15kH?=
 =?us-ascii?Q?ga2Eh5CsvZpAwsbiXOIdpD9ncy5LErc29SnEAw2tZ2nTXYWL8P+xWODkObNQ?=
 =?us-ascii?Q?T7ddHDAZT/bifL8XWrn/8B8l/N5H5RlPk7/pLXdWs2Z/pfngcubG6B7TcQ9i?=
 =?us-ascii?Q?ydRaeWpYZRdJ5AEUUi7M20Xsz0CNZaA5X7I8o/NX+yssH+SsToHnemNq6n/k?=
 =?us-ascii?Q?M1XXO7Xcb5nAGgL9R7cn51eYVkFbyBYClQ2xsJGL/zGpFGG/4EkQOaDvkg0E?=
 =?us-ascii?Q?C5COcPAlQNOwcCfgJUKMWdkmgUkauCFdJsNTR6as9dGau1aIf09SxKZ73l7i?=
 =?us-ascii?Q?Re4Fv0t1F5zHjKpyxNxAMrzR5HZ4QND+dRybOB7HWM7/a1ZC+FDWpX5wNE3Z?=
 =?us-ascii?Q?vqjFGirHDgefqx+l1qS+obDTimumqER24gKZvEerBCy8tcOgbQTn8u1rnS4a?=
 =?us-ascii?Q?QShIZvIEqu2UUog17BF74LLdTPMl0Y8X/lmkb1tq/fdpTp3Z2wNLsdyWhleM?=
 =?us-ascii?Q?FGI3iy5VLmiyFK2P2DTLC0TAK89fAM67vnR529F7161UKnmqVLjOPlodGqKX?=
 =?us-ascii?Q?lyR5g4XdlBnpFM/vo3U9No5EPZXawfaLJhVdtScm2rlKBigQ2rHg3d5Ib6FS?=
 =?us-ascii?Q?MwDB4p9u1kDuumkdWy0uqILw03dHEsi1Dy0/Be3WXW4jC/Mxr2iTDwi9Y5YT?=
 =?us-ascii?Q?NgE9NQuzalJ7HHNQupF60VLq5UQmYV5Xd/v35m5PX6OrGj15GGRwqSN9FpHa?=
 =?us-ascii?Q?cMR9KqyzWKqv+S0WDKz+Z5QJlKXgwN9A?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?srK7bbNf5uIdYxaid/4bmiBEqozdaOfZfw56rliPN2Tij8/YgpRZ4Zl+5TJZ?=
 =?us-ascii?Q?pvRLnONH6qhnKWJvozPeeoQF/rrxdIruex5k2HdLrdHnSrOkMu17BoE+maQU?=
 =?us-ascii?Q?GoJ20+l1P0CsLGyCHe9kDHoMKnBXW6DikS9mq1T6qOUnmd9xbkgHUNhECb/W?=
 =?us-ascii?Q?YLNxRmhDjQp5nCaZBhC5qsnyDnZ5/d7zRTjiw6u1sZNbSZfYYO1FBj6kj06H?=
 =?us-ascii?Q?XxiJMPzHfJvKwxGARz64KEgxPcF7l45kkxU+7+wpMdIEfsauZbkgvuCEGDB9?=
 =?us-ascii?Q?vXZWwKAb3gvfL9KvGL/bamaqkm484Lq5hjTYS9ANJflZgB9/nNW5hLp4ZzdV?=
 =?us-ascii?Q?L6L43LrDvqJRe5803UMLf1qb3WD1kuWdRJWnl5BZUTH0VjPF6c5pJ82xC+Vv?=
 =?us-ascii?Q?viqst2ajXkHr50DkmLNwZgNTaUeVo8MIKwyrA1Z4c842hSFICZIg/neI/7g5?=
 =?us-ascii?Q?4YgKCuVKZ6o+oWy2TawNx2tahpCzHrl/HpQNGaULdtRVtIVoPon29z+K+Miq?=
 =?us-ascii?Q?p3O7GCeyJlI6He+VOvs/BBqxgusB5V0IBJ9lCqyFP5X1T5/RUIkd1pwMRa5m?=
 =?us-ascii?Q?E75VYWPzR7NHKYXGoz13gwLvuBWnfzI/ETi6STmV+mvhODxnlbK84WLlmsx2?=
 =?us-ascii?Q?/RADLJlQP+9+Xzlr0jYi6X/NtizkmLH9vsl5OAnbwu/mS9BydSq/p6mz3z63?=
 =?us-ascii?Q?bgCb4q466HwU9UcUt326jtKu9Aucsub1rv7wjHa19BOQVbFUey82ZJgrwSCV?=
 =?us-ascii?Q?/WRCK6rV8swD2XqwcgCP4T5I1jxSL0rwjgg27vCWXHlhUXuEOz33yj8gac7E?=
 =?us-ascii?Q?2dODn6vAjph6EHXCVE5SiLAnUTnzOX+bYnwH5cGIUJF4ZlfsBi7kw30PK2EA?=
 =?us-ascii?Q?3LEzVqki5IocyuBkj4lb7ezafTTHgdFfRnQCbp7ScsjzQu4TmegPQ+0zYKtL?=
 =?us-ascii?Q?QLWdZRS2BQQhRpwcH8PDrf9/VvJwXPa5lA9YT6yta/XffAC1hSnSHDdzYbEI?=
 =?us-ascii?Q?x4kJnEhY8jZVJCq26UNFuG5sDUkAFboLZ368VpX0ofBgTVDgVJFADcRn6Ff8?=
 =?us-ascii?Q?FAR3tfh0HOyu0YYFocprPjX0RVuqU5KV832lf9w4hgfMHYgge55XR/3Xf2zx?=
 =?us-ascii?Q?BxbasxZWK0ZAye4FVQ8TNl1spXGNUgC1aztYtz40sm7ah1W153BSRRZPNOI5?=
 =?us-ascii?Q?kQSccNJRtesGCshEQhzf6c/PywpIxF92P3hUIjiZzFjEzqgWhqE14+LXJfAx?=
 =?us-ascii?Q?GBDHBrRrTA2RD51H/qnuFwUYJ0sAxzmdfql75sdWLIfaDpYzj8sej1KiR6vj?=
 =?us-ascii?Q?AjZVmPq0A0kYSBbfnFPlshllUIPnW9lQSJ7LNtgQyFckyxJFSvI6lVo9naue?=
 =?us-ascii?Q?/ip06rDSNCOKHXSAUcNlVByGmmiadVFo8JYIZm8Dn+YReaC86Q2Qrs86PEEq?=
 =?us-ascii?Q?9wHFYVSTSfA6u6o2QStL/YTPRFkgnerWyaPmyez30N8y/uqUFpu7uEDJWr3J?=
 =?us-ascii?Q?B8soLEPgv+HB0yGMEKYaLcKxtmsUt5vCEoFqWQDauo6bnmajOnUmNm9xdAkv?=
 =?us-ascii?Q?qJECdEqwVtO4MEgM5Vg6v3xtId7q1FsVZKy1cIU6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a5ea2c-568f-47a8-06cb-08dd2f5b983c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 20:40:59.8767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ALnYJ6AhMjhLXkELf8TGRsEcT4XeQO/fynq+GfjuX4DQ4BGd/udWpIPlxSKAQlUExuOgEvU0RRTJjOb13WIEQaPCu6aCF+A9shgAVMAVxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
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
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Tuesday, January 7, 2025 12:26 PM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; De Marchi, Lucas <lucas.d=
emarchi@intel.com>
Subject: [PATCH i-g-t v2 8/8] tests/intel/xe_drm_fdinfo: Also test target c=
lass with others-*
>=20
> Like is done for others-idle, also check the target class in
> others-full-load. Start printing the target class as debug so it's easy
> to check what should be compared to 0 versus what should be compared to
> full load.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_drm_fdinfo.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index f9eca25ed..7330b4330 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -423,6 +423,8 @@ utilization_single(int fd, struct drm_xe_engine_class=
_instance *hwe, unsigned in
>  	uint32_t vm;
>  	int new_fd;
> =20
> +	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
> +
>  	if (flags & TEST_ISOLATION)
>  		new_fd =3D drm_reopen_driver(fd);
> =20
> @@ -475,6 +477,8 @@ utilization_single_destroy_queue(int fd, struct drm_x=
e_engine_class_instance *hw
>  	uint32_t timestamp;
>  	uint32_t vm;
> =20
> +	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
> +
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	cork =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
>  	xe_cork_sync_start(fd, cork);
> @@ -504,6 +508,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_=
class_instance *hwe)
>  	uint32_t vm;
>  	int class;
> =20
> +	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
> +
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	cork =3D xe_cork_create_opts(fd, hwe, vm, 1, 1);
>  	xe_cork_sync_start(fd, cork);
> @@ -535,6 +541,8 @@ utilization_others_full_load(int fd, struct drm_xe_en=
gine_class_instance *hwe)
>  	uint32_t vm;
>  	int class;
> =20
> +	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
> +
>  	vm =3D xe_vm_create(fd, 0, 0);
> =20
>  	/* spin on one hwe per class except the target class hwes */
> @@ -543,6 +551,7 @@ utilization_others_full_load(int fd, struct drm_xe_en=
gine_class_instance *hwe)
> =20
>  		if (_class =3D=3D hwe->engine_class || cork[_class])
>  			continue;
> +
>  		cork[_class] =3D xe_cork_create_opts(fd, _hwe, vm, 1, 1);
>  		xe_cork_sync_start(fd, cork[_class]);
>  	}
> @@ -560,12 +569,12 @@ utilization_others_full_load(int fd, struct drm_xe_=
engine_class_instance *hwe)
>  		enum expected_load expected_load =3D hwe->engine_class =3D=3D class ?
>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
> =20
> -		if (!cork[class])
> -			continue;
> -
> -		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
> +		check_results(pceu1, pceu2, class, 1,
> +			      cork[class] ? cork[class]->spin->timestamp : 0,
>  			      expected_load);
> -		xe_cork_destroy(fd, cork[class]);
> +
> +		if (cork[class])
> +			xe_cork_destroy(fd, cork[class]);
>  	}
> =20
>  	xe_vm_destroy(fd, vm);
> @@ -649,6 +658,8 @@ utilization_multi(int fd, int gt, int class, unsigned=
 int flags)
>  	if (num_placements < 2)
>  		return;
> =20
> +	igt_debug("Target class: %s\n", engine_map[class]);
> +
>  	if (parallel) {
>  		width =3D num_placements;
>  		num_placements =3D 1;
> --=20
> 2.47.0
>=20
>=20
