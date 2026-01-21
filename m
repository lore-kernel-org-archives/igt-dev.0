Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC3C44502
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F1910E72F;
	Wed, 21 Jan 2026 09:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikyTcS7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DA010E72E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768987271; x=1800523271;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=7yGsP7CJG2SKFs3cueGgfVTHQ3q5BSsPSiYNnSE0GeA=;
 b=ikyTcS7nxCGh5WLHsScHzUVZLrxh5mTGeZRTfUO7uZLHiAisBfveDjL/
 DtVe5clmEc9QQBN5G10DfySsivBR13gwrY/oXzGXGvq2OV1j3HJYBC1ib
 V782B/vpCaUAL4bHEhYRAF5qzTT5W+6LTy8RBuG5bXTv/HM5Udj/yOvTm
 RJ0QscoE9BLuWtn24OSpy3JU3MNh/kjto5alhQ9hoSVlqpbz/KVdDI0Y0
 uiTw8U1YC6VCIDb07f9hah2G0rYquH6YU+IJlgAzlJDYxNUQVy8u1SewJ
 P726+aMRpTNP4EFi6LmXo0u7UHpWdxbTBXLDkVMJNC5JjgaL4SSFrTxQa g==;
X-CSE-ConnectionGUID: 51FY2dKSQ5maRZsvCFOwug==
X-CSE-MsgGUID: 80eePwkYTa21ZSG/NloSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70303854"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70303854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:21:10 -0800
X-CSE-ConnectionGUID: Ru6H9P+mSe+dblx4bgwQJQ==
X-CSE-MsgGUID: HDEB3I6bR1ul+0dd8nahIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210901389"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:21:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/12] lib/crc: Convert igt_pipe_crc away from
 enum pipe
In-Reply-To: <20260120171656.15840-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-8-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:21:05 +0200
Message-ID: <f78347bb6aebe3e4c8e63f73cf3ce1f987193237@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use the correct crtc_index/crtc_offset rather than the
> incorrect pipe for the pipe crc debugfs stuff. Currently
> the two match 1:1 so no functional change, but if/when we
> change the pipe<->crtc mapping this needs to be done correctly.

Yeah, this aligns with my thinking. If a function uses the passed in
pipe as a crtc index, the function should be explicitly using crtc
(index) in function/parameter naming. If the caller requires a specific
pipe, it's the caller's responsibility to pass in a crtc that matches
the pipe they want, because *that* is the special case.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_pipe_crc.c | 32 ++++++++++++++++----------------
>  lib/igt_pipe_crc.h |  6 ++----
>  2 files changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
> index 866bf2881cbd..9a79edd51531 100644
> --- a/lib/igt_pipe_crc.c
> +++ b/lib/igt_pipe_crc.c
> @@ -189,7 +189,7 @@ struct _igt_pipe_crc {
>  	int crc_fd;
>  	int flags;
>=20=20
> -	enum pipe pipe;
> +	int crtc_index;
>  	char *source;
>  };
>=20=20
> @@ -215,7 +215,7 @@ void igt_require_pipe_crc(int fd)
>  }
>=20=20
>  static igt_pipe_crc_t *
> -pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
> +pipe_crc_new(int fd, int crtc_index, const char *source, int flags)
>  {
>  	igt_pipe_crc_t *pipe_crc;
>  	char buf[128];
> @@ -235,14 +235,14 @@ pipe_crc_new(int fd, enum pipe pipe, const char *so=
urce, int flags)
>  	pipe_crc =3D calloc(1, sizeof(struct _igt_pipe_crc));
>  	igt_assert(pipe_crc);
>=20=20
> -	sprintf(buf, "crtc-%d/crc/control", pipe);
> +	sprintf(buf, "crtc-%d/crc/control", crtc_index);
>  	pipe_crc->ctl_fd =3D openat(debugfs, buf, O_WRONLY);
>  	igt_assert(pipe_crc->ctl_fd !=3D -1);
>=20=20
>  	pipe_crc->crc_fd =3D -1;
>  	pipe_crc->fd =3D fd;
>  	pipe_crc->dir =3D debugfs;
> -	pipe_crc->pipe =3D pipe;
> +	pipe_crc->crtc_index =3D crtc_index;
>  	pipe_crc->source =3D strdup(env_source);
>  	igt_assert(pipe_crc->source);
>  	pipe_crc->flags =3D flags;
> @@ -253,39 +253,39 @@ pipe_crc_new(int fd, enum pipe pipe, const char *so=
urce, int flags)
>  /**
>   * igt_pipe_crc_new:
>   * @fd: fd of the device
> - * @pipe: display pipe to use as source
> + * @crtc_index: CRTC to use as source
>   * @source: CRC tap point to use as source
>   *
> - * This sets up a new pipe CRC capture object for the given @pipe and @s=
ource
> + * This sets up a new pipe CRC capture object for the given @crtc_index =
and @source
>   * in blocking mode.
>   *
> - * Returns: A pipe CRC object for the given @pipe and @source. The libra=
ry
> + * Returns: A pipe CRC object for the given @crtc_index and @source. The=
 library
>   * assumes that the source is always available since recent kernels supp=
ort at
>   * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
>   */
>  igt_pipe_crc_t *
> -igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
> +igt_pipe_crc_new(int fd, int crtc_index, const char *source)
>  {
> -	return pipe_crc_new(fd, pipe, source, O_RDONLY);
> +	return pipe_crc_new(fd, crtc_index, source, O_RDONLY);
>  }
>=20=20
>  /**
>   * igt_pipe_crc_new_nonblock:
>   * @fd: fd of the device
> - * @pipe: display pipe to use as source
> + * @crtc_index: CRTC to use as source
>   * @source: CRC tap point to use as source
>   *
> - * This sets up a new pipe CRC capture object for the given @pipe and @s=
ource
> + * This sets up a new pipe CRC capture object for the given @crtc_index =
and @source
>   * in nonblocking mode.
>   *
> - * Returns: A pipe CRC object for the given @pipe and @source. The libra=
ry
> + * Returns: A pipe CRC object for the given @crtc_index and @source. The=
 library
>   * assumes that the source is always available since recent kernels supp=
ort at
>   * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
>   */
>  igt_pipe_crc_t *
> -igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
> +igt_pipe_crc_new_nonblock(int fd, int crtc_index, const char *source)
>  {
> -	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
> +	return pipe_crc_new(fd, crtc_index, source, O_RDONLY | O_NONBLOCK);
>  }
>=20=20
>  /**
> @@ -380,7 +380,7 @@ void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
>=20=20
>  	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
>=20=20
> -	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
> +	sprintf(buf, "crtc-%d/crc/data", pipe_crc->crtc_index);
>=20=20
>  	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
>  	pipe_crc->crc_fd =3D openat(pipe_crc->dir, buf, pipe_crc->flags);
> @@ -560,7 +560,7 @@ igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t=
 *pipe_crc,
>  void
>  igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t=
 *crc)
>  {
> -	unsigned vblank =3D kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;
> +	unsigned vblank =3D kmstest_get_vblank(drm_fd, pipe_crc->crtc_index, 0)=
 + 1;
>=20=20
>  	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
>  }
> diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h
> index 171f082300ec..f648b2c9231e 100644
> --- a/lib/igt_pipe_crc.h
> +++ b/lib/igt_pipe_crc.h
> @@ -9,8 +9,6 @@
>  #include <stdbool.h>
>  #include <stdint.h>
>=20=20
> -enum pipe;
> -
>  /**
>   * igt_pipe_crc_t:
>   *
> @@ -48,9 +46,9 @@ char *igt_crc_to_string(igt_crc_t *crc);
>=20=20
>  void igt_require_pipe_crc(int fd);
>  igt_pipe_crc_t *
> -igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
> +igt_pipe_crc_new(int fd, int crtc_index, const char *source);
>  igt_pipe_crc_t *
> -igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
> +igt_pipe_crc_new_nonblock(int fd, int crtc_index, const char *source);
>  void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
>  void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
>  void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);

--=20
Jani Nikula, Intel
