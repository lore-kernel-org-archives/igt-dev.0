Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3867C606A325
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=beji+BCi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C611610E852;
	Fri, 20 Nov 2026 12:24:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635310E75D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795177382; x=1826713382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mgiWSshd3v31b3Sj8kSvY20Eigak0cdbyhQujMFi7ZM=;
 b=beji+BCi9pH/2D2SGV8gv1Z5i58ZbU13d/I2tpdGQb+jNgcBnu+Omq8X
 OA3kaK8S9bDLPrEYsFrz6VZPxlyfRDXUNVE7d5qGPXeBcv+EDHmY468bs
 lajsGBqKA9SruU048R25BwZxSajLACZXl28NGcvzlQEK8Hnz97XqTjEt6
 mupcxoD6aysdf/k6hHPS4TptHO6v1vvzci0iJceN6dHV+4JcQSYs4Soq/
 Kq86I6zeKW6hpkhQkLGrRQCsAElS0GhPAaoR19sjUfsUZ7HoiMDMupLXv
 O+IMUt0b7gjs6815aWNlLbPrpZRdcHvC9h4wc9JDH2HsEGCW/PoC6a9fG A==;
X-CSE-ConnectionGUID: GumCf+D2S82r6eQF48/uRQ==
X-CSE-MsgGUID: Z0LvY5vRTXSY9F3h5D8acQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3937130"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3937130"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:23:02 -0800
X-CSE-ConnectionGUID: DVs9m/U2TJ2EfN/XzXw0oA==
X-CSE-MsgGUID: zYnDZ+hiRQSw25GHILG9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10500344"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:23:00 -0800
Date: Fri, 20 Nov 2026 13:22:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Subject: Re: [PATCH i-g-t] tests/core_sysfs: Fix logic for EIO and other fixes
Message-ID: <eopwehdmdbbe2r3zuo4p45mm4tgcqhp66tewf6eguuwv3la3ze@e3mfi7f2a6sr>
References: <20261119192357.117416-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119192357.117416-1-kamil.konieczny@linux.intel.com>
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

On Thu, Nov 19, 2026 at 08:23:57PM +0100, Kamil Konieczny wrote:
> Fix check for 'power' string in case of EIO and fix fd leaked in
> that code path.
> 
> Check for non-regular file makes redundand check for directory at
> open, so remove it.
> 
> Check also return values from functions and fail early.
> 
> Last fix corrects a typo s/readed/read/.

I've experimented with this a bit and finally I think this test
should handle all known cases (exceptions) in read_sysfs().
Currently it returns 0 for everything so you never know if sth
is changed in sysfs.

So I would add all known cases to read_sysfs() and for rest
return not 0, so you would catch if sth would be wrong in sysfs.

--
Zbigniew

> 
> Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index fdb4e325c..a4dacafe1 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -65,12 +65,6 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	fd = open(filename, O_RDONLY);
>  	if (fd < 0) {
> -		if (errno == EISDIR) {
> -			igt_info("dir %s\n", filename);
> -			not_readed_count++;
> -			return 0; /* dir or link */
> -		}
> -
>  		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
>  		open_fails++;
>  
> @@ -79,15 +73,15 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	bytes_read = read(fd, buf, sizeof(buf) - 1);
>  	if (bytes_read < 0) {
> -		if (errno == EIO && !strstr("/power/", filename)) {
> +		if (errno == EIO && strstr(filename, "/power/")) {
>  			igt_info("power management EIO %s\n", filename);
>  			not_readed_count++;
> -			return 0; /* dir or link */
> +		} else {
> +			igt_info("Read fails errno=%d %s\n", errno, filename);
> +			read_fails++;
>  		}
>  
> -		igt_info("Read fails errno=%d %s\n", errno, filename);
>  		close(fd);
> -		read_fails++;
>  
>  		return 0;
>  	}
> @@ -108,13 +102,15 @@ static int process_sysfs(int dirfd)
>  	igt_dir_t *config;
>  	int ret;
>  
> -	igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
> +	ret = igt_dir_get_fd_path(dirfd, syspath, PATH_MAX - 1);
> +	igt_assert_f(ret >= 0, "Cannot get path\n");
>  	igt_info("Reading sysfs files from %s\n", syspath);
>  
>  	config = igt_dir_create(dirfd);
>  	igt_assert_f(config, "Cannot create dir config\n");
>  
> -	igt_dir_scan_dirfd(config, -1);
> +	ret = igt_dir_scan_dirfd(config, -1);
> +	igt_assert_f(ret >= 0, "Cannot scan dir\n");
>  
>  	ret = igt_dir_process_files(config, read_sysfs,
>  				    from_user_pointer(strlen(syspath)));
> @@ -140,7 +136,7 @@ int igt_main()
>  	igt_describe("Read all entries from sysfs path.");
>  	igt_subtest("read-all-entries") {
>  		process_sysfs(sysfs);
> -		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
> +		igt_info("Summary: reads=%d fails=%d not_read=%d\n", ok_count,
>  			 read_fails + open_fails + stat_fails,
>  			 not_readed_count);
>  
> -- 
> 2.55.0
> 
