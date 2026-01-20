Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7238D2ED12
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 12:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EE510E5DA;
	Tue, 20 Jan 2026 12:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXMHO8RC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675C10E5DB
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768912075; x=1800448075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wEFGqN8fD+M/TVeguBNqslW6eTdPqbKppDSb2O9DKiY=;
 b=WXMHO8RCXiKBdOt9GODkJqpasnvHPz/GIjSF9mXoSvWrVqIXnP5eRNwH
 HCs9TrwakM19IOHy797HkKp3dGx2jLU6KA4U1UP4IKyD/u6sxLuvfW3he
 dJUZrr6P58zWxXVI2LC2W3m0YlzZ754Hb6TSO0Ra0gm1q44j8jDwJQV3R
 FlMJWNosr8tUBm+QAKSDeIQrhhMRelVUri1SdqsVtIY0v/IJIzH8n7TTW
 l1oNP3OZehaDW9YcUD2l310lax5u5itfZ2IVLDDWQHkNBKLdMfJovZjbo
 bjq61GmPImVmgQZMLWCKB2y7O/lAr8itt+WBbL6KRKIdpLNPH2rsehDEC w==;
X-CSE-ConnectionGUID: RzwWZZrqQMKWb/EOUte8Ng==
X-CSE-MsgGUID: PmdhnlRbRwSxI0CyAK7ymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81557125"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81557125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 04:27:54 -0800
X-CSE-ConnectionGUID: EliU7uoNSdqdIFby21M7CA==
X-CSE-MsgGUID: j92XNdnvRyiWlu0QiBEzyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="229042746"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 04:27:52 -0800
Date: Tue, 20 Jan 2026 13:27:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v4 2/6] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Message-ID: <20260120122735.njvn6rngqzikhzfy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260107183739.84597-1-soham.purkait@intel.com>
 <20260107183739.84597-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107183739.84597-3-soham.purkait@intel.com>
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

Hi Soham,
On 2026-01-08 at 00:07:35 +0530, Soham Purkait wrote:
> Add clamp helper macro to utils.h to remove dependency on lib/xe/*

You still have #include "igt_core.h" so there is more to improve.
Before your change:

ldd build/tools/gputop |wc -l
5

after appling all patches in this series:

ldd build/tools/gputop |wc -l
78

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/gputop.src/utils.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
> index 00befed56..0334ec839 100644
> --- a/tools/gputop.src/utils.h
> +++ b/tools/gputop.src/utils.h
> @@ -19,6 +19,14 @@
>  
>  #define PERCLIENT_ENGINE_WIDTH 8
>  

guard '#define clamp' with #ifndef/endif

Regards,
Kamil

> +#define clamp(val, lo, hi)			\
> +({						\
> +	__typeof__(val) _v = (val);             \
> +	__typeof__(lo)  _lo = (lo);             \
> +	__typeof__(hi)  _hi = (hi);             \
> +	_v < _lo ? _lo : (_v > _hi ? _hi : _v); \
> +})
> +
>  /**
>   * struct gputop_driver
>   *
> -- 
> 2.34.1
> 
