Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A1C531CB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 13:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423B10EDFC;
	Wed, 22 Jul 2026 13:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8MOnlaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1910EDE3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784727966; x=1816263966;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E3v9UJuffcp2xtPpF2H+wtaCxpDvbcVRBcJMz/fp1N0=;
 b=c8MOnlaKKI4qe0sRxfWul4DP1Bi5ll4a2QqTF8PT0dvz9acDaRs66aak
 S2UJiSj58p017pyRDD44HUmoMhobi+fKmL2fiPJMStAEVxInmnrX9j+Vd
 MW1sgrfHyqD8m1vpKit6tQQ9GQjVIrn/4GUJ7kvVZCoCq/RbC+5piUXJq
 JDXVnAoav1INA4853ZRcKQ5Jy05vjCootlXZWs9HUCnPpjegt79ybrjxE
 l4yln6ewQTBTdhRNbAjM83UfuvJ3Stj+jA0A9u+SveTOtcUDKeyzOlnc5
 RgG+FNdUokoOvy94ofxrh2LpRo/9hATaksDy6/i87bXrsorjhgg0AsJbE Q==;
X-CSE-ConnectionGUID: PZCExz+aT7SOOOYyQa+SZA==
X-CSE-MsgGUID: 943Pn4BrSsar6jRKouTT/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84487669"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="84487669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 06:46:06 -0700
X-CSE-ConnectionGUID: w0Xf1OFjSAGzmiDnaED2JQ==
X-CSE-MsgGUID: gFxjmE7nRg2cuMXBZ+aDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261646506"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 06:46:05 -0700
Date: Wed, 22 Jul 2026 15:46:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH i-g-t v3 02/10] tests/imagination: Add GEM mmap tests
Message-ID: <20260722134601.zoiexbfav3fw25vw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-2-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-2-ce69f9ad330c@imgtec.com>
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
On 2026-07-17 at 16:21:34 +0200, Robert Mazur wrote:
> From: Matt Coster <matt.coster@imgtec.com>
> 
> Add subtests for mmap operations on GEM buffer objects.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

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
