Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF39AD49212
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 13:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC49F10E4D3;
	Mon, 18 Nov 2024 13:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBApz6cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCF610E4D3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731935084; x=1763471084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=swID5vLU7GTRCNVUowWdimPGXQtXvA3HSsswvNOVWpg=;
 b=oBApz6cQaCjPh3fisk2+pcg3dyHHr/C3Zmmhqa43gVcO7JRNgqpJOh+R
 FOJNRzO7EA4vAOkpHK8nNwa8sffpnso7bvKZSMdhcLueOme3DJwUzOHt6
 lh64ONh5PnLFKXVVYSR70xPl0mmZkBu816LcVudahQlAcSuQAQhOjc3Ic
 iwzwyyVT8C16kowMdGTsore3r7wV8lujM4KLmCNGkau+NOk5nQwG7OMSk
 0CgkCZ1Gyxqv+6SAGtQIFmyxIjLDdxONcoBHsOegS9DSVwyB6z5K6fn96
 Lw6lge0GG3qNHlq1EAxI1DuW9oOuQSERz8mtbDrbhilQoHGRHcAZQ5FS0 Q==;
X-CSE-ConnectionGUID: UcCwoBYlRhCqWhdmawo02A==
X-CSE-MsgGUID: /rRuzk5aQfOJp7sVcI730g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35663178"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="35663178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:04:44 -0800
X-CSE-ConnectionGUID: ITo4AqM/Rqej9u7WA03lGQ==
X-CSE-MsgGUID: Wd33lvd+Q/O3baA9MQ6sEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94033389"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 05:04:43 -0800
Date: Mon, 18 Nov 2024 14:04:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/syncobj_wait: Update
 invalid-wait-zero-handles test
Message-ID: <20241118130441.tiemnqs6hmzr53vm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
 <20241118124422.11868-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118124422.11868-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2024-11-18 at 13:44:21 +0100, Krzysztof Niemiec wrote:
> The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1]
> to accept empty lists of syncobj handles, but the
> invalid-wait-zero-handles test has not been updated to mirror this
> change. Fix the assert to check against 0 instead of -EINVAL, and rename
> the test to wait-zero-handles as this is no longer an invalid scenario.
> 
> This change mirrors [2] for the syncobj_wait test.
> 
> [1] https://patchwork.freedesktop.org/patch/554042/
> [2] https://patchwork.freedesktop.org/patch/618483/
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/syncobj_wait.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index be7e67163..e5f251205 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -80,8 +80,6 @@
>   *
>   * SUBTEST: invalid-wait-illegal-handle
>   *
> - * SUBTEST: invalid-wait-zero-handles
> - *
>   * SUBTEST: multi-wait-all-for-submit-signaled
>   *
>   * SUBTEST: multi-wait-all-for-submit-submitted
> @@ -177,6 +175,8 @@
>   * SUBTEST: wait-for-submit-delayed-submit
>   *
>   * SUBTEST: wait-for-submit-snapshot
> + *
> + * SUBTEST: wait-zero-handles
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
> @@ -297,7 +297,7 @@ static void
>  test_wait_zero_handles(int fd)
>  {
>  	struct drm_syncobj_wait wait = { 0 };
> -	igt_assert_eq(__syncobj_wait(fd, &wait), -EINVAL);
> +	igt_assert_eq(__syncobj_wait(fd, &wait), 0);
>  }
>  
>  static void
> @@ -918,7 +918,7 @@ igt_main
>  	igt_subtest("invalid-wait-bad-flags")
>  		test_wait_bad_flags(fd);
>  
> -	igt_subtest("invalid-wait-zero-handles")
> +	igt_subtest("wait-zero-handles")
>  		test_wait_zero_handles(fd);
>  
>  	igt_subtest("invalid-wait-illegal-handle")
> -- 
> 2.45.2
> 
