Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD30CC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 07:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB5410EA10;
	Thu, 17 Apr 2025 07:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqiYQa+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC210EA10
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744873228; x=1776409228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sSChLiHzzD59XbM5gwGxWUyfvYym3ml8w6NYXoF9D54=;
 b=fqiYQa+yoyoKgrbfsH7rCAXVBUjavAB1jbp+VtHstg1UuUeyGCrthinm
 gMFCbfJhYoCzc2MLYqqCW+PSzxxiNBSOqBzbj1vVyH3XSoqmV1nJm2nVJ
 7Q6TcJ7YvPACQpDU5g3xLl4RqhO8NUFBNNUXtStRBcpD3ORMZk2gwJ6FF
 MFkmxsfJJwkDIrO8T/EnnacDmvZv4IH+vVitz3529ikuWYw9/4kqON/rL
 YiCpZhX46vfqbdpkT8bjQZOHBblMF9uJNTvOytzdbjWFRyNtD0phkJ6ec
 MgFIhsdyUX+qH8CoLq/h1Ky9KDhY7MiNuovh396AMQDPPrA9+f8XYCPx4 A==;
X-CSE-ConnectionGUID: rz+eIOdIQLGARrJXYIWiRg==
X-CSE-MsgGUID: 7ODlEFwiSua6Zm60BGfuLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45681364"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="45681364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:00:27 -0700
X-CSE-ConnectionGUID: ha2viSfURdKYFVj30M7dVw==
X-CSE-MsgGUID: Q2URbf8dSfCMr2RmKJW83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="161671644"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:00:26 -0700
Date: Thu, 17 Apr 2025 09:00:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/xe/spin: Use READ_ONCE, WRITE_ONCE macros in Xe spin
 library
Message-ID: <20250417070024.agimkumvc2yxn2so@zkempczy-mobl2>
References: <20250416161025.361516-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416161025.361516-1-matthew.brost@intel.com>
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

On Wed, Apr 16, 2025 at 09:10:25AM -0700, Matthew Brost wrote:
> Without the READ_ONCE macro is xe_spin_started(), a compiler may choose
> to read the value of spin->start exactly once rather than every call of
> xe_spin_started(). If the initial read is before the GPU batch execution
> flips spin->start to a non-zero value, the test will hang forever. This
> was shown on Chrome.
> 
> For uniformity, update xe_spin_end to use WRITE_ONCE too.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  lib/xe/xe_spin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 0de0b1f2e9..65c29284aa 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -145,7 +145,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> -	return spin->start != 0;
> +	return READ_ONCE(spin->start) != 0;

For dynamic libries in userspace compiler won't optimize the read
if function is extern. I had a discussion about it with Lucas some
time ago.

Where's the case you observe invalid behavior of this?

--
Zbigniew

>  }
>  
>  /**
> @@ -162,7 +162,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
>  
>  void xe_spin_end(struct xe_spin *spin)
>  {
> -	spin->end = 0;
> +	WRITE_ONCE(spin->end, 0);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
