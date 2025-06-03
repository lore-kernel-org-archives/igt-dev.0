Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A0BC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 13:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8480E10E6FA;
	Tue,  3 Jun 2025 13:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlvGCwvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DF410E647
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748956965; x=1780492965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hz+4NfDlnXPfV6XKpuL9MOQ3bUqWrBD+qx9b3E6CZA4=;
 b=mlvGCwvKQaVpHKY6+QuAGiceFugEqKit07Y6L55W3vla597izrlb0VC2
 ga9TavlHUYI19fSUnerj2Fct4ZA49FlxOE6YTpV/Exi8BCSIRQYXyTykz
 P2vjQjvuB+YfGVKL9gOg5WnOt2d7uBnrmKBhHrOt0YB8hZLb4JQ+orOqd
 OCkP2LDHrfg5+l4y0GbyLkAOA9AEIQkva589mY40Mn9iIjVxg5jt+JB/V
 7LivCm13fyKzW/kjpIGXgYZbSV09ZC3WNzVXw9ZGs0E7KeBlXmDntaOiH
 GfvFRaQr5a3+Nh4HzcDJIxu1S7AU/Be53fL7jthlfeuX7w3G5EA2p4SDQ w==;
X-CSE-ConnectionGUID: Xu9eN8iJS326p6vIRtXPrw==
X-CSE-MsgGUID: PYeZJyPHRk2hqdxDh/cr1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51065015"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51065015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 06:22:44 -0700
X-CSE-ConnectionGUID: fEwxfo0pRWSaR7li8PQ5cg==
X-CSE-MsgGUID: t9NhlKKFTyiFANJYJe6HBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="168044226"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 06:22:42 -0700
Date: Tue, 3 Jun 2025 15:22:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <rk@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH 3/3] meson: update required version of meson
Message-ID: <20250603132228.czndtsbfkxqv2y4z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <rk@dragonic.eu>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
 <20250603-bump_docker_distros-v1-3-cf7e062e339c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603-bump_docker_distros-v1-3-cf7e062e339c@intel.com>
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
On 2025-06-03 at 14:40:40 +0200, Andrzej Hajda wrote:
> Future patches will require meson 0.52. Let's use the latest
> release 0.52.1.

As discussed with Petri on irc here 1.0.1 should be ok.

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

With this or 1.0.1
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  Dockerfile.build-fedora | 2 +-
>  meson.build             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
> index 00f45857c20f82320500e7230e72c9522527e7a9..588738ac423e0d274fa42dfa4043b44d4cb1bad7 100644
> --- a/Dockerfile.build-fedora
> +++ b/Dockerfile.build-fedora
> @@ -45,6 +45,6 @@ RUN dnf install -y findutils
>  
>  # Meson version switching shenanigans
>  RUN dnf install -y python3-pip
> -RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/e8/ec/3e6a68c9e0fd4b4f4fb6877a3ccfb6f6e6d09f2b4fc87674e671bf64b7b8/{meson-0.47.2.tar.gz}"
> +RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/43/9a/e0bcec70d290986c6265d32e0a2d16ace7ef38f58aa5a65308967129d094/{meson-0.52.1.tar.gz}"
>  
>  RUN dnf clean all
> diff --git a/meson.build b/meson.build
> index b88098234e6d72dd2ed4cf26972e7afed1b1aede..3d18267e652943c5984575498ddeacdec7e079da 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
>            'buildtype=debugoptimized',
>          ],
>  	license : 'MIT',
> -	meson_version : '>=0.47.2')
> +	meson_version : '>=0.52.1')
>  
>  if get_option('b_ndebug') != 'false'
>  	error('Building without -Db_ndebug=false is not supported')
> 
> -- 
> 2.43.0
> 
