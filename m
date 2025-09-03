Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08442CA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 16:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F110E8FF;
	Wed,  3 Sep 2025 16:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7G06LSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E2510E8FF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756918107; x=1788454107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oVsGYXRHEz1bqeyjsf5fqgpEMU9NfOQqUAQPx9CRP14=;
 b=O7G06LSZEAzB0WqJ5YkpEM6W4djps5i2HRV6W7aulW0rTQ4dTNwlZwMn
 LmDUe5F5Ca9mILPEaQ07FAykLFMNI9nxHfijloLV+GqdnufR3DmVbl+Jr
 ooFvYw48JhWoVU4gTFRVAAZREl5ZGtY125tWIyXpL4VtPihr+tov5aJDh
 bZHTiY9A/ci9ClmD7EoyWVR6GUmp+hDZ5sqdZvtVgfhKpQYXDRJHz0u51
 AbXjAQ8/D/FcVm1SKMwI17rLplG6yxuYhWpdPkNWH6n2Js4gjS7FW4zds
 vLPo646/RwjBVe/eKYTjfWV3okYNFSHUy+69zgu5XfNqXYBQ2+JwCS+w2 g==;
X-CSE-ConnectionGUID: SVnnGRI9R/y5mi6XFEhAvQ==
X-CSE-MsgGUID: Ixzy+r8ORQWQnQGV2jk+Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76686097"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76686097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:48:26 -0700
X-CSE-ConnectionGUID: nbXn7vbQSKqlun5WX5dZjw==
X-CSE-MsgGUID: gtIJBKWbSjq7i2kjXpq4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176002909"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 09:48:24 -0700
Date: Wed, 3 Sep 2025 18:48:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH V10 08/30] lib/drmtest: Add is_vkms_device()
Message-ID: <20250903164821.dvdtwfpyxtc6b3yn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com,
 Karthik B S <karthik.b.s@intel.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-9-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815040659.3321102-9-alex.hung@amd.com>
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

Hi Alex,
On 2025-08-14 at 22:06:37 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Add a function to check vkms device.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/drmtest.c | 5 +++++
>  lib/drmtest.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 436b6de78..a3904083f 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -118,6 +118,11 @@ static bool __is_device(int fd, const char *expect)
>  	return strcmp(expect, name) == 0;
>  }
>  
> +bool is_vkms_device(int fd)
> +{
> +	return __is_device(fd, "vkms");

Do you need this change in your series?
There is a separate VKMS series almost ready to merge,
so imho you could drop this patch.

See https://patchwork.freedesktop.org/series/145065/

+cc Karthik

Regards,
Kamil

> +}
> +
>  bool is_amdgpu_device(int fd)
>  {
>  	return __is_device(fd, "amdgpu");
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 27e5a18e2..b3d53f252 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -136,6 +136,7 @@ void igt_require_nouveau(int fd);
>  void igt_require_vc4(int fd);
>  void igt_require_xe(int fd);
>  
> +bool is_vkms_device(int fd);
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
>  bool is_mtk_device(int fd);
> -- 
> 2.43.0
> 
