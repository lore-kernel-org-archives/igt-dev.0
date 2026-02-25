Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6EAF357D5
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 10:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D623F10E737;
	Wed, 25 Feb 2026 10:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M549RjQo";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7509610E737
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 10:20:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A9AE24E4105C;
 Wed, 25 Feb 2026 10:20:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 79C815FDE5;
 Wed, 25 Feb 2026 10:20:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 944C210369219; Wed, 25 Feb 2026 11:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772014805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IJumvMoUNUES9cntvrKtp5dM5a80UdZrtZGbAz5nJGI=;
 b=M549RjQoZS81TW1S8Nc/x2vfojjYYIeXyU8S5wUnYSkFqpk6THAy5uCoMe8eZmiD45bryI
 ga9Mr/UBm8qzlX/p1IQf6YvTGzBG4PUMOuMZJFYYEAnxFMZNkUuSyF2EaJKl0jD24/RThW
 5y5VQVZsHKIPZzr/6vkDlBt6EJs3X/kImv/P67nM2cBsVfJW936JWqBaOPuY2cYOH2rVeA
 b2Dyx/2B4srKzjwEdYGhz3xIJ5nFlRgxO/8T44FP9xGmIauonxXtc1WzGuqINRWDH//iey
 MKVyXX5586NzXR+IWxrnO6kV2PB56vpzsT9MWGEo+Er2ARlUdY3vI97M6XMe/A==
Date: Wed, 25 Feb 2026 11:20:02 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 41/48] lib/igt_dp: Create generic helpers for
 DP information
Message-ID: <20260225112002.20ac9158@kmaincent-XPS-13-7390>
In-Reply-To: <848b0604-01e1-4d24-a53b-b7e6c5e9a2f5@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-41-73dc9143c8c1@bootlin.com>
 <20260223165631.4e296595@kmaincent-XPS-13-7390>
 <848b0604-01e1-4d24-a53b-b7e6c5e9a2f5@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed, 25 Feb 2026 11:00:27 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> On 2/23/26 16:56, Kory Maincent wrote:
> > On Mon, 23 Feb 2026 13:09:48 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> >> With the introduction of unigraf tests, there is no reason to limit the
> >> implementation to intel. Create easly extendable generic functions to
> >> help supporting multiple GPU.
> >>
> >> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >> ---
> >>   lib/igt_dp.c    | 177
> >> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ lib/igt_dp.h =
   |
> >> 30 ++++++++++ lib/meson.build |   1 +
> >>   3 files changed, 208 insertions(+)
> >>
> >> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> >> new file mode 100644
> >> index 000000000000..0920a43af5e9
> >> --- /dev/null
> >> +++ b/lib/igt_dp.c
> >> @@ -0,0 +1,177 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright =C2=A9 2026 Google
> >> + *
> >> + * Authors:
> >> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> >> + */
> >> +
> >> +#include "drmtest.h"
> >> +#include "i915/i915_dp.h"
> >> +#include "igt_amd.h" =20
> >=20
> > I think this header is useless, there is no amd function call here.
> >  =20
> >> +#include "igt_core.h"
> >> +#include "igt_kms.h"
> >> +#include <stdint.h>
> >> +#include "igt_dp.h" =20
> >=20
> > stdint include should be at the top.
> > We often put system header before local header.
> >  =20
> >> +
> >> +/**
> >> + * igt_dp_get_current_link_rate: Get current link rate on a display p=
ort
> >> + * @drm_fd: DRM file descriptor
> >> + * @output: igt_output_t object representing the display port
> >> + *
> >> + * Returns:
> >> + * The current link rate in kb/s, or a negative error code on failure.
> >> + */
> >> +int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output)
> >> +{
> >> +	if (is_intel_device(drm_fd))
> >> +		/*
> >> +		 * i915_dp_get_current_link_rate returns the value in tens
> >> of kb/s because
> >> +		 * that what the kernel uses. Convert it to kb/s to have a
> >> sane unit...
> >> +		 */
> >> +		return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> >> +
> >> +	igt_assert_f(false, "Current drm device is not able to report used
> >> link rate\n");
> >> +	return -EINVAL;
> >> +} =20
> >=20
> > I usually do the other way around:
> > if (!is_intel_device(...)) {
> > 	igt_assert(...);
> > 	return -EINVAL
> > }
> >=20
> > return i915_dp_get_current_link_rate(drm_fd, output) * 10;
> >=20
> > but well that's only my coding style I am also ok with that. =20
>=20
> The goal is to be able to easly add amd, qualcom, whatever like this:
>=20
> if (is_intel())
> 	return intel_...
> if (is_amd())
> 	return amd_...

Oh ok legit.
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
