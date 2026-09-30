Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D94CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 13:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845F610F422;
	Wed, 30 Sep 2026 13:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKwq3FAe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103710F422
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790776312; x=1822312312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Z2q3yirRaJ0uZY0yEbzyi6QquiZcORW/QCW/mpIWTY=;
 b=KKwq3FAeK5PPPuGJhEKV0029t4yL1B7mlGdDZeAIYtT6H4a611TlJWS/
 UJ0jE5wht5r/UnxhaPM/BXh6D3CQOWNgieF+YuYWuP7WcVwUhmCi2uG51
 yWzZ/3ceqJYjhZN8GnZoKdc+ez0NOKJhGtJ87lguCW6tzaL1VitGMRL3M
 L5lObeY8Ih4tU9HOykdQ2UAP1jb7HHJwBQqCQBruBEU8RsgTjomUdNB5x
 zt3AgITpbljjWjN8xyKzCKf9aSk2Psm2X6kpJx8p7UZ/Yv2VCw2+tTk+2
 mNsBV7GtzB6cUWtXSIBRZCPbdwT//2P3TDIfB9eykRNKAmaB5CtKp3NRW A==;
X-CSE-ConnectionGUID: x/pXvkPmQOaJCUAfeGOJHw==
X-CSE-MsgGUID: Tb2j+cywRlu46Wz88ZIQEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113300949"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="113300949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:51:51 -0700
X-CSE-ConnectionGUID: GQJOBIBCSwOIbwIVHEThcg==
X-CSE-MsgGUID: 6PXKBvhVSfOGFUtl3dzKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="313627460"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:51:51 -0700
Date: Wed, 30 Sep 2026 15:51:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 4/5] tests/i915_pm_sseu: Preserve const qualifiers
Message-ID: <20260930135148.n7mq4l26hqfytbg4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-5-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929154950.838280-5-alex.hung@amd.com>
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
On 2026-09-29 at 11:49:49 -0400, Alex Hung wrote:
> With glibc 2.43, strstr() on const input returns a const pointer.
> Storing that result in char * discards const and causes compiler
> warnings in the SSEU debugfs parser.
> 
> The following warning is observed on Ubuntu 26.04 (wrapped):
> 
>   ../tests/intel/i915_pm_sseu.c: In function 'dbg_has_line':
>   ../tests/intel/i915_pm_sseu.c:123:21: warning:
>     initialization discards 'const' qualifier from pointer target type
>     [-Wdiscarded-qualifiers]
> 
> Use const char * for the read-only search results. Pass NULL for
> the unused strtol() end pointer so the input pointer can remain const.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/i915_pm_sseu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index 5dd571a45..a4b92791c 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -120,7 +120,7 @@ dbg_get_status_section(const char *title, char **first, char **last)
>  static bool
>  dbg_has_line(const char *first, const char *last, const char *name)
>  {
> -	char *pos = strstr(first, name);
> +	const char *pos = strstr(first, name);
>  
>  	return pos != NULL && pos < last;
>  }
> @@ -128,7 +128,7 @@ dbg_has_line(const char *first, const char *last, const char *name)
>  static int
>  dbg_get_int(const char *first, const char *last, const char *name)
>  {
> -	char *pos;
> +	const char *pos;
>  
>  	pos = strstr(first, name);
>  	igt_assert(pos != NULL);
> @@ -137,13 +137,13 @@ dbg_get_int(const char *first, const char *last, const char *name)
>  	pos += 2;
>  	igt_assert(pos != last);
>  
> -	return strtol(pos, &pos, 10);
> +	return strtol(pos, NULL, 10);
>  }
>  
>  static bool
>  dbg_get_bool(const char *first, const char *last, const char *name)
>  {
> -	char *pos;
> +	const char *pos;
>  
>  	pos = strstr(first, name);
>  	igt_assert(pos != NULL);
> -- 
> 2.53.0
> 
