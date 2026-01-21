Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0183C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E0F10E734;
	Wed, 21 Jan 2026 09:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIQK2KB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5810E734
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988357; x=1800524357;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=1/tcwLpy04TarYiNbA7dtEAO0dS88oZFGkHxDnE6sWk=;
 b=bIQK2KB9y0evmMwILE3kpcd5imefTC504Bl2KZa4kjbTOqkJjgvfeU+Y
 bcB+QXskFbm7gm1/YgKFWoCLPxxIX5dkDwAXPU5Sn/O9fGgVnKReN5MNK
 in5777CMrlHu20s9jUCgQi2axSLU7IKpSL4vnWG+fhS5ty9/Qo66elILW
 mpfDNzyNprKVAVWmqaGJ+J6xnovTziq+Mi5ad1G9gN+j5usxYM9MFUszb
 nuVS2xh9oe6RCIqwXYBuN7zcUqP6aWEaZZmqdDcLrylrBrx7uVTUciEAl
 6nb9ym57tqnB/UIAmxcPuLl6mlM/mWLg/PwhFMaMB6QGr/7C+mEG/ETQh g==;
X-CSE-ConnectionGUID: k7onjLTzR7aA/SerZ61ZUQ==
X-CSE-MsgGUID: 5dbwRoW6T+SAXvgLF7Ai4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81590745"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81590745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:39:17 -0800
X-CSE-ConnectionGUID: P0kNJNlfTfy8Xe+ISJdc+A==
X-CSE-MsgGUID: tyWds1UDRIqAZxJjf7IXOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210906707"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:39:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/12] lib/kms: Use igt_crtc_crc_new() even more
In-Reply-To: <20260120171656.15840-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-13-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:39:12 +0200
Message-ID: <0161596db2a5b57c8382e62040c664c92277f474@intel.com>
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
> Switch a few more igt_pipe_crc_new() uses over to
> igt_crtc_crc_new(). These weren't caught by the previous
> attempts and I the semantic patches were already getting
> far too messy, so take care of these separately.
>
>  #include "scripts/iterators.cocci"
>
> @find@
> identifier FD;
> identifier DISPLAY;
> @@
> igt_display_require(&DISPLAY, FD);
>
> @depends on find@
> typedef igt_display_t;
> identifier FUNC, DISPLAY, find.FD;
> expression PIPE;
> @@
> FUNC(..., igt_display_t *DISPLAY ,...)
> {
> <...
> - igt_pipe_crc_new(FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> ...>
> }
>
> @depends on find@
> typedef igt_display_t;
> identifier DISPLAY, find.FD;
> expression PIPE, E;
> @@
>  igt_display_t *DISPLAY =3D E;
> <...
> - igt_pipe_crc_new(FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> ...>
>
> @depends on find@
> identifier find.FD;
> identifier find.DISPLAY;
> expression PIPE;
> @@
> - igt_pipe_crc_new(FD, PIPE
> + igt_crtc_crc_new(igt_crtc_for_pipe(&DISPLAY, PIPE)
> 	,...)
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/kms_draw_crc.c | 3 ++-
>  tests/intel/xe_pat.c       | 3 ++-
>  tests/kms_prime.c          | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 6f9786ba2454..26bd1fbb1961 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -104,7 +104,8 @@ static void find_modeset_params(void)
>  			continue;
>=20=20
>  		mode =3D igt_output_get_mode(output);
> -		pipe_crc =3D igt_pipe_crc_new(drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		/*Only one pipe/output is enough*/
>  		break;
>  	}
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index a7f8ab088d72..24339f688ce6 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -936,7 +936,8 @@ static void display_vs_wb_transient(int fd)
>  			continue;
>=20=20
>  		mode =3D igt_output_get_mode(output);
> -		pipe_crc =3D igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		break;
>  	}
>=20=20
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index f443e9838a2b..f51c463211f4 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -401,7 +401,7 @@ static void test_crc(int exporter_fd, int importer_fd)
>  	output =3D setup_display(importer_fd, &display, &pipe);
>=20=20
>  	mode =3D igt_output_get_mode(output);
> -	pipe_crc =3D igt_pipe_crc_new(importer_fd, pipe,
> +	pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {

--=20
Jani Nikula, Intel
