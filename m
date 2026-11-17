Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F8606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpkGjUrI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4847C10E445;
	Tue, 17 Nov 2026 12:00:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAFF10E445
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794916756; x=1826452756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0+hDWBDZEHGpUifwx42507jN7uSUp39Gr/SrK4gmND8=;
 b=YpkGjUrIguGwxCsdnrQZvTDamZxuSuFr3Wlk2lVzuxkfP237Zd+DEbIv
 kwSUN4gQl1m9VZ2rXxZb1osx+DkbNgRMn8i8OeOPiKR83KpPY61suTfn9
 Y0PquatZa5cxDhrFcHHDKRsJQa7H13DTSXm4vT97mwjpMZ6ZT1lxwSFcx
 FzU7vbHNTcw6hDiRE6gnM5onxp1k+1zge04rl+jr3I6PUIy+iS7XH5qgU
 F2wIhQS8zCnSQ8rcpoKQ4LkLDnPjxDchWKt4OsL7nWEH6yL3rYCA1mBz1
 etM1Q/FuIZdVVNVVleipbElfMSvPFnoBj0qgvXmAbUP2TLw1gJd4ty8EK A==;
X-CSE-ConnectionGUID: ccPqNT0zSDCN4kfZk/R1eg==
X-CSE-MsgGUID: r/qOA6vdS+i4Ca96lOch3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3701075"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3701075"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 03:59:15 -0800
X-CSE-ConnectionGUID: BtZeK5hgRb6wLW/Wb/eXjA==
X-CSE-MsgGUID: tNmPyMVOSd6rcWZ4KuFq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10078239"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 03:59:13 -0800
Date: Tue, 17 Nov 2026 12:58:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Avandhica S R <avandhica.s.r@intel.com>
Cc: igt-dev@lists.freedesktop.org, sowmiya.s@intel.com
Subject: Re: [PATCH i-g-t v1 1/1] Extended multiple planes with multiple
 pixel formats
Message-ID: <vawzyf3xdqzdfkzbguhgq5o4aarxnqb33yajw4uoogqxhhyop7@eqlhpfkrlkyo>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Avandhica S R <avandhica.s.r@intel.com>, igt-dev@lists.freedesktop.org,
 sowmiya.s@intel.com
References: <20261116035131.452844-1-avandhica.s.r@intel.com>
 <20261116035131.452844-2-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116035131.452844-2-avandhica.s.r@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Avandhica,
On 2026-11-16 at 09:21:31 +0530, Avandhica S R wrote:
> Extend kms_plane_multiple to additionally exercise a range of pixel
> formats (DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB16161616F,
> DRM_FORMAT_YUYV, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB8888) on top
> of the existing modifier-based subtests, for both the single-display
> and 2-display test variants, to improve coverage of multi-plane
> atomic commits across different pixel formats.
> 
> Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
> ---
>  tests/kms_plane_multiple.c | 329 ++++++++++++++++++++++---------------
>  1 file changed, 194 insertions(+), 135 deletions(-)

Please add a prefix in subject with test name, for example:

[PATCH i-g-t v1 1/1] tests/kms_plane_multiple: Add multiple pixel formats

Similarly, for fixes use

[PATCH i-g-t v1 1/1] tests/kms_plane_multiple: Fix ...

where you replace ... with actual description of a fix.


Regards,
Kamil

> 
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 0d338eeb5..6d31c912a 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -39,34 +39,48 @@
>  #include <time.h>
>  
>  /**
> - * SUBTEST: tiling-none
> - * Description: Check that the kernel handles atomic updates of multiple planes
> - *              correctly by changing their geometry and making sure the changes
> - *              are reflected immediately after each commit.
> - *
> - * SUBTEST: tiling-%s
> + * SUBTEST: pixel-format-%s-and-modifier-format-%s
>   * Description: Check that the kernel handles atomic updates of multiple planes
>   *              correctly by changing their geometry and making sure the changes
>   *              are reflected immediately after each commit.
>   *
[cut]
