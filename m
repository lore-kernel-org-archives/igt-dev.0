Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA132EBFD28
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 09:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732B810E3A7;
	Mon, 13 Apr 2026 09:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0RWIOvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43A10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776073440; x=1807609440;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=n5LWuLsoQ1tZaSt+aub/3yPDgU1aw+3F7OZFhIE2/Q8=;
 b=D0RWIOvgEyBunNIOqoZla2ti2qmbyxXeyMoIqq0TIJfOdzFE1vz786mT
 UbTPDCdTqRT1li/AqEQwd4zNZCxMS33M7ZtnoebGxjak+7gdOZx5cYemm
 0uqwOAYzYBdmQscyVgSBNJ/tcwGDGQ+bTcfm9y/FkgiPoOTMX3AdKuJI2
 5KDrhwP7EferaBxHdG/oQyhz5l8G75hDLHj2tCwRIbK1b6kuYu540WBdS
 VLAbmV8wKJcOf3femEt1z+tSNsKeFITqY3Zn/aGqyzNtyVa6AN2Z8tqVD
 lx+Qp7XgFf4qlw98ch5pqPeMUWRNnEOB4gcEzMD5vsc59E22PWGH7XcxW g==;
X-CSE-ConnectionGUID: c6e9xnokQOCjzsA7OeKagw==
X-CSE-MsgGUID: 1T2CaDGIQzGrNcp84gyxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80864969"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80864969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:43:59 -0700
X-CSE-ConnectionGUID: V0WA0FBvQ4qCIAeWaHSZ8Q==
X-CSE-MsgGUID: PaV1sXg+SbGqfUFzb0Vnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="252927844"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:43:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_busy: Verify display reset
 happened
In-Reply-To: <20260413084545.2491-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
 <20260413084545.2491-1-ville.syrjala@linux.intel.com>
Date: Mon, 13 Apr 2026 12:43:54 +0300
Message-ID: <276919d225ea11ee5187f581c3078520a80dcbfe@intel.com>
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

On Mon, 13 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use the new "intel_display_reset_count" debugfs file to confirm that the
> kernel did in fact perform the display reset.
>
> v2: Give the file an "intel_" namespace (Jani)
>     Don't leak the debugfs dirfd
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Seems reasonable.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tests/intel/kms_busy.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index e82380276666..039cc6ae8dab 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -35,6 +35,7 @@
>=20=20
>  #include "i915/gem.h"
>  #include "igt.h"
> +#include "igt_sysfs.h"
>=20=20
>  /**
>   * SUBTEST: basic
> @@ -413,6 +414,18 @@ static void gpu_engines_restore_timeouts(int fd, int=
 num_engines, const struct g
>  		gem_engine_properties_restore(fd, &props[i]);
>  }
>=20=20
> +static uint32_t display_reset_count(int drm_fd)
> +{
> +	uint32_t count;
> +	int dir;
> +
> +	dir =3D igt_debugfs_dir(drm_fd);
> +	count =3D igt_sysfs_get_u32(dir, "intel_display_reset_count");
> +	close(dir);
> +
> +	return count;
> +}
> +
>  const char *help_str =3D
>  	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n=
";
>=20=20
> @@ -549,16 +562,22 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  					continue;
>=20=20
>  				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> -					if (tests[i].reset)
> +					uint32_t reset_count_pre =3D 0;
> +
> +					if (tests[i].reset) {
>  						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test=
", 1);
> +						reset_count_pre =3D display_reset_count(display.drm_fd);
> +					}
>=20=20
>  					test_hang(&display,
>  						  crtc,
>  						  output,
>  						  tests[i].modeset, tests[i].hang_newfb);
>=20=20
> -					if (tests[i].reset)
> +					if (tests[i].reset) {
>  						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test=
", 0);
> +						igt_assert_neq(reset_count_pre, display_reset_count(display.drm_fd=
));
> +					}
>  				}
>  			}

--=20
Jani Nikula, Intel
