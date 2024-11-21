Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6D7E64002
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2025B10E6BE;
	Thu, 21 Nov 2024 18:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUz9R3Qu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152D410E6BE
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732213468; x=1763749468;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=31YNM7Yivl9w9NJc9DP9/ukTSuQDGs1pTzpYeoPXyjE=;
 b=cUz9R3Qu7hmvj3MdBcmMD5g5Fq9IwYFkRvXCVaYr7IVbzOWEcc73A4Et
 5cJN+/omMjj67oKtCja2Srnwwuy4c0oGwMqO1WpKmcTeidGJEYmedUHKb
 wrVBHlTmMKBe0nphtQIDNPz54UZYMkY9dpKgh0oL68nB6KpI1DQC+e6DM
 Zkc7LgO/ldz/H2A7qRppXtRG+umE4AiWrD0ZFOk9DU+xqzISFH1ED72go
 K3ffYsrh/3IgroW9MdJKNgVAiO44QqXHJYF4Iq4CeQRn6rcXmuBJQQZPY
 gpJUKLfjcLe45ElHeoABAK5oDq9uXNvqg4grSrpUTblMF2waO1hEgYY3q g==;
X-CSE-ConnectionGUID: E/1DJ8EATE+iKnRefkp6Bg==
X-CSE-MsgGUID: 4Tj1dD9xSGGNMrrmmsShrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35206883"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="35206883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:24:28 -0800
X-CSE-ConnectionGUID: V5OMgNHHT/C3VG8R4oiJOg==
X-CSE-MsgGUID: vw7Jb+wvRRWBXM91Otmt7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94777584"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:24:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:24:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:24:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keVc5aGL6TEgEbMee6yxz1gTwVihTgPhAMRkLN6H19u0MnGAJUhk/o8h9RimAdqEZB4dndvuT0qPgwaRFmBGBYa8BC6OxDyXUhy7EILSAYfk0/zfBNdxSoD8m5ysihao2P2ohFJdZsNjAilkNzOXPApks1Cjoafjp68AsQM5C4ixympuq3xZShPq5q2Ce7TyL+76QB2XPnbrU4MNqlFX++Fu4T9i/hx26eLwN4aT2gZIh1xYAUF/DT1vm/1krBlwzvRoAQRP5ssJ1LKn2vS+DF3r+2g8stkpxps46UKqrRPZobCz318J98cxk6alF9N70O1521+04BNQOdXV0AYC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTZOEtSJIMlP5e+IM3dkH+n01FQNIYamLTWK6dxzy7w=;
 b=grbKDt7e4I+okzycz3zXCJMRNuXEkTfyZra+MVWnrqX3jilHHzfsRRpmvLMV8MNmJEZvUytq9f80AajaFcvD5xBY84H6L6/DHQGefKemZoN3mQFSStKv6lrimhMmEhcBUndRFDPKVs1q2JzuAruCrGgPiJ+NLcZo6a/p9GZIp8/KbS0NRHmlYAoDAg5Kn32wgcxpIHtnCxiNbzUWPd+nbmUCSQ9snRJEooYIrAmNXNIPXu2W5JiKE01Wu3AltlHyoGbQRSzEEOjXsS1umbDvY6e7pXFiPI5VDytpy8U/ePtKWNPp0ZBGgg0FwFFn896R6o9S+RIjbV5crylndiD9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 18:24:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 18:24:11 +0000
Date: Thu, 21 Nov 2024 10:24:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/intel_device_info: Use per-thread device info cache
Message-ID: <20241121182408.GF4891@mdroper-desk1.amr.corp.intel.com>
References: <20241120223546.145304-1-matthew.d.roper@intel.com>
 <173215017452.913951.9236271103626224838@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173215017452.913951.9236271103626224838@b555e5b46a47>
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 137ae77c-b5b2-4890-4cbb-08dd0a59b1fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1kYMs6M7ASgQon4AgCXz88ANQtRAwz+DX1EGo84U64LKB1luLYQITebTrxeW?=
 =?us-ascii?Q?TV/p94CxPUDNs9GIZle0u8XU69iTk3wVBnY0BCOCuVB/xisnxiSs9odnE9Sb?=
 =?us-ascii?Q?ETP/V+cJBxHtk/6ZJneCgmrjyeyfqhgyqelBk2I3wSqgGZPl0FcHGE3nBBQc?=
 =?us-ascii?Q?nDIQvuz4EP7k+bpS+E6Hh7nXIE+9+wZx7xS1XTRtE93NZ1bnxnijFUA8E1MF?=
 =?us-ascii?Q?6e3ETHk0qWFx7xEE6DRtySwbWzCxi4hPSfS0mAPAhf68/05g4kZ9KjFq/d7k?=
 =?us-ascii?Q?6++NlOPZr4v57T+3IkQ8Y1iszfTCr5/tz5GaaOSn/8qRXeFErY/PNf2FMUA0?=
 =?us-ascii?Q?SrF0fI93ZfojjHIzbL7ua8vzKBrOjj6cOu+zakiWP+LeDLbjWxzpnGsumUB1?=
 =?us-ascii?Q?HxQJhQCKcyePKdl3tI/KVzKoqZWYg+B7DVCDz5EsVf+SSX8YCCEwwOrGCQtw?=
 =?us-ascii?Q?nKn09jPCAh3LTu/N0pBLM+qPfKWcKH3yRQ3frX7D6rC/PAk1EGq9qkctIkvM?=
 =?us-ascii?Q?1Do6TKcwxA7sTLdMmqbeObQKTrktAdMMCe8VNSjPBgpB1sp1WHjye0NZD8zq?=
 =?us-ascii?Q?YQcHt+riW0H2SroJ79aqcIfn+iIitxLSv/uYu/zG84bP2AMQPHXDM/f0M3Yu?=
 =?us-ascii?Q?vSJUZX0A5ZaHM9p3O5Xt/+YPNf33VdFNgBbs90B2bsl0201GARotK0IpNjCk?=
 =?us-ascii?Q?Vj64dd0stk6Ydw2tzQw3RRGlg7wtdqjQEX+9InPNwE14G9BNwfTyI92/PWf3?=
 =?us-ascii?Q?tHXvni/1v1JuUGfSqbjTsgZGlZQUnQIYz7OOwzmQWdZAmsWeleraT4LcUVve?=
 =?us-ascii?Q?HRg7xV5Uk+ELBSA+ZJ55gLu13Xl7eUOFNJp4BFcTdfR24pJHARs+CCGSnRjk?=
 =?us-ascii?Q?nYvoxO6zqNd+NShSgDJlhC1w9uuPSmYpLp9OeNSpspDqMrjAi7rX6xlJKuPT?=
 =?us-ascii?Q?w9HbsjEtTf3tlv9RIBMdmsKu8oluB93CIrwSOM/og7vIx6JbJeu8dyTJx6Tm?=
 =?us-ascii?Q?oFCFKhPfhQxqRKTpJ4JM80xLzOquXC0PGDU6p6ysijH84NHqIx6v5SIIFIZV?=
 =?us-ascii?Q?+JngSeqxTwijkdIeZn9hFoAxpgOdI3OzMw2ifaj3J5hNEGV4ZhKOs0r+Ssf5?=
 =?us-ascii?Q?s/P4B4d8Xqqzycx+F2TeS5cVfr+hp1Z74+nO6qNB3bPePV77TRrjF7V2Z38D?=
 =?us-ascii?Q?30OrApbUEtI/uwlKKvBXJFhK/3gldhRH9iKj+HHN2JFcN7LhPUXzkBr3dAn1?=
 =?us-ascii?Q?1nOX/8ADyaAvAINNdV7g2X0Vka17uqfmQvdEgewdzA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2v6dynGIclwoD7gW9zP1Rk5u/X23CH1e5DdLECzZW5G1ZNmt/6syuO7cLl9?=
 =?us-ascii?Q?xxJutpg+RHhhTdZHMeUIJ9SbMWK4iq5pbLHBY7w4n0ImiDz5O0G+Jsi/gFXG?=
 =?us-ascii?Q?9bAT4L323nuvAcJ2UWMl1iFSdx58oyAQI5yEFfSusz10p0FPhpR+oIvMDcfd?=
 =?us-ascii?Q?n1EPZEW30/p94XYZkCT6tDmyNInRf+qDAKEI8Rhj1vcqkzuFdO50osQK+phd?=
 =?us-ascii?Q?ZuLT7aAnusbeBuRjkOx+NKiTu4cmaGvXFFoGrQfHmi9ZwfW7I8GKsDXeuiGz?=
 =?us-ascii?Q?G5bUoCbtbpS04YIar75d6vPMZDITy2LSl9SX8z7ciaHlD2v03nJ1FA5LuX/x?=
 =?us-ascii?Q?gOBpHHiIAsAfOX1Npl3tMDP3BSYxkbRhBtDYsTV/UUaS66l3R5VlK6BSKkl2?=
 =?us-ascii?Q?ArhackjmbEU8fw0QxXf1EmWWNbGnHig+518W6LAZf9XQ2t7U6B6QALma7LFv?=
 =?us-ascii?Q?V6mIa6KaTEVrBQcKl1QQ3THSAEWSxsoL284OWcutJXuFmipOKmh8HmNQ8l+y?=
 =?us-ascii?Q?Sc9HE9E3MAzHfTMl4/zQYXBtKWW+8YAvnF3bcjLiZ0VHujuwmksR+4skZSnp?=
 =?us-ascii?Q?s9CdBvQe64eOs7YTmhRgd0+Z8zoQ8546Lx1sstOfrXwLDC4jvfR1OcCNTNMt?=
 =?us-ascii?Q?C1Ao8yzRrYkI8jHTFiuKqZ90EksWzxh1kJueJGsJlzmb3FArr/9EsAdke0m8?=
 =?us-ascii?Q?9hnL0z2r11kmFjf5Mo1A2bhTSa2A/DAmb8ZJlNqmyJvbebF3J+CrBXcmQDT6?=
 =?us-ascii?Q?pCKUNwMLauZ/XcUOomDDwdQtOxW9Dq+/b4VvCN3OnkF0ApBOknHQ6ndwroma?=
 =?us-ascii?Q?knnliiOGolVVg8pxyUouNJcwNVYvS25GJe0Xf9uwItT+xuCju2QBjKaaWUov?=
 =?us-ascii?Q?KBAZ+n4WwUvagzdRc2D6ye5mG+LfDhC9K6N9+r5Zy08cJRtfMqnSh0n2h41D?=
 =?us-ascii?Q?qB0eTLraiyLKtUX6jZlTBMYVUEc2DQvpqA21JWgs9YIK615SKSzQtqOrbdDn?=
 =?us-ascii?Q?NR111SgNu73icTpT2y/Q5zQsylTzgZdyQmjFsA+1ZCoyy2w5NjlEVHCOhDMv?=
 =?us-ascii?Q?Lo21XbJIVyi+3KvYfLe8V5fnuIMtZBT66PQIV4XjwJ/oLkIWi8bWAhx0F4BP?=
 =?us-ascii?Q?I+GZYX97VVSd0p4inX2KZ1oQyhjlXS7emPFS0FZsmSpveiF6/WVRVP8BeR4z?=
 =?us-ascii?Q?lvJa7Ue3NoV6YQNYjjzxsr8hu5UWfz8dqWhJu8GNt9nXozFhtG7INwEm1fho?=
 =?us-ascii?Q?Z7+hP/wfbzYSYF9PfIz1yxkHR4RosDBMURgxgysgmQbwEr/coxKz7Efpqj6g?=
 =?us-ascii?Q?JV3xAaOwkfw0Aa8VjR4KP4PvbRa6JvllxxVo9U0IBXPs7vFwJmv0+i9eyHzh?=
 =?us-ascii?Q?oYce8T37aBVJ5UehU5we3un+S2dK5cAvISNXTnQS6/wbBpMsg5a6ATceG7QS?=
 =?us-ascii?Q?qES4DRE7Kny65td1nt0/hTKpmH1uwHbv3edrvBKEOasyFxJqbNLNkqQJJxMA?=
 =?us-ascii?Q?g/eI6DQr2CevGTvPaC4xt+mgtQmUsrueGogcCZxnbG1qbzzCuzskJMVkfl4L?=
 =?us-ascii?Q?VtFA69RjCZpegMRIEqlzgDQQX435IZaTdevHb/CxIQpVLtwWK43Pik6AvFI9?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 137ae77c-b5b2-4890-4cbb-08dd0a59b1fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:24:11.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qxono+jSchaoM39t9+j69T5K3TM19fURFF6MyuUKrN+oktwzTcqYSXlNnUs/SyLoq5f16OBiBIF31yWcL0e3oo1J5cEfZmPyhiDC0+4O8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
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

On Thu, Nov 21, 2024 at 12:49:34AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_device_info: Use per-thread device info cache
> URL   : https://patchwork.freedesktop.org/series/141627/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8118 -> IGTPW_12153
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12153 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12153, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12153:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

FIFO underrun on a display test.  Not related to the device info lookup
change here.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12153 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - fi-kbl-8809g:       [PASS][3] -> [SKIP][4] ([i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@fbdev@info.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@fbdev@info.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-rpls-4:         [PASS][5] -> [FAIL][6] ([i915#12903])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@kms_flip@basic-plain-flip:
>     - fi-kbl-8809g:       [PASS][7] -> [SKIP][8] +6 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_flip@basic-plain-flip.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-twl-2:          [DMESG-WARN][9] ([i915#1982]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-twl-2/igt@i915_module_load@load.html
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg2-11:         [FAIL][11] ([i915#12903]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>     - bat-adls-6:         [FAIL][13] ([i915#12903]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-adls-6/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-8:         [ABORT][15] ([i915#12829]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-8:         [ABORT][17] ([i915#12061]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_addfb_basic@too-high:
>     - fi-kbl-8809g:       [FAIL][19] ([i915#12900]) -> [PASS][20] +37 other tests pass
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - fi-kbl-8809g:       [SKIP][21] -> [PASS][22] +4 other tests pass
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-apl-1:          [DMESG-WARN][23] ([i915#12918]) -> [PASS][24] +2 other tests pass
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - fi-kbl-8809g:       [FAIL][25] ([i915#12902]) -> [SKIP][26] +5 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/fi-kbl-8809g/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
>   [i915#12900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12900
>   [i915#12902]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12902
>   [i915#12903]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12903
>   [i915#12918]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12918
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8118 -> IGTPW_12153
>   * Linux: CI_DRM_15720 -> CI_DRM_15725
> 
>   CI-20190529: 20190529
>   CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15725: e46649e7764a9f6868ccbcba7b8b23b413303380 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12153: f93e94ca39aabc9a0f6e3112f2f212e9ebfcb22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12153/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
