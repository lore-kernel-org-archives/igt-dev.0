Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B35606A32C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cW/7iJPW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0152F10E038;
	Wed, 18 Nov 2026 17:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541FC10E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795022283; x=1826558283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tclZYluZlDneErQMmieLDX0crjc8HrgUiKhuXF5l7q8=;
 b=cW/7iJPWPez/OzBd1F9juSD7/8wcCKhieAcdCBcYVK5QEFF4cNUjLL6W
 4x4padN6WioBlOayMb3nPRIYLrZ7cscif3LbRFlPxwIzQwWTd5wZ/TcOu
 GnuD6511vwKtlqXYjqlZPsNJgJcOBwGaqfiW889yodT5PPt5vT53ba/Xs
 cQyx7Z0gi8pkWmMqJ7D1HFHBeN7PXtIwxlk9sy1B3xrQKK2HKcnf1spdn
 lcYuR59V5dVNdlNKZXAchgldl/dy81ena7zOMgWAQw6f7tl/+j8fuApOs
 cu3sq5eS0hE5H/ToByIf5HzNfW0XnIN31p/2cC3ZjYWOpU15hvAuDq81S Q==;
X-CSE-ConnectionGUID: pnBGE1k0R52xLo+O1Vr6SA==
X-CSE-MsgGUID: TzfHt+cIQSeHf24WcpYfBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3835766"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3835766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:18:03 -0800
X-CSE-ConnectionGUID: zseEt/1rQk+11/Y/yFbdSg==
X-CSE-MsgGUID: t8CSAS3mQ82GRGFri8Lrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10078437"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:18:02 -0800
Date: Wed, 18 Nov 2026 18:17:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/core_sysfs: Create listing while reading
Message-ID: <65dzjc2uloiiuc2kscidbseabgg26njtdnika366mfwm674t4l@ne5oeim2n4oc>
References: <20261118150235.76447-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118150235.76447-1-kamil.konieczny@linux.intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 04:02:35PM +0100, Kamil Konieczny wrote:
> Create a lists of sysfs files readed, so it will be easy to
> confirm if all of them are actually read or where is a problem.
> Excerpt from output:
> 
> Opened device: /dev/dri/card1
> Starting subtest: read-all-entries
> Reading sysfs files from /sys/devices/pci0000:00/0000:00:02.0/drm/card1
> ok 2    boot_display
> power management EIO /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-DP-1/power/autosuspend_delay_ms
> Not readable /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-DP-1/i2c-11/delete_device
> Not a regular file /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-DP-1/device
> ok 9    card1-DP-1/power/runtime_enabled
> ok 5    gt/gt0/rps_max_freq_mhz
> ok 54   uevent
> Summary: reads=293 fails=0 not_readed=64
> Subtest read-all-entries: SUCCESS (0.008s)
> 
> v2: added more exceptions (Zbigniew), added summary (Kamil)
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 3173ffa7b..eb2d7c351 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <sys/stat.h>

Adding #include <fcntl.h> solves my compilation issue.

With this line added:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
>  #include "igt.h"
>  #include "igt_dir.h"
>  #include "igt_sysfs.h"
> @@ -24,6 +26,103 @@
>  
>  IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
>  
> +static int not_readed_count;
> +static int ok_count;
> +static int read_fails;
> +static int open_fails;
> +static int stat_fails;
> +
> +static int read_sysfs(const char *filename, void *data)
> +{
> +	struct stat sb;
> +	ssize_t bytes_read;
> +	char buf[4096];
> +	int len;
> +	int fd;
> +
> +	len = data ? to_user_pointer(data) + 1 : 0;
> +	if (strlen(filename) <= len || len < 0)
> +		len = 0;
> +
> +	if (lstat(filename, &sb) == -1) {
> +		igt_info("Stat fails errno=%d %s\n", errno, filename);
> +		stat_fails++;
> +		return 0;
> +	}
> +
> +	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> +		igt_info("Not a regular file %s\n", filename);
> +		not_readed_count++;
> +		return 0;
> +	}
> +
> +	if (!(sb.st_mode & 0444)) {
> +		igt_info("Not readable %s\n", filename);
> +		not_readed_count++;
> +		return 0;
> +	}
> +
> +	fd = open(filename, O_RDONLY);
> +	if (fd < 0) {
> +		if (errno == EISDIR) {
> +			igt_info("dir %s\n", filename);
> +			not_readed_count++;
> +			return 0; /* dir or link */
> +		}
> +
> +		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> +		open_fails++;
> +
> +		return 0;
> +	}
> +
> +	bytes_read = read(fd, buf, sizeof(buf) - 1);
> +	if (bytes_read < 0) {
> +		if (errno == EIO && !strstr("/power/", filename)) {
> +			igt_info("power management EIO %s\n", filename);
> +			not_readed_count++;
> +			return 0; /* dir or link */
> +		}
> +
> +		igt_info("Read fails errno=%d %s\n", errno, filename);
> +		close(fd);
> +		read_fails++;
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
> +static int process_sysfs(int dirfd)
> +{
> +	char syspath[PATH_MAX];
> +	igt_dir_t *config;
> +	int ret;
> +
> +	igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
> +	igt_info("Reading sysfs files from %s\n", syspath);
> +
> +	config = igt_dir_create(dirfd);
> +	igt_assert_f(config, "Cannot create dir config\n");
> +
> +	igt_dir_scan_dirfd(config, -1);
> +
> +	ret = igt_dir_process_files(config, read_sysfs,
> +				    from_user_pointer(strlen(syspath)));
> +
> +	igt_dir_destroy(config);
> +
> +	return ret;
> +}
> +
>  int igt_main()
>  {
>  	int fd = -1;
> @@ -38,8 +137,16 @@ int igt_main()
>  	}
>  
>  	igt_describe("Read all entries from sysfs path.");
> -	igt_subtest("read-all-entries")
> -		igt_dir_process_files_simple(sysfs);
> +	igt_subtest("read-all-entries") {
> +		process_sysfs(sysfs);
> +		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
> +			 read_fails + open_fails + stat_fails,
> +			 not_readed_count);
> +
> +		igt_assert_eq(read_fails, 0);
> +		igt_assert_eq(open_fails, 0);
> +		igt_assert_eq(stat_fails, 0);
> +	}
>  
>  	igt_fixture() {
>  		close(sysfs);
> -- 
> 2.55.0
> 
