Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA64D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 11:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54AB10E025;
	Tue, 20 Jan 2026 11:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5NIrPW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B58826D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768908120; x=1800444120;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KmfgtnRo9/cl7xY6s6EPZWkYqNXlP/PArMQkyQvc3b0=;
 b=h5NIrPW1EnxsUUddExjzEQ/ffEVL6m+J37KxALDs6QzWN+YfxyianxII
 lFybsQnjwf3oT+kXP/GGQsDkDR43ILaha4E1fIXRYrVV4tEPsE1SzkYUO
 stIRhRoTfY1rxjlH/9FbQ/rvM3lcwabF9WuY+ILpwY6SfllBb4BEGZswU
 im0OoWh1YV23KvVw7q35agZBKjIkpJ9rNcrC5j5YvzR1XWsfZblK2DB1D
 YkikNBZLtyxByFnaX+9LW6vAz05JEzQLihcxT+qtyAGYaO+3OFVBi3MLQ
 KMS3Gi4rwv7W7ilvhh4GNtUJWtKueF04pTbPicvJq9xGQOGtH0enEKzbi Q==;
X-CSE-ConnectionGUID: aJycadHkSDOHgYAJv7oMeQ==
X-CSE-MsgGUID: 5GnH2gUeQfG7S3D+4/9IQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69842155"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69842155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:21:59 -0800
X-CSE-ConnectionGUID: tJYiGKJMSte7VMVuLKOxLw==
X-CSE-MsgGUID: Bz+zCGeJRviEWO0GCQGBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205345895"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:21:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 3/3] lib/igt_kms: Remove kmstest_pipe_to_index()
In-Reply-To: <05cfd01a2489865efab4f54ab42379cec70ac26c.1768906414.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1768906414.git.jani.nikula@intel.com>
 <05cfd01a2489865efab4f54ab42379cec70ac26c.1768906414.git.jani.nikula@intel.com>
Date: Tue, 20 Jan 2026 13:21:54 +0200
Message-ID: <7c7ddf2f0396fe303e8b9380037c6b2458ee3a8d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 20 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> There's only a single user for kmstest_pipe_to_index(), and that should
> be the extent of it. There's no reason for other code than the i915_pipe
> debugfs parsing to convert from pipe name character to the enum
> pipe. And for that, the name of the function is misleading anyway.
>
> Inline the functionality in __intel_get_pipe_from_crtc_index(), using
> igt_assert_f() for invalid values instead of propagating -EINVAL which
> isn't even checked by the caller.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c       | 24 ++++++------------------
>  lib/igt_kms.h       |  1 -
>  tests/kms_setmode.c |  1 +
>  3 files changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f6769d31edcb..08b982f0f68f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1061,22 +1061,6 @@ const char *kmstest_pipe_name(enum pipe pipe)
>  	return str + (pipe * 2);
>  }
>  
> -/**
> - * kmstest_pipe_to_index:
> - * @pipe: display pipe in string format
> - *
> - * Returns: Index to corresponding pipe
> - */
> -int kmstest_pipe_to_index(char pipe)
> -{
> -	int r = pipe - 'A';
> -
> -	if (r < 0 || r >= IGT_MAX_PIPES)
> -		return -EINVAL;
> -
> -	return r;
> -}
> -
>  /**
>   * kmstest_plane_type_name:
>   * @plane_type: display plane type
> @@ -1318,7 +1302,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
>  static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
>  {
>  	char buf[2];
> -	int debugfs_fd, res = 0;
> +	int debugfs_fd, pipe, res = 0;
>  	char pipe_char;
>  
>  	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_index, O_RDONLY);
> @@ -1332,7 +1316,11 @@ static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
>  
>  	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
>  
> -	return kmstest_pipe_to_index(pipe_char);
> +	pipe = pipe_char - 'A';
> +
> +	igt_assert_f(pipe >= 0 && pipe < IGT_MAX_PIPES, "i915_pipe %c out of range\n", pipe_char);
> +
> +	return pipe;
>  }
>  
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index d25c166eba4a..a3b3d578f16d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -90,7 +90,6 @@ enum pipe {
>          IGT_MAX_PIPES
>  };
>  const char *kmstest_pipe_name(enum pipe pipe);
> -int kmstest_pipe_to_index(char pipe);
>  const char *kmstest_plane_type_name(int plane_type);
>  
>  enum port {
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 8ed6113205f6..3f61f72f772b 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -354,6 +354,7 @@ static void setup_crtcs(const struct test_config *tconf,
>  					  resources->crtcs[crtc->crtc_idx]);
>  		crtc->crtc_id = drm_crtc->crtc_id;
>  		drmModeFreeCrtc(drm_crtc);
> +		/* FIXME: The test functionally uses this as CRTC index, not pipe */

Argh, I git commit -a'd this hunk into the wrong patch. Was supposed to
be patch 1.

>  		crtc->pipe_id = kmstest_get_crtc_index_from_id(drm_fd, crtc->crtc_id);
>  
>  		crtc->connector_count = 1;

-- 
Jani Nikula, Intel
