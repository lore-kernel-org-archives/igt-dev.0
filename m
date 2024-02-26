Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1945DC54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 10:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDD810F050;
	Mon, 26 Feb 2024 10:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifqGDOeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB01810F050
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708944848; x=1740480848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GhptcUN9J1kYUEzysnr7qrhiDzZuCIWVGGJDRT8HM/U=;
 b=ifqGDOeTXzli5LGOdjXgoal34b28lcPzzuJKGsZnapr3w2+hX2amo3Gg
 4qOeWICKnylGpgCFW33Mo+EiadnXMe0PYWkxR/hmB1cpoGL+VoJMmE8kp
 Kc0CT1gXI1u7B63HMmniTSiwFTTzDS0e6xrkCAZR1ZUA8j+LykjLyZUfZ
 bJ1tSkjcloJRTpG6BzFzNaLMFVRClzHKFNLI64Hi4aHnRZd1p66T1dpag
 iqG8GY6HYVXXCm3SiAIQByYhW4Dci+l4FSLvmKBuh604RIIY/or3a0zVh
 GYULCsYg6eGMHjTMSshowA1xjU+p8uzYIxz7w27WiihpNxSmgomFY74kT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3097725"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3097725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11266661"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:54:07 -0800
Date: Mon, 26 Feb 2024 11:54:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v2 1/4] scripts/igt_doc.py: fix intelci testlist
 generation for complex cases
Message-ID: <20240226105404.7rpymcwlpi47aqkp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <20240222114741.196042-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222114741.196042-2-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-02-22 at 12:45:25 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The most complex case is when a test is included or block listed, via
> GPU and "Excluded GPU platform" fields, as the same test might be
> on both lists.
> 
> Currently, the handling logic doesn't go though all GPUs, which ends
> supressing tests from testlists if the GPU is not mentioned.
> 
> Fix it, while simplifying the logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 3a45371a27e7..7404e3d0934c 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -163,36 +163,26 @@ class IgtTestList(TestList):
>                              testlists[driver][gpu][run_type].add(subname)
>                          continue
>  
> -                    default_gpu_value = True
> -
>                      # If GPU field is used, default is to block list
> +                    default_gpu_value = True
>                      for gpu, value in gpus.items():
>                          if value:
>                              default_gpu_value = False
>                              break
>  
> -                    for gpu, value in gpus.items():
> +                    for gpu in gpu_set:
> +                        value = tests_per_list[driver][run_type][subname].get(gpu, default_gpu_value)
> +
> +                        if not value:
> +                            continue
> +
>                          if gpu not in testlists[driver]:
>                              testlists[driver][gpu] = {}
>  
>                          if run_type not in testlists[driver][gpu]:
>                              testlists[driver][gpu][run_type] = set()
>  
> -                        value = default_gpu_value
> -                        if gpu in tests_per_list[driver][run_type][subname]:
> -                            value = tests_per_list[driver][run_type][subname]
> -
> -                        if value:
> -                            testlists[driver][gpu][run_type].add(subname)
> -
> -                    if default_gpu_value:
> -                        if default_gpu not in testlists[driver]:
> -                            testlists[driver][default_gpu] = {}
> -
> -                        if run_type not in testlists[driver][default_gpu]:
> -                            testlists[driver][default_gpu][run_type] = set()
> -
> -                        testlists[driver][default_gpu][run_type].add(subname)
> +                        testlists[driver][gpu][run_type].add(subname)
>  
>          if len(gpu_set) == 0:
>              gpu_set.add(default_gpu)
> -- 
> 2.43.2
> 
