Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA23AC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6577E10F3BF;
	Fri,  9 Feb 2024 13:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y39RMF4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88E10F3D5
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707483701; x=1739019701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zpx2BNh+mlepZMV5XvKaIqwDF+/CmH+u500mJLQqIvw=;
 b=Y39RMF4xtLQSvfEFzBoVemWY+kf6ZUWqidzv7jwtoy1D7h8srG0v9dOR
 EkEGNj88Fd//g4keyXBO0/R6zSlwighqxQrAVReY1EMJgbONHdA55FHYF
 TodAXUhMw/glTMce/QCeXq2aNBaNbHrqRv7GfLFPCC7eW9bkcYScQCYoq
 La8XPt4dnpq8pdCmrzGhfVK8N7lTNlXLgXZw7ZG62Fe+RH5EiRwHx/J7F
 P2GCxFYoB5TQ+3FpuJCVLoAPf8LxkqkHk2hyjUggApbgL2qup/g9HgaeW
 GJNB3Bn+HtP5y/EbiJZ9DtjPOmnM/+WujofURXcyOtEg1043lVGGsz3F/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5240509"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="5240509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6551931"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 05:01:23 -0800
Date: Fri, 9 Feb 2024 14:01:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v3 3/8] scripts/igt_doc.py: handle empty run_type
Message-ID: <20240209130120.fpa5pwrci2hjvulb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
 <20240209123543.289204-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209123543.289204-4-mauro.chehab@linux.intel.com>
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
On 2024-02-09 at 13:34:42 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If run_type is not set, change it to "other".
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index a6cbeee067fe..8a10db13081c 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -85,6 +85,9 @@ class IgtTestList(TestList):
>                      tests_per_list[driver] = {}
>  
>                  for run_type in run_type_set:
> +                    if not run_type:
> +                        run_type = "other"
> +
>                      if run_type not in tests_per_list[driver]:
>                          tests_per_list[driver][run_type] = {}
>  
> @@ -108,6 +111,10 @@ class IgtTestList(TestList):
>          for driver, run_types in tests_per_list.items():
>              testlists[driver] = {}
>              for run_type, subnames in run_types.items():
> +
> +                if not run_type:
> +                    run_type = "other"
> +
>                  for subname, gpus in subnames.items():
>                      if not gpu_set:
>                          gpu = "default"
> -- 
> 2.43.0
> 
