Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A862BC61DE2
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 08:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD610E75A;
	Mon, 31 Aug 2026 08:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0/oFqYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FD810E75A
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165840; x=1819701840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7qWSnc1uII+sUFiiVXmhxKPAf3lLGV9kifd5iLlhGJQ=;
 b=M0/oFqYLyJZUOlL1s82N+4JLCJCZu8u4XBnMOYpaUCObFeES9JlQsTSs
 2nx8MISgaNEyPyn1+X3RiHBO2uo5yq5vGRVX1/S9r7p1eb29vzV5gFpk/
 c1ca8CZrCNUs3KRtPIPzY4I1mKGTvyKMjQNDDLTVMTe1vij41WBbSKhS8
 J5JTMi8hgugUI7xluH0kccuEy1wdI73GPm5E98oovtfRHc0hmjZtv923K
 QsElsH3B+P/fW2YYgv6X7XF2QP5kQpOeIbpBjytcfooghHN5qEFcBs6R/
 4hL9n1yNdTBahLqc8O4Y74JdQUhQoqY6AGfLEkAe5lv69Hr4Ek1z8tKaB w==;
X-CSE-ConnectionGUID: bqC/lDAJQt6Mjqi2DhRzlQ==
X-CSE-MsgGUID: rUgjLYcmRXiOPmFHEG8IqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88617585"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88617585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:44:00 -0700
X-CSE-ConnectionGUID: /tbmZ6RjSk+kbM0sQyUDfg==
X-CSE-MsgGUID: /9asJYI+QeKMSNauKBEu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="298649703"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:43:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, Ravi Kishore Koppuravuri
 <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v3 01/10] drm-uapi/drm_ras: Add DRM RAS UAPI header
In-Reply-To: <20260824164133.129138-2-ravi.kishore.koppuravuri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-2-ravi.kishore.koppuravuri@intel.com>
Date: Mon, 31 Aug 2026 11:43:54 +0300
Message-ID: <e29de94974d952890fce66c13536a914670fb1f5@intel.com>
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
> Add the DRM RAS UAPI header to IGT, defining the Generic Netlink
> commands, attributes, and multicast group identifiers used by the
> DRM RAS interface.

I presume this is a verbatim copy of the file in kernel. Please
reference the kernel commit where this is picked up from i.e. the last
commit that modified the file in kernel.

>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.c=
om>
> ---
>  include/drm-uapi/drm_ras.h | 67 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 include/drm-uapi/drm_ras.h
>
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..099978187
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, =
which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER =3D 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID =3D 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX =3D (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID =3D 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX =3D (__DRM_RAS_A_ERROR_COUNTER_ATTRS_=
MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME =3D 1,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX =3D (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX =
- 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES =3D 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_ERROR_EVENT,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX =3D (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#define DRM_RAS_MCGRP_ERROR_NOTIFY	"error-notify"
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */

--=20
Jani Nikula, Intel
