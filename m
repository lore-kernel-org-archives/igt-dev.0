Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47B606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lsrc8R3m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B7710E375;
	Wed, 18 Nov 2026 10:19:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BBE10FAB3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794997098; x=1826533098;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Ai/TQ//SyP4C2/uQg9kVo+fmx+ewwcqT7q//gQwNx44=;
 b=lsrc8R3mNjekjeLqPOUunxFL4OYW0sKF0CDTiEWe8wuoQxqCcmAERhoj
 r7XFVy2lMRDJ/dBgRlWQ6LXGd3eWJ7p0tLtSlt2JsQwX+zI7Jn1qG190k
 UypKVo2bT5yLuOpjv0oot16Ac5uonPeO6ufRjTdciQNE0rd/kQ6dSLjul
 AHPO/mVmx/IYibHg0KR6jDHNfIv/S2KQg7KjK0VeLJBb9ipuGirK0I7X5
 lh57Mo3q5cx3WPuesSfySppM/rzgMprLUYs2uwHgi2OttfehL32Iw4knU
 zSYu4SWYR8dWqkcIRaIr45pOYPUrO+rJI0FTBejSs15dOsCxQZQIblFHp A==;
X-CSE-ConnectionGUID: tNUt06Q3QXWw8CEEP6acTA==
X-CSE-MsgGUID: 01UbNmFlRoqBx4tTK6ZlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3791764"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3791764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:18:17 -0800
X-CSE-ConnectionGUID: BG0VRmfSS62JgnNYeuAFmg==
X-CSE-MsgGUID: rtMDu5+PQrCNxFNA98HqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10053976"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:18:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rpm: Stop setting the
 i915.mmio_debug modparam
In-Reply-To: <20261116143448.29338-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116143448.29338-1-ville.syrjala@linux.intel.com>
Date: Wed, 18 Nov 2026 12:18:12 +0200
Message-ID: <df24b14ed751f4ebe61a51d91ddcd365992f9e63@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The i915.mmio_debug modparam is going first change from an
> int to a boolean, and then move to the display mode (once
> that split finally happens). The kernel will reject a -1
> value for a boolean modparam, so the test would start to
> fail when the type changes. Stop setting the modparam on
> the i915 module in the test to avoid that. With the modparam
> removed the test will work on any version of the driver.
>
> The modparam will anyway default to -1 (as in mmio_debug is
> always enabled) if the kernel was built with DRM_I915_DEBUG_MMIO=3Dy,
> or I915_DEBUG (which selects the former). So explicitly setting
> the modparam in the test would only benefit someone running the
> test on a non-debug build of the driver. I915_DEBUG should
> be enabled in the i915 CI builds.
>
> If someone really wants to set modparams in the test perhaps igt
> should grow a more generic mechanism for doing that eg. via
> environment variables...
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/i915_pm_rpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index b4da27b21b20..ca4f645c18eb 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -1432,7 +1432,7 @@ int igt_main_args("", long_options, help_str, opt_h=
andler, NULL)
>  		igt_i915_driver_unload();
>=20=20
>  		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
> -		igt_assert_eq(igt_i915_driver_load("disable_display=3D1 mmio_debug=3D-=
1"), 0);
> +		igt_assert_eq(igt_i915_driver_load("disable_display=3D1"), 0);
>=20=20
>  		igt_assert(setup_environment(false));
>  		pci_dev =3D igt_device_get_pci_device(drm_fd);
> @@ -1443,7 +1443,7 @@ int igt_main_args("", long_options, help_str, opt_h=
andler, NULL)
>  		igt_i915_driver_unload();
>=20=20
>  		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
> -		igt_assert_eq(igt_i915_driver_load("mmio_debug=3D-1"), 0);
> +		igt_assert_eq(igt_i915_driver_load(""), 0);
>=20=20
>  		igt_assert(setup_environment(true));
>  		pci_dev =3D igt_device_get_pci_device(drm_fd);

--=20
Jani Nikula, Intel
