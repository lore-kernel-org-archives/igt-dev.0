Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD4E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC22810E0E8;
	Mon,  6 Jan 2025 22:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGgLdnm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D88810E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204302; x=1767740302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YrxS6yzjp782dtw/ka9kJBXxlhLtmMjD3E57F6oLCRA=;
 b=iGgLdnm6wCoSEsXrKbP0H5DOuBVPObFAyR7fj3wtMimdoICFjetDVlZ7
 BUTo0Ltg+bDi5KSDnkfBTKUQvZJwl1vJ6tPAI2HWBR7GMGSmMB+o3kxFY
 70303yniuPxBbqu29jfXZlglQrnvar8lF+aXdXVsGgrHs7wwDpZhBoJ0I
 hXZ28slRcYPdFZQgI5FA9Xz2e2EQA5Ntd9V+XOGvvcx5Vi5Fk2OLr9OK2
 lCPwKrY3d6OC71jMuiM0cBjIpqi5mmTex+I5jZF4CkiJXByvnralJadls
 WLVgUFQ4jOJSTiVkgwNyLKvle0p4uASMy5Utnhd5Abq66Rc0B7wbfNfp/ w==;
X-CSE-ConnectionGUID: DAoelAZ8S9mm/GNDjYRQ/A==
X-CSE-MsgGUID: fQUxi1iRQg6UvxgopfB76Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36383056"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36383056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:21 -0800
X-CSE-ConnectionGUID: QrsewE2yRkastAb4GoHdDA==
X-CSE-MsgGUID: Wx2YHSBpTkWi6PamEGj07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107535712"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDXVOCCOVRs4KInRLISZ9G4MktX/lyHYVH+GD4abdj0TVPlkOiu9A/B2QVQpJqhatxBi7zQxoZWrm/ET6CUVzl0OlHk1EaFwowMlPVd9jPU+tQnOwFZgEEhpRwON6QNZGR2tggK1qLAm7NqAu4bmjvxuBV656e7t+/8U7U0CoW0b0WUF+W1BNxe+y2VOp7IVZLPbER6EYkh/KsYhFnOQP/vgXMbjlbzsOa71HeyeXw1Tj9zwcNzb5Cws2tL/kagltiDylb0yDrkiZn1d4802HcE5zW49I5k+Y4iEI5nEDjPKXpyhzEOktj8brDUnihGjojRSzDH/GGHBIvo2Te5eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myrjxeoOu82r6JEOYGroNpMn1xNCEvu7H7MBLIo3/as=;
 b=V9a8aGGSrur7+rog+ESzYPvygYwyuatYVe/TvyfJmyL7gRtR+HZWmBnpCpy28YffMazB3dITS2zODEbVdmuRaWdtXkH7L6l/OOkWUXiXXGxV3w2LU6iYVx5WfGMN2KUwBWrpLNhVzSvLEuk2uXI3/cNzyF/cfBW8OJwvbGo6G4xDJUtNN/l3+Afof6HCTShJetNXKAs7jsCanYVGpau1WklOSNUwg6XZN/ne4GtZMi5+7wC97Ej2qljoDMYrNp0mzFQstB1Wyhu+LzhOvAREAkgUimMaA8S8YDqokFDT1mbFkwSVAwUlovM12lzeKARyhvlbeUE2Cijf7kT1YwZXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/8] lib/xe/xe_gt: Fix header guards and boilerplate
Thread-Topic: [PATCH i-g-t 2/8] lib/xe/xe_gt: Fix header guards and boilerplate
Thread-Index: AQHbXniMZMnmc7eyCk6QXWvSHyeSUbMKPBig
Date: Mon, 6 Jan 2025 22:58:10 +0000
Message-ID: <CH0PR11MB544449CAAD029D37CF56BF06E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-2-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: e458db0e-f61d-412d-d8a1-08dd2ea5977f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mN+wZr+oVZ0ODdRbUZUjdLmDQZ/6lIKuH42mx9uLvqyLBMNulyk08bYL51sx?=
 =?us-ascii?Q?JhwS8c8izsiindHWoBsUZwUBeesHHbjr6V4Z6SQ7US+LAg8HXAENL/L94cZu?=
 =?us-ascii?Q?dBJM5JP6YSBJnLY5BTbzqCBGXeVKc4UNbuogh91fc3cGpoDjpq4GDue5RLpN?=
 =?us-ascii?Q?4uS4JFI2PZxoLqgfZgQboVb/ZDkV+vTkRsjNUONDpnjIPUG29zGjVDb8/qMA?=
 =?us-ascii?Q?BO+E0Z5ehVCHtLMIuGdgH+TFowA+cnV4vE+5FJ8z4ZDUi60RlrrtHox4mCL8?=
 =?us-ascii?Q?E4JvS8ulqo6AwXWLdLegyy3pAdWz9ORo90ASkO7HuhZUkWVgoJLOnqlAJYz8?=
 =?us-ascii?Q?9UkToasoVN9ddjqtJaeNExVRyoSt03BUA4Ql76qkwKIuD0k+4v6glSltU7c7?=
 =?us-ascii?Q?fugzSZX9GsDZ13/UIO3W81sCwt435DK5lhBa0EcdRIfBZzn54i6sy4Mb8/0t?=
 =?us-ascii?Q?ZJwxy21tXfFH/6wGg5iORY/pAx9v/Akct21h1dnRCJqb/rN4r+dwGspx4mZN?=
 =?us-ascii?Q?0un5OY2YhvR0O52h8G48TSIMYZzY82w2MaUNgm4fnwtl50ZjKOrbxW0PyTUl?=
 =?us-ascii?Q?Y/i5ZEM2ONfQyGxQY3FmeaPV1mlYH5h/3uCUIwQxee4sM1+sF3mAOjNkYrt9?=
 =?us-ascii?Q?Bz1ENgE1YoBuw8hYFkJ5gQFAp/n0OJ0Q1ArkSpdKWg9JVM4r5BrhaDsgTsuR?=
 =?us-ascii?Q?/RiJYnJGkM1ZO4zcrbDVrc5IdrmXAbAkXZ+qY3v6nk29gWNLJ6zgX67SX3T/?=
 =?us-ascii?Q?Lbtvs/n6BJ8l26p1MPxWtyx/zkZnNxYYb0pl8LyFIGyS5nYg8MTdYogwqTPv?=
 =?us-ascii?Q?ZNxOqbZ0CMktBRzoWqg7tTSxBjXnx3SL3U2WHjWXke9bCe1c40hgxVU39S3Y?=
 =?us-ascii?Q?Gpc2wH8SzQAy2qy7Ps0u9F9lIOpn8DQ+I5E4wZyPeDAT9OaTH0zSz1dgNW3e?=
 =?us-ascii?Q?KGSUSotC/ev9QYOSGIdQpks2W95srIpbjIz4a6H1JNf5fTJJDksdPWkDiaPW?=
 =?us-ascii?Q?kc1kGoBayKqd5Ie7FwbJHmuIhEXphpcRqvFVe7kME1tZF7FqnBylIgDVB7V1?=
 =?us-ascii?Q?lucS5vT9T1saGdLAYJf8Wz5EIvtbWlHnUL5V108QdFvv/Qe6HfXF9D9ZR8+F?=
 =?us-ascii?Q?zdjvF3IcYq+mWRE4UnKTWpS+ZE+gq2hVj3Rxe5kA7iE/9PErAkarlNmb9JQL?=
 =?us-ascii?Q?7BibHSKioh+V+7WIuumNEaT397Ys5DTYvTCcGfQfVeBkVilrmlaBFrCvYBel?=
 =?us-ascii?Q?erPSOcQoMGTSOEkyiIVOhW39oOcvw2YnPSEKGylGGHPB1vyQfuLem2cRYuPO?=
 =?us-ascii?Q?nEAeU4oDABBqUn4dxv3Cb2wdp2IQw98wJGMNnltqxjKQNR1cuNVNB0cdANPR?=
 =?us-ascii?Q?lE3ND8Qx4Geo1RjSEvAXgUMRJbCfVKZQ4Ma9xzAzd55+ZVGus90yzGs7mEp8?=
 =?us-ascii?Q?jy0elpGVxTL7J3HsoHoFUeDxkS/zX/Nv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vRFsvnFnbssvXhE6RVux/bJdZYjf1D8VcNVp6FEqxEg6+6pEIcygTeaCYLSM?=
 =?us-ascii?Q?3LFhNWWQvkeI6EezHue30AlVPBVLnT9i9sNNzR+rtr8uAIzJBR3Q+i+4vfw+?=
 =?us-ascii?Q?X3DcTm8XLCUVVUu6akLpeiqTrinpQqRFQmQFm83SgOrQEUoINJVQDI2sSKMv?=
 =?us-ascii?Q?xOKP7ZxbVhIjFu7gBNZCX/artBIRL3d7RrKFAanwqBePvsRfGKazL2QIbXC4?=
 =?us-ascii?Q?A4E/hNfp55XZI9HPAFJApof+Godovj10Bbz9BzzGrkKe1GTRD7RBDX3hXFao?=
 =?us-ascii?Q?ujNsQxyZ4DK43zFmQwkraxKMOTzaOvaJqFkWbf6DmwBpEsS1mi0p6EnvJxG/?=
 =?us-ascii?Q?RWpAzmaAacZ8jvOK3F2Ta45Rx7CSmJMXVXRYmXxUd2e4F/cSWPu4yRjwBKEF?=
 =?us-ascii?Q?GBuPIkYxsL3UrBAnR8j3gfr1C5qJqZvRdDn7Jkardq50RJZcFCj4KfzRdGpS?=
 =?us-ascii?Q?66fjqPBjyjVwOkMK+vyLnD8/P3K98Uw4FzfiiPNZiGaUEH5YS73A178dRLL8?=
 =?us-ascii?Q?Bs4Y9tcx6DMqpQAsEveNJ6eGQ2khOB2XiHsiXidOp77F+PTiVu/E7YrdYdl5?=
 =?us-ascii?Q?Hzjf+G/KnqVK/kK10zcs1oE9s7mcM3AHPKSzxHjLL8MAfkm7WhaTpYXqXP5q?=
 =?us-ascii?Q?KJDxbD+CAsZ0kSl1mbajNI7u6DTQTTQeDK0jA8z2uhCQ/Ml3srntBuQ15iaO?=
 =?us-ascii?Q?7hWyPPn7/5IcGFRBMzUWVIQH34paLQu88xQwPUZ9REUEMe2UUBuDFE5x8U0q?=
 =?us-ascii?Q?zoowuK20DjBJkLaEivNC95MA3kBjaP7BvyzQJOt5i2o18+7mxtM0TkL6aSRS?=
 =?us-ascii?Q?vW8KldBWLV9GQgPkkXhwjdW5lAyQIub9gz9XTAR+0yIaIjfFsooQjsdx4kOZ?=
 =?us-ascii?Q?nEtYJWqlsXG21OyS7jeKzI91H1bUPfF6XzqLQsnWkuuDWJ//d3P9KmQHoduc?=
 =?us-ascii?Q?gfBl4lTOP28kXZW5cL3ccnrKE2IvVHq3JzwPTJEOwRammuB86MLqnKffWQ/n?=
 =?us-ascii?Q?mtpY3RQSGvsSVOTSjnld+zQAIkoAmLttZnRPy2jJI/qqNdCz9wD8Zxhj9z21?=
 =?us-ascii?Q?HTZTRHG2wMrHUsu0HVZKwRWbhqGKQ2BkaFhywE8aDJWeQdmhtnayaiZAO0E3?=
 =?us-ascii?Q?dAyBG8+nm2w5JhqP83Gw6lUo75Pcsc0ZJUHhsQIfxbJcs/T9cU8TN7aumk2p?=
 =?us-ascii?Q?oi3kpeiLJhQHgeRvqSi/IOLgQmtjPKlP+9UB+qyRKqaVniDtZpfwosxDrCdG?=
 =?us-ascii?Q?Xc9N9qKm1mcdbz95ZJ8BAO2kSMcKJHrvRSvhoZmAbyzjd3Lbsa3xWveaXdg/?=
 =?us-ascii?Q?kbujsLBy0kSgz6m6izwdhu7dorBlBHyQyaeghOSyZMeQgeKf5Jl9OkOhLby+?=
 =?us-ascii?Q?UhLZ7bQZ2qRjYxaMi+9MUR4AyBpSYsYoNDLmlN73oCNrKmKVQBjF5Aq0l/fW?=
 =?us-ascii?Q?KuRyoQujwNgnlDgq+d2L16KULaXdrHluJbgP4/+C5UNzndYpKYhh4OzMf5xw?=
 =?us-ascii?Q?RAuAPA5z1aYAtG6rGPReUibfVJuj8hdnS3vO1yhQ/B40fR2C1+LdNUEu52JY?=
 =?us-ascii?Q?ySgSssc6v2U0ZxhxiBRg3Q8Cu0xkrzelY123H0Xa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e458db0e-f61d-412d-d8a1-08dd2ea5977f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:10.2663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qy0IW64Bnz+rzPDm3e4fouTWxl00fjIbigDjcjN9vtS4DHSW6LRIu5ieiKhYmesUAO1SrzZQ4h8helNAisldPje+SOPLN/TVpB8q2hYZizs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/8] lib/xe/xe_gt: Fix header guards and boilerplate
>=20
> Add proper header guard and remove author from comment: authorship is
> maintained in git, not as comment.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/xe/xe_gt.c | 3 ---
>  lib/xe/xe_gt.h | 8 +++++---
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 1f4b42ed9..53554beb0 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -1,9 +1,6 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright (c) 2023 Intel Corporation
> - *
> - * Authors:
> - *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>   */
> =20
>  #include <fcntl.h>
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index a4bb85679..756b5f38e 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -1,11 +1,11 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright (c) 2023 Intel Corporation
> - *
> - * Authors:
> - *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>   */
> =20
> +#ifndef XE_GT_H
> +#define XE_GT_H
> +
>  #include "lib/igt_gt.h"
> =20
>  bool has_xe_gt_reset(int fd);
> @@ -14,3 +14,5 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t=
 ctx, int ring,
>  				unsigned int flags);
>  void xe_post_hang_ring(int fd, igt_hang_t arg);
>  int xe_gt_stats_get_count(int fd, int gt, const char *stat);
> +
> +#endif
> --=20
> 2.47.0
>=20
>=20
