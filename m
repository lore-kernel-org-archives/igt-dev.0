Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685EDC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 10:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00A10E083;
	Wed,  8 May 2024 10:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7fki7PW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CA310E083
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715163275; x=1746699275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YnRSi35BcFMZjTA/Lfwq7ZN3LY2q3r+cRy6WTox5ceU=;
 b=P7fki7PWyqvFIVpYQXTeCCJ8haEY1ZugWY17vur5M4VMGK2zpGuMXzYK
 846LyVKo8cp+z4sw6RuD5vJhpnOP76vr/1ca7wCQO5EIuqJG7IhjU0rQc
 fUGAKcDiRx+O2UcZInA8HGme2X6XTkZO0QgmLLDCKMDYPu/EGPdcsnjcV
 etdtHc+AmmnYWJxlaA483tZo6XflFJysmbxVS/uF5NXz1Xe3zOmHSfbkZ
 SL6GFwTvACD4X5SPAL+j2NBjM+lxxkEtABqRUwkFXPhk5g3oKQEeqmAQF
 ThvxpQsXfsOe+sL83AQ04ywIYVrGQ0CNAaw5IfUrKOlit1Z5EOoTrbWyp w==;
X-CSE-ConnectionGUID: V7YUWhoGSaKnATj9s0J01Q==
X-CSE-MsgGUID: 6uoYgUggTVuDxI7K5suASQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11168018"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="11168018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:14:34 -0700
X-CSE-ConnectionGUID: nevIVaugSPeTyl4QCG3xyw==
X-CSE-MsgGUID: T8YZeevEQUCd4RA80lR1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; d="scan'208";a="60004580"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:14:33 -0700
Date: Wed, 8 May 2024 12:13:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel: add some missing core tests to
 xe_test_config.json
Message-ID: <20240508101349.sxne4f4bp2dw2v6x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240508094931.380460-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240508094931.380460-1-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-05-08 at 11:49:31 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Such tests are also used to check Xe functionality. Add them
> to the Xe testplan configuration.
> 
> Also, move descriptions for simple tests to the right place,
> as otherwise warnings will be produced:
> 	Warning: igt@core_getclient Description documentation is missing
> 	Warning: igt@core_getstats Description documentation is missing
> 	Warning: igt@core_setmaster_vs_auth Description documentation is missing
> 
> As each subtest requires its own description.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/core_getclient.c          | 2 +-
>  tests/core_getstats.c           | 2 +-
>  tests/core_setmaster_vs_auth.c  | 2 +-

These are only 3 for total of 7 core tests, imho we should have them all.

>  tests/intel/xe_test_config.json | 4 +++-
>  4 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 308f2c0e4422..6756c0882381 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -34,13 +34,13 @@
>  /**
>   * TEST: core getclient
>   * Category: Desktop client
> - * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.

imho here you could just leave it (no deletion needed).
Or if you insist you could write a generic description
and use it in other tests:

 * Description: Tests core DRM_IOCTL_* ioctl.

>   * Feature: core
>   * Functionality: permission management for clients
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index b2d26a8260a9..6f98087253c7 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -35,13 +35,13 @@
>  /**
>   * TEST: core getstats
>   * Category: Desktop client
> - * Description: Tests the DRM_IOCTL_GET_STATS ioctl.

Same here.

>   * Feature: core
>   * Functionality: DRM memory management
>   * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   */
>  
>  /**
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 592d850f6bc5..c8fbc827b9f1 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -43,13 +43,13 @@
>  /**
>   * TEST: core setmaster vs auth
>   * Category: Desktop client
> - * Description: Check that drop/setMaster correctly transfer master state

Same here.

>   * Feature: core
>   * Functionality: permission management for clients
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Check that drop/setMaster correctly transfer master state
>   */
>  
>  IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 3775e63fc65e..ef3993dae8e5 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,9 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
> +    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c",

imho better: ../core_*.c

Regards,
Kamil

> +               "../core_auth.c", "../core_getclient.c", "../core_getstats.c",
> +               "../core_getversion.c", "../core_setmaster.c", "../core_setmaster_vs_auth.c" ],
>      "fields": {
>          "Run type": {
>              "_properties_": {
> -- 
> 2.44.0
> 
