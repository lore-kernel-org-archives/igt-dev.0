Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F5CD8C8E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 08:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1E10EF7F;
	Mon,  8 Jun 2026 08:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4FWpm8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430CC10EF7F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908496; x=1812444496;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nH+qVfbpEzR8oyeiyc1oBuBggccgiUnUUAiph3/CIdI=;
 b=R4FWpm8q39HDmlVilxuLZNRZeU5h5k8M/ulN3ZiDmW7gXXLuadXfeGzD
 1MrjbyLSTuonCiL+QSQH5waRdpjYhp5uy/dbD7vdiM9PTlyX6K8vg2r3V
 5GpkHuqtPA7gd6MRJv7LoIsPakSqYm965L/d3Z1L1K0RI7VVVfegktpQy
 LhKnJQUHueb54IIbuOgru+4aJ7SlhgHQx2HOJ1LZZEjeHaqa+nEVjlzCA
 6GUEdZM9wqzrzP2rNJ3dMWlAyFf5wDboAhqX/g0IC/kzE4J4X/N6T5bFn
 enXbZpsbekO6AEDOvrgXeX+67oZCa/TnhRciELaZbCtqF3pCg0g+QDomF Q==;
X-CSE-ConnectionGUID: Te06vZXlSQykqG0JKdYI7A==
X-CSE-MsgGUID: S2Zr3PCXTPuNe+IBKDkIRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81759841"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81759841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:16 -0700
X-CSE-ConnectionGUID: pWxaD/0uQ8yarninI7aZbg==
X-CSE-MsgGUID: +UnvfGx8Sc+3vEYOVIeAUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="239140629"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 01:48:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 01:48:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 01:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsMpML0IEvsef4e31zFc2LG9UXDN20KKcFP/p3AKxuJsuPE295gNsCPWza4uEedqtmHyEwaK0YyqYTYLHLifct09hn/yy4vmFqaAX0Yjzn2EHWByAMApfUvimIdwDhNA3pcEye5ajofiiaf24zJ5uk6o8koNOpjcm6nSwKaP6/TFIJt740pC49Pe34HUyDj34ixm2KPfr3oHnS9/pmJTE0EDX3aP7j7rMno485bnwDl0wu3cT2SgxI9tPLmOmGpsGsFGEMsK04af3f9yPNWQNIQcM/9ApgWpS60zq5wYPe4VAq2ti8/3YYW2QDWkqybzIRWL+9+nSdSvwUcGnSdC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXGffnEebAO6dnrWDQ6enaWf9M5ucoeGbmY7HHvMS4U=;
 b=f0lXd/f0q7JT9rSh9GzO9dWLr+PdpuaUj8KAYthEj0WSMWoDT0QfkxitptuMbJOEUknHGXa5v31n3s3Ph6RIhaLbLhDxY1Dlb1gb1kgDXi/jxzbj+KSq6XrTpQJeNo9IogtbEBt8AotC5LiPQ3QJAk4ykbLJK5PtjvegaITMqfanRo60WmXh7COJkCfbKMsyJ/Opms8wICAIWEnUYg3jyBd6Qsn0LWyev1bOb5R6E8yVPcyH3pO33sidvCYZqkw9Qo5i/v1TC3vn3jK0jQXBTn0ebnC2+lO4Hi4BmNmduguEJsqeOHHINrBCrf701tflfMG7j5W5h2gdEH1xyKdnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 08:48:13 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:48:12 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
 calls in DC tests
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
 calls in DC tests
Thread-Index: AQHc9xyBGhE3svCao0eQleMi1t9RprY0VG2w
Date: Mon, 8 Jun 2026 08:48:12 +0000
Message-ID: <PH7PR11MB60531EA2699569B68011D3DDE71C2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260608074722.9216-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260608074722.9216-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7557:EE_
x-ms-office365-filtering-correlation-id: fdfa01ef-5953-42c0-1030-08dec53aacaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: WzR4Ud+y2Qurr3Ic3cD9lAGfCLM9yUMSb04HDaZeboCUAkLMy+pflzFcKWhzHwvSozqI4J7LksDn6SrePlvfsvPkRyTITPAXiI1pIm61/uH2YulUjArUeGMIt6z+8m8KYRneNN5cjMbI0QS/hpn9+aApiu0EKH9c2sXkF6Dd4vMYpXcWlAk5uwJ+TmEXhwdEkphuIyaf9ssGjYlj24iQjP64ruBWlU2ahLc8Jyd8h/d8BCDQmJ/+e08kxjBIwrYnFmALAYsfFjfkrrErCYqMoYZHBiKhetT9fqts22pHjuF7+BKceo8mGoJvNe49We1rHz02UPBzRl4+x2iFAYNmzz4bk6bHWwU74PUHsbhRUcruIcqOZp+lkOVRlz7tYQaHmxLh/h1Xw+tpGQarnnHOXu8Pf/lvbCa3LNznZtCtugdvQYddU4zHcn2aXcy92w7lb2CQviTueH3TYG0RNOBx43/pPm1E7g4AxpTUTLhRStjVtwr6V6+IJowCkyaNpF7Hn790JxqFo9DvZsKYwHDgNcEiv/c3qXn2s//sUtqupwZh61ppLFxG255JW5gpkpC3ubmNALRk6rQ0FIeXxGIPjN48fH/6+pZjeiT4f26lHHFAmE2Pn2StB7KdyA8bSYdDplpcxkJ/a9uOJD+dLQgFNz0mUxILiZCh/Gj15QWPtl1UE5qpHJtSGiPiIAs4ed1AfxR3q1nfvijMn/MZrxogNAIm673GTQgp0zCuYM5T+aU0ztf9TZg0RlqoRP/VGiBt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4/x7hR1ILMF73nGgY4lOeI+wJiRAec4T4b+EShrwSY26ecyUVhg58cOzNC3N?=
 =?us-ascii?Q?wZmN210cdA1P1g+kMlpO0bcjVal+UIkP0uSlW9FEE+9paJTav7RSwVjYAYYN?=
 =?us-ascii?Q?4/lcHcIGrZLu4me1WK/0D6VwJ2datoBeFQsariEE/UB6ks2TaPKyyMVOxUTx?=
 =?us-ascii?Q?/XlkUY7J+XfE9itEOBzVCK7F+qWWlRwT/I1GF3vm/jX8Ygt5daG27K8a4/ad?=
 =?us-ascii?Q?hsXUDky9Mbq2WJJ+C9p++6q9ocmWrqFU8C3mmozUXysNH9C13fP9BAGzaSTf?=
 =?us-ascii?Q?R54NcHTKdDYX4eC4S5gzKqfwMxAAXyS3L0abUWNhU2dhUjkHXnYPHQWjtlWS?=
 =?us-ascii?Q?0vFX2Ua49QKZP1GKzUypDnPYnDtRyEDItpduF6l67HRQ1Mi20Xl2HLvqVOzf?=
 =?us-ascii?Q?/78tV1T6mLNN1rCtEguvJQK74jlBxNpHpDpEGEwrytZjSMzbLXbeNb4I+BqF?=
 =?us-ascii?Q?hj5gpV1r3k+E7MgshdMZ8FzDkqZPmx6Ui/LIyONhzQfoGkyZmzgKQFlPSqcM?=
 =?us-ascii?Q?Oh9ZGRmtR8HnzEvHpwZCIXTra5jf74JzeOmycnfhpYvf7DEHWolpwDe7dEcc?=
 =?us-ascii?Q?m07l4Nt8N+ntiERx+Kx+IiWIHSnGSWlBu9gpGrvTC2rYBRBNWwJuoPk9D7+D?=
 =?us-ascii?Q?Rp3+IJAJooyi93wXJy+mljpg0ObNcJt/DzES97nLabShKvEWUAIaNu7hAfq0?=
 =?us-ascii?Q?ZceKwvXUewP+0zJkoTbZjF725/bUf5pfGKLDsK6C/A5hbeaH7xqdnM6lc2Mj?=
 =?us-ascii?Q?PDaRsZMUxWGN+HBTsLh4zVJf+XSVpY7KTuFT+sdxRvMvCotLJbkQbWQxQK6m?=
 =?us-ascii?Q?uK+wHvEzWKS+Wc8n7O7D0yMe1xIVw3HESoDYhWCApytmRDhip79EOpn8R6wA?=
 =?us-ascii?Q?J1+sTXzlr344le+9jN3xGtzXLTs/5ykrmSD+0SvbVAkW1QF4j1r6xcQNc4HB?=
 =?us-ascii?Q?ANzyxyQwuE0kdxlxnZs5oJWXjjCl9h/OIZIkoqZKlUNiV0p0YX62p4xJDmGy?=
 =?us-ascii?Q?BlvY3c0FlBfZ+oHZRf4CX7b3/udw0gkh079C9HoxEH89qf3v2P4nia/dcRkG?=
 =?us-ascii?Q?OJ+A1Vv/RcDw23maOA4wZLhDubhJo63JPR9NRciriQox9zKE3ClKDwKiG1BK?=
 =?us-ascii?Q?5Xwakn2coPDNIrYrpFHh6pET47qUgvFvN+NaDR4AB2xBD0b89VDp/GPwEka6?=
 =?us-ascii?Q?pkrhgQJxOXqu0tSBDisIAq4Idb1Jn0288MhEzYk3oVOD2zfS8tsiTusyxoRo?=
 =?us-ascii?Q?yZb7SxTW+XJ0FMSE6y7LKu3Thi5OTpMd6P/sUHqlfDkvYl/c3TO9hVMtwUwv?=
 =?us-ascii?Q?JQFEeCsVcMeYreWj417tONoxQsLIB+2yXI4EGC53O/k65WEZpY+ZdcEtIHmz?=
 =?us-ascii?Q?xa5jIDrRNsq2fs/gyVgnHF4O7bM1VzS9oBzsiCakC99nPiq6K5/XgRY9FChq?=
 =?us-ascii?Q?919Lj/jz5nQNrpS1eiF4vjFoTkr5FbHGd3pIGHqjBg1u3o4QnIFefFDcPXDC?=
 =?us-ascii?Q?9q4FyUqO3TPSpJFMirFn28rsB6+MMrm3vUEc03c0DzSB7OkyuUULFAeFyxql?=
 =?us-ascii?Q?uSzqOZ5AhCxqgZu+Tykf+DVW02ZfBuR19M+q92phx+ProvS4PsKNb2iuPa42?=
 =?us-ascii?Q?1Vd0TxYm4hWOz79m9Y9LnGmjX6Aeu6pYEKewJNyYbTM41J1omdR8UXn/HyWL?=
 =?us-ascii?Q?k/yBS2ttPdCLwFcYDI+sKD6wFbHtODu9p+0uIFWTIHamy22c7/G3VH375CI9?=
 =?us-ascii?Q?46JyTGn1ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PMPafT8CuLY4nNrl6eMIss1ejmYj/soIlzifi7K3L9SwStHoNkT9emNtTdpIRB+Dvt75E1t9l35XWkWnSw0uvRF/cpZFZqRi6MOGCcGHJjvPVUTJDi8puttgRpLSx5zx/kWFNSSiJ8aNEQpi34QPh/DBF6zdvZQSUjA3Sjgk16LPiX96VcjzVOKfXzIjqONkTAK5UZVEjslYdYxSZ+apjd3m+oMio4Ml/MJxNFsygF72cvpqsa5lbfMdKXh6xrsxjoHE80glWySmYI2EN9kmOxxUGBBE+0RBT3iKeRIdt5JRV2Nk9lFbXfqg/B7wqaQgbRLT42+qQT/DuzUN4fUNVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfa01ef-5953-42c0-1030-08dec53aacaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 08:48:12.8431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pI80SGBfRWb0DuVtUq3Kc1Wb3NbN3/xidD9IHEY9WIts5BxN0IB7zNOvZJ4wVryVkCd3tfVy2hJeEPkLKo4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Monday, June 8, 2026 1:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
> calls in DC tests
>=20
> Add psr_disable() calls to properly cleanup PSR state after DC5/DC6 PSR t=
ests
> complete.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 423a5c4a4..d326ca488 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -675,6 +675,7 @@ int igt_main()
>  					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
> +		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
>  	}

Why not cleaning PSR for the DC3CO path? setup_dc3co() enables PSR.=20
Let me know if this is intentional.

Also consider centralizing PSR teardown in a helper, instead of per-subtest=
 ad-hoc calls.
I think you can extend cleanup_dc_psr() to also call psr_disable() when PSR=
 is enabled.

Regards,
Pranay

>=20
>  	igt_describe("This test validates display engine entry to DC6 state "
> @@ -687,6 +688,7 @@ int igt_main()
>=20
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
>  		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC6);
> +		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
>  	}
>=20
>  	igt_describe("This test validates display engine entry to PKGC10 state
> "
> @@ -715,6 +717,7 @@ int igt_main()
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		igt_require(!psr_disabled_check(data.debugfs_fd));
>  		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
> +		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
>  	}
>=20
>  	igt_describe("This test validates negative scenario of DC5 display "
> --
> 2.43.0

