Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B001BC83000
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 07:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0C10E203;
	Mon, 30 Jun 2025 07:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9s1F4zR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB910E3A2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751269538; x=1782805538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tek+aKAwKU4+rSCpoToyHASs7rMKJDGromNeS2Fxb1U=;
 b=V9s1F4zRq02J2gOFCIY3+PnXFZyqNteRFLgbQHCEjxw7YZA9EY4HAbma
 GYmIVRidGA92sKvrq5u+gTspqUMUpUs6i1bhyKoKJHWJlCu5IamYznoFa
 WFnyDDj2Xi7KSMvB7IjtifLNWYPB0BPpgD2vuCe1VK64nTZMlsbmmYpxb
 RSowF74567dwY3liukR/mrGipNeARXRcS9DtK5z1rpUxGWgSDvFrU6tMj
 76Q1Vp8rZrXUnwDqueOWO+EvxoIAmyb0QPmGNyzMp5z94RvaI56yNZXtF
 RAw2nKp+kuK6FO+lFKkHB+vbSLb4bm/wdn8iWmUD6rmq+bzn0l0waqcb/ w==;
X-CSE-ConnectionGUID: Eal2jkeTSWuGVp+7qX9lCQ==
X-CSE-MsgGUID: 8+LJaqyRRTq0KCVRVAFA1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57290849"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57290849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:45:38 -0700
X-CSE-ConnectionGUID: 5u7IUgXLTIeUgxPjO1Yrgg==
X-CSE-MsgGUID: sb3mcz56QrKEfQ1XaJITNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="184405712"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 00:45:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:45:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 00:45:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 00:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGEY2euydNxX1Itn9yheKJf0yS97R3wPxhv2VlBmAjrtrNEFjv2qgN5qqdINQ0K4u9opvevIPjhP5rGTI/ASnh2ayDKXIxM/N6hzpEbLk5nCOnh6E6KpCGvvdPp1R5GjmBh0GZM+S93f+/TYDYkybZQ6DH8fh6qC/WW+r/QSwyf0V+Fx6ViMotvjUTXVYJzUphNcFm+VvJvU/b9zW1qB2OxDyqNY/qKvO83eTOKq5H8Z0dP5lYoCN8RAiHjoc6OJbu4dKeBk+wLTZ8lmn49Wfo4ovDL/f1BB7ZfBbW4TnahhoU74ov9Cb9JKRWhtlqcqaU2mMpFl178eNNokPQn+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77keDxEh7tpEei+TLGTpt0eHZZXnkbKVpsQ2sv5jLB4=;
 b=mgStX3xwDMcDhqzE9X2TlcdnixVi793U/mPNo/fl5l7em68D5bLW+KqzKHuRhVEfaDrYJvfXYzHB/FQ4jYKGwbu9ocol5SWVIssbh0PNj2T+uVZIf7iDgj7t6Nl5NXhyBr9/3a00g4kbJDuZJHoU3KD/iLr8poKEKxXSO6ldh0cVMAjVgrTSamZOYEo7DigqYTQao90tvbQefJxT6Gb8Pd4PEyQ08h1wNBpRD45ZdIwPt+z0Z9A5TtIiU77OJkfGSG/MU5ZJ6PXTHnmqRC+C8PTYOGBmfzdB5UxwL8VkyOv2ichUK2FLWXY55627mUASviqHlVE7EQMg1FYnmM1U9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Mon, 30 Jun 2025 07:44:52 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 07:44:52 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP
 connector
Thread-Topic: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP
 connector
Thread-Index: AQHb5cuYtEpWks8gU0C5oye3mUixjbQbVGZA
Date: Mon, 30 Jun 2025 07:44:51 +0000
Message-ID: <DM4PR11MB631210A4501E81F227AB75519046A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
 <20250625123402.3929358-4-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7959:EE_
x-ms-office365-filtering-correlation-id: c8d9790a-410f-4453-e326-08ddb7a9ff7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CeRcr2gGMTSTHk56EacAJmcCebD61Dc4P2Z13xS4zHNJ6v39m0llkVjvwrFU?=
 =?us-ascii?Q?lv/Pme+JLuyGk1EwQsH0eZIe0EXyZM2HKSjDOUQclQZs3h0t4nu62KM+ArHF?=
 =?us-ascii?Q?adhU4Q9klUNBheFrYMhf6q0P6pKxVaCtUeiFlWDhHZhIbR/wd5ld7QX1qwSh?=
 =?us-ascii?Q?I6yru2myesrOIhcGxt8epDIuASqyAuX7Y/Wwki6NwnO+EvyJeO3wlfDwdZlz?=
 =?us-ascii?Q?Pk908hUzvlIGnPxUoUthUYnreegxW8+FIr5Yy38/yB+XEun+KjmdJPTEklaO?=
 =?us-ascii?Q?+Ajt3N9+Qqh1fSBZ2q8i4/34KkpmgOSyrqYKsRc3sD4VaxhJRlKCqkJzOevj?=
 =?us-ascii?Q?w3BVNLrhvcQVX6YCX1xD8RiDecKgKf5JgxU3gdV8BgLhxXqTAetOIAv9AVWe?=
 =?us-ascii?Q?nVmhoBC7+8STiroStYzUSUVHToWhv0y6I1vpJiJMuwT6fOaN5+A7J/u7KJBz?=
 =?us-ascii?Q?HXeIXhPK9TqHF9UkjykUV07/fPXdcIGr6jE/SavOvj/R9una2J+zAgNXfDEy?=
 =?us-ascii?Q?v++p5tp6bqIez6Vr7GknVgi/x7CkuI7ykvkILcSB2k47sjO1EkI80hPUTJmi?=
 =?us-ascii?Q?qVrJ8R+53BH9mnNangUP2k70bITyxRpyhdPHHdlDLOJLHhl0zqiUy0tXZWGl?=
 =?us-ascii?Q?U7wQZjAeBmIyMl4gQ566BxHAkD1XUMf1niWLxECsz/Tf/mkC0z8nLhcWIlI8?=
 =?us-ascii?Q?KRtm6fVAOHhs78ORRRqmDYt+N08AI43+mJ9vWoqt386tPED+OkPCwkm8EMp6?=
 =?us-ascii?Q?RQPThXJwwy9eaXt5yh6UT56wkhn5mw1OqrT5SKBAsbI768UhpVsVyqDsNuTi?=
 =?us-ascii?Q?KLbTi4ikLU9IOJqxDmEfzwItn7zJcXKUTuVFlCvcwxRjFMgYSEdct9mKCk5L?=
 =?us-ascii?Q?77sR50Sc57Nlim2QdLxhcU6yTjP/FejqLQxqigVrF1OdztQQGv53z77I0nJO?=
 =?us-ascii?Q?Toj4wJQEKaUCfssG2MkEqqzUjyjD9o7dQxfD15uJO3mDEGtDbmTlDk+Ed/ZI?=
 =?us-ascii?Q?53cH+hdiKq7XFf1Zk+t3MviGOj6+Pk0rKC4Jb97QQX8ol230C0nCaoPoHNXZ?=
 =?us-ascii?Q?0xQ6GevwyzgdOpP4aYEYszZEvCIwIV4Arb43kuuEUp9z28yiDACXaKpZAOHD?=
 =?us-ascii?Q?X7LAtq3CUREZ6IOMr3RMq58xPIf7BnkpsRME5ItdxG9M0muv30gc5c425fA+?=
 =?us-ascii?Q?NhbvNqzkYyIApGyk/0SEdRabJ3bp2gbJ9lrfswt/KIs0qN6caqdGidIZfi8c?=
 =?us-ascii?Q?44HuMBej65OkjTIQ22b1f6wnsjbY8DWyiCj7bSM432JZMft6VIHp6UWxIpAY?=
 =?us-ascii?Q?8yKlLEn/4Md145XVpsrt75eBlVhlP3LS5XYhEloWObqCss9Ma3D9h4/7pLu5?=
 =?us-ascii?Q?iXwp0QRRqUR6KgG5EselEoYSa+YO5veyS0yLOhaLnYjs5SPID4gEhiL1MJ/3?=
 =?us-ascii?Q?7u7N9t11YhN4MIv4NPsy+wfrCA6fV6Kti4EC0FFEbJQcXr2epuAePA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uEQqnZ+2zz07DdyzeGEfS4QeOKNSCPznLYJphCRJsoziNrRLkx7Ylm5fbGhF?=
 =?us-ascii?Q?6nAEioy94zgJJ2/nmYTfkeVmqkqnvEqc1wXA4TTaVDSdUe9cUYoTr47Kf/gK?=
 =?us-ascii?Q?zuH6ZBTiEl9LUk7HSK+bg2Lsk9zEWD4VjuxN6oYN1vNKRuULSCFLl99TPW4z?=
 =?us-ascii?Q?Bpube5O+RUIOlb5MBMiVtsXXBNKUsHyYtS/lptlPuU2PP/NO0PKRQNBJXeS1?=
 =?us-ascii?Q?MOG9FW+huGLUFTPnXOqWM9X8fCQuVv36Ifd2NDP/uW5UqStrIijnrUueMTsW?=
 =?us-ascii?Q?JXssTtJ0Loj+ScTLmQpoHAj7AgfIapmc7x1PZ+RkDX0xzyB0BKMUUaRQdV/q?=
 =?us-ascii?Q?l6TSzkOpYpAtjl851Ef3F6gP5VRVrWgvDA82kQq2vCuunI/noxmynBEGe22N?=
 =?us-ascii?Q?cNWX63GIFm4wbaCFsnfQ3O5sQnT0JEjgsE/+Y7FfdiVj2cLpSI+p7MdWfhcD?=
 =?us-ascii?Q?TbvIrwcvCLGknY0tXqGGzFQ4b3ZqTWyrlWfGc2FliPcmeVXgCFZPmk8pZEuj?=
 =?us-ascii?Q?EoUm/82aepDqmqttukbUToGjQ9PuEv1qlpzo4+fYxxBj2oDBGJpFexX1MmCd?=
 =?us-ascii?Q?uMYM+NhiiUQf1885SLN4q/jmW0aO91+3FOBNcU9rIKYIwdfF1FABBB22C2PA?=
 =?us-ascii?Q?IvYNkSor5zp9ZxBtFVx/HvGc20OQ54ydrTxfFBhsa95cunBHk8qG3L4/Skjo?=
 =?us-ascii?Q?RMSkYoKHU0odosM9rNLMRO7M/tNPfxkyJKr9SRx9FTLpGtuaK7e2dWtfwldv?=
 =?us-ascii?Q?1cKKgle9rstx/U35LYFhwBkPDZbDbQOuXG3ykZolEnOeSsksvR6K3A+NVveJ?=
 =?us-ascii?Q?zYT5DzQBxSMMvrpEqVUZ+KDSO+QO8pTKrYKN9/4PqYZgfXcUdbFt2jHXs5xY?=
 =?us-ascii?Q?+PDaSOaknsFUB10yj8k7Vph+ytx5QELHM486eRhFvECwWuvNloduRPHWdAqJ?=
 =?us-ascii?Q?gxkEp7gJ7B8oZelD107Y6QMR5ghrCj5/2gNFhGw3rCiADD2wH6dxkWOIW1nm?=
 =?us-ascii?Q?L+MWGfIhUEZni0J+lbQqd4zrn7BdDGGTMTH6CvR9CZvXHan3Rs6xIzlbuWQE?=
 =?us-ascii?Q?Q2mm626elcUhb5Wjq5u1Lqbtd5dgFIF8uTxN/e+ujwCvB5Y/YR0EnP0FSA9Q?=
 =?us-ascii?Q?iinMx/crrv6Pj+Vfmt3lGXmBVRvh2DybZJEkh6fSWHLwMIacH+axlO3E9qfK?=
 =?us-ascii?Q?I5AjLt2Ke9CAq8hNHM3TrI3GbW3Zof3BAJ08b0SVTyMuDChsty2eTWoGk0xb?=
 =?us-ascii?Q?bAdmfFs1gxgTWwLAd9SyL26p7rVMZ1AILS1oIcE1hfwNh8ASYbOvPAScN2gJ?=
 =?us-ascii?Q?t8utUNQeYwc2kFTeSLeE7L+FmGEW5ZD9nXtJjLXi1XhHpdeUKXjxLEpoH9qp?=
 =?us-ascii?Q?QJbWK/HYC9hwMIVhAijYRulmcamjAEhOdq/PkkvOvKJ4XlBtprjCA4sWwm9c?=
 =?us-ascii?Q?n9x3IEPqaWv1bI643OOQD09qT8POGI/GEKno255YU5ixlS0sf5XHZ8bSYtSX?=
 =?us-ascii?Q?pEyfgGbKLqVKdwO1jzpVx0yHEX72O1m6IzCk3ttggKKpfyZ35VqHzW137Adw?=
 =?us-ascii?Q?kDlqt/M0CREvd6LtE6U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d9790a-410f-4453-e326-08ddb7a9ff7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 07:44:51.9591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YXsHG6TpHPg434seNrupdHBdr9uuBG7xB4GtcGctokiZgqUMy55tqSGAfZYPOGIXBt0zsHQmvwHH4HT4KT4nIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: Wednesday, June 25, 2025 6:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Deak, Imre <imre.deak@intel.c=
om>;
> Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP c=
onnector
>=20
> Extend kms_link_training test for eDP connector.
> non-uhbr-sst subtest expected to and skip expected for rest of the subtes=
t as of
> now.
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_link_training.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_train=
ing.c index
> fb9b42608..3793fb84b 100644
> --- a/tests/intel/kms_link_training.c
> +++ b/tests/intel/kms_link_training.c
> @@ -260,14 +260,18 @@ static bool run_link_rate_test(data_t *data, bool m=
st,
> bool uhbr)  static bool test_link_rate(data_t *data, bool mst, bool uhbr)=
  {
>  	bool ran_any_output =3D false, is_mst =3D false;
> +	bool is_edp =3D false, is_dp =3D false;
>  	igt_output_t *tmp_output;
>=20
>  	igt_skip_on_f(!is_intel_device(data->drm_fd),=09
>  		      "Test supported only on Intel platforms.\n");
>=20
>  	for_each_connected_output(&data->display, tmp_output) {
> -		if (tmp_output->config.connector->connector_type !=3D
> -		    DRM_MODE_CONNECTOR_DisplayPort) {
> +		is_edp =3D tmp_output->config.connector->connector_type =3D=3D
> +			 DRM_MODE_CONNECTOR_eDP;
> +		is_dp =3D tmp_output->config.connector->connector_type =3D=3D
> +			DRM_MODE_CONNECTOR_DisplayPort;
> +		if (!(is_edp || is_dp)) {
>  			igt_info("Skipping non-DisplayPort output %s\n",
>  					tmp_output->name);
Can we get the igt_info aligned with the change.

Also can we change something like below : -
static bool is_dp_or_edp(igt_output_t *output)
{
	uint32_t type =3D output->config.connector->connector_type;

	return type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
	       type =3D=3D DRM_MODE_CONNECTOR_eDP;
}

Then in loop :-
for_each_connected_output(&data->display, tmp_output) {
	if (!is_dp_or_edp(tmp_output)) {
		igt_info("Skipping non-DP/eDP output %s\n", tmp_output->name);
		igt_info("----------------------------------------------------\n");
		continue;
	}
>  			igt_info("----------------------------------------------------
> \n");
> --
> 2.25.1

