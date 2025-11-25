Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC5ACFD364
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159FD10E392;
	Tue, 25 Nov 2025 09:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4qAd1LS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79D310E392
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764062454; x=1795598454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKi6S83F7pPlftXrnktc+kdxh0CwmhpQXbYJ4U+oboI=;
 b=n4qAd1LSlYd2BrfdDD6xTTUSkWKAT3Z/xvsfkGTGWUoulJhjCpkHGe9X
 fiZG6/PQmID9OJ8UXQ3kGkzw187sl7g5PzRw9Zrnl2h7YaexODghdvVVx
 3XXbum2HZEZdHa9jE+JLYal+M69wQkSKkauBIhDtV6K6N2pCrTacZSF2t
 jQR9cvxcAPQbfsBzihU6lTeA9CUVKSbsrSq0JBaF5rmJ9MYpB3n3OnVxJ
 oSLyonrhKr764H4hJFXTG8T+4lIxdBPIm4yGpxvXuqOM4gnJfDUAPCFBy
 ASw+pIJhHvmd0WZWwmQvnglH/V6h0yhdwh2wKX85WmpEm6RTwZu5Qqqsf w==;
X-CSE-ConnectionGUID: DdNpG01ZQieOGjvNqBAj+w==
X-CSE-MsgGUID: Yzm/bZjyRsWuCbWQVVWygg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68664429"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208,217";a="68664429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:20:54 -0800
X-CSE-ConnectionGUID: OlI4ozM8S866jd7PZWWy5w==
X-CSE-MsgGUID: f3wzxhf+SV25XtXEUY5QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
 d="scan'208,217";a="192224415"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:20:52 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_dir: Fix fdopendir usage
Date: Tue, 25 Nov 2025 10:20:50 +0100
Message-ID: <3387816.JoGBPyJhv8@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251124172534.61724-1-kamil.konieczny@linux.intel.com>
References: <20251124172534.61724-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart2458811.3c9HiEOlIg"
Content-Transfer-Encoding: 7Bit
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

This is a multi-part message in MIME format.

--nextPart2458811.3c9HiEOlIg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 24 November 2025 18:25:34 CET Kamil Konieczny wrote:
> After successful call to fdopendir(fd) the fd should not be
> used.

Correct.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> 
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_dir.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt_dir.c b/lib/igt_dir.c
> index e232dbda9..0dcbbf191 100644
> --- a/lib/igt_dir.c
> +++ b/lib/igt_dir.c
> @@ -223,7 +223,6 @@ static int _igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth,
>  	}
>  
>  	closedir(dirp);
> -	close(dirfd);
>  
>  	return ret;
>  }
> 



--nextPart2458811.3c9HiEOlIg
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Monday, 24 November 2025 18:25:34 CET Kamil Konieczny wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; After successful call to fdopendir(fd) the fd should not be</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; used.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Correct.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Reviewed-by: Janusz Krzysztofik &lt;janusz.krzysztofik@linux.intel.com&gt;</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Cc: Janusz Krzysztofik &lt;janusz.krzysztofik@linux.intel.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Cc: Jan Sokolowski &lt;jan.sokolowski@intel.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Cc: Peter Senna Tschudin &lt;peter.senna@linux.intel.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Signed-off-by: Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; ---</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; lib/igt_dir.c | 1 -</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; 1 file changed, 1 deletion(-)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/lib/igt_dir.c b/lib/igt_dir.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; index e232dbda9..0dcbbf191 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/lib/igt_dir.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/lib/igt_dir.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -223,7 +223,6 @@ static int _igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; closedir(dirp);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; close(dirfd);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; return ret;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><br /></body>
</html>
--nextPart2458811.3c9HiEOlIg--



