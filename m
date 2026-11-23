Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EF606A321
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JPEvYQse
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A742893ED;
	Mon, 23 Nov 2026 09:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2B10E776
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426498; x=1826962498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sVMr6ft1HxgYqF9e+t1HwwEYYiea1gDogiS6E40RXLk=;
 b=JPEvYQseBjSFTXegpOBAzyQIa/gLAT58aZLHe6KFMTbbZDXokycQhrXu
 SUJN0yIl+cAC1V0Cd+NCPN9NXEjp7Xi8tQsZoGQAY2JmU386Vn4TNuYGx
 Rf6e4CZBMXkZkG4ceRo8B0o1HEwsbq2thMci9WcyDLkeuDTWhmbVDRmTm
 BGOLJ2kROhWfY0q4rB16PjAdBtzFOj6zjUFGqpljPPik2OYxtKU2+zXhy
 mmA7NI+K9GbFmf/Z/F9XvEzUW8VpHm7SGniAYbhyGEvqAg1p6HGZnQU0h
 0z5BmDCcLjux4W4TaotquMaR6vtv2ob+NnSl2+1duWnWMQNAXR56glU4z Q==;
X-CSE-ConnectionGUID: i+EU4JGrSKaLyeRNWyKCXg==
X-CSE-MsgGUID: 9kieEl2ISQu86YB33pB3Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4120443"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4120443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:34:57 -0800
X-CSE-ConnectionGUID: SZm6S1SzRZWb+sMnNKkHjQ==
X-CSE-MsgGUID: fTaE2w50ROGENHpwap4xFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11203581"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:34:56 -0800
Date: Mon, 23 Nov 2026 10:34:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/3] tests/core_sysfs: Correct typo
Message-ID: <3ngy37y5yjz6fwqrhqesymam364yjewr5cghhec3xpnqi6yos3@nnhenjtvpmrh>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-3-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120182614.34410-3-kamil.konieczny@linux.intel.com>
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

On Fri, Nov 20, 2026 at 07:26:13PM +0100, Kamil Konieczny wrote:
> Fix typo s/readed/read/.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 99117eea3..8719b4ffe 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -27,7 +27,7 @@
>  
>  IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
>  
> -static int not_readed_count;
> +static int not_read_count;
>  static int ok_count;
>  static int read_fails;
>  static int open_fails;
> @@ -53,13 +53,13 @@ static int read_sysfs(const char *filename, void *data)
>  
>  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
>  		igt_info("Not a regular file %s\n", filename);
> -		not_readed_count++;
> +		not_read_count++;
>  		return 0;
>  	}
>  
>  	if (!(sb.st_mode & 0444)) {
>  		igt_info("Not readable %s\n", filename);
> -		not_readed_count++;
> +		not_read_count++;
>  		return 0;
>  	}
>  
> @@ -75,7 +75,7 @@ static int read_sysfs(const char *filename, void *data)
>  	if (bytes_read < 0) {
>  		if (errno == EIO && strstr(filename, "/power/")) {
>  			igt_info("power management EIO %s\n", filename);
> -			not_readed_count++;
> +			not_read_count++;
>  		} else {
>  			igt_info("Read fails errno=%d %s\n", errno, filename);
>  			read_fails++;
> @@ -136,9 +136,9 @@ int igt_main()
>  	igt_describe("Read all entries from sysfs path.");
>  	igt_subtest("read-all-entries") {
>  		process_sysfs(sysfs);
> -		igt_info("Summary: reads=%d fails=%d not_readed=%d\n", ok_count,
> +		igt_info("Summary: reads=%d fails=%d not_read=%d\n", ok_count,
>  			 read_fails + open_fails + stat_fails,
> -			 not_readed_count);
> +			 not_read_count);
>  
>  		igt_assert_eq(read_fails, 0);
>  		igt_assert_eq(open_fails, 0);
> -- 
> 2.55.0
> 
