Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F313DCEACEF
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 01:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFD810EB9E;
	Sat, 15 Nov 2025 01:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWyYKa2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814E10EB9E
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 01:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763169648; x=1794705648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RWug/qAQbRBx1fyYyKtA1cGn/SvD0jj8QgZuL1Nqnu4=;
 b=hWyYKa2r43d8ncWm7Y1xhzDk/Dal40b3+no3XMv6I7hL6i7mnBokroW/
 E7uNdVFNjXsD92tsgM75PKoRtzBwR+fyfINrXBV5dhriBv2qep3fXnWzl
 9CKmEIGJ8XiJrM5ETywNLeyFPE0vgbXb65aBCtCML0ZhA6p3lGx6H3+oj
 HfdMfqEH9LsEzzqpDJR6wGdzy1zUgBJRfFWDhAZAOwCt53L3qOyRU+Eoo
 rzRT9IVjF+wy4HZwZk4KvJtTuUkvqxjQQycXLobpAGFM5vHvZDW/GBZAr
 cnv1x7vRqzliT25FhpwYkOZk2eeqGXIbNI4bE0Df3a2NtvdZVP5TBLLjI w==;
X-CSE-ConnectionGUID: XZbdTQQ2Q7uYnj/pv8iFSQ==
X-CSE-MsgGUID: NpNEjIRyQdqnl0gRfchUZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65172850"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="65172850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:20:48 -0800
X-CSE-ConnectionGUID: B2NZ70YPQEaXnpdIbGuV4w==
X-CSE-MsgGUID: sE71CtJ9Q+G6uetbrywqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="190347328"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:20:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:20:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 17:20:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:20:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPrNDTVIl39LsCW1qiPUIUg3rkmOshCHDu+BBz5YNQe+cuZMgDo8BpGHfpuj4RD761wWBrTa4D0iJFz76bMt4u+S5vDu5xhyt+05tTtRAiqP7Qfrewx4VbygRF36Rro+DHusxSgX4eY9xizZtopr/dTBiRRbm32jYq50JF3eo57jjq1nYrmduIPrgOcOEmt3jRWa8/beiA1MFaKDOZIM3cV9Rn7VVC3q/gsEwcEmFMlHiAYfFTig/t0xFNnkWj/cDRDtxS4oCykJmSEr1J/TIP+jVDJ1pto+tkTQ4n5qo7VYLrGomMDQEeUkbUPvxCrn8Z2UO+eI4e5fMIdffcixQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCZph66DmnnLgna3EaNoR8GufDmvo8GibzrJTqW4xyY=;
 b=BdWC9BcByiHhqr92DAHKtIgPTKdQEgOe6loa6OLeMXlj1EBMAt6ea9N9L/HHhDoPZ/NG6bOYJ3GWL3Dm2sg+HvNHrHbxZxeV3do5wJCjYeCS4EDRODLjIpeQ4TD/yfhYzIBN9aRjrhY8H3Pz61jn4g8G4eoE6rpQNIns4EypJCqSiD8ffGQJhf51bLsgZLO1XBYl2OuNz53BlzqUKs3T1IYZRlQHlslzSjpUgLFPY7vNVRNNBUbDCXr6mL4xVouA3+KGzJuQp9S7l08Oh+k/gl09dS4W2tTe31tjmZQPmgwW5n1O26bjlatfVztLJTnYV2uRUvnABALX8fZCC9JPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 01:20:45 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:20:45 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Thread-Topic: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Thread-Index: AQHcVc2rJcljZnnIX0O+laaQHE7q4bTy8FpA
Date: Sat, 15 Nov 2025 01:20:45 +0000
Message-ID: <SA3PR11MB8046EA556CC8005F0125B03586CBA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251115011730.3700391-1-zongyao.bai@intel.com>
 <20251115011730.3700391-2-zongyao.bai@intel.com>
In-Reply-To: <20251115011730.3700391-2-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB7641:EE_
x-ms-office365-filtering-correlation-id: 9f0d4318-0fa2-431f-5e5d-08de23e53389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?K/TgVSEoPisWEOUd9K6webHedPDoqLLsAl1EHA7AgmSfol3mQy6lGWSVNNj1?=
 =?us-ascii?Q?gjfvgGBnIaXom4au2CMC5YGkbnpImlkyJSPbRaUy1pu3geZbCDV4rjUKM2zl?=
 =?us-ascii?Q?45a7gBoXwGcLTYuM2sZd8z4B856u9/DerHNGUHxGQrzUMMnXZku7MhBQJfz+?=
 =?us-ascii?Q?rJeE2zWhW2h4YVnb2MoWRK/AX9fMWAXe94tsTfew6fo8JSy3utGCz0GAe1j6?=
 =?us-ascii?Q?9pLq2FTGNhsnm1sA7yCXipvE2TPj6KZTyzusS+EHSeAvUF0myw0lTN6dDbH1?=
 =?us-ascii?Q?GI/eaaoMxoisq0a2IhjKzNVfu+p5G8Wab+AoGoR/B0nlPc5N0QPz5IJQiBMu?=
 =?us-ascii?Q?z8zXMO8zAFK94ZsyNTNWw5FBgkJMwOe1eX9dxIFOsKWK7h2TBu+l5pN2qoI4?=
 =?us-ascii?Q?R04jWRjBKTIZLTSW7B9NF1KH9HY9V5iW4UBGbwnmZMUhFU/mqv+KH7gedTcQ?=
 =?us-ascii?Q?ammTA5/KUiTa0eLP2lVFkOgdsO1pvdhch5CFyKjkyxhZShlJMdUrx4yWlzwk?=
 =?us-ascii?Q?LZIX75YsP5WcsZkDYfbw23HyiYvr553Rg11bjr2Rb+Dg9qTa/VOZMfMEBbJa?=
 =?us-ascii?Q?IIf1IzxoUkvwOnMOHMoV+Lybaee3ebycqGrUfg3cXak4B3TLIry0RWhsTDuS?=
 =?us-ascii?Q?b14UUKwBjo+2+rTKh4B943DkjWIN9Sjf+JaYF2YdiGr+dK7Bg2DLe/YPBrcl?=
 =?us-ascii?Q?kkoUOL+MLrw3YP3FGnLAIzC4afMOJqiX6km1OrFhRx34KJmMnmEgK1cXQXSP?=
 =?us-ascii?Q?Z9w8Qm1Yo2isKgoqsXGfQ+eTtbqYzmzPZ0HqeUAX2qMAY4pk3gC6TnJBRMzl?=
 =?us-ascii?Q?1Yb9y+EfPLnH2RbEP44i0AFuQAy3qiEIHEEGeYI1Oz33+CLJdHrbBaTo9LNF?=
 =?us-ascii?Q?5PW/89IdOVayKHRTRpUmyJ+TZcR4bw95E2uEuJC5vZ7LFao40zaiKjd35t7y?=
 =?us-ascii?Q?zh0AT2ePqYM3BEakyhz/z1Mi9jApu7UV0jThr9lKYFbg+D73aI2RjhIXizRY?=
 =?us-ascii?Q?CmsxToEj3TnVFVeaw0Lj8zSWlfva0+xVIM9AlRUb2hKciY93MMBs6jgFcQiN?=
 =?us-ascii?Q?GGfmVldWmW5cILLRKYuox6G5DIK6WvMHJ4kjqhoxv7wi8zAzk43L3nMyoUNP?=
 =?us-ascii?Q?YYlLnK1cNJQYMWcBymc8HYm1kqI9vUamAoK8c9Bkg2xCiIACYtmaK5J5ett2?=
 =?us-ascii?Q?hZ/gBp2blm1qAlTj8ov1sedz/tuSrHffkvPB1W2GeTOd+OxPjqH05yd7uDQm?=
 =?us-ascii?Q?BFdL9z5IfeKQmYPSgLRK8Lhb6vPVZlqG206t2SVjUc+TbOWTFNea+m4y6wO2?=
 =?us-ascii?Q?1QSxkrnkqSI1VToeJyuN+3mK6NY1y3Rd7qLPNpJ6QpiPkqCKf5A+nYdSZm+f?=
 =?us-ascii?Q?634RRuJGdZb81LQ0c1dBmop2yd6S+UsWRtu9y7WWKWhg7LPsK+3e8iGnQLrK?=
 =?us-ascii?Q?EbLYtBRAyI8b7PtKqjb24m7qaZ91Z2fEDNEx4v4Q5UiDjWCiMGHjHYuqrkgp?=
 =?us-ascii?Q?OWCClEfUxElcazab9xDYGDQAd9xbM/D0PiJL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q0/jNH0k0aducxh9qyD82YZGuOTWyeS3fms8FFahLnxYEVweOJzy+ce5fDBu?=
 =?us-ascii?Q?w9oOlkHq8RWnfK9Z7XjV6jG4d9859c27TDxI+mxxi5PbVBBsw2xJUDICiZaK?=
 =?us-ascii?Q?3LxtI374wJnSGYYsUY58O4IwfKP/QCsOYq2q2lVdt3snrg6zo9j5f0ccNdpr?=
 =?us-ascii?Q?8pTmx2D9u0e5ZDHEVPaXxCEGOn5YFyhrRNxUBrg6wUentfdQSxasL2JWmpkH?=
 =?us-ascii?Q?CvJzQAyWJAWaS5F0whhthZ8geZR1t06xK4Ntnos8PYJjEIUhaeLQlPTjJvAc?=
 =?us-ascii?Q?2wir41BJVIGTV1MUv85JaapA6sOXPk0iNR2HrHsldx+Tu1vDDTokji1rihmN?=
 =?us-ascii?Q?ouGAPP8DRKrAXxpP1e7Lb0aRhcDXVZwJ9OL/V20syxI9MkWn2motODUf12A5?=
 =?us-ascii?Q?xoegd9cSVTIbf2JvVYHC+dSQ6AJ7W7Fln7ZDj4luCml2BiqlGU/rKMUxD4HY?=
 =?us-ascii?Q?TrlB2n1uYGTvBIEhm6JV1hEGmsK9CseBbQPQe4UVtA4HoIfYgLja45n0oDe0?=
 =?us-ascii?Q?a0JJ8ryiQHfOPZ1tFz+2RNPooUJPUNCRADw7yZLaO5UQXMdF+LBS7BJxW5zP?=
 =?us-ascii?Q?wdm81z7hVtVxALoDOeGBRJczLbJTQtP4bd4YEYZDfUHY95oC2yP10t/J2xPC?=
 =?us-ascii?Q?dBOu4TO0cuTsripGdk/J4hhFevUqVouW8ml/yGfku069e1KiKGlSDKjKvLKK?=
 =?us-ascii?Q?YPSY0FBbR7HWY3dVLorTcSQppySc/hAjuuFhgQuOxfdTD3c7fTAhQ7aIMuS9?=
 =?us-ascii?Q?xSUQHvFKmAxGvfgY42Y2udeXV/8vFeDCQ/VTnIBTFuXG2eZDnxxLOnh7h/id?=
 =?us-ascii?Q?uS3WafMgCbMktlJVH6+84P/OKvGxkAR7AkCTF7Nt3KH3Mlw66FCVK1eu9S+Z?=
 =?us-ascii?Q?at9H6X6PfYBNbuXt0T2+CLsYOQqYYa5jBQi/X8ooc4r1PBQ6FgpoeQT7XraF?=
 =?us-ascii?Q?eti3of9VRercBeZ8419f5q7k9VYFEkckoFV8LAQOxfSHLKiOR7VcsVoLjIJ3?=
 =?us-ascii?Q?+2rZkYSlNWOCFIx2ievxvu72AkRM0RJ2VpPiug3mZfL48/EAu62w476TTj0x?=
 =?us-ascii?Q?01S7hzdwhRNVRYUZ298NLWGOmF/Ifd4mY1LceJvb8I/zs62pArnysYNIbkkA?=
 =?us-ascii?Q?+Y0RcXsoqvi3W38DqoQuuorkojYuGTp3wmZUCRhJ/VrAz7qGTSTHARqWXuns?=
 =?us-ascii?Q?EuUSBKVKu9JQhQ/hGCZV957p/Zhczt23HxAFF6O2QYW4taxeacfQkxYT8ojB?=
 =?us-ascii?Q?JkG2i67+g/oJTPz64tAyqX2d89vsifd5N6AIHHg/n34SvLEMDlk6chZ4jofZ?=
 =?us-ascii?Q?LFd2gNYQWtoIIQdR5zJtx3jZedcP/iaeDhysa2kslQPZdrYJhms49gT2ozeE?=
 =?us-ascii?Q?QJWqVDGoqMQ8kwyD3ZU1L3TsV+8uDrv84FSCpHaDpqKxjb8en9nBKar1sHBb?=
 =?us-ascii?Q?0W0SJR+e5nzg8hOyTVzvw/2r6ZSyrR7lO1tkbKIYnRKtMrHBqp50a73KJqFS?=
 =?us-ascii?Q?/CcL15ftiyf/DEIruj01aeCl8pn2nUrdi90Y7unjvyr8VG9zbaTAoTmbwkwn?=
 =?us-ascii?Q?pTRToRzMl25LeVBECYM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0d4318-0fa2-431f-5e5d-08de23e53389
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2025 01:20:45.1815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XDvJ5JHlpxUjQMLKZIUVGihYYY5ZWDPgfra4yESz7LjgZN5xKELSP7hbuuRK4EHYmqMbKhPMTD03KO13X+ScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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

LGTM

Reviewed-by: Xin Wang <x.wang@intel.com>

- Xin

> -----Original Message-----
> From: Bai, Zongyao <zongyao.bai@intel.com>
> Sent: Friday, November 14, 2025 17:17
> To: igt-dev@lists.freedesktop.org
> Cc: Bai, Zongyao <zongyao.bai@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Wang, X <x.wang@intel.com>
> Subject: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom(=
)
>=20
> For consistency with the igt framework, use igt_srandom() to generate
> random seed instead of srand().
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_pat.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 59dfb6b11..54bedefbb 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1161,15 +1161,9 @@ igt_main_args("V", NULL, help_str, opt_handler,
> NULL)
>  	int fd;
>=20
>  	igt_fixture {
> -		uint32_t seed;
> -
> +		igt_srandom();
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		dev_id =3D intel_get_drm_devid(fd);
> -
> -		seed =3D time(NULL);
> -		srand(seed);
> -		igt_debug("seed: %d\n", seed);
> -
>  		xe_device_get(fd);
>  	}
>=20
> --
> 2.43.0

