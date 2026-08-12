Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46818C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 16:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57B110F08A;
	Wed, 12 Aug 2026 16:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nu2InhCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11410F0B7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786551912; x=1818087912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e0uvzc6cEpx8ZaKxYH3NEy6HBo/hseKZ4BEPX0mBRBo=;
 b=Nu2InhCXmGGMGDkVM6z12yIAg9dsXpKgaxoiv0GmwfZcfvA5hmco8T7M
 5c/KKQsuGLI3352Y/4x500FTcxAYchyR9zD+eflCMdPEae/nT19kBx8dq
 L6zLu6XsiQLHcXbHr3pCR6ySqIlqW/QUmPyuobjsySfKQcG4WdCBpzslp
 nNUVV3pvMdMdtchnEpwnTmPDRc9vj+w6mmc7vExKXrZZ5fEE7BNys0xxr
 xzGd2PN/0ZNT/U0tm2BaFizSd0V9xoH+PGmIzMUCW1huHwrVckNkg0jWF
 iWKmXkBoZ8qO3kmdbylVqzw7UrPf0mhuR59nAUQtivY5LhO5dTGokI2B5 A==;
X-CSE-ConnectionGUID: R+DUveNbRg+HbxxjahKUNw==
X-CSE-MsgGUID: t63QHZtrQgqY0Ic4gYicTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98626931"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98626931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:25:11 -0700
X-CSE-ConnectionGUID: yYPScgbTRPyUJ8GbZPuzmQ==
X-CSE-MsgGUID: usbrKhKcQFKew0akoKqf9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="293633039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:25:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:25:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 09:25:10 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6uGPN+0YtQ6Wb4y/TT3DkDP4MYOM9Ley1h6jhIzNzLz2M/phq/xPaLBX7bxGFfT8Q9bvRi4olfkoo0PulT7wQ5RydTT8G6pGMillij6bRli+Ebn9q99zhMtPkR1J5fxAqJC583IINK0WQK2kddTZt/Y688hS9O20cED5Rw9SSvdN3kySdJVHJYfhWQ78nmSmVEWbRO2+zcfpx5YEdMX1ErsskfQwLMdFXv6MbH7sKC+1maoX2W5kaknc/HjA+xbVEkD33j8uWX/LBzDwL/EpqoSKNh97EBZSoal7G7frUfmxHf2OLop1p34xGwYV64WF0rMVe3xVJpaR6VYzfSx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/O/n9dUvJ2z5pCcBSl5TbJNkfmf/4Ynvxo2EPX1/sw=;
 b=QQ/zGtdf8F3nnagG97X7MTTOg+cyfh5BffUFf5hVDDLHuPI4ewqxcSXC6w9OjUDf17/RiQL2frWYhTwsQev8UqaqGenm31irgdIfNtgKuCGU3nOQHAU0k76DoQLKrHwyKrbNTNwyhLOL9yZXhhLAQaNE/vsMORFvmCnLwMr72ayS5LUgIgcbCFHbOB9LsQcdxwjvOfdKbh/CPR9IJsBOcbPeAUIEaDzBfGES+iWaXsshLR7UqFi0XmqC9Nw2D2ALEYjw4RA7T02gHgHojuDp2uGI7QYvsgg/sZojKz9D4fbLlNGKtN4Y9M6m4t1FbbBIapYzN24kP9mgARfV862Vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by IA3PR11MB9397.namprd11.prod.outlook.com (2603:10b6:208:573::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 12 Aug
 2026 16:25:01 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%3]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 16:25:01 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Move hotunplug subtest to the end of
 xe.fastfeedback testlist
Thread-Topic: [PATCH i-g-t] intel-ci: Move hotunplug subtest to the end of
 xe.fastfeedback testlist
Thread-Index: AQHdKkbY5CxcGA6FPE+x36R9tHhVc7aamY1A
Date: Wed, 12 Aug 2026 16:25:01 +0000
Message-ID: <CH0PR11MB55642E0F2E9D14C2A09FBF5098DC2@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260812103912.1481362-1-aditya.chauhan@intel.com>
In-Reply-To: <20260812103912.1481362-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|IA3PR11MB9397:EE_
x-ms-office365-filtering-correlation-id: 1d5911a2-09f6-4164-44af-08def88e425b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|11063799006|22082099003|18002099003|3023799007|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info: daOig+PRudjy8iVDUd+CfysZ8OeG6WVSWE4dTzmNpotIay96NrFiELejUZDJ0I+nqAex7GvNqv+WB6fCEcHVOYvWMZkj+ZBxJg0MDF9OPNFA38pDhgxoy8WclMnZQyTlc3OwYnC0V9/ynggx3+zbbvYemqTsLiWB83NJ5YgHjubvhrC76UYqinW+y2kwiYKF+gN80NSOQ3a0bC5e2vFnD8GuLazC/lwm3QDpXWruOl4uZERwzT09svq+SWwXyWsLDooOIIC7XDqrbOflVoCF8Tv3N5MLf58Lq1TixBetXt8qf37+sEutUnDxYVNjWwxcsWATKTLZGgwggrAkFpxCW1KP2PzisMt5qwMeDdj6bWIUJzOQW5ixJnKb1nUnBRecmi4HLVSZpDm9QPpHH4cCBfsQfbthitDVx4MZX4Lq0JyPwXdb0vrlQ4oDhg+k3Fwb5PsnYdVY+u/qb83TcUxK93nYVL9BYZv6nhQhbBqI63v4g6+FVoAR+wF/unlss/42ynb8T1JuypIPp1GhZCjgAu91pTLc7ASIt/vnB3nkgA0thIZ/xHbRKcLDGx89c90/hivL71Yd4hDKuIcbS/x4V21h13eaN5FIKWI0LITjueuhnV4Nk624AR383GGm95piLm4KSQlKtlWmCWpZI3t8DHKhxBOCV+Wskjwvy3YaPVvz7AKPRUoY7ckJ8hqMo2dnOIsbKL/p92ZIDvW/wiN+dZhVfq3PJG6+zI62SWDuInQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(38070700021)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vIVd92EX64Rchk6BvNcnLhPuwXFhSrz4rIxl21dlayX5Bwgi+sgO5okx4MVU?=
 =?us-ascii?Q?/DsJnRJYUH5gUVve+gvcvhzgkbHSfBuEaNwIMyxFC5IhEYUa3wekbq1KHIze?=
 =?us-ascii?Q?/5681MkO/DMFWfubPk8rkmWjCYRFIpueOfl6OFg2E18V2pzFIE8Vw/qG2cpW?=
 =?us-ascii?Q?I/oaGT00Hs4GgvdtCLCIYWtRx954Q9wpNKKIC4BiUZuAn2/J+WMhe3ReF5S4?=
 =?us-ascii?Q?Bj8spVI5HjE27Kjl81ypH0X7iTYzZXG+A2jnMVJx5K7tagrz7IhNgdeIPpNg?=
 =?us-ascii?Q?PLTYVXnX3mnsHEFdICIjz1hvSa5LUe6ZyvQto7YcVADO9ckDrjVCNFmTPkgC?=
 =?us-ascii?Q?pzjIuiwnuz8DMGYAcLgf1h/CSaLY8xiZx4PSwNuPCEMKIIy4yAS5KdEXOwQz?=
 =?us-ascii?Q?rvMXuV2ryURHvcm4PUKuV3giYWYVCCEY66S/Gr2M17ORJtRaANpwNFgw8a8F?=
 =?us-ascii?Q?F8NtLnBYcaR5Go+VSI2rjJiiZncRVqVjbV6rFtRXivzXSe1pqiipnUZ/Q7sH?=
 =?us-ascii?Q?z0E7CE9nyTRQ+JjShhphpnHaT9kVAAdJEfMScB6d0jI34If4Hkk+SWxRxOJU?=
 =?us-ascii?Q?hrh2oEFzteHuEuFvb/cMv0WjRbRvUtxMt0Y+3W34Hg2a45Plfor8Q+gbAWc8?=
 =?us-ascii?Q?nwJXSG9ZpnGt2J6/uRmCBoNY4YBd2zL8l95JoJqveaB8549+pcNTDHVL1aIj?=
 =?us-ascii?Q?wvG16MSXoaXm0pw3RgI+cjw/li+fu7oBwEIWqq/xu1uoWOY/Z2Mg6dr12/BI?=
 =?us-ascii?Q?OmT5ZFvX7GATzePpzhxjqTQsoPf0SWsXtCIXf/zu/XV4g3WIZvtNgEQhCUFo?=
 =?us-ascii?Q?13yRGm3TQGC0Yfiefd+/+LcyAOiU3rRNRZn0o5zIQmAZHc9Fof7uJhlj8AGP?=
 =?us-ascii?Q?eAvM6rISzb8fDa/zC5ubLwpeRQ4e+DKdK0Ka1QcBnuI8ULRTkm+0Z1mJ59ot?=
 =?us-ascii?Q?qHQormLwuiwRlU/dHKmywRj6g1l1rPr5c5IbWLf3kh57JPerE8c770d+ebhS?=
 =?us-ascii?Q?geHwqvl4e8pyW1K0wlXlrtYtwuynHJ08tFd/WvP/JtQ8O+OtzRp1nHlxdrfK?=
 =?us-ascii?Q?uKeVlxfrwZl+YOESYZkfMFisEtAKMd7btmGKqqWporFMamc78t+CIKxcU2kc?=
 =?us-ascii?Q?3HhemIXUhj5jsvT2mf4Ua+WWW/Q8Vw+UgOGMfIY+LnW3BSQiMQdrft2DoCpK?=
 =?us-ascii?Q?VcWQGwdOUPIfHrv++1R/B3qc72a4yznyilmcuNzTUYG9P1IgVHGD1iEgUmVG?=
 =?us-ascii?Q?QQc/X7FOao5uKN67PAJxeCj9+euIMiTGqq7Dfz4QCKwbti0Ij0HgrsMpKf5O?=
 =?us-ascii?Q?FiMEyhod8yCe8hTnVsRHnr1WPPY3kpcmXpwUltTgVH0wj+Orf5operWUssmg?=
 =?us-ascii?Q?wBx1o6KCS/8CbqgXRW3OApIOlJlI5j8yO8UMpXwz25/tsXORkrGkY6Gs4OTI?=
 =?us-ascii?Q?nbRXQZ+yFh+wfpBKwsWdguCciRM0sCVYTDpSOwatZOTfmApND+RM3PSeH7Fx?=
 =?us-ascii?Q?lZs7WRChALhvKCyLm1r3pCB9fvFGvbi7RrIQozFin90XvKpRtSodTLUP3rGJ?=
 =?us-ascii?Q?msDgoTRkA31g46STNfj3pKVMRJBZ0M+sjevcVrXGrfE+d44ojwQxoSGQbvpm?=
 =?us-ascii?Q?rmupVc8+2s0E2PHEGeiSz7UgbESMip+6SfKClQ8MJEx+UypzqDSLLEj4raSy?=
 =?us-ascii?Q?6MuzuAcJxwlftETxZki6RH9VpH3BMzBsykFt9zkfsWzvbGcLl7N3LKu+XDRa?=
 =?us-ascii?Q?vAHeCqLxvViKF2zDaKNZZm1jhsD+pCHHwiEwegic5Y+tkF8gVw/07EIrl2/6?=
x-ms-exchange-antispam-messagedata-1: lmFmI94ow9W6wg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IAEvU+XZttT2pwXbh+t3UYF3XJix5xrbTiKnhctr3fXNOBEUe1qFdZVAxPFHeuMRKYld6RuLvh1fhCxrLQD1j3AJlkT8LwMQPYfi//xrVr+F6FIrPejBFtgv7exYehESbnTglc+TpetxmMTd40EjwCDRzyFd2+Jy1LnhJgVwjOBmncmBNGynHvkRPp4nrK1G1wG0e6WVSdf0kyLa8cGD+tQnmZ42qqumBdsmAy7BwAb6Bi3UvVYkvTgdqYCXiesP11hIuDk4Rovd9nWjTTYM2e+3QVZ+OD04ptLLpVT820OIXKlEzuFbY4XrOMFyvl84xO3QuYrZjI0M2DXSUQopBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5911a2-09f6-4164-44af-08def88e425b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 16:25:01.5014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5CHsfG0USo4rHiMWoLQ2ZqNnjtdeO2ulp7uRTMjGY3K93k0IYPPu2afB6aP6wWDUe4X/yKiQTnONM6Ww0UlXzJOFI9HZxEWIDrIeYCj4hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: 12 August 2026 16:09
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Move hotunplug subtest to the end of
> xe.fastfeedback testlist
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Move igt@core_hotunplug@unbind-rebind to the end of xe.fast-feedback.test=
list
> to unblock further execution.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20

Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>

> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe=
.fast-
> feedback.testlist
> index 64587cce1..ecd2c568f 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -253,11 +253,6 @@ igt@xe_waitfence@abstime
> igt@xe_waitfence@engine  igt@xe_waitfence@reltime
>=20
> -# All tests that do module unloading and reloading are executed last.
> -# They will sometimes reveal issues of earlier tests leaving the -# driv=
er in a
> broken state that is not otherwise noticed in that test.
> -igt@core_hotunplug@unbind-rebind
> -
>  # Run KUnit tests at the end
>  igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
>  igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
> @@ -314,3 +309,8 @@ igt@xe_evict@evict-small-cm  igt@xe_evict@evict-
> small-external  igt@xe_evict@evict-small-external-cm
>  igt@xe_evict@evict-small-multi-vm
> +
> +# All tests that do module unloading and reloading are executed last.
> +# They will sometimes reveal issues of earlier tests leaving the #
> +driver in a broken state that is not otherwise noticed in that test.
> +igt@core_hotunplug@unbind-rebind
> --
> 2.34.1

