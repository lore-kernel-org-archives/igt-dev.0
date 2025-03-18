Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37ABC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 15:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A819F10E4AC;
	Tue, 18 Mar 2025 15:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WB8Zz8GF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E36B10E4AC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742313576; x=1773849576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hhbC5icKqJwcbzi5VC1z7diTfOa7H8SZRiGgs1rLzcU=;
 b=WB8Zz8GFZKyRkBZ3rrmj95GfB3gmNBgmjHfXPmPgMg4G+vZyrofIfryS
 jpXoMy89qXjW3w69Tv41b1dEseN6ccFkx71mfoXYQvs5FheKZlZL136kH
 lNUbbfbulMhpQ3Je+m3cBTGeidn9Lu5bISEVYaHFsinmvfayYD7pwuqal
 3v+06PEm0jxatUMUO0EH9yQ1Pa/QJpL+Z6X3E8O9dyqqQsPzLXkWef1qJ
 yfK6nIX6hItgbKK8/1+Ymcw0K0Ng/4Bpvvp18fo7G4lWtVN5aEEPKceIi
 2oUrJ4ZG1yw0u4NeCQNPS4ZnKE43cZctjnhVtu8PObNk6D/UwA8ebt/wH g==;
X-CSE-ConnectionGUID: tB2rl7jSSy+j+2kbFnIjbg==
X-CSE-MsgGUID: L4VLpx9vR0WbnG1RRrwD9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47351028"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="47351028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:59:35 -0700
X-CSE-ConnectionGUID: uxnyTDQpTZyHtyqOZ6aTew==
X-CSE-MsgGUID: K+nOKxBVSTaWT2tLOZeV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122269890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:59:35 -0700
Date: Tue, 18 Mar 2025 16:59:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_core: reinitialize log_buffer_mutex in
 child process
Message-ID: <20250318155932.iloobswwne3msoif@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
References: <20250317113146.560156-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317113146.560156-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-03-17 at 12:31:46 +0100, Zbigniew Kempczyński wrote:
> For multi-process scenario intel-allocator is dedicated thread which
> handles clients (children processes) allocations. Main thread which
> spawns children may hit point of time where allocator thread locked
> some mutex. One of it is log_buffer_mutex used in igt_log(). Children
> which would try to call igt_info/warn/debug() family will stuck as
> this mutex is already locked.
> 
> Reinitialize this mutex in igt_fork() to avoid deadlocks in allocator
> scenarios.
> 
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 9702a94177..c19689a51e 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2600,6 +2600,7 @@ bool __igt_fork(void)
>  		test_child = true;
>  		pthread_mutex_init(&print_mutex, NULL);
>  		pthread_mutex_init(&ahnd_map_mutex, NULL);
> +		pthread_mutex_init(&log_buffer_mutex, NULL);
>  		ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
>  		child_pid = getpid();
>  		child_tid = -1;
> -- 
> 2.34.1
> 
