Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D269D58D79
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 18:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839E10E044;
	Mon, 25 Nov 2024 18:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVI54OB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566AE10E044
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732558964; x=1764094964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DErx8vzRO0n7L90vNnA13A/QYl1Z31IRxXdgYt87ozs=;
 b=DVI54OB8q0cvfaSmwZB43nFNjV6FFCPHr0wEKgxi4LqJwyY8Jz1xTcBi
 IR43pxtVk0fOjlbWDO95XlsJrR40kWNNHkh6QDk+oyI9GcH2/XNh+PAUU
 FCw/lIzfNmC1KaFUrmxVXsfc0icUfKrXJoTyyY4KloiWciePHkHaOVVoC
 3PHp9fThArWzXhlf4bTOE7xdbqRWCKLXxhb+s47sZMryKx8u7c6hLVF3e
 rWaHvK8T4zrjSuZRDpGgIT+gubgGvHULnnDEpr/jp5n32RPUKdtu9zRNn
 uZdjKZJ6ZK9YqLVHzejMe5QhbW2zqOAyZWche/LjllHvdNdU6Pvc+zZNS A==;
X-CSE-ConnectionGUID: fkrq9H5ATVicyG4Uui0jhQ==
X-CSE-MsgGUID: iJV7C46HQ/yIhJLxybUSKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44065500"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="44065500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 10:22:43 -0800
X-CSE-ConnectionGUID: GvAL5dINQUGhJqrxTEg0+Q==
X-CSE-MsgGUID: dRWWhU6jQ/ur3ttnzBPPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="122208069"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 10:22:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 10:22:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 10:22:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 10:22:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoyJfxAVmKsJm6IIItGp89ip18m4pUbLPvLY9piAipH8r9EdX/bDEcI9CjG8Ip0oyjbH4wQaf/Wu9ssvDREhGs+JAuzzcEOhU9vuPRNtexhBeoHQX+ZO0wzdAa1vocGMCsLak36VpAahO4YnJqy1MYPXgzX0lUQrf+znx2wPLCHGG/VoOOGSc2lzkazJOCqmaKIoPNk9yJ9xBhUPipS1doFO2QbrdcN+PJFmIhJ56FKvqVpkEeKqav+kAQaJVOkuEux5UQYlgdhid6DNPOoyaxdLaVNXp+J+fotLOW/INF/ndtfKyqr+HsM+T7utot+ZrUscmQKbwcn5icByE/xpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROHplTl215ydiOJ9S94foWufitrWjKz5mKOkObPNvfY=;
 b=FQPJHidS0TKpsxcJsbBRxsF6/Xv5GxNfRTcI3OF/GNTltTP/V8iheHlP9MnXfcUFNq4cNqNl+Mim9X3kzARA3ZZXENVcNP6fO3HdlES1A2EToqSEXH+nNWrOOXwlVHbbToER3sBDDivmuqMh/mrPVQzOm33eh/S5O66weuRJEjSBfdO1MzG5YJ2E6IpZ0wE07aiIvwOw20kbWjQeQMxvzT30fDalTyduEVw7Z5jF+aVD9LWK6nbTFTn92PN3fi6ESd6/4r11UyU711oc56ANCmjeLJ/JCu2kOZXvKl42cQSIymz/pHzLHAxWqoNPuVkKx9/B6c0IvouwrqtR3NusBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 18:22:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Mon, 25 Nov 2024
 18:22:34 +0000
Date: Mon, 25 Nov 2024 13:22:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
Subject: Re: [PATCH] tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer
 creation format
Message-ID: <Z0TAXl62KunlTuxl@intel.com>
References: <20241125171028.383914-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241125171028.383914-1-jeevan.b@intel.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 82986d63-ba08-4284-5da5-08dd0d7e21ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUJcmNMA3JBsvoj66SavFlF1o02A7EBVbXiX5td5Z2J64k4loEmZns3b4jSO?=
 =?us-ascii?Q?yq3bKBSI3ZQ5J7LtlWeSOtB9SKHL2phK7R3TtDkwhqzYc2JOuIBNefgHKay/?=
 =?us-ascii?Q?ahV38SIatdMPK0rfUnlyDrClyTPxXLOr2o3529QgzUe+TKe9EwVlZ0Ltj7iS?=
 =?us-ascii?Q?N9TiVW8XDtTnF8+8yEoZl3LhBZ4QyW38GF3zmOEeelYF9IBNoIBa70fsbBhq?=
 =?us-ascii?Q?LH3cFV0YmOsrYnzyNQUUWg0KmqPKXRYuebLmwBy+91kHe2A7Sd8Bc6YVOUAi?=
 =?us-ascii?Q?VW8AZML9x1AIDg0PgDMnM3lfQuoO1btDxN3TqWAdlw7GDUnDM5KQtFFOYBSv?=
 =?us-ascii?Q?s7cmUTvm/gorokfwuIRiWlkOdCJUvns8Gsprjk2IZf3VZpvg/dVI4LjR/IAp?=
 =?us-ascii?Q?pr5/AJisSEZDX9ktcI8w1bCk1VGsjy9dE3lcE0W/bhQBSPIiY0MFv9zKnoaW?=
 =?us-ascii?Q?TkgNQOUDVhYkviOuFmr9ZVMPl1hntNYI6Kfk2im19Ioo9zELDNkcl45eASfB?=
 =?us-ascii?Q?40fGexUyyScaTaKdwz9sf+1a8rXFPZ/dH01BeW98IfCTHpkvDxBxLtXr6DB5?=
 =?us-ascii?Q?U7RwDQvf+OhD3Kxl5EF0xjO1dLiqGBqT5x8xk1tthsiZmr7ZaHuKzErPNcoo?=
 =?us-ascii?Q?An0gzj2F7T7Xa+t/rQsewLmGbUanTJY38p0GwA8VoHRoRXceFr+JBoI3WB+6?=
 =?us-ascii?Q?GsJ5VGxdtzZPIawwX5a5GtJFc0IVpwzwkgTtnXOG3h728WMu9MZBiU91T3x1?=
 =?us-ascii?Q?7YqYgyAZ3/11ebCfVpZR4dduHXmxmoAYE8sq2K/DDto8emvTweXlgi11aLzp?=
 =?us-ascii?Q?d9leHOuxeuyMG7YKZAb+c2haT3/Nd+M810FKKWdnzz+o0Rq29mFr8eRibk+c?=
 =?us-ascii?Q?sMypFBhZnD5n/wn3bPQ36bU9kATkBjtn6U0JvDZtl8LVNk9np0qH9d12mG0G?=
 =?us-ascii?Q?rl9ZNZflHyaxK1H/gZjUeAuQYchjF+m1zSZEjB1dkshqWHgUSuHd/0w44Moy?=
 =?us-ascii?Q?GXyDkoDMaeD9NgnfVsiTesPmcisj5Xt2gKFfPSMmD9qNiM1Uied8XnA9GohN?=
 =?us-ascii?Q?DVoZj4OMcOCkOahiCc4pGZ4SpkrhdJ/ZR2ann/Z+GJYYcsIdComai87WUGrv?=
 =?us-ascii?Q?MAOhhZO388W5SbpwpZyWmb3uJC/GCufFzySB7CuaYN/02zG+tCniu0Tn3sCP?=
 =?us-ascii?Q?9P1E1ah4iKAOZBgqAuQzkqYeISlUYROJ+bRt+2K3wT3Tj+zjujadIIF3Iul0?=
 =?us-ascii?Q?VSeqAPPUzwmqEYUDMy/ZwzQ5gpq+Hod0Uf/3KdBt9xjW8U2qCXUw3wtSjnDz?=
 =?us-ascii?Q?8+AMUEiA8bpofwLIMvEvSV+dyfi/wYE7XruD0FjglZYHBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J+BeXjxfmU27NFRlnJs5gHHcDsCylKijjr/dGzovaxcI+hDqdLlz//70hLYl?=
 =?us-ascii?Q?txGN4pNS3zJC14h0qrk9yshre7gRb54tvrHCSuPMZdXaEk2Qg1FkFXJYzEDc?=
 =?us-ascii?Q?4XFRPiuZyiu/DPrAfXZiBtt1CqzmdsCGRoROOf8WHeIqNTRk+3VEM2jBUsCT?=
 =?us-ascii?Q?XfXCxGuXLCSWy8QHKT2aETYMkhlywYlMqEVXgCIN7fjAmP0Ieauq1H5T2kdY?=
 =?us-ascii?Q?kzP7I1xrS3P1/nrnBZZcIs6/VDojLTOOTzbDjCTe4FomNbt64QoPBLNFIBnc?=
 =?us-ascii?Q?Ju2jNQ0tfYYnEAvqJ1VSwavtMl/2T5dZz8YBi3FPEv0dAghBTymIreaVQt4b?=
 =?us-ascii?Q?7JILdYcK9O9a931I9tWT61AbjjuEmmMrYpfXYjOaJCaIfQOCsAdwozLySfAh?=
 =?us-ascii?Q?jCIFUz6/OTuClAbPP8hNZeAHXsq/6GJ3NOMh0wm5c8JV0MlBOiBa3cTDi6yu?=
 =?us-ascii?Q?aJ9QTMB3OVuFL1Qf/zARm4MfW5QXdu237se4n5l2IeaWTWzLiqqyOJcO14rI?=
 =?us-ascii?Q?g/UxlpGOu41W2RIQ1uSjF5NEPteOmZNEhi+mAg9QaqwJz+S+JgBgc/oCzJwN?=
 =?us-ascii?Q?wKAiHn0Pf714ZFBzTHbDmkKtcuBXE7374MWQEidNRan6+/EYFSahHlmyfWku?=
 =?us-ascii?Q?WWiDUjViT/gvSBflzIR7NJ09STH7Z+LfjZ7kHda4XdBEJg7PcL7BnrpMoayf?=
 =?us-ascii?Q?ASLq9geSZZuKKVya/ljL2EghEWzo/suJS/zoak4i6weaD3gTqKe6pCaqM7sy?=
 =?us-ascii?Q?N156/BPiAL2g4adXOPCCT2/ftmDAvNCjhonO2G9aCIkkbbHxMCGmduCZ9yHV?=
 =?us-ascii?Q?+9UiC/yXFg+K5b5jeh4rRhOOYdvZGZdVnmyYUnIxJE6RfxVGxQleSKqFsm1e?=
 =?us-ascii?Q?VENH8WCd78l+H93SEIt+XY91/rs0RJCgRWysBXXizO+4kvVbKfpai1BWLKwG?=
 =?us-ascii?Q?lGhrQV6m/i3aTFLvlZQlYn9eaRrqUJ8Cp39f/JO0p70I34eJzRvuke5gCVLW?=
 =?us-ascii?Q?xnPJxjF3vjujleXfPJl66LJ7jQ7iQ9ql3dTYh6vS4B4sp2jDEXBcNZina9EQ?=
 =?us-ascii?Q?tvQhokJdiuu8CDRhmAf/9/NueQUjzpGGt9MUjB2pMb4nAqzqHWMCKCLXvdu+?=
 =?us-ascii?Q?lAvdBDCaZwZ6/GxcT1ksleXSXUFM3jMymwSsqHR+IBQeK5Pi+QbdjMZj0V9Z?=
 =?us-ascii?Q?F7PKnTjlkbFt6NcUVhp9fqc6Ek1VafZXbV/t6GtOL4yHffuIQ3+RUWmTDPUo?=
 =?us-ascii?Q?Xrv44exquDoJED9t1yi2fVHKNS4Ywt10xZjpKT6TNeoIJJRq8gdO5T3/4oJR?=
 =?us-ascii?Q?h42v0X0VIvfT1LxBJdeNFxHrHvgC5dctoYTHLJ9lzocS11yQOltc32FJ+ibx?=
 =?us-ascii?Q?tWnerk44oZbg2fNoBWjXOnb4xOcLomMahUTmQDOZ/5i2Wvqoa5wIP9I8gdXE?=
 =?us-ascii?Q?cFDbZbH+i2geL+HNlP7y2E4R5ty/6sCafRKm0uIwL4X6NA/VG1MQkpYn6m0v?=
 =?us-ascii?Q?gEhKl4uCoBoR49Vvwnj0Rc1oB+7+NYxMJVc3gi6oVapkapAjE581InAqXAjC?=
 =?us-ascii?Q?4qKSNOZ0QXLzb5ukO9lU5/M/D5Olbu10k1rN/r1fMqDh66NGUofGU9gNRNg3?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82986d63-ba08-4284-5da5-08dd0d7e21ee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:22:34.6826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFA97/+axznHOGLUr5kuUTLDbsVW8LSw2rzMw3YRiSfvrTIARQOxP3LIjJ1IUMUnFyjl5FoK+ooaCycIIpQbTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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

On Mon, Nov 25, 2024 at 10:40:28PM +0530, Jeevan B wrote:
> Updated cursor_fb3 framebuffer creation in the cursor subtest function
> to use linear tiling instead of x-tile. As x-tile is no longer supported
> on latest platforms.

Shouldn't we then add a new format without removing the old ones?
Otherwise it looks like you are removing coverage on old platforms.

> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 990c50915..aeeaf69f7 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
>  	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>  		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
>  	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
>  
>  	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>  	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> -- 
> 2.25.1
> 
