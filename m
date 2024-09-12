Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA995EED606
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887E089CA4;
	Thu, 12 Sep 2024 13:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcFn4hPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86D89CA4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148634; x=1757684634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2yF/Tkv0DOsRB/bT8M3Sp29xWB9cfeRXEYSMlXY+w6E=;
 b=HcFn4hPQTkfxXbS/lw65i0hBclEeTZghSEj0rU8TB+1QOeJwZ3IkMnpt
 p65L1n5Ye0ubvZCny3V8oxiRJAtDHDg07rE738UnKZVbk9+VSGtdcLOvM
 5l2y1bdTtqhd+ENis3M4wql/ljS0dMf4jGyla7B0/fFRBkJDrqibLLHmB
 ftcq0cNXH9y3ox2Ouy8A7veaU7JlUZeSwoWPecOopLfcHoudDoyfUCwNb
 +QSRQdUGi3rE50zRgZAoP/szNC5bov8/iQwTXR2i/a0EZeKaU89A37mgI
 /cIKBtCGxRdQ8Z62MuhpaTRWCZd9zo1lji+C/pDhMGzMlQ/SKUbX7BmXC g==;
X-CSE-ConnectionGUID: TBAFSNOvS36tv7ZtHlo03w==
X-CSE-MsgGUID: Pt62+GHbQ/O6dM/07Mf1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28890497"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="28890497"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:43:53 -0700
X-CSE-ConnectionGUID: lvMX9jKVQqO637RSTxsLPQ==
X-CSE-MsgGUID: gj9ZuLlGTU6xnV7YkWYnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67544104"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 06:43:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 06:43:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 06:43:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 06:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKT1r4wTP0ojY7jDFwCH5plMXAJm5WRq57GaryqjpOiF+eH+PGaRJdGZDJv9uZTHaLrdiXtdAPMDlMWVSDsk7UpvapwvH/Bvzb1q5THPZOMPcNrzQdbE88LRs0WGu4UjUb/XQ6y6J77j4Jd5Zg/nFFI9y0Y4FzLzjxUyIJ/84ImrMBhm2aLU6YHFB1xiJHXqUZXtJMl54cOB/dflWLCYSpHrqFS2UPufUNONtdXmvpoBDIdK/Vuo0ja2GLxNZSfEMlF7uQiNOf3OR5cfkyegiH9eibNz0iw3HQjCWQgVnLIcmbFXZtTYs3tnzcHUelhZ7x96IKEpoTA6D4vjmX1VRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwNtcz4s6SBy1s9jMejfe1ooSqKttElNCdEt00SW/a0=;
 b=xqw4P62VEPEn8l9/Qr2ercu+f8VBjtkogcuJzh9OG5jbbhRPh3sKd8TC+cEZqn3zBgInJYBZxT2JPm4tohv8FylUbfmOrtF8u/nKkXo/0SzXddlbEdBGlA9ERypcB9AOA5l6XqIMyzkQxwxZDSL1/6GWJfVsqLLrTz/9USsU8nm5ZPVxQW5WBuwBPYG3dR5dMd1qwPV2KCrjOwgLmUWecqLGtxd6PfREbyD6JD0g+t5fOs2yrPTurrWwZzRMjsQLH8bR4hTlyZvRrYiC9+GHREmXLcWGFJp953iyb8daGPnvG28uls2ACEy9PlXgVPiHYNvyhLI1Jfrrc/O6AecyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 13:43:49 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7939.025; Thu, 12 Sep 2024
 13:43:49 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
 mst_cp_enable_with_retry() void
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
 mst_cp_enable_with_retry() void
Thread-Index: AQHbBRjbwz5Ok/I/40mqwl9klDpJ1rJUKTWQ
Date: Thu, 12 Sep 2024 13:43:49 +0000
Message-ID: <DM4PR11MB6312678F65397388465DFD1490642@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240912133421.718496-1-suraj.kandpal@intel.com>
 <20240912133421.718496-5-suraj.kandpal@intel.com>
In-Reply-To: <20240912133421.718496-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5093:EE_
x-ms-office365-filtering-correlation-id: c4223b8d-32d7-451c-ccad-08dcd330ee73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NNAfGuCjtO+xcdxeJPK3y526idl2WCI8hBSsuuzpfcsghvM/JOmPT0jjFK9R?=
 =?us-ascii?Q?7Zq8Wmw5qnun8jlakXB0QNQQXFqyM5cVZ/K2oyv4WezxNBjiKIGgNkD9zGQq?=
 =?us-ascii?Q?W6O/yOxkKSAFLTYyX/okpqJUk+Dao7cUFGbNDBiijFd17/Dwycp9OzNLTThH?=
 =?us-ascii?Q?StE+DYDx/cybXnVaPkecO5KrQ+8snvwc57DgWqBh+d7e3VaAvf9romttsySb?=
 =?us-ascii?Q?dAH9jXTcHv+JoyczMjaEQEw1EEy6nQBj34DHRHFfCkLutHegu0z73vA5825Q?=
 =?us-ascii?Q?Z6BBd3L66p1EwAztW9/QUbMIhVW3MD/y8S5feKeqr7aF70UE4qDokPCxo8yN?=
 =?us-ascii?Q?iyfHIATwu7KMJ1raICC3pEl5jK0G1tCVC77DEN/j9bcjKFBhyJEUXuol71/H?=
 =?us-ascii?Q?IcQXt7E8V0CFnnksssx4RjuXpvC2O5cEtNleYAh4J+3YN4biCah8RVPMvqgu?=
 =?us-ascii?Q?M5Rz6i1caezvNfz+VKd2VpQW10ExgkB1oslIqGqNMASWfcwB1//eQ9fPMhEM?=
 =?us-ascii?Q?iP20U1jGNBRtNVcAyX5i+4gB4h9tGClMEL+r+Z8srRFxy7XlzB0ubAcd6GIb?=
 =?us-ascii?Q?het/zP21Fe6qKmM1zrebDueNLQjCmvtIaP/eM4xwUEwcs1TUXfUOVnJspMLO?=
 =?us-ascii?Q?qd5tF8QarmvwX/z2KXQNc1x0NjdT6c6CwfrhmdHr+csAHWo4fJMjqwSGijSh?=
 =?us-ascii?Q?pkw9k193hC93i7bMwLw9G6XQFH9xDXqKUzz5C1XKIAh5O/qFel900oVVz6Kn?=
 =?us-ascii?Q?WZS9nYmT/Q6rkEJXhQ2gWdMNyyGDrS3zoUWA6piObHlqNu/ivJN2D6DYD43H?=
 =?us-ascii?Q?4d6bUC5GfkyglNqQsyAa+QJ+dK8MA41yR/KkCZbj5G1xJaXKsnx5WlpceohC?=
 =?us-ascii?Q?MmXnMhDJH8gWtKNBU9ILAETGvcsg0LDzJzuRYIj8S73b2xRod/pARDUVK/GR?=
 =?us-ascii?Q?9VYGH1rcTtmAQPX9kw/gkacnsJ8sk8gmsEGbE7Ps62eOLKmp1CQxZkHtKAof?=
 =?us-ascii?Q?KIofIn8imaHjMWAT9QaRG4egFPyXB7Re9BCjgbIzhAfEj8eRci7fdywgq8+M?=
 =?us-ascii?Q?oPub4WxJJfej4EkB4pNKxwM9X3Qp5CkqWPloWvAvS2dHIh5w80mC7h6olaDf?=
 =?us-ascii?Q?sq+OTtvluqyh9cJahsg6Va1TSOGvQsEp57FodUyaM9N/5RwhCSLTmrMyxAHg?=
 =?us-ascii?Q?MZ2S7o8HwpOpuh+1V4qxf851P4Ma3Mm8uRVe9iEAuN00ZiCLXg475k3ZMgTj?=
 =?us-ascii?Q?TyQLxAIrxBV6N5WKFOr2FZthOYvcSIJ9GPYpynhDekDtBumhSKrBCMAfn1JS?=
 =?us-ascii?Q?6/00bWLkrrXhDfspuchINFR1Hhj0OKfFiYfR9kygx7Zn1/qg4+8b/B4hUrI+?=
 =?us-ascii?Q?TezE5JkQhWwnAIDWi5jJFjnWhIqJp9oiLtgMuqixav3Ic9Wavw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3BaIJYjxi4JM/pcTKiL3vstFD/hX7HjHsjZrC5oSuA+7BIaVfM9SE6lil+fM?=
 =?us-ascii?Q?v/rW9mZM03TOcornJBI59sj6hDzirkhE7E5twSRT0NqhiHDPoSmy3R+dUvyX?=
 =?us-ascii?Q?l2N3rkFINW4SwDowyVJ8OandUiyXF8apCgVhTEEU3+vi2x432zEAtTQPBd/W?=
 =?us-ascii?Q?BwFVBFYm3SLgipEU8AZkH99jyV7Ge47O+XpgtSIG38aHXpi0zm0pqqNwCniE?=
 =?us-ascii?Q?e6TNMjzchp5y21lGOGm7yYf7YZjqCnj9S+NewEcM38aEA6LQHO+FRqnUE+1F?=
 =?us-ascii?Q?g5ScrNQdqjKqPIIsykVdezuh+uEQ4eVS9rWhno5RGKHGu6/zy8YJOmFfXVda?=
 =?us-ascii?Q?Fj3xE6J4+xtvukyWpt0GrRhghIcEaJyQsYhLh6dXjYbnzqbqNnJA3wk6lb2j?=
 =?us-ascii?Q?lQQH0CbQsC0qmu0psQqe1CeBxxZChvdukUVNzdIAN6QZjhYXAO/n+DMBBfjL?=
 =?us-ascii?Q?LN0bS5wpE5uAVh8CHfxrnRcPTULNat5Fpzh8ukB+e/zqOzgIjyQjPh6L67lE?=
 =?us-ascii?Q?G4bbY59fY5g+hWcDzmur7bKxFmvmf/QxFLHW26hjYGefkNQCkFUs5qEqodzA?=
 =?us-ascii?Q?m2c00HpL43qbl/kSiE2X4rVWWvVicP0b8cKhqQlhoE89rF/eyKKXOyAd51Yk?=
 =?us-ascii?Q?id6wxyIk0TpSAdXhHBxyyc5LB/A99QEiNzGT5+2BchiaTPwRZu6ozhaXCWYb?=
 =?us-ascii?Q?kqlD8yXf/6vj1d/CAANgnO/DSVeZZHQD+VKEA1g+MidtkBt1/aNWMD45Ux/v?=
 =?us-ascii?Q?Lgr83q4FTtGbnwnVa5IvOemS77ZFGBrn+mTT8i/QwaCFf2H+o1lom+0lvixh?=
 =?us-ascii?Q?NXuKITJZd50oj272JKeKQCE4+gKXV+fXzBNcxU7u/zqsv4ZPCwBdRWZNTlpg?=
 =?us-ascii?Q?jX/ubmhrsYBBAb+dhW2i3tGu5jwxFkBoyQrC+BPA578m5o70uEUyp5Z/ZUFo?=
 =?us-ascii?Q?oWSXIM1vWjdqUDbX2H9YyNLhf/0hg8oHpfJyPED2W/NiF67ZMOPw96hRLLCn?=
 =?us-ascii?Q?aKKRlsPV5uA9+axNfofQjjkXpDPoj9fTnWF/d3XQILl3LFeHzzwWyZZF8PC0?=
 =?us-ascii?Q?/ZM2FAwIPt1c3Xsicny4iuLkH6syznRkeyb+NgP8BrVJ1yCMsO6TaDm4ZvQP?=
 =?us-ascii?Q?TFXSYrv3n5LhVnsR+kLeh5q8AEHLxxk/5FAP3vKtPomPT4V/8XvvPuioOT3x?=
 =?us-ascii?Q?GaPgCV2CW8IBmuWuOoTC7F13lI3ln7nxo9frV1o+Dq4tpoIFiSFsyOlxPyhU?=
 =?us-ascii?Q?UEHn+pukQViNGD0jm7PwINJMHRkU8M+FQtwB263MkqnShrtgyLORUSBEIO2w?=
 =?us-ascii?Q?ZaS89+WMpGEFT37nsoyiad+kc0DfRcdEsKehrvOBpg7mJA5s6J8svmUmWSwF?=
 =?us-ascii?Q?zO3i1kjtA3QlNTGtr72PgLInxAyIHDsmWRDKirQlZAKZXv1jZyto6lUrwNwP?=
 =?us-ascii?Q?tXpkMbKI2l4F+0hSgcebnI0qw81luutXM0Za5hwJu9Ueqm6R9pkaWkCYgWAE?=
 =?us-ascii?Q?zH7AJJaQAHO24FXxnYMqKQDjG4jJlRuABLQgEbVHsY407NJNXEbdAfxRryki?=
 =?us-ascii?Q?VZEu4+jTqxKIPsFdCu8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4223b8d-32d7-451c-ccad-08dcd330ee73
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 13:43:49.2169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcB3kS/UVNpDT4I2uYs3TmQDoQPjs2Sq6RUVyp6yR2lkUQ0vaYsaFiaXOI03s5Y/bsMEQVwBUP/oWt+LGIFQhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Thursday, September 12, 2024 7:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
> mst_cp_enable_with_retry() void
>=20
> Change the return type for test_mst_cp_enable_with_retry to void since it=
 really
> does not need to return anything back now that the color change and
> enablement verification happen inside the function itself.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_content_protection.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f17d9f2e8..59dca54df 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -662,7 +662,7 @@ static void test_cp_lic_on_mst(igt_output_t
> *mst_outputs[], int valid_outputs, i
>  	}
>  }
>=20
> -static bool
> +static void
>  test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs,
>  			      int retries, int content_type)  { @@ -704,8 +704,6
> @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> valid_outputs
>  	} while (retries && !ret);
>=20
>  	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
> -
> -	return ret;
>  }
>=20
>  static void
> @@ -764,7 +762,7 @@ test_content_protection_mst(int content_type)
>=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20
> -	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> 2, content_type);
> +	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2,
> +content_type);
>=20
>  	if (data.cp_tests & CP_LIC)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> --
> 2.43.2

