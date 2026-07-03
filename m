Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D949C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 19:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F2010F8A6;
	Fri,  3 Jul 2026 19:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaziBmTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8FD10F8A6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783106559; x=1814642559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wUYFw6B9dzQo37nL+i+HLrgrM7hqonkEsFYsg+C+hmc=;
 b=OaziBmTLey1FJXTOaWqKjY8R4aH4WyPjM/JaW2L83Zk0Wqpk6U+y3EQg
 /KnBY1vrd2wfmeP7IiPX0MBLaqpZtnvLh486DuxRnoF1u6iAj81brS6LR
 85ENHwniupS19yLbbqnlMGWiiZCv1dPNLo11b7qczpvEk0YlMmZc/Z2L7
 YQ2Qf1flC0LuTBqigAf+a7nRd3tAQxlLrSjg2Hf8ibb6u7sWmd56tK/0C
 eMMvMHOn2r+dRcHVuJir3OeUzsn4ELtQrsRQdb8qyx7Ry/sjWdWxRFa4u
 i+iWspB78fv7pw/r/Gb4mhCfOJh1cBF2wffsVipUYGjaOLUR3CFeAhoi9 w==;
X-CSE-ConnectionGUID: 91deszS/SOKMDHD5C1t1yw==
X-CSE-MsgGUID: gPAvd7iWRu27qk7U4i4Ssw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83891531"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83891531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:22:39 -0700
X-CSE-ConnectionGUID: Bk06tIerQWCHJwmsj6HFqA==
X-CSE-MsgGUID: CUpcuBk6QSm0a9U69ITMnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255091644"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:22:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:22:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 12:22:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:22:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVaXVBksJIWXbH9aUyYCzf083hlhS6S4ahFVZC0K13KUNTcn5KTiI4M2c0yHssv45RDcSnE5SWGbe87/EIfrR1Tqh9V+Wop7qVPeJz4tgM9EQ8du6O9XZzM6K1rtToRijzxQqOGqaWY26+5iEW23GljwKXI2ghpay43VXYXsHVCSf4JI2E2yjOJpqLX46LG04U59thZCXhN4A9qypGvxJbntfuKF3qrrv0QYq85oQw/qSMHKZqSo/I5mOf6VRgZEnO9JsUVujyVzvCHUjiWV4uzlVcJHGNSikHPdRybOtAp+if0BToIUB1tdOiCLucfAxyd3dJj5e3JI3OnFUgKkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRg5Xd2Vtt5aJ/2cnSLTVTx0F/ADmR2USSb7GvceYzY=;
 b=A7BBGTl5ECTmt9+yHZ07oQRck/IETaQFcjBDnIR+n0SQB1Oq0lPefSYJ+mTReYB05bMfSKMQInMUTx62EnU3B+2Hxy6b0Bb+3HAr2oFEoIJD2T2QJ0JVC9vBGo+zcJW34xkXzRPLpgUvoLDVaiLYBWoWzZ3ESvLoskNjrPVWUILzdGrYypczFD60z5jHtWDWMQ0PG9M0xb1cJvwlyksE4TDKFGG/P1kY11z3nO4i72Wk5qGyxUhNOVhsh/lJe/ukUb9WNscaJeMwCM8eInacv9Jop5KPIkB++qVKX39SZe0WZSQ2bNz+IJuX10xl+fAZwdaslK5IbmGXUsxCCk4Vxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 19:22:30 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 19:22:30 +0000
Date: Fri, 3 Jul 2026 21:22:23 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 02/31] lib/igt_stats: introduce static
 sub-library for tools
Message-ID: <yr47n5r27fk4gowqi52lb2qvdexuul2iol3umelrqd7g54mt6t@vgau4avms6j3>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <2ce757adfdda0c87f5f3dbf9471a3fd78a7efeb5.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2ce757adfdda0c87f5f3dbf9471a3fd78a7efeb5.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB8PR06CA0049.eurprd06.prod.outlook.com
 (2603:10a6:10:120::23) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e0a763-e19b-4cc6-f626-08ded9386cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|23010399003|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: lnZVo+XQgPWXEnMK5p0u5GKT/0690yZM6mDn7n9VPHVdG+O0ja2iuT98QX3T18tkD0Qj+OBR5s2tO+yXIf+zv8Yipa3efD8FizBNbUBombN8R/VNd9RLOuj86aM3DW0lhL8xP4KkelBDWJYtBmc1/5zuNJZe8ZI6l8LbCx6o5FcgYc1jc4zvUJlF/budAyCanPt/1LZc7ir8i3F6o2Pu5RZ4ZY5jjJ9H6/1bed0Pxv4H+1Vaq/7czVQLRlPjxZv/YIQVKUSVkzNIm1Clrs8O/AJ+yzIMXULw4Ijp3oiM0vPyX30GkK4VUKK/CEL9vrFcbwCbFO0JnYvVMaHjfLN+UN3zWAWekFUzJwSA6nrQ2O1JcGiAriOfTBlb0KOazZmR9Gp12DBHLxhOyF3SJzyqeaaveGuQHbR2GlV2h1wW4+j0Z7d+Ey3ePtGrDfCOsWpHsji5Xt396b0GIzfafxdTHYSDGGfWcrlGJd2PY4qdHIJW/EOTh4lTKZkEDbbFJPs99635blK0GdX5n3rcluJ0RtNX1nEq+urgoKZImjZ7KcckdsfJiYUcWzdVP2INDKP9tANhbX0NXBMMWq8UCn62puKuYH27UZHZiri94zQYrc2AXbVDx/H3QK5bOTEJEIF39QGIzQULoETIVlYQ1ZyRzViuOKZvYt1yTto1ll7QqDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRUWFZubk5sZDlUTFJGbWJPU1NyZEQ2ODNkcVNHazRVS2s5NG15Vjd3bFlV?=
 =?utf-8?B?TlhGeVRGWWJmc2FSMFhtSm41RWdER2praXJSdDFjczkzc1U3SkN5a1VyOFEw?=
 =?utf-8?B?UHovZkhPUUo2WlJJc3UrbkNMa1AyQ2ZpakFmT2g0ZVV4RnRpcS9lckRwNE5E?=
 =?utf-8?B?bUR3Q2tCOHoyR3hjblNpK1JEU3pIZXNUYWhRbFE0b1ppdW9YMWdyR2JoSG9L?=
 =?utf-8?B?TFJkN0l3bEFXN2NYT0VEaXZSRVNiSEZXR2dwVXZ3L2lBWFpwUUtYYnhTYTVL?=
 =?utf-8?B?Vk9ZV1FnK3lnaS8rSFE4TjFCNFFpeVFQQk0rNjBNWG5xK1p0SGY0M0R3YUNk?=
 =?utf-8?B?MWc3d0Y0OEJNRmsrOUFQSC9iQk9zQUYwR3FTVGpxQlZyR0IzRTdIbG5ZMlNY?=
 =?utf-8?B?eWpCMlR2NXYvMFpCSitIcmVsdDNuN1FhVzJ4RWdYKzVYb1BPa1JLcllZREx6?=
 =?utf-8?B?aU1sWEVvbFppVm9iTGlLWWpFbnFnNHRONGVzU3ZTT01Sc2ljNGViRFRiblNa?=
 =?utf-8?B?VldBTkdQNmh3dmtWQ0hQZ2JqYk5mcXJYT0ZpK1BxaGUwaEZGcm8va2VheVdt?=
 =?utf-8?B?WENiYUs2QVJ2ZTJ2UHJwVm5xVVRORDRkQzlVT0xTZVB5SlcyRjFtUENjUjVa?=
 =?utf-8?B?VnR6c3FhNXgwNmZnYVNhRlVSdW5ZTkFwbFJVK084UTJKUnE0MDdrVzBQTVFH?=
 =?utf-8?B?UHNDOXF2OTFDTTI3cEg5eVBJcVllUnJ5V1Rob3kxSXE5Ynl5a3dLY2syNmJr?=
 =?utf-8?B?VndsdHREcXFiRDZTbm1PdzdvaHpVYVJvUkJ6SHV5ZHExWGtweVJjOFFTcy9G?=
 =?utf-8?B?UmJRZkxEdkY5QmZQRE84emUraGRXenE4WWNueEZTQUVGU0V5eHFiZnBsc3NG?=
 =?utf-8?B?YkprMmVlNW9tKzk5SVNwbXlXR3ZkN1dueDZ2ZXAvZ2E4N2N6aG12dlQ0S0tS?=
 =?utf-8?B?R1hBQzN0RDNuY1IvVTlNZHBuTExnQ25IelhOZjV2anpXYW54SjMzdW1BU2FF?=
 =?utf-8?B?cUg3a3NaRVd2VmR3UkdYeEhqVUU3T3lJKzRrcCtkZlNIeVdDdFppQWt1elpV?=
 =?utf-8?B?dWNiNXRVWEVDOUpMeEg0anQvakl6ZjNnZmtNYVJNZmpJdTBYTDVZK2c1TWts?=
 =?utf-8?B?T2ZMQ0x1NTNKOEJlRlpTMFlPM0lPOGxaV1RsZS9lbjBtK3NzaVdEVmErTkli?=
 =?utf-8?B?OXIrUUJMZmZMMkZ4UnJCdC9MeXF3Vng1YVExL3padG8ySG9jSTQ5enJxZHVy?=
 =?utf-8?B?b20yZHRjSDA2OXFjNjJKZGhPd1ZLdnBnVnFMRFJJOUNnbWFvQ2JNYmJETWVN?=
 =?utf-8?B?S01pR0c3ZEo3eng3MTRnaWlNWkQ1OGZ6SWdYWDZ2ejgvN2ZhUFg1TStLejVL?=
 =?utf-8?B?Q2d2cCtjbS85TXNHalFiRTBMWHFpUjhDUjJ3YkdSdXlESUZBdTJ2cTdWRkNo?=
 =?utf-8?B?aUlNTUZOWVFoVDYwRk1kY3FUYy9jN0lyWUFxNmcxV3ZNQStnUi92YWkrTTNS?=
 =?utf-8?B?N1NlWFhmaVRJNElPY1JzTTlHVTVvOGVxZDc2R1psNXg3VDNFMFh1L25GTEsw?=
 =?utf-8?B?dDJ4TVlnQ1NBTUVoKzljOFJ1TEsvazJxOVFPYzBFWGxqamM0VktDWUtyME81?=
 =?utf-8?B?VDJoRlZWZnEwUlNCWXlUWEdvNjBHVGVldXBkOXdEUDhhRHF4QVpOL1VJalJp?=
 =?utf-8?B?V1A1N21vSlZzN0FwYlptVS9TV3IyUzZyenhMTlQvZm1ySHdEMFRjRjlMRVlE?=
 =?utf-8?B?dFZjMkM4MjNWckJmQXJydC8xZm9yODZ3dStsSWYzQUY4OG14aTRrSUFZN3dt?=
 =?utf-8?B?Q0pUY1E1emVnSFBoOVVHSld5UUMwdmFQVFcwdjdqdUhzVHFOcnFxV0FMK0hZ?=
 =?utf-8?B?b2FSczdiMy8vZHNnUERYZmpDMVBiTk01NVBxNWVPdmQvRlpFQ2Q4MVIwL1Rh?=
 =?utf-8?B?S04xRE5vWUErc0lRb3NTaTQrK0ZndUhiNnFneDRUa0VMV0VuL25FZHZLaU5q?=
 =?utf-8?B?bEZVZ1RSaS9YL2pqemNzNVJwOUhwZHRXeXlhWUkxVnF3aGYxQUFqZHVBV2R6?=
 =?utf-8?B?VDhFbGpSSzhvdDc1YkFkSWxRQnVoTXNFbHVhUFozbUllYzhEdWdSUVNWWFFq?=
 =?utf-8?B?OUN5UEFzMVBtRmgxVStvQTdJR3lqNFZXMGVwYXY3NnpIYTJYS3hSdzBlcUZV?=
 =?utf-8?B?dmVreUZnZ0NBSzN4MnZxT3FBWnRGNU9VRWNUdW1TZ2o1eW44dWZlSW5DaVVS?=
 =?utf-8?B?VXI1WjZDeEJZVVlYdjg3N1A0RnlkWWdZK0R6cWhsNzB2eFpGWm5YWjhDRENW?=
 =?utf-8?B?eklDYUp5N290djBsS3hzYVBSM0I5NXhUVjVEN3ZZcDR1RzQrQlFueDNhVHh2?=
 =?utf-8?Q?cgT86NFRlK35EDTPaLv+D0py7B5IY4aiDm/dfzpCADiMc?=
X-MS-Exchange-AntiSpam-MessageData-1: MpdQN+EenNUT7c2gBNYXP6Wlcyqjpa10KRQ=
X-Exchange-RoutingPolicyChecked: bxV8mtNTg2QZCoC7u4ykDAOvksIqnxU7Opy3BerWuyRA2OimDvBy7h/NPsFF6JL17TteI1uuPyQ42z4XEA1knf6rBy78gXYvt1qpH3ktMW2DocvoTDliZE/qWUQZ8jOVPDTyxWO/fSazDBy7notWJT4yDLy2ZnXZUi2d5iBObM+4LDCXzClOCKOdzLMLTqkBWugDsu20cPRFIfdVUQq2OboqdZaRXTQPWwNb7pZl4k3X9i64tVnNmMAAHsgT/QSt75TnvLY/hsrLxjQhMNrZxjJUJt+IqFIWHO95kCLJsX16cqb1fDML+vnD/u1L0WX3mnDfzn1TSBjArCmEnvaH/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e0a763-e19b-4cc6-f626-08ded9386cdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:22:30.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NS5vbFjxkmrRNGh6FOikPsAeqJ1Qqu7NZX6jUtcFE6+GNKViCxAEZktgTpLHliEvVYYFg39/1PSOdYnLCOMQL98uLszrq4fwzGsRcRjTrRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On 2026-07-03 at 16:28:36 GMT, Sebastian Brzezinka wrote:
> Add lib_igt_stats built from igt_stats.c. Tools that need the
> statistics helpers can link this without pulling in the full
> libigt.so stack.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index e95b29d49..a57c1eb8d 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -397,6 +397,13 @@ lib_igt_profiling_build = static_library('igt_profiling',
>  lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
>  				        include_directories : inc)
>  
> +lib_igt_stats_build = static_library('igt_stats_tools',
> +	['igt_stats.c'],
> +	include_directories : inc)
> +
> +lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
> +				   include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
