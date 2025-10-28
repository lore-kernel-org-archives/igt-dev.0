Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173B2CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 16:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07E010E60F;
	Tue, 28 Oct 2025 16:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BblSgDy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EAF10E60F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761670778; x=1793206778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=di5LVqjK4RImpMYIV5uyjkW/by6gkhumw9rlvZ1+OS0=;
 b=BblSgDy04ZIELE98BSUL5YeSCa3MntXRp2cxHe4pnrWvWPa+ZBJA3kl3
 5R/DualEjRDDfCk9VbOHudPssnCj4IYjuD/2TwLDnIj5kBnuBOPpJR7Sy
 LV2wOEmVj6AMbjFVgF1LKJJqRsJvlrJUjyqb1XeS+0+1yo0fOYA7ry+BW
 gL4QEA7KhqGPy/b18TRNEoIhJOf3crBPk7JwEgsINpBY8qcnEU74tmovz
 ZfFeoGaVO901TtviPsQUAjYn/Dpl0oDS4HyTXrwhnMaUI2rSr2tKXgEKU
 aUqZlpWHbMYHQKZwq6p6csFwHGzoA6Z3DqusyYJliqlCzj7oyEI5DS4Ic Q==;
X-CSE-ConnectionGUID: duB3GwsAQWOrd0WdgJ/leQ==
X-CSE-MsgGUID: J9RtYa7cTEy+4cVEi0bnSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81200755"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81200755"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:59:37 -0700
X-CSE-ConnectionGUID: G++jbhhdRTq5D2hfZIQvtg==
X-CSE-MsgGUID: BGi3ffQHQVGfIeQXi4iIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185738090"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:59:35 -0700
Date: Tue, 28 Oct 2025 17:59:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
Message-ID: <20251028165933.73ytkedshcwzs3sl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
 <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
 <3015f56dd17cf5c019824f69f532a0e06b98253a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3015f56dd17cf5c019824f69f532a0e06b98253a@intel.com>
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
On 2025-10-28 at 16:41:45 +0200, Jani Nikula wrote:
> On Tue, 28 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > This is the script I've used, but never bothered to upstream to igt. It
> > does create separate commits for each kernel change, which was useful in
> > catching up with a lot of kernel changes while remaining bisectable in
> > igt.
> 
> Seems to work still. Running it now generates this log:
> 
> commit 3ce2a3f06b01cad80923740135bc33fe0967e237 (HEAD -> master)
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Oct 28 16:39:30 2025 +0200
> 
>     lib: sync i915_pciids.h with kernel commit 5e0de2dfbc1b
>     
>     Synchronize i915_pciids.h with kernel commit:

Every code rots, here there are no longer i915_pciids.h nor
xe_pciids.h, it is now one pciids.h.

Up to you, if you want to upstream it and maintain it later.

>     
>     5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> commit 27720193af75e531f505921e13a17d7dd36a6482
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Oct 28 16:39:30 2025 +0200
> 
>     lib: sync i915_pciids.h with kernel commit c002b1764e7b
>     
>     Synchronize i915_pciids.h with kernel commit:
>     
>     c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> commit 8dd7f13b8ee6f4dd10427481c9a5e28f6baeed2e
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Oct 28 16:39:30 2025 +0200
> 
>     lib: sync i915_pciids.h with kernel commit 78de8f876683
>     
>     Synchronize i915_pciids.h with kernel commit:
>     
>     78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> commit 62e36b49a7441a7422e0b594c14dbdd2aca00968
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Oct 28 16:39:30 2025 +0200
> 
>     lib: sync i915_pciids.h with kernel commit 32620e176443
>     
>     Synchronize i915_pciids.h with kernel commit:
>     
>     32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")

Hmm, I didn't see it in drm-next between vendor/id and 'Handle Wa_...'

Regards,
Kamil

>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> commit faa31026a59875bc636619e69f7296a1d69fe289
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Oct 28 16:39:30 2025 +0200
> 
>     lib: sync i915_pciids.h with kernel commit edb660ad79ff
>     
>     Synchronize i915_pciids.h with kernel commit:
>     
>     edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>     
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> 
> -- 
> Jani Nikula, Intel
