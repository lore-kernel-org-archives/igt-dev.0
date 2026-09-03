Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77EAC624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 11:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B99C10F531;
	Thu,  3 Sep 2026 11:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RanPFd69";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BB010F537
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788435583; x=1819971583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DwzE4HlL8M7ozWqrfLBAHDp1p5jQhpjmvGzK+RAWKqQ=;
 b=RanPFd69Z61NdrTb+aZSm5fxF07EkAKHi32BaO3biflHEHauQtU7p2L0
 s9GX43Iy4FH+fAD052yiS1toPGs/FWBVsn3bTeWECP2l8YX6M18RA1/c6
 Pfkssc0xhjOpmzRG3uwRWdfegRBA8sisQ/tmzkpZEoNo34bw3wC2FHUEa
 PxtlAj5AwcEuibzC1FxPbJ4BfT+QCDR1NwpY9C62mBLJE6gsqnQElKV98
 OfmI3gj8HOxQ/u/fJ0UgZEkvaZWbaHrUWqH9+7NVsrfZECjqu97poT9Kp
 UsQw61+JmTXA1jyMIUHyYCgzDygG/VPDoy6RLbIrxTX70PVVgWZAOzjEq Q==;
X-CSE-ConnectionGUID: gBURNdiaQe2mEN2bqwhipQ==
X-CSE-MsgGUID: /2+rFEdoQuS/treSP4GR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92615953"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="92615953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 04:39:42 -0700
X-CSE-ConnectionGUID: 91k3EcRWQ8idWiCHCXbmrw==
X-CSE-MsgGUID: 2UMjM6AYTlqa/9IbKbcewg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="267935406"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:39:41 -0700
Date: Thu, 3 Sep 2026 13:39:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 4/4] lib/kms: use enum hardware_pipe for
 __intel_get_pipe_from_crtc_index() return type
Message-ID: <20260903113939.lsf2m7gz2hlemfym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1788252273.git.jani.nikula@intel.com>
 <ef16ae698d5d21f31b7d15f3c9cddb476726834a.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef16ae698d5d21f31b7d15f3c9cddb476726834a.1788252273.git.jani.nikula@intel.com>
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

Hi Jani,
On 2026-09-01 at 11:46:40 +0300, Jani Nikula wrote:
> The __intel_get_pipe_from_crtc_index() returns a hardware pipe, so make
> it obvious in the function signature.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_kms.c | 12 +++++++-----
>  lib/igt_kms.h |  2 +-
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f32f655d5fae..e622d7bcd2c3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1313,10 +1313,11 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>   * The hardware pipe may be different from the CRTC index. Figure out the CRTC
>   * index to pipe mapping from the debugfs.
>   */
> -int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
> +enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
>  {
> +	enum hardware_pipe hardware_pipe;
>  	char buf[2];
> -	int debugfs_fd, pipe, res = 0;
> +	int debugfs_fd, res = 0;
>  	char pipe_char;
>  
>  	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index);
> @@ -1330,11 +1331,12 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
>  
>  	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
>  
> -	pipe = pipe_char - 'A';
> +	hardware_pipe = pipe_char - 'A';
>  
> -	igt_assert_f(pipe >= 0 && pipe < IGT_MAX_PIPES, "i915_pipe %c out of range\n", pipe_char);
> +	igt_assert_f(hardware_pipe >= 0 && hardware_pipe < IGT_MAX_PIPES,
> +		     "i915_pipe %c out of range\n", pipe_char);
>  
> -	return pipe;
> +	return hardware_pipe;
>  }
>  
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b7653b8ad49a..86bef14af240 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -155,7 +155,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode);
>  #define HDISPLAY_6K_PER_PIPE 6144
>  #define HDISPLAY_5K_PER_PIPE 5120
>  
> -int __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
> +enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
>  int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
>  void kmstest_set_vt_graphics_mode(void);
>  void kmstest_restore_vt_mode(void);
> -- 
> 2.47.3
> 
