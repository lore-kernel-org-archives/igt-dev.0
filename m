Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B8C53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBF410E6A7;
	Mon, 27 Jul 2026 18:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGbWhNg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C2F10E6A4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785176159; x=1816712159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gypahg4Pc8vBSr5rN1Fe70RFwVqmtz6M+MewiLZ8aJg=;
 b=oGbWhNg/FfzuRhnoNaZtwLZFs2XRfDbfrHz/eut18lKCpLxl9gcrO465
 BWiPghbLnFgpSXkJzZo6qmkyK0KMRQTiAqIdocVNdReiPIwYofrwnnK4L
 K3XmwAmmyBAb0d9g1YtW7RzccXa5wuUjYNTfHAZK2XksvHasvXwUax6gv
 Pwody9S4/3T9CuzR8dQXfnv1cTrbXkDRyWf9on1SpK0ra+XY0i1SVhp7O
 3fK5bXkPAcTsn90FJK1jwN8D5ZLzkS4R7mPLuNLyFKYTPywkJswSI7uxM
 C6CMicEwVmCkPQwErqKaSzFaF5GAwps/tkUZm9CyhN7cyiUoJGHzq0zhl g==;
X-CSE-ConnectionGUID: CCxz9h30Sw2nq3g1rreejg==
X-CSE-MsgGUID: V4s6VvXrRB2S9l5iFhnrVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96905471"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="96905471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:15:58 -0700
X-CSE-ConnectionGUID: i9MfYru2QsCzZnKLmKo7Gw==
X-CSE-MsgGUID: yvbWdiiOSz2X9PWx6FIKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="264465631"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:15:57 -0700
Date: Mon, 27 Jul 2026 20:15:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH i-g-t v4 02/10] tests/imagination: Add GEM mmap tests
Message-ID: <20260727181540.jdmsqlfzyyssjstc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
References: <20260727-test-imagination-add-support-v4-0-a3dbe0382437@imgtec.com>
 <20260727-test-imagination-add-support-v4-2-a3dbe0382437@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-test-imagination-add-support-v4-2-a3dbe0382437@imgtec.com>
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

Hi Robert,
On 2026-07-27 at 14:00:31 +0200, Robert Mazur wrote:
> From: Matt Coster <matt.coster@imgtec.com>
> 
> Add subtests for mmap operations on GEM buffer objects.
> 

There was a problem with fdo mailsever and not all patches got
to patchwork, please resend a complete series with RESEND after
PATCH word (or send it again with v5, your choice).

Regards,
Kamil


> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/imagination/pvr_gem.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/tests/imagination/pvr_gem.c b/tests/imagination/pvr_gem.c
> index 273f4d56f..74bfd4eee 100644
> --- a/tests/imagination/pvr_gem.c
> +++ b/tests/imagination/pvr_gem.c
> @@ -59,6 +59,50 @@ int igt_main()
>  		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
>  	}
>  
> +	igt_describe("Test valid buffer object mapping");
> +	igt_subtest("mmap-bo-4096")
> +	{
> +		size_t size = 4096;
> +		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
> +
> +		off_t offset = igt_pvr_ioctl_get_bo_mmap_offset(fd, handle);
> +
> +		char *mapped = mmap(NULL, size, PROT_WRITE, MAP_SHARED,
> +				    fd, offset);
> +		igt_assert(mapped != MAP_FAILED);
> +
> +		/* Test writing to beginning and end of mapped range. */
> +		mapped[0] = 0xff;
> +		mapped[size - 1] = 0xff;
> +
> +		munmap(mapped, size);
> +		gem_close(fd, handle);
> +	}
> +
> +	igt_describe("Test buffer object mapping with bad handle");
> +	igt_subtest("mmap-bo-bad-handle")
> +	{
> +		struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
> +			.handle = 0xbad6bad6,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg, ENOENT);
> +	}
> +
> +	igt_describe("Test buffer object mapping with bad padding");
> +	igt_subtest("mmap-bo-bad-padding")
> +	{
> +		size_t size = 4096;
> +		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
> +
> +		struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
> +			.handle = handle,
> +			._padding_4 = 0xbad6bad6,
> +		};
> +
> +		do_ioctl_err(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg, EINVAL);
> +	}
> +
>  	igt_fixture()
>  	{
>  		drm_close_driver(fd);
> 
> -- 
> 2.43.0
> 
