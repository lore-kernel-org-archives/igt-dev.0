Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D0CC44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7510E72F;
	Wed, 21 Jan 2026 09:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXch7nSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB110E72F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988326; x=1800524326;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=hjMWOhsmdVrbVrQQPa+obbqvAADXu+UCKAuNL5fju1c=;
 b=NXch7nSswuG8EKTmHYbGaP8Ls5ov198jLpOrYWXrHH8H4RdBRF8SDypG
 VnDu9VQOeynz2WdhatfwlL1w9YMiGer6hEfysjoiZ8tKjvOPrpmmJ62T3
 jXWDTDwKOuz9/a1lH/yqq/w33MAvAEM3gIS20CbInqzSXQ/8EVHw4w5Wb
 3Qvyd5EiM/265FTTcw+Ej+FwBlwySYcVJopSCo5hx9KwOGPSoUvskb6uQ
 iX8oMJEh//Q1lt5zE2S2MRIGzRWPI70mGi2oZ0sIgArfyxbacXcy9ouu7
 g5/WXiwME8xFz4EcXeLQzjoEY4yea8d4M2kwSIDQ+qDUApIQaqz3mG6LB w==;
X-CSE-ConnectionGUID: T3IzBNM2QnuQ7WgWhVtDNw==
X-CSE-MsgGUID: VSnatiplR52h/QGDvtZ8Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73840395"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="73840395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:38:45 -0800
X-CSE-ConnectionGUID: Q5bsEgndStmESPTpvV7cSw==
X-CSE-MsgGUID: IYUzHhs7S4yGMcMODbr9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206218220"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:38:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/12] lib/kms: Use igt_crtc_crc_new_nonblock() more
In-Reply-To: <20260120171656.15840-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-12-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:38:40 +0200
Message-ID: <5ef174f09fa0ae6085b1058851e10d4a669bc164@intel.com>
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
> Switch over to igt_crtc_crc_new_nonblock() from
> igt_pipe_crc_new_nonblock() even for the places that
> don't have a igt_crtc_t around. This make it more
> obvious where we need to modify the tests when fully
> switching over from pipe to igt_crc_t.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find_data@
> iterator name pipe_test;
> type T;
> T DATA;
> identifier FD;
> identifier DISPLAY;
> @@
> igt_display_require(&DATA.DISPLAY, DATA.FD);
>
> @depends on find_data@
> find_data.T *DATA;
> identifier find_data.FD;
> identifier find_data.DISPLAY;
> expression PIPE;
> @@
> - igt_pipe_crc_new_nonblock(DATA->FD, PIPE
> + igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
> 	,...)
>
> @local_fd depends on find_data@
> find_data.T *DATA;
> identifier find_data.FD, FD2;
> identifier find_data.DISPLAY;
> expression PIPE;
> @@
> int FD2 =3D DATA->FD;
> <...
> - igt_pipe_crc_new_nonblock(FD2, PIPE
> + igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA->DISPLAY, PIPE)
> 	,...)
> ...>
>
> @depends on local_fd@
> find_data.T *DATA;
> identifier find_data.FD;
> identifier FD2;
> @@
> - int FD2 =3D DATA->FD;
> ... when !=3D FD2
>
> @depends on find_data@
> typedef igt_display_t;
> identifier DISPLAY, find_data.FD;
> expression PIPE, E;
> find_data.T *DATA;
> @@
>  igt_display_t *DISPLAY =3D E;
> <...
> - igt_pipe_crc_new_nonblock(DATA->FD, PIPE
> + igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> ...>
>
> @depends on find_data@
> identifier find_data.DISPLAY, find_data.FD;
> expression PIPE;
> find_data.T find_data.DATA;
> @@
> - igt_pipe_crc_new_nonblock(DATA.FD, PIPE
> + igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&DATA.DISPLAY, PIPE)
> 	,...)
>
> @@
> igt_display_t *DISPLAY;
> expression PIPE;
> @@
> - igt_pipe_crc_new_nonblock(DISPLAY->drm_fd, PIPE
> + igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
>
> @@
> expression DISPLAY, PIPE;
> @@
> igt_crtc_crc_new_nonblock(...)
> {
> <...
> - igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(DISPLAY, PIPE)
> + igt_pipe_crc_new_nonblock(DISPLAY->drm_fd, PIPE
> 	,...)
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_cursor_edge_walk.c | 2 +-
>  tests/kms_pipe_crc_basic.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index d77787e51b97..eaf4c59b8a19 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -284,7 +284,7 @@ static void prepare_crtc(data_t *data)
>  	data->jump_y =3D (mode->vdisplay - data->curh) / 2;
>=20=20
>  	/* create the pipe_crc object for this pipe */
> -	data->pipe_crc =3D igt_pipe_crc_new_nonblock(data->drm_fd, data->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->d=
isplay, data->pipe),
>  						   IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* get reference crc w/o cursor */
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 8861dc7b26bd..fb2f5f8ebe96 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -167,7 +167,7 @@ static void test_read_crc(data_t *data, enum pipe pip=
e,
>  		if (flags & TEST_NONBLOCK) {
>  			igt_pipe_crc_t *pipe_crc;
>=20=20
> -			pipe_crc =3D igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
> +			pipe_crc =3D igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->displ=
ay, pipe),
>  							     IGT_PIPE_CRC_SOURCE_AUTO);
>  			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>  			igt_pipe_crc_start(pipe_crc);

--=20
Jani Nikula, Intel
