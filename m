Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC07D5E152
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 10:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7F10E081;
	Fri,  8 Nov 2024 10:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIjh7qK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5731310E081
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731061250; x=1762597250;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yf98RV+oijL6XCWi09WuuKBrW78aYustS6cvEMRXukU=;
 b=DIjh7qK/Ei+QfVzN4vHeFFX3UscZ5mXnx9ZnioDjv2nWSqComrW1VTFm
 Z5YtzWGIvDUaqMi2SqB8M/XaHXVv8iB5H0+FEBmwcvZpizWW5mkR+L2yz
 EvusARk/l4RuUIwx6Iw6qALUw/WHh6Qk0yTFZ50JiRgfRQt0JXsNRJgrJ
 akB1EhaszlunykTJggUCS2ezxSl0C3nuGmAYF+7sVmky6uqxBWW8o2d7J
 L6qmBZO0/JZUK7b8RbAJsugMmFi1/FBUiwwIGZLVMYAjaA4MjyWk68kUl
 51vFI4TmirKngyntQV3IUk+FrKsntfcOPU+eowid+nlDjWYty7a2MdGmV A==;
X-CSE-ConnectionGUID: QaIpjeLWQr6WoU1mNJfKpQ==
X-CSE-MsgGUID: /sA7i/EVQVi8pdjjv/bH+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31108209"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31108209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 02:20:50 -0800
X-CSE-ConnectionGUID: GsQv7HKVSNevL0Y2A8SycA==
X-CSE-MsgGUID: pD00Dt2wRXO2doSE3sGtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="85639709"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 02:20:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: clinton.a.taylor@intel.com, kamil.konieczny@linux.intel.com,
 zbigniew.kempczynski@intel.com, Ngai-Mint Kwan
 <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
In-Reply-To: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
Date: Fri, 08 Nov 2024 12:20:44 +0200
Message-ID: <874j4if2mb.fsf@intel.com>
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

On Thu, 07 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index ef2f74be8..9eb1141d4 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -37,7 +37,7 @@
>  
>  #include <i915_drm.h>
>  
> -#include "i915_pciids.h"
> +#include "pciids.h"
>  #include "i915_pciids_local.h"

After this gets merged, maybe you could write a follow-up patch that
renames i915_pciids_local.h to pciids_local.h and cleans it up; there's
some old cruft in there.


BR,
Jani.


-- 
Jani Nikula, Intel
