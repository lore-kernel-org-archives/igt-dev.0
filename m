Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BE2E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75BC10E0B8;
	Wed, 11 Dec 2024 09:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCTnQw3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489010E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733910176; x=1765446176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7js4qFRtg1k+1iHZHi8y9PngrAimd8J6b2kT9Px8zmY=;
 b=CCTnQw3uDeO9M32AExYpYD2RrfpqDi6KIOK8YGZF/qAv5SXQkCdcGhSc
 Qx0umE84G86XJ0go/igakwpTeuuWbaWCU/nF6d3EzifHc3e1AKh5HJj6x
 /deaU5R3U3N6iFBOSkGBe5tWm8JonO8mycfnf49x6im0BzoNII9IGoCeS
 8b5TtVEgnl8ACwWFWxoVGcrbw0O2eWj4FuBUiIPdni9VIMH3M01vlUB5M
 ZT/9O29TJprQpZ0GQy9zTGleq15p3aTI1AeGtvh4hPK0VDajloSc00RtJ
 /CmDGfCZ7C51Lri3tOrKkp4UQFjJVzoBEvXxCuOD6Bfdz4ZSn64BeES+D g==;
X-CSE-ConnectionGUID: 28dJNUWSSLG1gfO4h44jhA==
X-CSE-MsgGUID: h5+FC1AiQG2POdLy9rKLQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34407597"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34407597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:42:56 -0800
X-CSE-ConnectionGUID: ilOfIG5DT72Hm0bxgkoFEA==
X-CSE-MsgGUID: /oKGnzdATXCPkR9qZ4kCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="96099865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:42:54 -0800
Date: Wed, 11 Dec 2024 10:42:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1 2/5] runner/settings: Update absolute_path
 function to accept const char* parameter
Message-ID: <20241211094252.hevhgzikhhehyrci@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
 <20241121133958.3382633-3-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121133958.3382633-3-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2024-11-21 at 19:09:55 +0530, Naladala Ramanaidu wrote:

[PATCH i-g-t v1 2/5] runner/settings: Update absolute_path function to accept const char* parameter

Please make it a little shorter and more descriptive, like
[PATCH i-g-t v1 2/5] runner/settings: constify absolute_path parameter

> Modified the absolute_path function in settings.c to take a
> const char* parameter instead of char*. Updated the corresponding
> declaration in settings.h.This change ensures that the input path
> is not modified within the function, improving code safety and clarity.

This looks a little too long and also like "C to words",
read CONTRIBUTE.md for pointers how to write patch descriptions.

Reagrds,
Kamil

> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/settings.c | 2 +-
>  runner/settings.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 0d27e7af3..dd4b08dd7 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -565,7 +565,7 @@ static char *_basename(const char *path)
>  	return tmpname;
>  }
>  
> -char *absolute_path(char *path)
> +char *absolute_path(const char *path)
>  {
>  	char *result = NULL;
>  	char *base, *dir;
> diff --git a/runner/settings.h b/runner/settings.h
> index 8335f0b8c..6246d0c3d 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -135,7 +135,7 @@ bool parse_options(int argc, char **argv,
>  bool validate_settings(struct settings *settings);
>  
>  /* TODO: Better place for this */
> -char *absolute_path(char *path);
> +char *absolute_path(const char *path);
>  
>  /**
>   * serialize_settings:
> -- 
> 2.43.0
> 
