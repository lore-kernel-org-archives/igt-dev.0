Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3E0C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 09:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A488D10E73C;
	Mon,  7 Sep 2026 09:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+CgkVWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396510E0E1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788773930; x=1820309930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E/doKeuK1cdZYCj6DlnaPymAflGUhLCESIOGHVoMUos=;
 b=S+CgkVWLcfZvyG1F9h0IDqfi2DTzx1evmaMNMDs+/Dmf0j/PQaAFZbJb
 UcRi2f0+p+LvZQEUj+ri3j9g0Y87qcINvXGSNX+XwxaSepJjPw7vQ07G5
 fzwthEH0l9wKC75icw0/jCVlW1wG94pjO0YwCwUvPJUI7dJpoFK5lY59W
 9plnsvmAvk1/4xjY6EJX5qPAPMiZ7RIRUkam/4EuaDfVJS4pQAb2HFvr8
 kiw+i9gkVHxRKUomp8S4tJHXEQWkFOLRoJZ6BF+Fp691yqFKpeFeYV+fW
 pcQCP9fzHFkov3mI3uw+JgSrm6x+HY2skWqMPs7cGnlV1yCkc8TPz2zoO Q==;
X-CSE-ConnectionGUID: eWhGmBP/Tb2aPSGeyq8Dfw==
X-CSE-MsgGUID: 0/4g+K4fR9WawU3kzVDsLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92876386"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92876386"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:38:49 -0700
X-CSE-ConnectionGUID: 04M5OrqPTHSyyMB6wQALew==
X-CSE-MsgGUID: H4gMEcJESAaaVVfnovtw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274173443"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 02:38:49 -0700
Date: Mon, 7 Sep 2026 11:38:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_core: buffer signal-safe log output per line
Message-ID: <20260907093846.jv7jaivcozclk4ng@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20260907052012.3948192-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907052012.3948192-1-jeevan.b@intel.com>
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
On 2026-09-07 at 10:50:12 +0530, Jeevan B wrote:
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
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_core.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index af9d93762..e376a972c 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2105,13 +2105,37 @@ static void write_stderr(const char *str)
>  #ifdef HAVE_LIBUNWIND
>  static const char hex[] = "0123456789abcdef";
>  
> +/*
> + * Buffer output and flush it in one write() per line, instead of one
> + * write() per character. Concurrent single-byte writes from multiple
> + * processes (e.g. forked children all dumping a backtrace after
> + * receiving the same fatal signal) interleave on the shared stderr/
> + * runner fd and produce unreadable, garbled logs.
> + */
> +static char xputch_buf[256];
> +static size_t xputch_buf_len;

You should make both thread safe.

Regards,
Kamil

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
> @@ -2166,6 +2190,7 @@ xprintfmt(const char *fmt, va_list ap)
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
