Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AD4CA5FAC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 13:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9C010F3EF;
	Wed, 30 Sep 2026 13:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmW7QoHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3B710F3EF
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790775810; x=1822311810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfl0Zqw9XmPawzbqvZE5293FGDkBKbws8+W5rla6p/o=;
 b=QmW7QoHUlsKWRxRJVuK8TVPzuovKmJn8xVxJAwHekDWgt+lJ2L7ZipkV
 iUNl4of0Z7u43Zftk6S+aKytg0xnYidbTUg+J7qA+TLgZPtEUsUrSRfpq
 5/sQggakicNO6nZW+K6YLozO9qscVmkIQzJl+OoLqQYBubX5mJXhXLa7v
 nbni9iWQWPeWQQUqSz3Wrw/HNqeHR4V7K5FVOHr2Hiarm0D4VXJ7pUbR4
 9f8fNNiS3Anajdh16p/HbzZF/J1M2qSqIW1f0V4wMRwWmzOmAYyxgp/F5
 sT/revggAi0sXBumATutB3BvxL2tangFJNUqqBbwmTeXRt7b5mjscU3Ay g==;
X-CSE-ConnectionGUID: cIAn4YQcQnu0avKdN5JgBw==
X-CSE-MsgGUID: 7U/pSRHdTmC0KqP1MxVilQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102886324"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102886324"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:43:30 -0700
X-CSE-ConnectionGUID: ZiMwGZ6kTcKzuH5k8XTG6A==
X-CSE-MsgGUID: UTCNg1fHRw+XhBgv9U362w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="303628880"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:43:29 -0700
Date: Wed, 30 Sep 2026 15:43:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/5] tools/intel_reg_spec: Preserve const
 qualifiers
Message-ID: <20260930134327.zidiq6ny6sxhw3o4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929154950.838280-3-alex.hung@amd.com>
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

Hi Alex,
On 2026-09-29 at 11:49:47 -0400, Alex Hung wrote:
> With glibc 2.43, strrchr() on const input returns a const pointer.
> Assigning that result to char * in include_file() discards const
> and causes a compiler warning.
> 
> The following warning is observed on Ubuntu 26.04 (wrapped):
> 
>   ../tools/intel_reg_spec.c: In function 'include_file':
>   ../tools/intel_reg_spec.c:242:4: warning:
>     assignment discards 'const' qualifier from pointer target type
>     [-Wdiscarded-qualifiers]
> 
> Use a separate const char * for the source directory separator.
> Keep the writable pointer for removing the newline from the
> allocated filename.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_reg_spec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
> index 632db6b9f..e51c90ec9 100644
> --- a/tools/intel_reg_spec.c
> +++ b/tools/intel_reg_spec.c
> @@ -228,6 +228,7 @@ static bool ignore_line(const char *line)
>  
>  static char *include_file(const char *line, const char *source)
>  {
> +	const char *source_dir;
>  	char *filename, *p;
>  
>  	line = skip_space(line);
> @@ -239,9 +240,9 @@ static char *include_file(const char *line, const char *source)
>  	if (!filename)
>  		return NULL;
>  
> -	p = strrchr(source, '/');
> -	if (p && *line != '/') {
> -		int len = p - source + 1;
> +	source_dir = strrchr(source, '/');
> +	if (source_dir && *line != '/') {
> +		int len = source_dir - source + 1;
>  
>  		memcpy(filename, source, len);
>  		strcpy(filename + len, line);
> -- 
> 2.53.0
> 
