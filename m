Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268BAC021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 08:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1210E440;
	Tue, 11 Feb 2025 08:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRGyLHxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5210E440
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739262875; x=1770798875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fu0yNuzQvMMYRjSsXsYlvxr3xLQ97IlNFinO8+ev7s8=;
 b=eRGyLHxsvXTFBFi7J1Kv1fvK3R0DTjZ3qcwHTnTfo4xJyRHC1VEzl6Nv
 KnD4/1HKFWuu+F0HqziCHi8YL3NIpB1DYOpok3yZaXWqACWD6OYE0UinF
 ERCT/Z9uqnjLPBMuetfAp1au/w/IgGXvfiSz52aBnQ2Pa2XwhgLjKZI2E
 pTTsOacX1oJmPh+RVTDLGWgBoJLaDhJrq2+O3dMgGZ9H3Cy4446fYbJoF
 pfm6pZMdU0Y9p4pNyzrZ6EtvV1F/yEII4NvsmbN+UQ0j5iLFX/yKVE0rR
 MEosjaKLNRbfcvd2M8YsZqSQKbu2FG6LqYsHe9XPUeOYpp7GHgqKnXS62 Q==;
X-CSE-ConnectionGUID: 2nwEsPs9Qtu2bOeE39vIrA==
X-CSE-MsgGUID: B4SlipvBSv2mWvfm8ueOUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57281581"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57281581"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 00:34:33 -0800
X-CSE-ConnectionGUID: k3UUlALDR1+oWyqPSa+H+Q==
X-CSE-MsgGUID: yDyKhyhxSkOjpINjX43d+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117638984"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:34:32 -0800
Date: Tue, 11 Feb 2025 09:34:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: add helper for
 MST-related functions
Message-ID: <20250211083412.vzt4pgqoyy4fpjwq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-2-kunal1.joshi@intel.com>
 <3494168b-d8cf-4847-b000-6dd21bc0c68f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3494168b-d8cf-4847-b000-6dd21bc0c68f@intel.com>
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

Hi Nautiyal,,
On 2025-02-11 at 09:27:31 +0530, Nautiyal, Ankit K wrote:
> 

one nit about years in copyrights, see below.

> On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> > Add helper to centralize commonly used MST-related logic.
> > igt_find_all_mst_output_in_topology() enumerates MST outputs
> > that share the same root connector id.
> > 
> > v2: fix docs (Ankit)
> >      change return type to int (Ankit)
> >      split patch (Ankit)
> > 
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >   tests/intel/kms_mst_helper.c | 49 ++++++++++++++++++++++++++++++++++++
> >   tests/intel/kms_mst_helper.h | 15 +++++++++++
> >   2 files changed, 64 insertions(+)
> >   create mode 100644 tests/intel/kms_mst_helper.c
> >   create mode 100644 tests/intel/kms_mst_helper.h
> > 
> > diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> > new file mode 100644
> > index 000000000..fb5aaab77
> > --- /dev/null
> > +++ b/tests/intel/kms_mst_helper.c
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> 
> s/2023/2025
> 

Please do not remove old years, rather add new one(s), imho:

s/ 2023 / 2023-2025 /

Regards,
Kamil

> 
> > + */
> > +
> > +#include "kms_mst_helper.h"
> > +
> > +/*
> > + * @drm_fd: DRM file descriptor
> > + * @display: pointer to #igt_display_t structure
> > + * @output: target output
> > + * @mst_outputs: filled with mst output of same toplogy as @output
> > + * @num_mst_outputs: filled with count of mst outputs found in topology
> > + *
> > + * Iterates over all connected outputs and adds each DP MST
> > + * output that shares the same MST connector ID as @output
> > + * into @mst_outputs.
> > + *
> > + * Returns: 0 on success, -1 on failure
> 
> Just return the ERROR code.
> 
> 
> > + */
> > +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> > +					 igt_output_t *output,
> > +					 igt_output_t *mst_outputs[],
> > +					 int *num_mst_outputs)
> > +{
> > +	int output_root_id, root_id;
> > +	igt_output_t *connector_output;
> > +
> > +	if (!igt_check_output_is_dp_mst(output))
> > +		return -1;
> 
> return -EINVAL
> 
> 
> > +
> > +	output_root_id = igt_get_dp_mst_connector_id(output);
> > +	if (output_root_id == -EINVAL)
> > +		return -1;
> 
> return -EINVAL
> 
> 
> > +
> > +	/*
> > +	 * If output is MST, check all other connected output which shares
> > +	 * same path and fill mst_outputs and num_mst_outputs
> > +	 */
> > +	for_each_connected_output(display, connector_output) {
> > +		if (!igt_check_output_is_dp_mst(connector_output))
> > +			continue;
> > +
> > +		root_id = igt_get_dp_mst_connector_id(connector_output);
> > +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> > +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> > +	}
> > +	return 0;
> > +}
> > diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> > new file mode 100644
> > index 000000000..637ca696e
> > --- /dev/null
> > +++ b/tests/intel/kms_mst_helper.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> 
> s/2023/2025
> 
> 
> Regards,
> 
> Ankit
> 
> > + */
> > +
> > +#ifndef KMS_MST_HELPER_H
> > +#define KMS_MST_HELPER_H
> > +
> > +#include "igt.h"
> > +
> > +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> > +					 igt_output_t *output,
> > +					 igt_output_t *mst_outputs[],
> > +					 int *num_mst_outputs);
> > +#endif
