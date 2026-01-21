Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB4C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 09:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F310E22C;
	Wed, 21 Jan 2026 09:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJTB555q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A210E22C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768988011; x=1800524011;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=B65eV+Rq6hmnJvEzQ/2FYxYkmfxYb1ay9oEw3CnTmHc=;
 b=mJTB555q+MkDRmd4Iuo5QT3qaXv1/I+nvSzNNrJNgQIdsM+3CPgkI8Kt
 /qp8Pz6i6o3Cm3kUX4801NBd1Cc35js8Iit6uPYgf37X0Q4aZhDeKJZEy
 lS/Gra+VYrQRbIgl9KBoEhqfTrCdN+P4Q1Ml1Bo1irZ4eTQLvRnJipSCm
 mJgaRo4kZj9M407jx812fmDaiV2greUQMLMoEIjJyCx7GaaFidqCmbiRv
 b5GrlPGKocN27nbxXa3E9DyrNbtc0ImaK8TY6q3JBotCxvNNH+kyRI3OH
 XtmO1UwyZGqzfyG9Kk6Yxj8mVpoN9FvNfvlHfW6SJKdBpnKM4VHc6xDw5 g==;
X-CSE-ConnectionGUID: bTQigetvT+Wqr8htAu8xAw==
X-CSE-MsgGUID: Ybcwwp2oSCG4BEGIN88MCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70111810"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70111810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:33:30 -0800
X-CSE-ConnectionGUID: HhihglIESNy98csIK/+pMw==
X-CSE-MsgGUID: wVFUaJXsSh67zy+uPThoEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211253774"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 01:33:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/12] lib/kms: Add igt_crtc_t based CRC wrappers
In-Reply-To: <20260120171656.15840-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-9-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 11:33:26 +0200
Message-ID: <533fc18053baa268f1188aa2dc589c51a522a703@intel.com>
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
> Add wrappers for igt_pipe_crc_new*() that take igt_crtc_t rather
> than the bare crtc index. Should help eliminate the pipe usage
> from tests.

I think the basic idea is good, but a couple of comments inline.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 14 ++++++++++++++
>  lib/igt_kms.h |  4 ++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 74ad82d77dd3..901bbfab5934 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -59,6 +59,7 @@
>  #include "intel_chipset.h"
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
> +#include "igt_pipe_crc.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
> @@ -5299,6 +5300,19 @@ int igt_output_preferred_vrefresh(igt_output_t *ou=
tput)
>  		return 60;
>  }
>=20=20
> +igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source)
> +{
> +	return igt_pipe_crc_new(crtc->display->drm_fd, crtc->crtc_offset,
> +				source);
> +}
> +
> +igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *=
source)
> +{
> +	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd,
> +					 crtc->crtc_offset,
> +					 source);
> +}
> +
>  static const char *igt_crtc_name(igt_crtc_t *crtc)
>  {
>  	if (crtc =3D=3D NULL)
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 71a2f2c4d89c..b291673c2f7f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -584,6 +584,10 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_disp=
lay_t *display, enum pipe pi
>  	return &display->pipes[pipe];
>  }
>=20=20
> +typedef struct _igt_pipe_crc igt_pipe_crc_t;

So this is a dupe typedef, also defined in igt_pipe_crc.h. It works,
it's probably better than including the other header here, but also a
bit meh.

Another idea is naming this based on crtc instead of pipe, even if "crtc
crc" is a mouthful:

typedef struct _igt_pipe_crc igt_crtc_crc_t;

I think it'll work, the types are compatible with the underlying struct
being the same. So we could (gradually) convert from pipe_crc to
crtc_crc.

With the wrappers being in igt_kms.[ch], is the idea that most tests
could cease to include igt_pipe_crc.h after the conversions?

Anyway, just food for thought, and I'm fine with merging this as-is too.

BR,
Jani.


> +igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
> +igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *=
source);
> +
>  const char *igt_output_name(igt_output_t *output);
>  bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);

--=20
Jani Nikula, Intel
