Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20845CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 12:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90C410E117;
	Wed, 20 May 2026 12:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLGy/krh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926EC10E61D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779281171; x=1810817171;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4ySPj5BbFVp50DwVHk90gq3S2Ez3shXyngb0oTSotjs=;
 b=DLGy/krhHPl+pECaZ0vPHeT7aoyPwbXMUciQ4WAYuHexECTmH7mJwet7
 Vod2tgabfozYW+rf0MVktVQcbONY8MVOWxSOKXZby/i1sXVHAEfi4Ub2q
 8vzuvOoKZutwXvFl8JzmvI69txayaQZr2xmZUlk5eD2zc66futux6RmiL
 +Wodx6UJPBxPQIov/a5mbzNwTkJxs97vuMkyLXXwA1wZMTE9PoLhTd8Bk
 BZdM1MqcjdW+YQfFGDBWnottdk4tKv2aysvtpsKtirgEYtB99VZ7yuWW6
 bAMI9TrX96pVz2iEiTaqPdwjH3dlog4sAD94+beoE3zZil5+jO1batCr9 A==;
X-CSE-ConnectionGUID: nEs9rTy6QBGcT4MtTfLUdw==
X-CSE-MsgGUID: 22cnOuZkSKegeA5Jy8OsBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91569712"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="91569712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 05:46:10 -0700
X-CSE-ConnectionGUID: g3ZRWpjpRfqojTIiEVTj2g==
X-CSE-MsgGUID: +vlwUrEaR+mQz1GfSkGkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="235906787"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 05:46:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 05:46:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 05:46:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 05:46:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTqBr4ptJihUljJau+kFb84jMpiReOr7oIg54o7HJtsbChhettaPw1ohq5YX7N00HF6sPUp2jumC2pgHgTKsxtpzWYDqYlq/1fvS0DdLhwupaOjfbbB+s92d03ws/ldn9IdO4v+VYiQSorC25XQHOwfr7z0yPME1JtvCKr7/0s4c1lM3IgUhq6I8tqVGrjfb2iLsDQWbKLXjk4LVL+NEgeknp4M7cGkMwJE3YBLlMjtYpzRUcpFA/2IUP7PyuyqtQs1WxonvySe+C3YI8uE1NUgnmFsnY4QpseLGhpLHb+irnHyVah41moIEyjBhlwtHei1o71xaf5bNq7730T13LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4CUb2Q/GJ1Z7fmzqn6+AaKczqfK3J1bKRvWi7DwhZ0=;
 b=Q4bVqs+wWDoioBepI1La5QFDP2KiN5YiRrQlsHbnjq8HWAVbC4VmVWl4FSbgBsz6pb6id/6ZlL62cVYwhl3z7lqyWvw58M2/82gRKaFejxjPogU39QAtCkK/XyMltP57WTDGOd0HfAwBdWLK9/kCv1V2n7PWZ3OOeOm4LUd49oH4p1UqvUIvbifopdVFaZeUgHlGJNg3jFtXZi3kS16OJmfHZ8m7AWUbP4FNA7xUYEc+1lbuOTAWNw/4OBRHlnFnU524Zsgkej3H29eI6Q48Og6CAPeDwIYR+B3U9XGsycNr77TdkBmZgQmHGFhCzW7oYC/K2yb0Si/9J4YkxcO+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 12:46:07 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 12:46:06 +0000
Date: Wed, 20 May 2026 14:45:54 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/xe_compute: Skip SVM tests on platforms
 without fault mode vm
Message-ID: <ag2tAqz7Hz-zTGeK@fdugast-desk>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520090034.463367-5-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0164.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 86be32e6-17cc-43c2-023d-08deb66dc208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|22082099003|18002099003|56012099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: nZum+JgW3d5zZ7ILh6irE9D5nHpI6bPhwPC7Hj1RKQxqgADLwZA1xdpXMDPlrXlFMknIC2KnrLr77hG7rt/IjaOeoMfRKUUT3RKQ1gGgU9TzeYvrNF2TFfhS7gm+qO7H/Lx1lR0c9ouhrDBUlyxLSCY2sxVTd1y+Q+19y0qsuBy7cticuzwljpgoI7hTFwK2KXO4W+YysvodcmX1Dxp0ZWKj+PBn6FCfjiOz6V5YGfx4rjfyITcA3Bs0y8UtXyw0TFu1+Ja0fhgiLN3S9Xt7dfrHFJA33jR+rpK43uU309wxug1lhVSPH+0b/H+FxdV787dP5RN9F1G7bzMdhNjcPiFtx3PrLonsLRJd3UQLkA3bfRvqzvFoxD9ObOiLdhlTGSusB4btG1NUWCkA2VnVqMNVwLB6wDf5NW09TbU+81uDnY089ONTTQrk8TLbqqSE5Y47fe4IyaDnxi//nriDa3xM3XVsAvWRmhfKXeRx57mA2H/hhzyfNDHnLxPuwSzlDSxa96ZiYaru0t2EV7gDZ2q6ZyNVGpXGDvmHSDOKduK4NRgadwacX+7BnucMASRngKW3lCYQyFHmDp9RFQx+MEYuefZEN0ZScugeyVh9dgSpHvYtPFU0rMZRnWrx9S2xr2pQUt8Q+lWJ0rO6yA1cb8wMENmV9aE+AnYfD6qmfzj2tDl/C87gmRrdny4cnmtp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(22082099003)(18002099003)(56012099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVXNHhJcmZDYUtrbURYb0VXdmlpTmJWdTlVRktaOG96ZGdHaGdORkxmNkVF?=
 =?utf-8?B?SGl3bmRMSUYza04veUJicCtmWVVGaW5pZVlNdWR4WFg0RHZwWGdIS1N1eUtz?=
 =?utf-8?B?UUtneXo1citMUk1LTzZUWFJzZjlLQVZreDVxWHZWd21tYTFSNVhobmp0eXpJ?=
 =?utf-8?B?Smo4L3BEa2ZDRm1aRE1FTW1qQTdNb0RFS0RSMnNSWS9NQXJQMlVWZnc2dVY1?=
 =?utf-8?B?UTlMV3RleWJxOGRoQk94ZGk2ZG5jRTFjQTN4enhjdzNFdXVsYk01UGV3MHBU?=
 =?utf-8?B?czl3OGxEQmd2dVQzTVloWmpHN2NnQ0dXaEp2ak82aGVTME1PUGFjZEgycnF2?=
 =?utf-8?B?cmJVVGtBTGNVSEF3RUNFaTB6Q2RIcDBWN3p6RHpqVFQ4ZkI2aVZ0VGJKNUYz?=
 =?utf-8?B?WnB5MEx5TUZRR3lwYmcyeTY2Wm9WUVk4Y1MycU5yRWlZeHVBNVRON3N3Zjh0?=
 =?utf-8?B?b0xwUW9qUFc0Ui81M2Y4a05HQlFRYy9RbHVVU2o0cjB3QS95WGoxV0Zjamw0?=
 =?utf-8?B?L2o1anc5b29mMmcydGV1SXFQanRpZ3dNVFFOUEJaVTBVcllaZW9CT1FpQVc4?=
 =?utf-8?B?QUlXaVR1WUtLTW5JdzhrUHppTVdscjM1dG9EQlJVWTQ4TGIyTTd4dUc4aGRY?=
 =?utf-8?B?RkVnSFNDcTRMU0Z4M1ppdGFHaGJHaGVQY1pDVmxtQWlXVEJGUHdCby84YlU4?=
 =?utf-8?B?YnNhbVVGMmhyd0pObmZNaE5BK3VsRWtoS1BWUWxYM2JOdXJJSGE4bjVRWkpi?=
 =?utf-8?B?dWR3bU5ld1pxMlZKTVZvT3RKYmZWM1dXc3FOVmlCbTJKRWdWT3ZFZXNJNmRo?=
 =?utf-8?B?M1o2NmxtZmRJeEtJWDNHWWUxWlFuTUdLU05DdExXLysrbDlmSHdUTVZsSlJu?=
 =?utf-8?B?TXl5Ly9yamtzanppWDc0eEhhTlcxQjRvdUhOdkgvelpEOVNUdDdUZnFHdnlW?=
 =?utf-8?B?b1Z2VFp5d3NEcUNndXliT0JiR3IzSktHWGVsYVR2VGZyM2VXVDBNNHlHRG1k?=
 =?utf-8?B?NXdYam50VmxUSGRuYU9UakNCc3JhZmFzRk8vZHhjOFBYSWRvWHBvV2paVW5S?=
 =?utf-8?B?YkJIcm1KMjNpeHQvTktiUC96ay90UWJJMmpVR21HbU82Zm9VblpIMWFEOHVv?=
 =?utf-8?B?bTlwSE05ZGJGQUdkUmZ6cmxMSHZMTkVpUnBkTzg1OFVXNllQSWNYQlpPdHFH?=
 =?utf-8?B?cVdHTFpKeGNxUk1YV3ZEdFQ5T2RiUmpIb1RtbU5iajY0WE16ektjc2JHbzVI?=
 =?utf-8?B?TFJ6aGlTRkd2QUZxeTdzdzhDaFJNa0dEVnlKZWVRU0k1bjQ4UENSOTBISkE4?=
 =?utf-8?B?c1Nkb2RvbC9QWmdxbThzTVpyaGcrenljTXh0UWsyR3Y0Ynh5TXVpbTRTT29X?=
 =?utf-8?B?MHFGQ1pkbjNjVnNFSm5vLy9vOCtybFd3WGIyc1dBYmJkQ2dxREhqN2NCQzBH?=
 =?utf-8?B?TVQwTkhZZi9VTVFmdXJETkJ1dVdTcit5Q1Y3d2N0RS9FUnpLdGFxTGE4M0pD?=
 =?utf-8?B?aytENHVZUU1ZT3EzdzFHVE1KYUROT29FajdFa293UE43cXd3SUtKVldlUVpV?=
 =?utf-8?B?UG5kU2U0WEx6RnVSa2YxRmNvVWNWQXVwMkx0WlNQejFaclBaaFVXWEdKSExt?=
 =?utf-8?B?OEJwRXdaZmQraElOTGh2b3RxTklkSlBiNmlaN0tKZkJ4TmIwY1hBL3d3dEVm?=
 =?utf-8?B?ZjdhVTl2Z0lGUUREMUZGNlJhMDdQK1NQQ2pGaG95dkhBbXpNV05LcVFFb25Y?=
 =?utf-8?B?VjM4NlM1OFRxdFJZUk95YURnL1kxclYvdUc5bm4xQzdFUkRzTXdqRHpOa0kx?=
 =?utf-8?B?L1FUU3kvak5PNStlcmZSTTl1NGVZQUhvL2phRGhndGV4VVpFd0N6cHorRDNB?=
 =?utf-8?B?dytXY2lidElMNkJZdlp6Z1ZkcnRDQ21hM0dsY3NiRzR2NUFjNXMxY2tHOXZZ?=
 =?utf-8?B?VGJFUzZEM2tTSkRYcjJjUTFRZGRDVXpkakZLSkZVZFZKTkxmaVo5RGNSOWRG?=
 =?utf-8?B?bWNhbUtWVDRZSCtZN0dLbklPU0JadFFJblJHMDhnR3kyckxqZXdJV0x2Ykxx?=
 =?utf-8?B?ZlZrVkc1RmtlemlyemFpT2lqRTdtTmNYU2kzR0lOYmgzcXFQS3ZXamdjOEZN?=
 =?utf-8?B?TStuY1d4a3V4RmFKSzIxbUUzVjRuVGJra0c4bjE2a0xrMGNhS0FVcGl0c21C?=
 =?utf-8?B?bDcvb1NxaGlJQzJ6ZldNUWJxekNsVG45UFpVc0tySng1MHM5WFluVEQweHBa?=
 =?utf-8?B?ekE4MTgxK3htUGNMWWgrTWNhWXFwb0txMW83T01rMkt3Q1ZaN1EybFlkSE9q?=
 =?utf-8?B?amRZMG54Y05oeC9JeHdEKytzdmY0TEo2NThsZUJqVDI2alpiZzdlUlJqZFhQ?=
 =?utf-8?Q?D499eDZkRda2vK8Q=3D?=
X-Exchange-RoutingPolicyChecked: FKvUIbh0IAUJSX+AX2UyQQQIkGjDhaWt9GgwVuPZG2DXHPWCy8DVMV8N7Q0Tu0CX8X3I8UaL+6AEEEANglo+8Zdl4gq2PHMUgQJvJHPDz5JQw5r18T+1/I+L/LbmWZf1rSDs3Wnv2DUnNhcVlKir+X7hjlzCY44adMs1oj5cn730aLNKUMmv8D2qLAgz8ovvOFOCOJ86J5LoKw4AKR3OaLpJV80fHJszeAUuVvjIMLzqO1pK03WLdDzHRrrp7sy1KX3fzmYERNOtRsCb4jH9dLs629fzCtHkxr5Q8CdhlBDnNMlHGknz4OtIwatjjD256Oq4xYlltpc5xClEAe8NGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86be32e6-17cc-43c2-023d-08deb66dc208
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:46:05.7710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMNDDUdFAZItgXa00QQQ+S+ulce6hMB3Tth+4tnS4kwUEsrB1bEPgpr45piErCJKupzlZ/YgZ6jsd0mHJIMk6r0ANFUe41nMSks+hPvey3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
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

On Wed, May 20, 2026 at 11:00:36AM +0200, Zbigniew Kempczyński wrote:
> Group SVM tests and skip them if platform on which they are executed
> doesn't support fault mode vm.

Actually what we want is to test SVM support, for which we should create
a dedicated query, because we can have fault support without SVM support.

But as this is an improvement over current situation:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_compute.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 406d708bcd..2f70f22910 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -688,14 +688,19 @@ int igt_main()
>  	igt_subtest("compute-square-userenv-large-buffer")
>  		test_compute_square_userenv(xe, LARGE_BUFFER);
>  
> -	igt_subtest("compute-square-userenv-isvm")
> -		test_compute_square_userenv(xe, INPUT_IN_SVM);
> +	igt_subtest_group() {
> +		igt_fixture() {
> +			igt_require(!xe_supports_faults(xe));
> +		}
> +		igt_subtest("compute-square-userenv-isvm")
> +			test_compute_square_userenv(xe, INPUT_IN_SVM);
>  
> -	igt_subtest("compute-square-userenv-osvm")
> -		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
> +		igt_subtest("compute-square-userenv-osvm")
> +			test_compute_square_userenv(xe, OUTPUT_IN_SVM);
>  
> -	igt_subtest("compute-square-userenv-iosvm")
> -		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> +		igt_subtest("compute-square-userenv-iosvm")
> +			test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> +	}
>  
>  	igt_fixture()
>  		drm_close_driver(xe);
> -- 
> 2.43.0
> 
