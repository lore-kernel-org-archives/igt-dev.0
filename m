Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76056C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 21:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077410E2DB;
	Wed, 31 Jul 2024 21:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6jsP8ri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF2810E2DB
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722460751; x=1753996751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qd7byfvPB94Mdi0oeSWjoltD6WlKxj5KLsSCxDIwUD4=;
 b=K6jsP8ri3Mdj5rncycTs9q8bDdLO888YoIVfEhd9+dx/+vzg3XnKsN+s
 8nZBWYPqdfgSeqGerQ0tkYO0fNgB4ZEcSkh1qmkCiedxGDxzWtiE5yE4M
 fZb/rgCHtHTit30YbBe2rNepkZ5s8Kx0UfJoIB7AMvjFRQbXjF2lFXY06
 zS2gCbNWuej6tlUH8FACGJTjpoiGWm2XDG+5ugGBz19+4qToSCOLEojXG
 L72xgoryrFvZ3j58rmAitpQrT7KVc6lC7TIpt4/7ItJl6mOED41PjOLww
 EdDJF28qPqSNFE2RnKYp0F5XIU1xhmzqpRK9/NqtiUIUC7zGhQCnKmYMh w==;
X-CSE-ConnectionGUID: 08xNKP0PTTCgEEzWNhPwAw==
X-CSE-MsgGUID: B9vWmpi4TCObYcgyRuuDTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24135713"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24135713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:19:10 -0700
X-CSE-ConnectionGUID: zkdRgKcARxeaKT7xm87pKQ==
X-CSE-MsgGUID: ASJUIxLRQya1sdM9sEsbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54724095"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:19:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:19:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:19:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:19:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLV0C7afWAx5WpN+cz1Qdo7HPevgSpvdn6cHS+WH7r2XaTNBUSznsYOVXG4JWM9Lbu5gkBEpJURQIPIa4xA0nvvCRtSN80V3ocCEIxzoTo4ovyXOwY1eujzEnr4gozVJjivA5OCvu1RRKTmMGQT//yHujjLT1oiOfCuhQ2cDkOLonSaYTFV5yvTAJfF7TLpV6IronjQVg03SeSvNTkET+ZDiA656qQNdZCy9ubVKEhr/GB9CPu0q5xBOGPXhu78V0jq0Mxxi9jg3cx6I/Q2lKCfU/fKZJEGxVK32BQa8GxBQ0+Uc5GsF0okLSwk+OcVGRXicmpok8OYkvhwmG7MFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6jmY7GyU2ZYE9712Ln7KyYw8kKaiEdCLvCj3hT45UI=;
 b=dyyrDQhpxNi9uVDtSskz6wjXw+At4JCQyArHirwzu5TXT7qbtXqez8r/NUS4sST9o3GeJ8OJlXiZDJkP9gllUlJYB4pUQ6SNJJEFurZNZIzyc/oz5n2lH57gW6H4Gh/C4rExunwqXiv3B/Ahjs6Nz13dlmlZ97rps5Gh2SJSP9UVRhugougDMVbtJ0A3qN+rBaiXavIQdQodkst8cQBRiSrm3bi+2G09pdzN6otmU5D+qeG2g5D7W5R94FduDMuFRF2q0IYAS9ZvreBD7q3DpwUVUVPYGAc0f5nQwPTjbzaX5vYp2oLW9c65X5zLoRGDP1NP3BFdJ9QjmyaGFe2yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 21:19:07 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Wed, 31 Jul 2024
 21:19:07 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_drm_fdinfo: Improve fdinfo parse
 documentation
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_drm_fdinfo: Improve fdinfo parse
 documentation
Thread-Index: AQHa4vq7NrBj1uyNM0ivDe4nAT5nU7IRWF9w
Date: Wed, 31 Jul 2024 21:19:06 +0000
Message-ID: <CH0PR11MB5444A9FB6C6362640065F53BE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-2-lucas.demarchi@intel.com>
In-Reply-To: <20240731033504.1426640-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4640:EE_
x-ms-office365-filtering-correlation-id: db7ba177-0ae4-4a84-d5b9-08dcb1a66961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jpmf01lwnu2UmhTHELSr0pVI18ldsuFMWBYJ0+dJgT6dFvidKlY6cd8HeBBC?=
 =?us-ascii?Q?x6hovdKRQg0FLCrRm2q4UZ7kP5btE45vJANZdCQNtPYmg07NObzM+QGiBGjc?=
 =?us-ascii?Q?KOTUTXeSf5n7uUTK9wDxQwDepmN413rDgHkegKUYfW/7GPvARGWgrVg4h+9G?=
 =?us-ascii?Q?h4UG3Gp4JnZO8wZhbg5JfXQaJTf3/0KQucq9wTIBBHJJ3wlh4cUQ2zKjz+g5?=
 =?us-ascii?Q?udl4sLE3aylahClI4s2c+WM3yKer27Paue/0uU2wiNrRn1cJJqDHJX6s3lYN?=
 =?us-ascii?Q?eAVGtTe8QAA9paERCzMIivpmR9rKn0j+WyFwdJQgQ9Jngip74cl09TyuN8dJ?=
 =?us-ascii?Q?gwr3uRMCX50TwR8mSsoLA9f7CRwj2xH+OwAlyxVxj4sh5EreQmL8RwhcfW4h?=
 =?us-ascii?Q?GJB5JNeVq1yJUjmmIcX/BzFR1hzUgzPhCO2UgyZBUvyaqXxPpMw6RwyKvGxF?=
 =?us-ascii?Q?4OYF59/Vov3oVhzz6a9D07E114QCr2JymqdNPoY2swy1h5lwJFoxkM5/x+z2?=
 =?us-ascii?Q?BnB2CCnLpEBdh3yZpqpq0RlNcZt6OocYjNhWT0k8/V4LQy02qAGTeoy+p0uC?=
 =?us-ascii?Q?7AgsLjKqgaUVkQVuqWSmmWJN/WM57eoDjd+U+o6u7fthNYL9AsxbgdvxGBFl?=
 =?us-ascii?Q?67eDFkRj+zAmG/knKwmmjtNqBjVGoA+LaDOLwC1Xz8x5jpy0L1EvqBetc4Cv?=
 =?us-ascii?Q?nvE+aD17VYTCyB8aOJ5bsO7KMWK3vOEBdNju5KEuWQPVXd3g39O+RyqnX5k1?=
 =?us-ascii?Q?7tFFJ78sRD2cnU/zRiCdWhgWyKj0VD9GGSDLIMvPlAJY243WQ0RNzA8RqZQi?=
 =?us-ascii?Q?w0MC3jR5ancO8AZWo8SEQyIbLUGFodo9Fl/USbo4mz3HaCu4GYLX6KSnObR2?=
 =?us-ascii?Q?jjeLoweFktswbfeEW9woiTtmNpWD2u78K6x0h5Qo4AU2Zj8Z0ikhe3dfzFJr?=
 =?us-ascii?Q?nU3kXYps+wIOiQAWHyOYKKgvslxC9z1dGMD+hHqmT+NkqMhp7pCMaVhgC1Bg?=
 =?us-ascii?Q?+RlkdtYyG/A4TjwzPVAk7EPxbDqm7Z5OA++1t+WHQ9uZWretWfY1eTXULlwU?=
 =?us-ascii?Q?9a8/ReejxFC06I4z8bSRh0nwDgazRQdDQZyO+CtclbY3svvN715Yv03gZshE?=
 =?us-ascii?Q?H+0YqOnS8lzW+BN3ajQKteYNBGrNsU1s8ln13w9dnxy7xyO/nJ8NhuktgaQN?=
 =?us-ascii?Q?qi4jtuEnt5ORNU0ZOiULGugD0RpGICLDSL0FT21YZ0dLe1nr7FB4BnCwaPAf?=
 =?us-ascii?Q?YZ8hJXNLw9RpOpYamAcOJlWuvOZ9U1ZNse31orpkj/V06ZttEb3fZ9UzPS42?=
 =?us-ascii?Q?876ZNs1czhwG7Ca24RJoWSr/pwbWmLsMLpupp+Kz4IzMbZ4VFyXbLe4FgXsx?=
 =?us-ascii?Q?FVXy8aYqft5amrIVaNLFhjPE5ADiZAZ5AQc12xndQaJO2dNq7w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZIUpKZlUB+j29/AgAgXkxdBnUM8z85+VECGupnlcHHyg8LHUtvk9zUg2Kkdu?=
 =?us-ascii?Q?2ABRKZf7GU9vHLMah7QQZTwG7f6uVfGGiG5VlcaDsGo91YhlSkivzQT+fSXN?=
 =?us-ascii?Q?rkjscJJhSMavO7VfyqnjpWlgn9RY2j77PENm2nfQ5BuNtwpM3/kAYbn5BjSD?=
 =?us-ascii?Q?qkybePEbPBV1iNpLP5RfFHoPOuQ0gShftgc6wtgfXxtytoBSMqriDgWwkrRW?=
 =?us-ascii?Q?0VClw7tguFQeD+ko8oicAqczUwozM9kT1XThYBNzUJAWlTzBVcnxuev3eFd6?=
 =?us-ascii?Q?ubiU1vxB/X+yGtQwce4cMox4LD4XTMcqURYFKjvuF4V0ynZAKqZnHKPyVlCN?=
 =?us-ascii?Q?wVgnrdIO8FkTjjkjAJVa1qoVjN0RbwJ4D+qqLvTCKmIV2TIZxmWKeLnq4Dd/?=
 =?us-ascii?Q?7NfPM1DzetoFRZLhxuwOIJYSqLY3YxGBzK/tZnf3DVT326hBOji8Clo+6IZm?=
 =?us-ascii?Q?Qf3IxbqLElECNyaIZoYrSa6swWLptM/Ks6J82ryJZoddh+I0DvlA1VPWyjl3?=
 =?us-ascii?Q?h07QflNSIgkatqXm8y2QYObLkRqlr6Z5VYt+8h0hrLNhscu63a5qsrIv8p5D?=
 =?us-ascii?Q?1I48/MyFQQPDZGRdZDPxFhH0Uhwnx6ppo8iNVEhOLS7GQ3YOdrZEqrOBCM5C?=
 =?us-ascii?Q?ILjqiAvM3v23jMSnKhSQpqrwEhXvjOhRuSxyzcxwX+S6QQVDZl+luhQfzVj6?=
 =?us-ascii?Q?IhzJnP/y9TSZJQP/Yq/uxlN5nxj/hPK3gUI9ysU9l+1Y4M6Rehxa9zlsVscC?=
 =?us-ascii?Q?L1ejG25qQaXpxTHOr6GctE8e29oHF8OKGKn0Q8acoO6VLmMA9h8FRb9vUhCY?=
 =?us-ascii?Q?Zcg+PL5eHCRHery0rbu++vfpaCLuzzkj26rvGws/LNS4I5xGXSsYDLu3A4oY?=
 =?us-ascii?Q?MOOzkGHl+j9WYKufVXEPl+vBWjEupBw3mcLwwCiwsbKTgfPE3SBpCiHVIcgr?=
 =?us-ascii?Q?RVG5WgjOv8d/llKObsKt9QmlBVnpp2Cu2ftkW3i430efJ74zec/E1EqFumju?=
 =?us-ascii?Q?6GBQEX5dQm2elb9JRhRaI/4vCvt9ysm8/rS7k5uQ86n4KT4geeTZHvy47n40?=
 =?us-ascii?Q?7UrkClSJhuzKm8J65+lz7EZKfG4mMp81ZXjQHueQmQRThaTjWFGsy/lKVu2F?=
 =?us-ascii?Q?xMd+BeEvwhfG2AVfm4IJUa1CI45RJ2zFtALKUwEx/kQGvv9uCyz8xq2kPHPo?=
 =?us-ascii?Q?dwQb/7E27z/hqIolJ1SCrlBeM85H+2rDClt24lVmtQRDdAmhnTIZ2eHQDFnV?=
 =?us-ascii?Q?UCpdgqp5umLYAph4YxbO2lJ67P8VQC1FyLdil9RAPy6i0E+Kg3IteES0nvxX?=
 =?us-ascii?Q?FmIDJqLB+TMxyKEafnaxkYjQWOQQbntgclCUTCsDsgeNULBWgouvzzvFOHRX?=
 =?us-ascii?Q?xPRT02cPXgL3JE0WEeT6Mhe5rFlkOIBWEledh6tAKfjh8q2Or9v0s/aoc07v?=
 =?us-ascii?Q?FnnScHfR5XNo4pmOVf5VmgCbBuW+l70ep4Hz3+1wGC6f3PgD62xKsAvYBoAw?=
 =?us-ascii?Q?YYAw05jMWDZK8HTNf7KO20lF4IjLUyX+9m/r+mpzGiZb9NfqhjX9pnfD2ecy?=
 =?us-ascii?Q?C84OIoX39usXXhHUDRr49YR/hFDb0GnvXf4WWUpE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7ba177-0ae4-4a84-d5b9-08dcb1a66961
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 21:19:07.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QuXFJF2Mx3rSST7C9p99TzpIHWmmn+m+1xpaSgWP1WnpK3339dMBOIBvlsiX7iXt4izWCJMyXu7RBaIs9lK1HaXvZdqukw7+JO7Qyzdul2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Tuesday, July 30, 2024 8:35 PM
To: igt-dev@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_drm_fdinfo: Improve fdinfo parse documen=
tation
>=20
> Be explicit on what we are parsing: key-values for the current process,
> likely to be used by the same process causing workloads, or by
> key-values for a random process, likely to be used when analyzing all
> the clients.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/igt_drm_fdinfo.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
> index 35f43305b..168b3c44c 100644
> --- a/lib/igt_drm_fdinfo.h
> +++ b/lib/igt_drm_fdinfo.h
> @@ -74,7 +74,9 @@ struct drm_client_fdinfo {
>  };
> =20
>  /**
> - * igt_parse_drm_fdinfo: Parses the drm fdinfo file
> + * igt_parse_drm_fdinfo: Parse the drm fdinfo file for this process
> + *
> + * Parse /proc/self/fdinfo/<drm_fd> collecting all key-values
>   *
>   * @drm_fd: DRM file descriptor
>   * @info: Structure to populate with read data. Must be zeroed.
> @@ -92,10 +94,12 @@ igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fd=
info *info,
>  		     const char **region_map, unsigned int region_entries);
> =20
>  /**
> - * __igt_parse_drm_fdinfo: Parses the drm fdinfo file
> + * __igt_parse_drm_fdinfo: Parse the drm fdinfo file for a process
> + *
> + * Parse /proc/<pid>/fdinfo/<fd> collecting all key-values.
>   *
> - * @dir: File descriptor pointing to /proc/pid/fdinfo directory
> - * @fd: String representation of the file descriptor number to parse.
> + * @dir: File descriptor pointing to /proc/<pid>/fdinfo directory
> + * @fd: String representation of the file descriptor number (<fd>) to pa=
rse.
>   * @info: Structure to populate with read data. Must be zeroed.
>   * @name_map: Optional array of strings representing engine names
>   * @map_entries: Number of strings in the names array
> --=20
> 2.43.0
>=20
>=20
