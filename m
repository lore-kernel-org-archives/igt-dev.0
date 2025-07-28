Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC40C87FCE
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 08:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7010E4B0;
	Mon, 28 Jul 2025 08:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpHm3w7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7910E4B2
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753691683; x=1785227683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gzt5KdOlyQy1yfU2aC8qJwbwdJZ9lGoPMetbUgZfgeI=;
 b=ZpHm3w7qGqsYYyqRvmI9nzopZsUaZeymvo38/85y0i+jee1oQmT59PuC
 BMcNjUX6dfU1k/MCsjLdFhtBwffWvguv5tHrsmrKQaLgz5HgQwQhu9KJj
 HaEGIIKwMUnNHZV1uaY9zzdJ+nsxDrbY9QHIZNquWa67v5qMMtpEL2wVb
 wkCGXeh634hJ1ofsNRNWykkTyECMx3743wKxRCNgIrO+Y/URttLnzSJqa
 KC7vfZmRnCt1kfsSU6bXtHZzEdz1mQWaTmr/iNc4668/z958kaOSXnVVz
 +QnoRs5kw9vOki1CBJym9TgPTInxTW0XGgl2hHcnTH7MOxA3YsIExBXoh A==;
X-CSE-ConnectionGUID: 0usng0VKTvavQcGkxVvkog==
X-CSE-MsgGUID: 9oqaXAj7S+m92Ej4Q88RBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56080820"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56080820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:34:42 -0700
X-CSE-ConnectionGUID: eukyM5fDRlqfevDeXjOoaA==
X-CSE-MsgGUID: wZwKzE4bRvGnNp+lQUgvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166833611"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 01:34:41 -0700
Date: Mon, 28 Jul 2025 10:34:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/kms_debugfs: Use static var for display
Message-ID: <20250728083423.vtvhkoy4vhz2gkii@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>
References: <20250724122710.192060-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724122710.192060-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-07-24 at 14:27:10 +0200, Peter Senna Tschudin wrote:
> Commit ebe65a923a2b ("tests: Add kms_debugfs") introduced a new test.
> Unfortunately, that commit used dynamic allocation for `display` and
> missed a call to free(display) during cleanup. Use a stack variable
> instead, eliminating the need for dynamic memory management.
> 
> Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  tests/kms_debugfs.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index 75ef15353..570ad1c0c 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -97,7 +97,7 @@ IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
>  igt_main
>  {
>  	int debugfs = -1;
> -	igt_display_t *display;
> +	igt_display_t display;
>  	int fd = -1;
>  
>  	igt_fixture {
> @@ -107,28 +107,27 @@ igt_main
>  
>  		kmstest_set_vt_graphics_mode();
>  
> -		display = calloc(1, sizeof(*display));
> -		igt_display_require(display, fd);
> +		igt_display_require(&display, fd);
>  
>  		/* Make sure we have at least one output connected */
> -		igt_display_require_output(display);
> +		igt_display_require_output(&display);
>  	}
>  
>  	igt_subtest("display-off-read-all") {
> -		igt_display_all_off(display);
> +		igt_display_all_off(&display);
>  
>  		igt_dir_process_files_simple(debugfs);
>  	}
>  
>  	igt_subtest("display-on-read-all") {
>  		/* try to light all pipes */
> -		igt_display_all_on(display);
> +		igt_display_all_on(&display);
>  
>  		igt_dir_process_files_simple(debugfs);
>  	}
>  
>  	igt_fixture {
> -		igt_display_fini(display);
> +		igt_display_fini(&display);
>  		close(debugfs);
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.43.0
> 
