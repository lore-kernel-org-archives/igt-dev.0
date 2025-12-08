Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A94FD3B7F2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 14:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00210E139;
	Mon,  8 Dec 2025 14:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzWtXnNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ACA10E3BD
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765203648; x=1796739648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yf0biPvycvbpYMnYlHu+mp4lJay4dN4OPs7+rvz/9ho=;
 b=MzWtXnNXoYhqMLzFyWw9pPBgMOSUuQ1LcF390jPqaOtzg0cJBQih6xDm
 0lqU1ffKNDWIEWDEn/53HknrUekwVLrsASdSVDV1XliNoklQvfGWk6rKq
 7dtBn4zapSnxCCMfXMt3Xm3QksiAGYyVHiDz8VpWPxYE5jsCb5IJOMAKc
 Q+OuAFB+S1L4/yI5cGRLhgV/JpfJ/Ljr/h42cKtkIkMhxgyUqPtNeLe5X
 av7wXhDccDCOa3TvMg4Qsn26zpEZeKfFBriWA4JFbay+ZDKczOzoMYYb2
 1gOn3DZx8t9D5FnUk1DXA8K/6uwBzAi2RS5BPGqVMIsiuZGJW8eXV3LeP g==;
X-CSE-ConnectionGUID: yx8hV7QsT2iNmMGZblX/UQ==
X-CSE-MsgGUID: ueSPxa2dTY2E0WPJHcig6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67106373"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67106373"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 06:20:48 -0800
X-CSE-ConnectionGUID: si1z6gGqTvaJoAgfGypixQ==
X-CSE-MsgGUID: 3sYLpjZtTW6eTtGIDj+8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195960470"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:20:45 -0800
Date: Mon, 8 Dec 2025 15:20:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Message-ID: <20251208142040.62hhdrowuapckz65@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
References: <20251205154417.3963533-1-soham.purkait@intel.com>
 <20251205154417.3963533-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205154417.3963533-3-soham.purkait@intel.com>
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

Hi Soham,
On 2025-12-05 at 21:14:16 +0530, Soham Purkait wrote:
> Make function xe_spin_sync_wait() public
> Which waits for the spin batch associated with the
> given igt_spin object to complete by waiting
> on its syncobj after spin end is executed.
> 
> v1:
>  - Add simple commit message. (Kamil)
> v2:
>  - Add fd description for xe_spin_sync_wait. (Kamil)
>  - Add improved documentation for xe_spin_sync_wait. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_spin.c | 14 +++++++++++++-
>  lib/xe/xe_spin.h |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index f3866cca1..e307c9fe5 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -303,7 +303,19 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  	return spin;
>  }
>  
> -static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +/**
> + * xe_spin_sync_wait - Wait for a GPU spin workload to complete
> + * @fd: File descriptor for the DRM device
> + * @spin: Pointer to an igt_spin structure representing the spin workload
> + *
> + * This function blocks until the GPU spin operation associated with the
> + * given `igt_spin` object has finished, ensuring that the function does
> + * not return until the workload completes.
> + * If the wait fails, `igt_assert()` will trigger an assertion failure.
> + *
> + * This function does not return a value. It aborts on failure.
> + */
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>  {
>  	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
>  }
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index af32ab563..1cd578e2d 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  
>  /*
>   * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
> -- 
> 2.34.1
> 
