Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB1606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bP74QGI1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C052411232E;
	Thu, 29 Oct 2026 14:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614411232E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793283745; x=1824819745;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NUCNnf1o5PM8FE1Dig+3E9F9nit2PhPGluMASNO4aEk=;
 b=bP74QGI1RqCO8DDHCogZYioX1gF0jvdczsGw4TDSrZau3ktfuBBAbAhN
 0tTohDr75pzit+5tNNMfKh75yMG13m/iwoX9jm9jiT9lLkiXjX8FC9nZX
 WfDVehOCfG0BiAqBf9OZEQiq8hz+TX7BDuPYZUVYuO+2u57hCRLr7hMs8
 eU7HDFm1Uuxvtrk4EJZGt+msUVAaiH86Ea0VDubmtqTwRjXqcBaEmg6Dk
 nZisPL+VJhHSuJRE6eKjL1VuFcAaOjguUYazd9ApPtGWsbtgRXebLU2TJ
 jh/w0jhW65IX5DIqUd0STFpwHRAKd3f6tojum+RtXqiE2YAO5sDoD09ZN A==;
X-CSE-ConnectionGUID: uuDRe6qMT7a5fZgjDpEFZA==
X-CSE-MsgGUID: LrAVPYQIRBOy24lMM2yMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1911108"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1911108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:22:25 -0700
X-CSE-ConnectionGUID: 5cYDm7apSCaiiAwdJ4PISQ==
X-CSE-MsgGUID: sI6YgFgfRGSVSy/nGlkH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5286005"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:22:22 -0700
Date: Thu, 29 Oct 2026 15:22:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v6 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Message-ID: <20261029142219.ovl7ffd43vkol5yz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-2-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029085955.1232163-2-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,
On 2026-10-29 at 14:29:46 +0530, Ravi Kishore Koppuravuri wrote:
> Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
> changes:
> 
> b2207d4c4e84 ("drm/ras: Introduce error threshold")
> 6fdbfc75eaa1 ("drm/drm_ras: Add drm_ras netlink error event")
> ee18d39a0877 ("drm/drm_ras: Add clear-error-counter netlink command to
> drm_ras")
> c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over
> generic netlink")
> 
+cc Karthik and Swati
Karthik B S <karthik.b.s@intel.com>,
Swati Sharma <swati2.sharma@intel.com>

> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> Reviewed-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  include/drm-uapi/drm_ras.h | 67 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 include/drm-uapi/drm_ras.h
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..6b504faeb
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */

The header in kernel is different, for bringing drm UAPI header
please use procedure described in IGT README.md

$ make INSTALL_HDR_PATH=<dest-dir> headers_install
$ cp <dest-dir>/include/drm/drm_ras.h <igt-dir>/include/drm-uapi/

If there should be Intel copyright, it should be added in proper
place in kernel, as it now reads:

/* Do not edit directly, auto-generated from: */
/*     Documentation/netlink/specs/drm_ras.yaml */
/* YNL-GEN uapi header */
/* To regenerate run: tools/net/ynl/ynl-regen.sh */

> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H

Script will s/_UAPI//

Regards,
Kamil

> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +	DRM_RAS_CMD_ERROR_EVENT,
> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#define DRM_RAS_MCGRP_ERROR_REPORT	"error-report"
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */
> -- 
> 2.34.1
> 
