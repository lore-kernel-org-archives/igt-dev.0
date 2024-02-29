Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212B0C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 13:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FC010E1A2;
	Thu, 29 Feb 2024 13:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcB1DfZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16B10E1B5
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709214187; x=1740750187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5995YjYRxlYoN9wMzjAQdbAZTxfSSPNxtKexOFj+9hU=;
 b=mcB1DfZabLrrU8hcJ1zowT3vjJwSSFTM8WAtZh+UkMqAPqgYd397JeA1
 lrs/Slg/95AYyXtSKrnHP9L/TzaUCeGv446SS+CtoE34w7VB/WedC66zt
 nKsbqjvH1h21LLkChVU3L9DvC4ASsRoZHN0MlQCwC/2EvknvN9XyrE+eg
 Vu/SC1wXftRXwM9A9zggOQvfyoPKFCq26bW8XOuXAfHR4llYRUZB2xjTV
 nOseNLl/f0AZFr6vGRkqprNXVX3Y2zXOAt6KPVsFfVIUPqqvM3REVL2it
 k0uQ+Mmz4xgbljQpbqHovLxRAb0ne476fmclV7NvAIouPVoWdTw7gik2k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3561229"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3561229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="31019016"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:42:52 -0800
Date: Thu, 29 Feb 2024 14:42:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John.C.Harrison@Intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/gem_exec_schedule: Add w/a tag to
 prior update for MTL RCS/CCS w/a
Message-ID: <20240229134249.ilaoesuwirenulyl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT-Dev@Lists.FreeDesktop.Org, John.C.Harrison@Intel.com
References: <20240226235737.2150915-1-John.C.Harrison@Intel.com>
 <20240226235737.2150915-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226235737.2150915-3-John.C.Harrison@Intel.com>
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

Hi John.C.Harrison,
On 2024-02-26 at 15:57:36 -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> This test was recently updated to not fall foul of a particular
> workaround. The w/a tag itself was missed, however. So, add that in to
> make it easier to find in the future.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_exec_schedule.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> index 3fd91b2fae80..8612929cc403 100644
> --- a/tests/intel/gem_exec_schedule.c
> +++ b/tests/intel/gem_exec_schedule.c
> @@ -444,6 +444,7 @@
>  IGT_TEST_DESCRIPTION("Check that we can control the order of execution");
>  
>  /*
> + * Wa_16019325821
>   * The RCS/CCS workaround on MTL means that if spinners are sent to both RCS
>   * and CCS engines concurrently then the system is effectively dead and will
>   * require a reset of both engines to recover. Even pre-emptible spinners
> -- 
> 2.43.0
> 
