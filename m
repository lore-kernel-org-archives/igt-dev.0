Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B84CA1010
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 16:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F21C10EC08;
	Fri,  5 Sep 2025 16:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGt1KoYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F4710EC08
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757088282; x=1788624282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q55d5zKVA2nCZwN9RqshiTivcOJPEll+UJUTq49D/w0=;
 b=dGt1KoYebQhO08t3aHUE60nRj2mJwzyuwr4Z8BEMwg5CGg+1rh7s3PVp
 rFkQkbtZUcMhAMgmBnFcD/TKuLO+Kbz408gOawPc/OP26+8hzel75Z8DS
 vmjlMuJBKGSLHg136QYl/YGMU7imE45pNxRKX9ifmoFISiHIMB9T8lrp8
 29RM/LCinaomJEPzLjErQIif7ZgENfHHNcnAq/FB2LFiDScposLSmStsa
 27C8Cc4/ueagEfRFRrbvekTQYN9uBebBHacZjxPtrS8dok0QqGzy9ux6D
 EvyfzFG2YYjMXi6oCRV4AkBfSbI50LUhT4ZEwtPrEw/F2CUBXvf/HuMpW Q==;
X-CSE-ConnectionGUID: MKEdkY9+R3+jwA4Qa96UuQ==
X-CSE-MsgGUID: lQqBFB+hSQGwNIcxIKObKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59141293"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59141293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:04:42 -0700
X-CSE-ConnectionGUID: scqME4NlSa61KkuYqeAAgA==
X-CSE-MsgGUID: JjRsvEYmTMCFl/J3/8IC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172077653"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 09:04:41 -0700
Date: Fri, 5 Sep 2025 18:04:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v7 2/5] docs: create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Message-ID: <20250905160438.bqlbsp6n6hmzmznl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250905134735.132119-1-pawel.sikora@intel.com>
 <20250905134735.132119-3-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905134735.132119-3-pawel.sikora@intel.com>
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

Hi Pawel,
On 2025-09-05 at 15:47:30 +0200, Pawel Sikora wrote:
> Some files needs to appear in the documentation and they are
> needed in the 'docs' directory.
> 
> Creating symbolic links in the 'docs' directory for:
> 
> * docs/CONTRIBUTING -> CONTRIBUTING.md
> * docs/NEWS.md -> NEWS
> * docs/MAINTAINERS.md -> MAINTAINERS
> 
> This allows a legacy way of using those files from the root
> directory of the project and for a new format and usage
> by the mkdocs tool.
> 
> v4:
>  - Add symlinks instead of moving files into docs dir (Kamil)
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/CONTRIBUTING.md | 1 +
>  docs/MAINTAINERS.md  | 1 +
>  docs/NEWS.md         | 1 +
>  3 files changed, 3 insertions(+)
>  create mode 120000 docs/CONTRIBUTING.md
>  create mode 120000 docs/MAINTAINERS.md
>  create mode 120000 docs/NEWS.md
> 
> diff --git a/docs/CONTRIBUTING.md b/docs/CONTRIBUTING.md
> new file mode 120000
> index 000000000..44fcc6343
> --- /dev/null
> +++ b/docs/CONTRIBUTING.md
> @@ -0,0 +1 @@
> +../CONTRIBUTING.md
> \ No newline at end of file
> diff --git a/docs/MAINTAINERS.md b/docs/MAINTAINERS.md
> new file mode 120000
> index 000000000..67231b1e1
> --- /dev/null
> +++ b/docs/MAINTAINERS.md
> @@ -0,0 +1 @@
> +../MAINTAINERS
> \ No newline at end of file
> diff --git a/docs/NEWS.md b/docs/NEWS.md
> new file mode 120000
> index 000000000..0fae0f802
> --- /dev/null
> +++ b/docs/NEWS.md
> @@ -0,0 +1 @@
> +../NEWS
> \ No newline at end of file
> -- 
> 2.51.0
> 
