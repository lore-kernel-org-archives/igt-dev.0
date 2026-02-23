Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F91BEA4FAD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D2F10E2E5;
	Mon, 23 Feb 2026 11:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmdZZ+pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C6C10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771847061; x=1803383061;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=lTnBPCYjd0o9zi7U/NmvG3nRl1q6q1hH76bwMfwt9XU=;
 b=LmdZZ+pDnPJeF99Qn0SYKHHU+QWbe0yviE+SviXU5xnNmnk7Ab4sRDRg
 XXPyNezap+LinzXUgBzhjG/XAEiJMdqQMdlPReClrLOnKuKsUq+4376t+
 qkklgDuEXKOfH/qT7cyoTyPIM6lU6LILf8Ki9TmVjd2l8joIuUIdQxFVz
 G3QBGakq472mPKxl3wa55jnQPIWBAdx8OsgkfyS8JtWEkGitnYeTiyCc0
 ilbqr/kD6GZ9BL1AetCeO5AWTwT2fWqiaI67l7+u7GkGFD3RrRa1EPwP0
 Ic9h1VvVv82CBNsKB/poO7ZzFja6Ph/SHrMpIKV4VW7zP+PUZfy8yXPwi g==;
X-CSE-ConnectionGUID: B1pznLIhRUuwrf7G85ByyQ==
X-CSE-MsgGUID: zl1A0zkwRRyFix6aN0XdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83550778"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83550778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:44:21 -0800
X-CSE-ConnectionGUID: h63glazWRVmBw01YOyXTlA==
X-CSE-MsgGUID: YEQy5OirQkO9wJBZhHHc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219650966"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:44:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 06/23] tests/kms: Use 'enum pipe' over int'
In-Reply-To: <20260221032003.30936-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-7-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:44:15 +0200
Message-ID: <deb35c0d88e64c72dd48257e9e795f0292e18b07@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert a few 'int pipe's tp 'enum pipe pipe's. This will help
> subsequent cocci based pipe->crtc conversions.

*to

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_flip_tiling.c | 2 +-
>  tests/nouveau_crc.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 453394343857..54446f2478ae 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -67,7 +67,7 @@ static void pipe_crc_free(data_t *data)
>  	data->pipe_crc =3D NULL;
>  }
>=20=20
> -static void pipe_crc_new(data_t *data, int pipe)
> +static void pipe_crc_new(data_t *data, enum pipe pipe)
>  {
>  	igt_display_t *display =3D &data->display;
>  	if (data->pipe_crc)
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 9013b7e53df8..b2f9f3bdd08d 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -31,7 +31,7 @@ IGT_TEST_DESCRIPTION(
>  "such as context flipping.");
>=20=20
>  typedef struct {
> -	int pipe;
> +	enum pipe pipe;
>  	int drm_fd;
>  	int nv_crc_dir;
>  	igt_display_t display;

--=20
Jani Nikula, Intel
