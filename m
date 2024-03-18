Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67904C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 13:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4710F74D;
	Mon, 18 Mar 2024 13:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEgI0M9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C9610F74D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710769128; x=1742305128;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9aLmbOPvgDa6/9oiBweZv+SrqqoKmCBz4pOK8UVLrG0=;
 b=EEgI0M9+EuWH7XVLm7FFe6JMPxbTZFRD/HbvGURawE5lX7PTQrojuRZY
 KhgVf5afRkXk+zBHpGuzippqmqanySV84aVJFL9+ERbqSq9NZrL1c9cJz
 3Hx5Ck4EykPkSgHZq73xzYkqKq+boxri2lRad8wW1cN+8j7JAb0fGZl/P
 n80gcbVZO44XDMCeWdunnDUTD7HNgnxB3SW88YOhIEUi+xWJ7N66U3ND8
 0BOhc9iMGgyuOAu3IDjLBFLSWn3E1keJVGJT3VTc76/p1Oj4WhY3LK7qz
 7Kh0gQHLr8WAnxFzTz0J5H8aFYCt0oeJt1gk1Xu1OIJM33D9ATT43hOCh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="23094625"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="23094625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44400961"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:38:48 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3C187580E3B;
 Mon, 18 Mar 2024 06:38:46 -0700 (PDT)
Date: Mon, 18 Mar 2024 14:38:43 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_sriov_device: fix musl libc build
Message-ID: <20240318143843.5bbf06bf@maurocar-mobl2>
In-Reply-To: <20240315131901.28144-2-kamil.konieczny@linux.intel.com>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
 <20240315131901.28144-2-kamil.konieczny@linux.intel.com>
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

On Fri, 15 Mar 2024 14:18:59 +0100
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
>  lib/igt_sriov_device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index f425a5ecf..a0ef05d5c 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -5,6 +5,7 @@
>  
>  #include <dirent.h>
>  #include <errno.h>
> +#include <limits.h>
>  #include <pciaccess.h>
>  
>  #include "drmtest.h"
