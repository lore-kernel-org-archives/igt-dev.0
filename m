Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66820D6D247
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 23:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24FD10E0BA;
	Wed, 27 Nov 2024 23:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk1vsbMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655FC10E0BA
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732749402; x=1764285402;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=RUR+Vmbcu/4OSaJutBtptfYQnF2udC1q2kRk+7SwzeI=;
 b=dk1vsbMry9MvcCEEY2m07QLoLyzSWRRtpeuITZgBfqnmKL03srgMfhhL
 hZRZju9WyksZ433aWMo4AUWxNvxmhHEFTPlPqJG8cjmRcbxhPLLkipty/
 Vaztup5u3B/QwhKulWVPuDS1pbORupUbEaBqTWHXbH1xvJLr/AeyWjdMc
 y77YbBXWD49fTzx+5Vf26VrGhcTTkLQNfvJ9od4S9R7G8e5pivJJ+AxPI
 lJG2BO5RTYjGmUNG4py7DAqyKu+HgLDf2hX1w6Rk8ZJNriFlte4jU8pbF
 Q+W6JlA9Qo7UJOqOpZV0GOAVJIB6UqClGxAvoRtFMLfjOKvv0yTtjMdhm A==;
X-CSE-ConnectionGUID: 2L+vX8qwSXimcaM9zB/6zw==
X-CSE-MsgGUID: y3JRIP6oSC2kf6u9Lj0bLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44356390"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44356390"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 15:16:34 -0800
X-CSE-ConnectionGUID: f0XYjijeTUeah/CFKV8xdw==
X-CSE-MsgGUID: zSCDy8q8QMGJaKpxIJ4SSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="91688664"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 15:16:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 15:16:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 15:16:26 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 15:16:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2Bu7IkSiD+4CntowqmDd6UdrcsxhQebKxSdrDecR0kviPTnFfrXUgJsOyRryxAor85PUrtJPDJhXTep3FflTwbhMWXMcI1S6FPjpDxuw0W02KQKG3C2PnTFNyzd6jMzLD7PIEkQABf3o0bRSbZAcCyhuM13U/xorM4phXmmVCkXFStoDDxnk0epF4WVlsPkJi0t/NyqsqHQkjNIv0vriJQ2TuEF/aaXEpE8pAMA+silue89qc140UI7v7rTA1kzIaLTLdNcaIB7u6BOX+TQbfUk+bgciM6Y/2oBUsvo6WrHc4PIxyaMfVYeo7xNR0lzgae9BuyQxn/Viia5ivWqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2O/nFuOcV9cK+M2IjJb5V/HQbRZb/KuNdj5DAZBLRM=;
 b=Y/Re/XC0434tE/JrJhz2tP5H9JwabVolvuhjbcYahgfFgmjwZwR+Hz0HUPyQpL+BqFwrUZ9CaUbX3whnEDpTwgtXL15SyGDVWYT0uBbdLDyYh/osoezIDrUyvO+jviZMWTsdgSnVIUcjH17S7wQ3YlmjxPm+dEXhnYEv1c6PRcsuJe7h3BxrWujlJDcHgGsoCyLyHQGukhqGFa3dEBJoXeQLGYZ7+EHE5R8/gr03J+zEyaSbnDT58pTZMZHflS1+Ie0e4jORqZ6GRS8hxsXrFRMbiUKnH/pApZRo34FppPtffcMMZoDhogAtBaW+Twt+m/ObBo74vEZb7p6UEWKMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 23:16:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 23:16:24 +0000
Date: Wed, 27 Nov 2024 15:16:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Fwedged?= =?utf-8?Q?=3A?= Manage
 verbosity of GT reset fault injection
Message-ID: <20241127231622.GK4891@mdroper-desk1.amr.corp.intel.com>
References: <20241126230240.1780940-1-matthew.d.roper@intel.com>
 <173266744926.3541275.14723747967553947524@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173266744926.3541275.14723747967553947524@b555e5b46a47>
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa2f82f-e8aa-41f5-03c4-08dd0f398313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pjADWc8WiFr5DXBSq+KrhJjv69nxGY1XMP46vjx5/IUl00XUiqej6uXESg1r?=
 =?us-ascii?Q?d5zJcl572RjyAY0pcHUGg+bRhQqclSD39HqOiQd41ToGxVjkDVRu6kZIojIN?=
 =?us-ascii?Q?XIjSjiotB9S1HtVdK1qpXe2vZGj1NVRt3gJwztXPdohXwsF7DszmOGn/9Wkf?=
 =?us-ascii?Q?5IZKj/HzYS6C879aJZzXg6JbTHmQobBHHVDasVimJXvwl9mQN6INqN/5JWOq?=
 =?us-ascii?Q?bri7kVGfJ2Wa5ZaP+gI5y+Y+Dnrz89DTOOAmPwS9sfDT7nnU4O/Lp3AFx21V?=
 =?us-ascii?Q?UGwdAfldHRrRdobHYc1qIE4meQabdpOYUSLolhdzKx230juJYiBBtWd11zz/?=
 =?us-ascii?Q?ntCFSSfmYBBdcCzAK8BD9bHq2X6RpbxtKMLaeGolQAhqlD0A6f6AUQYHDLsE?=
 =?us-ascii?Q?/VJZbOfir85HJ/eGiFUDPdEECHqFfEwphij9L3YPABlNrHGLeb5CRI6TQZ60?=
 =?us-ascii?Q?sXZ1085GIYBiFzs44GWXFFo2Ku4e8mbhiK5rPkH3s2O7QUAOG7WWZkTr7lTL?=
 =?us-ascii?Q?rRYVqinRI7GLLoL4vkV8dROKO7iMnEvMLw/Z8jnJTA7i7k0e+rZdSidDmDob?=
 =?us-ascii?Q?XS+uHX6EPccBivgZNRAnRDxZ0VEgUCsg9/MmrlBL9qhXYyB4anuJlEu4O6tN?=
 =?us-ascii?Q?JGKUyXpb2z2WUtHkHtLmx07mu1pIksH+d92fFXPfcQzOEIUcm9jMHKhU69hv?=
 =?us-ascii?Q?NPoZDzojZ06xIZzBBPKiPgitbNEqsv6cJKA5DZ3TbwFQiajy/GcxLWtOgg8l?=
 =?us-ascii?Q?bJe98pBGzhA82d2wT+nU1j020EHqZy4q9dqVu+pS87lshDa67TjiUNESGpS6?=
 =?us-ascii?Q?ypwX6EHBVos1pHNbNs8V3PAw/WLhigmiMACNjJ8iCj3GKGPoWcsxwNVCc9pG?=
 =?us-ascii?Q?VfgsDZUPva9WhDtvetgzDydCY+COEHwEl/2eKilAG0ba04guACXa3Cq1PQ7m?=
 =?us-ascii?Q?egC8sQftd1Bn53lzTQryZIvTl7lhvPZzCFITx1mRBiRPbiQulfMXQ7GiRH/n?=
 =?us-ascii?Q?lkA4Pn/Y0YXfASLe7eiTxg4+Xw4DpEsMRforr4R5KNT5G5gkvPWrNZue7HG8?=
 =?us-ascii?Q?PicK2l9G22duPU++rHfqKaRDN0syU3RYFxpf4DkuPCii2FzZ+gx81FxoFDsa?=
 =?us-ascii?Q?W2yjNkAeDH99WyJsLpARPUOUMSja3JinkDgXIRbtJEEx8TmEBawzbOONozgH?=
 =?us-ascii?Q?6rhktXz/WGvW0JnfO17SW58ZvYiDwJ+xn7SVE3JIhyyAdgRnVUNcAMRA8QNk?=
 =?us-ascii?Q?qmiBj4XKNZg8mtxBVtXY8lGrnk7JcEXqxMdwmk5MuLjTaCV9WGyPV+1MWbaX?=
 =?us-ascii?Q?V6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tfYMfCOJkLomN5oRZYZmaUY+vNrbBP4DPM9r2SsBEPWl/JbkA5MKuWU829iu?=
 =?us-ascii?Q?J+gH44ogqGy7qW8EmplOXZkPRztpaiaeNmTaUxj659LSQToSO0yPyBCtX/Sq?=
 =?us-ascii?Q?iJ7gvfXBMl0ffkJg6K0xxe0R56lZTzYHPw+pigNI13JERyWQ49E747Nt9q4P?=
 =?us-ascii?Q?wf7eatNEOoBZTyGX67NsMlD4knYbGV09q2jJ32DDuL1nxt8u9IeW11aXFjGz?=
 =?us-ascii?Q?iyYAmaA7GbkDqUV2OPHF/mZa8PJabVkZcKpM3uqMdGUix808Yu+LJq+Ime5D?=
 =?us-ascii?Q?kyww4O9LxmfEbUxvc/4IYXjL4t4DhMnuRSrv61oO6tGJiSB0c0xrPHyahc+C?=
 =?us-ascii?Q?Y4g2K1YWCQUeWvf+2AKB8sfimghxPWYBhIJXQdRFdcRNqQCYb/y9exmnO6/O?=
 =?us-ascii?Q?qoDvI6D7DqsL2h1F983kczIEnj29q0SLy0D7Ep9VKDmCHYobH1Y9WhHgf3qm?=
 =?us-ascii?Q?TqWbKe0MFGFpHOi7xOmXgtoRt6xgc0hBvaMMAiqsZmup20TbRwSYxIuV0i5T?=
 =?us-ascii?Q?nQZQqyy/0HIFCrYRVN3TtTIlXSFjxZmHxuFrgDpOkQoNQ0nCnCuy7mwK92nl?=
 =?us-ascii?Q?IXMzZygiEVIYA199nhsjze68ajxuzoJAuHaBziH8aWGJ1r7JtBdjJ1f6gSNI?=
 =?us-ascii?Q?92Q70vU3Kpf/QSrOHKTzP9h/jfgGeO091MVlI9mw+bXmTnfGGCvAhcWtiC1g?=
 =?us-ascii?Q?Bx1e499XxsbBH4Qef3MqkJS3iD6PWatErQ00L7SxOGnSvS6J5GhtyN1dl8Pz?=
 =?us-ascii?Q?CIpttsg7N+zU4oiS5vbDucjJeZzEqtPefi5af/c34jo8OrdGruHH+C0vL16y?=
 =?us-ascii?Q?dUDYo0jxTqZxbx3q6TeH2FmEPJtYhPwRxZ79XZiYi/3d8sx94mlyOe/0jkuR?=
 =?us-ascii?Q?NtVDEX5oIijYrXtijsPE4zCu+3hSleANmkZIJZCywAEiJtTwbTSpBMfDl0or?=
 =?us-ascii?Q?msRbfqMN+GyCerLbW/Ew8/tEVZ/P2S65NdOM7AmCJ9l9W8K/XvHGujIz9F4W?=
 =?us-ascii?Q?vJuEKG++SAmfNMbMXpG9H6nPRJulngV2juCqQxiT96OCx7Wyi/mEC4zebTrE?=
 =?us-ascii?Q?XJZ6tBnqoKSO7Cf5N62JXDJ85t7tlfyKF7+xs12CMw4MOSvMu6/hupIF36YD?=
 =?us-ascii?Q?8yzqh8Hh04hFUxN4rXX2/VMgQHA2W9/S2UPepJ8jPm72Lfa8yZ0ADF06Cqg6?=
 =?us-ascii?Q?sk+a0VTUM6ARHYkaZAecJlLF1NZCuiROsOC53ovMS6MteCafaP7Mr7Mt4wBb?=
 =?us-ascii?Q?aIcnIhVtD/GPpqVR0ubC6zfFFZh6lB7o4fH1SH+JqQUl/j/nnk8sKPLJ7YTO?=
 =?us-ascii?Q?vncb15AKcYUMHSS7pYTRyWzuqO7uMPtvzF7KJ7JmCtRQN9nZ5DuhA/C08C4w?=
 =?us-ascii?Q?7sB4XwYxl9a/X9kEQS5/InZza6ZkX7wPZT6jBCC2rFXCrzthAwfUQbui8JSH?=
 =?us-ascii?Q?d9DlW79ZXYRdBzyQDFKsSRvmJ/6meLQpzgkCPS26RuPVqW+HheKZ40Plg+uS?=
 =?us-ascii?Q?ZpY4ONff73CnLanvNENQbAxX38xJsZOeJ3/duOFgMzdVDjj/SLKzxFd92Xp5?=
 =?us-ascii?Q?uvBCDBmmYlw6em+/1FUm0KyGsMZbxDrHzcYLH4UwO9+IZAlLzpNWN76FLF3n?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa2f82f-e8aa-41f5-03c4-08dd0f398313
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 23:16:24.4378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEenOkjuTtBXRrYcyocHhC8GVtmS4Vl8GlbkRYfH2315rWO15g+xIYtddcD34IePI7MF6uVtJb8r1MVbBk4eI5+o4/T1x3ZKhOlOsdd9edA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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

On Wed, Nov 27, 2024 at 12:30:49AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_wedged: Manage verbosity of GT reset fault injection
> URL   : https://patchwork.freedesktop.org/series/141810/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8126_full -> XEIGTPW_12203_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12203_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12203_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12203_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-5/igt@core_hotunplug@hotreplug.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12203/shard-lnl-6/igt@core_hotunplug@hotreplug.html

This change to the xe_wedged test would not impact the behavior of the
core_hotunplug test.

> Known issues
> ------------
<snip>
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][800] ([Intel XE#1130]) -> [DMESG-WARN][801] ([Intel XE#2919])
>    [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_wedged@basic-wedged.html
>    [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12203/shard-dg2-435/igt@xe_wedged@basic-wedged.html

Although this patch completely fixed the issue for me on the LNL system
I was using to test locally, it looks like we do still need to tell
igt_runner to ignore one more non-stackdump message to completely fix
the bug on all platforms (which I think the other patch on the list from
Kamil should take care of).

Applied to master with Kamil's r-b from the gitlab comment.  Since it
looks like this wasn't a full fix (despite being a move in the right
direction), I re-opened the gitlab issue that got auto-closed as well
until we have the rest of the fix.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
