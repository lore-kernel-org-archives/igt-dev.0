Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82425C61DE2
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 08:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA7910E766;
	Mon, 31 Aug 2026 08:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLYf9pkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178BD10E75A
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165996; x=1819701996;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bXQ9XxrTmJAWxTxn8FL6ijr/GFOv9TbEG4Hq7gMK5dE=;
 b=FLYf9pkwDTuVW9VvTxWnJsOtyq3octYG/w5m4IXKn20hb7gGy3JYORE6
 spgi+RkAuWfzhr1JE1cH2TWHQFdj/ZTVEqtVreWIA6Qb4qB8dlyq1Ifei
 Fx64U17QaVFxX7hJkgZhHpt1Tmm4IxjnL7o0fqzOHc/eehGZ5SRIj93wi
 qZ9NZ+ENXrUJa+kO7gSsy9Vvp6TcKv0o1TdJWjAmjzZSkQDuq2nu7Fjky
 G3mm8paO+5kEiWW6iOIZnuFkXPpQgl0JGZi58hFSpWq3wDk6liX1NcPhA
 UvmBU+W8sgcnP3DhHbWHVpNL/AWHFJmSNevH/IIdhb4daWUfWQ5aBWKYU A==;
X-CSE-ConnectionGUID: jNadfal0Teiz30jRzkljUw==
X-CSE-MsgGUID: nWYV8pyTS52YfwTYx7uMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88495271"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88495271"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:46:36 -0700
X-CSE-ConnectionGUID: +uIOf5QoTRatSP45IVI2cg==
X-CSE-MsgGUID: X5EdrHBnQvK0DaT2m0KeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270664870"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:46:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v3 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
In-Reply-To: <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
Date: Mon, 31 Aug 2026 11:46:30 +0300
Message-ID: <c9b431c59949a9499d79e166886413591de113e4@intel.com>
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

On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@int=
el.com> wrote:
> Introduce an IGT library for communicating with DRM RAS Generic Netlink
> interface. Add helpers for Generic Netlink socket initialization and
> cleanup.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.c=
om>
> ---
>  lib/igt_drm_netlink.c | 60 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.h | 25 ++++++++++++++++++
>  lib/meson.build       |  1 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 lib/igt_drm_netlink.c
>  create mode 100644 lib/igt_drm_netlink.h
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> new file mode 100644
> index 000000000..fec1639b4
> --- /dev/null
> +++ b/lib/igt_drm_netlink.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <netlink/errno.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/genl/genl.h>
> +#include <netlink/netlink.h>
> +
> +#include "igt_core.h"
> +#include "igt_drm_netlink.h"
> +
> +void igt_cleanup_nl_socket(struct app_context *ctx)
> +{
> +	if (!ctx || !ctx->sock)
> +		return;
> +
> +	nl_close(ctx->sock);
> +	nl_socket_free(ctx->sock);
> +	ctx->sock =3D NULL;
> +	ctx->family_id =3D -1;
> +
> +	igt_debug("Cleaned up netlink socket.\n");
> +}
> +
> +int igt_init_nl_socket(struct app_context *ctx)
> +{
> +	ctx->sock =3D nl_socket_alloc();
> +	if (!ctx->sock)
> +		return -1;
> +
> +	igt_debug("Socket allocation successful. Connecting to Generic Netlink.=
..\n");
> +	if (genl_connect(ctx->sock) < 0) {
> +		igt_cleanup_nl_socket(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_=
NAME);
> +	ctx->family_id =3D genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> +	if (ctx->family_id < 0) {
> +		fprintf(stderr,
> +			"Failed to resolve Generic Netlink family '%s': %s. "
> +			"This may mean the running kernel does not expose DRM RAS support.\n",
> +			DRM_RAS_FAMILY_NAME,
> +			nl_geterror(ctx->family_id));
> +		igt_cleanup_nl_socket(ctx);
> +		return -1;
> +	}
> +
> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> new file mode 100644
> index 000000000..f681a3a81
> --- /dev/null
> +++ b/lib/igt_drm_netlink.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_DRM_NETLINK_H
> +#define IGT_DRM_NETLINK_H
> +
> +#include <stdbool.h>

There are no bools here?

> +#include <stdint.h>

There are no stdints here?

> +
> +#include <netlink/netlink.h>

You could get away with a forward declaration.

> +
> +#include <drm-uapi/drm_ras.h>

You're not using that here.

> +
> +struct app_context {

Why doesn't the name indicate netlink in any way?

> +	struct nl_sock *sock;
> +	int family_id;
> +};
> +
> +void igt_cleanup_nl_socket(struct app_context *ctx);
> +int igt_init_nl_socket(struct app_context *ctx);

IMO "nl" is the wrong place to abbreviate.

> +
> +#endif /* IGT_DRM_NETLINK_H */
> +
> diff --git a/lib/meson.build b/lib/meson.build
> index 7248bbc2d..70da9a4a0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -27,6 +27,7 @@ lib_sources =3D [
>  	'igt_device_scan.c',
>  	'igt_drm_clients.h',
>  	'igt_drm_fdinfo.c',
> +	'igt_drm_netlink.c',
>          'igt_fs.c',
>  	'igt_aux.c',
>  	'igt_dp.c',

--=20
Jani Nikula, Intel
