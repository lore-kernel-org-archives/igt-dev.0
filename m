Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADDE7716E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 21:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031C10E5E5;
	Thu,  5 Dec 2024 21:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOg/O4aF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490810E5E5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733435571; x=1764971571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uelqnIltBEB4tzsbz1J3j/zMmyV2U8CpgF7znWgb/i4=;
 b=aOg/O4aF1TZR+01J6nox3Ak4wmRIGv0AGIFx2vUE5C44yellxClPRXGT
 wUiHMxqXTdM0uTAbjlMQy29osOTah9OXw2wppWcv41tjgdoQb+Kyt0xcg
 xlQYa/DTnWpdCS+6prXLil/G4D4b01pXIsYAyzATN7vF7gh6F04Gdo4kf
 2V2oaUM0N8EwhuMf+ndgJejhfQMV6Cm5NxUyrbG5yQL9wslrHBcVbse3b
 NFC/BbP4l/OuDuKvIWbA/jsDaTpL5By1xlAq69FOSnnqQdO3e39TCbmHn
 LjdS6SDnxSaXBpT3B8rNiuvx5j2KSRXeLMGHJVABnkEXuL8RhoBqwPx/B Q==;
X-CSE-ConnectionGUID: L0d3ClYhROapCSxyDDf78w==
X-CSE-MsgGUID: e9U4M4FiTxaL5VcSMovomA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37558001"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="37558001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 13:52:51 -0800
X-CSE-ConnectionGUID: 635yIL/tTxe14eKWOaWYTw==
X-CSE-MsgGUID: 7J1b6eXUS12lVhrIRVQEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94085309"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 13:52:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 13:52:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 13:52:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 13:52:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ml8RJo9QTGQ2ThPPSztGHIxLrVbZ89PzXX3Q9GLtDkXmS2XaSF5GKu+zaeN9hV6xKn89ES5nXRwIgzkouOFS59rLWPIm0RTsvfePT40JydIosrcOyzBEO1/f2MAi8/yXzK/hdSOBug4nkJtovSaRd3ecSBAS7Vcs9q4LX+iRXGsg+wVyyRDMwMStSm8oMnNJu6ibs/zBgL2GOK/dW44x3MFRdHuN9RsIfu1JyXYrF9oIMhCD7pQZZYhfB36nj3ln+jwgiFpJmlFHBvfLLpAcGBfusWadt6xglZuk++YeQGl04SuyNqVrMW0vDBwYS1JGkulA3NnVQ/ep6ji+kOI4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/hBBqXA91ztqegJy0AMTPj5NU8LTISf8lH/zEfCh3A=;
 b=adV+Udoa+3SYpP0WGLsvtiUkP8/auAOFMYSNTWCAfaf7SLBBQa+QThdd9b50cWKLQ6CiZM1iFYUjZa+s4cAie7eUdpT0Oy37MVFuZ9WbVZIHwSGM41sb5qnIljr0C3Vd3lkevrhVxatb8WvEahBZhPKNOm4LmpgJYQi82kiJKB02fmTdSqGPeMYj0n8kNdpcJXaA1nFA0HeD+kJ4FnAaF19kEU8Mu7qLrDPyM5qmTCa6GpPLuI5BT71uKI6iuWjQvdB8l0myDI4hOiHCVu2xjuJlWt5OuWsGQ9wY68xZFaP415dyvSPHL8cAsblMiN626evZxjHubmF9qXUtauxzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 21:52:44 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 21:52:43 +0000
Date: Thu, 5 Dec 2024 16:52:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_ccs: add hiberbate test
Message-ID: <Z1Igoelq7HqHlv3X@intel.com>
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
 <20241203092418.3454357-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241203092418.3454357-3-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a3b268-fa56-4e3f-986e-08dd157725d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jbzrc8kDNZRtD5BqbabPa9V0ek8sMHmWE+O7zLxz5+GDQnbuJuqLkHkHHtZc?=
 =?us-ascii?Q?QzzzXp4MGC/T1sDuj9nQzZccZIM+bYOlM4oNi71kIYCmld4vigCcFjjcl1/5?=
 =?us-ascii?Q?UawWfWspTGBlNfQMuN8nVMC6an8oUlBQpSTR6/P9/BLoSQikdwNVQwXq+DZ8?=
 =?us-ascii?Q?S0AQXDyaPuBpWNQyfbboW42tDNRg+L7q2cTM/+G/X9/56YHoQwKXDIF6G99l?=
 =?us-ascii?Q?hMQ49DggkIrNtFZ5mJmj/j9sLeBwRJfRq4nSQUEnIbDvAZQlaH7Hnlyk5ZxY?=
 =?us-ascii?Q?IQOn/+RZchaFDtcVOVoV8M7AnK9UyBrFKhxyob7xIxD2WtE1htin4YwsIRtD?=
 =?us-ascii?Q?gY6PrE+UX9Q81TDlc/IezlEDxDJffvLlg5PUZIfLFWPgBGQot4y5/aRc8V7+?=
 =?us-ascii?Q?8PtA/CGlFG8p33eTQAoHiRjQBRIsPMaHUAUgE9CFLhZbAZWzPs/kihgOXO4T?=
 =?us-ascii?Q?mEVVkGodeK0RavKOXH8tOFMn8Mm+/P1ip3BdAFhb7488lPcz4+Dtks9VgbDh?=
 =?us-ascii?Q?5CLXwKE5RhvpiHYn4wTkCem1JZcZjs/Ztt8YVNhwvac34gVhoOsbmGKAWxkp?=
 =?us-ascii?Q?GNPBqQWXiQJ5h1nJDE+4Uk4FInyODQeBePryGMxtKTcPq+37GiXxr258U2DZ?=
 =?us-ascii?Q?a2tT5F7I4EhSLMIUzLCCeUOumyJXFrN6xSoAXWvI8b/d/1gsDZ8Jm7kjj97T?=
 =?us-ascii?Q?7VGgnwXYzEukFy5FT8NGFzAQLiXJCQPqkFVZ7bH8oFyq0hKdrQYCkGs+Tf9S?=
 =?us-ascii?Q?YpFj7ZHZ83cjHLc8eA94vRrwRG8LXEpE9c9PTLzmLiYoomnHRd6DLMoUltQV?=
 =?us-ascii?Q?pnXOhvsRJjpkOeY8k7JaAggXQDQpf5XvKMACekCLMBClQCekZQc4Hn5jYZVj?=
 =?us-ascii?Q?h71qmTCDv1ZNeeyuGqRp2GlN/MbPf9Juu3GGZ8wTsHvs+y/XlmRNm8G+6Ins?=
 =?us-ascii?Q?KZ43KOmRGxHjoeX1EoPmdX6GqhLwwC54EjjdsUYimBHhibJ31WEeNaYk03d/?=
 =?us-ascii?Q?Bm7RQS1YVwajTZhvmXvdyljEt2swZgVQJ0dLw3q60K/a0+OcMkXzg/AIlnA5?=
 =?us-ascii?Q?Z5B52zVjH0MS6hK7cgMz8LHypGvphEIa4Lg8hvaxby4QK+g2wl4YgYYmeZrI?=
 =?us-ascii?Q?SQ7ctyGSqNBHPvEwzYCLly47bkBBlnC3OR42qzmMFrbS43P/91N8b5hvuih2?=
 =?us-ascii?Q?Qa6flaOWXz6fxHyLceZmQ+fHf6BpzFVhlH1YsHynysB/ww5MfpKi+Z3rycva?=
 =?us-ascii?Q?K+vuyYwczjnSmzbmlBK577iCZb3lJADEb7m8TwZv5ngO/mde5SV7n+vebeS2?=
 =?us-ascii?Q?v3AQL+9LmxGWPv1ZautHC1bdzs+cX3LD6rcGBRr+FZrmBQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oAZ37/fHY2EUqmGYXymtICHniafZ9O5/ZEeH+jvT008Zi8hnmiiwF+FknpJ0?=
 =?us-ascii?Q?Fc/dfOiQimlrU6nGAdJOLjJmFT41TxxHwjol84gnJM+Pl3WgIJA0Zvi9iOsg?=
 =?us-ascii?Q?MX+rSyhAFjPhlienAKNQZoGtzHj2eKhmlGVATu1ATrgiMqzqGoaV4NeA0pNx?=
 =?us-ascii?Q?XHo4PjISdwiJxiqSLze4G8Jem+86ATFlkhIRa4vS8pUomLBlm0/YcsykjrD4?=
 =?us-ascii?Q?cDxCSEMA5Xekug3HTsH58odAu3V6CSJwF+jv/33ifXAnFN69ni0VrekpXkt8?=
 =?us-ascii?Q?lyTU4cSpMpHsI+dkwzDiAUqehowcOKeN0bPRlGrrcvRPDI/Dya0TpiRMZekF?=
 =?us-ascii?Q?EexOIEKwU2A2FJSXMiydpiGf1+UxINrVvlaHMzZlGxkF9xwMFDJTLURaqZFD?=
 =?us-ascii?Q?iVhxTpgTXTyVhSlcrVavcEiUumhQythP+DQjm/AWBThJv/oq+3r2QQCmHM0u?=
 =?us-ascii?Q?Efrlcya2ZQ48Vk67VVEMRLA/cKL96cb988OXvbFfqkvtolfYkiQeTOUXx2Q6?=
 =?us-ascii?Q?3/tIr6wFjWDJKtWwhOvTahIuILcKvFouwKanTQptRCU4SyRGQDf/f5Ve/BTo?=
 =?us-ascii?Q?/IjzZ13CtbcXrUZb+2zHbpyKSjLBLtB7Dik9eGDLa7gkjH4zPFeB/CCZXg0R?=
 =?us-ascii?Q?IcbNrcBhYDyRHV9gev0/nZjITt/LcyqVzYiDhwVvKNF34J8Cndh9nQZKNuGA?=
 =?us-ascii?Q?zcmakI4L7pOUhT0OZWvEEZ+OnRsA83ZhQAQGl0R6ED2c9DCeUpOX8M1IMc4T?=
 =?us-ascii?Q?11hQa3g41LY1XsUSJD1s3Ggxr97v5bEJqfRm3NVijPQPF7SgxgUoSX5fgG6L?=
 =?us-ascii?Q?0W9dz2DaxCkk+zJgmqYiQ+Fmi7qPSWAaOgjCHg/swBCVEfstDvWc2me0iWjq?=
 =?us-ascii?Q?2q3jkG7jmf2LEPWfxaU5dwHO6Wpf9ZMZD3ORwca9W5fGLBPRvDVURWx/28Mj?=
 =?us-ascii?Q?yy08Vwv+Xr4xq/MQJ4eAcbMsGsQCKLWOft9jTOHiarBottqPsf2Rpx49aJEP?=
 =?us-ascii?Q?atn8QrwaaI5zPjBa2X4tvVRYvEnz3RGrn5Urt4AuW9aY858nVz3riBYulcF+?=
 =?us-ascii?Q?WWzxTdC95V57zpANUOBNkSagGZ8lr+nMjDD0bGNq3Af4n3xspBvIAQjb5Qqn?=
 =?us-ascii?Q?qrL1+PKk4dl/mu0DWpV6ETfYTm1ameN7WGrz8UvEIHk1NuTCcG0nYY993/oE?=
 =?us-ascii?Q?08nL7tmIKFLXXnyJnjLSkXlvo5pKOHVpDY1TabFdbJgVmSFrXWNjtJSNnZm9?=
 =?us-ascii?Q?CQV6njwDRca9rh4QHLLxP6SS+6eY+F2brmZsB7kHhaD4zF5HhAvoD6vuq6k/?=
 =?us-ascii?Q?HsWou8lL0ZC+9YVLVOv0BRrSq6S3diJlcVjKzVOyi3tui4e2QIQd399/VDWB?=
 =?us-ascii?Q?qgwwInHJARceTxf0fWdZkRwif3eBMIBLrA86pWj7MH9KhVjvolUgf2y0G/4Y?=
 =?us-ascii?Q?faVvYv23Tsntbr9vmRh1yebDlL89HQ1mwzMQuuRB5k+NMZtF3zf9398ZthK1?=
 =?us-ascii?Q?Kbfaedj4JYPkX0FPFr6RK/ePFs4LSXp7xC0T06hWj5b1VZUoxPFzRRc86/0N?=
 =?us-ascii?Q?MyhnGrpvj+G4a6p+8vLo+TwyODOlrDKrmQKRxWPeAIMDP24G0W3e0b57qTlm?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a3b268-fa56-4e3f-986e-08dd157725d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:52:43.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSrl+f52J61hwehIDS30J4jgvvjmTlPNNi38AFWi5TQXqACEXBJstSa/as8NweSwy0tcbhc2dzjyG0NQmXP19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
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

On Tue, Dec 03, 2024 at 11:24:18AM +0200, Juha-Pekka Heikkila wrote:
> Add hibernate test which bring entire system down for short
> hibernate. This mode is added to suspend tests to be run
> manually with '-r' flag because this is not ci friendly test,
> on hibernate ci would lose connection to the hibernated box.
> 
> For this test to work kernel resume point need to be set, from
> kernel command line is checked if there is found something along
> the lines of "resume=/dev/nvme0n1p2" or so to verify hibernate
> will be successful.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_ccs.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 3e9a57863..d720de04a 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -190,6 +190,7 @@ typedef struct {
>  	bool user_seed;
>  	enum igt_commit_style commit;
>  	int fb_list_length;
> +	bool do_hibernate;
>  	struct {
>  		struct igt_fb fb;
>  		int width, height;
> @@ -839,8 +840,17 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>  
>  	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
>  		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
> -			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -						      SUSPEND_TEST_NONE);
> +			if (data->do_hibernate) {
> +				igt_require_f(igt_pm_check_hibernation_support(),
> +					      "Kernel is not cofigured for resume\n");
> +				igt_require_f(igt_pm_ensure_grub_boots_same_kernel(),

supposing we find a better more generic way for the grub:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and no luck with the SUSPEND_STATE_DISK, USPEND_TEST_MEM automatic case?

> +					      "Couldn't find correct kernel in grub.cfg\n");
> +				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> +							      SUSPEND_TEST_NONE);
> +			} else {
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +							      SUSPEND_TEST_NONE);
> +			}
>  
>  			/* on resume check flat ccs is still compressed */
>  			if (is_xe_device(data->drm_fd) &&
> @@ -1044,6 +1054,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>  		data->user_seed = true;
>  		data->seed = strtoul(optarg, NULL, 0);
>  		break;
> +	case 'r':
> +		data->do_hibernate = true;
> +		break;
>  	default:
>  		return IGT_OPT_HANDLER_ERROR;
>  	}
> @@ -1056,9 +1069,10 @@ static data_t data;
>  static const char *help_str =
>  "  -c\t\tCheck the presence of compression meta-data\n"
>  "  -s <seed>\tSeed for random number generator\n"
> +"  -r\t\tOn suspend test do full hibernate with reboot\n"
>  ;
>  
> -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
>  {
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> -- 
> 2.45.2
> 
