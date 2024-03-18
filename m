Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F2C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 13:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FB810F739;
	Mon, 18 Mar 2024 13:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xop6ArsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD7010F739
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710769141; x=1742305141;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jeph/aMbizOiS96VvBsneryDWvca2B6s6gCcSwB2+7A=;
 b=Xop6ArsTMbJck4lPUI+o0o2HHTT91SqRFBDr4arltFADre5zXDVduHm/
 eiJUyljKkLnNkXvK45i+whhyq7JWO5a+V0PnskSS7diWNizTcLNf9QPWl
 Z2AgXqXy+btteLY1LFKqY6BtHO3j6oHuIHXwS1oJbk0PgzzTxCdYZxgV1
 9shOnw2pEBKyxQVnrS5SgAbBEyDvXTOAzZEFIbYFjRdu+4dHGtacJyMzG
 QChIJLtctBtX2/hMEQdSUt4zZf7fac+HoFF6O6R9ZMaWqlI+z2kmFjhU8
 nxkAk5Ju/orJqT48XvLUCnkeexyG6hVBiFhatRHvDtp9av/Fns5VFfkDm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5414119"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5414119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13457174"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:39:00 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2566A580E3B;
 Mon, 18 Mar 2024 06:38:58 -0700 (PDT)
Date: Mon, 18 Mar 2024 14:38:56 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [PATCH i-g-t v1 2/3] lib/igt_kmod: fix musl builds
Message-ID: <20240318143856.6ed6e962@maurocar-mobl2>
In-Reply-To: <20240315131901.28144-3-kamil.konieczny@linux.intel.com>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
 <20240315131901.28144-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 15 Mar 2024 14:19:00 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> On musl build the PATH_MAX define is missing, fixed this with
> including limits.h
> 
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_kmod.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index b4b884898..0b01f070f 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -25,6 +25,7 @@
>  #include <dirent.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <limits.h>
>  #include <pthread.h>
>  #include <signal.h>
>  #include <stdlib.h>
