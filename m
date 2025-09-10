Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91139CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 06:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3B710E145;
	Wed, 10 Sep 2025 06:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gfw3NrGC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C26E10E145
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757484526; x=1789020526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RUZl5iwxstQfl4mwqS9BQTeaJM0KPba70KpqUaFXjVI=;
 b=Gfw3NrGCgh+b/Fems5cpqfG5QLfBjS2ifSWSHZTcBzA0yWXkgqjUIY3z
 9hSNUyz9+ifs03TFpyNdeThnXHN7SBJVnlrBW3tSi3+dyTs2+L1w1ssgd
 fqVe5EMqyR62qV3DI4auMXQeESr+cfWeIbL2uFG5Yg/L2sDh+sgcKbXRb
 HFQirgDPYw7+0GZ0JBSbBj4XaYZYYrEYkRmVT312bVrD4EgOqjfn1/7IT
 u6D8dhficelzUpErQCYuZmr266U9aiXPMHu/O8pZ8xaPbJuuEVWvosG3J
 eLQwIjcW9HH7fhEczOnPcgMX67yZdTS8N8Xyo0W4EmeyrvzG4N4QSpdSq w==;
X-CSE-ConnectionGUID: 41z1DFMUTkG+Gq27kufUTA==
X-CSE-MsgGUID: yq2AwGKsTnmMGjydfc+MaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70474804"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="70474804"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 23:08:46 -0700
X-CSE-ConnectionGUID: F/mN8FdeQ1m1jfGF5L/fNw==
X-CSE-MsgGUID: lhrveuHaTGq55XFabBcnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173143804"
Received: from agladkov-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 23:08:45 -0700
Date: Wed, 10 Sep 2025 08:08:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
Message-ID: <ldkqnliynzdrqu3ycge6qba7z5m336e4gk7xbacfcs76afqxo7@uvmgnhz3icxc>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-3-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908125448.13420-3-dominik.karol.piatkowski@intel.com>
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

On Mon, Sep 08, 2025 at 02:54:46PM +0200, Dominik Karol Piątkowski wrote:
> Block SIGINT during igt_vlog to avoid deadlocks in multi-threaded SIGINT
> scenarios.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/igt_core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 4477cfef1..414fd9bce 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3198,6 +3198,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  		"CRITICAL",
>  		"NONE"
>  	};
> +	sigset_t set, oldset;
> +

I think this part deserves for a comment explaining why we need this,
because this is heavy hammer.

I also wonder shouldn't we have some global variable which we turn
on only in eudebug case. I mean in the test fixture:

igt_block_signals_in_print(true);

then in ending fixture:

igt_block_signals_in_print(false);


> +	sigemptyset(&set);
> +	sigaddset(&set, SIGINT);
> +	sigprocmask(SIG_BLOCK, &set, &oldset);

And this would be:

if (do_block_signals_in_print())
    ...

Anyway - definitely we have to protect igt_vlog(), we don't
know when fork will be done with print_mutex locked.

--
Zbigniew


>  
>  	assert(format);
>  
> @@ -3276,6 +3281,7 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  	pthread_mutex_unlock(&print_mutex);
>  
>  out:
> +	sigprocmask(SIG_SETMASK, &oldset, NULL);
>  	free(line);
>  	free(thread_id);
>  }
> -- 
> 2.34.1
> 
