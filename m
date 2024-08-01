Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFB2C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 11:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749710E920;
	Thu,  1 Aug 2024 11:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qkyrh3Nr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD6F10E920
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722512073; x=1754048073;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VwFdR2WnNeO/mNAcRBoHliyicczwVfBpDWKhjMn8b+U=;
 b=Qkyrh3NrROABvnfbf9w4vPakQNieNZdUDv2kZDEZJnumGzzvTbLEDNGJ
 DFtRS/vqhp/P/ZfkmwbdS+/0TALi01ih308odoJILzFrYUST9SFJ0qMsv
 8nfFxhUEGoK6qHV7oDZvDXFiN5bivXhQF3UtprcCqrWsk3nUqjXSYeWvA
 k3yOETCBwM4JhXx18Hz/lZWwAZnwzDEooRh2WqL/qhUt1uX3mB+P2jb9H
 MoqHjlMuCKdETyVBX7CPquOp5Z2Y+2/Hp4a28eNB1Yf+xlEKRLOUTr4RK
 2imHGJUehNG/6RlnL7tFdtM+6Yz/owJ/ecMaXRaaRDvyrzF/KOqRclh5D A==;
X-CSE-ConnectionGUID: gsUes+TORm+uvOMLhT7sGQ==
X-CSE-MsgGUID: BjJAi+geS86QzJ9sv4+7gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31037216"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31037216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 04:34:32 -0700
X-CSE-ConnectionGUID: XzEKCX1tRaygKVbP85ojOQ==
X-CSE-MsgGUID: wZufobzeQ8WK7b13ICX3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55788311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 04:34:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 04:34:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 04:34:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 04:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROE7Lt/dvS0Z0rArDXdNm682SkKKk/90pUoQ6mel8mgokmhQre633ynXahU0gnsnJwGSEZQd3lGD9/+2vbEkY1pPmXqRnIuPdwVJeE2LZp5zJUM2UMBIhMPQ26FDQh3b4CRzC971eFiWV6nibZbZGYkMHgziNVN0y1/IKQsmMjK0otR2DfhV61/gjW2jp9i0zp8sR+bU76dAKV2byMwUst6labo2s8qlTzG7/mA21O6ANeCIUEx90xBh2J2o2lepO/i66i+zqnFFdSpg7s9QUuoLaA1u0BDlSfn/6vZq3PXVvpIfhMdVakMQM89PeadwMzxUqwDSkXycaGPxs8X5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGqpZ5KAXmnR3zlyxST/DwNBYHGJso1wBlLVT8L1vk4=;
 b=QTSBZiipABdR85J0qDuZ8+VZPsfKukKpE9MPMjGqF9AOoQCdRql3Wt73zIy2k/zKBh7Q1yTIZg26LxO/mY6LUeft/BzUL1Tde+q2471LVIfdUlxvOOF9BCngQ9ffLvdUk25eDqkgCdhboJxSDf9Qhc6GxAnK8E3HO+sPmYs2QD0qNKL45WI+lwxt0vqsJOH9kgpvnKog7cTL1RWNYz0Xlg2xlWM62hsF9k+Ck0nO6l/fUwDk32ZzELObhsJHyE2ZYb8SPSf/1+Xan4FhofEqb6d1RaK79IsXIbJW/LgZsTBGNb52wc9FCeat2Rsx0ijFnWeG8bmPdvf7G1EKIYw4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 11:34:27 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:34:26 +0000
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
Subject: RE: [PATCH i-g-t v2 10/66] lib/xe_eudebug: Add support for user fence
 acking
Thread-Topic: [PATCH i-g-t v2 10/66] lib/xe_eudebug: Add support for user
 fence acking
Thread-Index: AQHa4nY+u1GFxvjWIEC49SXJq3IcFbISR1vg
Date: Thu, 1 Aug 2024 11:34:26 +0000
Message-ID: <DS0PR11MB7264A7C4FA298B085011E319D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-11-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-11-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB7640:EE_
x-ms-office365-filtering-correlation-id: adc0c2d3-a69d-4d8f-cb2f-08dcb21de5f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?8MmO+hcK3Mu/nfnMgfbLqOQTAfNYP7Q7vkIiTp5KsLBCA+j2T70aBi0hwF?=
 =?iso-8859-2?Q?jmJTvtU4srzprtqYnWvhqIvo47cgjOA95Sfr4MfQAM2Vcf7V/GuSBC7KTm?=
 =?iso-8859-2?Q?trXpZI4ymMvjorDtt3jlUgxDEnurmRctpdAkq2KkgI9kvBpmqdKvo76L66?=
 =?iso-8859-2?Q?FRbdG765xnJDzVGs4slzfrNSjKnWNzOZcz5OKiD/WWdSXHnfA2SpowEwLs?=
 =?iso-8859-2?Q?UAImk2pfYE690CdoIwLEYiER7Hh4LjjHBYiJ81ub+/5DF/zfDU2v5D9q7V?=
 =?iso-8859-2?Q?8vDHiaJsPRVdsWK4TdUosbn4fXKn1syNs4dA0TPe4kxPVYkq9/Advuu8SD?=
 =?iso-8859-2?Q?zSFzl0uU2iL7QR9npNjXPBPzdTt8ChUQBDV+WdGcwgmtFoZhl0fW/jMs55?=
 =?iso-8859-2?Q?VSIcnMrh8/PhmQwa4zhrj3pyM7Qq7W2ECS4xaAbHPBkYsaGI1DMDHEwGU8?=
 =?iso-8859-2?Q?5Vke9AsH3uDIUnBm7ZcBRINNDRr2EU8m6aBpzRWE5umTvLplWzy7dbfq86?=
 =?iso-8859-2?Q?nm5fiu5MbskwA4F7nPLN8hDUvqEiM4tnONLYFvNdgxujPnKaGaP9UIfB+7?=
 =?iso-8859-2?Q?3j2lvVuwVH4707FEg0JIEW+8UpPovee92GpwjBRje3WDLIXvwTdW0KDnLN?=
 =?iso-8859-2?Q?nPA1SDiQUtUIVv7iwhcRt7BljOjdCjjaAnqWgkX3J82WX5JRaa5lBjeiBG?=
 =?iso-8859-2?Q?VoVg5nIQ2vOrtMeVkBXrvXKXuMzB0JvUCg0Ikmjk6NQlFIvkStqbStBJZE?=
 =?iso-8859-2?Q?qywLHvirjO05PtKyEum+BXStGU0MIBFuhf699GDJDiuRxLvoAX5k79AnnC?=
 =?iso-8859-2?Q?tuBtnskwzV76kQs0aemS9b2diHXtUton/73xVbWCgg5dSZWrjcnntlyoek?=
 =?iso-8859-2?Q?JQ+ghyjFrv1zvhoxGSWIlHFxqbQq/TgSVOFE6GfOgy+aQJ79G8jvog2cZp?=
 =?iso-8859-2?Q?5a4Gk7r1cxVm0kf7mXPwnOHMCGl0f4fHUWOAm0FOsBhM4oCksh1YdlkYrE?=
 =?iso-8859-2?Q?XE2Xr9XUHvG6zde+lDVgR4CRuV/lBGVZjUEupH0fJZNxH4BNb3RyDPm1kB?=
 =?iso-8859-2?Q?SRW6FsbWS9C84PPGuX33WlVb/bLWa6EccsNVb9RXSVS5RqRdy9sZELLYIv?=
 =?iso-8859-2?Q?GjWDGE120gXAq+838VTH4PosNw6kEE2yKb4CNcwJXym0CrfG5/0XMo7g3j?=
 =?iso-8859-2?Q?5/BhbV/V6Abgs8s2xsM4KrDyedZPF7whkVQmmtdoXiG7zJoUCCRYnT9Vpm?=
 =?iso-8859-2?Q?TYCQ0YfHIFiQe+VbxZtiq7dm/fkxt6y0xUjDv4UHvr+PoCcDQRwvVkUcTr?=
 =?iso-8859-2?Q?9XLrL9tyjsyKxJ6/ORpESxseG25+YU+7TiIFSOoBknT3/LnU8y0tk8jySs?=
 =?iso-8859-2?Q?Qdg1a/htG4XLCmtesyNoErTSvOeXVDHObB7T41rWe1DIyi4q/hgQYUAcNY?=
 =?iso-8859-2?Q?D/myo5MfX5v6f4WjHKa+ynN0DkNC4E/6D1T3cg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?+4568upbsE3zdHsT6lf0Gr83GQG14zmO1+cuNGv3TgxiOhGxLdaGeQDvq/?=
 =?iso-8859-2?Q?Nj7giwlIUVoIxhxtr4HbSmOGAHoeMX5f+W3Ric0WpVtr5ty6RyZdI4Wa+0?=
 =?iso-8859-2?Q?3y0smAh/k9SU/j24++nGoarRJoNtZkKmbP2QyjNnaIfYwqYxhETE9H5/TJ?=
 =?iso-8859-2?Q?bEmDEbL9qr9iUiWg3ZCuTkA650hIVwVR3AJVXJmPpjiOXB3lNl/dvhUGF3?=
 =?iso-8859-2?Q?iylH5zmlgka/74/fGu20BkU51Lmh3rl81x91ZNW4tC2rMMjRtYh71q0vh8?=
 =?iso-8859-2?Q?F6oh7SV9JtnJWB6ckizQAR4bMf48EtXZ08X6umYkmWZTau6TvTGeiMTc5j?=
 =?iso-8859-2?Q?8Hf2gom4rko/4cKG5tXuXVCSayADkU6oDpA9gIHB/vP+3+nBboW8IuFyWM?=
 =?iso-8859-2?Q?AusgI7SvexIcI+eThV4rEsFN0vmdtQbixqxAVFVV6NJjmAYEiurmIuJaRf?=
 =?iso-8859-2?Q?3OK9ZEheLZkxyHSSp6KyRLkQt9+7sFO5qynhkC6lBV3SG7WJbz9cCsxyGT?=
 =?iso-8859-2?Q?TvlV528oelthr1/UITmwuz0vByKR03RZy7lLqiwo6DYV0X9OdBN5H1jcmj?=
 =?iso-8859-2?Q?xJTkV6yIwl3HuSe6BLLY+wcuLDOsWjpPC/1sqs9jyfGYTGGvTSpcFX9SSd?=
 =?iso-8859-2?Q?FJZMLLl9PLdWq+K5aIxLBdt4AVdTTneMloToS6sanI7G/yRKNZFsk6REjw?=
 =?iso-8859-2?Q?otHZIrl7z23DUEyYRUSDkgoz76G8fvPNaDU/jH7Cf21kamfrah/HURjaV7?=
 =?iso-8859-2?Q?LdqEYj33/uvgXdhQ5pfXiF7JWQC3vOJ8ufud8R+EeEEB3Zmih3vXmro895?=
 =?iso-8859-2?Q?nREI9K54Ph0P0sgmkLtZVYKQI6C1OMsSMmvc7nuLNt4MR6pqOQD2ZkRcxU?=
 =?iso-8859-2?Q?b6eftjKHD79UJZKu6hb3r/UGKwHLeDSfvsszw9XJnstzQZ6mcb5gmVMpsC?=
 =?iso-8859-2?Q?89h7m7/+QZKYqkHJ6OTMAmNjapmoWt17aqaULXhGJ6dYpGqKtkRCHH71Q2?=
 =?iso-8859-2?Q?B69kVFxlKE5zh4z+qyuCJqYnsw1JsqDFYUy5OZskM+hNMWwgvq4+4jw1t1?=
 =?iso-8859-2?Q?YjL8wS8+di8Vgum4SiORGLraGTUcNx0jlwsdT5/QaPCUYsFWBxyJOFQwtI?=
 =?iso-8859-2?Q?2A1k7cV/mPc8GiBdVis+m1LONOcDWzgRLVkYC9Smn3p+SGSP5VUSswetmt?=
 =?iso-8859-2?Q?8O1IqTN7mEmRs3vSHTLcOgRMv2w1ie9xU2JhQC23gYSwn7cyDdYv8SGvPl?=
 =?iso-8859-2?Q?cDgQOMVN3BBF9XCyZFoDX7WKdevcESUOqfzdHD2RFabjFqdmVCedhC7Hq2?=
 =?iso-8859-2?Q?+lEQOluZ6qNCr0am1dDlKSNSRPn2EW9I9qzj0Zr+SMgXqI5JGSp2zZKPYa?=
 =?iso-8859-2?Q?ukf6AxZOcfmyyzEvwTi+i7hoDBSIiPOaORFfME34JtAP7B9QfP0nHOqhTb?=
 =?iso-8859-2?Q?bd/JD1pMmkPqbMInyWFvQoxaV0Zzvyjm5uonSt2ENtN3j/a0BtpbAvgoOl?=
 =?iso-8859-2?Q?vv7RnQMvG8/s5LDK0I6Pj5KHl/CpDsThanRAzKmEwK5sGbxzx9kebQf/SE?=
 =?iso-8859-2?Q?EeTJYl/jiYXe0HITXi8PzUkGCc7w653e0KPK+4bVW8ZNj7e3rK1ck+qVo0?=
 =?iso-8859-2?Q?xm+17K4d9srtpwxHT5Km4czsNUDO0fqNsSfwaPa3R8pzQQn0W7AKOAJmSJ?=
 =?iso-8859-2?Q?YjEs/tkR0b9jeAoEYLg=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc0c2d3-a69d-4d8f-cb2f-08dcb21de5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 11:34:26.1047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwDYT5z6ZhKWHoqXtXIlTZGC4SHzBoORLT7TrIn1JvQtgLekmFgErslTi7H9VL0YA7oBNMXKrrK4pivj3qBvhjwuVnV5VT+vAfQxO6y3AzvYmdhV1jUGmdTgVraz/fLR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

With issues addressed:
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:44 PM
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
> Subject: [PATCH i-g-t v2 10/66] lib/xe_eudebug: Add support for user fenc=
e
> acking
>=20
> If the debugee uses user fences for synchronization, the debugger will re=
cieve

Typo: receive

> a 'UFENCE_EVENT' and the fence won't be released untill the debugger acks=
 it.

Typo: until

> Note that for the fence to release, both the job completion and debugger =
ack
> are required. Add a library function to ack user fences.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 14 ++++++++++++++  lib/xe/xe_eudebug.h |  2 ++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> 8164a2d50..af7cc5fc4 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -2037,3 +2037,17 @@ void
> xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
>=20
>  	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type,
> len);  }
> +
> +void xe_eudebug_ack_ufence(int debugfd,
> +			   const struct
> drm_xe_eudebug_event_vm_bind_ufence *f) {
> +	struct drm_xe_eudebug_ack_event ack =3D { 0, };
> +	char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
> +
> +	ack.type =3D f->base.type;
> +	ack.seqno =3D f->base.seqno;
> +
> +	xe_eudebug_event_to_str((void *)f, event_str,
> XE_EUDEBUG_EVENT_STRING_MAX_LEN);
> +	igt_debug("delivering ack for event: %s\n", event_str);
> +	igt_assert_eq(igt_ioctl(debugfd,
> DRM_XE_EUDEBUG_IOCTL_ACK_EVENT,
> +&ack), 0); }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> 24336981f..ec75634f5 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -167,6 +167,8 @@ void
> xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client
> *c,
>  						 uint64_t metadata_handle,
> uint64_t metadata_cookie);  void
> xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c,
> uint32_t event_flags,
>  					    uint64_t ref_seqno);
> +void xe_eudebug_ack_ufence(int debugfd,
> +			   const struct
> drm_xe_eudebug_event_vm_bind_ufence *f);
>=20
>  void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd=
,
> uint32_t vm,
>  				     uint32_t bo, uint64_t offset,
> --
> 2.34.1

