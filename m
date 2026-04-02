Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE0D3941A
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 12:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB210F23B;
	Thu,  2 Apr 2026 12:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEiEDojb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72410F23B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775132909; x=1806668909;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I2XoEB62+7cSfNWwqtJ8DY6MRKMwaUxB5X2ZQ4gnS7g=;
 b=gEiEDojbE2hyjO04WsheI3LvX4TiUt99y173vyhGdXO/CQe/C6yEUSkW
 2DDNqCHuNxWKdyDmHnzqFXDEofFEGM7nm2o0KegRCJWey+vNqTBsLS6yc
 tco+8FnCQfl5pNxMIBds++61HHOd4jO50BZJbzi9U63ZwTFFIyxHA4BMo
 wexKJtAAJk4hVKKTPXPkp/i0CffD/4BYdzxYAN/cOJs4uJIfXNr7drJPE
 AZskkpBKJJ+4eGiY7vuNBiFookRXZB0MlQ4ZJfGossIx/Av3AB+7ClR32
 KRUKLaHprl5SIILxxPgmgO2PbTJUeRFQbp92ImNHSfK/Yr8GpcrBy9wqr g==;
X-CSE-ConnectionGUID: DeQS+xZ+Q3SFV6wrhgzV0A==
X-CSE-MsgGUID: 8Aex0b6eTJ2xEzc3rYKYYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79795409"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="79795409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 05:28:29 -0700
X-CSE-ConnectionGUID: 7/ACRBtqQJWYpX+QxL426A==
X-CSE-MsgGUID: EVNpYYttReWVCbT20CHpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="264896787"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 05:28:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 05:28:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 05:28:27 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 05:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKdwQdEvaJfPulA1uYwZ0jr4M5uKSChf38X3SdQRiDcAZQaW5TjE7FNkNMXmE5YV+TFtUOB83WZz7Bf+fM0qcSDaUbjk/QkelliZfpJJNXgP3TXa3vm8XUW0bemt9Ll5zTQoKmBlkd8t25PvdW4MfSHeCt9VXWDrO89OORJSDADiuJu9smAMVvVu3zvxnQjA8tKle0AEb9ghc9KKswgOz2uOSDRkyuWe8Vxbf5Wt9ybdmGLvlE+hGE7AMZuLhcA4f4wg6sgn+ZovI24ys2ZpEgBFqFKrhyPQu9u4qlBkukcNJr3B1r+iOXl5Lj0RRkh1b689vfUEsyYuEXnU7nUmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVCPCJMim6MMA45JLHA/cyIBt7Yo6OIadDbInPvejN4=;
 b=EICv43fxnkGxFsEIVhJs9n7wj3jEKsPpzKleakinZ3l8bO4PQkEq86MCeKL+3zvdhhVnKsV9rTPa9GscvB6Wv0r8UrD+4j12crRDkrZo74zK/gMQrMlF2TwtxN2ZOOUa6JsJwFf5QZlXEEv2wj9v0CQe1duFi22eFCKchq/9Rz8t27pNUr3tKZsMduNPhKnJ0ovIBNq6FtAvgI3s0eEy6Hw8AKznEjfq93ZriiRogtRet25qlbMWg4ocziH5Ezd7eHAIMsTGAJTGpd/IV9ayErRioM725luG+ghd7LXynewSKbTRRsmb4LFQS5fUVnjdZvBqeCgvOV/u4AQKKx2BRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by IA3PR11MB9014.namprd11.prod.outlook.com (2603:10b6:208:583::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 12:28:21 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%2]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 12:28:21 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] intel-ci: Unblock svm tests from Core blocklists
Thread-Topic: [PATCH i-g-t] intel-ci: Unblock svm tests from Core blocklists
Thread-Index: AQHcwpaHhxWkuRNK60O4IKBodcYF5rXLq4hg
Date: Thu, 2 Apr 2026 12:28:20 +0000
Message-ID: <CH0PR11MB5564FC561BF14364E4E35F869851A@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260402114735.695994-1-aditya.chauhan@intel.com>
In-Reply-To: <20260402114735.695994-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|IA3PR11MB9014:EE_
x-ms-office365-filtering-correlation-id: 047363fa-0265-4b13-0104-08de90b3538b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: VqGzVE8K8kZpE2eHGFkaL69BZlbWuHyMi3DD6+QJD0s4elh+o+bYGHQgBogZLZJVolND74oHZbtCROC7KU2KsXJJBDHX4T0wg9Qsuhve70az0k9UT1gPiPtMaUPjM2wHMkUC4SDM01VQPwm/c84WRDrfmiYhvQ0lgiy/eZTgNh6AOET4ejjbFsQBSa/KLFbfCR6XsaPery1jGEycVjcV2bKgyif6BbiD7l5il8B7mHDE21I1jI6k0d1QPNgwtWOByNdNty+3F4akQSL8c92SKp4/MVE9WFNBRvtbFUs2pnusSv41EwW/swQCCZfiU8y7ttCKbdI4ixneljzrdPjIzU37jnY+iquWiqoA39MDIQXeHd9yw6rfunTzi8dyVPC5un0XKpBxmrEV+S9yak5qU+TwP5qGUoZx26xNrM0pEyrrl8zXNMyrm8YHeBfCC73tWTxOWpSE6eISVoLaWlVYHZXn3sd00ewWjiAnHv6+lX6LoLZoMgi7jbkHna97w378f98b4tjhEkgcs2nAhZzo6DrMZiLdxT3f+nt4kcF9zzaCIr7lkAei8fZz/fZy4VF+EQSzRr0DIk0bjgDQqLJRpw3QTUmdI0geuQS6MbFtoyB/QQVDMHcVJ1Qz05D2matioub7z1DXrpwcHHq14s4OTea6JSNXQDSTTak98twXSywRnn+mFTImyXNfbc9dvZ9miWUATRDlIfdNni2e4crwtOdLjy8ksDrdA42QyoWXpvvIyoqYH/zzEbNowctJHmfIgUTSKquOwH/oL0QUU3Te6h48ti7FUBNBGnSMJ5G85uQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W55ydJlQmdKXpcra/dGNsAGwqFTPahmjZSBiJ5kmxuOdfTAA84zrHKR3kywn?=
 =?us-ascii?Q?B4czHTM6kg2muj6j23W7+RrvSjfjVLn2BxVrSlTj0JfpL55EJDOkvki67XvA?=
 =?us-ascii?Q?qXYTgwGcjh4yeXGfW1KxYWbv0+Qb783MaEIw3REflXbnr5CokwlYy4Jy/76A?=
 =?us-ascii?Q?y0mTLYXjsV1m+LT90+RbMvAQOv4Xe6xkozCyhm35TTdsttL9L6eLaogc+aF8?=
 =?us-ascii?Q?/qsgRxOA3yGimwKnpXq+2GlTsbgjDvA/BaPFTXnljS+yjazCH7AqMM+ZDvov?=
 =?us-ascii?Q?AK726/RVwXFmUU5OE240xKLBKWI/XGmEM1zBZEAFr29pyKFA5IkuBVYHZSlx?=
 =?us-ascii?Q?m4wS84UvYOc+AZaqOdVOcD7R9/SyGkSmYHCpTiemjfGQLhOycZfE2/QEbTnu?=
 =?us-ascii?Q?pzAWrj/15tC5zw8HAdbTlUFO6kCG5jMkXl/boIyJ1r+PFaAbNMTwCHMhHUed?=
 =?us-ascii?Q?2dvje3nNvd6uactTigkm2wkIn2D6N7qC+CABVuEgv291UURuCdKb6c1vhjjE?=
 =?us-ascii?Q?gRZIPG12SEivcf3nJya+vribT3Np3tBFfZ94ZEHbA/J1itMMNjeGYREGkcEn?=
 =?us-ascii?Q?FHG4GX3JpfXxk79N/ziI40HgvK5Z60UWB5sCLSu9LGnObertYSGoZVMiPFWA?=
 =?us-ascii?Q?He7XYgJmy6yT6il59AmJ4zt0gPavuteV31NghhJK5JOU+SNnI2CxF9JG3Yy3?=
 =?us-ascii?Q?tcNSJkrtMVXuLTjdVjnU/KpANFoajr546kc0ZsVH9YXSgLZBkip/RkSG65IO?=
 =?us-ascii?Q?cwR9Hzpp82Ebjc0HmXHKRdM/ppW+2dOBzjdvwfoCcf1S7wutXiMGE3+/sMzq?=
 =?us-ascii?Q?Nf6gxgWliqeSLkBNnY4dbzoYh2pTqM9Xk6DOks+DGlsr5LvrESThGg+31iT9?=
 =?us-ascii?Q?1kN5PdbWRR01Yl3x1PlNgh374LeaO5NvV/5DbBEIs6esXkD/uIw9MWv7oJ1f?=
 =?us-ascii?Q?B6k4328l2DQxfZYDetkgjhMZ7i3GCUVdwRmND4zWWx/tfNyLHuo/xzgi02e3?=
 =?us-ascii?Q?jiWuD3bas20j6QxFjjKIJzxaBSaYNhOqFuubNp7HffAgcSX+KluZuvbBxZc4?=
 =?us-ascii?Q?qIxG/O61qo72mRwKnbs1lb3Ih/Og+/wApT7KLvXaqf0ATaPfAhnQ/mytXU7O?=
 =?us-ascii?Q?b9SWBgtuHy7AyPZxbzmFUborpWIVrbVqvCcK64JzfEd3qPOjCVcMhTreCklZ?=
 =?us-ascii?Q?GhPCovf8VgkSRpfFvRsOnsbGeYNk3em0wdKAz8uIpdhmt8G/Z77T689vPlmM?=
 =?us-ascii?Q?9rzJYbYjtq+IHaCjzeQs2wAqHGYhz8cvLz+YGxpckObCERcrau1U8ZxtPydS?=
 =?us-ascii?Q?uz3r7Ye5gTayChWJlenjMeNYY8aYW4ZqV9ORnrY440CZ9kSEwzeKasMCc12T?=
 =?us-ascii?Q?Ow8Kg0UMVUtniQJ7aT5UmPvcIXzvhQMqbatGZQkKloc8HgQEOLxJvsuBrHfn?=
 =?us-ascii?Q?eYEkjVFmBppMz4W9guvEf4K4BHWnoRVBtxvtUCyuJkjBB/zNt2hHzh2ChfPV?=
 =?us-ascii?Q?uk3yAT4sqkF0tWy+0w7uYBHkfR52vrXaBR11OQzYjvyGzcVL3LyBfWfNmw+G?=
 =?us-ascii?Q?evc7U2xYOGIGWgA28KhZDerXt+N8plkrHRPc6rvUdvyk0zF+wiWEh4LjfAjt?=
 =?us-ascii?Q?LJwRr8oxuGYdsrMDXJzEyeZ7EPphyyVvySIWV2Yhgt3hX6EUP2WVjoGmSsIB?=
 =?us-ascii?Q?oMf1EY9N+SBpHl1EUYEjCO1Zlh4mb3LJ96Gco/UGxdGhLn+AHUGOpBTc/Y1M?=
 =?us-ascii?Q?Q++Dd3jrmA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jqbdf35WwWrQ6YZ7e0L7JD8v7RRYRcsJsLAAjLLIAOkucDDdu9igl1LJjF6AE5QQF7OFI7GcWY5lRWWh3vlfG4Ji9jukAwuBZtoXXmRWdtiyuGBp+9CrAtgNbTywbPimvGsak17Ao53yvEVBeuxGBvlvsiwkbOcAvlTw1mhv75o8l6T2tQI57eREdJQ0vfmJbniDM2nxPTURVD4lh/bFmU8c2+Q/HzondxrZ38j6JnMPa2OPMCYJC4goORtkr7PG0wgUOqgJp0LtwJHtJoCCgeNZytQp1BNuN8sU8yGtKhYTdtVXTXy/nk9U3kjcOSZwucC2Z73xUNsQx5ZRbuPGxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047363fa-0265-4b13-0104-08de90b3538b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 12:28:20.7743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvN9wG+RJZ87JKsqd4tin7NctEdoXUKWmEpKpq+akcv/iIt1ecFZ0NBPmFxb9GQB97CKpgFbsiQRMaddFU6ar3zyCkJMJl+jQ73ZV7kvdlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9014
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
> Sent: 02 April 2026 17:18
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] intel-ci: Unblock svm tests from Core blocklists
>=20
> Remove xe_exec_system_allocator test entries from BMG, LNL, NVL, and PTL
> core blocklists. The system allocator/SVM feature is now supported on the=
se
> platforms and hugepage CI settings are no longer a blocker.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 5 -----  tests/intel-
> ci/xe.lnl.core.blocklist.txt | 5 -----  tests/intel-ci/xe.nvl.core.blockl=
ist.txt | 4 ----
> tests/intel-ci/xe.ptl.core.blocklist.txt | 4 ----
>  4 files changed, 18 deletions(-)

Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-
> ci/xe.bmg.core.blocklist.txt
> index 3a127f780..628bc3d3b 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -76,8 +76,3 @@ igt@xe_fault_injection@exec-queue-create-fail-
> xe_pxp_exec_queue_add
>=20
> ################################################################
> ##
>  igt@xe_pm@d3hot-i2c
>=20
> ################################################################
> ##
> -# Hugepages tests needs extra setting in CI -# echo 128 >
> /proc/sys/vm/nr_hugepages -
> ################################################################
> ##
> -igt@xe_exec_system_allocator@.*huge.*
> -
> ################################################################
> ##
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-
> ci/xe.lnl.core.blocklist.txt
> index 56b3ef088..60bcefa56 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -92,8 +92,3 @@ igt@xe_module_load@force-load
> ################################################################
> #
>  igt@xe_pm@d3hot-i2c
>=20
> ################################################################
> ##
> -# Hugepages tests needs extra setting in CI -# echo 128 >
> /proc/sys/vm/nr_hugepages -
> ################################################################
> ##
> -igt@xe_exec_system_allocator@.*huge.*
> -
> ################################################################
> ##
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-
> ci/xe.nvl.core.blocklist.txt
> index 0f9750961..ea47d3b85 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -58,15 +58,11 @@ igt@xe_compute@eu-busy-10s
>  #   - xe_pxp@.*: PXP (Protected Xe Path) content protection
>  #     requires a TEE (Trusted Execution Environment) and
>  #     associated firmware, which NVL does not support.
> -#   - xe_exec_system_allocator@.*: System allocator execution
> -#     tests depend on hardware features (e.g., SVM/USM page
> -#     fault handling) not enabled on NVL yet.
>=20
> ################################################################
> ##
>  igt@xe_huc_copy@huc_copy
>  igt@xe_exec_balancer@.*
>  igt@xe_oa@oa-tlb-invalidate
>  igt@xe_pxp@.*
> -igt@xe_exec_system_allocator@.*
>=20
> ################################################################
> ##
>  # Valid skip: test applicable only for i2c capable systems
> ################################################################
> ##
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-
> ci/xe.ptl.core.blocklist.txt
> index bb8587656..abaa1284f 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -71,10 +71,6 @@ igt@xe_pm_residency@toggle-gt-c6
>  igt@xe_pxp@.*
>  igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>=20
> ################################################################
> ##
> -# System allocator feature is not POR for PTL -
> ################################################################
> ##
> -igt@xe_exec_system_allocator@.*
> -
> ################################################################
> ##
>  # survivability feature not applicable for PTL
> ################################################################
> ##
>  igt@xe_survivability@.*
> --
> 2.34.1

