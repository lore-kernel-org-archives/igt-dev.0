Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFFD711DD
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 18:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F6110E2D8;
	Wed, 20 Nov 2024 18:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhslddQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842B10E115
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732128419; x=1763664419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5PjuBiVF9lSY+WkwiuBSdL8Enr+TmtnlAnWwtnqpk9Y=;
 b=nhslddQug4fX/cnKK0QY7EmEF8aNKh86edPFtMDrhfOIGeDqWzS0oDyK
 ZCO1FFr5NZL4MUECioU8epoy8Sw3WDeeraJzdhuiS0/S17Olyw07XMi5t
 fccSOysYT4kYgjww5VvYAW5Gr22VOPO4i7fDKnCRQSp0cxXZnGF1VL7Om
 DUz6L9hG7C0p/2Unu8A9XZcmEewfnX4tVg8ZKLGwPLntPNK7GWdeVXN6L
 4TwH0AVMd/op4OG1BigppQILlCSSmWmd82VGcf1tR8+rs5Zy2iZWKkgTi
 C0HnKQV7u9+jXQvcfulreWpXlClyCehHVbzebaaS608D7C1zcRrgdTCU3 A==;
X-CSE-ConnectionGUID: k1XvcuK2QLKmIhpxgBam+g==
X-CSE-MsgGUID: nMtPohftSL6pvXjrOS0nJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43607222"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="43607222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:46:58 -0800
X-CSE-ConnectionGUID: JLZXaUy4RBKGuL9CD5EILg==
X-CSE-MsgGUID: iNRjCRq2QwmDztlOKBk0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90409041"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 10:46:57 -0800
Date: Wed, 20 Nov 2024 19:46:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/syncobj_wait: Update
 invalid-wait-zero-handles test
Message-ID: <20241120184642.y3bchi4wvwoulzjs@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
 <20241120103507.7653-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120103507.7653-3-krzysztof.niemiec@intel.com>
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
On 2024-11-20 at 11:35:07 +0100, Krzysztof Niemiec wrote:
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

Again you dropped my r-b here, it still holds so
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
