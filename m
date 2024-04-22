Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92304C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 15:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D710F6C6;
	Mon, 22 Apr 2024 15:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsIMoOYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A8710F6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713800993; x=1745336993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PnX4wCYdFESOknxxP3cIbT77AiEPy9/BnX8n549C6cQ=;
 b=SsIMoOYfsVlO4B40XNn8bGFVXwP2ZSUOA69QQSTZQDYWgRhiNrjuHrXk
 nFAcmjaGkTBwgKwma5TDW+cUdE72beFuoD9yLPQlxRY64Prh/1qfcRIda
 em4URVF8tf6FHEq94Tnet+Tq6Ra5/QwSJPB9MZ/m7+v2ul+4H71D4ncdY
 Zp8m8Mnla30ClcsrxtBJJ9rxJFkPPxbtxqWwL1Ay5jSKTob7RoIC22SKL
 9pZWjdDB1kYTzTSs7BK6JzDbdUdjUh12z7ROCa0QqF3FWMNAnaJh41jtE
 bZFEAhWsJwpQwF2cKfLK3WgnbRyd6ObzFyofX+TZpGTcgu+zdUT4vvrCb A==;
X-CSE-ConnectionGUID: UHQ3u2oLSBqoE+CWq8v7Qg==
X-CSE-MsgGUID: euyGvPseStCdEXWQWhtNoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20750334"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20750334"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 08:49:51 -0700
X-CSE-ConnectionGUID: MS2KmihxSDOFHoJpm1LSgQ==
X-CSE-MsgGUID: WNCpdya0Q9qoutjGlynH1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24566446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 08:49:50 -0700
Date: Mon, 22 Apr 2024 17:49:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>, Reagan Bohan <xbjfk.github@gmail.com>
Subject: Re: [PATCH 3/3] Change sys/signal.h to signal.h
Message-ID: <20240422154947.cjuuqef2bds3gjc4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Reagan Bohan <reagan@ourmail.work>,
 Reagan Bohan <xbjfk.github@gmail.com>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240421232204.31704-4-reagan@ourmail.work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240421232204.31704-4-reagan@ourmail.work>
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

Hi Reagan,
On 2024-04-21 at 23:20:48 +0000, Reagan Bohan wrote:
> From: Reagan Bohan <xbjfk.github@gmail.com>
> 
> Not only is sys/signal.h non standard, it also:
> a) emits a warning on musl libc
> b) made the code inconsistent, as some files used signal.h and some
> sys/signal.h

Missing s-o-b.

Regards,
Kamil

> ---
>  tests/intel/gem_exec_await.c           | 2 +-
>  tests/intel/gem_exec_balancer.c        | 2 +-
>  tests/intel/gem_exec_fence.c           | 2 +-
>  tests/intel/gem_exec_latency.c         | 2 +-
>  tests/intel/gem_unref_active_buffers.c | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
> index fcbca1547..cc976f09d 100644
> --- a/tests/intel/gem_exec_await.c
> +++ b/tests/intel/gem_exec_await.c
> @@ -22,8 +22,8 @@
>   *
>   */
>  
> +#include <signal.h>
>  #include <sys/ioctl.h>
> -#include <sys/signal.h>
>  
>  #include "drmtest.h"
>  #include "i915/gem.h"
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
> index 7504f3737..83cc7eea4 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -23,8 +23,8 @@
>  
>  #include <fcntl.h>
>  #include <sched.h>
> +#include <signal.h>
>  #include <sys/ioctl.h>
> -#include <sys/signal.h>
>  #include <poll.h>
>  
>  #include "dmabuf_sync_file.h"
> diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> index 28bad83f6..deff18abc 100644
> --- a/tests/intel/gem_exec_fence.c
> +++ b/tests/intel/gem_exec_fence.c
> @@ -23,8 +23,8 @@
>  
>  #include <poll.h>
>  #include <string.h>
> +#include <signal.h>
>  #include <sys/ioctl.h>
> -#include <sys/signal.h>
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
> index b9d086afc..b802c2f31 100644
> --- a/tests/intel/gem_exec_latency.c
> +++ b/tests/intel/gem_exec_latency.c
> @@ -30,10 +30,10 @@
>  #include <fcntl.h>
>  #include <inttypes.h>
>  #include <errno.h>
> +#include <signal.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
> -#include <sys/signal.h>
>  #include <time.h>
>  #include <sched.h>
>  
> diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
> index f8138c7ac..47f792738 100644
> --- a/tests/intel/gem_unref_active_buffers.c
> +++ b/tests/intel/gem_unref_active_buffers.c
> @@ -34,8 +34,8 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <inttypes.h>
> +#include <signal.h>
>  #include <sys/ioctl.h>
> -#include <sys/signal.h>
>  #include <sys/time.h>
>  
>  #include "igt.h"
> -- 
> 2.43.2
> 
