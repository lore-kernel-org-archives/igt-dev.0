Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0DC3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 07:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A110E4F2;
	Tue, 30 Jul 2024 07:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIA+LdKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25BF10E4F1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722326335; x=1753862335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YHHuD6mgmFeufk1gjoDwko1xBC+dOL90BXpRvF7/5kQ=;
 b=lIA+LdKQ0IyNgnjhdXnTggAw7i4je2XI6NdLu1pyVRnbKejzpwzx7DPJ
 cgVpsXsZFcPBYCoFKFyzhQWgBoWwmUPtLdceWHnrqBN8aV483AWCQ/+ZV
 LYhISH5gih1eVIuHdNmmv1SgwSkL5FmkV4CsxrgXbgfTnaithw2k65eyC
 9OYXeaKL3G117Yw+9R7799KfvUHVh2iy7NzlNZR7l0nLeZWOtvZEOiA1F
 SRu7vrI7ahdbvnG77P1UQkYMY/6cf0v9lT7K/ldVwVxQm0vT4QvguXuOT
 8ZHSB+jJ2i4LaOHT3qmuS1ZZp/7QZ9W+fvHg/7KXVm/lYE9/ay8J1FTMb Q==;
X-CSE-ConnectionGUID: mCunGJv2Se+8kHn56kaFkg==
X-CSE-MsgGUID: jh47Tb+wQmij/19mFmx8xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37635306"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37635306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 00:58:55 -0700
X-CSE-ConnectionGUID: 6YXVhJ53Txi41+pF5s155w==
X-CSE-MsgGUID: igtxgHhcS0KAh8TqIV2P+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85205523"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 00:58:51 -0700
Date: Tue, 30 Jul 2024 09:58:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH 01/66] tests/xe_eudebug: Test eudebug connection
Message-ID: <20240730075849.bkczbam2uyaidwx3@zkempczy-mobl2>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
 <20240729160159.37036-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240729160159.37036-2-christoph.manszewski@intel.com>
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

On Mon, Jul 29, 2024 at 06:00:54PM +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Add basic tests checking xe eudebug connection capability.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 115 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +
>  2 files changed, 116 insertions(+)
>  create mode 100644 tests/intel/xe_eudebug.c
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> new file mode 100644
> index 000000000..2bd5a44f9
> --- /dev/null
> +++ b/tests/intel/xe_eudebug.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <xe_drm.h>
> +#include "igt.h"
> +
> +static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *param)
> +{
> +	int ret = 0;
> +
> +	*debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, param);

On first glance it looks it won't compile at this point.

Christoph, may you reorder patches to make sure all of them
will compile in the series?

--
Zbigniew

> +
> +	if (*debugfd < 0) {
> +		ret = -errno;
> +		igt_assume(ret != 0);
> +	}
> +
> +	errno = 0;
> +	return ret;
> +}
> +
> +static void test_connect(int fd)
> +{
> +	struct drm_xe_eudebug_connect param = {};
> +	int debugfd, ret;
> +	pid_t *pid;
> +
> +	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
> +		   MAP_SHARED | MAP_ANON, -1, 0);
> +
> +	/* get fresh unrelated pid */
> +	igt_fork(child, 1)
> +		*pid = getpid();
> +
> +	igt_waitchildren();
> +	param.pid = *pid;
> +	munmap(pid, sizeof(pid_t));
> +
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert(debugfd == -1);
> +	igt_assert_eq(ret, param.pid ? -ENOENT : -EINVAL);
> +
> +	param.pid = 0;
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert(debugfd == -1);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	param.pid = getpid();
> +	param.version = -1;
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert(debugfd == -1);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	param.version = 0;
> +	param.flags = ~0;
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert(debugfd == -1);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	param.flags = 0;
> +	param.extensions = ~0;
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert(debugfd == -1);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	param.extensions = 0;
> +	ret = __debug_connect(fd, &debugfd, &param);
> +	igt_assert_neq(debugfd, -1);
> +	igt_assert_eq(ret, 0);
> +
> +	close(debugfd);
> +}
> +
> +static void test_close(int fd)
> +{
> +	struct drm_xe_eudebug_connect param = { 0,  };
> +	int debug_fd1, debug_fd2;
> +	int fd2;
> +
> +	param.pid = getpid();
> +
> +	igt_assert_eq(__debug_connect(fd, &debug_fd1, &param), 0);
> +	igt_assert(debug_fd1 >= 0);
> +	igt_assert_eq(__debug_connect(fd, &debug_fd2, &param), -EBUSY);
> +	igt_assert_eq(debug_fd2, -1);
> +
> +	close(debug_fd1);
> +	fd2 = drm_open_driver(DRIVER_XE);
> +
> +	igt_assert_eq(__debug_connect(fd2, &debug_fd2, &param), 0);
> +	igt_assert(debug_fd2 >= 0);
> +	close(fd2);
> +	close(debug_fd2);
> +	close(debug_fd1);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest("basic-connect")
> +		test_connect(fd);
> +
> +	igt_subtest("basic-close")
> +		test_close(fd);
> +
> +	igt_fixture
> +		drm_close_driver(fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e649466be..35bf8ed35 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -279,6 +279,7 @@ intel_xe_progs = [
>  	'xe_dma_buf_sync',
>  	'xe_debugfs',
>  	'xe_drm_fdinfo',
> +	'xe_eudebug',
>  	'xe_evict',
>  	'xe_evict_ccs',
>  	'xe_exec_atomic',
> -- 
> 2.34.1
> 
