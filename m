Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B16CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 05:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06D710E069;
	Mon, 22 Sep 2025 05:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvAjMT8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5D10E069
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758518983; x=1790054983;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JDQUqSlHYxQ8EKTA73+vJE8I2MXZ3tCq+4FGChinp10=;
 b=fvAjMT8TyuAkv/XGydkZRq3yFgR0fDAP01af3b2pxyd6FHxK5T5+YBDe
 oUDG30H1UywAftUqvJmbYao+7rh76f37MNZymBibdmRL4saSPCSqpV2OD
 h9/PF4IVSrMcVBJLU1jrGt3oSx5g+bFcHTFCQLsWdFlO67KKK1SVlWYQe
 P2UOyqKIwLxdXBOtEktBt3bW8N/IsOmeYJWMZhX09bf+L0/+WnHr/2gTX
 hAZvOPuTmI4wUwSKFTuJtUqcUIgA4AXxpFoJxJWvKf3B4bnAQvBiiZhDD
 9EfCr0TpFQXOyX3ZBwjyUpqBKu3TVFEM+W/hweV5z9uABoQL6+Bd8Nw9f w==;
X-CSE-ConnectionGUID: ZpaVnTkQQ/uoCEePSe284Q==
X-CSE-MsgGUID: hhVH1PF8QQWRG4lF9hEVog==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71450241"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="71450241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:29:42 -0700
X-CSE-ConnectionGUID: zFRNSAQWTaeB7ICe8n08mA==
X-CSE-MsgGUID: E8QNbH/xTGCPrX6YuKfbKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="180401375"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:29:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:29:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 22:29:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:29:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wqz9h1W+LeQ4MGQX/lJ/y4NaBD9Pvgklk8FSNYrD+Knvk20UO6ZaYQ3cuEQmRaERfBci/dj2vdIBp+ngWlrbwx8dvpmbFDcys5dk9zlKsbUu9+4OGk+wSQbyvLAdrn8DLEXxBw8fOMWRZd0gYHjzGMjduTa05aixsGL4TMmY6bWoi0EjZrr4WFoEPO7305i13DGV0zoVxCa3TDkF0VnlyzY9ol0tDmtZ0q/lLeCt49Sw5cmxKoaMR3cfRls4t3KwMYBxbqKET4AHs4mg7d+bmOijm8XzeFcgbSRNwkHi3YTMvGaEOrilTtT8Xob1lfkzIH/k5Q0wEyVICACil2clkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WuO3Hk/CudAGRiMCri3IZ6pBLutj8sQ/XXAi61vQCM=;
 b=SvkC9f2qb8OraL1PrZ5dvOgcRfBonN5n6xlr4wFjfybArueba26aGaBfxKrURmeCV1LbsgZGE62lSxbh/ofLs+Br727heHpsvYR88cXeo21nAxcxzu89uEtFd/X3BBc3KpDX/vEJvIwcyIKrdEd5e/iDNxyirTvkWWrNf0RAMoFs5V+x+Y4B+AuFqwxAjo/npHMeHM0EKAXYsW5Wvx7mUyzlA4EwpA5RaxUY1BVwo2KSYO1HSePIRJkfP7/fBUz2/GzGQmI/07bZ+9z+eSTHZNPqRcgFo1c+AC6lsBCtYnhPJ4kE70mSx47YXr67as2wyVjj3FjEuBFO9FDxtHr/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 05:29:39 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 05:29:39 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_vrr: remove check for PR support in
 sink
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_vrr: remove check for PR support in
 sink
Thread-Index: AQHcKHrQU8IPD9r7zEKftkU6t+118bSespKA
Date: Mon, 22 Sep 2025 05:29:38 +0000
Message-ID: <DM4PR11MB63127443D6B2685C16840CFE9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
 <20250918091702.2339227-4-kunal1.joshi@intel.com>
In-Reply-To: <20250918091702.2339227-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV2PR11MB6021:EE_
x-ms-office365-filtering-correlation-id: c86f74c7-ee89-46d6-6fa5-08ddf9990677
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rDyQnQwJb0LKVcmCp2j+Z00IeCLr+7Gu85RAnputj8ZP+CnzaIKkew/AwMub?=
 =?us-ascii?Q?xyFQrfEK/L3jQiop1FkADRkGSF6MXqfgj9QbQ72DUUg/Vgg7HareCEi3xjhK?=
 =?us-ascii?Q?tbZrtRCLo2RBvGtl2oBeN8rnDi929rQRCevjk0xvhsmjlB6dfCM0MxNe1iJk?=
 =?us-ascii?Q?p6jAT3Ic5WcSMqy3su5x/aujwmk1VW6jOFKbKYHLclOGA/FF7LN4fQ1aXZHg?=
 =?us-ascii?Q?qD14+o526NFDgaU61uJkGubvA3EDLBDyf3HEZFTbbuZINJzrJnl+TM7a9+9D?=
 =?us-ascii?Q?WxAvTZrKJVl0ZGqQgbJH+oEKQdMCgFV6WeyT4dMAU8EcqkklcXJERy2FNUzw?=
 =?us-ascii?Q?VKVI5Dwq+KvxCGQLXb9l7PIpwk+pjrRAsrEXHWapXvQ/2nnXZKlqOJOXeMER?=
 =?us-ascii?Q?qeCGlw2Wb+ZBIyUMAi7oP1YtKL1TNYi36yoqe5pbKNlVImglNxQAoyi9UglS?=
 =?us-ascii?Q?bVWJWrwX3wvPxHYjc889/av9CN3ZQgRnXK1H2LyQFic6KS/Ghg/f5CsOsX9h?=
 =?us-ascii?Q?8cBeCU+an9DA1SleKL88UVGB1kHoZ6NB7o4mXLIGXS3BgcOI/Ps4o8E30Ztt?=
 =?us-ascii?Q?jI9Dc7RpEXM+ox/8LbCLtvZVC4u7/S+kSUYFUgGHRSLjCzUxTmZUILMNHAJN?=
 =?us-ascii?Q?XIxvX6JgWfWMzWE2WIkLgdCJnqRp0VimJa+MXycmRscUKoaK4I+H0brYm9Dp?=
 =?us-ascii?Q?SR88EfFR0jAyKNGdf0UmZD8w79B+IpM0R8+6w3mfJ3Ikhmv9F5xNtIiU9t2k?=
 =?us-ascii?Q?QalrvwckRwOwyf0ceI6bc5uRJTz3ttmtZWYQA8vFfCGBl1L3v6nVQvRi3Hhj?=
 =?us-ascii?Q?eFUnSH9Nr5PuhCHj52EgHuRLfZsqS098aBB8bt/DoiAs4d1KPGfM9FSNdC7d?=
 =?us-ascii?Q?52OxSJDy7cjMOvCotCZcYCPyq/M3VJd/Hz469J6nSqwixqpL4SsjG+K0kMlI?=
 =?us-ascii?Q?koZQ2jt0vvVMbSsjX0E8WIAGfdvVkgF55gltgWqFG70UfUuDDs8K9HibmpOx?=
 =?us-ascii?Q?Cc1uuLAwFUksq0bPwFMvBhpHQOOtnLkcCkdplAddc0I7CsRr/aVW2yCMLpCV?=
 =?us-ascii?Q?Ni35cIasSM795aVq8sJS797jYnQXlS8QmrlarFHPRerUPKsImGPT0zdHB7m8?=
 =?us-ascii?Q?TWgxdhcFo4BF2Qz8PYthLZdgeJrSSLhczOXt3Nd4ZMtF68ku3yhFPSJtPUAr?=
 =?us-ascii?Q?JqUWy8Nly47RoysVnsAW5EfcR//PEuS1Kgn9Ns4lm29q1uMH2lETVupR4jGZ?=
 =?us-ascii?Q?0xmVuoum3SBQBh5k4yZ7aBNQ2nYphu56SihEsheFqyIZyg5K9ftrSOx3o5PJ?=
 =?us-ascii?Q?r8EksSaruYKf6xgq6uI9M4WZNtSFE0SYW7L2kBYn8TNawh+9Ckxmf5nkr8iC?=
 =?us-ascii?Q?HjcDqhQMPfrV6SRWmWQarFznQG3udxJ2f7Ix1ICf4hMMss8637fbWjTqE51H?=
 =?us-ascii?Q?M/WmUaJ09LZrI06l+HYr5pezT0SQ4nUidK7UCB6hpzUw/n9PFJ5aI7cIttTj?=
 =?us-ascii?Q?b3gWTllysah0t/s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mY8tuIlerwAJiyBW4gnIzjc8/iN06EBtDLGvdOc6I2pFrqFwi+eB4CGsRgi9?=
 =?us-ascii?Q?to5thz/YkMURhfYy5RIPlQdUJOEwAX7MCrDobhmpPiqAc0vsWkwFd6D5ttiR?=
 =?us-ascii?Q?PE66BzG8rVD+glZ3i3ohyDtkf1WNTQ+tz9Hx1RMbZwFZUFWbkKytX5X6Jb3a?=
 =?us-ascii?Q?uLcQa7pepTzDCXiO6VRaoYHIbngXR/Rn5o35JDvdrY6nmTQMsp3twXcFPlpT?=
 =?us-ascii?Q?6EZo09k7MsRxiOoRdF/UKe6HZhs8nNOML9vX3oQtT1rxIy7VKwx4GBQZvawR?=
 =?us-ascii?Q?9JdkrwQ02FmC4DKPAI5i4IVmAZMHUp/ybfzYMRpXnp0Ar+blzuKF1bwt56m3?=
 =?us-ascii?Q?HM+7xl2jfY2y+PrDvzWoQq2H4JPtSGZpCURBxV1+ghQa6Bu6Q6/7qMaqGxO8?=
 =?us-ascii?Q?wdvB4C03eiUZ5iFR9rGDvTioXGI4S7C+qA0wAzcPceB/J66kxFx45cTWo1Js?=
 =?us-ascii?Q?4WKzHyQmK78O/kiaXu7oP/GSL1onapLwhrxWAzWKVWPCB9nH/GGpWzULRaj6?=
 =?us-ascii?Q?QYdosYP3oCJ3MrT2f1QK0nND311wPctQbD/n5KsM9ZJTPyprBSAn1EDc/gCA?=
 =?us-ascii?Q?ZT9Vm+wDOYytg8E4Kag1RyHULzf08fK9TOhIw4wurAChEBmiSvgPymlLrET9?=
 =?us-ascii?Q?JP85QeW4x1HVxEckKEkmh0t1knugsU1J8PY3G7sMXoqGJKhyfoC86rKHSZSL?=
 =?us-ascii?Q?b6uhSqk9by24AoObb8dcYS86/OPqjTokxEMnc0ZpgLti02RIoDieKNbl/4sN?=
 =?us-ascii?Q?3HL0YD3+kdpoxPqKBehnvrZt61r1zYxVbEu4Q9IrbciHuLAkY39aQVJBFDFM?=
 =?us-ascii?Q?ADhHPZTAeqRZRt6rgSH24mg6/9DWZob+A5GyDp3WDAVjBaM0NhHJVDKDdD6n?=
 =?us-ascii?Q?RF3uzqUtisNpAaowe3UuPkPJpi6Dar10O61Oc9jq2lxIPifRm5anNcSuxnhl?=
 =?us-ascii?Q?ul6rJfDJGkQyJAlJEawzVl4s/9eDLJCKPEVfQL+jEsT26reLd37ikiktJFL3?=
 =?us-ascii?Q?56IgHo01ZnOq3//Txpj6xVBhsm6db4NI54RAUK8lckoLBXFWcba4on+NzF/X?=
 =?us-ascii?Q?JQbCnehFuvJbK8SK9239lintJ3F6o6twctcO3/jgWSLsXlvwMJwWDf0njAe1?=
 =?us-ascii?Q?9PTFbzekg4ce21PuBcqdyTRNfBaosJ+QV8FEIbFOdS/nPid3cRN0cjUwHqvz?=
 =?us-ascii?Q?jrMwAJxSmaH3rQ7f6lXsHAH37bvYrcuHY22g7tNMxBW7h/yqbkh0Np1MJ1kF?=
 =?us-ascii?Q?ZXysXyCDXDMN53tk0kD96uIxZ4sfKVB06ObP0Sn5gkBsV3xB9Hi3rkw3//47?=
 =?us-ascii?Q?DQy5UMEhl2bce9DUubhcqgt7lAL7U59wRcolM4iPbOpowBPnc1eItIrxZG9x?=
 =?us-ascii?Q?PP1xirasSzIvjN3m+5pja/F2cRkMB8SgYQhcOzvQUmiQa7CVoEdmxUdyyLao?=
 =?us-ascii?Q?+Tbw8lUGfYtbE/eIjMTUQhpiNJYisD6w1A88d7Nszp6xfBu9a1O0RSAKMA6+?=
 =?us-ascii?Q?9yDKwKGJb+BWP2IpME/jpyqnAN/k9NYZRNQOSeRqr0G9vieWNnULVDInXwd5?=
 =?us-ascii?Q?pvYlmvDcNvRQQ91ju20=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86f74c7-ee89-46d6-6fa5-08ddf9990677
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 05:29:38.9856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92tae8o9y9thWQKLBbJupegQyUFpLtVPqO6Z37z6TPb084o9nOSsyibX5ucnn0IHoVWSDLujpP6MuyElgmDdhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Thursday, September 18, 2025 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 3/3] tests/kms_vrr: remove check for PR support in =
sink
>=20
> LOBF can be enabled on sinks that do not support PR as well.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_vrr.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 820a982d0..ce75c7123
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -966,11 +966,6 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  				 igt_output_name(output));
>  			return false;
>  		}
> -		if (!psr_sink_support(data->drm_fd,
> -				      data->debugfs_fd, PR_MODE, NULL)) {
> -			igt_info("LOBF not supported\n");
> -			return false;
> -		}
>

Please add spec link. With this patch LGTM. =20
Reviewed-by: Jeevan B <jeevan.b@intel.com>

=20
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd,
> PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd,
> PR_MODE, NULL))
> --
> 2.25.1

