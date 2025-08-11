Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABADC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 10:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DAA10E3D5;
	Mon, 11 Aug 2025 10:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igf13G7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0A810E3D5
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754907727; x=1786443727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8/PosI8W7hkaHzolWxhB0OHccYbTsm+uQWvOB6u1zHs=;
 b=igf13G7RhWFjdc46JGMYzBjN17NlUN3spNs1XTjPe/Ht06m2DqoyHVRC
 An44ILZ+Zru3qvH30bUXOoHrZmRN0/cjdUXfrDO5o9Uy/yAQLp8ERlpfn
 uXzup0ZVVs56L0/Npe8ZEKDcHsa3YITAZpK7d48Z4ng48rwAzP9lEPm4v
 xVMr2RBBzAitt1vSLV08BJ82G9b14GoXTnemeLlNMHScfgssfutPhAXWo
 rttx8aRLsQElbPe1cM+XXrwANXrM6sEsE3lIXd7p+vwSpkGwmATAiyJwN
 ErbZCT+n39rxs/KD7LoJqdEZUgoS08SQpoJ+PMk9RMwwu6uRX0UWvvBRE g==;
X-CSE-ConnectionGUID: RXTOEgnTQcyTVQJQrRpTDw==
X-CSE-MsgGUID: d+dJlzGDQROR7UKVr8KWtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57235558"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57235558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:22:06 -0700
X-CSE-ConnectionGUID: io0M1lUgRF+f6gOTdTwXYw==
X-CSE-MsgGUID: mkMh0jY2QMeNFk0+b9N1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165777863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:22:04 -0700
Date: Mon, 11 Aug 2025 12:21:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, jan.sokolowski@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_dir: Use actual length for string
 termination
Message-ID: <20250811102140.2vduvcwhmo5eos5a@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, jan.sokolowski@intel.com,
 rodrigo.vivi@intel.com
References: <20250809131858.71685-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250809131858.71685-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-08-09 at 15:18:58 +0200, Peter Senna Tschudin wrote:
> Commit 501da513dfb7 ("lib/igt_dir: utilities for directory traversal and
> file handling") introduced a bug where strings were always
> null-terminated at their maximum length rather than at their actual used
> length. This could lead to strings with unintended trailing data or
> improper termination.
> 
> This commit fixes the issue by ensuring strings are null-terminated at
> the correct (used) length.
> 
> Cc: kamil.konieczny@linux.intel.com
> Cc: katarzyna.piecielska@intel.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: michal.wajdeczko@intel.com
> Cc: karthik.b.s@intel.com
> Cc: jan.sokolowski@intel.com
> Cc: rodrigo.vivi@intel.com
> Fixes: 501da513dfb7 ("lib/igt_dir: utilities for directory traversal and file handling")
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_dir.c b/lib/igt_dir.c
> index 1792ba7c1..e232dbda9 100644
> --- a/lib/igt_dir.c
> +++ b/lib/igt_dir.c
> @@ -79,7 +79,7 @@ int igt_dir_get_fd_path(int fd, char *path, size_t path_len)
>  	if (len == -1)
>  		return -1;
>  
> -	path[path_len] = '\0';
> +	path[len] = '\0';
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
