Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78107606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7EUce6G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3237E10E79A;
	Mon, 23 Nov 2026 09:35:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520B10E402
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426480; x=1826962480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rfO7hFCD9RaLe62eD111YJ9dqst8wLf3eBbhLeESn8Y=;
 b=b7EUce6Gya2mbKs5JRXFAkrtFk36OHVKn5bxRT+INf+kDMfLdqSgH2vB
 5F8EVv91lFrb5wx5Bxda5gsIRy7evicHDNRNuWBQr8XJnUkn+NJdara6P
 ArcHS2DXybBiFavo5A/AL/o0GQLkIByvjtBGZkq4eS5zTfztLe9Ins5ls
 FUtfoWxzwhK1nJP6ytLxdngxKxq9y+lmT0HXV6kprgYUy/gVgtgLSVQ+K
 aSXwRBgXFxQ1kNkX0NHMhwu04wpdhH1bwLJbah1Z05pfj9A/u/ndtPg5W
 Ox/S40ytRTIbqK/njkXJXN2hKhDkGi4CIjk3bO2x9TVx8aO5sdWoDHwyO A==;
X-CSE-ConnectionGUID: Fa3hbiJ8TzmDy6hid0uFmA==
X-CSE-MsgGUID: ow9ko845TiOVmVFTt15K6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4136788"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4136788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:34:37 -0800
X-CSE-ConnectionGUID: 1uto6R8XSTivot2KOiQszg==
X-CSE-MsgGUID: V4pIq+vxRyydRw248kXEtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11269864"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:34:35 -0800
Date: Mon, 23 Nov 2026 10:34:34 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/core_sysfs: Fix logic for EIO and
 other fixes
Message-ID: <f2cncpn4t72w237klqj3fphoh4wxpjv56rftpwnsmfsybi3lqh@mbpv4zvonb3w>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-2-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120182614.34410-2-kamil.konieczny@linux.intel.com>
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

On Fri, Nov 20, 2026 at 07:26:12PM +0100, Kamil Konieczny wrote:
> Fix check for 'power' string in case of EIO and fix fd leaked in
> that code path.
> 
> Check for non-regular file makes redundand check for directory at
> open, so remove it.
> 
> Check also return values from functions and fail early.
> 
> Cc: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index fdb4e325c..99117eea3 100644
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

Uhm, previous was always true in !strstr(). Good catch.

For this patch:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

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
> -- 
> 2.55.0
> 
