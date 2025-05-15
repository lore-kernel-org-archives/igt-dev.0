Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CD7C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 08:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DAB10E7C9;
	Thu, 15 May 2025 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsTyanQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413D610E7C9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747299125; x=1778835125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1snWNps5JpK2g76DF3nImjq174BDw1gjY1gEaBKVCpQ=;
 b=FsTyanQBmYob3bKO6fYCOEGDhC4XPs0Ip+EbNePVgrTcVddtK9QcKRQJ
 DHAFWwbiL4t66bK4rDW4dQphcPkSSSgT3+QhokPsCF45ao8CImqm/fO6e
 1dWU67a97/D2LXvDloDINH3Y83+0Dw0wYUpmv2SRJKGe1LPewFy9a5wy1
 zaD2UdQw+Tx88utUGKZBEGpv6FR7fXBw2qTA81bX9vITvrMLFGQQUP+Cf
 HrGbX5ildOGZigLqIGx17/6J8taZqYYwB1isgm0Q3PWVRlD2GTiH8jOgN
 M+73ZhlCs975fg5X1fIMvKMFGvuXipk48fg48/XKGLHGhW1C6pwDeFODR Q==;
X-CSE-ConnectionGUID: DgipXAZMQ1Oyp7dwo6G3fw==
X-CSE-MsgGUID: hzqmpz3+Rdq7deoJhlfxJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49338228"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49338228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:52:02 -0700
X-CSE-ConnectionGUID: 5L3msoT0R8S9NhnZB8GN2w==
X-CSE-MsgGUID: IV1fx1/LSCCBFyrAjxVcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138719171"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:51:58 -0700
Date: Thu, 15 May 2025 10:51:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com, 
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, 
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to
 recursively read all files in a directory
Message-ID: <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250514175140.115033-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514175140.115033-3-peter.senna@linux.intel.com>
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

On Wed, May 14, 2025 at 07:51:34PM +0200, Peter Senna Tschudin wrote:
> Introduces igt_dir_explorer_read_and_discard_all(), a function that
> performs a recursive scan of all files within a directory. Each file is
> read, and its content is discarded.
> 
> This functionality is utilized in the following tests:
> - core_debugfs
> - core_debugfs_display_on_off
> - core_sysfs
> 
> This addition enhances the ability to efficiently handle directory
> traversal and file processing in tests.
> 
> Cc: marcin.bernatowicz@intel.com
> Cc: himanshu.girotra@intel.com
> Cc: aditya.chauhan@intel.com
> Cc: pravalika.gurram@intel.com
> Cc: sai.gowtham.ch@intel.com
> Cc: ramadevi.gandi@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: rodrigo.vivi@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_dir_explorer.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_dir_explorer.h | 10 ++++++
>  lib/meson.build        |  1 +
>  3 files changed, 83 insertions(+)
>  create mode 100644 lib/igt_dir_explorer.c
>  create mode 100644 lib/igt_dir_explorer.h
> 
> diff --git a/lib/igt_dir_explorer.c b/lib/igt_dir_explorer.c
> new file mode 100644
> index 000000000..d47e08535
> --- /dev/null
> +++ b/lib/igt_dir_explorer.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "igt_dir_explorer.h"
> +
> +void igt_dir_explorer_read_and_discard_all(int path_fd, int indent)

Just loose thought - if you're doing recursive directory traversal,
wouldn't be better to pass function (kind of callback) which would be
called for each file/dir entry? I mean single traversal code, and
multiple callbacks for different use cases.

--
Zbigniew

> +{
> +	struct dirent *dirent;
> +	DIR *dir;
> +	char tabs[8];
> +	int i;
> +
> +	igt_assert(indent < sizeof(tabs) - 1);
> +
> +	for (i = 0; i < indent; i++)
> +		tabs[i] = '\t';
> +	tabs[i] = '\0';
> +
> +	dir = fdopendir(path_fd);
> +	if (!dir)
> +		return;
> +
> +	while ((dirent = readdir(dir))) {
> +		if (!strcmp(dirent->d_name, ".") ||
> +		    !strcmp(dirent->d_name, ".."))
> +			continue;
> +
> +		if (dirent->d_type == DT_DIR) {
> +			int sub_fd;
> +
> +			sub_fd = openat(path_fd, dirent->d_name,
> +					O_RDONLY | O_DIRECTORY);
> +			if (sub_fd < 0)
> +				continue;
> +
> +			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
> +			igt_dir_explorer_read_and_discard_all(sub_fd, indent + 1);
> +			close(sub_fd);
> +		} else if (dirent->d_type == DT_REG) {
> +			char buf[512];
> +			int sub_fd;
> +			ssize_t ret;
> +
> +			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
> +			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
> +
> +			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
> +			if (sub_fd == -1) {
> +				igt_debug("%sCould not open file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +				continue;
> +			}
> +
> +			do {
> +				ret = read(sub_fd, buf, sizeof(buf));
> +			} while (ret == sizeof(buf));
> +
> +			if (ret == -1)
> +				igt_debug("%sCould not read file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +
> +			close(sub_fd);
> +		}
> +	}
> +	closedir(dir);
> +}
> diff --git a/lib/igt_dir_explorer.h b/lib/igt_dir_explorer.h
> new file mode 100644
> index 000000000..b767928a5
> --- /dev/null
> +++ b/lib/igt_dir_explorer.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef IGT_DIR_EXPLORER_H
> +#define IGT_DIR_EXPLORER_H
> +
> +void igt_dir_explorer_read_and_discard_all(int path_fd, int indent);
> +
> +#endif /* IGT_DIR_EXPLORER_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index b58976a43..f98265100 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -90,6 +90,7 @@ lib_sources = [
>  	'igt_kms.c',
>  	'igt_fb.c',
>  	'igt_core.c',
> +	'igt_dir_explorer.c',
>  	'igt_draw.c',
>  	'igt_list.c',
>  	'igt_map.c',
> -- 
> 2.43.0
> 
