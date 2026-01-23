Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3E9D77899
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EB510EB85;
	Fri, 23 Jan 2026 17:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0E3wqA5n";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D5410EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:38:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 42E784E42225;
 Fri, 23 Jan 2026 17:38:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 112086070A;
 Fri, 23 Jan 2026 17:38:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A269119A80FC; Fri, 23 Jan 2026 18:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769189924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xTpm7s6MYGfFpEpAmebB/qI5d2a5E+Wqwg3KZ/vlPRs=;
 b=0E3wqA5nrKjmmIrACduTe4tm4gtcPeVDpHPhW3L6GX01Uhpg/aG1MCe2gifXmiJNFHFPTB
 muEIgdhS9h4L4z1o9fpGYCJbAXtXgEnhjLwn28/jdQvPdGw2HpMDNOYwwViPbq1zV2T7mv
 356BtzE1/aH6bqz6pOq/THJqTcrgdLacyigs2V9jacZdVDu5CjEscE6Dr0vuPA7GO1vJYE
 /xPpTGYEkZgrVegj83bje83BodRAGGTaOwcA30PA7D5asbRaanG1Mv6aNym/DukD0kctTM
 wA3ehjSwgd3VNIdVkLsnoW78I40LNDufXEhk9JtNxfxdtsIChPmJ2EdgDmlfCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:38:42 +0100
Message-Id: <DFW5HI2AY4YS.45AAXSPXCPPK@bootlin.com>
Subject: Re: [PATCH i-g-t v4 21/46] lib/unigraf: Introduce device configuration
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-21-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-21-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> As there could be multiple devices detected by libTSI, add a configuratio=
n
> field to ensure that igt will use the proper unigraf device.
>
> The unigraf integration will search for a [Unigraf] entry containing a
> Device=3D
>
> For example, it can look like:
>
> [Unigraf]
> Device=3DUCD-500 [2434C620]
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/unigraf.c | 76 +++++++++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 69 insertions(+), 7 deletions(-)
>
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 55c3c445fa5e..304567467b27 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -1,21 +1,16 @@
>  // SPDX-License-Identifier: MIT
>
> -#include "drmtest.h"
>  #include "glib.h"
>  #include "igt_core.h"
> -#include "igt_edid.h"
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <string.h>
>  #include <time.h>
>
>  #include "unigraf.h"
> -#include "TSI.h"
>  #include "TSI_types.h"
> -#include "igt_kms.h"
> -#include "igt_pipe_crc.h"
> +#include "TSI.h"
>  #include "igt_rc.h"
> -#include "monitor_edids/monitor_edids_helper.h"

Why all these removals? Perhaps you should not include them in the first
place in patch 19?

>
>  #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device=
, ##__VA_ARGS__)
>
> @@ -24,6 +19,19 @@ static TSI_HANDLE unigraf_device;
>  static char *unigraf_default_edid;
>  static char *unigraf_connector_name;
>
> +/**
> + * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration=
 file
> + */
> +#define UNIGRAF_CONFIG_GROUP "Unigraf"
> +/**
> + * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configurat=
ion file
> + */
> +#define UNIGRAF_CONFIG_DEVICE_NAME "Device"
> +/**
> + * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
> + */
> +#define UNIGRAF_NAME_MAX 1024

In the next patch you move this define on top. Just define it on top here
and avoid moving it around later.

Otherwise LGTM.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
