Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5528606A31E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LNBQ0q04
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5991A10E0C3;
	Mon, 23 Nov 2026 09:38:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84BA10E402
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426641; x=1826962641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JIIozP2F352yq97EP6dXQtD3s82XTbGl8n/R5sdx8tg=;
 b=LNBQ0q04E2exYru48eCoEUVEEz3khE4hZzJn7xLDAO5R7Kpch9jrTpr+
 /yiWZzVByir1Om0qOXxKxGc3FRtLrJ0siQ9oEUrMcx5Fkd1OQ/dKVmxGC
 ciBcxlZz+Ct0PpIi1IX25sjk5Ho+esyCGAShwQaiJsJJRDFxrfUtbr5wB
 Qtth2XWhsijnKTC6afz/z6Gxb/ULUzN8vFl5BSy99zZlpUdSHyBMXekWu
 B3MlyhT90d900Gr/XnogBUqScqsHAC3TQ1y6GIdYARohpf6IKNLbAt5pC
 EdrKX08z8IHeKmS7gaItxguOi90JhgK7iEHBtYUTnUD1fNhwDP6gCYZSZ g==;
X-CSE-ConnectionGUID: earlCUYlSqCI0Yyc9z49ww==
X-CSE-MsgGUID: nULScfwbTtmUobNf66c0Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4207435"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4207435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:37:21 -0800
X-CSE-ConnectionGUID: WjeIUQ0TTeiCGI2j46K2cA==
X-CSE-MsgGUID: C+WRoMkbRLCD52moyjBGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11561535"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:37:19 -0800
Date: Mon, 23 Nov 2026 10:37:18 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_sysfs: Change prints to debug
Message-ID: <m2bafxu6odt3tllya7rzi72fszrdkpuc7ohsrwcsc7zm6qh764@5dgacbskffgt>
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
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

On Fri, Nov 20, 2026 at 07:26:14PM +0100, Kamil Konieczny wrote:
> Instead of printing every name of file read, make printing into
> debug only, reducing normal output.  Keep only one print at the
> beggining of test about a path which will be scanned and a
> summary at the end.
> Also while at this, add 'ok' prefix to those prints which are
> treated as non-errors, for example write-only file.
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 8719b4ffe..f05c8845a 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -46,26 +46,26 @@ static int read_sysfs(const char *filename, void *data)
>  		len = 0;
>  
>  	if (lstat(filename, &sb) == -1) {
> -		igt_info("Stat fails errno=%d %s\n", errno, filename);
> +		igt_debug("Stat fails errno=%d %s\n", errno, filename);
>  		stat_fails++;
>  		return 0;
>  	}
>  
>  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> -		igt_info("Not a regular file %s\n", filename);
> +		igt_debug("ok not a regular file %s\n", filename);

I would probably print with:

	igt_debug("Not a regular file %s, ok.\n", filename);

but that's a minor nit. Definitely igt_debug() is better than igt_info()
here.

Regarless nit:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		not_read_count++;
>  		return 0;
>  	}
>  
>  	if (!(sb.st_mode & 0444)) {
> -		igt_info("Not readable %s\n", filename);
> +		igt_debug("ok not readable %s\n", filename);
>  		not_read_count++;
>  		return 0;
>  	}
>  
>  	fd = open(filename, O_RDONLY);
>  	if (fd < 0) {
> -		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> +		igt_debug("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
>  		open_fails++;
>  
>  		return 0;
> @@ -74,10 +74,10 @@ static int read_sysfs(const char *filename, void *data)
>  	bytes_read = read(fd, buf, sizeof(buf) - 1);
>  	if (bytes_read < 0) {
>  		if (errno == EIO && strstr(filename, "/power/")) {
> -			igt_info("power management EIO %s\n", filename);
> +			igt_debug("ok power management EIO %s\n", filename);
>  			not_read_count++;
>  		} else {
> -			igt_info("Read fails errno=%d %s\n", errno, filename);
> +			igt_debug("Read fails errno=%d %s\n", errno, filename);
>  			read_fails++;
>  		}
>  
> @@ -87,7 +87,7 @@ static int read_sysfs(const char *filename, void *data)
>  	}
>  
>  	buf[bytes_read] = '\0';
> -	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> +	igt_debug("ok %zd\t%s\n", bytes_read, filename + len);
>  	ok_count++;
>  
>  	igt_debug("File %s\nData: %s\n", filename + len, buf);
> -- 
> 2.55.0
> 
