Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12160CC6B0E
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 17:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8C10E80C;
	Tue, 13 Oct 2026 17:09:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4DD10E68E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791911288; x=1823447288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E7yZWonm/huwO+/JIPlYrar9z+DP17+lgu93PvTaGUw=;
 b=jZ4hUZmNvLJy6cNMlbpP/QOVbEIHXmk17G435H3xHiGqyVM6CcA7NwBQ
 2cTF6C/qu/7OIJULRbgYDTazuQDqQVo5FneJixKKtyr0UyNkG4Uvf0obM
 D9Fg+WkXlONyNehNTUgzJ3pNqnDK32E6x3V+cYqbb+VYvLSRlT8re47Dv
 Jnm/KaNwlVf6Lyfe4YbMefsYR5P/maIGBjhOjHPKGWA1G/HMjQWjPRLbD
 OpZlmD08DCZ7KfINaRdA7YZeleLnkI6cMeBQnqwZQoIfL+ufS+Dl3tOo+
 48eZxHWexQLWBwoxZlWVBOBmz4q/LTNs4mIrMCbQOHZ6IyWE0Psg+Rs0p w==;
X-CSE-ConnectionGUID: 0gzn1XLMQya0XmqN69G3Rg==
X-CSE-MsgGUID: AuohMqQfS82eqLF9u28ztw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="638519"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="638519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:08:08 -0700
X-CSE-ConnectionGUID: x5HibEJKTP2BsTHGmoCYjA==
X-CSE-MsgGUID: rc+iQ+p8T82tuQHeaE/jgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1287983"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:08:05 -0700
Date: Tue, 13 Oct 2026 19:08:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/2] runner/resultgen: Fix warn about discarded
 const
Message-ID: <obxye5ms44knsrmxap3jzkhlwu4r4bftt3mdjheiw3ufowmk67@4l5z3avbooiu>
References: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
 <20261013151644.174387-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013151644.174387-3-kamil.konieczny@linux.intel.com>
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

On Tue, Oct 13, 2026 at 05:16:44PM +0200, Kamil Konieczny wrote:
> Fix following warning which is observed on Ubuntu 26.04:
> 
> ../runner/resultgen.c: In function ‘next_line’:
> ../runner/resultgen.c:144:13: warning: assignment discards
> 	‘const’ qualifier from pointer target type
> 	[-Wdiscarded-qualifiers]
>   144 |         ret = memchr(line, '\n', bufend - line);
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/resultgen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 127d8a9e8..94cdd0e2e 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -136,7 +136,7 @@ static char *find_line_starting_with(char *haystack, const char *needle, char *e
>  
>  static const char *next_line(const char *line, const char *bufend)
>  {
> -	char *ret;
> +	const char *ret;
>  
>  	if (!line)
>  		return NULL;
> -- 
> 2.55.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
