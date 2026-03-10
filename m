Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571DFEB1056
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 14:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0741610E173;
	Tue, 10 Mar 2026 14:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXkQYpRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE7D10E29D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773152089; x=1804688089;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=YqLoZWRAqEins4GcqU3g2YwiGmtIqx1X1m6nkQJ14JY=;
 b=PXkQYpRKzO7fb6x8wISiR/ORvQroepx7u8g7ti5BifiVJVneItnS3ex/
 /PqyTsB/AHB8e6wVEObp4h6PWF1sPIf+SVjtpkYVNqyryGETuSvJVq7ch
 4VjMaokwOyDAtE6T+asNRZJJWJsglonxi4wQzVRboQsjQ1sbIjtRiAf5d
 Kyn2rGd7CZbdUMV9aIbjnY/vzgWtEdQ0kfNz9Kh1m9j2qdY60+yzo/Q6a
 s2EOKXVVTOjpNrPNYrULPtyc2IiqRE2/+Ul8+hgkeDD5nPeLRoZIycJnO
 PxVymVfL6WgYVhZS081qYJ/k/1NbJmyPnymOw96DY7dP6ts+fI6aMFmlD g==;
X-CSE-ConnectionGUID: PPM1nlJ6SpanabQLmKspNg==
X-CSE-MsgGUID: KtCHYIyOSOOLf10AXYqj9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85289434"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85289434"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:14:49 -0700
X-CSE-ConnectionGUID: fQYZcVrZRMyg5kd6KKPHMQ==
X-CSE-MsgGUID: qVhDvDrpQhiJQv9tFbyS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="225071389"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.90])
 ([10.245.244.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 07:14:49 -0700
Message-ID: <c7da29033b34b9fadafaf6a882db9f835e389642.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Add subtest to test
 with active fd teardown
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org
Date: Tue, 10 Mar 2026 15:14:47 +0100
In-Reply-To: <20260225094255.10335-2-dev@lankhorst.se>
References: <20260225094255.10335-2-dev@lankhorst.se>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Wed, 2026-02-25 at 10:42 +0100, Maarten Lankhorst wrote:
> Create an evil testcase to ensure we also unload when the device is
> still sort of active.
>=20
> igt_create_fb will create a framebuffer and probably a backing BO,
> while I also saw a crash related to property blobs.
>=20
> This tests that we can teardown with buffer objects,
> property blobs and framebuffers on the list.
>=20
> There should probably be another test for a VM and engine too,
> but this should be enough for a first attempt.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> =C2=A0tests/intel/xe_module_load.c | 28 ++++++++++++++++++++++++++++
> =C2=A01 file changed, 28 insertions(+)
>=20
> diff --git a/tests/intel/xe_module_load.c
> b/tests/intel/xe_module_load.c
> index 0c75c4ebc1..4be7b44482 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -91,6 +91,27 @@ static void load_and_check_xe(const char *opts)
> =C2=A0	drm_close_driver(drm_fd);
> =C2=A0}
> =C2=A0
> +static void display_opened_unload(void)
> +{
> +	igt_display_t display;
> +	int drm_fd;
> +	struct igt_fb fb;
> +	uint32_t blob_id;
> +
> +	/* drm_open_driver loads xe module if needed */
> +	drm_fd =3D drm_open_driver(DRIVER_XE);
> +	igt_display_require(&display, drm_fd);
> +
> +	/* Create a property blob and a FB, hopefully with a
> separate backing BO */
> +	igt_create_fb(drm_fd, 640, 480, DRM_FORMAT_XRGB8888, 0,
> &fb);
> +	igt_assert_eq(0, drmModeCreatePropertyBlob(drm_fd, &fb,
> sizeof(fb), &blob_id));
> +
> +	/* Unbind, close, unload, check for booms */
> +	igt_kmod_unbind("xe", NULL);
> +	drm_close_driver(drm_fd);
> +	igt_xe_driver_unload();
> +}
> +
> =C2=A0static const char * const unwanted_drivers[] =3D {
> =C2=A0	"xe",
> =C2=A0	"i915",
> @@ -107,6 +128,9 @@ static const char * const unwanted_drivers[] =3D {
> =C2=A0 * SUBTEST: unload
> =C2=A0 * Description: Unload the Xe driver
> =C2=A0 *
> + * SUBTEST: display-opened-unload
> + * Description: Test behavior of xe driver unloading while fd is
> still opened.

Perhaps add that there is a framebuffer and a blob created as well.

Either way
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> + *
> =C2=A0 * SUBTEST: reload
> =C2=A0 * Description: Reload the Xe driver
> =C2=A0 *
> @@ -132,6 +156,10 @@ int igt_main()
> =C2=A0		igt_xe_driver_unload();
> =C2=A0	}
> =C2=A0
> +	igt_subtest("display-opened-unload") {
> +		display_opened_unload();
> +	}
> +
> =C2=A0	igt_subtest("force-load") {
> =C2=A0		for (int i =3D 0; unwanted_drivers[i] !=3D NULL; i++) {
> =C2=A0			igt_intel_driver_unload(unwanted_drivers[i])
> ;
