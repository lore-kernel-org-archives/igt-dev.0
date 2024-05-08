Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC806C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 10:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709A711359A;
	Wed,  8 May 2024 10:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8sVtQE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2924510F47C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715164668; x=1746700668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PGz74doVz6Mp77oYSMUoSu5vUMwXI0d1Q9lBL0Mc8hE=;
 b=Q8sVtQE8HeQGKD34yEi66n6udbrYw74PhjYoJZJF8N5hjbsZi5mwT5AE
 a2GpIkQgNn+moI8wJjqmK1J/gKtAESVoH+4IgJf/ICMeHAAdg3PImW1x5
 WH4qHdvj9h8Vc/XVfqJ3HKb924w6DJAkzlqOF0whNdoQ4PhMUxv5FCrrV
 udGH/zoWeq0S3pkWgnbbNnx7sPaKpL+B7YQ0DGB8qjmVeZF5lTAIdYzvT
 F4EXn9SiHs4tcr4zO7KVTvgMN8cacPLI5BhBJLurXktP8NUlUdBrgfbUu
 B4eYKctdkZGNw/mssTYWN2Olz1BepDehnyQYpVRuLfkTSEydX2gq/TFpl A==;
X-CSE-ConnectionGUID: yo2m4dcaSeSb9n8CBqOmEQ==
X-CSE-MsgGUID: mMb3/e3xSZenEzNR35gn4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14833775"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14833775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 03:37:48 -0700
X-CSE-ConnectionGUID: xV8+3ktWSSCwhqDox10mBQ==
X-CSE-MsgGUID: Gp2il82cR3mhy8ubKNhpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33317262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:37:47 -0700
Date: Wed, 8 May 2024 12:37:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel: add other missing core tests to
 xe_test_config.json
Message-ID: <20240508103744.ocxltiw4brfain4u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240508102941.383343-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240508102941.383343-1-mauro.chehab@linux.intel.com>
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
On 2024-05-08 at 12:29:41 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> All core tests are used to check Xe functionality. Add them to the Xe
> testplan configuration.
> 
> Also, move descriptions for simple tests to the right place,
------- ^^^^
s/move/add/

With that,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> as otherwise warnings will be produced:
> 	Warning: igt@core_getclient Description documentation is missing
> 	Warning: igt@core_getstats Description documentation is missing
> 	Warning: igt@core_setmaster_vs_auth Description documentation is missing
> 
> As each subtest requires its own description.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/core_getclient.c          | 1 +
>  tests/core_getstats.c           | 1 +
>  tests/core_setmaster_vs_auth.c  | 1 +
>  tests/intel/xe_test_config.json | 2 +-
>  4 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 308f2c0e4422..5914335724d3 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -41,6 +41,7 @@
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index b2d26a8260a9..05e0eae34008 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -42,6 +42,7 @@
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   */
>  
>  /**
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 592d850f6bc5..4605f84530e4 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -50,6 +50,7 @@
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: Check that drop/setMaster correctly transfer master state
>   */
>  
>  IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 3775e63fc65e..6651c12073c6 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
> +    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c" ],
>      "fields": {
>          "Run type": {
>              "_properties_": {
> -- 
> 2.44.0
> 
