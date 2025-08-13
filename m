Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A78CA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 14:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A693C10E1E6;
	Wed, 13 Aug 2025 14:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZpHq5av";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F9410E1E6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755094508; x=1786630508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iygHiDLbmCXmjfPJEHfc4sk9msyVv4hqCTX5wzXcjXo=;
 b=PZpHq5avEnnwaZbgSKiJqbLOvRAb9iE5ozIjQsFzKYmbOv7oCLeZM4Uc
 VhVhH0puPP0vd9b37uUgpt78gihEG9x6wcLybnjsi4dAQjvBnR12EGJmT
 wz0yI8HYFX5lmWkL14orfAl2rsfoky73iM1VwhlcSmgQSQj7eMOY0+rss
 rxOzfJgDFm+gU+y/uJS7GAz6TU8HRsNaOhvDxPe5iF1M/ql0IscXo/YCn
 GsV4rbTwgLOmbR/FQxlqx7AXl6i6TxqF10HeYAeC0ZAQAksbobdPWi5JW
 f0ukt+1Nn0Q4B3XUKWbrMV5wlzU8c9CfD1os2LcHc2qk1jxsI+yv5pXRW g==;
X-CSE-ConnectionGUID: Z8Ycq8oRSr22vmXdqQTybQ==
X-CSE-MsgGUID: 1CHYtN4gTi2TZj++3EZQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57455954"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57455954"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 07:15:07 -0700
X-CSE-ConnectionGUID: VHDgC1tyT52HcC83+cktIg==
X-CSE-MsgGUID: E6fmBYQuTFiCdGYjFfWNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166373066"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 07:15:06 -0700
Date: Wed, 13 Aug 2025 16:15:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit 96b451d53ae9
Message-ID: <20250813141503.5dpg2tblm325oy4v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1754916577.git.jani.nikula@intel.com>
 <ba7afed7dbbc4ee1d1599bd66a7f453f15df1b4a.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba7afed7dbbc4ee1d1599bd66a7f453f15df1b4a.1754916577.git.jani.nikula@intel.com>
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

Hi Jani,
On 2025-08-11 at 15:50:26 +0300, Jani Nikula wrote:

please update subject, for example:

[PATCH i-g-t 4/4] tools/intel_vbt_decode: Fix documentation

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

PS. same here, no need for resend, could be done at merge time.

> Synchronize intel_vbt_defs.h with kernel commit:
> 
> 96b451d53ae9 ("drm/{i915,xe}: convert i915 and xe display members into pointers")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tools/intel_vbt_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index e9b809568cd4..92c04811aa28 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -446,7 +446,7 @@ enum vbt_gmbus_ddi {
>   * basically any of the fields to ensure the correct interpretation for the BDB
>   * version in question.
>   *
> - * When we copy the child device configs to dev_priv->display.vbt.child_dev, we
> + * When we copy the child device configs to display->vbt.child_dev, we
>   * reserve space for the full structure below, and initialize the tail not
>   * actually present in VBT to zeros. Accessing those fields is fine, as long as
>   * the default zero is taken into account, again according to the BDB version.
> -- 
> 2.47.2
> 
