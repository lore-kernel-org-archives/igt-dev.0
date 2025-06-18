Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F732C71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 18:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DCD10E8F8;
	Wed, 18 Jun 2025 18:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djzdq3MC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890F10E8F8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 18:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750270909; x=1781806909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r8EGuNqXpauoXsvolfZUdsEoFWNQ1hDLLTiI/beZn1s=;
 b=djzdq3MCOduCwSBQ6MNxYpj0oy4bp7FOtu2gOGiv4NBRSmQTqpa5PRtI
 KjGyosbZbrc5sHrRu2ZWyO9ZpF9MMXFtYcak5xC0pkN/YI56eRpqOLSKW
 Z3ZG4LWDpPPgDVt0/FYorILnrjrXwiW3sPHmjDcNeOLX2nCvyNh3C/u2q
 9LOjhdtIjDxeHYsX3u93YUjlHuaAVzop1N/+0o7bZHMQ9WR+u6+PFXvUu
 gD+fHCB9cX4IAY1QmJl+SGxlQb/Yv6Ius8mu1GR+3q4H1wUB3MwtNGflD
 yz00xEaFb+FNuoHtJO9gw8TpIu0FuI/GXCT1VS4XD+6e5e8jBrF6dRB6N w==;
X-CSE-ConnectionGUID: A2mwFKcHTCCDHBmpFLYe1A==
X-CSE-MsgGUID: QxNN1qwiSnaWCcUfSnshWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62781675"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="62781675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:21:49 -0700
X-CSE-ConnectionGUID: YDjdLFTuSpWULs1cqBVyxw==
X-CSE-MsgGUID: S/+sv48STO2sWcBy+Z5f+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="155464923"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:21:48 -0700
Date: Wed, 18 Jun 2025 20:21:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH 1/3] gitlab-ci: build docs before installation
Message-ID: <20250618182133.j3rws4aostv5kslu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
 <20250617-bump_fedora_to_42-v1-1-d04e6a0455fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617-bump_fedora_to_42-v1-1-d04e6a0455fd@intel.com>
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
On 2025-06-17 at 16:05:23 +0200, Andrzej Hajda wrote:
> The proper way seems to 1st build then install.
> Not sure why it works with old gtkdoc, but newer one
> reports error.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 587bf884708b315b3c015fec9467f7993bd56417..637112e4e10d678a70c9a6964ec9b2ce55876c34 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -76,8 +76,8 @@ build:tests-fedora:
>    script:
>      - meson setup --prefix=/opt/igt $MESON_OPTIONS build
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> -    - DESTDIR="$PWD/installdir" ninja -C build install
>      - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
> +    - DESTDIR="$PWD/installdir" ninja -C build install

Btw what are $MESON_OPTIONS here? They could interfere here
then yes, building doc could be needed.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>    artifacts:
>      paths:
>        - build
> 
> -- 
> 2.43.0
> 
