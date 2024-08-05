Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B79C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8591110E128;
	Mon,  5 Aug 2024 06:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O95GYbXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D8A10E129
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722840381; x=1754376381;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zw/Y3hT2PE/AG9jdqSGTmtDOFLWn81EwPJbU4pbHKII=;
 b=O95GYbXSlQS0sUN9XXOOHF1KdYgBxBDhgX0XrBMo0Rmc33sBxXTQtFCU
 VtUHboM4F5Zc1L8C4MgrxEjh0ueP23qItDlV9O7jpovcLIwHgLnORQqwt
 ral9fUlqiSOyHLeNjVRZdqndrhyer+gt+ArW+E5+pkhbEa9aTicp/m2qa
 WFL9DbtcZem32oPepblelvKOsh/zx/dQXb26BjyRRWlu442yU8stHk7q7
 dkwPesj0R/z44btl6qnw37JyMlzSJAsvUVKuOMpTaUCYXYcxgjqGKmCHz
 VzFDX0YmiE/5pA3j5gIfDVYlIzDJukaN0WU73qhidWfhAL9fRkvzcX4E1 w==;
X-CSE-ConnectionGUID: LiVs1PU2T/y0bvZ1kyCQOA==
X-CSE-MsgGUID: FtverYnDTBGRqusnf4SYSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32156724"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="32156724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 23:46:20 -0700
X-CSE-ConnectionGUID: MEGzQETJReyQ+UttVHLMQQ==
X-CSE-MsgGUID: WtQVHuXLTy6L74bodbwIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; d="scan'208";a="55721015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 23:46:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 23:46:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 23:46:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 23:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHBCFDoD4VueIg8cNZR3yiErmXST/3tUG4V9cvaJRWOEt7RBCbKiQ09mTa61xkTijdwTMztpei9qNnN8ao/tL0E307GyoDd5c6UJcM/1I700S0xsIqE4U3yqJwjTNf52U7u4vj7SisId2oP+XrIomt9NswiBzESEvp1AVdeemXJ7IusoKjN9bAUMxRj7AJVlvoMOCjMxzCorwtVgv0nItUh5vWSu6NTrZ3Hp0hKKREf30U3QoZb3zDO9zh9Yh/TyWc84yFq3U1dWaTUt9SVzYdePqGH2pCtC0f+9YvEDbic2+OeTXqoHvWJmARD0CPOMeuaFFg7y47hJdQorf3p3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5JQ/oJezjW4zT1cChkcBJiteolOyaWcxbwKtdGFg9E=;
 b=P33tyFXMAUoBJNfM/nLDlF8CSQyH+3/anjeZIZi835CZ6JMpKkxS3E+CD1nCPS6POZ8ueZHQJsh/xubomdHOWZ/J8aiZk0dZVIBk7Dy6+Hzc4CKO8VKrDelyBpyJ8XiJuYM09qLVnCDnMOnYjb9fcRqZg0X6oUmJW2D1Dm9vLOkAHOx9VQyfom34qEFl6II4bQdjfJhJ4RKhOZLKOTHpkpSdSpsWydGuOx9COErY1CnemtsCJzIu6xu1WpdIl4IfbS8EgviS/UKXbg+YwV6d8jE4fHuZ7bD8+7CdT3Gr6MEyxuOrEsXAu1ccqlzCpQYBkJoRbv3j4TvzcnLetwj6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 06:46:16 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 06:46:16 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 56/66] tests/xe_eudebug_online: Add
 reset-with-attention test
Thread-Topic: [PATCH i-g-t v2 56/66] tests/xe_eudebug_online: Add
 reset-with-attention test
Thread-Index: AQHa4naN4UanzsLbDESUFWSWeCLyhLIYPkHg
Date: Mon, 5 Aug 2024 06:46:16 +0000
Message-ID: <DS0PR11MB7264EAE18CDAE7E137467469D9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-57-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-57-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB7246:EE_
x-ms-office365-filtering-correlation-id: 2f3ca35e-8511-4522-0942-08dcb51a4e2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?iugW2lWwP7pPuXD2vjyYh/PyxO2S8ar9srugV1bhbjMiLh1I7iJDGefMGx?=
 =?iso-8859-2?Q?m6Nvfq74RM1IqvwBPEpZtSZ+hhFXsPAL8/utWTNycJId9XZkRDIwTjOkne?=
 =?iso-8859-2?Q?hgbVjuNDtlXqlVvbUlEjYUJciYBou2LCJBfHsbrqTajgfSwwlm/E3O3wa9?=
 =?iso-8859-2?Q?XRsOPpqNzzTW5OtRDypuEqejfrGLR2JW9e29sUGsEBbViRSOOnxDXArhx7?=
 =?iso-8859-2?Q?85YHLiDfG04Tuy06OHQtu8t4EbY1JJTHsIC1jXqpo3YXdxrEFIteW7Wpc8?=
 =?iso-8859-2?Q?R2KBzDoezZ28liiqlCebBgOqcO4Gk+f+lX+AgkefOlZoeMABQ7QiHbyJEi?=
 =?iso-8859-2?Q?cHCinjW5Zo+ZDOcBA1xm+gx6WYZansmpr4w1pDa81Oc0NS+Pv4Ans3eM9q?=
 =?iso-8859-2?Q?erzLOrufV4PgXDlaCDh7N+BjA9zdx7IxRtLlRh5DWffapnXWUtxjuxCDSl?=
 =?iso-8859-2?Q?vXmNTL/gyEmY43MZqnNNHS099xsIi0eeRKJEyv5Nspe9UBMz+KUdkn8QF2?=
 =?iso-8859-2?Q?umYWk4a5IBPZZB+AYY/ZcqoPluyn3Wy8Fq9xYQqZKjMLos/SMJ+WWj381s?=
 =?iso-8859-2?Q?NgvuOix7JWZHco76M50akxWSoiUO+xjp/3m5L1Ot0WG/kgOSTNXStQcCCN?=
 =?iso-8859-2?Q?nEYzJTIvNeR4R1b+RXDh+ROcKYHDNNt60Q36GiOmottRTMs8ytzFlxB6dq?=
 =?iso-8859-2?Q?+Cjh8D5vvCTNRPRdgxTAoS4Xfc0jOKN1f8dUGK23nbFErAw4Wf87a5DQ2U?=
 =?iso-8859-2?Q?dYm1ZzkAOnhBI+jkzDGjsCVWbYPDXG9G/g4dVYt72/VqB+X+6/wim+YVnt?=
 =?iso-8859-2?Q?4vjFq6ft9vaa/jqE9KrtFgYi/Vif55yPcaPjBLOF1iWUG4ZqnzNAWMUMBa?=
 =?iso-8859-2?Q?KXkULWsrh7lVjQK94PHpGvNYLvnYNGWXSC6xnWAAygS31g8Eyjl0u2SiVO?=
 =?iso-8859-2?Q?tL+g1hCiKucSNWDEkhA7ktYuiZngHBxkmaXTs7OETP8WBkNl0dG4PGUKJZ?=
 =?iso-8859-2?Q?TxXuuRBUSxLQssk9U4dx6MgI755XXG5HEbSDM5MaCH53pS2oIm12U2fF8O?=
 =?iso-8859-2?Q?ZYpLoq3Z24ugux5uUyyscIMgmfmvKhvtKhnGodRXZiqsGIH3lu9eBTWmKU?=
 =?iso-8859-2?Q?T+28EJIaYCwKC+qIo/Qz9JLQ+nKGmOM9sGesGIZcRfYgBWwKZIbYd3feiX?=
 =?iso-8859-2?Q?0zqLPZT4RWQcwKH6AzPTeRO8vJqKXjIP3gCjkrNEvAZyb5PU4jPAFb8J5M?=
 =?iso-8859-2?Q?bngS8TnyRabbnFAcUco3cUEBPr80Lv9quw332mus0YiyY0ibHv9Flgc5IS?=
 =?iso-8859-2?Q?CcYvREP79x6zVH1rSb7ENC4guNJvyLe45BU7d4wXW1BFPkCN62lPMwxnQx?=
 =?iso-8859-2?Q?LBd19qTKYRwf5MkfDBcI3UC6vFghgdf2G93NpgsXGQVM5NqdRVnyJsawyX?=
 =?iso-8859-2?Q?jWKuyJKZXSLxWQ232YNSTBa5djOASxaxL9ZBog=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?/d/WJHUMmui1u7xTkEaw+S14xnB8yBrRfSHWQdpODQ1uURbCRshsK8YnUn?=
 =?iso-8859-2?Q?jk6O01NdUv8mc4tN+tf87c/UcUnGSYjifdEtoQeGoi5M8h5CByACu0UoX8?=
 =?iso-8859-2?Q?V4vQU3uEioGG73y18Fg6lNYtwHBcP8Xx+gBQ7eKjDlGEUEglrnCx5vvd1V?=
 =?iso-8859-2?Q?wzZmGinnBGXE6V5NXr/7A8BIukoKPctJdv77gU6QlEdJEokOBhUbF4xby8?=
 =?iso-8859-2?Q?RNLiZKEXvbB3NTr/dBJ6V9wLs71/Tb8vxgu/2eB/UGfGKslN4Cy/gr+vFK?=
 =?iso-8859-2?Q?gDiVJThf+OyFul9ACdu7RRX7d1Rckn7OpwH9cXz3yrgdwgXOljD0lcEsW1?=
 =?iso-8859-2?Q?FcoqHXnw+qc/DFpWrSw3RpPLrOkhI3eVS3LfD7ZMrLHlr8aDoYqxVPKWrr?=
 =?iso-8859-2?Q?rhMeoqyeDoI+CYReDBLj3LWhq26xxz+ZoWDFOniJV2DoTIH56ye+nlIKTi?=
 =?iso-8859-2?Q?7/BSUDJQvWc/tBP7Z35jOvNd2tDN8TGsSO84jVm6w82/BbArlxpUJuC3fC?=
 =?iso-8859-2?Q?1WZAFIloPVjH4I7l7ZibbDsqz45F3jPQumQJFveCAv6uezABqRTLHasXsv?=
 =?iso-8859-2?Q?KmHMQh8PDTAdokBsdpA0fUriUnFg7whXBOKumoe61TW3aySsduAC5geoMh?=
 =?iso-8859-2?Q?oZyz0O4i3PBicXT9KKjZTWZPk4sjMrGAPPp/WMUXEij35z5SP73JYFNcer?=
 =?iso-8859-2?Q?SgSqPJTMz/2IcBmyayRaOCGRNZlndTHJKC2u02HvRropWUYJH/P+W4KUNO?=
 =?iso-8859-2?Q?9kk15l9JQeFbejf+HAe5mJ/vaCTZc98GI8ra6WHe3EMioqHjpfAtDRdFS7?=
 =?iso-8859-2?Q?3nCNHReJuqv9DVI/3aD3PQSm3a+YtCfa/6S8tUoJkzqONGaTk9eDz4N357?=
 =?iso-8859-2?Q?gqXtoi0yHjy+7RAvpcj+v0mjb1Zb31accFL7vR9isAp+hD+HbV7uo4kI/Y?=
 =?iso-8859-2?Q?N5omwu/758KYVgU9k7AyOlgN78pMT6tGo6jSpSn2VM7jKrpUdnP2xRSSCo?=
 =?iso-8859-2?Q?NYOZCwUw3Gq/r5KA9EucejCU2bom9USXwdG+Dso7HqzbhNS8EER1OIShZE?=
 =?iso-8859-2?Q?oAyDHDV3P91w9ZFTKOXbhnlwwWQvV+BxY/8l3ubM+gGM1WE4I0OQ7xmW24?=
 =?iso-8859-2?Q?jq3l0HGyxjoO73EsPY+2qooA6NSC7YUZ1Bqkt2NCVZbw6PoglRtqcM84Tz?=
 =?iso-8859-2?Q?07ZprTN5Yhj3ZY/RywbOd46xGion83t4Wx68l7Cc2DIj27IzhvL4r9thdE?=
 =?iso-8859-2?Q?O72TCCRn0kOsj+1aQgrqfbVL13sapI24Im/Nl4Sunh4f/Re2z3GK7YVYmK?=
 =?iso-8859-2?Q?CFsjgJ5gXXcD4VKvqz3bu9wTgEi7jC6JGiuq1/hbUlN7pX4KwB8XCpiSHA?=
 =?iso-8859-2?Q?sXBMv/STZKcjbMRNz2dor6ccnViwNsWz28MCA0XU8RgzkcqZZBEzNXytRN?=
 =?iso-8859-2?Q?NepTIEbVe2SRV6IFX8QNzzPJLXPW9ZX5WqJloEnJtjLt4bJ2g6uh/rq99h?=
 =?iso-8859-2?Q?vYwdvbANw8T6S2Wn4oywb6A+4SyQ2o3lxd3AKTIDePhCM66xTHFObjoynQ?=
 =?iso-8859-2?Q?zgdqMvhZXv0yJG/R+BC2KlGXXGDPWHh2vVK0mFQ7izH31PQgpgZs2F9zkR?=
 =?iso-8859-2?Q?lPEw02o9rxWFouNVlnDoMAblEY8ZZbwko5ud2MQ9v59OWNI9xBL4k/5Q?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3ca35e-8511-4522-0942-08dcb51a4e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 06:46:16.4917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R4uiV9LZLMSISUsfHahpJATxKZn9Db5xmvwoZyA1NOrp21Ianp7K0Yw00gBQ9eUCdG/Q0+FDOM3RroZUZoVs/HluyZQ+9BbQLOc3slm/fGEWEOOxUF/RHEtrJf285D3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

With typo fixed:
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 56/66] tests/xe_eudebug_online: Add reset-with-
> attention test
>=20
> From: Pawel Sikora <pawel.sikora@intel.com>
>=20
> This new test performs a GPU GT forced reset on the attention event raise=
d.
> Then the test runs a new session with a workload to check if the GPU is u=
sable.
>=20
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 58
> +++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 0b92507f4..c101bde2f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -322,6 +322,25 @@ static void eu_attention_debug_trigger(struct
> xe_eudebug_debugger *d,
>=20
>  }
>=20
> +static void eu_attention_reset_trigger(struct xe_eudebug_debugger *d,
> +					struct drm_xe_eudebug_event *e)
> +{
> +	struct drm_xe_eudebug_event_eu_attention *att =3D (void *) e;
> +	uint32_t *ptr =3D (uint32_t *) att->bitmask;
> +	struct online_debug_data *data =3D d->ptr;
> +
> +	igt_debug("EVENT[%llu] eu-attenttion with reset; threads=3D%d "

Typo: attention

> +		 "client[%llu], exec_queue[%llu], lrc[%llu],
> bitmask_size[%d]\n",
> +		 att->base.seqno, count_set_bits(att->bitmask, att-
> >bitmask_size),
> +				att->client_handle, att->exec_queue_handle,
> +				att->lrc_handle, att->bitmask_size);
> +
> +	for (uint32_t i =3D 0; i < att->bitmask_size/4; i +=3D 2)
> +		igt_debug("bitmask[%d] =3D 0x%08x%08x\n", i/2, ptr[i],
> ptr[i+1]);
> +
> +	xe_force_gt_reset_async(d->master_fd, data->hwe.gt_id); }
> +
>  static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)  {
>  	bool found =3D false;
> @@ -923,6 +942,42 @@ static void test_basic_online(int fd, struct
> drm_xe_engine_class_instance *hwe,
>  	online_debug_data_destroy(data);
>  }
>=20
> +/**
> + * SUBTEST: reset-with-attention
> + * Description:
> + *	Check whether GPU is usable after resetting with attention raised
> + *	(stopped on breakpoint) by running the same workload again.
> + */
> +static void test_reset_with_attention_online(int fd, struct
> +drm_xe_engine_class_instance *hwe, int flags) {
> +	struct xe_eudebug_session *s1, *s2;
> +	struct online_debug_data *data;
> +
> +	data =3D online_debug_data_create(hwe);
> +	s1 =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s1->d,
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_reset_trigger);
> +	xe_eudebug_debugger_add_trigger(s1->d,
> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +
> +	xe_eudebug_session_run(s1);
> +	xe_eudebug_session_destroy(s1);
> +
> +	s2 =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
> +	xe_eudebug_debugger_add_trigger(s2->d,
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_resume_trigger);
> +	xe_eudebug_debugger_add_trigger(s2->d,
> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +
> +	xe_eudebug_session_run(s2);
> +
> +	online_session_check(s2, s2->flags);
> +
> +	xe_eudebug_session_destroy(s2);
> +	online_debug_data_destroy(data);
> +}
> +
>  /**
>   * SUBTEST: interrupt-all
>   * Description:
> @@ -1162,6 +1217,9 @@ igt_main
>  	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
>  		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
>=20
> +	test_gt_render_or_compute("reset-with-attention", fd, hwe)
> +		test_reset_with_attention_online(fd, hwe,
> SHADER_BREAKPOINT);
> +
>  	igt_fixture {
>  		xe_eudebug_enable(fd, was_enabled);
>=20
> --
> 2.34.1

