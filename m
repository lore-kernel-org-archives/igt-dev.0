Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47264CA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E685D10E153;
	Fri, 29 Aug 2025 14:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jy/djFIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D578210E153
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756477299; x=1788013299;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X2187rhIELvw1KMbOPZA9IhkDOyG5dGDG+HG/789thM=;
 b=jy/djFIPizY3UufoFcI5Myt9c1GvWD59s+B/qBrGud8eUhpyJbvFmYCq
 Dgh2ivLRwZ1MIjErbskGtb31TUb0/RTqnNeItwHsbs50GECGIA8tuhv9a
 cOYRTtgv4/60OPMjRlbjZEIwOwcx16Lf2NTb6qoQyjWOdMmY1tK7MJttB
 uIr2r2+d5vhRGMo3BqG4rFvkJMqOPdtg6zLb6FVEaPAOBjdqnOYPfvIxz
 IcCbHRGSU02wJEjmxp2v+V/nrB2HNo6nYt9tHtwuSseAO63GPR1zbT9KU
 0i07Qnw6Xamtc/RBU5IhSzbDVCTnab85Ek4RD2JP+FYAy9lz7WQsDj1dw g==;
X-CSE-ConnectionGUID: Ge4CHvSmQgiJXKirhZvuAQ==
X-CSE-MsgGUID: 4+YmbEUZSCymfU0omz/tww==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69037427"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69037427"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:21:39 -0700
X-CSE-ConnectionGUID: COdZo4L4QOSyzW4OXTxMJg==
X-CSE-MsgGUID: jqw5w1BNS4aXh/Ew35nrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170560677"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:21:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:21:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:21:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItCzP+a1ABKtU3ikzVgG6yHoqXOOvYAR+eGbQXZQ5hKV7odgs4Yts3xCS9UamKru9LAMNOZDFp6yDMe93ErmrRUFJpNYN2Ebj02HnL+U2MJwPsTUE2lSTlhXAwOKSF4DoHkJrfLOyvkl3Rcs2Qab8QYBr8EnB7coj95LO0gpxSyzWTWlTeUB/HubVITdccVqBqIi9Dyht54tM3LXDTDSCwcwcTV4RsxCbmZQUKULKDlb2DH/ZJgKB9iCs/uk3oJCmsqognI5ReJq0TepZDcg4y2h0hs7FpWmvOxKj1TbUEMzV9zsAnwaHnaAke75geTGSlzh4FAOCNf+9tjx19OQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vABNqe8i7/9z0lEaSk9NiA53p/8U+1zxmmlmfZXUFQ=;
 b=N8IHogPV92CRqIABmorKtWCj6ayhoQTKtuQoJLtZWaR9Hau9+itbXBjcOVxExP4We20hhJEdEtNRtOXqcp9TDhbJy3f8khlaAd2c3foK17bJZfqbZackI9voP8JcScwce3DJX0prK7LliYnj3yPO6vkyCOvrncLfdjjo4o1Je+WxNG1zONXF8SDRB5xZ5Vs0C0k19Vhtp8YrUGuBGTPOSM7OAUN/iYqBJr0hJVFHS3hGffrJDai4saS2jug6UQdZTPAr57LiGH58JtHwDBnu3sKPpS/MI3De3HNAmwM7KgcMigKGaqEA9tdAu0zQpnOKR2sbHcIhBIvEd9n6qVdVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 14:21:32 +0000
Received: from BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c]) by BN9PR11MB5529.namprd11.prod.outlook.com
 ([fe80::477f:f3d4:aecd:5d0c%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 14:21:32 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Add
 preferred_loc_smem test
Thread-Topic: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Add
 preferred_loc_smem test
Thread-Index: AQHcGDz+d0kwkLo5EkiQY/mBd+J9VrR5rb+Q
Date: Fri, 29 Aug 2025 14:21:32 +0000
Message-ID: <BN9PR11MB55298E0D159945097DFF2CF6843AA@BN9PR11MB5529.namprd11.prod.outlook.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-5-nishit.sharma@intel.com>
In-Reply-To: <20250828165817.97661-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5529:EE_|SA1PR11MB6758:EE_
x-ms-office365-filtering-correlation-id: 459d423d-9ba4-4966-a049-08dde7075a3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MoD4iLi+hE7ZlC6CI2uU3Khork03dor7mbhz822Jq/xPtxzOPQjjZ8p2B/fV?=
 =?us-ascii?Q?F2aEUMkzmCF25SzhEsJa/G5g5F+2NgRXgSuE+I1xOowrHgqz2wYtwpidz+U/?=
 =?us-ascii?Q?OhELv9b31IBGoa5VRiWSOKe2YUgiO8vvKocL3td5Wfzg8pkSfiBHL8eMcjMn?=
 =?us-ascii?Q?zhb/qv0TvvgAAO/iP/p190gJ7XQrN9sfzLQcGRk+AQikTqFUCq+jS/DFWJFy?=
 =?us-ascii?Q?b/QJpct+bdlXlVJp2oDARiIN8+kvK5c6IyIPsvdFIKU6SNGogihfZStrrmM3?=
 =?us-ascii?Q?aLwFclG3O3kWakuxqLzfAjHIS1G472SM6H1DBG7BLjemGqm8BWXR1VbegAl5?=
 =?us-ascii?Q?yE9ttLn92he8D09f4krjwBws8WligpbOXO4g3yLIddvXLJ6cecgV9JiC+X5X?=
 =?us-ascii?Q?EegXIgy3KUOU8+/igFCTIn/JGj++iy0DE5l610zonZS3S5/CEtUeo2IQbhnF?=
 =?us-ascii?Q?K/MTa8e0/HWVAzNZhSJ2tK4J1lPp2GT23Z4B1VwGccLu2uUr/3rK2T486lj/?=
 =?us-ascii?Q?7TLJJjVkDm7O/fpLY58Eiomd2HUSYKqU/jZwy1Vul/XQwHLiN71ElWQTCKV6?=
 =?us-ascii?Q?zwpIucKOM3pkJmHplp4RfEZp6f0sp+6xK4RboD9cfm0hdMvRSputifh1KIq3?=
 =?us-ascii?Q?ZKZhQ5itoR9q7FT/PzV7oxiW6oTxKl2t4PxvTblvysh/5Bi/fyZu59JtCow9?=
 =?us-ascii?Q?9IwGUdIUe3vxMDh1iHhDN4cJG5rGenAspFHiHAy1e3Ol2cYcsufHxJKByIGq?=
 =?us-ascii?Q?+NHWsJcV8s8jjkPovBmaAaE/YcV8/llCtKLbDqdhnYBGeP9rfHLch4MHVr7L?=
 =?us-ascii?Q?gZrTOvIrMh2VI3DwbHwUqQy/ZecEjEjrPSihw0txfYUjMaH4Q7w+bLzrW1CR?=
 =?us-ascii?Q?ay3N5d1qSHbqBp1eElYZFVoIOGbXO9B0qDyOERcrV7brG1SBhnTsh66j+LK/?=
 =?us-ascii?Q?x9LccCs08ZqfLu/RvevPcLYugTPgLgvmg4TfYXgwbBhVWZkxkoCDJ1gZyrVh?=
 =?us-ascii?Q?Nyx0rSSOyE10j0ffxH9EmfjVl1UOut+AyPoS1mjLcBHRrzu9OB/Mc1mG1KNj?=
 =?us-ascii?Q?jbZf7egOaoei1juEGUtuM/uFS5kHKOQnZkq8Y8BnvmNfmbMDq/IMsz7RNczz?=
 =?us-ascii?Q?EzBmJc2QxdO0JNHdoMp+ZpGRNBcYvf9M94/EKSVhtaFOcOF0nYIzEl0tK/Qw?=
 =?us-ascii?Q?KglnWNEus2aotakSicwkzkfoy7u31AOWiM59g1F2CyGhR0m8ed1+5z5Qoz2Q?=
 =?us-ascii?Q?LIfwniGPPzRL0J/ERyclU0SBkoIBXal4dbVYLfyf28BKYahQxtS1f60qHmkf?=
 =?us-ascii?Q?CuHsbAINEBGNXSaJSvSRLaH6xUN/+2kQ1XpqgSwHYXi+JrrNMMMIP6naI9pq?=
 =?us-ascii?Q?XO5FhPRaQJdfCr8fwZ9cevGgKzTeLCMDqTrJBJxuOMRhreZqtEB030rv6RLH?=
 =?us-ascii?Q?K5//nQoUt731mhkKIfVmpEhvDXXDEiBcOZGplnbNNFns1tL5ApCVL/JZRO0N?=
 =?us-ascii?Q?IU5PoLqb1XcYlwo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TewPT1f80cffaxMT6sIFxBDANwNurBUJ1FDKWSuHjpV0HvY5i73NCtrz5BLv?=
 =?us-ascii?Q?juuFRM6zePppvQhLWq/PvFuD5/ud/thtltIJiPNa+hiLysAB/6T8cU4oYhup?=
 =?us-ascii?Q?brXyJc0Hf5rwLGh4uFeotgAK6/23tvBswzV3Q1/CxSkw7XFCz3lixoklNnFr?=
 =?us-ascii?Q?z4LR3MFIKTKvLB0R9qJXFvdJ3jzrVh14EUVWZNfNIuEziqLBNUIjNFR6qx9e?=
 =?us-ascii?Q?uv5NYTOvz6fiL4fMrfFsS9F6svJZJu48cYYcYH4dDXvoQHum0XMZu/rwOFtC?=
 =?us-ascii?Q?ykl7zMcYdmXG+lwOr+6h4N1qxPRiZUShBz3ilQhb5glO6WH2uZ37ecrZsurY?=
 =?us-ascii?Q?z9bRy4LMGNNnb9S7N68j6Gk2o8Qun8x61+7u7nuWJsj73VmlgG36Km7vWDs6?=
 =?us-ascii?Q?L8SDOzUWUuZJv2N9KNWjfoh6AW0cCyJrBjtQSJk4p6e4FMfoGxXriTIxnRXa?=
 =?us-ascii?Q?FQR5GxDTHXcrcgmqhRU9fAkfjPzieAe5TmGTKwK8GoslHrirvOCBqvEWWHwz?=
 =?us-ascii?Q?P8Awu3KWpNk1XdH9/Sk4s/se9ZpCzyooI0mSQDYCqdJDqRMDIU+JaFlqOfTt?=
 =?us-ascii?Q?/G+X8hDY32Vn7Lje0l10NizwqYe/rtrSEPRydmAo5xtCkK/mFdZVyKOBM0KS?=
 =?us-ascii?Q?I1WPvm4FYQ6wgcBV5ln+jjfyJAUG/0vvI9CniP02TlpJRxaTn7QayvPtnC1C?=
 =?us-ascii?Q?GSjmnAF6kWoOoOAao1xbFKQl+vPmO/qIUZItMsWU2gJgnpzkTIXVrUFHrPJx?=
 =?us-ascii?Q?PnoLU7dKu/x/PzLpuGNT4XmMtM6/Sy6iyBoQiDA40PbAG848Wgti8uxdu0Ku?=
 =?us-ascii?Q?B7YdyWOg/okckJJprybvpFrolZ91cGpwuc7RnwmtfCM8b46jXQrm6eXDChiK?=
 =?us-ascii?Q?Fjx8qtT5EfurMow3LCn3s/190oUYx36a8EgPV5zlEGIajZnOX4QSeFZeX7NH?=
 =?us-ascii?Q?JJGChzBns26GrcOjon0jIj2/cNzdLqz+vEJoHpI9uG8WZOj0VVPjk4gWdNP5?=
 =?us-ascii?Q?UtP3rktA+2iOe2yiu26U8yyuGm8GW2z0ijg9vnDk5h1GV3ics3FBkgZfyxKF?=
 =?us-ascii?Q?lh+/ccSc4X0vJD4IwXpHWepXhHVG5YfjEaEw3sz7FzIIcrjvuaZLpCTRqMnP?=
 =?us-ascii?Q?IB/XtITzdebAXMGzFoOLRbRF+bc01tB40jMfuX1LxNBepQb9FJua5eBUVht/?=
 =?us-ascii?Q?dBJ10/LOx4hV0mIiFnevIBXtS5iLYg2HZKqWWsdLtjtz0yfbtqfFIUpIgAwH?=
 =?us-ascii?Q?cqzV3LCltRdFkcsHBym3BIFiZcDIefXa8aOQoa7azuNKJcLe8+D9Dxm0pYXq?=
 =?us-ascii?Q?4hx93kz9PuSb6hJvUjJV9GQVdtevb7Bc/WD30zZVWlb5rtyswIg46k6fadS4?=
 =?us-ascii?Q?vzx3ZWQUMn8pITM5g85tkkzge01bscMXdqxSwUrk0lctBTYbj9bD8DECojfR?=
 =?us-ascii?Q?Q0U0TgHV8BmF66Fdq0VPTiB1euqGyUlinktBnHXyZJ0q+fDV5fV94/ueku2Y?=
 =?us-ascii?Q?x12L5NoKCxZwo6byBqtrWFKazCq4JPLjQ7UZjhoPsK3QYaFQ+SYwHto5Jf+8?=
 =?us-ascii?Q?h/KPyIvS//A8p18rr/sfPEfbJoI7cieuCu5vRWT2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459d423d-9ba4-4966-a049-08dde7075a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 14:21:32.0704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hxl06uEu3XomGbdd6MFPY9w8oYy3iM39HbN2UTKol0ut4WVt6yGeSukmWph6o2z8uZnQ4kbcCw68E6ZGCK/JJJGM8Xl2BBiJFOTyyULFDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Thursday, August 28, 2025 10:28 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Add
> preferred_loc_smem test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added preferred-loc-smem test which is called in combination with other t=
ests
> as well. In this test the buffer object preferred location is system memo=
ry.
> MADVISE ioctl is called with preferred_loc attribute and default_system s=
ystem
> memory as preferred location.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 225 ++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 38 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index 007d9bdc0..70ca5fc2e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -138,7 +138,6 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> -
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t strid=
e,
>  			  unsigned int flags)
>  {
> @@ -406,6 +405,39 @@ static void __aligned_partial_free(struct
> aligned_alloc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size -
> begin_size);  }
>=20
> +#define MAX_N_EXEC_QUEUES       16
> +
> +#define MMAP                    (0x1 << 0)
> +#define NEW                     (0x1 << 1)
> +#define BO_UNMAP                (0x1 << 2)
> +#define FREE                    (0x1 << 3)
> +#define BUSY                    (0x1 << 4)
> +#define BO_MAP                  (0x1 << 5)
> +#define RACE                    (0x1 << 6)
> +#define SKIP_MEMSET             (0x1 << 7)
> +#define FAULT                   (0x1 << 8)
> +#define FILE_BACKED             (0x1 << 9)
> +#define LOCK                    (0x1 << 10)
> +#define MMAP_SHARED             (0x1 << 11)
> +#define HUGE_PAGE               (0x1 << 12)
> +#define SHARED_ALLOC            (0x1 << 13)
> +#define FORK_READ               (0x1 << 14)
> +#define FORK_READ_AFTER         (0x1 << 15)
> +#define MREMAP                  (0x1 << 16)
> +#define DONTUNMAP               (0x1 << 17)
> +#define READ_ONLY_REMAP         (0x1 << 18)
> +#define SYNC_EXEC               (0x1 << 19)
> +#define EVERY_OTHER_CHECK       (0x1 << 20)
> +#define MULTI_FAULT             (0x1 << 21)
> +#define PREFETCH                (0x1 << 22)
> +#define THREADS                 (0x1 << 23)
> +#define PROCESSES               (0x1 << 24)
> +#define PREFETCH_BENCHMARK      (0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +
> +#define N_MULTI_FAULT           4
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory @@ -460,7 +492,7 @@
> many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t *bos =3D NULL;
>  	struct timespec tv =3D {};
>  	uint64_t submit, read, elapsed;
> -	int i;
> +	int i, err;
>=20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0); @@ -
> 500,6 +532,15 @@ many_allocs(int fd, struct drm_xe_engine_class_instance
> *eci,
>  			alloc.ptr =3D aligned_alloc(SZ_2M, alloc_size);
>  			igt_assert(alloc.ptr);
>  		}
> +
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(alloc.ptr), alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D %s,
> vm =3D%u data=3D%"PRIu64" alloc_size =3D%"PRIu64"\n",
> +						  strerror(errno), vm,
> to_user_pointer(alloc.ptr), alloc_size);
> +		}
 The condition if (flags & PREFERRED_LOC_SMEM) is never triggered unless ma=
ny_allocs is used with PREFERRED_LOC_SMEM.
Please verify if this condition is actually needed. If not, consider removi=
ng it.
The reason for changing the #define placement was to access PREFERRED_LOC_S=
MEM, but if it's not required, do not move this section to the top.
>  		allocs[i] =3D alloc;
>=20
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> @@ -662,7 +703,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  	size_t bo_size =3D SZ_2M, unmap_offset =3D 0;
>  	uint32_t vm, exec_queue;
>  	u64 *exec_ufence =3D NULL;
> -	int i;
> +	int i, err;
>  	void *old, *new =3D NULL;
>  	struct aligned_alloc_type alloc;
>=20
> @@ -688,6 +729,15 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> FIVE_SEC);
>  	data[0].vm_sync =3D 0;
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				  strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
The condition if (flags & PREFERRED_LOC_SMEM) is never triggered unless par=
tial is used with PREFERRED_LOC_SMEM.
Please verify if this condition is actually needed. If not, consider removi=
ng it.
The reason for changing the #define placement was to access PREFERRED_LOC_S=
MEM, but if it's not required, do not move this section to the top.
>  	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
>  			   PROT_WRITE, MAP_SHARED |
>  			   MAP_ANONYMOUS, -1, 0);
> @@ -747,38 +797,6 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define MMAP			(0x1 << 0)
> -#define NEW			(0x1 << 1)
> -#define BO_UNMAP		(0x1 << 2)
> -#define FREE			(0x1 << 3)
> -#define BUSY			(0x1 << 4)
> -#define BO_MAP			(0x1 << 5)
> -#define RACE			(0x1 << 6)
> -#define SKIP_MEMSET		(0x1 << 7)
> -#define FAULT			(0x1 << 8)
> -#define FILE_BACKED		(0x1 << 9)
> -#define LOCK			(0x1 << 10)
> -#define MMAP_SHARED		(0x1 << 11)
> -#define HUGE_PAGE		(0x1 << 12)
> -#define SHARED_ALLOC		(0x1 << 13)
> -#define FORK_READ		(0x1 << 14)
> -#define FORK_READ_AFTER		(0x1 << 15)
> -#define MREMAP			(0x1 << 16)
> -#define DONTUNMAP		(0x1 << 17)
> -#define READ_ONLY_REMAP		(0x1 << 18)
> -#define SYNC_EXEC		(0x1 << 19)
> -#define EVERY_OTHER_CHECK	(0x1 << 20)
> -#define MULTI_FAULT		(0x1 << 21)
> -#define PREFETCH		(0x1 << 22)
> -#define THREADS			(0x1 << 23)
> -#define PROCESSES		(0x1 << 24)
> -#define PREFETCH_BENCHMARK	(0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -
> -#define N_MULTI_FAULT		4
> -
>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] system allocator test only once @@ -951,6 +9=
69,80
> @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int=
 flags)
>   * @mmap-new-nomemset:			mmap a new buffer for each
> exec, skip memset of buffers
>   * @mmap-new-huge-nomemset:		mmap huge page new buffer
> for each exec, skip memset of buffers
>   * @mmap-new-race-nomemset:		mmap a new buffer for each
> exec with race between cpu and gpu access, skip memset of buffers
> + * @free-nomemset-preferred-loc-smem:	malloc and free buffer for each
> exec and perform preferred loc madvise operation
> + * @free-preferred-loc-smem:		free buffer for each exec and perform
> preferred loc madvise operation
> + * @free-race-nomemset-preferred-loc-smem:	free buffer for each exec wit=
h
> race between cpu and gpu access and perform madvise operation skipping
> memset
> + * @free-race-preferred-loc-smem:	free buffer for each exec with race
> between cpu and gpu access and perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs, bind and unbind a BO to same address, skip memset and perf=
orm
> madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs, try to unbind while buffer valid, skip memset of buffers a=
nd
> perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs, =
try to
> unbind while buffer valid and perform madvise operation
> + * @malloc-fork-read-after-preferred-loc-smem:	malloc single buffer
> for all execs, fork a process to read test output, perform madvise operat=
ion
> + * @malloc-fork-read-preferred-loc-smem:	malloc single buffer for all
> execs, fork a process to read test output, perform madvise operation
> + * @malloc-mlock-nomemset-preferred-loc-smem:	malloc and mlock
> single buffer for all execs, skip memset of buffers, perform madvise oper=
ation
> + * @malloc-mlock-preferred-loc-smem:	malloc and mlock single buffer
> for all execs, perform madvise operation
> + * @malloc-multi-fault-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-nomemset-preferred-loc-smem:	malloc single buffer for all
> execs, skip memset of buffers and perform madvise operation
> + * @malloc-preferred-loc-smem:	malloc single buffer for all execs, issue
> a command which will trigger multiple faults, perform madvise operation
> + * @malloc-prefetch-preferred-loc-smem:	malloc single buffer for all
> execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-prefetch-race-preferred-loc-smem:	malloc single buffer for al=
l
> execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-race-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs with race between cpu and gpu access, perform madvise opera=
tion
> + * @malloc-race-preferred-loc-smem:	malloc single buffer for all execs w=
ith
> race between cpu and gpu access, perform madvise operation
> + * @free-race-nomemset-preferred-loc-smem: malloc and free buffer for ea=
ch
> exec with race between cpu and gpu access, perform madvise operation
> + * @free-race-preferred-loc-smem:	malloc and free buffer for each exec
> with race between cpu and gpu access, perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem: malloc single buffer fo=
r
> all execs, bind and unbind a BO to same address before execs, perform mad=
vise
> operation
> + * @malloc-bo-unmap-preferred-loc-smem:	malloc single buffer for all
> execs and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer
> for all execs and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs a=
nd
> perform madvise
> + * @mmap-file-mlock-nomemset-preferred-loc-smem:	 mmap and mlock
> single buffer, with file backing, perform madvise
> + * @mmap-file-mlock-preferred-loc-smem:	mmap and mlock single buffer,
> with file backing, perform madvise
> + * @mmap-file-nomemset-preferred-loc-smem:	mmap single buffer,
> with file backing and perform madvise
> + * @mmap-file-preferred-loc-smem:	mmap single buffer, with file backing
> and perform madvise
> + * @mmap-free-huge-nomemset-preferred-loc-smem:	mmap huge page and
> free buffer for each exec and perform madvise
> + * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free
> buffer for each exec and perform madvise
> + * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer
> for each exec and perform madvise
> + * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec
> and perform madvise
> + * @mmap-free-race-nomemset-preferred-loc-smem:
> + * @mmap-free-race-preferred-loc-smem:
> + * @mmap-huge-nomemset-preferred-loc-smem:
> + * @mmap-huge-preferred-loc-smem:
> + * @mmap-mlock-nomemset-preferred-loc-smem:
> + * @mmap-mlock-preferred-loc-smem:
> + * @mmap-new-huge-nomemset-preferred-loc-smem:
> + * @mmap-new-huge-preferred-loc-smem:
> + * @mmap-new-nomemset-preferred-loc-smem:
> + * @mmap-new-preferred-loc-smem:
> + * @mmap-new-race-nomemset-preferred-loc-smem:
> + * @mmap-new-race-preferred-loc-smem:
> + * @mmap-nomemset-preferred-loc-smem:
> + * @mmap-preferred-loc-smem:
> + * @mmap-prefetch-preferred-loc-smem:
> + * @mmap-prefetch-shared-preferred-loc-smem:
> + * @mmap-race-nomemset-preferred-loc-smem:
> + * @mmap-race-preferred-loc-smem:
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-dontunmap-preferred-loc-smem:
> + * @mmap-remap-eocheck-preferred-loc-smem:
> + * @mmap-remap-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> + * @mmap-remap-ro-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-preferred-loc-smem:
> + * @mmap-shared-nomemset-preferred-loc-smem:
> + * @mmap-shared-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> + * @mmap-shared-remap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-preferred-loc-smem:
> + * @new-bo-map-nomemset-preferred-loc-smem:
> + * @new-bo-map-preferred-loc-smem:
> + * @new-busy-nomemset-preferred-loc-smem:
> + * @new-busy-preferred-loc-smem:
> + * @new-nomemset-preferred-loc-smem:
> + * @new-preferred-loc-smem:
> + * @new-prefetch-preferred-loc-smem:
> + * @new-race-nomemset-preferred-loc-smem:
> + * @new-race-preferred-loc-smem:
> + * @prefetch-benchmark:
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of pr=
efetch
> @@ -1020,7 +1112,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	uint32_t bo =3D 0, bind_sync =3D 0;
>  	void **pending_free;
>  	u64 *exec_ufence =3D NULL, *bind_ufence =3D NULL;
> -	int i, j, b, file_fd =3D -1, prev_idx, pf_count;
> +	int i, j, b, file_fd =3D -1, prev_idx, pf_count, err;
>  	bool free_vm =3D false;
>  	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>  	size_t orig_size =3D bo_size;
> @@ -1133,6 +1225,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>=20
>  	addr =3D to_user_pointer(data);
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo =3D xe_bo_create(fd, vm, bo_size,
> @@ -1202,7 +1303,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		uint64_t batch_addr =3D addr + batch_offset;
>  		uint64_t sdi_offset =3D (char *)&data[idx].data - (char *)data;
>  		uint64_t sdi_addr =3D addr + sdi_offset;
> -		int e =3D i % n_exec_queues, err;
> +		int e =3D i % n_exec_queues;
>  		bool fault_inject =3D (FAULT & flags) && i =3D=3D n_execs / 2;
>  		bool fault_injected =3D (FAULT & flags) && i > n_execs;
>=20
> @@ -1232,6 +1333,16 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			aligned_alloc_type =3D __aligned_alloc(aligned_size,
> bo_size);
>  			next_data =3D aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			if (flags & PREFERRED_LOC_SMEM) {
> +				err =3D xe_vm_madvise(fd, vm,
> to_user_pointer(next_data), bo_size, 0,
> +
> 	DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> 	DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err =3D %s,
> vm =3D%u data=3D%"PRIu64" alloc_size =3D %zu\n",
> +						  strerror(errno), vm,
> to_user_pointer(next_data), bo_size);
> +			}
> +
>  			__aligned_partial_free(&aligned_alloc_type);
>=20
>  			b =3D 0;
> @@ -1253,6 +1364,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  			sync[0].addr =3D to_user_pointer(bind_ufence);
>=20
>  			start =3D igt_nsec_elapsed(&tv);
> +
>  			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>  					     1, region);
>  			end =3D igt_nsec_elapsed(&tv);
> @@ -1355,6 +1467,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				} else {
>  					igt_assert_eq(data[idx].data,
>  						      READ_VALUE(&data[idx]));
> +
>  					if (flags &
> PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv =3D {};
>  						u64 start, end;
> @@ -1429,6 +1542,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				aligned_alloc_type =3D
> __aligned_alloc(aligned_size, bo_size);
>  				data =3D aligned_alloc_type.ptr;
>  				igt_assert(data);
> +
>  				__aligned_partial_free(&aligned_alloc_type);
>=20
>  				bo_flags =3D
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1450,6 +1564,7 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				}
>  				bo =3D 0;
>  				data =3D aligned_alloc(aligned_size, bo_size);
> +
>  				igt_assert(data);
>  			}
>  			addr =3D to_user_pointer(data);
> @@ -1460,6 +1575,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		prev_idx =3D idx;
>  	}
>=20
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err =3D xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data),
> bo_size);
> +	}
> +
Do we need to set the PREFERRED_LOC_SMEM after reading data ?

>  	if (flags & PREFETCH_BENCHMARK) {
>  		igt_info("Prefetch VRAM execution took %.3fms, %.1f5
> GB/s\n",
>  			 1e-6 * prefetch_ns,
> @@ -1587,6 +1711,7 @@ threads(int fd, int n_exec_queues, int n_execs, siz=
e_t
> bo_size,
>  	uint32_t vm =3D 0;
>  	bool go =3D false;
>  	void *alloc =3D NULL;
> +	int err;
>=20
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
> @@ -1614,6 +1739,15 @@ threads(int fd, int n_exec_queues, int n_execs,
> size_t bo_size,
>  		alloc =3D aligned_alloc(SZ_2M, alloc_size);
>  		igt_assert(alloc);
>=20
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err =3D xe_vm_madvise(fd, vm, to_user_pointer(alloc),
> alloc_size, 0,
> +
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +
> DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +			if (err)
> +				igt_warn("MADVISE_FAILURE err =3D %s, vm =3D%u
> data=3D%"PRIu64" alloc_size =3D %zu\n",
> +					  strerror(errno), vm,
> to_user_pointer(alloc), alloc_size);
> +		}
> +
>  		memset(alloc, 5, alloc_size);
>  		flags &=3D ~SHARED_ALLOC;
>  	}
> @@ -1831,6 +1965,7 @@ igt_main
>  		{ NULL },
>  	};
>  	int fd;
> +	int num_sections;
>=20
>  	igt_fixture {
>  		struct xe_device *xe;
> @@ -1843,7 +1978,21 @@ igt_main
>  		open_sync_file();
>  	}
>=20
> -	for (const struct section *s =3D sections; s->name; s++) {
> +
> +	num_sections =3D 0;
Please move initialization to declaration=20
-- Pravalika
> +	for (const struct section *s =3D sections; s[num_sections].name;
> num_sections++)
> +		;
> +
> +	for (int i =3D 0; i < num_sections * 2; i++) {
> +		struct section *s =3D &sections[i % num_sections];
> +
> +		if (i/num_sections =3D=3D 0) {
> +			static char modified_name[256];
> +			snprintf(modified_name, sizeof(modified_name), "%s-
> preferred-loc-smem", s->name);
> +			s->name =3D modified_name;
> +			s->flags |=3D PREFERRED_LOC_SMEM;
> +		}
> +
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> --
> 2.43.0

