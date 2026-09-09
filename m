Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8BC79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 17:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5F10E556;
	Wed,  9 Sep 2026 17:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzSRZ34X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442910F245
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788974886; x=1820510886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EQa4fxtPBsYYr4cbDN4ItjTqzhZBBYE5v8XfHnzFXls=;
 b=SzSRZ34Xb9yUSMiOhD4Bnq03Vw68OIug9IYY+rkjD3vuzSkRFexx5U57
 Pqu2kL2eHwQmOs8Sbl8+5ef5Z2+nKWmU+lwVxXBNpErNscOXhy5KnSxo0
 TCB3HVEb+7gKPzAU1DmzPjW+odgO47kvr+9Wxl598UvuoCX+TbVcVlhdx
 QZureDwtcITcrZ9Yd1+IjrAzMteSEmpRY9sEquQ7j5Q+lREg9hxymxy1w
 qYQvG/DqUDZHrKoDDxe0hxG50xflr7brqNXSvMrU40b3PrSTH8KB61uVM
 vGM2OwXaGtiNu0dzoVjJGm1A3sF4DnkeoLFBmNtW100yeLRbF2Dl7EQbt A==;
X-CSE-ConnectionGUID: zGbYlhaTQyOY4SEHKiJ1hQ==
X-CSE-MsgGUID: 3QXLWw3NRaiOZ042/eu3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89441930"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89441930"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 10:28:06 -0700
X-CSE-ConnectionGUID: 2JZ9aQe8R6qRem+izaOxRA==
X-CSE-MsgGUID: z9L0mK3MSbqUwem7wXUv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273354194"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:28:04 -0700
Date: Wed, 9 Sep 2026 19:28:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_core: buffer signal-safe log output per line
Message-ID: <20260909172801.xga4p5d74c4rvsnh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260908050100.4034282-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908050100.4034282-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2026-09-08 at 10:31:00 +0530, Jeevan B wrote:
> xputch() wrote one byte at a time via write(STDERR_FILENO, &c, 1) from
> the async-signal-safe backtrace printer. When a fatal signal hits
> multiple processes/threads at once (e.g. forked test children all
> dumping a backtrace after the same signal), their single-byte writes
> interleave on the shared stderr/runner fd, producing garbled or
> truncated output. This showed up as tests (e.g.
> igt@kms_cursor_legacy@*) being reported as incomplete with no useful
> logs.
> 
> Buffer output in xputch() and flush it with a single write() (or
> log_to_runner_sig_safe() call) per line via a new xflush(), instead of
> one syscall per character. xprintfmt() now also flushes on reaching
> the end of the format string, so a trailing partial line without a
> newline is still emitted.
> 
> The buffer is thread-local (__thread) so concurrent threads of the
> same process don't race on it; plain TLS access remains
> async-signal-safe, unlike a lock.
> 
> v2: Make the xputch buffer thread-local instead of a plain static.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_core.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index af9d93762..4efddb908 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2105,13 +2105,40 @@ static void write_stderr(const char *str)
>  #ifdef HAVE_LIBUNWIND
>  static const char hex[] = "0123456789abcdef";
>  
> +/*
> + * Buffer output and flush it in one write() per line, instead of one
> + * write() per character. Concurrent single-byte writes from multiple
> + * processes/threads (e.g. forked children, or multiple threads of the
> + * same process, all dumping a backtrace after receiving the same
> + * fatal signal) interleave on the shared stderr/runner fd and produce
> + * unreadable, garbled logs. The buffer is thread-local so concurrent
> + * threads don't race on it; plain TLS access is async-signal-safe,
> + * unlike a lock.
> + */
> +static __thread char xputch_buf[256];
> +static __thread size_t xputch_buf_len;
> +
>  static void
> -xputch(int c)
> +xflush(void)
>  {
> +	if (!xputch_buf_len)
> +		return;
> +
>  	if (runner_connected())
> -		log_to_runner_sig_safe((const void *) &c, 1);
> +		log_to_runner_sig_safe(xputch_buf, xputch_buf_len);
>  	else
> -		igt_ignore_warn(write(STDERR_FILENO, (const void *) &c, 1));
> +		igt_ignore_warn(write(STDERR_FILENO, xputch_buf, xputch_buf_len));
> +
> +	xputch_buf_len = 0;
> +}
> +
> +static void
> +xputch(int c)
> +{
> +	xputch_buf[xputch_buf_len++] = c;
> +
> +	if (c == '\n' || xputch_buf_len == sizeof(xputch_buf))
> +		xflush();
>  }
>  
>  static int
> @@ -2166,6 +2193,7 @@ xprintfmt(const char *fmt, va_list ap)
>  	while (1) {
>  		while ((ch = *(const unsigned char *) fmt++) != '%') {
>  			if (ch == '\0') {
> +				xflush();
>  				return;
>  			}
>  			xputch(ch);
> -- 
> 2.43.0
> 
