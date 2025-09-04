Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9865CA1013
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 10:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F77710EB77;
	Fri,  5 Sep 2025 10:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="WmWeVyzS";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16C310EADC
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 20:45:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757018741; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GQ91LtsY4rJIEwSuHNAX83GzOs6BW4u6nc75h2/Lh60DL+4HNvef/VFI5MdRk1j8DtFj66ka7YLEkxN3ROKZLGR6htrVUN+HX7l5606mtRccMl30iBOYJZhoOyiqDCb5oIMcLv95Ci3ldYgWgtxGkkT5sQWqRG15SAxB0PI5lv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757018741;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Bmmj6Dk3CywbyHEMxb7h/keoDkq6GPO0zI98rIml79M=; 
 b=J8z0bp5RvCio2utuNn+ALZ1AoO/bIaJkkwANVmOJUvdNI+a4Z1lhh98tvAKaW/c5Speeh/LZmxzYZaBmdYddgCMQQ+BlPSdcjC2jEUjehxrv6zfOXL3KlAeWGD2s22Ei6QE4IlRxd5542uZEa/FIoCG3IOMzbbWu4B0NX+za9Bk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757018740; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=Bmmj6Dk3CywbyHEMxb7h/keoDkq6GPO0zI98rIml79M=;
 b=WmWeVyzS4R7+p3r38wJGyEMieCKtQhTMi7SJrdI3jEm2bTHR44cGXkkX4Wb8f1+c
 pMzx/GNRlsEkUOBctu7aNIlRPF5JqW1AmMMulGAUE2Gr6A/8Kbbw45uSOWO0Dt3HySL
 mfBhR2NnkJeuPEINgVPcHRKSaLnQlFPk3v6btqqc=
Received: by mx.zohomail.com with SMTPS id 1757018738574214.11951688219676;
 Thu, 4 Sep 2025 13:45:38 -0700 (PDT)
Message-ID: <69f9e538836819c46cc73c8b5bec9cc0df9d51b5.camel@collabora.com>
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
Date: Thu, 04 Sep 2025 16:45:36 -0400
In-Reply-To: <20250815040659.3321102-10-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 05 Sep 2025 10:35:11 +0000
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
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> new file mode 100644
> index 000000000..e247477ec
> --- /dev/null
> +++ b/tests/kms_colorop.c
[..]
> +/* TODO move to lib for kms_writeback and kms_colorop (and other
> future) use */
> +static uint64_t get_writeback_fb_id(igt_output_t *output)
> +{
> +	return igt_output_get_prop(output,
> IGT_CONNECTOR_WRITEBACK_FB_ID);
> +}
> +
> +/* TODO move to lib for kms_writeback and kms_colorop (and other
> future) use */
> +static void detach_crtc(igt_display_t *display, igt_output_t
> *output)
> +{
> +	if (get_writeback_fb_id(output) =3D=3D 0)
> +		return;

Hi,

When running these tests on VKMS, I get fails for
igt@kms_properties@colorop-properties-atomic@pipe-a-virtual-1 and
igt@kms_properties@colorop-properties-legacy@pipe-a-virtual-1, with the
splat:

```
(kms_properties:1152) igt_kms-CRITICAL: Test assertion failure function
do_display_commit, file ../lib/igt_kms.c:4971:
(kms_properties:1152) igt_kms-CRITICAL: Failed assertion: ret =3D=3D 0
(kms_properties:1152) igt_kms-CRITICAL: Last errno: 22, Invalid
argument
(kms_properties:1152) igt_kms-CRITICAL: error: -22 !=3D 0
(kms_properties:1152) igt_core-INFO: Stack trace:
(kms_properties:1152) igt_core-INFO:   #0 ../lib/igt_core.c:2075
__igt_fail_assert()
(kms_properties:1152) igt_core-INFO:   #1 ../lib/igt_kms.c:4971
do_display_commit()
(kms_properties:1152) igt_core-INFO:   #2 ../lib/igt_kms.c:5077
igt_display_commit2()
(kms_properties:1152) igt_core-INFO:   #3 ../tests/kms_properties.c:101
cleanup_pipe()
(kms_properties:1152) igt_core-INFO:   #4 ../tests/kms_properties.c:333
colorop_properties()
(kms_properties:1152) igt_core-INFO:   #5 ../tests/kms_properties.c:937
__igt_unique____real_main899()
(kms_properties:1152) igt_core-INFO:   #6 ../tests/kms_properties.c:899
main()
(kms_properties:1152) igt_core-INFO:   #7 [<unknown>+0xa165aca8]
(kms_properties:1152) igt_core-INFO:   #8 [__libc_start_main+0x85]
(kms_properties:1152) igt_core-INFO:   #9 [_start+0x21]
```

I noticed the failure didn't occur when running just these two tests,
but it did if I ran the kms_colorop tests beforehand. Enabling DRM
debug logs revealed:

```
[   29.973065] faux_driver vkms: [drm:drm_atomic_helper_check_modeset]
[CRTC:85:crtc-0] enabled/connectors mismatch (0/1)
[   29.973743] faux_driver vkms: [drm:drm_atomic_check_only] atomic
driver check for 0000000001367eac failed: -22
```

Meaning the connector_mask on the CRTC was being left set for the
writeback connector from the colorop tests, resulting in that failure
during cleanup of the kms_properties tests.

I've tracked it down to the early return based on the return of
get_writeback_fb_id() above. The kernel documentation mentions the
"WRITEBACK_FB_ID" property is "Write-only", and "will always read as
zero", so it seems the check above equates to a=20

output->config.connector->connector_type =3D=3D
DRM_MODE_CONNECTOR_WRITEBACK

ie. it will be true whenever the connector is a writeback, which is
always the case for the colorop tests, meaning igt_output_set_pipe(...
PIPE_NONE) will not be run after any of the colorop tests, so the
connector_mask will never be unset, resulting in the failures later.

By removing this early return the tests pass on VKMS, so that's my
suggestion.

> +
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +}
[..]

--=20
Thanks,

N=C3=ADcolas
