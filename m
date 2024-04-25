Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6158BC10F15
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 14:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010AC10E2C2;
	Thu, 25 Apr 2024 14:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVAUWP1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71C10F7FB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714056497; x=1745592497;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Skl6/zIM+M2ZB0MKElYT17vy0gLegrKjokp2fOjdYzI=;
 b=fVAUWP1bMZVpqvmGmZOg6kSgjJrbv2jwT0Q1uWV/FYvc2iBLt/R9PooM
 0zQRICsWRad3HF8XS9KPmYL11Uf5SVuZBxXjL9agzmOrsqYvZzT9ArzRO
 /HXSp/6Zc3/G6d+tE1Y1+fkpAneMK++GK58DwzNio4z9efb7H9bbOs9e1
 zbZRAeUp0vaFbjGEj9CeMH95LbCWOwVcN7sBqFiGHgMLf8/LO3BSLfd3m
 Qy4raBQ2WmJXSBwi8pHWAc50osdeI/J3qMGeny7amCUA9wjngieoN3xoW
 ExDYhiL/SDIMhhQ8ab7G5ubcTN9llNZJLTH+8UCvs5D688upj6HZIsJVl w==;
X-CSE-ConnectionGUID: ZFjxwublSnyScJQWwnZYmg==
X-CSE-MsgGUID: dhjzk3+zRIqg3q9ioEvJLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9597362"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9597362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:48:08 -0700
X-CSE-ConnectionGUID: HIHwRtyPTsKThTCM0MiC5Q==
X-CSE-MsgGUID: LbSdJg+oTKO2QvfrroJs7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="62572731"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 07:48:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 07:48:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 07:48:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 07:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL2x1erzBYHqrcoI9eEy8w/O+y8D8IY75A7yFCMNRKF/9IAkE9p4AG+l1L7heAn16KdmZbbJMbiJNSbuoZPgayCZooUa2ir2GEfLqbmOiePtrIr6vk4gvGUSI1h0widk9dr9QpWgl+inL62REllF+uknq4kK/qOtdaIwKALR6/Q3cG6jU35gbjt73DxMmotExPv9W08ZPu49hsUJ6PQCrGu3iSfhHpjcljTBZLxXpztugflJI6iJexIlIcxGKLor74oAWnCb4jFhiDbv3sNRi7etDFpW3vr/umXmbQnGPM8lzWEGh1/gHfH4aOwyzp1vVwxd1JHx0lcDWy1qdTrDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PwdEYz1FnTVZhlaYP/ExtNsAfqsyyQNXX3LgvwGsyw=;
 b=Kh9AN+JXw+QfUqTevnAr8BJfjqdGcDPtNICvk8RoGFqMkGNTIrD338msWAYkQ7YtAhz2csrnPF+sH40bjt0cD86R9FmU+QzCBGbcmc9b0XOVRPKxvSywN/2EzUrVFlJIRLrQQw1Palb9/Q8Iy6qYkyLrgxM0YU4EyLHji2ChQysnGxsOv+DOzIAHiLIJ+o/ROq/SQcCHfjdM/nu2r/Eaqvt2BVnqpQPcdkLfU/prQJ6jj0i8k0wRLShPSzehCrO9AwzjERHmsZ5b2Km+1/EG0JI5HqwRm5m82lVRT+Q/yUDVJ8p+ypmcE1LuGUv/3rmXQmaDemJV1ehPI7PiK/7jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8)
 by IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 14:47:59 +0000
Received: from BN9PR11MB5273.namprd11.prod.outlook.com
 ([fe80::1179:dc0a:1a40:6415]) by BN9PR11MB5273.namprd11.prod.outlook.com
 ([fe80::1179:dc0a:1a40:6415%3]) with mapi id 15.20.7519.023; Thu, 25 Apr 2024
 14:47:59 +0000
From: "Chauhan, Aditya" <aditya.chauhan@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/1] tests/intel: Put multiGPU tests in MultiGPU
 subcategory
Thread-Topic: [PATCH i-g-t 1/1] tests/intel: Put multiGPU tests in MultiGPU
 subcategory
Thread-Index: AQHalxxOX4tpIEzuhk2hN85an94y2bF5D/2w
Date: Thu, 25 Apr 2024 14:47:59 +0000
Message-ID: <BN9PR11MB5273DE86B80A3B259ACB210199172@BN9PR11MB5273.namprd11.prod.outlook.com>
References: <20240425142412.3751980-1-katarzyna.piecielska@intel.com>
 <20240425142412.3751980-2-katarzyna.piecielska@intel.com>
In-Reply-To: <20240425142412.3751980-2-katarzyna.piecielska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5273:EE_|IA0PR11MB7404:EE_
x-ms-office365-filtering-correlation-id: 8767a50e-1fa6-4175-d258-08dc6536b370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?SMgZdN1yboll2/XJVFukmNj19LdiB9iRZxwYNmUJesxL5rh0GxlFpPWB1LiO?=
 =?us-ascii?Q?k2m6cq5p6GvnAq6DDX5gy8Gv0jKV5tvuFRr9HJuJ/Dxm5v9dLqvMeKPdWI1d?=
 =?us-ascii?Q?lBdCl4CPop7yMbdCG13X+BTsUlVd0GE6F+KxK9qx66OosBvlge/NpcatsE10?=
 =?us-ascii?Q?DZo2YqOyGjGlqHLWJTV2tVIlxem5ojKV7Zt0AcVSK3L/WH6jlJMzj1HwF0fe?=
 =?us-ascii?Q?9hErClWYTygV12F5P5GzJzzBA1tM0+iYB6TLERJqBfmhJ+ouB96Uz8S0HyJ+?=
 =?us-ascii?Q?vuOnSNYAtrmL38L3EL23MHEci2ygDp5A3bb8hxI36FqYROQ3mBNlubB15HL6?=
 =?us-ascii?Q?uyMn2Uva27g3pl5YSucrqtpobHcSpPCXQW6wYm1VU5w4Lo3RsEJxYoZzorpu?=
 =?us-ascii?Q?V1OF9jv6Ar1ChcouWYwDuskR9dmHT8h7n1kSJsADB7nVD0Zxmoa4IYSafcuX?=
 =?us-ascii?Q?TjvqITooKhachoFROt4y4HsPTcKCGctKFsNag68fKZpAjPeq/cpXuFiPQv7Z?=
 =?us-ascii?Q?fKxOnm/o0XHhkwd5nWb378Y5jbU3QmGmVAKNvB7J0SBj+ledFk5Yt4RdUI8r?=
 =?us-ascii?Q?LxrcGf7ZGgnVahtlLJtbb7UFlK/ssoK9JBdWlA1UntiHmCzfWhmEiEWXlLku?=
 =?us-ascii?Q?KIKZ/OTATg080e2zLIh3ydwmzOVOhLTds2GWtfj3KRnd7dAhp0kST2Cs8PwT?=
 =?us-ascii?Q?uphyvQVzv+Mg3jEV6vMDOIL2eofm8Pa/y5UwvBs2DXuPp3SXbTn6JdqjDNOq?=
 =?us-ascii?Q?BXx32EeQiscyy7+uv2X40KMbSrEsIH7a4lvg5hvPeLTPVOT8KnUe0zRCatry?=
 =?us-ascii?Q?J3hT6ldapPCD7f/xL2EX1R6eBRpfmtFvmJPOcV7iqjVmVc/RJc74xC0ZLzbs?=
 =?us-ascii?Q?IykAlpKDy8/ooYhHZRcSyOAi1+FtiSIO9Gl4GXQaVnWBgOqgDuBr4TXTGvGe?=
 =?us-ascii?Q?b7jsAX+QCaTRXkSmsx1GRAwo86qv1fgxkbO1s+vKHcehZpfsgLA5TovMBLqd?=
 =?us-ascii?Q?VOuNE16BbVM/0gbYOk2OpqIBVQH7BPiiosLQvJgmhvpl2pyo7VDF2RfZ9pPa?=
 =?us-ascii?Q?yNFrYkleQTd9n24koqz+NnI2ul/ppwMDnQeK1P7m5QYyqJjaKvb/escIqIBF?=
 =?us-ascii?Q?HWJAjOJrSXLZaMi18B3ixfvLUS98AfKCJf0zWDJ+zvjDuAaUtgw8eDW1URrF?=
 =?us-ascii?Q?cU7/mGLAX+UJwcrKfTYqYa1Lj/WfvWSV2s9fz1+1dVbKZuj3HWgwm3zm+ziW?=
 =?us-ascii?Q?P+x557VTQx/rLYDIIdDMWcvSS9akGTsafa2fDjfBQl1Ql+bwv/LjWAhNI+QA?=
 =?us-ascii?Q?7lUVaXYH2NdCaUyvL3f6q06Iid2RmSca2GvvMVVCbn5zlQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AjBxos6SXhF16HtmWUGa1BmG3jm3dhbnIrwjJrQujM+tBXZ1PH28F5nANTBs?=
 =?us-ascii?Q?SicgyPN3rxDtpfCiQS5Ay2wi3BOMvFiKcBoxK+pn6WUcGotaS7bFexWiilEZ?=
 =?us-ascii?Q?oDQHnOeqeKeGkpZ+sPKfMu2PzzcQ8sV37UXdOzgLwPbOZdR8BsFAd2EjrXfQ?=
 =?us-ascii?Q?dM4nxPLXl4umi8G3DHrCsKkCpSC+OtLusG/eb+CXrjvw2Mz7uuOpJ1r3X5gF?=
 =?us-ascii?Q?Kg3PWe2Gpi+wJPyhA1ZUdIdXCjkaw4MNd2ZKLIzPYhUZRDeXJfQhtIVr23Fy?=
 =?us-ascii?Q?VyrzHvgiqH05wXj6EA21mSlKVvk/7CELh4ycjbtAbLJcFEr6gHu1L+7EwCul?=
 =?us-ascii?Q?4LsTMqh5P6Sg1zrX96C8OR6DaIH1b7VXDpZcP2RpsOhA/MixJSGitMnDma5s?=
 =?us-ascii?Q?B4QBC2qS7L3rBQxLmncD6/4IbdC4Erecw2v1GAD07Rr38eEf011uEA3+nqqv?=
 =?us-ascii?Q?6PRORxC+3p5UKL8WD5Zn3YLInJc2g6ObOFfZ0uWNaIV0NUIqId+DLJhWoaYb?=
 =?us-ascii?Q?g9DsXjEL8vDLOJmKstAMOLUB5fkTE0QLdZHsumASOmNzXmtlxdf+hq3o37M8?=
 =?us-ascii?Q?epoRnUuoD+Gvx6DGfyJrhciB/ris1KDHML9TIoSKFX4UF3EjWyQgAdRVW3BB?=
 =?us-ascii?Q?7f88ujv2yFFnDLSH7z3vpOszKY3Lyk9tBAw408snbiZgC/eDQHEx+kLWxc96?=
 =?us-ascii?Q?Bc9uVpdK6cwO+kvXf/g9YppJbAN4RVsWB6rRtd1eJue0v+i+i8mVncsLRRpV?=
 =?us-ascii?Q?FtQjibkhRth7ix5wsM70IXAoHUb1dq5BXE/DMl6LIvGTJHxkUHxRkMtE1fdj?=
 =?us-ascii?Q?53XT+5XjFoOCmFgVky5PKcc3HqltorppULSzPB+tEf2uiMEA5AfYK1D7tO3y?=
 =?us-ascii?Q?CTj/cjw3I/1QNfjRrzpm4Zsf8A9/V2ySpJoKazdBety3Ns8tHA/fgdROpQbG?=
 =?us-ascii?Q?r/Chr1ZPHmFLFgvwO0T6rFPmhgzHCP9qW6LaimmlinO/WTAJn2Zs4m7ZIBJx?=
 =?us-ascii?Q?qVsfmsVegbs+Lu7yMlwZRgt4SP7TtkpL2JLk3HXLwhiztqU8UbsaUQ8kafYm?=
 =?us-ascii?Q?RK/wsWvdI7wgoKQXnKB8Hxg430f83PeRAoLUulLYVzR4TooUItMfuASJuJcy?=
 =?us-ascii?Q?qgRESY8sliIVSTWKndnZUKWvFkOxQkj/SmxXsWpciY2ocnOsvCWR7NjIwJDN?=
 =?us-ascii?Q?VBBGFnEuX2gkCNnkxourX7t/OP6oYBX/ebuUBBTkYEpBNnXDwOOt4yLXtX2D?=
 =?us-ascii?Q?KhhDo1lnu5JN8AqJihlu8rhN0SGaE7DIaQ6xrvHAX3Pn7w+wGO5CqmkZW2ki?=
 =?us-ascii?Q?kqEDEKghY71Z8T2vgnc7OfYoqXjLM/1fr1JmFkpSXsC4vn/hEJD07KUkdjUX?=
 =?us-ascii?Q?EuwcLGk8t7Gg1lmaCWygzb3WITRwvNKrxUTznwqpBXuTb9P+5oO+Obk98LiC?=
 =?us-ascii?Q?LFcjas1xBwoQQPGE6YTs/XONf/IcmDGyyWv5jFNK5kbKOWAWI3+HtNUrGiZd?=
 =?us-ascii?Q?GdZfX/XkSsfg5xBrIxbm5BMoR49U47+q81tGXn34bqITTTT1dwV543YMD2cm?=
 =?us-ascii?Q?6fEZgpy9BNqM31b8w9I7XSgkXth5aEr2SlHZi+L/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8767a50e-1fa6-4175-d258-08dc6536b370
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 14:47:59.2503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7pL6dbxKjKdGX6qiIFpzNVmA67GUOn31Y2J2CnHr6FkjDEHdUsS4EFqFKps+dauqj2ixqzKYo4a7wzlfEpjHbJaoA8xw9/zjtHa5YG15kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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
Acked-by: Aditya Chauhan <Aditya.chauhan@intel.com>

> -----Original Message-----
> From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> Sent: Thursday, April 25, 2024 7:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Chauhan, Adit=
ya
> <aditya.chauhan@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel: Put multiGPU tests in MultiGPU
> subcategory
>=20
> Some of multiGPU tests were having CMD submission subcategory. Let's fix =
that
> and have all multiGPU tests in one subcategory.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel/xe_create.c     | 1 +
>  tests/intel/xe_exec_basic.c | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> 6ea5ad38b..8d1db9896 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -250,6 +250,7 @@ static void create_execqueues(int fd, enum
> exec_queue_destroy ed,
>   *              buffer sizes.
>   *
>   * SUBTEST: multigpu-create-massive-size
> + * Sub-category: MultiGPU
>   * Functionality: ioctl
>   * Test category: functionality test
>   * Feature: multigpu
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c in=
dex
> 5210e6730..cc2d2b8b6 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -57,14 +57,17 @@
>   *
>   * SUBTEST: multigpu-once-%s
>   * Description: Run %arg[1] test only once on multiGPU
> + * Sub-category: MultiGPU
>   * Test category: functionality test
>   *
>   * SUBTEST: multigpu-many-execqueues-many-vm-%s
>   * Description: Run %arg[1] test on many exec_queues and many VMs on
> multiGPU
> + * Sub-category: MultiGPU
>   * Test category: stress test
>   *
>   * SUBTEST: multigpu-no-exec-%s
>   * Description: Run no-exec %arg[1] test on multiGPU
> + * Sub-category: MultiGPU
>   * Test category: functionality test
>   *
>   * arg[1]:
> --
> 2.34.1

