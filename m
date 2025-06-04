Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABC4C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 18:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FE610E7DA;
	Wed,  4 Jun 2025 18:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCO0ldpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3C810E7BA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749061427; x=1780597427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PpqyLWSvUlU+q0gm5eGCsBlxEXBK1QOx+lJ0x9r5KUI=;
 b=FCO0ldpjcmhxmXBnzb1Em0DDOrzoT+poQhLURbMfssOGoOGhyxHrvqkc
 0agx+J6J8Ut9B+MiSXKpBYEIjss49phvZqungPEWn9WlKR1V3icB+PyjE
 PaV0OhmX1P2OEtpC76kQKd3Tio9JmKNjlX9YMrbkp4QQ2Jx4S0KoQB78M
 O1pVMnWLsoa8XgZLKHVQ0LunKU5+Bueo8KWYzI/PEVYbOo54W4PRr0sIr
 SYlcz9eyNs95Ou16XGinGT++CP8dgnUYmJxuaN/zPzpTfJNLJQ6WOAd1D
 z5162M2Ul8BgPpFbAecacSaN6VK8ZTUiiNwBgpcZMky2wFKssfcObKV/S g==;
X-CSE-ConnectionGUID: nPh1jCbkQLSCtH7jVbO/bw==
X-CSE-MsgGUID: Q4/fWJopTmWHO2F8fXWJrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54957275"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="54957275"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:23:47 -0700
X-CSE-ConnectionGUID: hu2UIHLLR9+hOsKlFaALLQ==
X-CSE-MsgGUID: KJgg1CsKRA2ORNDFzCmFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="168432331"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:23:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 11:23:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 11:23:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 11:23:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcCo3dbBPCjXzrHlq4NnEgKsIUzrsH9ecbFIBNjNBKjHrKHI9hPNndgpbACO2cSX2Iviy34nlscN2SuHUy4MudPUoCtNUiVtvXycLhxaU7yxBPgmNPGZQFTl19KRJerlVUWhNrG/jMNUjjWdG7Xz8ewrsFtiPhy82Mr0JQ6ppiXySauLHTD5rpDaoCglxBoc9BWftMkC/B33+QRsb1ZeGGKESuL4an9ulWzGnoMHudnDpvAZlpCusPNoqd2hP6+FHF5zZNduxFKZNFVpXn4Ifr0jSAHxV/oJzUCdJ55IuIbJlZfIEtJY3zoHi8YFggrq2pDbDfLSHmglRRWc1kTv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/zcz1yaOEj6ZR9J0KpMOeGMkvkdoKg1hPBJqR9pn/c=;
 b=Qutjz6dOqDZV9JeBpACHJ2fNtncF07uUhQd7r/uFwZoHGcF40fhOg/1L/q45Klgf8zX1zTs/VIIup598SAClJQLmiHghwgOxy/Q9rg4YHYfeQBSlBZWAxpUg9Ts1rGD0Gxvuj1zJGkXZtu95WgzDx/2+X1yyHzFBpCtgb9bZlNzfJRr9joA73qGgkwemOJ8aCPvKeJfgH7K028h4HcdC0CO5Vcp16lHr3Htwfo5X9eQiIF8oeMxvTwEW6QHzTIkWidjoa6Nw+yCnKE1L8QtZb+VatyexYMJnIXq6/3EXk3PQW7kgnrbWKwjTiTyN+LXP3DAH54jMXYNOE6pSjC6wSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 18:23:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 18:23:13 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Thread-Topic: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Thread-Index: AQHb1X0wlGGe53RxEkO+AUaUx6N/17PzUCrw
Date: Wed, 4 Jun 2025 18:23:13 +0000
Message-ID: <CH0PR11MB5444B0248786C82E4B071015E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV3PR11MB8601:EE_
x-ms-office365-filtering-correlation-id: f2ea1465-1c85-415d-f994-08dda394de3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?anr1OwQXhM5Xwqe8RbRXrkrE2P5eFj3gccmqmGcut4JUHGSQI8t2U5ncvF5d?=
 =?us-ascii?Q?LlbYGg+N9RFkt8wEUPm1G2iVGcpNacjnohJzuz6fRrXx+rUMTSD5TDxD6EfJ?=
 =?us-ascii?Q?tlBCb3ng0SaDVRE+FYdpkadyXK5aLfD/gkEvV135h7HzlQxVUW6Z0kQkfKPE?=
 =?us-ascii?Q?pddbpe6dm4VRax4+tcPDmxrw8pZEih5poPv19yKICHJrLN0vwxgwVdXRfkDl?=
 =?us-ascii?Q?K5muR46k/pguNBDLVoQzyC8+FoMBdpuZAWGVMTv8VtaZjjhqB9yG87uPH6re?=
 =?us-ascii?Q?cSwZnxK3Os7L9UgSwGJ8jup4UrAc9e1sYy4Is9EFHLWeBtjN467/YgsHh9/q?=
 =?us-ascii?Q?cppkDY5DKI+ov1IyAhpSv2AaH8b256K0CAYBg07BS8zO1uNaHVJ2gsGHKM5m?=
 =?us-ascii?Q?vO7mubMfKnAom3UyaDVFxd57mQEj7Hko5ZriGRoptTryqMu63jMoMx4Mde3R?=
 =?us-ascii?Q?1jbK0FRCYpqcrKvuV4jXHmH7EE/5qKLzVBPjUpKsYduP/jlqa+Z/VctHd0yk?=
 =?us-ascii?Q?FirQEhrDYoTSSN7r9KLyXd+f6fg9CY15E144SzUe8arrRZXSz24GmosQ1Yhc?=
 =?us-ascii?Q?+ueqeAn+yQjsemghWwj0ZRwLUjW2yXgWycTp+75T6Gbk6dqK2GTwcor+yWm2?=
 =?us-ascii?Q?DZr4yLVZ85KWov6j6czL404b21C66X4vygY8HCbKj4Gn/IEtq42h9PfdycbO?=
 =?us-ascii?Q?YvqEwMGYqMgjWdhHGBWt5x4o31xMqncv922n2wEnsjfkPxr+rapR+gCNR/Y/?=
 =?us-ascii?Q?jGODBfplfMBdU6TiSMhBkmQQ/+VLp33elDWf1yFzwrrlPOFIbRSBRy9Xd7Xp?=
 =?us-ascii?Q?md8nA1ltONMjkBC1uFxBTBm7wdRc5xVADIQ6fltKyWuulORGn49UVa6TVVR6?=
 =?us-ascii?Q?V6JqhUubo2gFsz9CaHKtBv/0jjnLSs2bGLXqScPILjoRrn2ULV3YHSH9J55B?=
 =?us-ascii?Q?oi+KiD4/oVVrRQ0oOw48csMxHjtME2j2LXIs5IBoHow8OROWcmCz4CBe+rc2?=
 =?us-ascii?Q?ZVMOMPB4x9HtRSwgsXxcTSSLZ8feHsyVcLGDxehIGixZc2bRXcJCo1dF1EUh?=
 =?us-ascii?Q?uHlCR56tZx1ceoWdTAHuLqOYgIku6jjspaoxr5NQzWnasIWJxZPeI4FtHeoP?=
 =?us-ascii?Q?+G/DCT5MclkZtJTNcrotD7tZsstN1kyf+GNxdJEo6XuzGqmS6+Ldtw7pygU3?=
 =?us-ascii?Q?9G+lgiZevG9qPfmT3UI7Gfg4wT9GBeXmrlCgymklPmIZzad3so8i9ELEUMrJ?=
 =?us-ascii?Q?jbwHo9bP4MOPc8jVaAsG4BaXC5MDZwKCpQkNOqXvYmM2FLxbCGuq1nrNBxMf?=
 =?us-ascii?Q?Ctbe77cHa27gBNmq54QrwI3F9rcguOxAIe9GGSUnzLd72REJRwzed8DhNeKm?=
 =?us-ascii?Q?+e/4Z2Lvxeyaef8QaPq2N0KZeBly9gC2cc594gjHOxrJZilnfGIB7YZeRfFk?=
 =?us-ascii?Q?fak337mRmtJ7O/S8b/Zoap0eIEzgDfJRXFRvfbN2LbDKSiAdD50Q8aIFzsKu?=
 =?us-ascii?Q?B9AdgQtmMQADufk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pixwRC3+4pPHanh+Qds/+ukcOWnciq0RLxepD3bTyxLFJT/2FFY0pGna58GI?=
 =?us-ascii?Q?qs8ZSDqFpvBUC3lFS1pANto4nOg3KJcSyZ7b6fIZT9EKartuxwYDIFXuhDVg?=
 =?us-ascii?Q?2R5n09i+B0gNy8koT0UbswW3CXWiEVKQ4OZYp42E0e40LpX7IjXm3AVfGUH8?=
 =?us-ascii?Q?65cvPkqSs8EPX7T3W4oGWfzHbqMlt5FR9RrgHE8Cj+7TRF60+cYWApthFLo9?=
 =?us-ascii?Q?jnHUEQKlaxSbWqtq8x41AhGeN+kKS40lphY8CMAkEjEE1kARWEonfnQLP0ig?=
 =?us-ascii?Q?4bFMPj3V+bVnQHdBoUJHTMZNCrSboBTADyyAUnAcfW/8J7RRPnrtGaXfO6oD?=
 =?us-ascii?Q?DNg90c96KB3jARQoS3fvXz7CjC1RFGK4RF1snc0bYH+HfdLlEPpQEdNJadux?=
 =?us-ascii?Q?Fi3iVD13CbW5uoZzmtd9vVUckto9S/Xz6SteLlgnmLcnwWW4G/hMfjfB9+X9?=
 =?us-ascii?Q?ANzXuVHpJnH4/mMr6AiucPKiYdVLOiQODiqEQYW6zPIwkNDMEM95rrR8FDUJ?=
 =?us-ascii?Q?YBOkXKnbTymqZEsXdYteH1sdFFZkKGE8uo+ltQ1R4FsJivH7Z83HFJACyG+W?=
 =?us-ascii?Q?0etLMKwDS4RQKe9MQ7oxsQWb0Acd48LRV7FMuSeXfbeLLHyf9iErXn7BOalh?=
 =?us-ascii?Q?48WOC73PBIGalhvDstPWiqqmsuplRMU0btnyn68NWhESM2JadaGkf42bvI0I?=
 =?us-ascii?Q?V6WkgLBgJOH1rVX4+AEGvNxZYXpqwpF/J1DQfD89gFs8c+2NnsL2h17ja1tv?=
 =?us-ascii?Q?wGkE1PN3Q6O+ugmfp2ygL25N9wRXrCzYCWpL6AAg9rVYJu31Yn0ps48GMtYI?=
 =?us-ascii?Q?qIgeBOxHOGnhGMRp/IJfnMcVdTWMWry5jQMSM0cJdsm8leYxAPgnrzuK/bqJ?=
 =?us-ascii?Q?MoXTvvlWqwdSycbGEAdmfOsNXd7ah5nHFmSCHVdE6iwHCy8IafUY8sT54YEx?=
 =?us-ascii?Q?uy99Kx7S3o/YvvG04Js7/LtXhNzAs5cyVlbduZ2wuNCeYzM/KduPhmxTdfMj?=
 =?us-ascii?Q?JqKqbl+76mHL04ItxLcnW4U3qI++f5mKQXtvgIeL4thd5UEmkdnxuO89cVvd?=
 =?us-ascii?Q?xHoC8qU/++BOlN+/r9+9GKemrUqaLHoMlKkvTRYiTEj7J0b+jvU4B/hRNGr4?=
 =?us-ascii?Q?8X7pIcPJG4xJi96LA5QQndUzDFbTemPooCxNbzcEvFp4tR4uvyYP41DIXPab?=
 =?us-ascii?Q?UXphgtj3az/Mq8wbY2hL4148X/zSfguP90+HANYhu1xeGFhuWGc1qqIImGp8?=
 =?us-ascii?Q?Jxmu4iojeRC495Rjo5ZuWRbtK32a9y7Xks+q48EwPriBO/0pX+RivBG0OIgL?=
 =?us-ascii?Q?78cbpE8p940S5R8mZEo1XTxUGQePyuu51RevBi2nk3jPtxyWCByAMzweZRMP?=
 =?us-ascii?Q?9M6kFzg+mux2SfzuCq/1Vmx8+iSj8p8RsfBP2R0BYIJ0w0C8zwAyLwTe4HwQ?=
 =?us-ascii?Q?yeC2b7H+vkOw2V0TaaT5xOHRQcIB0zPEHyPIeIVuJ4EjR+djijmycKJyPNEm?=
 =?us-ascii?Q?EBZ2HG6ZTMq5WYn1QxjAx9woC+RL6jhGYXd0cVcmaT4OfNOMdK3nR4GSsrM4?=
 =?us-ascii?Q?mkcqVYfkkcNcyThhZYI75AIwY0kQzVStlI/+IoLM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ea1465-1c85-415d-f994-08dda394de3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 18:23:13.4450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcMn5ogz3gXBlO8SsT6mPZ+bOszC5zDGxurMH2vRqOPPDh/0et+c/baVe3MzwrOpm3mlKo6p58GYXD1Boqw/Gn8wOXH7/y0H0qnKBz0TPq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Umesh Ne=
rlige Ramappa
Sent: Wednesday, June 4, 2025 11:18 AM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.=
dixit@intel.com>
Subject: [PATCH] tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
>=20
> A copy paste error sneaked in the flags. Fix TEST_WHILE_ACTIVE flag.
>=20
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Good catch!
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_drm_fdinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index ad7b45b1789c..17f66f1defc1 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory=
 consumption and engine u
> =20
>  /* flag masks */
>  #define TEST_WITH_LOAD		(1 << 0)
> -#define TEST_WHILE_ACTIVE	(1 << 0)
> +#define TEST_WHILE_ACTIVE	(1 << 1)
>  #define TEST_ISOLATION		(1 << 2)
>  #define TEST_VIRTUAL		(1 << 3)
>  #define TEST_PARALLEL		(1 << 4)
> --=20
> 2.43.0
>=20
>=20
