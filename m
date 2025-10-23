Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C1FCCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 12:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECE010E0EA;
	Thu, 23 Oct 2025 12:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6BatkaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F0610E0EA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761224107; x=1792760107;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TSUjHFX4waExheUVU/v1dOOhHCWPNjL4FyTaM7Uv72U=;
 b=j6BatkaLFWPWlbT1chO8BCKfbKJhlO93dU4w1WJ4YTOQJOahJ/T1gtpd
 4bEPeeMAv7wZ6O/ZfU4XKDBEamiGZl45XFnaclmbbb1i5QZXqhG31P3TP
 QPbfrevBvuBISxz4/oJFkXGDjLEnLE96xfc5qafdHTtXLSIpyyQM6/ann
 //pV8ELKDT/+eM35Gy47ogtMLkl8J49nyVYdh4WW68zuQwlEq1LsjP9SS
 CyrARBIr/GPjArXf9FolP2Lsat1T/a5DuLxPV51dME7Ek1wNPGe3ngOgD
 I2GTKC3uIKmdQuKakPYTkMtQ/C6Jpv3jiey5Wh+UhZAaB/kDW3V2lkosU w==;
X-CSE-ConnectionGUID: 0TJkW4otTMGqbPYo4rVmRg==
X-CSE-MsgGUID: bvYoAJxzRnCOjSII7MlfAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63294918"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63294918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:55:07 -0700
X-CSE-ConnectionGUID: /WprrIIpSYypFzj/oontVA==
X-CSE-MsgGUID: y9WEfgpJQHaytFq4kesN9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="215077832"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 05:55:04 -0700
Date: Thu, 23 Oct 2025 14:54:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [i-g-t, v2, 1/2] tests/gem_ctx_freq: Fix frequency restoration
 in exit handler
Message-ID: <20251023125448.al23rxko5dfpbjj5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com
References: <20251023111258.2108907-4-sk.anirban@intel.com>
 <20251023111258.2108907-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023111258.2108907-5-sk.anirban@intel.com>
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

Hi Sk,
On 2025-10-23 at 16:43:00 +0530, Sk Anirban wrote:

small nit about subject, please use 'test/intel/' for Intel
only tests, so it will be:

[i-g-t, v2, 1/2] tests/intel/gem_ctx_freq: Fix frequency restoration in exit handler

Same goes for second patch.

One more nit, see below.

> The exit handler was failing to restore frequencies as it was being called
> after the driver was closed. Reopen the driver in the exit handler to
> ensure proper frequency restoration.
> 
> v2: Use global sysfs variable (Riana)
>     Fix buffer length issue
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15103
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/gem_ctx_freq.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index 29fdf89cb..fef2dda2c 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -197,11 +197,11 @@ static void sysfs_range(int dirfd, int gt)
>  #undef N_STEPS
>  }
>  
> -static void __restore_sysfs_freq(int dirfd)
> +static void __restore_sysfs_freq(int dirfd, int fd)
>  {
>  	char buf[256];
>  
> -	igt_pm_ignore_slpc_efficient_freq(i915, dirfd, false);
> +	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
>  
>  	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
>  		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
> @@ -214,10 +214,18 @@ static void __restore_sysfs_freq(int dirfd)
>  
>  static void restore_sysfs_freq(int sig)
>  {
> -	int dirfd, gt;
> +	int dirfd, gt, fd;
>  
> -	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
> -		__restore_sysfs_freq(dirfd);
> +	fd = drm_open_driver(DRIVER_INTEL);
> +	igt_require_gem(fd);

Why require gem here? It was checked in opening fixture,
no need for repeating it here.

> +	sysfs = igt_sysfs_open(fd);

Imho 'sysfs' should be local var here, so rename it into
sysfs_fd or some similar name.

> +	igt_assert(sysfs != -1);
> +
> +	for_each_sysfs_gt_dirfd(fd, dirfd, gt)
> +		__restore_sysfs_freq(dirfd, fd);
> +
> +	close(sysfs);

As you close it here.

Regards,
Kamil

> +	drm_close_driver(fd);
>  }
>  
>  static void __disable_boost(int dirfd)
> @@ -262,6 +270,8 @@ igt_main
>  				sysfs_range(dirfd, gt);
>  	}
>  
> -	igt_fixture
> +	igt_fixture {
> +		close(sysfs);
>  		drm_close_driver(i915);
> +	}
>  }
> -- 
> 2.43.0
> 
