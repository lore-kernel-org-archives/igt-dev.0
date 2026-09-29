Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C30CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6C10E9D4;
	Tue, 29 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJmd4C57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567910E9C5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790676906; x=1822212906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CAhD4KUlffdY+lfXF2SWGqXqzv/G13zaZnFUz/6eq1I=;
 b=aJmd4C57R2vPxTsCm0EOegnvF6xLYV45wsONydVUZPPsCM9OTjyRmwmO
 pRDhykQmQ2649FCtScNN3VWDs6wCUyj0HZ61k59ozBfJSJMwvV4aaUuRy
 0omvViR1BcXOhXzPgEHyB0veRNqYopKE5qUCyMlQxAVeZ9FCCESemTu3k
 cz3CTknyxOHS65+cddX7vDSbURIYu4QMJLM8+m7Rvhc/mOktlJj0DPTVI
 GvtapxkxT/hww9vDLlKnmsFECLJXSUt4JfNF7Z98QgLoxjX/mV0Wr6MrF
 9dC4Y8l9RA+5peIzYDw8HXd1U5H1NxAlZFFV2pX1nEAckq4SxYgYzI/Hs A==;
X-CSE-ConnectionGUID: YCUv5dflQjOUAJO0rcxj+A==
X-CSE-MsgGUID: 6cl7advaTOmoJhOwSCGYyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116922397"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116922397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:15:05 -0700
X-CSE-ConnectionGUID: 7dAmLNvdRRyuo0l9zciPHw==
X-CSE-MsgGUID: haUJ9+qVSEqGjvv3IkQ5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274862925"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:15:04 -0700
Date: Tue, 29 Sep 2026 12:14:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t 2/8] tools/gputop/xe_gputop: fix CLAMP() usage
Message-ID: <20260929101441.f65yolyn4h5y3asp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <e1fca483c0201eaaa8172e9dafb092307e550dfe.1790331690.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1fca483c0201eaaa8172e9dafb092307e550dfe.1790331690.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-09-25 at 12:57:42 +0200, Sebastian Brzezinka wrote:
> clamp() is defined in igt_aux.h which is not in the include chain of
> xe_gputop.c. Use the glib CLAMP() macro which is already available via
> utils.h -> glib.h.

Can we move away from glib here and use igt_aux.h instead?

Regards,
Kamil

> 
> Fixes: 6a181fab8 ("tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100")
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index 119545c75..f643fe33e 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -301,7 +301,7 @@ static double pmu_active_percentage(struct xe_engine *engine)
>  
>  	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>  
> -	return clamp(percentage, 0., 100.);
> +	return CLAMP(percentage, 0., 100.);
>  }
>  
>  static int
> -- 
> 2.55.0
> 
