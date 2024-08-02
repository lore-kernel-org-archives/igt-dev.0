Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D5C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 11:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4268710E127;
	Fri,  2 Aug 2024 11:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFXUaYi6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469310E127
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722597886; x=1754133886;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=M+IHh4pczwDflhZyvMwAFYNeI3/Grz6NxDbQ90fKxnY=;
 b=nFXUaYi6J+c/Q0QNp3NLgrZr3MV5lT432zQ32ZM0nA1qmhhHRPZOEcd2
 ozhNt4elu78EaHki0jB9tvKNKDgtnrwG3G1Hvo1wF6zG2HUnTfxYiZTYm
 DNxLpUqtuAS1BmjeaYJ/W3BDHIXMrTkfHoL5UKdSK1P2/GjJEulk3NGG+
 gZFBOACqzBcLQuWtTaSH+jISEMDXUidS7MKKRemLMNtUVJclXbvYl9rVp
 G0jteahEhth/VoSFF7BSrhGf0iSTX46Saxmy05NoMzF26lTSkD7/rPLYk
 NN6MjIIckYXxKQkPHW3iOqt2UXCt3XZ49VXaG6u02Jy8i5U/YIvWIsEQR A==;
X-CSE-ConnectionGUID: MVFg/3yvSjiYT2YxKfmtgQ==
X-CSE-MsgGUID: WUkvBz2TQTajCsVGgyFE+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20283673"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="20283673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 04:24:46 -0700
X-CSE-ConnectionGUID: ymXJZTAxTNGFpAgwg1ZaOw==
X-CSE-MsgGUID: t6G165kTQnyeEG/5yjombw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="78622451"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 04:24:45 -0700
Date: Fri, 2 Aug 2024 13:24:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/drm_fdinfo: Fix type comparison warning
Message-ID: <20240802112442.w6wbxo5tjsgve2yq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240802105120.586924-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-08-02 at 12:51:20 +0200, Marcin Bernatowicz wrote:
> Resolve a compilation warning caused by comparing distinct pointer
> types without a cast in the max macro usage.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Fixes: dd461382e7fa ("tests/intel: Apply igt.cocci transforms")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> 
> ---
> ../lib/igt_aux.h:229:35: warning: comparison of distinct pointer types
> lacks a cast
>   229 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>       |                                   ^~
> ../lib/igt_aux.h:246:3: note: in expansion of macro ‘__typecheck’
>   246 |  (__typecheck(x, y) && __no_side_effects(x, y))
>       |   ^~~~~~~~~~~

Thx for quick fix, this is

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ../lib/igt_aux.h:249:24: note: in expansion of macro ‘__safe_cmp’
>   249 |  __builtin_choose_expr(__safe_cmp(x, y), \
>       |                        ^~~~~~~~~~
> ../lib/igt_aux.h:254:19: note: in expansion of macro ‘__careful_cmp’
>   254 | #define max(x, y) __careful_cmp(x, y, >, max)
>       |                   ^~~~~~~~~~~~~
> ../tests/intel/drm_fdinfo.c:808:9: note: in expansion of macro ‘max’
>   808 |  return max(count, 0U);
> 
>  tests/intel/drm_fdinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index 160dc3d0a..43216a64e 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -805,7 +805,7 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>  		buf[count - 1] = 0;
>  	close(fd);
>  
> -	return max(count, 0);
> +	return max_t(typeof(count), count, 0);
>  }
>  
>  /*
> -- 
> 2.31.1
> 
