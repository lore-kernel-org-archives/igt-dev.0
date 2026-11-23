Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86898606A321
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xg8tpav5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61210EE84;
	Mon, 23 Nov 2026 14:31:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DACB10EE75
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795444193; x=1826980193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EduZK4hVpmbyDi82GDXY0E/zm97DL04/gKhfnvEYPfQ=;
 b=Xg8tpav5lj5zksNr53hI4TkisV/BSqAw+D5ftFK0ioyg0+eG+dU+5chx
 ltJ+rASw7HJwlbbj8MxclhOtfrvj2FOfn4hRepFUofW2Vm6Kx3xMH2sPN
 qbnJnFl8NyQBaeRf7AvWBXvW0xywKS2jee7x0dJNa5sBtshjoJ8Y/2S1H
 XNG2sf7y5pkySYqRBY5fcrkNZ/PzBJtmJO5EdrVOGzIbioeMu5JADgxUC
 rM3uhRwVbhKBjsTTD00Vm4/NCuS3/fmBSyyCzshMzK4NoshjQMEvtqkmd
 D3WK3zJFoa4b+Bzg27Eui7Lmj0CPFhRSn3vNBxxruoiLZea9e5LxBcxq5 Q==;
X-CSE-ConnectionGUID: TskEEoHGSlmkStgkRjTYkA==
X-CSE-MsgGUID: tTZATmFrQw6GrBWvuBdr+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4268961"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4268961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:29:52 -0800
X-CSE-ConnectionGUID: SKAasd1tQMi821jdyll2Vg==
X-CSE-MsgGUID: mquL3UF7T4WNyM0A5KQ2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11505307"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:29:51 -0800
Date: Mon, 23 Nov 2026 15:29:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/core_debugfs: Create listing while reading
Message-ID: <xjdsvmveg6xyxxy5ga4sga7sp3zywyu2u7676exuvfz2uo67cb@w3xjgr4ft6gr>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
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

Hi igt-dev,
On 2026-11-20 at 19:37:05 +0100, Kamil Konieczny wrote:
> Create a listing of processed debugfs files while reading them.
> Debugfs can have some pre-required conditions before reading
> a node suceedes, so fail only when stat is impossible or no file
> was present.
> 
> v2: add O_NONBLOCK to open, add prefix ok to prints (Kamil)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+cc
Piotr Piórkowski <piotr.piorkowski@intel.com>
Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>  tests/core_debugfs.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
> index 0e654c3e3..a74d211a7 100644
> --- a/tests/core_debugfs.c
> +++ b/tests/core_debugfs.c
> @@ -3,6 +3,9 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +
>  #include "igt.h"
>  #include "igt_debugfs.h"
>  #include "igt_dir.h"
> @@ -23,6 +26,93 @@
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs");
>  
> +static int not_read_count;
> +static int ok_count;
> +static int stat_fails;
> +
> +static int read_debugfs(const char *filename, void *data)
> +{
> +	struct stat sb;
> +	ssize_t bytes_read;
> +	char buf[4096];
> +	int len;
> +	int fd;
> +
> +	len = data ? to_user_pointer(data) + 1 : 0;
> +	if (len < 0 || strlen(filename) <= len)
> +		len = 0;
> +
> +	if (lstat(filename, &sb) == -1) {
> +		igt_info("Stat fails errno=%d %s\n", errno, filename);
> +		stat_fails++;
> +
> +		return 0;
> +	}
> +
> +	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> +		igt_info("ok not a regular file %s\n", filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	if (!(sb.st_mode & 0444)) {
> +		igt_info("ok not readable %o %s\n", sb.st_mode & 0777, filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	fd = open(filename, O_RDONLY | O_NONBLOCK);
> +	if (fd < 0) {
> +		igt_info("ok open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	bytes_read = read(fd, buf, sizeof(buf) - 1);
> +	if (bytes_read < 0) {
> +		igt_info("ok read fails errno=%d %s\n", errno, filename);
> +		close(fd);
> +		not_read_count++;
> +
> +		return 0;
> +	}
> +
> +	buf[bytes_read] = '\0';
> +	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> +	ok_count++;
> +
> +	igt_debug("File %s\nData: %s\n", filename + len, buf);
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +static int process_debugfs(int dirfd)
> +{
> +	char debugpath[PATH_MAX];
> +	igt_dir_t *config;
> +	int ret;
> +
> +	ret = igt_dir_get_fd_path(dirfd, debugpath, PATH_MAX - 1);
> +	igt_assert_f(ret >= 0, "Cannot get path\n");
> +	igt_info("Reading debugfs files from %s\n", debugpath);
> +
> +	config = igt_dir_create(dirfd);
> +	igt_assert_f(config, "Cannot create dir config\n");
> +
> +	igt_dir_scan_dirfd(config, -1);
> +
> +	ret = igt_dir_process_files(config, read_debugfs,
> +				    from_user_pointer(strlen(debugpath)));
> +
> +	igt_dir_destroy(config);
> +
> +	return ret;
> +}
> +
>  int igt_main()
>  {
>  	int debugfs = -1;
> @@ -38,7 +128,13 @@ int igt_main()
>  
>  	igt_describe("Read all entries from debugfs path.");
>  	igt_subtest("read-all-entries") {
> -		igt_dir_process_files_simple(debugfs);
> +		process_debugfs(debugfs);
> +		igt_info("Summary: reads=%d stat_fails=%d not_read=%d\n", ok_count,
> +			 stat_fails,
> +			 not_read_count);
> +
> +		igt_assert_lt(0, ok_count);
> +		igt_assert_eq(stat_fails, 0);
>  	}
>  
>  	igt_fixture() {
> -- 
> 2.55.0
> 
