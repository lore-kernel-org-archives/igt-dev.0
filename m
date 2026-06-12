Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047F1CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 09:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4B10E9B4;
	Fri, 12 Jun 2026 09:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JC/BlkqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B154210F3A7
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781254812; x=1812790812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TJxpmGc+ZzLbXdpK8z3fMGHBtcolrFw5dec9hEp9yZo=;
 b=JC/BlkqVI0+iLvWXK7QCVZCicj6GyWXbGovvQZukI+W3F04+I2uVJbe/
 8plYwOeoIAimw5fZ6jek4XHHpNtXfCcH/cwHx+nmZHS33sMooUwi84GVE
 t5+I6TZLwqNAWC8TjI5ufZp2JZLIDQuL+S6n5+fY/g4wTYlb4X6Y2CiOA
 19Qi99i3Rpq4ulLtRPe1h6AR67vpQAwnO6kDplCUvYap7WvrHv5lYrY+Q
 Oa35ClFvzc25eBfers8m9pVG1Oro/pKV6mrTAaQOS8XSB0xv+P/QA757p
 L41IXDmC196yrx+qPrsowUT3lgnjzhJ021NBctsR9VFLy7CR0dQYh1uvj g==;
X-CSE-ConnectionGUID: YWFgjudtQ/6fhg6OreU+Xw==
X-CSE-MsgGUID: OyayNaC8QaOFvw7HqZutQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104754008"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="104754008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:00:12 -0700
X-CSE-ConnectionGUID: N4vWEG/ISYmYOhvbnpVf1g==
X-CSE-MsgGUID: 5voqQ53XQ5SbThMndFV7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250699256"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 02:00:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:00:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 02:00:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 02:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4zU862iJpDkeQXODBAXi7dL6PWbcuoFbEwSKwGUEwoJD4RvgNekfqTciAIqHNGbTKrW3UxoR9+S/7SOP2IP4U24TpWZ71It7tUAsv38l+rce2goDHH4Q6xXsOIrX4V5x8oNYZEvVbniv2Lz3kx+clpBX4ti3fyzXXrHa72TBPzeJyGOhwY54PyDrgGtl7s7H4rdO86SiPdyWrFCExfeiMlSlk9blUCwRvUl3dLnQ+M1i2ba373Brr20ZflrFUZoRy5lcXM/MibudcV93TiJQ1mWpYXep9NndXMu8Iuw41FFNw8lrzkCd5ZGyqKJGw0egz5x+JS9NRAZZwLyLLXwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJ9uRAIq3YJLC4r2sCjwqmRwS8so90FMJqglsEYJr40=;
 b=Rkeuwd2+aZTIpLi9Kl1Vl7YBIeHaSa/ypfsyFdXkNdU/5PZfUUoGykA8LnYp1W1uH4gSBDaKg+T2/lElEHF+PMkZmPiSI8nZW3VS76TN3ETLeJ1gTWV0AUSLV1esmrpezaALkotnBChafBu2pcaeRngCD5CxE1qYp6eLTGXsElDb0EcpkIIiCzKZjOYdZTC6usCqgwiLD5RSjOHUIb0ps6DMpFjJMaddo75B4qwDJinNBcjLakaKbiLkHCcpP4UyFOE6DXtlfHsMWicKSey51Z9Lm/1V3ZHiXauxtQGpUPfZEfyhXzX3m1i4J2P8dbFBaNUC4AEmPOFHuuO8m7u1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 09:00:05 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 09:00:05 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Topic: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Index: AQHc+eLwpeoByfKaUEqWdvuQRpugB7Y6bkYAgAAxiwA=
Date: Fri, 12 Jun 2026 09:00:05 +0000
Message-ID: <IA4PR11MB92511281D6B0FD6DEDCDD80899182@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260611204154.2000148-1-shuicheng.lin@intel.com>
 <CH3PR11MB843495FBA81453F87689C03E8D182@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843495FBA81453F87689C03E8D182@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|CO1PR11MB4913:EE_
x-ms-office365-filtering-correlation-id: 8f658ce4-9413-4b84-5de1-08dec860ff30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: /0iuNqdvqeND3x6mRV+5yXLaeuiZ5C92KnZJ+3Dzf3x3uL2Hp699/odxJnjhdLtdcwgGRQ5L6IoqJTMzQe+PfBD5RfDZ99/+W3DB7FDv5dLzC5W+9TaVT+iPCcoS/AVVvLbMc4cv9ojUbU853l+MMomFbygNr6bsoC3vKLv96N1lfHAMnRcXgkeSPsvd7H0SCTPnki/Jhcv9R7YAKr/al+9APLZe8nK/fkeXBUIgfXI3FL+76sGcATFAmFNqrYd6zdIH8+GX8r5auDh/il1YCtGdoazJ4irOdlsKv41QnYrXpJwmY/2azvLYPP2JCJFu7KTpOw4vayKFGARF3HjnRC4o6Zz7X8gheI2aDIQJZWgAntoouqEruvYlDA0+R42oHuFmWZ2B4GhRldA2YdRo1uOlEI+4Iq08J/Me8GfT8tLNb0SK/ten53Dxy5P3oEZtQfyA0Y0Vz2sxxWZ6Gbfw+CExt7EPLKSYelTADgY+UR9g6f9lxPOJxb+kUfCQNXh7JcF+e5UkkF4tXoi+fTwpuGGk3qdMmVPtm4e1mkbfBvwF5pAH+pPAOv1MIl3ajeI2HEvLoLN4ACsSYFnPcRHHNL6IVRoQU7Nui+pTSgpEGo1qeYYNkVCkSx6bKiEOslfugYDjIBcgJMwrdA9YaqhDPkLaCTVP/K17bGmI1cNJRkcmhXhtgbn+r5cSEYHw44A/f6HtaJRuCfLJVUkXrQ+OXA7w/qqoNLIsrPzfIoxKxgfPE01kFQ1YzxYB7NJprTVj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zzUUXXMKEm54XpuFaArCUaojcgIFx0zOe5rk2hBDic3zrEBzy8QXA3sdTSXe?=
 =?us-ascii?Q?5Gd0oNg/ByJ/G94v+GhAeMF+DD1QFb3ecwLLiqUAwKdivgWAU7msWDF0jjrN?=
 =?us-ascii?Q?neNAF6t45oWP4irSnzqJlH8oAbybB32WuE1f+WRDuSyYFPP09v8Hjzno3/R5?=
 =?us-ascii?Q?G/4E/3MiWYoURHgNsXHOGh/byRPK0HRSOySA4jxF0B1NvXAFeYcRjP4hwNpD?=
 =?us-ascii?Q?B3B4th6ye7TfCLk1bTAZOxwzqGWpdwdBfk4260yEvdXNf5kq6mUGgyxvipB5?=
 =?us-ascii?Q?KVzP7a0+szjHzamTb9Hkg4RtsmBdiKUqxDV4PDv9aXfadEtoZD78X6wH2Wcy?=
 =?us-ascii?Q?8OQXWcErme7tyiFvk2wjwwN8kK+Yjf4iZOem8cVI+b3Egf+Y2K/2T9Dy8B2/?=
 =?us-ascii?Q?u+cl/ckuC4GXZ7sHSaScRJl577wV2E+zUZqh3bTaXHxCThqAEsPOjvJbpkL/?=
 =?us-ascii?Q?Lcds4MSwoEGonX/6yjDwvE68DU5KEtL+lVKAzGKsa8cNTsEYl/xN9EzVf6RJ?=
 =?us-ascii?Q?zIqCfMi27hZVe6rQ2XpR+yEeId7aFbmpSAh/U5fT5xq7Du8G0doaNs/1O4o8?=
 =?us-ascii?Q?1B8fVpdAFIS2SbVb3ltZc4+j1OhVjGRl/KT6+p8fVMrI1NYZk3R8ZNq2tqlV?=
 =?us-ascii?Q?A9eZz7gqvYB8BKB1inGo7TF/l9lyjSfoPi8gL827e3A1mtWBXhIViCQRd/q0?=
 =?us-ascii?Q?c8AFF6wEkvoLTijL5jsYaB12tX+AY+4AwVdEH4r8pan7mY4E6cjR8iznJxYk?=
 =?us-ascii?Q?8Hvnl1aqb/2IQBRjUgYZbbOtINsgnNfzkj/qyUrYO4Dw/hFKoaBsNZWZpiYb?=
 =?us-ascii?Q?J9g/redN8ab4B0Y6BbhEhj1hKnT+yULGxNcIsH2BZRQvo5i5Avpaj9VJh6Z1?=
 =?us-ascii?Q?S+XCNMhtFh47ki0BwY0b0fBBs10+dj4AOskbM7cAbezX/f0HFEJ3aaqg31yF?=
 =?us-ascii?Q?dGEfxUOxILQOiamxH8D3b087g8eWFNbb7nzTBTyfxKI7xRJOInlfvU9UJg6H?=
 =?us-ascii?Q?OYBOJM+vFbp+0JDzLYjK5d8AkARHJxmglUPHNHoNIMqAvHwttGlBEs+hPktD?=
 =?us-ascii?Q?XniU8JQem8xr+Pehyx1b7g9TJf5pa8Qk3K0UM2/BkpLlUm87b0GIVDCWeS0h?=
 =?us-ascii?Q?Z9JvzHDROwjl8JHpESz2IxzClcLke9kVRVsDdbgeXr6L93xWxs6tcQvk8N3a?=
 =?us-ascii?Q?2sq59kB5LXPW414fxVGOm7+UeJniaApSOS3UuPoRNNqwnFgXmgktT3qE3vlW?=
 =?us-ascii?Q?amd7xxgd9c8j2xeOcLOj8TEHKJieawEilXRBJoRY67fe8vavM5cflv9wigv1?=
 =?us-ascii?Q?hT/z/LQLkqxY774H/K64pl+1E04zhw+mTr/dYah4c+kSDE7GCuZ1CwCHLWbF?=
 =?us-ascii?Q?xWav+k5k+VMXZo8kkrJrR80oYzpxzz6dEpW5DkaG7h3sjf2CsJU2KYFWTImP?=
 =?us-ascii?Q?FOM+KopIxWdUZXT+q651B3ByOJKhV5iOBoMbGqzNcKDnenSxKvnLkht+SOx8?=
 =?us-ascii?Q?UP4OIxMrOeFECwUuv1Kf+tabA2XIEeTkUYcCVJZZNFmGAW9j5JrJkN/k3FmN?=
 =?us-ascii?Q?cT2Y/RxjN0l54487oWC3flrpGCFyeNydYO4xX7ljxj8D3r4JCxCc7CNzVj6h?=
 =?us-ascii?Q?oX/wJn9B9UTgvhLfwWZnleL7n0mUxKZ3s1+w0lqx15Fd+ajUJxGhP1YYFNfe?=
 =?us-ascii?Q?Q72B/eIVeFsKkmZ88rqUWBepOEJxV7PrigVJmMTsvAYHpe2aCK7/sXdVV+D5?=
 =?us-ascii?Q?d962dtuHUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FwEFB4BJ36OQCDFO067jMQJWwC6kpQ+8+IsVuK+Io8E4518YtwpPSKwpUT9wCJPLQmLH8x8F/9A6Lo9MH5Bzh3ydq68A/KcNRNwXsOjd4vYR9IssxcpRRZkZm+9YB5OWdzBXtdqFXF0x0dxnHyyyq20QtVDTP4CCM2jQ1uSpAiH/UjAFCt0wGP5AnmGGGjfMQylOfG1Hq0qyPm6hL5rRlKQCTsxuO+DPEN2zmKLFIKmXk596MKPCdXJUfUcPEZJ48e8GaAwYt29Cw8ppxe8gOXEoBaV/uhk7Q9GM8SlZkGsgYXjED/tixZQD0y0RilYO8OvFYHzDsvp0IkQA0WACbA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f658ce4-9413-4b84-5de1-08dec860ff30
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 09:00:05.6477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwU5MgqZwizrI3StA+Wn5pm13MwxtJKqe56LSzR9d0VpJH9pkF6BmtRGaGrWvVeld3Nv7TviI0raVVkkrBZ1rw86TA9FImpB/p6kTuEUI/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
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

Lgtm

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Dandamudi, Priyanka
> Sent: Friday, June 12, 2026 8:02 AM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no en=
gine
> supports it
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Shuicheng Lin
> > Sent: 12 June 2026 02:12 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Vishwanathapura, Niranjan=
a
> > <niranjana.vishwanathapura@intel.com>
> > Subject: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engi=
ne
> > supports it
> >
> > When no engine supports multi-queue, xe_for_each_multi_queue_engine()
> > iterates zero times, causing subtests to report SUCCESS without executi=
ng
> any
> > test logic.
> >
> > Add xe_has_multi_queue_engine() helper and use it as an igt_require()
> > guard in all multi-queue subtests so they properly report SKIP on hardw=
are
> > without multi-queue support.
> >
> > Suggested-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  lib/xe/xe_query.c                 | 16 ++++++++++++++++
> >  lib/xe/xe_query.h                 |  1 +
> >  tests/intel/xe_exec_fault_mode.c  |  1 +
> tests/intel/xe_exec_multi_queue.c
> > |  1 +
> >  tests/intel/xe_exec_reset.c       | 22 ++++++++++++++++++++--
> >  tests/intel/xe_exec_threads.c     |  1 +
> >  6 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> > 3286a3b37..27e471840 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -346,6 +346,22 @@ bool xe_engine_class_supports_multi_queue(int
> fd,
> > uint32_t engine_class)
> >  	}
> >  }
> >
> > +/**
> > + * xe_has_multi_queue_engine:
> > + * @fd: xe device fd
> > + *
> > + * Returns true if any engine supports multi queue, false otherwise.
> > + */
> > +bool xe_has_multi_queue_engine(int fd)
> > +{
> > +	struct drm_xe_engine_class_instance *hwe;
> > +
> > +	xe_for_each_multi_queue_engine(fd, hwe)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static void xe_device_free(struct xe_device *xe_dev)  {
> >  	free(xe_dev->config);
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> > 8815c6c66..9f04a7422 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -163,6 +163,7 @@ uint16_t xe_dev_id(int fd);  int
> xe_supports_faults(int
> > fd);  bool xe_engine_class_supports_multi_queue(int fd, uint32_t
> > engine_class);  bool xe_engine_class_supports_multi_lrc(int fd, uint32_=
t
> > engine_class);
> > +bool xe_has_multi_queue_engine(int fd);
> >  const char *xe_engine_class_string(uint32_t engine_class);  const char
> > *xe_engine_class_short_string(uint32_t engine_class);  bool
> > xe_has_engine_class(int fd, uint16_t engine_class); diff --git
> > a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> > index 3e92dfbd9..58509db14 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -445,6 +445,7 @@ test_exec_main(int fd, int n_exec_queues, int
> > n_execs, unsigned int flags)
> >
> >  	if (flags & MULTI_QUEUE) {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
> >  	} else {
> > diff --git a/tests/intel/xe_exec_multi_queue.c
> > b/tests/intel/xe_exec_multi_queue.c
> > index d9d648b02..3d9e168b2 100644
> > --- a/tests/intel/xe_exec_multi_queue.c
> > +++ b/tests/intel/xe_exec_multi_queue.c
> > @@ -1094,6 +1094,7 @@ int igt_main()
> >  	igt_fixture() {
> >  		fd =3D drm_open_driver(DRIVER_XE);
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> If below condition is used then the above platform support check is not
> required either one of it should be present I think as the below require
> would make the tests skip on unsupported platforms or engines?.
> --Priyanka
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  	}
> >
> >  	igt_subtest_f("sanity")
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c =
index
> > 19643b887..20be33736 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -1103,6 +1103,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cat-error") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    CAT_ERROR | MULTI_QUEUE,
> > @@ -1112,6 +1113,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cat-error-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    CAT_ERROR | MULTI_QUEUE |
> > @@ -1122,6 +1124,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-gt-reset") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		ignore_gt_reset_warnings_in_dmesg();
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16, @@ -1132,6
> > +1135,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cancel") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    MULTI_QUEUE,
> > @@ -1141,6 +1145,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cancel-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    MULTI_QUEUE |
> > SECONDARY_QUEUE, @@ -1150,6 +1155,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-close-fd") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(-1, hwe, 16, 256,
> >  					    CLOSE_FD | MULTI_QUEUE,
> > @@ -1159,6 +1165,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-close-execqueues") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(-1, hwe, 16, 256,
> >  					    CLOSE_EXEC_QUEUES | CLOSE_FD
> > | @@ -1169,6 +1176,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-cat-error") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16,
> >  					  CAT_ERROR | MULTI_QUEUE);
> > @@ -1176,6 +1184,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16,
> >  					  CAT_ERROR | MULTI_QUEUE |
> > @@ -1184,6 +1193,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-gt-reset") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		ignore_gt_reset_warnings_in_dmesg();
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16,
> > @@ -1192,6 +1202,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-close-fd") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(-1, hwe, 16, 256,
> >  					  CLOSE_FD | MULTI_QUEUE);
> > @@ -1199,21 +1210,27 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-close-execqueues") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(-1, hwe, 16, 256,
> >  					  CLOSE_EXEC_QUEUES | CLOSE_FD |
> >  					  MULTI_QUEUE);
> >  	}
> >
> > -	igt_subtest("multi-queue-long-spin-many-queue-switch")
> > +	igt_subtest("multi-queue-long-spin-many-queue-switch") {
> > +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe) {
> >  			xe_legacy_test_mode(fd, hwe, 4, 8,
> >  					    LONG_SPIN | MULTI_QUEUE,
> >  					    LEGACY_MODE_ADDR, false);
> >  			break;
> >  		}
> > +	}
> >
> > -	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
> > +	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch") {
> > +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe) {
> >  			xe_legacy_test_mode(fd, hwe, 4, 8,
> >  					    LONG_SPIN | MULTI_QUEUE |
> > @@ -1221,6 +1238,7 @@ int igt_main()
> >  					    LEGACY_MODE_ADDR, false);
> >  			break;
> >  		}
> > +	}
> >
> >  	igt_fixture()
> >  		drm_close_driver(fd);
> > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_thread=
s.c
> > index 2f44d5555..cf8fec6c6 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -1723,6 +1723,7 @@ int igt_main()
> >  			if (s->flags & MULTI_QUEUE) {
> >
> > 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0)),
> >  						"multi_queue is supported on
> > graphics version 35 and above");
> > +				igt_require(xe_has_multi_queue_engine(fd));
> >  				/* Balancer can't be set with multi-queue at
> > the same time */
> >  				igt_assert(!(s->flags & BALANCER));
> >  			}
> > --
> > 2.43.0

