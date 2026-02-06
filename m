Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8609FEE20AC
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 15:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9FB10E0AB;
	Fri,  6 Feb 2026 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hcn7BCPe";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2153610E0AB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:01:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DF2964E4243B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 15:01:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A176D60729;
 Fri,  6 Feb 2026 15:01:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8770119D0E1E; Fri,  6 Feb 2026 16:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770390063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/MD+jDxvYeNuCCiykQBtSECvaax77rPrDjHL0tYHvrg=;
 b=hcn7BCPeKxxrgtVuFBcXNE3hyAH9/M7dTDTS4GgYQBloCBD1GtpjAMzyHznp8r/VlfTSq0
 EJ0Wb9AmeDmEakIQqO64c53BJW1a9/+NChQIlSExMiZdLGOtsdgzhtyJBN77dUuAUMwDiF
 YbsiAqEIVpESNqlLctl/hi5xsdecAqhEblyQkpRqHsnpzGN51K0J7gNfjZJK1yTQsQiK+5
 wlPJnfex3Zjt/3fAZMxfefzNMcGER6WVGHpzmdEPDVephPoBD/f1aN7EayqNmHRTmKD1cA
 +efISxIqG+XTCz3gW2L4BKQTdlgJkDXRYVBXRw0x6kA1JHZzxpQg0qPXG9IhYg==
Date: Fri, 6 Feb 2026 16:00:56 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 36/48] lib/i915/dp: Move DP-related function
 for i915 to proper folder
Message-ID: <20260206160056.547a4fa4@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-36-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-36-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:15 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some functions, prefixed with igt_ are not generic but specific to the
> i915 intel driver. To avoid confusion and allows the introduction of
> generic helpers, move those to a dedicated file.

It seems there is only code move here.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/i915/i915_dp.c                      | 318
> ++++++++++++++++++++++++++++++++ lib/i915/i915_dp.h                      |
> 22 +++ lib/igt_kms.c                           | 310
> ------------------------------- lib/igt_kms.h                           |=
  13
> -- lib/meson.build                         |   1 +
>  tests/intel/kms_dp_link_training.c      |   1 +
>  tests/intel/kms_dp_linktrain_fallback.c |   1 +
>  7 files changed, 343 insertions(+), 323 deletions(-)
>=20
> diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
> new file mode 100644
> index 000000000000..6cb212f20b1b
> --- /dev/null
> +++ b/lib/i915/i915_dp.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: MIT

You dropped the original copyrights and authors of lib/igt_kms.c.
As it comes from their code I think you have copy it as well.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
