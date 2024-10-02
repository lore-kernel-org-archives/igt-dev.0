Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355EBCF6D28
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 15:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E607A10E0F4;
	Wed,  2 Oct 2024 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fib2UL8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2624E10E0F4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727881546; x=1759417546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nSbmVxaV+EdjU7lupN1986nY2FM+rZX5z0TNqdC5p8U=;
 b=Fib2UL8/qT9wZHa1mpXbABsC3wGgoY0khNqQxQ44XlkCScy6qd4l73p/
 C4OCGAIdvbTWmfn4SvT1IB+PvaJvtlpakZhm/oKOHg/l9ZNv3ien31orE
 ar9wzf3m9htZTUZcxsVIyYwUbAH6S3bDX8hOBPvIfWZSPW6Ony/G69HxQ
 5QQvdijA3SvKzGC2mx48O1dSmLEX+IqiXykYgTaavHzOUFxP79cGVkSjl
 aXR8UyQCJH0WMBJOmIH23afmRadUsOrdILBWN3UobBHIJEEQI9tRhdo7J
 WtWkuri7bC7vmEBUA+ojJkz0hVDhD86zdJ/d8cjmBvFVM5XWjf7lf48Ww g==;
X-CSE-ConnectionGUID: q4TlOJgGRKuSoIMKGAuY/g==
X-CSE-MsgGUID: 5871KxKiSTO/7KGFzpA6eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27001726"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27001726"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:05:46 -0700
X-CSE-ConnectionGUID: hfiDRAS/RJiXHw9nv1w6vw==
X-CSE-MsgGUID: hga0XEzySDmvbaouYRGPPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74147540"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:05:44 -0700
Date: Wed, 2 Oct 2024 17:05:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t] tests: Update assertion in invalid-wait-zero-handles
Message-ID: <20241002150542.s4jgreiuk2lgajrr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241002113418.24070-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002113418.24070-2-krzysztof.niemiec@intel.com>
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
On 2024-10-02 at 13:34:19 +0200, Krzysztof Niemiec wrote:

write test nema in subject, so instead of

tests: Update assertion in invalid-wait-zero-handles

better:

tests/syncobj_timeline: Update assertion in invalid-wait-zero-handles

> The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1],
> but the invalid-wait-zero-handles test has not been updated to mirror
> this change. Fix the assert to check against 0 instead of -EINVAL.
> 
> [1] https://patchwork.freedesktop.org/patch/554042/
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/syncobj_timeline.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 96d5d8b45..8e94380de 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -558,13 +558,12 @@ test_wait_bad_flags(int fd)
>  }
>  
>  static const char *test_wait_zero_handles_desc =
> -	"Verifies that waiting on an empty list of invalid syncobj handles is"
> -	" rejected";
> +	"Verifies that waiting on an empty list of syncobj handles returns 0";

s/returns 0/is accepted/

From this it looks like it is no longer "invalid-" tests?
So why not changing also test name or moving this to other subtest?

Maybe also change test name and description:

 * SUBTEST: invalid-query-zero-handles
 * Description: Verifies that querying an empty list of syncobj handles is rejected

dropping "invalid-" looks ok:

 * SUBTEST: query-zero-handles
 * Description: Verifies that querying an empty list of syncobj handles is accepted


Regards,
Kamil

>  static void
>  test_wait_zero_handles(int fd)
>  {
>  	struct drm_syncobj_timeline_wait wait = {};
> -	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), -EINVAL);
> +	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), 0);
>  }
>  
>  static const char *test_wait_illegal_handle_desc =
> -- 
> 2.45.2
> 
