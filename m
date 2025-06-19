Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A60DC7115A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 09:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972610E9D9;
	Thu, 19 Jun 2025 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkvPDAJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAA710E9D9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750325704; x=1781861704;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ciBb0ZTcLk7ePKFutdCe5Sy2WqSbmU079YMEAGXOsKg=;
 b=kkvPDAJmlEsBU+fbPrNcUIakRMQa0gQdVSRBebAc/K/AMDuaah5IQv0f
 ZCXeTsYbHv31AEZ943VEp5CIz0Oz0xMkXk3FjasuW3Vb9O94UxbsPmKC8
 QcDnuYNHS16XsT7LtrWRV5K+u8ujOzcwCyWZO2g+4vo564dTiatGH6F5K
 qTrsQOGwah0c8PxmRmYofsLLvZabAfmNluc2OrF6UgXhG5QP1Fn6jUSi9
 yt2/IAsk8HHyjXH3lbEp/4g+Bf5SyIiWldNGB2us16TqSYiD9FdfdcOjr
 UHW9r+1Z3hd3DlTns7nM84HteehCe7huKLfqyU6wGQOKcOFo0lKoCvCrM Q==;
X-CSE-ConnectionGUID: EUJYf2xHTby5AV0mcAFiiA==
X-CSE-MsgGUID: OEEEiXmDTxaPndgs4dR3hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52717969"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52717969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:35:04 -0700
X-CSE-ConnectionGUID: PWibdIeJS6SoTtLv/yHLtg==
X-CSE-MsgGUID: ay26j4weQ9iJfHPxEFjVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="156383010"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 02:35:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: clinton.a.taylor@intel.com
Subject: Re: [PATCH i-g-t] lib/pciids: Add additional pciid for Battlemage
In-Reply-To: <20250619093004.3589959-1-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250619093004.3589959-1-kunal1.joshi@intel.com>
Date: Thu, 19 Jun 2025 12:34:58 +0300
Message-ID: <0edecc63691cde2a62ed94327401369141404348@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 19 Jun 2025, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> From: Clint Taylor <clinton.a.taylor@intel.com>
>
> In BMG pci ids added 0xE221

This file must be updated by copying from the kernel
include/drm/intel/pciids.h, noting the kernel commit id for the file
updates.

BR,
Jani.

>
> Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
> ---
>  lib/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index d212848d0..7624fb48d 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -853,7 +853,8 @@
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
>  	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__)
>  
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \

-- 
Jani Nikula, Intel
