Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FEBEB2711
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 20:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86C810E037;
	Tue, 10 Feb 2026 20:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEEdgS7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FB710E037
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770754683; x=1802290683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62zy/pJ9fFn7JRWOnumxM1YLHJgCUA7zDLdrlIZg6YY=;
 b=KEEdgS7ROSaWKUsohhXHT8WbGh+/GtnULcLxdOIwecfWWolmBx032zUa
 +OeQrSFIVAARLt6Sav161llOPguhISOpcog9UtdHoGG9cZHvwSRIPvM4f
 RyUqX32zYNADJmnn4TsUeNw2DCcycjNrKHxTpneOkGIPrWYWQpCXeW9e3
 lzyUPXrDi4sr5VX7kDDOHiGnu0CoXFOthLVcdxBDleXCuzhGUHjP7oTsr
 /4/1ElhhTO8QkFPIsM/jfhf0HGwWwD+rfLiUevTpCrYACRGGKk7a2DwLT
 V74g/G+bSgOxM9jF40K0T82W70dZHTSker6j9oXGqcCqaWdZmMyIGXdjm A==;
X-CSE-ConnectionGUID: kkCWdUetTHKMTLRQJPRr9A==
X-CSE-MsgGUID: 0RfXfenfT72UTfZVjH+MVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83332279"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83332279"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:18:03 -0800
X-CSE-ConnectionGUID: 30N+ddZBQTu9O/BPLruvnw==
X-CSE-MsgGUID: iRgMGH83TnaSqEkBEmChQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211127605"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:18:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:18:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 12:18:01 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:18:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIfqrGCTN1b9gmu3MEdXTiKXMyPznpxF1FkyK9fm8k72Q3feYsNoPXLhtTq0KloIagZmKBW6j0nmOSI8WO7Smz5PgAqgbiBA2L4fdzY/tek8FePsy2hCcUPAKfjEHnbmaDG+ZB+t4USXWZM0ICvbfN0r5/QZ2boknrb3AKWpgXM4pfiiGkGZduLZ2Td7bVGZLUXa/bQeERj2ezqQAO3w3BtNhEcN/gp36zZFQW5Mp1I4ctaKNC/lc3ctLtA8MZwQAQgXRq+MK9xCbrsKCP1GTuzmjfhlRNgh0cOyUCqsZAyoX/5RqYYydeeBEn7zwstdt/eOZqCjOeRwiGhLydCUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iD1SRNv6+bdELz5gZTuIDF6PCVcZuhS3MQJXYqwv3o=;
 b=Lb1/7YLLVJ8cCK7b82OkVeOeXI6ErGpu4LNHdsJ5Dhq1tX+/xNUUfVJgs/PgFhhImJgpMRVpazWrdrnwIxkd8WkhxCEMKnMkaE0rJCoQSVtSl8G6MkjOFhlD6tSidBeJdtaxroN/p/Wmcb6lHfEVfDazoZzTt5rV+bwsgqlvmzORlNO/mfBKBq9L1t+00NrHbTG9OSWk2XIMAVScHH29ustTSDLJSbt4DU6xmBkRZDbo4OsIvO6gzLZSHK+bW47kGs6m6e3fLMBY40A2q9DGi0FrDr0Ako3cOYYTTIbPLquvanX3XgNLB6JIlbQ60B7iOAfRMfSOZmcjix+T/Behnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 20:17:59 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:17:59 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Bilal, Mohammed"
 <mohammed.bilal@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Topic: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Index: AQHcmjzIllDeOPXaHEqub51tH9I/wrV8X/hw
Date: Tue, 10 Feb 2026 20:17:59 +0000
Message-ID: <LV8PR11MB848553E7FD207C88836B6B0CE462A@LV8PR11MB8485.namprd11.prod.outlook.com>
References: <20260210032433.250680-1-jeevan.b@intel.com>
In-Reply-To: <20260210032433.250680-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8485:EE_|SA1PR11MB8428:EE_
x-ms-office365-filtering-correlation-id: 98431060-81cd-4659-69c8-08de68e17c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ly2xBBkYOFMqsVbn224pVccwJZt3hNs+K4AO5a0dUHz5j5VARIcIm0DbKsvx?=
 =?us-ascii?Q?T1t7jmL1QHXFlVKCg4aVMdeYmhbAM68AMaIXTVphmN2rfTYzKFY6reSsjWCe?=
 =?us-ascii?Q?tjMHBxsc0mgtIbxHgA6tuPAoCmSaTERxwJWA03BCwz9LeW4WY8WVynmj7j0j?=
 =?us-ascii?Q?ZeOMDh6k4CBuZUJOF026sS2wjc546h1HoT6iT4ezErQJQ2vD8Gd61hD7Zoao?=
 =?us-ascii?Q?L3XhitMS7Y7IreLI5J+yuoIW1t5sFokWNaC9TeVOSE0qJDI2Hg/E5TZACD2G?=
 =?us-ascii?Q?6y+huVtxveJ3LQII89/XVrHZl/5JI5TSsqWV2AkozbK9uYouWUm9zfjwEp7B?=
 =?us-ascii?Q?VtYxgWOI4CIywQ+HA9AMDOYUJwB1QagLgEgadQk+OfCFKm90y3y7t5pDz1Vn?=
 =?us-ascii?Q?DB9LBh8SdE5IWJAZBblcrYnBRapAA/8x6bY344jlFZVVKn6lkfOVU9Jr5Z2T?=
 =?us-ascii?Q?fl/FI3tZrQh9CSBMyzXEQlVVHv67ERRzB7YYiKSrNepoGznQnmphCB7dIzRJ?=
 =?us-ascii?Q?7/ynzpBuPRbnocRVQGkJAPEpSDUsw43iG+tgJGvy3LeWqwFdf5eRNDbik1Pg?=
 =?us-ascii?Q?yLkHRBvLJeNo+mWrGwa3wdhWU/0M0xinIOD+Q8cMZWOF6/pWaqZrmYIi1B0V?=
 =?us-ascii?Q?g+mUCltvTMPesE1+eZcAhTEJSCtBOvfhyyaIS5Ln+EvGE1gCDMupj1BUM689?=
 =?us-ascii?Q?TUScHq/X2rgjMyB7AoOJzWkbSaCWlG+VPvofBISk5LSqcJEdL+ZlUDm+fPhe?=
 =?us-ascii?Q?Z2AFkulK7VUPZuQi289M833hZ9fmncwy35TzMQJiPSAo3K5swksDkHBJPZr2?=
 =?us-ascii?Q?Ivq4N9hKcXS4bx7Hl328hWz2yLJcFWpc3DN73lEJfz65EXPqPxb4RLhmBl9G?=
 =?us-ascii?Q?HBKtk1c+YH+qzMg4nO3NbXcTuzEf2GkWCeNL4ULRJgYH/FDmKXsdaKBomgqP?=
 =?us-ascii?Q?UjPFevfpWEVFl6Bltvx3yKU/I6KA75yufYFO79J8FHAKXgKV+a3AiVC0L3Hq?=
 =?us-ascii?Q?nlt8piOE/ztHifO05XDvBA0eX0aT9YUm53YXvbddWx5lViTI5zGlhBAJ2yYL?=
 =?us-ascii?Q?Ksf8t6dFus1po6lnNdnsjzlW2UCYSt2R0wJagiaSHOvUyIRrgxIucQYTh2eh?=
 =?us-ascii?Q?FJfplcrLFWfEm++fpGOguRjqAxtu/M3UfZ999b8pRMgLQx0rWxJ+3SO0a1KE?=
 =?us-ascii?Q?aY3U67LbR7MNC5dCz1DfvBhsWj2Lg/4uIrc5E+ResS6e14TFSdhKZUOyA2Dj?=
 =?us-ascii?Q?oEGOVW3DWn93Ky9DqHAptmqgcpTHo/ks+DX4ietNj6BT9YAsn4Hwq4oquUNX?=
 =?us-ascii?Q?IM/13RxrzJTYqralC2iwS5j/MhVDSM6CA6EqcNADvZmvmY8zAAIF1HCtdCrO?=
 =?us-ascii?Q?efKHsELRpuufLix50gAC7oy10ITgxNOtpQBH0QA2hboHA+yfV2dsILiN49LQ?=
 =?us-ascii?Q?1khH1DCpJx34+6uEm+F9VrXSNcpV9lYo0d2M75//aZv+BTRN5Bsnsz96IVyk?=
 =?us-ascii?Q?89xzRkN1Ne8BjmmKIwqrjtpGZLLQVxde8Sh1lLGfvx3Ob/1YpUvHK8icqs6k?=
 =?us-ascii?Q?u9ouWcwuW59Mg9N3J67etejyWG8yyTPoNxyexjUWiDeGScuGBiLoJiykoNWi?=
 =?us-ascii?Q?mHGfnBmnOfe2qefgVtM1VqI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3BQDQ5ViWx0HxgKWnfqak6ZTEL193zbg165Wzqw4VKCLZ/PRu84EdCYLX4Iu?=
 =?us-ascii?Q?iqBmBblrJkcSVLO1gg2E2yx1deqC8c/hBVpmJsnzxDGV0Yj85Avjqs5XFQ5j?=
 =?us-ascii?Q?E38lj7tbSzPQmdQy37IflGQmf8/zmZXCqq+rMh5cj1BOOIhZ5wUOIErOM/4E?=
 =?us-ascii?Q?P8WL8lVAfd3dn5XgM2//7/5X8r5FVfEMgROeeZlvoSXX3c8k/8VLhDdLDVXj?=
 =?us-ascii?Q?1iYQq7r75J29jhhPRav5h4mLS0p4c1rV+Oq7Ey2T8iHdqm7+L4kjmdDB3UY+?=
 =?us-ascii?Q?ocmOohzdPTS9eSsUTyA4QJqkcMjcZIIJ53lMGr87IQw8h73iXAeJAOgyEO6M?=
 =?us-ascii?Q?Ig3RcX5RcW5tYIkt6fQ1ZG+hzNb6JgNl0DWAbh0fIVx3YcZg8ep3bNWO/jiR?=
 =?us-ascii?Q?WFEKIIm/4BWgAZYub+Uivn6+kZWTSgZFPVYhF45u8L3RLTQZ/8wZQufsNO1V?=
 =?us-ascii?Q?HN3LdrvxhbZuCh2X1WApa0+D3TISjIlTaEWTjs7Sp1+PlrYYky8+NLWEHkxh?=
 =?us-ascii?Q?/9ayXk9lv/7fNFiz//wGRn9aGZy1IbLGZki0H+Y0RxACqDoE6a5RacE9bHZp?=
 =?us-ascii?Q?q39QFWo7yJdiHjoV+krUu7iDqEkNuVYr34ec9E+GBriGyWkR1aAwslO1DYL9?=
 =?us-ascii?Q?AJFdEUtdaO8raJOoY44YWsf6npLYlXvcJj7Sz55CEXz8JpbV6ELkRyl18BOn?=
 =?us-ascii?Q?1szivB+Zp8UBkNyjEqF+E3uIb6y9Gs244mALqGgzNtKQAIRZtv5ekGdZqfTi?=
 =?us-ascii?Q?1lKDYSgBdGPSxZaXzwCt9sv25aZegs+we59L2KtR5PBOyKAoPEKHLOh36Bjz?=
 =?us-ascii?Q?QZNltnPM1tjQUkoG4Opu7oBt6OQPTI3ThPYcdB1qP0bgrfXBVyPzRB/ouWME?=
 =?us-ascii?Q?sMNV95+SN7c0DE6LbRXtGcta+AcNRnR0LlzY236ya8cso8mW0F5cIkEkMfaR?=
 =?us-ascii?Q?ETCnQeG/03qGZKSGXsQrksvIt29ugt3Qib6DFr+qWZstkFfCe5Z05EDeR3qd?=
 =?us-ascii?Q?gA0NEJWNo/cSKNJnxFFCgSYqYHQi13PQk6mHIW0YuDMoPllovYKejaaZxr1w?=
 =?us-ascii?Q?CqGVdhCvxhTB2dXW4El65oJ/q/03gWEem1+P/YFLcFYNeKSVC4J41R+cZXj8?=
 =?us-ascii?Q?Myj/14/Hmrs/sgndtbSHjyZ6sEanMAAEXq1DbGqmWhhJpT0nuN8kLKtIbKgn?=
 =?us-ascii?Q?G78k7jwVcpsDSSmj1xafmcaaBBw36YLiTR6ENlyN8DWFbONVheQGLWXzgmeS?=
 =?us-ascii?Q?dmgTV51rBavYQvVZU5zJONafXTWKYNbKLa0zsTCA7PEkerHAZKl/I79zaalc?=
 =?us-ascii?Q?y0pSGXdB2yzaJdUvvzAJnlVbFsdSFpoom1Gti49id+IsJzrcJqPZ5DTFHnF4?=
 =?us-ascii?Q?kfcH3SeIijXR0Lm6kJzwqfwZPPtMGJbhl3k5/kmBDJERj1fpIoXRefegNR5N?=
 =?us-ascii?Q?lePZkyv7wP9+RTMrcMjVNf4WuY8sc9uaPkqrtDpgKC1MN2IA7ym0ZZk2DSM8?=
 =?us-ascii?Q?R5GKGC3jy9ZOWyQZUAaRdkI7MY8ZamCL1J4ChBq7/v8vv62FhIMflvzBtheI?=
 =?us-ascii?Q?YqZLJVkC7xSWUwTNt9MorF+dBwSB4YUWnplQSOkUzLx2BPIlOa44+dehuJOP?=
 =?us-ascii?Q?ILH8aZ3a4NgNTnwC8BuBZ2eT/fDcrhlumaCmioJiG9uDt5o/2Jop/DLZUgDH?=
 =?us-ascii?Q?lVMVAgZzulHuBE+sKcDfTtHSeJDVAUfBOWUzQg7m3DQ3hq+S1XvKO40NQo2r?=
 =?us-ascii?Q?0iqOTHjYu9cAyBgTugYakKspqnJFJEIB3XQU3kEnBshWFsXtlyIwWTa5iAqU?=
x-ms-exchange-antispam-messagedata-1: SkDksg7+7Sk0EL5i0ex+o/QQj10MWyC+RaI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98431060-81cd-4659-69c8-08de68e17c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 20:17:59.1519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zJ8kHPbjAs2BpMhh6Mm1n0Zbs5igluqcTDPJCXQ74CAVxOKvMpPyiChkuErH072iP/8zUpcw7dVDlHNqW7p3Q5AN14bo7JT4HvdRsOs6Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
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
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: 10 February 2026 08:55 AM
To: igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed <mohammed.thas=
leem@intel.com>; Bilal, Mohammed <mohammed.bilal@intel.com>; B, Jeevan <jee=
van.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to commo=
n library

Move DC counter utility functions from tests/intel/kms_pm_dc.c to lib/igt_p=
m.c for reuse across other tests.

v2: Add 'igt_' prefix before all functions.
v3: Fix typos, fix debugfs_fd type and add errno.h include.
v4: Add IGT_INTEL_ prefix to all CHECK_DC* flag constants and
    PACKAGE_CSTATE_PATH constant.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_pm.c            | 170 +++++++++++++++++++++++++++++++++++
 lib/igt_pm.h            |  15 ++++
 tests/intel/kms_pm_dc.c | 191 ++++++++--------------------------------
 3 files changed, 222 insertions(+), 154 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1ffcdcef3..ebf39baab 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -31,6 +31,7 @@
 #include <pciaccess.h>
 #include <stdlib.h>
 #include <string.h>
+#include <errno.h>
 #include <unistd.h>
 #include <sys/stat.h>
 #ifdef __linux__
@@ -1543,3 +1544,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
+
+/**
+ * igt_get_dc_counter:
+ * @dc_data: String containing DC counter data in format
+ *
+ * Returns the counter value as uint32_t  */ uint32_t=20
+igt_get_dc_counter(const char *dc_data) {
+	char *e;
+	long ret;
+	char *s =3D strchr(dc_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret =3D strtol(s, &e, 10);
+	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D ERANGE=
) &&
+		   e > s && *e =3D=3D '\n' && ret >=3D 0);
+	return ret;
+}
+
+/**
+ * igt_support_dc6:
+ * @debugfs_fd: DRM file descriptor
+ *
+ * Returns true if DC6 is supported.
+ */
+bool igt_support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return !!strstr(buf, "DC5 -> DC6 count"); }
+
+/**
+ * igt_get_dc6_counter: Locate DC6 counter string in debugfs buffer
+ * @buf: Buffer containing i915_dmc_info debugfs output
+ *
+ * Searches for DC6 counter information in the DMC info buffer.
+ */
+char *igt_get_dc6_counter(const char *buf) {
+	char *str;
+
+	str =3D strstr(buf, "DC5 -> DC6 count");
+	if (!str)
+		str =3D strstr(buf, "DC5 -> DC6 allowed count");
+
+	return str;
+}
+
+/**
+ * igt_read_dc_counter:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag (IGT_INTEL_CHECK_DC5, IGT_INTEL_CHECK_DC6,=20
+or IGT_INTEL_CHECK_DC3CO)
+ *
+ * Returns current counter value for the specified DC state  */=20
+uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag) {
+	char buf[4096];
+	char *str;
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf,=20
+sizeof(buf));
+
+	if (dc_flag & IGT_INTEL_CHECK_DC5) {
+		str =3D strstr(buf, "DC3 -> DC5 count");
+		igt_assert_f(str, "DC5 counter is not available\n");
+	} else if (dc_flag & IGT_INTEL_CHECK_DC6) {
+		str =3D igt_get_dc6_counter(buf);
+		igt_assert_f(str, "No DC6 counter available\n");
+	} else if (dc_flag & IGT_INTEL_CHECK_DC3CO) {
+		str =3D strstr(buf, "DC3CO count");
+		igt_assert_f(str, "DC3CO counter is not available\n");
+	} else {
+		igt_assert(!"reached");
+		str =3D NULL;
+	}
+
+	return igt_get_dc_counter(str);
+}
+
+/**
+ * igt_dc_state_wait_entry:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag
+ * @prev_dc_count: Previous counter value to compare against
+ *
+ * Returns true if DC state entry detected within timeout, false=20
+otherwise  */ bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag,=20
+int prev_dc_count) {
+	return igt_wait(igt_read_dc_counter(debugfs_fd, dc_flag) >
+			prev_dc_count, 3000, 100);
+}
+
+/**
+ * igt_dc_state_name:
+ * @dc_flag: DC state flag
+ *
+ * Converts DC state flag constants to readable string names  */ const=20
+char *igt_dc_state_name(int dc_flag) {
+	if (dc_flag & IGT_INTEL_CHECK_DC3CO)
+		return "DC3CO";
+	else if (dc_flag & IGT_INTEL_CHECK_DC5)
+		return "DC5";
+	else
+		return "DC6";
+}
+
+/**
+ * igt_require_dc_counter:
+ * @debugfs_fd: File descriptor for the debugfs
+ * @dc_flag: DC counter type to check (IGT_INTEL_CHECK_DC3CO,=20
+IGT_INTEL_CHECK_DC5,
+ * or IGT_INTEL_CHECK_DC6)
+ *
+ * Skips the current test if the requested DC counter is not available
+ * on the system.
+ */
+void igt_require_dc_counter(int debugfs_fd, int dc_flag) {
+	char *str;
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+
+	switch (dc_flag) {
+	case IGT_INTEL_CHECK_DC3CO:
+		igt_skip_on_f(!strstr(buf, "DC3CO count"),
+			      "DC3CO counter is not available\n");
+		break;
+	case IGT_INTEL_CHECK_DC5:
+		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
+			      "DC5 counter is not available\n");
+		break;
+	case IGT_INTEL_CHECK_DC6:
+		str =3D igt_get_dc6_counter(buf);
+		igt_skip_on_f(!str, "No DC6 counter available\n");
+		break;
+	default:
+		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
+	}
+}
+
+/**
+ * igt_read_pkgc_counter:
+ * @debugfs_root_fd: File descriptor for the debugfs
+ *
+ * Returns PC10 counter value.
+ */
+unsigned int igt_read_pkgc_counter(int debugfs_root_fd) {
+	char buf[4096];
+	char *str;
+	int len;
+
+	len =3D igt_sysfs_read(debugfs_root_fd, IGT_INTEL_PACKAGE_CSTATE_PATH, bu=
f, sizeof(buf) - 1);
+	igt_skip_on_f(len < 0, "PKGC state file not found\n");
+	buf[len] =3D '\0';
+	str =3D strstr(buf, "Package C10");
+	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
+
+	return igt_get_dc_counter(str);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h index e931e51af..6a33c6db2 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -29,6 +29,13 @@
=20
 #include "igt_kms.h"
=20
+#define IGT_INTEL_PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
+
+/* DC State Flags */
+#define IGT_INTEL_CHECK_DC5       (1 << 0)
+#define IGT_INTEL_CHECK_DC6       (1 << 1)
+#define IGT_INTEL_CHECK_DC3CO     (1 << 2)
+
 void igt_pm_enable_audio_runtime_pm(void);
 void igt_pm_enable_sata_link_power_management(void);
 void igt_pm_restore_sata_link_power_management(void);
@@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev=
);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  =
bool igt_has_pci_pm_capability(struct pci_device *pci_dev);  void igt_pm_dp=
ms_toggle(igt_output_t *output);
+uint32_t igt_get_dc_counter(const char *dc_data); bool=20
+igt_support_dc6(int debugfs_fd); char *igt_get_dc6_counter(const char=20
+*buf); uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag); bool=20
+igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int=20
+prev_dc_count); const char *igt_dc_state_name(int dc_flag); void=20
+igt_require_dc_counter(int debugfs_fd, int dc_flag); unsigned int=20
+igt_read_pkgc_counter(int debugfs_root_fd);
=20
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index 83dbac=
296..39e94f36b 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -79,15 +79,9 @@
  * Description: This test validates display engine entry to DC5 state whil=
e PSR is active on Pipe B
  */
=20
-/* DC State Flags */
-#define CHECK_DC5	(1 << 0)
-#define CHECK_DC6	(1 << 1)
-#define CHECK_DC3CO	(1 << 2)
-
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
 #define RPM_STATUS "i915_runtime_pm_status"
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
-#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) ||=
 intel_display_ver(devid) >=3D 14))  #define SEC 1 @@ -116,7 +110,6 @@ type=
def struct {
 	bool runtime_suspend_disabled;
 } data_t;
=20
-static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count=
);  static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_d=
c_count);
=20
 static void set_output_on_pipe_b(data_t *data) @@ -260,82 +253,20 @@ stati=
c void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data->mode, fb_color, fb);  }
=20
-static uint32_t get_dc_counter(char *dc_data) -{
-	char *e;
-	long ret;
-	char *s =3D strchr(dc_data, ':');
-
-	igt_assert(s);
-	s++;
-	ret =3D strtol(s, &e, 10);
-	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D ERANGE=
) && e > s && *e =3D=3D '\n' && ret >=3D 0);
-	return ret;
-}
-
-static char *get_dc6_counter(const char *buf) -{
-	char *str;
-
-	str =3D strstr(buf, "DC5 -> DC6 count");
-	if (!str)
-		str =3D strstr(buf, "DC5 -> DC6 allowed count");
-
-	return str;
-}
-
-static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) -{
-	char buf[4096];
-	char *str;
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
-
-	if (dc_flag & CHECK_DC5) {
-		str =3D strstr(buf, "DC3 -> DC5 count");
-		igt_assert_f(str, "DC5 counter is not available\n");
-	} else if (dc_flag & CHECK_DC6) {
-		str =3D get_dc6_counter(buf);
-		igt_assert_f(str, "No DC6 counter available\n");
-	} else if (dc_flag & CHECK_DC3CO) {
-		str =3D strstr(buf, "DC3CO count");
-		igt_assert_f(str, "DC3CO counter is not available\n");
-	} else {
-		igt_assert(!"reached");
-		str =3D NULL;
-	}
-
-	return get_dc_counter(str);
-}
-
-static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_c=
ount) -{
-	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
-			prev_dc_count, 3000, 100);
-}
-
-static const char *dc_state_name(int dc_flag) -{
-	if (dc_flag & CHECK_DC3CO)
-		return "DC3CO";
-	else if (dc_flag & CHECK_DC5)
-		return "DC5";
-	else
-		return "DC6";
-}
-
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_c=
ount)  {
-	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count=
),
-		     "%s state is not achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_=
DOMAIN_INFO,
-		     data->debugfs_dump =3D igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_I=
NFO));
+	igt_assert_f(igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_c=
ount),
+		     "%s state is not achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
+		     PWR_DOMAIN_INFO, data->debugfs_dump =3D igt_sysfs_get(data->debugfs=
_fd,
+		     PWR_DOMAIN_INFO));
 }
=20
 static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t =
prev_dc_count)  {
-	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_coun=
t),
-		     "%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMA=
IN_INFO,
-		     data->debugfs_dump =3D igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_I=
NFO));
+	igt_assert_f(!igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_=
count),
+		     "%s state is achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
+		     PWR_DOMAIN_INFO, data->debugfs_dump =3D igt_sysfs_get(data->debugfs=
_fd,
+		     PWR_DOMAIN_INFO));
 }
=20
 static void setup_videoplayback(data_t *data) @@ -366,7 +297,7 @@ static v=
oid check_dc3co_with_videoplayback_like_load(data_t *data)
 	primary =3D igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	dc3co_prev_cnt =3D read_dc_counter(data->debugfs_fd, CHECK_DC3CO);
+	dc3co_prev_cnt =3D igt_read_dc_counter(data->debugfs_fd,=20
+IGT_INTEL_CHECK_DC3CO);
=20
 	/* Calculate delay to generate idle frame in usec*/
 	delay =3D 1.5 * ((1000 * 1000) / data->mode->vrefresh); @@ -381,34 +312,8=
 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
=20
-	igt_require_f(dc_state_wait_entry(data->debugfs_fd,
-		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n"=
);
-}
-
-static void require_dc_counter(int debugfs_fd, int dc_flag) -{
-	char *str;
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-
-	switch (dc_flag) {
-	case CHECK_DC3CO:
-		igt_skip_on_f(!strstr(buf, "DC3CO count"),
-			      "DC3CO counter is not available\n");
-		break;
-	case CHECK_DC5:
-		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
-			      "DC5 counter is not available\n");
-		break;
-	case CHECK_DC6:
-		str =3D get_dc6_counter(buf);
-		igt_skip_on_f(!str, "No DC6 counter available\n");
-		break;
-	default:
-		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
-	}
+	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_D=
C3CO,
+					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
 }
=20
 static void setup_dc3co(data_t *data)
@@ -421,7 +326,7 @@ static void setup_dc3co(data_t *data)
=20
 static void test_dc3co_vpb_simulation(data_t *data)  {
-	require_dc_counter(data->debugfs_fd, CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
 	setup_dc3co(data);
 	setup_videoplayback(data);
@@ -433,8 +338,8 @@ static void test_dc5_retention_flops(data_t *data, int =
dc_flag)  {
 	uint32_t dc_counter_before_psr;
=20
-	require_dc_counter(data->debugfs_fd, dc_flag);
-	dc_counter_before_psr =3D read_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,=20
+dc_flag);
 	set_output_on_pipe_b(data);
 	setup_primary(data);
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL)); @@=
 -446,8 +351,8 @@ static void test_dc_state_psr(data_t *data, int dc_flag) =
 {
 	uint32_t dc_counter_before_psr;
=20
-	require_dc_counter(data->debugfs_fd, dc_flag);
-	dc_counter_before_psr =3D read_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,=20
+dc_flag);
 	setup_output(data);
 	setup_primary(data);
 	igt_require(!psr_disabled_check(data->debugfs_fd));
@@ -510,9 +415,9 @@ static void test_dc_state_dpms(data_t *data, int dc_fla=
g)  {
 	uint32_t dc_counter;
=20
-	require_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
 	setup_dc_dpms(data);
-	dc_counter =3D read_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_off(data);
 	check_dc_counter(data, dc_flag, dc_counter);
 	dpms_on(data);
@@ -523,23 +428,14 @@ static void test_dc_state_dpms_negative(data_t *data,=
 int dc_flag)  {
 	uint32_t dc_counter;
=20
-	require_dc_counter(data->debugfs_fd, dc_flag);
+	igt_require_dc_counter(data->debugfs_fd, dc_flag);
 	setup_dc_dpms(data);
-	dc_counter =3D read_dc_counter(data->debugfs_fd, dc_flag);
+	dc_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_on(data);
 	check_dc_counter_negative(data, dc_flag, dc_counter);
 	cleanup_dc_dpms(data);
 }
=20
-static bool support_dc6(int debugfs_fd) -{
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-	return strstr(buf, "DC5 -> DC6 count");
-}
-
 static uint64_t read_runtime_suspended_time(int drm_fd)  {
 	struct pci_device *i915;
@@ -562,7 +458,8 @@ static bool dc9_wait_entry(data_t *data, int dc_target,=
 int prev_dc, uint64_t pr
 	 */
 	return igt_wait((read_runtime_suspended_time(data->drm_fd) > prev_rpm) &&
 			(!DC9_RESETS_DC_COUNTERS(data->devid) ||
-			(read_dc_counter(data->debugfs_fd, dc_target) < prev_dc)), msecs, 1000)=
;
+			(igt_read_dc_counter(data->debugfs_fd, dc_target) < prev_dc)), msecs,
+			1000);
 }
=20
 static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_r=
pm) @@ -582,12 +479,12 @@ static void setup_dc9_dpms(data_t *data, int dc_t=
arget)
 	__igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
 	close(sysfs_fd);
 	if (DC9_RESETS_DC_COUNTERS(data->devid)) {
-		prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
+		prev_dc =3D igt_read_dc_counter(data->debugfs_fd, dc_target);
 		setup_dc_dpms(data);
 		dpms_off(data);
-		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
+		igt_skip_on_f(!(igt_wait(igt_read_dc_counter(data->debugfs_fd,=20
+dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
-		prev_dc =3D read_dc_counter(data->debugfs_fd, dc_target);
+		prev_dc =3D igt_read_dc_counter(data->debugfs_fd, dc_target);
 		dpms_on(data);
 		cleanup_dc_dpms(data);
 	}
@@ -601,8 +498,8 @@ static void test_dc9_dpms(data_t *data)  {
 	int dc_target;
=20
-	require_dc_counter(data->debugfs_fd, CHECK_DC5);
-	dc_target =3D support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC5);
+	dc_target =3D igt_support_dc6(data->debugfs_fd) ? IGT_INTEL_CHECK_DC6 :=20
+IGT_INTEL_CHECK_DC5;
 	setup_dc9_dpms(data, dc_target);
 }
=20
@@ -621,21 +518,6 @@ static int has_panels_without_dc_support(igt_display_t=
 *display)
 	return external_panel;
 }
=20
-static unsigned int read_pkgc_counter(int debugfs_root_fd) -{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len =3D igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(=
buf) - 1);
-	igt_skip_on_f(len < 0, "PKGC state file not found\n");
-	buf[len] =3D '\0';
-	str =3D strstr(buf, "Package C10");
-	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
-
-	return get_dc_counter(str);
-}
-
 static void test_deep_pkgc_state(data_t *data)  {
 	unsigned int pre_val =3D 0, cur_val =3D 0; @@ -697,7 +579,7 @@ static voi=
d test_deep_pkgc_state(data_t *data)
 	igt_display_commit(&data->display);
 	/* Wait for the vblank to sync the frame time */
 	igt_wait_for_vblank_count(crtc, 1);
-	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
+	pre_val =3D igt_read_pkgc_counter(data->debugfs_root_fd);
 	/* Add a half-frame delay to ensure the flip occurs when the frame is act=
ive. */
 	usleep(delay * 0.5);
=20
@@ -706,8 +588,9 @@ static void test_deep_pkgc_state(data_t *data)
 		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
 		igt_display_commit(&data->display);
=20
-		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd)) > pre_va=
l,
-						      (delay * 2), (5 * MSEC));
+		igt_wait((cur_val =3D igt_read_pkgc_counter(data->debugfs_root_fd)) > pr=
e_val,
+			 (delay * 2), (5 * MSEC));
+
 		if (cur_val > pre_val) {
 			pkgc_flag =3D true;
 			break;
@@ -769,7 +652,7 @@ int igt_main()
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode =3D PSR_MODE_1;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
-		test_dc_state_psr(&data, CHECK_DC5);
+		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
 	}
=20
 	igt_describe("This test validates display engine entry to DC6 state "
@@ -781,7 +664,7 @@ int igt_main()
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_psr(&data, CHECK_DC6);
+		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC6);
 	}
=20
 	igt_describe("This test validates display engine entry to PKGC10 state "
@@ -796,7 +679,7 @@ int igt_main()
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while all connectors's DPMS property set to OFF");
 	igt_subtest("dc5-dpms") {
-		test_dc_state_dpms(&data, CHECK_DC5);
+		test_dc_state_dpms(&data, IGT_INTEL_CHECK_DC5);
 	}
=20
 	igt_describe("This test validates display engine entry to DC5 state "
@@ -809,7 +692,7 @@ int igt_main()
 		data.op_psr_mode =3D PSR_MODE_1;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
-		test_dc5_retention_flops(&data, CHECK_DC5);
+		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
 	}
=20
 	igt_describe("This test validates negative scenario of DC5 display "
@@ -818,7 +701,7 @@ int igt_main()
 	igt_subtest("dc5-dpms-negative") {
 		igt_require_f(has_panels_without_dc_support(&data.display),
 			      "External panel not detected, skip execution\n");
-		test_dc_state_dpms_negative(&data, CHECK_DC5);
+		test_dc_state_dpms_negative(&data, IGT_INTEL_CHECK_DC5);
 	}
=20
 	igt_describe("This test validates display engine entry to DC6 state "
@@ -826,7 +709,7 @@ int igt_main()
 	igt_subtest("dc6-dpms") {
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_dpms(&data, CHECK_DC6);
+		test_dc_state_dpms(&data, IGT_INTEL_CHECK_DC6);
=20
 	}
=20
--
2.43.0

