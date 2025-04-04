Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0310FC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 15:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0510EBEB;
	Fri,  4 Apr 2025 15:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vk9gkOg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A670410EBEB
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743780301; x=1775316301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ryfgT9GeD6pYlmaHRdN/7V/0xKTI3VEBoIBDLTSkyU0=;
 b=Vk9gkOg0NTZEQLE1LA3syDfS+aauIsgKu/xV2lhKKEkMA42UcgdXL+21
 s16q0b52gEafXWfzqyty8b/wrn4sMVPTyzlkVNVVT4+OrcTRJIEGsly1K
 psSJ+Wq6ccqXTcU+yQglwOku5tpVLZnm75g3XwR4sYlDPWjE9UbGecS50
 ZqvSZwkcHhnveowweofUGOUkHeIvKjaep+ZAFNIhG/3Ls8792BnU/a1Pn
 /RoSa3SaDzHiJNAOib6OXN4etFVMdlrJGDynf4wSEkMVWYx7reMut+HEe
 luIb6vXqGszXgBCYZHt6g/4KuYZUUyd56FSB4RRPg5x6icPhzUFpLk8Eb g==;
X-CSE-ConnectionGUID: 6Dmk3HELRDW20vionQo9Zw==
X-CSE-MsgGUID: usLO8LedTVWOgHBasBnK9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45130320"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45130320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:25:01 -0700
X-CSE-ConnectionGUID: PXMicJ/oSZa1oQQKXDZ4Pw==
X-CSE-MsgGUID: Nd8VWOndRsuMSIJy5ThKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="158325017"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:24:58 -0700
Date: Fri, 4 Apr 2025 17:24:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v4 5/5] HAX patch do not merge
Message-ID: <20250404152456.snv6axhoemh47mml@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
 <20250325210146.3338454-6-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325210146.3338454-6-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-03-26 at 02:31:46 +0530, Naladala Ramanaidu wrote:
> HAX patch do not merge
> 

Could you also modify kms_3d test so that before skip it
will try to load image and tell if it was succesfull?

Regards,
Kamil

> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist    | 168 +-------------
>  tests/intel-ci/xe-fast-feedback.testlist | 273 +----------------------
>  2 files changed, 2 insertions(+), 439 deletions(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index be0965110..d8fae0172 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -2,170 +2,4 @@
>  igt@i915_module_load@load
>  
>  # Keep alphabetically sorted by default
> -igt@core_auth@basic-auth
...cut...
> +igt@kms_3d
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 0234d3e72..c1c1f735e 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,275 +1,4 @@
>  # Should be the first test
>  igt@xe_module_load@load
>  
> -igt@fbdev@eof
[...]
