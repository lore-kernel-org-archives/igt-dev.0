Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A3C369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 05:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B75610E268;
	Mon,  5 May 2025 05:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvkAr6v9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8766110E268
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 05:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746423351; x=1777959351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yckOm7HARl2+HGCDu9ZtmZPo1fdioUy7Jvu1mEP5KFQ=;
 b=hvkAr6v9bpeR7G+w9iSkJa+CRWDbkCRg1QdCDkN3RYUNJ2zx/O6sUzVU
 WR/Vi71orUDrscw/HlOrZcdaHovLq5Q+CG1sLD0Xr6+WSaAoZuJNpinor
 F6q2n6VijsLwk+aJoTKfQ0eCwjHmFk2mSLMoLwm60sF5IWH5u53Wr2DNR
 ZPPIStfTu7Yq7GI5t/BiiYMvPRSpldNh2Cvn87+AJtIG7CjKrerQKsAxF
 fRxJPwClwQtrWNuRqJqzxYWExE/fEO8KSR5utwqxFJo+hm/tkSskPlfMw
 BGe+dd97+FWvWVtHMn7Q/cjAEBNiu+JRkJ+VjybqnYSc6fxg6cGSISVDQ Q==;
X-CSE-ConnectionGUID: 5x6AGjfpRLKDVkv4IxfJtQ==
X-CSE-MsgGUID: w/eDlJ0+RsK3NXqpK9MZaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="73415059"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="73415059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:50 -0700
X-CSE-ConnectionGUID: Uxg7Ax4rRoa7jEykFDPRjg==
X-CSE-MsgGUID: FyZAB3JESuK6YH0S7ejYZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135081498"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.235.34])
 ([10.247.235.34])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:47 -0700
Message-ID: <ed0f7ca6-debe-4299-ac9e-6c9718683287@linux.intel.com>
Date: Mon, 5 May 2025 11:05:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] lib/igt_fs: Add helper functions to create and
 remove directories
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 louis.chauvet@bootlin.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-5-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250422095602.55041-5-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 22-04-2025 15:26, Riana Tauro wrote:
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

LGTM.

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>  
