Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E25BCF0449
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 10:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A30610E11E;
	Wed,  9 Oct 2024 10:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQ/OkEFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B946410E11E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470053; x=1760006053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=95Ac+fruFyG8GM/P1zSZzo/mmDtjOBVfWZmHVpIiSkY=;
 b=SQ/OkEFFCxZHOz0sSABbDmYT3sZblYml+rWtMEUs7YhcKOL/m9sON44w
 hfUDPB/cg9nQzmBZfNNTbz5xZMYfQK+DdU7uNcJjeyR3J7OW+bVBRNWV+
 T77G710yEziaDZcij6zkVtRbopPzdwjrJX8RskwtnGV1Ed2v6QSxSEc3b
 tOAnOhd25cJRsiMaUW1SBuDlL6r7qI6mejaStAPe7QppCf6DHr6CRzFL4
 J3rHjQSN7m9Kq9sNpP++oRMBNWcIm9QrnAA8798T6+CWX4vm1p3AxA2PZ
 /UV2hqBEqX/JQtroPX030qCzhoj2T5RNuDWaFKiYgasvAX+55xPzv7ZE+ g==;
X-CSE-ConnectionGUID: qlU9PE1xSOmn3aKpzVjPwA==
X-CSE-MsgGUID: OJAhzTUcQb6vgyE2cF972Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27920436"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27920436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:34:13 -0700
X-CSE-ConnectionGUID: io6Jq8GhQCKpOHKVA4df8w==
X-CSE-MsgGUID: m/WO0pnlTSmvU99MVVX29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76098764"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 03:34:13 -0700
Date: Wed, 9 Oct 2024 12:33:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/syncobj_timeline: Update
 invalid-wait-zero-handles test
Message-ID: <20241009103358.imoek5j3reqonujn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241007102611.23544-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007102611.23544-2-krzysztof.niemiec@intel.com>
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
On 2024-10-07 at 12:26:12 +0200, Krzysztof Niemiec wrote:
> The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1]
> to accept empty lists of syncobj handles, but the
> invalid-wait-zero-handles test has not been updated to mirror this
> change. Fix the assert to check against 0 instead of -EINVAL.
> 
> v2: Change the test name to wait-zero-handles (drop the invalid- prefix)
>     and correctly update the test description.
> 
> [1] https://patchwork.freedesktop.org/patch/554042/
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/syncobj_timeline.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 96d5d8b45..a77896ec1 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -242,9 +242,6 @@
>   * SUBTEST: invalid-wait-illegal-handle
>   * Description: Verifies that waiting on an invalid syncobj handle is rejected
>   *
> - * SUBTEST: invalid-wait-zero-handles
> - * Description: Verifies that waiting on an empty list of invalid syncobj handles is rejected
> - *
>   * SUBTEST: multi-wait-all-available-signaled
>   * Description: Verifies waiting on a list of timeline syncobjs
>   *
> @@ -427,6 +424,9 @@
>   *
>   * SUBTEST: wait-for-submit-snapshot
>   * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
> + *
> + * SUBTEST: wait-zero-handles
> + * Description: Verifies that waiting on an empty list of syncobj handles is accepted
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
> @@ -558,13 +558,12 @@ test_wait_bad_flags(int fd)
>  }
>  
>  static const char *test_wait_zero_handles_desc =
> -	"Verifies that waiting on an empty list of invalid syncobj handles is"
> -	" rejected";
> +	"Verifies that waiting on an empty list of syncobj handles is accepted";
>  static void
>  test_wait_zero_handles(int fd)
>  {
>  	struct drm_syncobj_timeline_wait wait = {};
> -	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), -EINVAL);
> +	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), 0);
>  }
>  
>  static const char *test_wait_illegal_handle_desc =
> @@ -1711,7 +1710,7 @@ igt_main
>  		test_wait_bad_flags(fd);
>  
>  	igt_describe(test_wait_zero_handles_desc);
> -	igt_subtest("invalid-wait-zero-handles")
> +	igt_subtest("wait-zero-handles")
>  		test_wait_zero_handles(fd);
>  
>  	igt_describe(test_wait_illegal_handle_desc);
> -- 
> 2.45.2
> 
