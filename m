Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBD2D3C521
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B9F10E242;
	Wed, 10 Dec 2025 03:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF3tAxnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646FE10E242
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337740; x=1796873740;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6SPJEpRZqnEpihB5uStEWozNllm06st66I1A+tIX+qc=;
 b=cF3tAxnWwUyw/Ygxio3ga2D57r8ZNrK8MhrIt09YVSqe4O72ORBJw2j7
 kqhZm9blZJEnCCx3q9MFpDFvpE3iEfKWwl/u4g805jRDs9PnL8fi29E32
 chT1Nw7n6DkmdjZ5Gtu8va9+zbqan2gHspKJCMQZKlWum+Nw/+zc23nyv
 HyETY50WHIGIESMRFHjDWOoGrr0/uIcRQi6HGTuqyFAd9EgFj+Zs4Yib8
 ljhfXI2TaRaDaRLnY7AVG9pjM45e0+SqlaWhbrAiNWo6h7k6hilzBZmEI
 oBCJrr3NpFYIhYSDUruWIbr1M3D2AbqMVZr/+Tzcg7giPj5sniDxOs0+E A==;
X-CSE-ConnectionGUID: 1013m5paSUCPQc+O1Ky2Ew==
X-CSE-MsgGUID: wb9O87hZSi6b3Yqf6EnV4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71166704"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71166704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:35:40 -0800
X-CSE-ConnectionGUID: BsnKsoicSPGqHGI9Vz1x2A==
X-CSE-MsgGUID: kNE6Aad5SB+5wJmALzO2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233800927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:35:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:35:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:35:38 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6UbrLq0+CEfRNry+peOKGl5q22lURp+V74xsbhfKTWcMnV60VwS7vb+RAHjNNerX/inxro8fbonLAMLzfqPQJYbzz14KnjHiC4mvj/pe4X5D3nL2LtW+sYbNCIVXhtygFnqh5Y4sXtaM/sobrf3Nh1NRtLKj4s05jtRICNCxeK/8Xl0ndqb+bZ06qAWALEADn3om19gyJmQ/sDbrJRF8wXatqLjcl7AcESiTz2d7GItN54xv26T0YVj/yoF1yA1DixIXXAggiD5iBHGnsLIbRJgNNqgx90Y97SIRxysp8QxmeJSDAkhS3OID0jyyLK+T55mKFv3X3ZjliyxVNtctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHGUp3NTfnP5oQ/zVRpg98KtFAm3f9klpTB3HfkC76o=;
 b=XyeXyYJq6bqJGEt6hlfNPP/hitH6D5T0xFHBPSOJAQ37ePr1eD04QaBgm6K6REW647I2Dmdp2qN1I63mR6BrLOaj9KAEo5K7qPHfxvGjjvR8xQ5xeCGzgE2h08Ew6McvpdGy7TwPafDkzyd02ym/FK+NgV8nEk/kLok1e0yr9kT0NGvKQHcdjvARmGx5bG3SHkOX0Zj2/A8+zxIQbdkgVXHOhhwMza3MrB+OEDZsBUmhmrhuANGIDvCsF9wls6rJd7U8l9iYYG3MM3NJnCV6sartUT7lObzNcPY1z+1WXifTBANz9I9KKvVB2lYeeY4hzyQHQnYaX5iabP0pL25YAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8426.namprd11.prod.outlook.com (2603:10b6:806:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 03:35:31 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:35:31 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: Use lib
 function to paint fb
Thread-Topic: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: Use lib
 function to paint fb
Thread-Index: AQHcaYRm+pjRDpgeeka/xwd3J1YdjLUaOOdw
Date: Wed, 10 Dec 2025 03:35:31 +0000
Message-ID: <DM4PR11MB6312067F697634BA1948918790A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-3-karthik.b.s@intel.com>
In-Reply-To: <20251210032349.2781106-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8426:EE_
x-ms-office365-filtering-correlation-id: 70870747-3bfa-4be1-7060-08de379d2bbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FU/9CmPcZ5eF/7cPQ4iWxI8yO0NxyFnL+2lBCAoy1fwoy4AnuEDXV+TkGJFi?=
 =?us-ascii?Q?Dma+BjGIoQPiBjKfarwbXFlelEiH5j5iUBvsNs0RAgLHVTCzDcnhad9zqben?=
 =?us-ascii?Q?GPGk8sSN5ZDTQB4bl2i7vKVhJ6IUprRnzmjY/t/VTUxJ5b8dlGZCBAGry13a?=
 =?us-ascii?Q?gYWS9V9z/zd153GrmfUyWZRjeNscjsRFTjvBc8icmJzRgymm238FKQL3NVUE?=
 =?us-ascii?Q?/Yx3ZVnFW5QE+xDqhibAIZAPygA7NJ/nR1IEX8EF9P965W8KWQt4+UVKqwHD?=
 =?us-ascii?Q?dLM3K4JSpYWjgG9RRuQrV/NmLSJq0e69N0YdAojktlQgtWjkrfbuI6HcDPA/?=
 =?us-ascii?Q?X0DOCR4NRamupeuMA1RJLcASrA4dkydV0xkHp+U85PohlJOWZClLLtIg8iwV?=
 =?us-ascii?Q?1yhDfrPnfD8AdtgQpl5fgQ/nO9UDh5fgL8mDu2ORugt4fK35B1kqaWo9+bOn?=
 =?us-ascii?Q?2fzVlIdY8utK9KQSUk2FU3nPx+WwumEkv+uOwdCQRiUae2S0uBIwHaazlPpb?=
 =?us-ascii?Q?RSNm6NduEmo83WZwlR/WhgbJ73xN9qb62PuiCPK1DgiGAblDIkndbWrkR4rh?=
 =?us-ascii?Q?sG5GZ0wpp4YQmNf0voTubzqT31PijjbhGnBIUztjiFek3pZ9oyWrlKldt2Aj?=
 =?us-ascii?Q?pMvz/2cbCnEly0bI/YNIDgrkLkGRslTGwgta8HYkC3H2KCoEX+Xb9pjzQ6Lr?=
 =?us-ascii?Q?acLeGuE0Yv7jmMbWacdS/fQMZAarISAsLWjwiL2aM+PHFaA/hONynJtvm0FV?=
 =?us-ascii?Q?dkQfzDJneBmRoX8FRfTc1EBYjw7iHUiqSa+VIwOCjGDzaHoogVTYomB9YPSl?=
 =?us-ascii?Q?mhWhTGIyM1eY0qRbD+dnY0gGesZe0ztw/sOHb8QVEkCbXWcUM6K/ba49iCud?=
 =?us-ascii?Q?KkvcEORzNQBrdMSbCScmoAQrrISqWhJiDgNJmBgpmYXq/bUL9970hM5rkIv/?=
 =?us-ascii?Q?0LNmtfBDjt9Jq8q1MDbwkEVxwR+2PlL8Yvpyvc564OiS5uHSo2H5sdH2VG0w?=
 =?us-ascii?Q?gf5WMVhsBEd7LqugIClrGAw4qEYA0q6YYKkwcKL6i9dV9oKh3gpErSh4x+vc?=
 =?us-ascii?Q?HXuv2qdk68aKAvTTrY3oDT7aadiLl0SasbQm2QV0VoA3ZThvNUR5ZTb/x6+J?=
 =?us-ascii?Q?oYbSFWXeGq6wBsyJkLHnFwK02Do3gJ/kWy3fdm48Ngeinyis1HZBFfP8Qt9d?=
 =?us-ascii?Q?qxVTFXG28ljsk7r1sCRCbozifWgpiO0X83jtu8G4vGoYyvZ1hOsm7ddCD0iI?=
 =?us-ascii?Q?wqFdjWQ10QqdaJ13nktBeKXJs0SCmfTl3R8aEMH1VAcBWsXmkJBBHiFIQ8hv?=
 =?us-ascii?Q?wNkgDPR1/pTZkoOtwnAgwRS0QQXgd1CB2sRBegLtU0UpW/KlOb5H54Qwlwwk?=
 =?us-ascii?Q?IrrW+Op3zTBOiNUVnu6yyXrapzfn7XpJqHyTbsw0W2pUmPW6GTUBXhAIZAll?=
 =?us-ascii?Q?hJWW/UexAubqzf44Vus2vnfCn5kmWTx6R3tMyR0Bba97h1fYk6IoRF2DNAjA?=
 =?us-ascii?Q?2u0Hq0/rnwBWPcBriVqKttSggymKPKagN8T0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YjEdTcQdk4TiXwkJIfO5qrw4Aeh5yWduxLb0/ATWVCmfuidGtSUaMNhKTRxF?=
 =?us-ascii?Q?VNMv6RKHoOfYu7LXV/lK0UpOPyi1VugYQmDuA7yEi3lZ4o79Q65TUsKMDyFK?=
 =?us-ascii?Q?YSbBpk8W9hAxN/+Cx2ApyG+B7n4LHKRNahClp+KDCi1mf9pE6lBRqazk0Z4o?=
 =?us-ascii?Q?tTm+DJuwOU5FZqjjNZBHRagqM26+IlujVkbZSIM66BUW9IBGNh7L++492XTk?=
 =?us-ascii?Q?yESRmCK2IOUUDY3TQlowVeIBRqVUKRcP/PwoqjOerzOIn5QX1O64cICG2FE8?=
 =?us-ascii?Q?f9Q70XBfeOVRd86+lyFzsTOdDfOJfmvwNgqBh/RhJoxj6FHLW4PNe2iLlye2?=
 =?us-ascii?Q?tzL/zxCI9wNlfT7CV+lw0tzYKesPH3o5Su57qTR1wG/wuCnaMJUXLiJuivzO?=
 =?us-ascii?Q?+mh+Yb/2M6iuO6gm8zN9SLhWYrYGVAUxCIaVPHreVPdQk4B3VC8K5VlAOY/k?=
 =?us-ascii?Q?9tlh4KxLgUF/I5jgWSdIb2vmyHRUK/+HQTYflHGPffyAe0CuGRjDBx6R5jkm?=
 =?us-ascii?Q?UtDtBcoNXnzG3Nol2DqHYWFdSjB7+JR8Mwsj0irqvrvDfa8lrDmsWSlghZYT?=
 =?us-ascii?Q?lX6bNcV/BQmYDkI2vvOWEggAtUjSwT7P0qpchPfWfVlApk4vr5bN9YyfBFC2?=
 =?us-ascii?Q?6RPoiN+RwYOd3b7ci7m4J7zDQgXd5tq3CknT+mbBS6cKB+o1hWAJ8PBOXj8c?=
 =?us-ascii?Q?AmpsYxCVcIXOdupQ0JOEy9c1X/Q+9LXpq4+CGdYi45/kUPCjbALR9BWUkPHS?=
 =?us-ascii?Q?bGG0WEPuf27qRFADz4mWk3JaOZn5n9pjP/z/rnvnsSi8KPJ4ZhRb8tMmu0mI?=
 =?us-ascii?Q?Sfm/YCaeklPZN3aBA+SBlO486Epg/ey8QlleQLHQXRXGAnT84LQ07rtXvt/5?=
 =?us-ascii?Q?ccMMOVp75wUEvgNs3PIvsuMotQRJb82ezH6VFUPZUE0F1162dbMpQ9hRWHKx?=
 =?us-ascii?Q?O5fGX127NNcpckOYlN6PX3tDWm/sjVmaVDlYB0F9u3U51sXY1NR9vvRLCg6K?=
 =?us-ascii?Q?Lxbb/nzlDFrMSTNRBrZYc5nOO1fnC58RERnTrhVvScLLBwUGDTjf7MMUZnEG?=
 =?us-ascii?Q?By+GRAohBZkJ9KZEeCIYOdZFy809ki9cb54bDRIlSeZvNkNvhQqMrQq2F1E0?=
 =?us-ascii?Q?dGtRtvJKxAak1+un3vGJnJ1IHy6iVVSUJz7zfPO+S6pYg+3vYGURNlCmopuZ?=
 =?us-ascii?Q?sNO7s2pgptaqKcgq0bVgej+eYagyBvC17FUAeuIo2Dik/u+6Eh/SIe/Pbf5I?=
 =?us-ascii?Q?Dh5Snk34htul5X31QX4G9BMvw/4b4R4TZFhoF2DJUY677lL4oeHpiyq8FQM3?=
 =?us-ascii?Q?kF7ORKFUzEKveu4sJjq6PSB9ui0/zOup4zetA+exA4LXlEOTxv8C4wV9aQAj?=
 =?us-ascii?Q?+u0rrAfQnsCuBL+JqXgJMkIMDFz+JkHYq11wjJA4aNNxbgg8oBGs0cgrmAad?=
 =?us-ascii?Q?BBmldkUrAJDPocKICrGgldE/pZldT9+spDxVC5w3hfpwcFb5MHkaFsC8kaYE?=
 =?us-ascii?Q?ULywWS1P2x768vOKpkr9vfM9YFRKl6OSN6kIM3cCluZV8GhGaLA3Gay+xFs7?=
 =?us-ascii?Q?I9f2+BLNLRkakdOBcNc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70870747-3bfa-4be1-7060-08de379d2bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:35:31.6145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3yn+vX2kFYdhL05umcHLrzN3F5bUjTS+3dIF+eHGzYoP/vZsIt7DroOFsbmV9EBP9f5esLDJGZkwb62PM/5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
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

LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Wednesday, December 10, 2025 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: Use lib functi=
on
> to paint fb
>=20
> Use the lib function igt_paint_test_pattern_fb to paint the fb instead of=
 doing
> it locally in the test binary.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_mmap_write_crc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_mmap_write_crc.c
> b/tests/intel/kms_mmap_write_crc.c
> index ad3dd1b20..ccde47c2f 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -91,7 +91,6 @@ static void test(data_t *data)
>  	igt_output_t *output =3D data->output;
>  	struct igt_fb *fb =3D &data->fb[1];
>  	drmModeModeInfo *mode;
> -	cairo_t *cr;
>  	char *ptr;
>  	void *buf;
>  	igt_crc_t crc;
> @@ -104,9 +103,7 @@ static void test(data_t *data)
>=20
>  	ptr =3D dmabuf_mmap_framebuffer(data->drm_fd, fb);
>=20
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> -	igt_paint_test_pattern(cr, fb->width, fb->height);
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_fb(data->drm_fd, fb);
>=20
>  	/* flip to it to make it UC/WC and fully flushed */
>  	igt_plane_set_fb(data->primary, fb);
> @@ -151,9 +148,7 @@ static void test(data_t *data)
>=20
>  	/* start over, writing non-white to the fb again and flip to it to make=
 it
>  	 * fully flushed */
> -	cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> -	igt_paint_test_pattern(cr, fb->width, fb->height);
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_fb(data->drm_fd, fb);
>=20
>  	igt_plane_set_fb(data->primary, fb);
>  	igt_display_commit(display);
> --
> 2.43.0

