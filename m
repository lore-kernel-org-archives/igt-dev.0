Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81752C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 06:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1B710E1AD;
	Wed, 31 Jul 2024 06:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kz35Uk9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F7D10E1AD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 06:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722406016; x=1753942016;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HRidSzc/UzuEfoPpbO3C6aksOuuAMIO5Ig5fuuzQsO4=;
 b=kz35Uk9WcGKl7vEZxtwvxI5hJblLjt4dC0B7jwzD0PprarkoVV3q+GoU
 ZlpwNvstrRbDvU7uNyDFTDVtPDg6+8HlUhxI+GGYoUQN6IrsaT/YQBILC
 EBYW3AlXWTEhXf8sNBx9+hs3qpUHhSB3MdIigl6VKNvKKmaseKGNF1JWE
 4lBsO+iJ5AMSSyJ5UX7v/x0F30oTxDhbjFRRpa5mcLY5Ssy1pFuUvZgws
 XL/DdHeT4zSnzMDo02RGu13KucTFmRUNzJzsLDd8whqbvzbMiZjPbMH8S
 2OMqegTExcncDAVBOr3mdd+Gn+9Z9faEqFo/mu1mYaBOMS5ZYU2j4p1/5 A==;
X-CSE-ConnectionGUID: v5MxrhCWQeuCezA1PdG3xw==
X-CSE-MsgGUID: XjF5omGGS/Gvh4Xp2jsDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31414718"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="31414718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:06:55 -0700
X-CSE-ConnectionGUID: aHPQYGx5QWW2iwVDBVl6Pw==
X-CSE-MsgGUID: GiqdSukWTxWrHYD3RVAQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="85207205"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:06:54 -0700
Date: Wed, 31 Jul 2024 08:06:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Message-ID: <20240731060652.w3zpciijmu3myvdn@zkempczy-mobl2>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731033504.1426640-3-lucas.demarchi@intel.com>
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

On Tue, Jul 30, 2024 at 08:35:03PM -0700, Lucas De Marchi wrote:
> Use READ_ONCE() to guarantee we are actually reading the memory written
> by the GPU and compiler can't optimize it away.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 3adacc3a8..43a7a43c2 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -166,7 +166,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   */
>  bool xe_spin_started(struct xe_spin *spin)
>  {
> -	return spin->start != 0;
> +	return READ_ONCE(spin->start) != 0;
>  }
>  
>  /**
> -- 
> 2.43.0
> 

Hmm, function is exported and would expect compiler will always
read the memory before return. This is part of .so and I don't
think this will be inlined to the caller. Where do you observe
gpu memory write is not reflected to the cpu?

--
Zbigniew

