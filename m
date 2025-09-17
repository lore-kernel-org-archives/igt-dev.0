Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150CCAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 21:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABA10E1E3;
	Wed, 17 Sep 2025 21:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="GpHyfpWX";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758C510E1E3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 21:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758144032; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DwwD6/iiawcFf8jCodWfiTWkVxAvh5XJNeoTCdTso7Qn+8Ykkzhfvx+F50z43dWuGaE5LOqVFtefx2M0eYIMXESROg9qPmzfdCKeQ4yTvL/M1IOom71Ly324qqYTD+e2sDZ2rMyGoWLkcYxFIOvl6V1aE6Gp7VQz9BSKOGDsqBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758144032;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZviFPP5fkiVh8x5AbJYRYf5FBhbEOvBHIInmhw5v40k=; 
 b=DGli0FF4W5Bc+08LUie898HZF9lPKu/IpONrFYm7vK1vRgCDV7QjmGthanzxprucaE4a0OCDVCXeQCA61AGtkxh/lLHZ1fiyvIvBWEt2t+CVoTTd/QRbC473f5DbJqLnFnhDT446cWtpEDDQFFA6AVVFWKviDNaK2IK/vf0j+oc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758144032; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=ZviFPP5fkiVh8x5AbJYRYf5FBhbEOvBHIInmhw5v40k=;
 b=GpHyfpWXcYTL6hDfp4YuTJl/3dKFIffk7p0T2FI6M462nhx3t4DCDnqbpU7aG4gC
 4p2BjtCx/LnpyYR9z5gtlodGEUO6V6/Y+6jVmjKL7UiMfjqS1RoeUg6W27Bhltnlk/a
 OfDNiDfEYJs/AQn0ARWhav2FiSIqkyUgSRIpNBE4=
Received: by mx.zohomail.com with SMTPS id 1758144029504572.1878437731662;
 Wed, 17 Sep 2025 14:20:29 -0700 (PDT)
Message-ID: <64fc50a8e0285f9b5599d33d792c33554f605ddc.camel@collabora.com>
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
Date: Wed, 17 Sep 2025 17:20:27 -0400
In-Reply-To: <20250815040659.3321102-10-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Thu, 2025-08-14 at 22:06 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>=20
> This tests the color pipeline API, exposed via the
> COLOR PIPELINE plane property and drm_colorop objects.
>=20
> We introduce tests for:
> =C2=A0- sRGB EOTF
> =C2=A0- sRGB Inverse EOTF
> =C2=A0- sRGB EOTF + sRGB Inverse EOTF
>=20
> The last one is the holy grail of LUT testing. It tests that
> after applying an EOTF, followed by its inverse EOTF we arrive
> back at the original value. We can use this to test for
> precision loss in the pipeline.
>=20
> All tests are tested via writeback. All transforms are done in
> SW (in floating point) and at the end the SW transformed buffer
> is compared with the KMS writeback output buffer. The two should
> match within a bracket of acceptable deviations. Since these
> deviations might look different for different KMS drivers we'll
> do this check on a driver-specific basis.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> =C2=A0tests/kms_colorop.c | 508
> ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0tests/kms_colorop.h |=C2=A0 88 ++++++++
> =C2=A0tests/meson.build=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A03 files changed, 597 insertions(+)
> =C2=A0create mode 100644 tests/kms_colorop.c
> =C2=A0create mode 100644 tests/kms_colorop.h
>=20
>=20
[..]
> +igt_main
> +{
> +
> +	struct {
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		const char *name;
> +	} tests[] =3D {
> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
> +		{ { &kms_colorop_srgb_inv_eotf, NULL },
> "srgb_inv_eotf" },
> +		{ { &kms_colorop_srgb_eotf,
> &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
> +	};
> +
> +	igt_display_t display;
> +	int i, ret;
> +
> +	igt_fixture {
> +		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +
> +		if (drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> +			display.is_atomic =3D 1;
> +
> +		ret =3D drmSetClientCap(display.drm_fd,
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> +
> +		igt_require_f(!ret, "error setting
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&display, display.drm_fd);
> +
> +		igt_require(display.is_atomic);
> +
> +	}
> +
> +	for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe("Check color ops on a plane");
> +		igt_subtest_f("plane-%s", tests[i].name)
> +			colorop_plane_test(&display,
> tests[i].colorops);
> +	}
> +
> +	igt_describe("Tests getting and setting COLOR_PIPELINE
> property on plane");

igt_describe() should precede an igt_subtest/igt_subtest_group not a
fixture. In this case looks like this is a description for the entire
binary though, so IGT_TEST_DESCRIPTION() should be used instead.

> +	igt_fixture {
> +		igt_display_fini(&display);
> +	}
> +}

--=20
Thanks,

N=C3=ADcolas
