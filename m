Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769DAC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251AF10E26F;
	Wed, 14 May 2025 14:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuGYhVoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751910E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747233185; x=1778769185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2jec9cKPeLfyoNLXTK2EuOXAXZkOMnLmbk3PzFv9zzo=;
 b=cuGYhVojQnurZYQwxUs3k45wUpge09Y5EXH2df1j0C8UR1Kin50Lez7s
 HyOms4xCOFLRovwGWE7RkBKz2vRn4nAUIEra/Vtgo+F2tUO8VDFLMNuOr
 o3HGXZLH4cXnKHn6U1/eKKrP5sLMUm354jJQfcxV/tPO0PRAsjJ78SVXu
 +Nu1tMa+rXiFJo4gUMKGzkDMsxCR2LYDcign8qRQgWuZZhjoqt6Nvk8bU
 jQG5AVp4T30G3fhegEug7IiPoqMv5sn9K0AvdMMYIFjOsIBaI0f14xQUN
 4o5sWOH4kEtd9RJPIZNBLU+o0YGMojVMEhGUYfpVS54uAzaqAAuiy4/8q w==;
X-CSE-ConnectionGUID: e/YlXoK9RUyUkzMx2VH+fg==
X-CSE-MsgGUID: ONWe+m5dQiumNNEDQgA44A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66688604"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="66688604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:33:04 -0700
X-CSE-ConnectionGUID: RL5kdib3QKyZSFq+km+VyA==
X-CSE-MsgGUID: MYeLZ/YzQaOvkz9QLlNUJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="169005722"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:33:02 -0700
Date: Wed, 14 May 2025 16:33:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 10/15] lib/igt_core: Conditionally define __noreturn
 for non-Android platforms
Message-ID: <20250514143300.yuyt5hn4o3a5tkco@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-11-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-11-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-07 at 16:01:43 +0000, Jeevaka Prabu Badrappan wrote:
> Ensure __noreturn is defined only if it is not already defined,
> addressing compatibility with Android where __noreturn is predefined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 45170e215..2db579423 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -86,7 +86,9 @@
>  #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
>  #endif
>  
> +#ifndef __noreturn
>  #define __noreturn __attribute__((noreturn))
> +#endif
>  #define __maybe_unused __attribute__((unused))
>  
>  extern const char* __igt_test_description __attribute__((weak));
> -- 
> 2.34.1
> 
