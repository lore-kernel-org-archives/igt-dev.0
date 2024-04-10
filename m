Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B55CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEDE10ECCC;
	Wed, 10 Apr 2024 15:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/Rb4ElW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DC710ECCC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712763665; x=1744299665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YiSrMF9wdUE3YKpnzr9m2U7O2DnFSfDG+ED7jNmeQIE=;
 b=l/Rb4ElWabf0MlaFE/HIIQsw/KL8SdAMMbsSA1/KRF3rli7g67i3rfH7
 d7S16bzYge4BVwnEsB5pOrn7J1Gi7E8y+/bPti6Y7Cz329uUjhzPl016M
 JEDao3beWD5HQWoB4C9v9UAE4cl75NodFOF+5qLcCrz/JLF7q5orfAJq9
 tSXtChcnapNwqS/zbHdJ+D9EFUFB44AOKMxMtV8+OCtVHaFmWhAXTGhNu
 gMlkqFMan88WbvVgu3wD8nsjBr9OjK0s/fsvgqmHlr3KBYNU07Jr7l7ky
 ssPEKGZt+lbJNNOjJPlb+9Yn4rQCf6FDPYc6nRLx6VUKki7Nk6MK+naDe Q==;
X-CSE-ConnectionGUID: wJCkuFFcSV2IHAVSYusFrw==
X-CSE-MsgGUID: NKg7/mNPQQaVG6vGy+QyPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8047687"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8047687"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:41:04 -0700
X-CSE-ConnectionGUID: Dk0eDEZuQgenn0y9tE0Lmg==
X-CSE-MsgGUID: t6SKbEMGTru6AG52kwQFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25228937"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:41:03 -0700
Date: Wed, 10 Apr 2024 17:41:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/intel: Add missing Sub-category for
 xe_waitfence
Message-ID: <20240410154100.ymgbgbkrgs7l42bv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
 <20240409111915.2842477-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409111915.2842477-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-04-09 at 11:19:11 +0000, Katarzyna Piecielska wrote:
> Add missing Sub-category for xe_waitfence subtests.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_waitfence.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 071e67bd6..45378d95d 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -140,6 +140,7 @@ waitfence(int fd, enum waittype wt)
>  /**
>   * TEST: Negative test for wait ufence ioctl
>   * Category: Software building block
> + * Sub-category: Synchronization
>   * Functionality: waitfence
>   * Test category: negative test
>   *
> -- 
> 2.34.1
> 
