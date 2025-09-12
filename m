Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9776CAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 15:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563F610ECA5;
	Fri, 12 Sep 2025 15:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENWLKxWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C35410ECA5
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757692671; x=1789228671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7fIerhoov/lM/kK0yBFIhLW2GQ4pSca5hUdT5/mdyOo=;
 b=ENWLKxWZguGhOphnnusq+iMpW1VbxpykXMLkOIVLyxw4W0QFO77g1/n9
 9o5a9os5gGH0cvSvuDoLHze7Ufv1LSjqasl5qfHG0wf5QjFY7nZNE8qVi
 k8dWHYYyYGBpXkKVNpIzjm73kv59dGqxtA+sAiWtmD1VG+zO9OE+nYn6I
 5FoUouZHncNnVmGp9psihUFunugFB2NbvfqcsJ5tV2AJHyZDefL9WQZMx
 YvT3bINSike/nR9MXGll8AMjXbCbdOeObKpKpb6dWW5cXsVw8PHqmvVzn
 jDpnZ3QTsHdpCgC8N0E87fWDzvuxhAgSalaM9+1MXigPt1hFMUMgz5eYD w==;
X-CSE-ConnectionGUID: f00e3V6mQW27Y1MSteZm+Q==
X-CSE-MsgGUID: iJehsjulQWmDWd9td1iavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="71141464"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71141464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:57:51 -0700
X-CSE-ConnectionGUID: hJIlRx5NQRC5PssJAry6LQ==
X-CSE-MsgGUID: F+dfV8jGSx6FC9HIZaBw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173821678"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 08:57:49 -0700
Date: Fri, 12 Sep 2025 17:57:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_fs: add igt_fs_check_root_perm() helper
Message-ID: <20250912155747.nh5lrtxytg3usunq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
 <20250909130808.54117-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909130808.54117-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-09-09 at 15:08:07 +0200, Peter Senna Tschudin wrote:
> Add igt_fs_check_root_perm() to check that a file is owned by root
> (uid=0, gid=0) and that only the owner has write permissions.
> 
> This will be used for validating the permissions and ownership of files
> where strict root-only write access is required.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_fs.c | 28 ++++++++++++++++++++++++++++
>  lib/igt_fs.h |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/lib/igt_fs.c b/lib/igt_fs.c
> index 8f4d17546..0e408c89b 100644
> --- a/lib/igt_fs.c
> +++ b/lib/igt_fs.c
> @@ -25,6 +25,7 @@
>  #include <fcntl.h>
>  #include <stdlib.h>
>  #include <sys/stat.h>
> +#include <stdbool.h>
>  #include <unistd.h>
>  
>  #include "igt_fs.h"
> @@ -141,3 +142,30 @@ int igt_fs_remove_dir(int fd, const char *name)
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_fs_check_root_perm: Checks if the user and group are root and that
> + *                         only the user can write to the file.
> + * @dirfd: file descriptor of the directory containing the file
> + * @pathname: name of the file to check
> + *
> + * Returns: true if the file is owned by root and only root can write to it.
> + */
> +bool igt_fs_check_root_perm(int dirfd, const char *pathname)
> +{
> +	struct stat st;
> +
> +	if (fstatat(dirfd, pathname, &st, 0))
> +		return false;

This mixes two cases: file do not exist and security checks
later on. imho when there is no file, you should skip this
subtest. As for when it could not exist, my guess would be
when it runs on SRIOV-VF?

+cc Jakub and Marcin
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Regards,
Kamil

> +
> +	if (st.st_uid != 0 || st.st_gid != 0)
> +		return false;
> +
> +	if (st.st_mode & S_IWGRP)
> +		return false;
> +
> +	if (st.st_mode & S_IWOTH)
> +		return false;
> +
> +	return true;
> +}
> diff --git a/lib/igt_fs.h b/lib/igt_fs.h
> index ee3e7593b..ee547c133 100644
> --- a/lib/igt_fs.h
> +++ b/lib/igt_fs.h
> @@ -31,5 +31,6 @@ int igt_fs_create_dir(int fd, const char *name, mode_t mode);
>  int igt_fs_remove_dir(int fd, const char *name);
>  ssize_t igt_readn(int fd, char *buf, size_t len);
>  ssize_t igt_writen(int fd, const char *buf, size_t len);
> +bool igt_fs_check_root_perm(int dirfd, const char *pathname);
>  
>  #endif /* __IGT_FS_H__ */
> -- 
> 2.43.0
> 
