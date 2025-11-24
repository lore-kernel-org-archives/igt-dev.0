Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25124CFD348
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 19:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2A010E251;
	Mon, 24 Nov 2025 19:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmCg32Fl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA510E251
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764011749; x=1795547749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P/ZykVisxLG77QLMfywm0l4PnJzWQ2KjSgeyKH4XMkg=;
 b=LmCg32Flc4jMThhmAr6n4utaJ4LwkxktWDumLbv6HAfUj8CGz87Z/43F
 kcY3jzxTSjqT5sLJTXiy7l7RFjN5KeDMANZsr6aD+ot6kjh93q570Yqni
 s541L7gVt3ImJvJ8cAMra6do7SjWqhrrii5d9DJkG8QQa++2VVey3QGGC
 H5NryHcdOZD+A8TFMlW252aBi9Sn5B+PI2DZ/kbGkZUd82GX4ptYHsvle
 jGE1ZjJ687qtfDnH7l2EGYNGnfEJtdAHuCK3IZ0Q7IMppmxc1plOwf4jV
 Ut9qddgtTApvNf/7YdPUzBetCFe/RsCPoCeOioKav3TRg/+mgdCJ9Bhv2 A==;
X-CSE-ConnectionGUID: zkrBHeYMSxeE7S3GJLHzZQ==
X-CSE-MsgGUID: wEguks40SBCFReOiXnOxmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91506534"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="91506534"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:15:48 -0800
X-CSE-ConnectionGUID: EL90s3GuTw2XcEfRYM9VpA==
X-CSE-MsgGUID: 1CVegSjTSRO/ddEFYhdvQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192070202"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO localhost)
 ([10.124.222.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:15:48 -0800
Date: Mon, 24 Nov 2025 21:15:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/35] lib/igt_pipe_crc: separate CRTC index from
 pipe
Message-ID: <aSSu4eSzuKMa4R2q@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
 <20251123152412.599801-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251123152412.599801-2-kunal1.joshi@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Sun, Nov 23, 2025 at 08:53:38PM +0530, Kunal Joshi wrote:
> The pipe CRC helpers have historically treated the logical pipe enum as if it
> were the CRTC index, and used that directly in the debugfs paths under
> crtc-<index>/crc/. This only works as long as crtc_index == pipe, which is no
> longer guaranteed once pipes are virtualized, fused off, or reordered.
> 
> Introduce an explicit CRTC index in igt_pipe_crc and wire it through the
> debugfs control/data paths. Add new constructors that take either a raw CRTC
> index or an igt_display+pipe pair, and update kms_pipe_crc_basic to use the
> display-aware helper so it always uses display->pipes[pipe].crtc_offset.
> 
> Keep the existing igt_pipe_crc_new(fd, pipe, ...) API as a thin wrapper that
> still assumes crtc_index == pipe for now so existing callers continue to work.
> This is a first incremental step towards fully decoupling CRTC indices from
> hardware pipes across the KMS tests.
> ---
>  lib/igt_pipe_crc.c         | 39 +++++++++++++++++++++++++++++++++++---
>  lib/igt_pipe_crc.h         |  6 ++++++
>  tests/kms_pipe_crc_basic.c | 12 ++++++------
>  3 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
> index 866bf2881..24aa72bcc 100644
> --- a/lib/igt_pipe_crc.c
> +++ b/lib/igt_pipe_crc.c
> @@ -190,6 +190,8 @@ struct _igt_pipe_crc {
>  	int flags;
>  
>  	enum pipe pipe;

This whole pipe thing needs to go away.

> +	/* CRTC index in drmModeRes.crtcs used for debugfs paths. */
> +	unsigned int crtc_index;
>  	char *source;
>  };
>  
> @@ -215,7 +217,8 @@ void igt_require_pipe_crc(int fd)
>  }
>  
>  static igt_pipe_crc_t *
> -pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
> +pipe_crc_new_internal(int fd, enum pipe pipe, unsigned int crtc_index,
> +		     const char *source, int flags)
>  {
>  	igt_pipe_crc_t *pipe_crc;
>  	char buf[128];
> @@ -235,7 +238,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>  	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
>  	igt_assert(pipe_crc);
>  
> -	sprintf(buf, "crtc-%d/crc/control", pipe);
> +	sprintf(buf, "crtc-%u/crc/control", crtc_index);
>  	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
>  	igt_assert(pipe_crc->ctl_fd != -1);
>  
> @@ -243,6 +246,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>  	pipe_crc->fd = fd;
>  	pipe_crc->dir = debugfs;
>  	pipe_crc->pipe = pipe;
> +	pipe_crc->crtc_index = crtc_index;
>  	pipe_crc->source = strdup(env_source);
>  	igt_assert(pipe_crc->source);
>  	pipe_crc->flags = flags;
> @@ -250,6 +254,15 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>  	return pipe_crc;
>  }
>  
> +static igt_pipe_crc_t *
> +pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
> +{
> +	/* Existing callers pass a logical pipe; assume crtc_index == pipe
> +	 * until they are converted to use the new helpers.
> +	 */
> +	return pipe_crc_new_internal(fd, pipe, pipe, source, flags);
> +}
> +
>  /**
>   * igt_pipe_crc_new:
>   * @fd: fd of the device
> @@ -288,6 +301,26 @@ igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
>  	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
>  }
>  
> +igt_pipe_crc_t *
> +igt_pipe_crc_new_for_crtc(int fd, unsigned int crtc_index,
> +			 const char *source)
> +{
> +	return pipe_crc_new_internal(fd, PIPE_A, crtc_index, source, O_RDONLY);
> +}
> +
> +igt_pipe_crc_t *
> +igt_pipe_crc_new_for_display(struct igt_display *display, enum pipe pipe,
> +			     const char *source)
> +{

I think it's better to just pass in the whole igt_pipe_t.
In fact I already wrote the cocci for that, but I need to
get a bunch of refactroing done in before it can be done.
I already posted two small refactoring series, but more
will be needed.

> +	igt_pipe_t *igt_pipe = &display->pipes[pipe];
> +
> +	igt_assert(igt_pipe->valid);
> +
> +	return pipe_crc_new_internal(display->drm_fd, pipe,
> +					igt_pipe->crtc_offset, source,
> +					O_RDONLY);
> +}
> +
>  /**
>   * igt_pipe_crc_free:
>   * @pipe_crc: pipe CRC object
> @@ -380,7 +413,7 @@ void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
>  
>  	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
>  
> -	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
> +	sprintf(buf, "crtc-%u/crc/data", pipe_crc->crtc_index);
>  
>  	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
>  	pipe_crc->crc_fd = openat(pipe_crc->dir, buf, pipe_crc->flags);
> diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h
> index 171f08230..142e39569 100644
> --- a/lib/igt_pipe_crc.h
> +++ b/lib/igt_pipe_crc.h
> @@ -51,6 +51,12 @@ igt_pipe_crc_t *
>  igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
>  igt_pipe_crc_t *
>  igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
> +igt_pipe_crc_t *
> +igt_pipe_crc_new_for_crtc(int fd, unsigned int crtc_index,
> +			 const char *source);
> +igt_pipe_crc_t *
> +igt_pipe_crc_new_for_display(struct igt_display *display, enum pipe pipe,
> +			     const char *source);
>  void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
>  void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
>  void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 9750d014c..135b82832 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -183,8 +183,8 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>  		} else {
>  			igt_pipe_crc_t *pipe_crc;
>  
> -			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> -						    IGT_PIPE_CRC_SOURCE_AUTO);
> +			pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
> +						IGT_PIPE_CRC_SOURCE_AUTO);
>  			igt_pipe_crc_start(pipe_crc);
>  
>  			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
> @@ -268,8 +268,8 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
>  	igt_plane_set_fb(primary, &fb0);
>  	igt_display_commit(display);
>  
> -	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> -				    IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
> +				IGT_PIPE_CRC_SOURCE_AUTO);
>  	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>  
>  	/* Flip FB1 with the primary plane & compare the CRC with ref CRC. */
> @@ -298,8 +298,8 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
>  	igt_crc_t crc[2];
>  	igt_plane_t *primary;
>  
> -	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> -				    IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe_crc = igt_pipe_crc_new_for_display(&data->display, pipe,
> +				IGT_PIPE_CRC_SOURCE_AUTO);
>  
>  	igt_display_reset(display);
>  	igt_output_set_pipe(output, pipe);
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
