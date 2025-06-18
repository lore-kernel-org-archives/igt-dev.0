Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B01C7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 15:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E9610E030;
	Wed, 18 Jun 2025 15:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhvBfCCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10010E030
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750261708; x=1781797708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GbAft9wn9dSVCBOGD7+b5kbDAISsZzKrLGKhuvrO/tg=;
 b=YhvBfCCNoBSHO2/iHoa0+v4iVlrFqozZcVisg/RQS0ptkZpi/aF8bHmZ
 yE6jWSE9OdepcujluCXmVkhXfTghZI5O68aeDXXCh0YZF0RR3EqEM3011
 TI0S1LXNeFuINo9I7dKIVw0yevxWOsjH+kTA7g7i0/GEKV8QmjotMwyRu
 hWpjmeL7SStizjyZpUSGnADu2lnyIJV5ylBEA7vixtaPnqn3sAvwSeYMZ
 3KyBd8yOJkOXEMMS2AqWipOTyAtfIMNcU5/KaJRnImj69VKaD4ZF5Pwx7
 ZQ7u3fTm+vY994Nu7RU1KUt7UE9UvE6o8IHGrPvC2XvWDFFOakZk6iUUA A==;
X-CSE-ConnectionGUID: 72oI8TjVTtSVyYPftZu4KA==
X-CSE-MsgGUID: 36MqLWwPSduvOtq0p9sXhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="55107547"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="55107547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:48:27 -0700
X-CSE-ConnectionGUID: CBPw2VEFSsSfprE0vXLIKQ==
X-CSE-MsgGUID: 42FCt+RSQnGsoQO7xEgV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150489844"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:48:26 -0700
Date: Wed, 18 Jun 2025 17:48:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH 3/3] Dockerfile: bump fedora version to the newest one
Message-ID: <20250618154824.aoncaereiwpw4sxn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
 <20250617-bump_fedora_to_42-v1-3-d04e6a0455fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617-bump_fedora_to_42-v1-3-d04e6a0455fd@intel.com>
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

Hi Andrzej,
On 2025-06-17 at 16:05:25 +0200, Andrzej Hajda wrote:
> With fixed few issues in previos patches new fedora
> can be used for build tests.

imho you should also add a description for new libcurl
and upgrade to libproc2

This could be done at merge time, so
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw do we need old Fedora for testing with old meson?
Or will it work with it?

Regards,
Kamil

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  Dockerfile.build-fedora | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index 588738ac423e0d274fa42dfa4043b44d4cb1bad7..9399c0a7dbabd2ee1d78993c7d2e245f957b2ea7 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -1,11 +1,12 @@
> -FROM fedora:33
> +FROM fedora:42
>  
>  RUN dnf install -y \
>  	gcc flex bison libatomic meson ninja-build xdotool \
> +	'pkgconfig(libcurl)' \
>  	'pkgconfig(libdrm)' \
>  	'pkgconfig(pciaccess)' \
>  	'pkgconfig(libkmod)' \
> -	'pkgconfig(libprocps)' \
> +	'pkgconfig(libproc2)' \
>  	'pkgconfig(libunwind)' \
>  	'pkgconfig(libdw)' \
>  	'pkgconfig(pixman-1)' \
> 
> -- 
> 2.43.0
> 
