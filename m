Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF0C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 15:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE9F10E838;
	Wed,  7 May 2025 15:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNOJhC/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2629B10E838
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746632925; x=1778168925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d/KKdQ/FD3RDI2v3VOYwQCmt4eeANAV2hehmQeFYq6I=;
 b=kNOJhC/CxIUQTuA1KfddUxwpTWeSG3LKrfGwzE2RtQbXWldUoLfd4R9T
 5KWyULhYQdCC4AJdQDxKZrYw5z2UCKbuCdtHgXzAZqc0oOkJXeP1soCeG
 ljnkc3Z6BpIauO07dhDDPi8HwTB1PS8IoJxWWLwpsC/OeoA+OuzhOPZUD
 DkkQXvzZ1A+0DsujmhPIt831YbXrfjoc8nTtxHNKAcC2Nr+c4Aa92b1SM
 p2216Kp43nTpRWweSbSbOHuirYrokzZYjCsS0os4aU7+4HrDbw1a4FS/L
 lGA1ZG895XO0SkCm6gq8ii1/TOKBHk5M6FtCSflPJtBDd8j6xWHI5+6SN Q==;
X-CSE-ConnectionGUID: LZGaiBNXSTOd+zdvPAh+bw==
X-CSE-MsgGUID: QmC24yErSV6vi7Zf/4byeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48452824"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48452824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:48:45 -0700
X-CSE-ConnectionGUID: xs6W3ljYTFO1VRukDzzr+w==
X-CSE-MsgGUID: XDbC+8NRS46UyZx7VnW+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="140036912"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:48:42 -0700
Date: Wed, 7 May 2025 17:48:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH i-g-t 4/5] lib/igt_fs: Add helper functions to create and
 remove directories
Message-ID: <20250507154826.3244tppofqatuhsw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-5-riana.tauro@intel.com>
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

Hi Riana,
On 2025-04-22 at 15:26:00 +0530, Riana Tauro wrote:
> Add helper function to create directory and return fd of
> the created directory. Also add a function to remove
> directories. This will be used by configfs
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_fs.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_fs.h |  2 ++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/lib/igt_fs.c b/lib/igt_fs.c
> index f6a2530cd..1fa281315 100644
> --- a/lib/igt_fs.c
> +++ b/lib/igt_fs.c
> @@ -21,8 +21,10 @@
>   * IN THE SOFTWARE.
>   *
>   */
> +#include <sys/stat.h>

This should be places after stdlib.h below.

Regards,
Kamil

>  
>  #include <errno.h>
> +#include <fcntl.h>
>  #include <stdlib.h>
>  #include <unistd.h>
>  
> @@ -94,3 +96,49 @@ ssize_t igt_writen(int fd, const char *buf, size_t len)
>  	} while (total != len);
>  	return total ?: ret;
>  }
> +
> +/**
> + * igt_fs_create_dir: creates and opens directory
> + * @fd: file descriptor of parent directory
> + * @name: name of the directory to create
> + * @mode: permissions for the directory
> + *
> + * creates a directory under parent directory and returns
> + * the fd
> + *
> + * Returns: directory fd on success, -errno otherwise
> + */
> +int igt_fs_create_dir(int fd, const char *name, mode_t mode)
> +{
> +	int ret;
> +	int dirfd;
> +
> +	ret = mkdirat(fd, name, mode);
> +	if (ret)
> +		return -errno;
> +
> +	dirfd = openat(fd, name, O_DIRECTORY);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	return dirfd;
> +}
> +
> +/**
> + * igt_fs_remove_directory: removes directory
> + * @fd: fd of parent directory
> + * @name: name of directory to remove
> + *
> + * removes directory under parent directory
> + *
> + * Returns: 0 on success, -errno otherwise
> + */
> +int igt_fs_remove_dir(int fd, const char *name)
> +{
> +	int ret = unlinkat(fd, name, AT_REMOVEDIR);
> +
> +	if (ret)
> +		return -errno;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_fs.h b/lib/igt_fs.h
> index 84c3fed62..ee3e7593b 100644
> --- a/lib/igt_fs.h
> +++ b/lib/igt_fs.h
> @@ -27,6 +27,8 @@
>  
>  #include <stdio.h>
>  
> +int igt_fs_create_dir(int fd, const char *name, mode_t mode);
> +int igt_fs_remove_dir(int fd, const char *name);
>  ssize_t igt_readn(int fd, char *buf, size_t len);
>  ssize_t igt_writen(int fd, const char *buf, size_t len);
>  
> -- 
> 2.47.1
> 
