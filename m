Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ACCCA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 12:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C3D10E0C1;
	Thu,  1 Oct 2026 12:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hScx9nBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48D10F63C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790856382; x=1822392382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IUCHI/sDau+JsaPo9D8dxoz5g5JDY4/OpGRj7DF87Ho=;
 b=hScx9nBwxqSfB8qJ9w98Bdu+Cmuw3JtX8NFXhpJWVncl6PYVl9rIxG88
 lgNfxwxGwdTJLuwQ6oQQ2YKOJQUwATaJKA6Td3F/kqTRD2tDP7MUEKPel
 1SrsFvTZD/YrJ3TZUh0uO/cx8La+qjagoVDuZ+6ZVgx0iS29QgMh65Kmy
 52eMLBwwMVnfX8sNKBMWDQcrub8K7KzbQWM6X8IMI6fEKTTa+jS1WHb4K
 vDq9+UXK0pya0nw0prZ1S+dUErR6kGDd3HoKiNSE+bbSJN4H/XtHvjH1G
 EHTdmuH0sI9qwKBKu7K/4y/hMkIwpg4/3zYlOEGwGLxlrWvz3Tl/kKKgT A==;
X-CSE-ConnectionGUID: lV5/0V8SQLuh74tpZxzLlg==
X-CSE-MsgGUID: NiZl3p3EQcCp4eUu7e6rhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90511248"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90511248"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:06:22 -0700
X-CSE-ConnectionGUID: w/tXxl1iTduKYE5NfZu4uA==
X-CSE-MsgGUID: ByF47uKnSUO6R1CRQWGgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279758273"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:06:22 -0700
Date: Thu, 1 Oct 2026 14:06:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_core: Don't rely on debugfs for tracefs
 access
Message-ID: <20261001120619.u66cz73bvfwtccqc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260929234700.1244647-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929234700.1244647-2-matthew.d.roper@intel.com>
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

Hi Matt,
On 2026-09-29 at 16:47:01 -0700, Matt Roper wrote:
> Tracefs became a dedicated filesystem, independent of debugfs, in early
> 2015 and is expected to be mounted independently now (usually at
> /sys/kernel/tracing).  For transitional compatibility, trying to access
> the old debugfs location ($debugfs/tracing) will automatically mount
> another copy of tracefs at that location.  However as of kernel commit
> 9ba817fb7c6a ("tracing: Deprecate auto-mounting tracefs in debugfs"),
> this transitional automounting is deprecated; it currently prints a
> message in dmesg at WARN log level (which IGT will treat as a test
> failure) and will likely be removed entirely at some point in the
> future.
> 
> Stop relying on debugfs for access to tracing.  Instead scan
> /proc/mounts to find the real location where tracefs is mounted (this
> will usually be /sys/kernel/tracing, but that isn't guaranteed).  If
> tracefs isn't already mounted, attempt to manually mount it.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/igt_core.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index d5dc5324d..cfb33863e 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -34,6 +34,7 @@
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
> +#include <sys/mount.h>

Move it below sys/mman.h

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  #include <string.h>
>  #include <sys/mman.h>
>  #include <signal.h>
> @@ -704,14 +705,60 @@ void igt_kmsg(const char *format, ...)
>  	fclose(file);
>  }
>  
> +static void cleanup_fclose(FILE **f)
> +{
> +	if (*f)
> +		fclose(*f);
> +}
> +
> +static const char *__igt_tracefs_mount(void)
> +{
> +	FILE *f __attribute__((__cleanup__(cleanup_fclose))) = NULL;
> +	char line[1024];
> +
> +	f = fopen("/proc/mounts", "r");
> +	if (!f)
> +		return NULL;
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		char *dev, *dir, *save;
> +
> +		dev = strtok_r(line, " ", &save);
> +		dir = strtok_r(NULL, " ", &save);
> +
> +		if (strcmp(dev, "tracefs") == 0)
> +			return strdup(dir);
> +	}
> +
> +	/* Doesn't appear to be mounted yet; try to mount it manually */
> +	if (mount("tracefs", "/sys/kernel/tracing", "tracefs", 0, 0) == 0)
> +		return "/sys/kernel/tracing";
> +
> +	return NULL;
> +}
> +
> +static const char *igt_tracefs_mount(void)
> +{
> +	static const char *path;
> +
> +	if (!path)
> +		path = __igt_tracefs_mount();
> +
> +	return path;
> +}
> +
>  void igt_trace(const char *format, ...)
>  {
>  	char path[128];
> +	const char *tracefs;
>  	va_list ap;
>  	FILE *file;
>  
> -	snprintf(path, sizeof(path), "%s/tracing/trace_marker",
> -		 igt_debugfs_mount());
> +	tracefs = igt_tracefs_mount();
> +	if (!tracefs)
> +		return;
> +
> +	snprintf(path, sizeof(path), "%s/trace_marker", tracefs);
>  
>  	file = fopen(path, "w");
>  	if (file == NULL)
> -- 
> 2.55.0
> 
