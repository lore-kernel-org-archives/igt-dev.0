Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064F9CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3F110E71D;
	Wed, 24 Sep 2025 12:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlgZbNP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794810E71D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758716587; x=1790252587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=piCFPEhamysBQi7ClXTi8AM22jRX6azXy+n+ynDTt/Q=;
 b=TlgZbNP57f1GD8FOIEjLiM93yJujqpY1OamjSaA2XZEx66ygnzBWyUjU
 96ZivBkwNzIg2fNP7gP1D65Nw/oAw0Ho0NC+FHsSaeDcGD+y40pWmvndw
 Pptjgyi1gUMCiFHuE0BanRfxuauaFnwb9zM9RI6MyODEonclHPv1BdqWo
 8GsiLx/nuPr6I4h3FCtDJaubMBTBFxlWhgMJvv8E3P9CSA54msBL620M4
 WEymfa1TV57N6vf2M/my9qvshLTz0dua07Qv+zyF6HfuAFQ0wLXE5sJ2V
 PnRDdYwIgLAegXFVXp6kvSiel4y3FOX1FnmR338pu5JVJkjd3am6BUnfI Q==;
X-CSE-ConnectionGUID: 1hza6qSHQGase2LOPmDGpQ==
X-CSE-MsgGUID: 3B1EbFlxRLiqDmOgkcecdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48576923"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="48576923"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:23:06 -0700
X-CSE-ConnectionGUID: ch9G9pw5TZG6JhqAt+zS8A==
X-CSE-MsgGUID: jFoQ0dgARRye6ytT+LDNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176857203"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:23:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 05:23:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 05:23:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 05:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpuDnSpzRyJXidxBW3POB9RfgUQjyCoKip/tVM3DVdPwpFbLyzdvvN0oahpe2RkL/lq6E4Cd8dwZHz1Mgh8FT1kHBXpY0DnRv+P1MjbVxtoRFKyM0ThIZD81OpvR6ughu/SpWAPP//Z299D+Nw0YlN2kCxYctuHYhCoAFztou5lPtnrTTp2tvuGqYca9Pss9slndjWgYKXoR9VLHr9u18CAIXk3hzjdg5y7O+1vc2eIEXkLWDdY7rxUq3ttD8gcJdg8U+O74wlo9v8ALiybCLb3EjSpsoJQA9zZLF4EpF8niWwdLshD77NYd7o9N5W4s4NXOo3o3OakKjG+UzVPUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkz9/Su0EJij0n7Y4O3K1ZyGmJ4iZOt+VtYyexWthDk=;
 b=mHmjA3pygMMIGVDtmIKmo/ebXVrP+wiDIGVDp1czR5lyoproOrl4hpqtTlJqfMpnjuOE7DIqLYnZMFCTDc36CAc3I97OJKzGLECx6fP630xj4oBay+plVrv/d4522p9J8z8IrQlEDFOLP+Eg/m//AOMJY1hexfg8gFyG4zjh7VcKP0+cq1YZPfLpvAjVGY0jCVwCIz7Ax21m5Yb9MAzC+RvI9DUhr8WG85uF9FEi4X9xC1Gh8dMUbu2u0cRo0EfgdopQ6bSULJrQ67noOFf1iZ50jjzL2wyY37dWBfL55VkB5Q8/UJYl96hzPWOxtRhUySY3Qkdk0LaPSZvT9dXssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB9518.namprd11.prod.outlook.com (2603:10b6:208:5b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Wed, 24 Sep
 2025 12:23:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 12:23:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Golani, Mitulkumar
 Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Skip DRRS-related tests on LNL+
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Skip DRRS-related tests on LNL+
Thread-Index: AQHcLTYvLpAKtoaWuUSxsE9sZ4bbO7SiP82Q
Date: Wed, 24 Sep 2025 12:23:03 +0000
Message-ID: <DM4PR11MB6312EBD8876ABE4F31359CBB901CA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB9518:EE_
x-ms-office365-filtering-correlation-id: accf2fa8-3819-41a0-f306-08ddfb651c27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kXVDrGvFbt9pP6KMcJEflW9TnIZDLZyVQ8f775GA/03NzddUlc2I3AQ0sigt?=
 =?us-ascii?Q?EJsfWZTHc/2bOfwsztsDPtVztVk1PBVmw1RORaOLIFnTnJYnV7DGIwgAxQwe?=
 =?us-ascii?Q?RqkvZHr+Gv8bvKD0YcyDiGKYk09RbTvDKmOkFA4i7G5emwSqx6oJBnpczxKn?=
 =?us-ascii?Q?vE42qTCfwfu8EkxH2UP6ec6xjG8+uzzS7pEy50AUYY7QEaCPq0R0zwUU3f47?=
 =?us-ascii?Q?xAxzeEw9TUL5qMBbo/JFhq9nB6wZpHTJ8IWBhEPcC7d5DpwDedhRHMc4cqPU?=
 =?us-ascii?Q?rjgV4hJFwfC6zTBN1vbUMSNzs1fWtDscLyF6p+c9AbCFWIzMy0Bdld8SA2Hl?=
 =?us-ascii?Q?60/D+zsGyDUAZLfCpLHKM4W066EO0TkRF5GBNR4J/ALIA7s/2vtPIpOlFd03?=
 =?us-ascii?Q?xMXdTGLNRw6Uz+rbKmOdNpeIjZvZhLxEwquQKTn2L76Pyg/sXl6FMtGDYHLb?=
 =?us-ascii?Q?GyXUZAQKtHqEtZhdRv7OOyhFt8SbcujiS5dqtFopt0o32ep8565EsA7vwcIh?=
 =?us-ascii?Q?vvhtLM/Ra8rE7kCbCPgpLWUQHyq+A3j5wqZ5SB2QgZIoNNwUZ3KMWtkzSB3S?=
 =?us-ascii?Q?t2DrBeEv3afCL606h599eyGDxskuDJMCDhaQIQwisUBHZDgneyxJx4Vh7c3c?=
 =?us-ascii?Q?vkWFgSCVr3owSY93rZer87cEha27KhYELXt+O8LMO9tlYND5gs/xFNQvP96J?=
 =?us-ascii?Q?v0zGad6RYThK3hxRp5LoF61dQmgUa5IZd74Z1O6II8ZmQTH5QbkLL9PdscdE?=
 =?us-ascii?Q?XdNNW1+uqCUdluU22qdPsA2GQyZUWFgAFPIM3FVKmbc2lgWGoNMjrGsscSBV?=
 =?us-ascii?Q?vgzo+0yRHOGsSzWD+1uYk+fbbrMyVKC9sWrM5NSVZW+srNsRSUI5u8MV+pLV?=
 =?us-ascii?Q?n4/b/ekz0vGBw/EzbjwSHvbSGSrmlFS/4d+5MLKOmHUvWfpnYyYFdEpKFjMv?=
 =?us-ascii?Q?JxL+kO+fEZeNalbcm4tkCq+R51o8Adu7nZDiyIYm2Gzqm6lzBmIvyMin/Xgn?=
 =?us-ascii?Q?E2pu0UUz9P0IyPREN2WcYSDbGbcWHpR0dkYNmnE4/q4zSVl4jEy6glebiWZH?=
 =?us-ascii?Q?a2Hlr+k29dlbYDtwJ4IzKk2YT2eU0sT5sbFb2VqTgquhpITOL6m0j0pee2g0?=
 =?us-ascii?Q?zkYJlCLPCjbI58t7YWTCo/7QHa9KUlHEJgzxG83n/5pY+yLJEXmi8miqZ37/?=
 =?us-ascii?Q?D9Q2XiexwPgCLbOFRSH+q5DYH/NcOtiZ8E2bBa1fJgNxTOyQzh3sC34mtnx3?=
 =?us-ascii?Q?rSXebtO+cTLAng3ueIzd9Jnud5MXJxe/N2vw/CRe1LoTvVTvZJXiKA/0PHme?=
 =?us-ascii?Q?0YU3+LyAy5LG+6Cn0+tGb0wuNwMBaAbC+iZfhxDNd1ciOmdZTqsd1D60JOXD?=
 =?us-ascii?Q?ZMCaCl4NgyI09IeqbDixeG4LhH8WtSmddQBdkAefBJc009P91i5Hn0Ge6QMt?=
 =?us-ascii?Q?GALcYx/XC5BCsPpj73uNgH6meXNh9DFIqfd5Nk7iSWKHiyZz4VKtJptdLc51?=
 =?us-ascii?Q?vQggNR2bkhoi0cU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mO/lv2XeammAqJYsSjR6M7PW3zfJCUerD1KYF9UQD4/80FddOuLX5Djv9k7v?=
 =?us-ascii?Q?3wgmxjN5IyVHzVdI/u5TJ9JFar0PQesXq1esCbJbykORPqTVh7M957usJjvj?=
 =?us-ascii?Q?jGy0d9L8hNAQ4oXl+QQWYrHlVMwLXofCQipfolND2A+NEQHMbAql+2zzxjgI?=
 =?us-ascii?Q?3Z6sKhahPVVF3otAbt4ZyvvcC6HTaSShDWp21t8sURCOfhGGTywi3djThnAm?=
 =?us-ascii?Q?pqGECsIQWghWYLvXUH5Jiir4K6lB3A/8lkjrwqBjvHMa5xqJUjqOO1bjR+2Q?=
 =?us-ascii?Q?6UsmsXL9K/7UqCrW3hDDmV0jIU0rHyJxeu6K/PtyZRZU/HTSI/05to78KgYz?=
 =?us-ascii?Q?BSgxe/PSS3jiYNm4Jfeaq4lllD6sDcPyvvzJSClHf71nsg7yfMF0Q2C7T5NB?=
 =?us-ascii?Q?DKkhjnKfFlNmCFdbIqZGozT8gWulWS+VBkQ4imdaEusE6IuhTU3cVbMwaSVE?=
 =?us-ascii?Q?kBKD8jq2svovdVnP4558CgC57yzeOlhRCtUauBbwnUFBIefhGfRCebFEM5hp?=
 =?us-ascii?Q?pGs9KbdnD4jr/0XjI9kga2ngM2PWKSyiCAhquqJ6Ds9DKD4xU+vHnxJOYq5i?=
 =?us-ascii?Q?3VAkPpaSd81FFjrw0q3UZ68kk+K8KeTWytK/B1g/+CO7up+A7rftQotS3EAI?=
 =?us-ascii?Q?Ff8E5ylC90utmmJVZrM/qTCES0FeY0PGystB8sUWrVjhnujbcH9gEGSkuTUq?=
 =?us-ascii?Q?t6y2lzF02ESiFsahpKrkxWTFKHSpLcMrbsa4mepi6H8qH3jrx0g8e9mfst62?=
 =?us-ascii?Q?GCbvs3LTCSes+pP6IKarnHaOo2H5xekr64WpwkrTQkPbo75tgJjIYJbi9+uW?=
 =?us-ascii?Q?JHpJ1tLs4yFAd4KUY1CHrpzA40Vma424PkPuRLvqr8U49O0q87ift0qobiUN?=
 =?us-ascii?Q?Ha+aKJ2Li0frs0AFxzY9AU9r1CACheLahvM04zvi6Pqg/Kxj5tLvbLMveBXJ?=
 =?us-ascii?Q?QdWg/aVdhI3HxoqhGxtXaDRyVQttZLiqoadL45mCkC7Ys/ad/YKzo6s9bdjj?=
 =?us-ascii?Q?esFQF1hg6wACMbcu96Qn5PS10sNq9ZvUQFI1SvgUMqI9IwWIQ8WY52RbAVpi?=
 =?us-ascii?Q?zW50AemazJTyowwyHAVnjmc0v6IVtPlRpAxuFLNMbLE1hpFv8EbHJohWUTju?=
 =?us-ascii?Q?C9dsD9E/WEopJXWy0m9PEWw8r+6TfHmbVGe2QqPpzoFcT8P8fHHak7qoc2GB?=
 =?us-ascii?Q?TA08o8Bzx2WwFQ5qwtG7h85ljWCFGxo9ENcnmNAv0D0MWmFP4v6rk7XxBiHz?=
 =?us-ascii?Q?bOhamC8fHin2vYb7AyvJz1Qk4ncl3iy//iqrtrJWL/M+3xGDEEsmVXg8Iphb?=
 =?us-ascii?Q?+k1RwoDiVMvhIy+bpBHb/5ilZjqNhdqYLbotu8OJAQoY6EKcqJ2Jpqld6zUW?=
 =?us-ascii?Q?ldfgUjNagjnDzYFycharKvuo1aC+r4SlkLxT4ErfATA2SrUEza67ULSvfx/H?=
 =?us-ascii?Q?6Od4N6lFjPG96/sRpdQDJTdJDzHIPvXIGkbOr8k54WoElEQSL++0N0qZnfoa?=
 =?us-ascii?Q?NF2ZB1c+amasg9xyO4FmMT6HPDHwCsxNnrqJxeek4hEtq06qcP6KcKXzYVaL?=
 =?us-ascii?Q?WjjU6xqReDBomO+XHTc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: accf2fa8-3819-41a0-f306-08ddfb651c27
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 12:23:03.8982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EttoKAnrfe4OcK4VF+lKPLTcrA2P3Oc8fUOdm0SwHDiahLz4b9NF6IL4PfyTAzP2Amzb4GUNx+5MGriIfVFb5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9518
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Wednesday, September 24, 2025 3:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_vrr: Skip DRRS-related tests on LNL+
>=20
> To prevent false failures and maintain test relevance, seamless VRR and D=
RRS
> test cases are skipped. This ensures the test suite aligns with current h=
ardware
> capabilities and avoids unnecessary execution on platforms where DRRS is =
no
> longer supported.
>=20
> Bspec: 68917
> HSD: 14016007525
> Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-
> ville.syrjala@linux.intel.com/
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 233143770..94ff029b7
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1016,7 +1016,7 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  		return false;
>  	}
>=20
> -	if (flags & TEST_SEAMLESS_DRRS)
> +	if (flags & TEST_LINK_OFF)
>  		goto out;
>=20
>  	/* For Negative tests, panel should be non-vrr. */ @@ -1030,6 +1030,12
> @@ static bool config_constraint(data_t *data, igt_output_t *output, uint=
32_t
> flags
>  		return false;
>  	}
>=20
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
> +	    (intel_display_ver(data->drm_fd) >=3D 14)) {

Can we add better message for info.=20
igt_info("DRRS is not supported on LNL and newer platforms\n");

> +		igt_info("Can't run DRRS has been defeatured on LNL+\n");
> +		return false;
> +	}
> +
>  out:
>  	if (!output_constraint(data, output, flags))
>  		return false;
> --
> 2.43.0

