Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905FC02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 12:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC710E1A7;
	Thu, 16 Jan 2025 12:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evvGruKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECD110E1A7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737030555; x=1768566555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nXzoV+G4N3yBFPvn7DLJXNc4LCSbwlrUbcZXhZW6QGg=;
 b=evvGruKMKzSmy8/RUUKl0XOu+mOvX1eCUTDV87Q1zuPYSGXfDoLaPKE7
 555SQM0hu8OJXOamHfuBbT6+igIHc0DSnncAOCg6V9nB3jDKOca0OSv9x
 b2y+oJtDYktlsz/wrpMyRrObX7yqRTI3XSYZUv5nNCBYBjRzNYSGambG9
 tQDQdJRNjjKsbRhnm6cW3uJN3IezJrHJ+eQJOXTLUXM8wxCbyXcG65CcH
 eeeWaRyEmF66ZYpF19nC3/YVNF0FiboH2kfSW4Im1KR/swxnTpCUQtUf5
 0nN88zyXGE7y1iTYsRIJ+NoHq0cWx/+MIYGGsqf0gfcaFY4feIVW2SnHO Q==;
X-CSE-ConnectionGUID: 4WhdGCBYSbmDzGDP0eSEoQ==
X-CSE-MsgGUID: qqsp57zLQQucqYKn7xXA9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41091317"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="41091317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:29:14 -0800
X-CSE-ConnectionGUID: mwTBCKHKQei4JG/K38el6g==
X-CSE-MsgGUID: 8oFoOds0RnKX9sQ73Ywu8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110108165"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:29:12 -0800
Date: Thu, 16 Jan 2025 13:29:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v2 2/5] runner/settings: Constify absolute_path
 parameter
Message-ID: <20250116122910.srzuvpaiziqvje6s@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
 <20250107200614.963199-3-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107200614.963199-3-ramanaidu.naladala@intel.com>
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
On 2025-01-08 at 01:36:11 +0530, Naladala Ramanaidu wrote:
> Modified absolute_path to use const char* for input, updating the
> corresponding declaration. This ensures the input path remains
> unmodified, enhancing code safety and clarity.
> 
imho better:

Make absolute_path a const char*, this ensures the input path remains
unmodified, enhancing code safety and clarity.

with that:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> v2: Update commit subject.  (kmail)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/settings.c | 2 +-
>  runner/settings.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 92fd42ea6..bea0c3059 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -567,7 +567,7 @@ static char *_basename(const char *path)
>  	return tmpname;
>  }
>  
> -char *absolute_path(char *path)
> +char *absolute_path(const char *path)
>  {
>  	char *result = NULL;
>  	char *base, *dir;
> diff --git a/runner/settings.h b/runner/settings.h
> index f69f09778..7e6cd11e2 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -136,7 +136,7 @@ bool parse_options(int argc, char **argv,
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
