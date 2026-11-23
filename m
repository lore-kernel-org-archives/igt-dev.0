Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2B606A31E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q3n/wVK2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31A610E7D7;
	Mon, 23 Nov 2026 13:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9EC10EC02
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795441582; x=1826977582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nXx/4hlpT7unLWKFo2QJb+wCT/B4lyKw3XfWlOZ/VwQ=;
 b=Q3n/wVK2P5zHWLMjEtzxvm0Is2Tx5iDyuKU/aq05TfapdBrGyCrENkRW
 QSjS1QPv1UHxwMI1/urlvJTEm19dAvDmi+imkiUw7lz62q0ZPvL8zQt14
 ceqw/ZA4jA/FmzbLwu5D5ne4JHw9dL/KrixbKCMtcM3XnXE92eN9v44UL
 JXxialhSWATafZWtGTPkBltfmAgqbWQUTENuuNkuMhUWtSrxXghG/Rdnl
 Bi9oSdEqfVrdLUEg/WhZI4QYuae0kNnb0k2tZAY31asOnZHKpn/gXnlhq
 1pHE3y9Jfno+v6UF89wJP8FYurfOXQO+m3I6llXvXIvsfPwVKcMaMKbut w==;
X-CSE-ConnectionGUID: mAIy85qdRF+A7jMFdnsSUQ==
X-CSE-MsgGUID: HtupdV2hQ6aGPoe8UBn4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4236987"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4236987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:46:19 -0800
X-CSE-ConnectionGUID: 4Y6L2sbKQmeCgLTaSO2MTg==
X-CSE-MsgGUID: jfitxmtCScqsApYlOoF2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11178409"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:46:17 -0800
Date: Mon, 23 Nov 2026 14:46:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/core_debugfs: Create listing while reading
Message-ID: <mqk2npyloe33dujgtextun7yf67gemhmqmmkda6oiuix3pallq@hisdbszgnqlr>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, igt-dev@lists.freedesktop.org
References: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
 <zccetwpjqeumadrgproin6ifvtw7qqprtonamfnn3ddp5s6yzn@a53yhzlkksg2>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zccetwpjqeumadrgproin6ifvtw7qqprtonamfnn3ddp5s6yzn@a53yhzlkksg2>
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

Hi Krzysztof,
On 2026-11-23 at 09:27:41 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> On 2026-11-20 at 19:37:05 +0100, Kamil Konieczny wrote:
> > Create a listing of processed debugfs files while reading them.
> > Debugfs can have some pre-required conditions before reading
> > a node suceedes, so fail only when stat is impossible or no file
> > was present.
> > 
> > v2: add O_NONBLOCK to open, add prefix ok to prints (Kamil)
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/core_debugfs.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
> > index 0e654c3e3..a74d211a7 100644
> > --- a/tests/core_debugfs.c
> > +++ b/tests/core_debugfs.c
> > @@ -3,6 +3,9 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <fcntl.h>
> > +#include <sys/stat.h>
> > +
> >  #include "igt.h"
> >  #include "igt_debugfs.h"
> >  #include "igt_dir.h"
> > @@ -23,6 +26,93 @@
> >  
> >  IGT_TEST_DESCRIPTION("Read entries from debugfs");
> >  
> > +static int not_read_count;
> > +static int ok_count;
> > +static int stat_fails;
> > +
> > +static int read_debugfs(const char *filename, void *data)
> > +{
> > +	struct stat sb;
> > +	ssize_t bytes_read;
> > +	char buf[4096];
> > +	int len;
> > +	int fd;
> > +
> > +	len = data ? to_user_pointer(data) + 1 : 0;
> > +	if (len < 0 || strlen(filename) <= len)
> > +		len = 0;
> > +
> > +	if (lstat(filename, &sb) == -1) {
> > +		igt_info("Stat fails errno=%d %s\n", errno, filename);
> > +		stat_fails++;
> > +
> > +		return 0;
> Zero returns here instead of errors are so that
> igt_dir_process_files() continues the loop, right?
> 

Yes.

> > +	}
> > +
> > +	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> > +		igt_info("ok not a regular file %s\n", filename);
> > +		not_read_count++;
> > +
> > +		return 0;
> > +	}
> > +
> > +	if (!(sb.st_mode & 0444)) {
> > +		igt_info("ok not readable %o %s\n", sb.st_mode & 0777, filename);
> > +		not_read_count++;
> > +
> > +		return 0;
> > +	}
> > +
> > +	fd = open(filename, O_RDONLY | O_NONBLOCK);
> > +	if (fd < 0) {
> > +		igt_info("ok open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> > +		not_read_count++;
> > +
> > +		return 0;
> > +	}
> > +
> > +	bytes_read = read(fd, buf, sizeof(buf) - 1);
> > +	if (bytes_read < 0) {
> > +		igt_info("ok read fails errno=%d %s\n", errno, filename);
> > +		close(fd);
> > +		not_read_count++;
> > +
> > +		return 0;
> > +	}
> > +
> > +	buf[bytes_read] = '\0';
> > +	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> Maybe, "ok read %zd bytes of \t%s\n"?
> 

Good point, I will change it.

> > +	ok_count++;
> > +
> > +	igt_debug("File %s\nData: %s\n", filename + len, buf);
> > +	close(fd);
> > +
> > +	return 0;
> > +}
> > +
> > +static int process_debugfs(int dirfd)
> > +{
> > +	char debugpath[PATH_MAX];
> > +	igt_dir_t *config;
> > +	int ret;
> > +
> > +	ret = igt_dir_get_fd_path(dirfd, debugpath, PATH_MAX - 1);
> > +	igt_assert_f(ret >= 0, "Cannot get path\n");
> > +	igt_info("Reading debugfs files from %s\n", debugpath);
> > +
> > +	config = igt_dir_create(dirfd);
> > +	igt_assert_f(config, "Cannot create dir config\n");
> > +
> > +	igt_dir_scan_dirfd(config, -1);
> You could also add an assert for `config` here.
> 

Ok, 

Regards,
Kamil


> > +
> > +	ret = igt_dir_process_files(config, read_debugfs,
> > +				    from_user_pointer(strlen(debugpath)));
> > +
> > +	igt_dir_destroy(config);
> > +
> > +	return ret;
> > +}
> > +
> >  int igt_main()
> >  {
> >  	int debugfs = -1;
> > @@ -38,7 +128,13 @@ int igt_main()
> >  
> >  	igt_describe("Read all entries from debugfs path.");
> >  	igt_subtest("read-all-entries") {
> > -		igt_dir_process_files_simple(debugfs);
> > +		process_debugfs(debugfs);
> > +		igt_info("Summary: reads=%d stat_fails=%d not_read=%d\n", ok_count,
> > +			 stat_fails,
> > +			 not_read_count);
> > +
> > +		igt_assert_lt(0, ok_count);
> > +		igt_assert_eq(stat_fails, 0);
> >  	}
> >  
> >  	igt_fixture() {
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
