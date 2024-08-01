Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A75C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA5610E93B;
	Thu,  1 Aug 2024 12:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjZaHflm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF9210E937
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722514511; x=1754050511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O5OC0p1UarS7Z/cPiBGsZaXfZ67JC2H9OXmvtqBCOek=;
 b=SjZaHflmEZVum2D7Dr2mzSgkmmciMyW40TZL1K+t3NNQuUlFDqLCYNU0
 Dab3dRJA5DBdXAa+reqqnp8glBfTopxkabDyz/kbaLBNe713eC55AcEom
 q4WKUecVY3ojsnuW2rARRpmPXwM8V43dZGIYD4JvEW7Kk9MdgLtiWnQUk
 X8dRr7nHzt6j32i9ANv2ZBiKk0u9V4tKjWHTOfru/w3u0FBBV1g8t2XaH
 LnFfE3ga3lsm662DmJdgE3i4n48DXy6u448ONA+wF3e39eF5r8lIlO2L+
 onnOutMNNyxUjrbjPBA5ly6y4aoyDQ5Zv/CTjgMjVocJF2UquVNFfnRta Q==;
X-CSE-ConnectionGUID: U+67YhA4Qyut1kenTelFvA==
X-CSE-MsgGUID: LQlTs9K4SLSRMsWTtNFW1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20617945"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20617945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:15:10 -0700
X-CSE-ConnectionGUID: X/73pCnUTpm0YEFZfRlgHw==
X-CSE-MsgGUID: y0FZ/e1XRZq7JU2BZ+iqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59862676"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:15:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:15:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:15:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:15:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbhehsS9rP5N+peDcyJUiQMNMUlCTX1Ij6ovE365Y3qJLsxU6YauT1E/93k5Igx07VhoJq4sEsOl3pmStgcVBGCLcz1u4Fxayj97Dmn4/ei15RakQ57bX8NQ5WnUCMUEL0Z8ocPo1Rq3HrwYhGGq4s4Fp06BEU0ysKL6d74lCq75wu2M8XRXDiYeJZtMXtVf3RFVn2uuXRT9ZqRQ+KzlY3aW+SLRPf7SO7NlmdvWTZ+Ea5KLnSNiMtGbBu9Za9D81FQ4rw0xR0Pfulas9383uadmyKATaoFqNjRaFvT5WqSpm1YVeMTVTTzVGWrzHMQF9BRxSmZw6JYLlFs4pBWYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dYJ79cMRl82QTt2aH0EMvlfwZDf7a1lEmo/kvWfQ6k=;
 b=BPb1awsZSDP2xxgID4yi6scsooEM4ORcsFcdLQDylpZYQNzIcNZUd1b8X1a7CBoNciPwX32v6SOw0sjIaYj9OLZ/ixku+7KKcR7qnqbFmfPJGRLZcaB7oHrgxuLo03TRQmeS/iJdgh1LjDrae8+PHBd7w9DrsLWFyJX+1jVuiFGNvkq7aQRkPUabgfzcR0giGbducLgJFzUQqWlC7hRjBTqL19gmsD54WVwv3wm2cnvKkQCZKfHsaDji2TiUQ4DI4fwz0nc91hTPfz4oXbskIHCp/Oq5MRZ32gHnOPEBde7KAaEuJFyRoDYnBF7YFWn/39aHfValOOEdGRQexCB3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.27; Thu, 1 Aug 2024 12:15:04 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:15:04 +0000
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
Subject: RE: [PATCH i-g-t v2 16/66] tests/xe_eudebug: Introduce basic
 exec_queue testing
Thread-Topic: [PATCH i-g-t v2 16/66] tests/xe_eudebug: Introduce basic
 exec_queue testing
Thread-Index: AQHa4nZGhOhZ2WzP90+7J45S4PNAebISU9gw
Date: Thu, 1 Aug 2024 12:15:03 +0000
Message-ID: <DS0PR11MB72641B342159330F3BF6A9BDD9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-17-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-17-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB7642:EE_
x-ms-office365-filtering-correlation-id: de27a950-b1ba-4f26-9a2d-08dcb2239302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?vaks2o6g8MG4+zTTO8B37QeUjFarFil5Hu7Id+VVObpUeOiPW2kXBYoaIv?=
 =?iso-8859-2?Q?RxPn/vTb8kJiun1xXir0mf+V2BduSHVe+RhhbSKwjbvwBjsPrHlvWDoltl?=
 =?iso-8859-2?Q?+HvqEAPCrLPxGkbKiOj4mNsHpWH8LuQ4AUb3MefrsoWrRVYrkj3Z68HKZp?=
 =?iso-8859-2?Q?+Zjk79pXMB36VEyj19KWIm1yPXE4TgXOM/B3p67lAk//bBDK8/a2w3+mm4?=
 =?iso-8859-2?Q?0y99N7bnPnQnHkOCeZIVr8b8CdMtG+TewjsioFuK6BRF630l2UNMUtRz5p?=
 =?iso-8859-2?Q?91BaXvgTUlTV5DFAVIfVvjMxizoQriHmbzyscFGk9vEQEJkEFe9WwPi3pP?=
 =?iso-8859-2?Q?O9Y1cDSFBVET6yd0BgSZUrjpFY0J1AFABX8RyvgKd6wf/TJlE+LmmGe21j?=
 =?iso-8859-2?Q?pTrJl63Uvoe6LLlNErVoRrAby23FJt1vxxAbZIO/FS03vbQE3r3hkezCeC?=
 =?iso-8859-2?Q?yj6Aa1sw7zqOTAzSYJP0d0njPG2AFHCPc4INFVVxb+TX19a63UhUvWQscs?=
 =?iso-8859-2?Q?zjgx/Wu05qlqz8kR2vbeY/mYfh8H8Iok2n6dnUSlhPjLUGA1csKoD/BoUz?=
 =?iso-8859-2?Q?M9kn0yJEOO6+Xu6ElmKVe0sFp23hEJOFLyUbXRuRHQ58MYaXujqly7U+H8?=
 =?iso-8859-2?Q?pdt1hKxZkz+v5a0O1RRwNqKNrbd0cszQMg/HpER4SeGMWgQZbjhXeT+WhJ?=
 =?iso-8859-2?Q?UF/XZuNQX1yqzoqzbqgBplQPGlAKypY+7TTu2Z+duNLWQLPO4YsHWWQ/Ix?=
 =?iso-8859-2?Q?dS4heqQhC6TlylFKQfY9H1Z9/9SA64/Q7DAh6S+CDx+fqySBAXjk0d6Oyk?=
 =?iso-8859-2?Q?srUYepaUeU0j32sx/SzOqglLRk0TnwTm6BldTKKLk1ceO73YulCl9RPaAU?=
 =?iso-8859-2?Q?EnceUUfPmZMq8039i7oNMzorcNI0Nbia2Okz5H3ricBdxRe8t7nsTUZcI/?=
 =?iso-8859-2?Q?BGipxzksx1svnKzukzQLF8/PkyC6IglewGD/ARSNcYXxXF7QYtdnNE+O2T?=
 =?iso-8859-2?Q?F2yHWtcM0UvR84jlKBC4ICGPLnNT0R3hV3Tc69eAEzgMGs3dh7wEGUzWvu?=
 =?iso-8859-2?Q?/275y+SQGe+iU9LU3r/2SOgRqFfKWvhZQ9YAucN/iwKs9kZhsVwi5CfS+W?=
 =?iso-8859-2?Q?tIlebiBQWqJmNJGVtEx6/GJzAgmQNgob1wb35eBAAC75ZXTfDIkMZj6GI6?=
 =?iso-8859-2?Q?zOLOg59nLzg/QuDfslnGL4bCrsWvw7IecE4Po0lo+06/3B+OmiP5HYBlIt?=
 =?iso-8859-2?Q?7Z0dbRG+q+aNQD91/ExyoeDmbW0ENi4Js2Q82CwM/lh5tRjUaE748Fk1vT?=
 =?iso-8859-2?Q?eVHFX+77i+Z5j3cguGsGlYSaaaKJaYUPOLjERHobrZ3TE3OrOkYqMbkArc?=
 =?iso-8859-2?Q?7nXw3PqyEZTpJ/bM5WxYd7ucoExyVRbIGV9eohaVhLo2XlxFluL00x3+Qi?=
 =?iso-8859-2?Q?CmK74Kev/lLvRRPLztUlxrnTwP2+qF7DFQPDgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?/ENfbQ8iDbiEP6xJrUxe+BqSXqww5amnqC0C78/dF656v+Jkig0rtsNoZv?=
 =?iso-8859-2?Q?i022Tu6G76nVDwrMRd/R2l04Mg6lJXBciLPcVJ2ja883quF7LInmnxGs2V?=
 =?iso-8859-2?Q?Qy7b2PnGHxvfdfW+uvniO0/2wmLYOKGmaDaEmPQ9+06E7Z5l/A6KL4mcYG?=
 =?iso-8859-2?Q?WY4urqJ+MZzGyHB7uK/4S9Ak24hA4khXCCKMj4AWMILg9kbsGZWWJcj5b4?=
 =?iso-8859-2?Q?5cgwXkfcsjtVCRIDkVf8c2U5HfqEbKS82nbLxEASa67xwlf4NSVN7kfPpo?=
 =?iso-8859-2?Q?YWgUYyovVhd6739i5yxR+pviDUQxmNNnECTD8v4byB7orFlZjP3aidFrUK?=
 =?iso-8859-2?Q?BUVUA9IcVQ6JvovuQXf94nyvNX40jml5k1q84n6WYSPDqR9wmFcihbUPaX?=
 =?iso-8859-2?Q?m6wrgi2Dw2fbEeTxFBKXmByx7XGE5L0gybf5JZcf81BBiAZO+Jd72M3MMJ?=
 =?iso-8859-2?Q?DiuWUJNkv4SpVUjCVV7hsBlfUZy/8H6MeddeItRkWa3DANF+iwXZwmJ7J0?=
 =?iso-8859-2?Q?k7BchskWAb8QaIBkG1KspDEyWM3K5dZy4htY0VqJVSe4Rk97TkzT9WdRPa?=
 =?iso-8859-2?Q?4jORu4tKLQJ1pe/cF4aae2ToBsBGj1BLrRz1kJDgXjPO/IJM8vlFHK8NgC?=
 =?iso-8859-2?Q?K9ZmxPNVu8Qxzaz0Tgr4GUu7COPvge9hxgerPmqWw0+L8c9kAf49KjzdGM?=
 =?iso-8859-2?Q?jc+mTW6iTouSPTcIyFV0+vvesXuqf82wKB00CH+I/ynHxhnxLjziIzufKU?=
 =?iso-8859-2?Q?t8XgP+HLEEOQGqpY4dVztcmgroGcz8JlFYcb8RXd6yp8LbigCgWc9Mqe3N?=
 =?iso-8859-2?Q?/HcELeeL1naz+O6MmsMIhp9If/GRvCy1i0dWkwSbgKL1yPAU1xoUYaMtYl?=
 =?iso-8859-2?Q?CnPEzuTyErbwpW2o1goXvSvHUMoiiGRIDfkpGwWWWDhOBdLUDi8P5FZxP9?=
 =?iso-8859-2?Q?y5yxpU/hHYbmtsS61K9eym1hul5JkCy+Njc8oJH20JTsYY7PK71LtjtZJ3?=
 =?iso-8859-2?Q?AmBhTN73PN0qEmSkmItjXk6YZFTQjEn5mI4TK7VfTMZeYEPqwxjH+EdLVp?=
 =?iso-8859-2?Q?bzsJgbCNPh+4lzrL8crqTCj2mACf37qTKKHFGBo8R7V8Pr3/IbcTY90XnX?=
 =?iso-8859-2?Q?ne4lx261rhSMvEmMEd/DloF2iDkCzy8YmdlM3EqWp521lpspHuju046D4H?=
 =?iso-8859-2?Q?ftcq2bcSuFicoWC+o7qacaVSujVQNGBT7VQSXz/5COQLiq1iQ4AMd1Sjh2?=
 =?iso-8859-2?Q?KJvnMj+PqsWYiy1rwkD04MERmr82PHb2ZsC4Mf0A5QmkS1mamsXa9c7ilJ?=
 =?iso-8859-2?Q?CGCu53djjzMUbS7edubsPuEu7PmxfW99GBrlO2BpjpV1v+ESXQBT4CjkHT?=
 =?iso-8859-2?Q?xsUKrCtmGe2+LoaIpIImvRDv2pbqPP/WLFnFiZjsFIOvIN7mWwT9yPQ6lW?=
 =?iso-8859-2?Q?wszJlOxSk3xl/8gggi4OfEizayjm+GNUuM2iPMwUjHZCrVppjJw9vRgSy8?=
 =?iso-8859-2?Q?zki0DP86tQ9QlBATaCxxy/sLhOx64RcMGrtX7D8DdjVCeGrUJeeOslpypp?=
 =?iso-8859-2?Q?6zZkfWGXj9DkZStPme3Tg8T/8eoARmxeDmMvgxR16c8JtTbZdOQhixAdvM?=
 =?iso-8859-2?Q?r3El0jXAmZpAQgByrZaFqy28M3d/NyH5RDqWlT7AfA/ec+XmE3z4IRkaQ0?=
 =?iso-8859-2?Q?//pNfB/R9WI1fyWt8PA=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de27a950-b1ba-4f26-9a2d-08dcb2239302
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:15:03.9630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pG83M+4jVAV1p6paN/hCgme1P3NvGWBwP0MT6rz1wiKH9TQcI2g6NpEdLm2VIp4oGhQVZtT8lzMR30RgoiokHDv8vHohp1POym0h+C2sAxDSkeAGeHkAzxglo8h+/sVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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
> Subject: [PATCH i-g-t v2 16/66] tests/xe_eudebug: Introduce basic
> exec_queue testing
>=20
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>=20
> Exercise events send by the debugger on exec_queue create/destroy.
>=20
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 64
> +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 60 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> d97e7914e..4051eac53 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -17,13 +17,16 @@
>=20
>  #include "igt.h"
>  #include "xe/xe_eudebug.h"
> +#include "xe/xe_query.h"
>=20
>  #define CREATE_VMS	(1 << 0)
> +#define CREATE_EXEC_QUEUES	(1 << 1)
>  static void run_basic_client(struct xe_eudebug_client *c)  {
>  	int fd, i;
>=20
>  	fd =3D xe_eudebug_client_open_driver(c);
> +	xe_device_get(fd);
>=20
>  	if (c->flags & CREATE_VMS) {
>  		const uint32_t flags[] =3D {
> @@ -39,6 +42,51 @@ static void run_basic_client(struct xe_eudebug_client
> *c)
>  			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
>  	}
>=20
> +	if (c->flags & CREATE_EXEC_QUEUES) {
> +		struct drm_xe_exec_queue_create *create;
> +		struct drm_xe_engine_class_instance *hwe;
> +		struct drm_xe_engine_class_instance bind_sync =3D {
> +			.engine_class =3D DRM_XE_ENGINE_CLASS_VM_BIND,
> +			.engine_instance =3D 0,
> +		};
> +		struct drm_xe_engine_class_instance bind_async =3D {
> +			.engine_class =3D DRM_XE_ENGINE_CLASS_VM_BIND,
> +			.engine_instance =3D 0,
> +		};
> +		uint32_t vm;
> +
> +		create =3D calloc((xe_number_engines(fd) + 2), sizeof(*create));
> +
> +		vm =3D xe_eudebug_client_vm_create(c, fd, 0, 0);
> +
> +		i =3D 0;
> +		xe_for_each_engine(fd, hwe) {
> +			create[i].instances =3D to_user_pointer(hwe);
> +			create[i].vm_id =3D vm;
> +			create[i].width =3D 1;
> +			create[i].num_placements =3D 1;
> +			xe_eudebug_client_exec_queue_create(c, fd,
> &create[i++]);
> +		}
> +
> +		create[i].instances =3D to_user_pointer(&bind_sync),
> +		create[i].vm_id =3D vm;
> +		create[i].width =3D 1,
> +		create[i].num_placements =3D 1,
> +		xe_eudebug_client_exec_queue_create(c, fd, &create[i++]);
> +
> +		create[i].instances =3D to_user_pointer(&bind_async),
> +		create[i].vm_id =3D vm;
> +		create[i].width =3D 1,
> +		create[i].num_placements =3D 1,
> +		xe_eudebug_client_exec_queue_create(c, fd, &create[i]);
> +
> +		for (; i >=3D 0; i--)
> +			xe_eudebug_client_exec_queue_destroy(c, fd,
> &create[i]);
> +
> +		xe_eudebug_client_vm_destroy(c, fd,  vm);
> +	}
> +
> +	xe_device_put(fd);
>  	xe_eudebug_client_close_driver(c, fd);  }
>=20
> @@ -253,11 +301,16 @@ static void test_read_event(int fd)
>   * SUBTEST: multiple-sessions
>   * Description:
>   *	Simultaneously attach many debuggers to many processes.
> - *	Each process opens and closes xe drm client.
> + *	Each process opens and closes xe drm client and creates few
> resources.
>   *
> - * SUBTEST: basic-vms
> + * SUBTEST: basic-%s
>   * Description:
> - *	Attach the debugger to process which creates and destroys a few vms.
> + *	Attach the debugger to process which creates and destroys a few
> %arg[1].
> + *
> + * arg[1]:
> + *
> + * @vms: vms
> + * @exec-queues: exec queues
>   */
>=20
>  static void test_basic_sessions(int fd, unsigned int flags, int count) @=
@ -
> 548,11 +601,14 @@ igt_main
>  		test_basic_sessions(fd, 0, 1);
>=20
>  	igt_subtest("multiple-sessions")
> -		test_basic_sessions(fd, CREATE_VMS, 4);
> +		test_basic_sessions(fd, CREATE_VMS |
> CREATE_EXEC_QUEUES, 4);
>=20
>  	igt_subtest("basic-vms")
>  		test_basic_sessions(fd, CREATE_VMS, 1);
>=20
> +	igt_subtest("basic-exec-queues")
> +		test_basic_sessions(fd, CREATE_EXEC_QUEUES, 1);
> +
>  	igt_subtest("discovery-race")
>  		test_race_discovery(fd, 0, 4);
>=20
> --
> 2.34.1

