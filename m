Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB96E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE38F10E1E9;
	Mon,  6 Jan 2025 22:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByeAhylX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235A510E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204323; x=1767740323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GnWjy5KaNiXVEYj0POTxb7TfUBzjVd8ms46bzWLy7Ec=;
 b=ByeAhylXTq4H/G//+dh4axiwuIVQsqCyV5ulwIa2KfChPViWtrzsMedy
 OSxmhoMnIbjA3wvkzD4AXUogYCtyQoIjD3sZGKlQk/wDFbIiTKKE1hZ6C
 wqb1Ry7a+6uZLJwXAtiWbC5lL9K6nECke9OpdkbpjCQTXR+RHeKAEoky7
 AF9fzd+F197AQUsIB1TuZ7tJIa7kzyNw+amDAIsjGzkW779HEfHsBkItp
 7TjtU0IS7HW9S1yrd3Yu2Z7CgGBkknnmN3hOwZmj1yUWDKH/ny2ItA0eQ
 AQU3A8McreXR26q8xKyBfKtwKf/fgDKjpay5eJqEbaJgc8rK5Zjntgz3y A==;
X-CSE-ConnectionGUID: j1Iwkvt1RCumYbH4ZG6kjg==
X-CSE-MsgGUID: qOf5jSopR42mQfXBUacOtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36479811"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36479811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:43 -0800
X-CSE-ConnectionGUID: B+3Y8RDqRhCqAZtnOUcqbA==
X-CSE-MsgGUID: PtG973RHSu62awoW67wHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102440226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVNWsI1A0X/xQDGf3u+BTszI7Xd52dRkrocD0Kz+SamVysro88oc5fJN6kPSoxfcNOg3kcGSLJETHFZiaq3Bkb5Z9KaJgJoQQIsMSFZgFeEfo8LKJInvbVy/1xa2Pj1m1c8HsSpoN4hQfcUW5BfwJxNTQkrpg98UfL7SH6YQOkPL9Qo57y89gEgzvc/l7/9Hb0pE/wrbMaHAlxzh6DyxlhQBqDH4PnzU+4MiTeHfmaGuMMf63o7DAiSLWeiyMOFeMLjZ/4SBEG42VyYhLWYrNLk6O89x/8wCYAex5NLLDSyOMRiTAJq/8z/EkXyFtS8bAnPVm/gfI3snDxUUFkAGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqdIAn4UwbblhJ8nTimcfYk4sA21HcVEEWWvDaf++Mk=;
 b=FuYQce+EbJeZ1PqtDgA5a+W9FFCMC3jA8Cc4XgfzDRVsH4VJ3lchmCGSeUqeG41xjL0Z46b7pGEvvG03Swy0kyIRgKDx8hki8P/ESWWh5ArvZijMX2DkzhQGvHtrfJvttlQZPAmJ12ysN6UL5agcUtF16HmFPZgOHXTd6Oes3YBkOLnbprqRnvPzh2pwxPwGHSKJKdayTborHZVQvmBPhhL4qfHcHGMOKIcGYXvzro8dc95NFSCPnQV5wIjziG6Z5MZk5Q2l7Rp2PQ4AJ/HwqIUczjONCVma+1zqFBbm7t0CbtR1xLfSCEGVVlxCXRGPjBPDqG/yQHY/h8D2bD59IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
Thread-Topic: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
Thread-Index: AQHbXniPn/UPDUdnxUCNkWsGuQxw2rMKVQCw
Date: Mon, 6 Jan 2025 22:58:26 +0000
Message-ID: <CH0PR11MB54447CFAF69F0029702F45E3E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-6-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-6-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 9a7c07c8-7856-4d03-8908-08dd2ea5a14e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6b/JHiesZMfyiIqIazFR5tJrS5eK0omYPKeZ1Bj7Zuv9l49F3A/zQpDBP6GN?=
 =?us-ascii?Q?mXKKWdgk/nli5b/EyzgO05CB4MUGOWu2v5h40y84rrY0vDo6y7vP3+2PW0PW?=
 =?us-ascii?Q?8qSb1ldEByP6TEh+o++tCl+vOcyKgLL8aM/qkPWr/ajduJg34O6CkNA0KP7H?=
 =?us-ascii?Q?6SYPqJXxA/WYzXVnNFq1XgnYt2ZEzuXzRvTgvmY3fKnju9OzBlMh/psSBG4f?=
 =?us-ascii?Q?TXDmN/PogGdtvLuulcrzk+QaHurFTQqxSjM4ZW2YtAQ8VizlT4lasD+qy4O6?=
 =?us-ascii?Q?JfJYJ+5udJVpnY3+qQ8rd3m0lV0h4KY1wRF7UfLObKApoVuYTo5L0naFbBya?=
 =?us-ascii?Q?KFQBOuGro383VgFiGiFJi6wHdUPIsU4urDFy4zSDv1ZA5HgPX+nguBHBWRp2?=
 =?us-ascii?Q?8Yr+/KdyoCgSoIhKPuoNsCT3+DXZbGoufNcSPSuTGNzVu+Zh6T3ZN+A0LcnD?=
 =?us-ascii?Q?F9J3Rmt09XZbJj6XAi9fBk1hboDUO96Notr4uEf7jjf/uG5DmVIDkVTsAUJi?=
 =?us-ascii?Q?V566xcj9b1EtYu56TTW4MZI+JG28UuRSD0hZXhsBL4HHEUsgNK6VN3wMk9iJ?=
 =?us-ascii?Q?sReoQ2MGAf/ZawbfC+MRt19mUdXxVrmA8VoBZCXY49sFdVSGA5PlHXSdYxc4?=
 =?us-ascii?Q?FK7DGiwNCfB4LA9b8/BLSSoC0iPv3ySxLR/75YBefvqDReEgMHyDIkTkn/WG?=
 =?us-ascii?Q?x2STn7OuUZ+3+U2lPf1ECqQjJjDjRmJYWfToeTG7eTVHzJGSBp1KfTnQS1Mz?=
 =?us-ascii?Q?ekpSqK+SSUHiUXCoud8XJm7P57FoCPnLH4rz9EdMrCWus93Owr99HVHkTyWy?=
 =?us-ascii?Q?vv1nZ9FiY/w8KOAAcurw2pHxc4QXBLNaHnx6HhCgPQ3mXrDdSY2H5bH2WDYy?=
 =?us-ascii?Q?u2Qo7tAISMvtQtuugRmhbUFOrocsPPLrkflXuvdpzTPnj9NhNGXSMKVBo/Kc?=
 =?us-ascii?Q?OsmbZZD5j9C9aKguYl1C/Qvah6hBPq6dICmgvz9qMza76tpwB4PKKxgtCYzd?=
 =?us-ascii?Q?vgpNfJ/bzsrGyvo3PwW4q4q19m9JYiLkO4RLqtYrej8In3+yJ5SVtECP5rD6?=
 =?us-ascii?Q?Nju+PFkN11mFkroVceIfjGFe1ba/22L/E8DnNyji71OQQc4162pfB6/+Zk/b?=
 =?us-ascii?Q?CmtN5R3OW527PSmzNSHFIXudQD2e0PfkTUGHbuOutpEShNJDD2P/XX/YIGsl?=
 =?us-ascii?Q?jA67Ev13JIMFHVg92LMLp7FWS8JEiF9AxipXqadvL8YAceINrP4PsgN+mQqK?=
 =?us-ascii?Q?HXhIdbrKzibc7BDFO0576MExmghWTxxQsfwFXwdCf8/ttN/D7HKfxOcfUQxJ?=
 =?us-ascii?Q?ouzlNMvjDQwBPpbt4InA3pekKMltJj24k3QhSyPJt0qN+kZ7UKF+0ZXFEzwY?=
 =?us-ascii?Q?9X8agmsS91WYOQWJhc5bB7niwOkIdzohmm/dgCZHZrmzo8O4UMwkQ6UlCY+K?=
 =?us-ascii?Q?dTWq1H6JU1VlxoUgm3LWK638QyKR3tXB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6+dsSjcSgsQsTJUIZzew7tblQDSsXyR2THHRzlfRB57cq5H5U4IHBEXaeoRK?=
 =?us-ascii?Q?QEBxNpE6GNpWuwV59NXYArDyBVHQRQCtesipG4ddmxnfM0Rik93279eSaApB?=
 =?us-ascii?Q?MhpclfguAvsSpp5fZXe95fxB9zYZLoEz4Bjoha9bna99lv8rcT7tb3JYiJ48?=
 =?us-ascii?Q?uf5ympY8kAZ7nUmXt4Be6DTWXziQn3KPjcW/K6RVvkBt81KP0BfbQxhoozaK?=
 =?us-ascii?Q?M5wglQUfXPC8CAo+txcNjbaFcESDLiWvxtIhh3iNn+ZepO/xvFPs/tKAJZb5?=
 =?us-ascii?Q?wubwEl6nBxtmSNzoleRd5HjhHHwL9B+RjWa1gtYkITt+I8/moCJmc5y3WWKr?=
 =?us-ascii?Q?hTrrhrx7zwr9U97hLzxbYzdelxOyUiLVScag+Toc6WgX3b4W0Xs39YUP+2qO?=
 =?us-ascii?Q?gNZhayGC4LlHPwUMEZdVPmutwktbGzdkY+e70fI9Faa64VeynkficUBym7lq?=
 =?us-ascii?Q?AIPTNdbxYoDR9r1UU4VC/ii4bPd4j0qCCO32d3PzAukKeL9xBEhveYpsTrpN?=
 =?us-ascii?Q?deNk2mAQbpB6dkrWA5wdnir12CsLiXRsnZ2co0hmN0plAruH/K5jyVCHEXCA?=
 =?us-ascii?Q?MNUoy7jiRbFexelzs35lj3ek/hGJSXtcpEio/7ugDo1ql1j8LpfPpbTPXII9?=
 =?us-ascii?Q?YhMfxCS5w56cGIBPTMwbgXNzA2JaRg/yFGYl2w9sH1RJTvGwzRQiZNnzI2gt?=
 =?us-ascii?Q?6bIcKP1ek1Gt6aPHEGid4xbuOmQfAzfXO6d9RbAQ+r6wgUQYMbeuK93oDw7t?=
 =?us-ascii?Q?Bj83atzm7HXcvHf0cg7UuUDrcsghj1AAB7Is6pbGxuJvTJ/bOK8NyzHqvEh9?=
 =?us-ascii?Q?Y9z/3qwx1sgY/2j3kOqJ9DlElGuM7nsfbo8fkajYZuWtfegWhGL11dLDfcX7?=
 =?us-ascii?Q?cntooNTnRpUIuftc7tQwcUKec7lfCbgCM2CGZDK5JauH2sS6BM7g4NPJfHjx?=
 =?us-ascii?Q?o72PTjMqzT/e/0MR3kZE3+HG1xxZZDw/tXZbHv0tVThxMXNh0zx3tnUYjAH5?=
 =?us-ascii?Q?fnnNtKeaEzH5bsbod9ed8Sb70gwvm0S4GE+2i0zaSkdOM0SqXL44WIMWLpCc?=
 =?us-ascii?Q?J9pBO5FbvOL4Ar++9aX95vd74nCQy/d3kEE+FqLJ6O2E0p3ChmzGNy8ITEoE?=
 =?us-ascii?Q?8hamF9sSLr2Q3Wkzyj7FeAe+lC5Tj5Ei1yQmufarFbSkyzOCnVjmGzsD4Bss?=
 =?us-ascii?Q?wlvYl+Sw1i/NpDLyY5EYy5KSqqzEJvCL+0hCmrTcFy94KK7+YgHrrwU5/UDT?=
 =?us-ascii?Q?puN86k+MKugc937dm/3knEFwryaIN2DOjnhkJcGOijXzKv7KvREylmtlpr6N?=
 =?us-ascii?Q?bRz0v9P98/s41dULjEzBPzQHU338qjhcYYFucV5ICH7YgCJ4FtcE0IHG87ag?=
 =?us-ascii?Q?wTIstFwN8ZnmmDQVaKn85imowAa7OBHxYUpHw3Z6+BmG9RdPUkK0t7gPG1LK?=
 =?us-ascii?Q?MM/rTq36UTxtKuYsVGxD2iCIjUVriIcPCZoiBNLlnYO3yqREyojpmjuHvSgd?=
 =?us-ascii?Q?NQ8sPjPwWAPj7ITGmX1wD7jRoLRBqwxW7Q5eAr2vDoRm10tpvipPVK33Y537?=
 =?us-ascii?Q?v0kpe7DYh1/6xn6rJ5INQPyjoDyqJv5i6qBNQWri?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7c07c8-7856-4d03-8908-08dd2ea5a14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:26.6927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJkwoxhEuEd3wfBq9/1KU3wSOXwGMPQAOXKeGGWkXsQ4IiIDhyb1L4bomfG5GzCPFaaDtfmyBfd1jjujz4H1HclBEoFVJXDOYaRzA6Jl3YM=
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
Subject: [PATCH i-g-t 6/8] lib/xe/xe_spin: Move declarations around
>=20
> xe_spin.h has 3 abstractions:
>=20
> 1) the integration with igt_dummyload
> 2) xe_spin, the bo to be exec'ed somewhere
> 3) xe_cork, that resembles more the igt_spin, abstracting the fd, vm,
>    bind, etc
>=20
> Group them so it's easier to understand each one.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Okay, I think I get it.  We're bundling the various functions declared in x=
e_spin.h
by their purpose/interaction with the various structures, yeah?  That makes=
 sense
to me.
And even if my understanding of the purpose of this patch is wrong, I don't=
 see
any harm in applying it, so:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/xe/xe_spin.c |  2 +-
>  lib/xe/xe_spin.h | 54 +++++++++++++++++++++++++++---------------------
>  2 files changed, 32 insertions(+), 24 deletions(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 333f8d7d8..bb6318cef 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -232,7 +232,7 @@ xe_spin_create(int fd, const struct igt_spin_factory =
*opt)
>  	return spin;
>  }
> =20
> -void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>  {
>  	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
>  }
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 01f45eaeb..7c95996c3 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -15,6 +15,15 @@
>  #include "xe_query.h"
>  #include "lib/igt_dummyload.h"
> =20
> +/* Wrapper to integrate with igt_dummyload, aka igt_spin */
> +igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> +void xe_spin_free(int fd, struct igt_spin *spin);
> +
> +/*
> + * xe_spin: abstract a bo mapped in the GPU that when exec'ed will spin =
the
> + * engine in which it's exec'ed
> + */
> +
>  /**
>   * struct xe_spin_opts
>   * @addr: offset of spinner within vm
> @@ -30,11 +39,6 @@ struct xe_spin_opts {
>  	bool write_timestamp;
>  };
> =20
> -struct xe_cork_opts {
> -	uint64_t ahnd;
> -	bool debug;
> -};
> -
>  /* Mapped GPU object */
>  struct xe_spin {
>  	uint32_t batch[128];
> @@ -46,6 +50,24 @@ struct xe_spin {
>  	uint32_t timestamp;
>  };
> =20
> +uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
> +void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
> +#define xe_spin_init_opts(fd, ...) \
> +	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> +bool xe_spin_started(struct xe_spin *spin);
> +void xe_spin_wait_started(struct xe_spin *spin);
> +void xe_spin_end(struct xe_spin *spin);
> +
> +/*
> + * xe_cork: higher level API that simplifies exec'ing an xe_spin by taki=
ng care
> + * of vm creation, exec call, etc.
> + */
> +
> +struct xe_cork_opts {
> +	uint64_t ahnd;
> +	bool debug;
> +};
> +
>  struct xe_cork {
>  	struct xe_spin *spin;
>  	int fd;
> @@ -65,27 +87,13 @@ struct xe_cork {
>  	uint16_t num_placements;
>  };
> =20
> -igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> -void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
> -struct xe_cork *
> -xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe, uint32_=
t vm,
> -	      uint16_t width, uint16_t num_placements, struct xe_cork_opts *opt=
s);
> -void xe_cork_destroy(int fd, struct xe_cork *ctx);
> -
> +struct xe_cork *xe_cork_create(int fd, struct drm_xe_engine_class_instan=
ce *hwe,
> +			       uint32_t vm, uint16_t width, uint16_t num_placements,
> +			       struct xe_cork_opts *opts);
>  #define xe_cork_create_opts(fd, hwe, vm, width, num_placements, ...) \
>  	xe_cork_create(fd, hwe, vm, width, num_placements, \
>  			&((struct xe_cork_opts){__VA_ARGS__}))
> -
> -#define xe_spin_init_opts(fd, ...) \
> -	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> -
> -uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
> -
> -bool xe_spin_started(struct xe_spin *spin);
> -void xe_spin_sync_wait(int fd, struct igt_spin *spin);
> -void xe_spin_wait_started(struct xe_spin *spin);
> -void xe_spin_end(struct xe_spin *spin);
> -void xe_spin_free(int fd, struct igt_spin *spin);
> +void xe_cork_destroy(int fd, struct xe_cork *ctx);
>  void xe_cork_sync_start(int fd, struct xe_cork *ctx);
>  void xe_cork_sync_end(int fd, struct xe_cork *ctx);
> =20
> --=20
> 2.47.0
>=20
>=20
