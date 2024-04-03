Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650F2CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13EA10F71B;
	Wed,  3 Apr 2024 17:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSVXX57o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D079C10F71B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712166495; x=1743702495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bibiAVip07Nt4x4rS6qRlhB88OJ72H1IeveXEAQIBK8=;
 b=fSVXX57ovLZ3H/ThjzYWnRipMNqw7y8DeAaedOHdrSctX3XmnOL/WPPS
 UcSOl9m7GpTqPTD8DkAVKvhwYo6IFpqaHiN00UpaReXUOrW7x0oVSeQaO
 18jMyg3OuVPFKzwE8/B0GI7W8vfewgZ0i9Vci0qqBmmsehvW3NM3bYngu
 BKrhVtuJpPaUbznnEfq6l6ywmZLX3X3n+vdpQgMMbfxyb7apgbE9Va0nK
 nXgGQb0xl/e5QALZU0kBRGG1gMmHV9jlNDkcdaDJbAx9AGF2AFmLbGhFh
 EvF8dRq/cutlTNSTCj13LqKUuxsscg8TcjAFe3HEMWlhqT45e2GgbB0pR w==;
X-CSE-ConnectionGUID: yzWXIinpTeKxwtXjyehN/A==
X-CSE-MsgGUID: oL07kSX/RpGgLbdYq7lXyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7274697"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7274697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:48:14 -0700
X-CSE-ConnectionGUID: Xbu0z7M0R5KiKvhYl4M4sQ==
X-CSE-MsgGUID: E5upGUzlRIuTwZbhwBmK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18558948"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:48:12 -0700
Date: Wed, 3 Apr 2024 19:48:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 5/8] lib/igt_drm_fdinfo: Simplify find_kv()
Message-ID: <20240403174809.v3zuoo3nyycnkmql@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-6-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-04-02 at 15:17:13 -0700, Lucas De Marchi wrote:
> index() is deprecate from libc and strchr() should rather be used.
> Moreover the return value is NULL or a pointer to the occurrence, never
> the initial string and `(p - buf) != keylen` can only be true if ':' is
> the next char after the key.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_drm_fdinfo.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 17cac4009..15f71e172 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -106,20 +106,17 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
>  
>  static const char *find_kv(const char *buf, const char *key, size_t keylen)
>  {
> -	const char *p = buf;
> +	const char *p;
>  
>  	if (strncmp(buf, key, keylen))
>  		return NULL;
>  
> -	p = index(buf, ':');
> -	if (!p || p == buf)
> -		return NULL;
> -	if ((p - buf) != keylen)
> +	p = buf + keylen;
> +	if (*p != ':')
>  		return NULL;
>  
> -	p++;
> -	while (*p && isspace(*p))
> -		p++;
> +	for (p++; *p && isspace(*p); p++)
> +		;
>  
>  	return *p ? p : NULL;
>  }
> @@ -233,8 +230,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>  			strncpy(info->driver, v, sizeof(info->driver) - 1);
>  			good++;
> -		}  else if ((v = find_kv(l, "drm-client-id",
> -					 strlen("drm-client-id")))) {
> +		}  else if ((v = find_kv(l, "drm-client-id", strlen("drm-client-id")))) {

This chunk  shouldn't be here, with it removed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  			info->id = atol(v);
>  			good++;
>  		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> -- 
> 2.43.0
> 
