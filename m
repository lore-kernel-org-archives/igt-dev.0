Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA8606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQ3xHQj3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E94A1122B0;
	Thu, 26 Nov 2026 13:21:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A811122B0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699229; x=1827235229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/Xw220uDiyOxxmAjLZ4Kw4btqMMF9r9V0f6wnGSMDnY=;
 b=EQ3xHQj3nJIM1fRBUoSWPdHSjYB/C4i2blcw1r0adJSDR67VJ/sKmzGC
 +0YZSPD54f/U/rUsh2gaLT5rGQlYFgkIWUlKbYQjfAuNEFqmOcP+aHcBu
 lnQYxVvDXizS6eNAmi11Bc0qRePcDYjPIG8D6r96bQacXtqb/nQS5ztQB
 1lVixR5g17raid4LfLTANnJTbVRXnB+kXbfT1KMp2zqitD33zo+aYZXjA
 G31Fq+JDdt9LS5MMfhGwd/nZ5l9ypLtDrW9lBKY1MGGXFcEmn/NirZ/46
 +UcjA6bhJ9LB2QE6IrhRsSw9q4NvICJHM9EI9J8SL/jswjgNdnqwT1L01 w==;
X-CSE-ConnectionGUID: TzzvzMVHQTSDWu20NVRUyQ==
X-CSE-MsgGUID: +zWn9WYzTseCxY2x6D0AZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4513804"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4513804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:20:29 -0800
X-CSE-ConnectionGUID: TkMD/6tkSrKN/6b8/9pCwA==
X-CSE-MsgGUID: nThQaUB/QdSYAM4oyeHX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12426664"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:20:27 -0800
Date: Thu, 26 Nov 2026 14:20:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 2/9] tools/drm_ras: Add a DRM RAS netlink tool
Message-ID: <xq56jebalb3klsplxs4vswsoorh4ccqyceb73ihdwxwe34nh5k@uvqnne6aiduc>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
 <20261124213532.3674338-11-rodrigo.vivi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124213532.3674338-11-rodrigo.vivi@intel.com>
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

Hi Rodrigo,
On 2026-11-24 at 16:35:33 -0500, Rodrigo Vivi wrote:
> List the drm-ras nodes, and show the error counters of a given node:
> 
>   # drm_ras
>   0	0000:03:00.0	correctable-errors	error-counter
>   1	0000:03:00.0	uncorrectable-errors	error-counter
>   # drm_ras -n 0
>   1	core-compute	0
>   2	soc-internal	0
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build |   7 +++
>  2 files changed, 113 insertions(+)
>  create mode 100644 tools/drm_ras.c
> 
> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
> new file mode 100644
> index 000000000..0af1ca919
> --- /dev/null
> +++ b/tools/drm_ras.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <getopt.h>

Add
#include <stdbool.h>

> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "drmtest.h"

Can it be dropped in favor of tools stubs?
Looks like macro ARRAY_SIZE should be moved to some non-test header.

+cc Sebastian Brzezinka <sebastian.brzezinka@intel.com>

> +#include "igt_drm_ras_nl.h"
> +
[cut]

> diff --git a/tools/meson.build b/tools/meson.build
> index 68c31da92..78587ec74 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -38,6 +38,13 @@ foreach prog : tools_progs
>  		   install : true)
>  endforeach
>  
> +if have_libnl
> +	executable('drm_ras', 'drm_ras.c',
> +		   dependencies : [tool_deps, libnl, libnl_genl],
> +		   install_rpath : bindir_rpathdir,
> +		   install : true)
> +endif

You link here tools_deps so no need for full bloat coming from
igt_lib?

ldd build/tools/drm_ras |wc -l
72

For reference see https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/16
IGT command line tools load redundant GUI libraries

Regards,
Kamil

> +
>  executable('igt_stats', 'igt_stats.c',
>  	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
>  	   install_rpath : bindir_rpathdir,
> -- 
> 2.56.0
> 
