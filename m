Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD48CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 14:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA110E105;
	Tue, 28 Oct 2025 14:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDT0Ferx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB74B10E105
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761662512; x=1793198512;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Mm8HFwajKW7289BwKSMxMDTRASqCI7CrnMMmHajqhmg=;
 b=gDT0FerxzXI2YA4Z4KYF6mzRog+eZbS5ppz9kpW8q6V5LyhwU+UAHnBx
 +mj5CwJpNGWS0oZad8sl/svxJKLB0xnklUGsRi+2jKPFGW3yaAwNPV4dH
 YbKI3x4+NU20LoO/k3baxPYBLkJtalzFjP2IAg9enpVohRMqgpHcci7q1
 wY4O2S0bfTSTwaB481REzKH9xfCRZAZuK01ovi5CVgit2KHPm6iwTkLqL
 BngteozyZzqGFdMltyzJNDbM5Lrr1GwRknUqJv0dgghPHky+VMC/gY0+v
 Em4bm4osvPbTpYEZSqNGFsBqOqrpeinuwtLpmBbu3rfZP7A/LhskqM3is g==;
X-CSE-ConnectionGUID: vtyamZWcQDGKedt7B1thUg==
X-CSE-MsgGUID: h+T5hR3vQXuJ5vRqRlemfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63666839"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63666839"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:41:51 -0700
X-CSE-ConnectionGUID: GZYYYW4uSkGpR7KgAcY6bQ==
X-CSE-MsgGUID: VI6DV8FzQam+z/Gy9sFLTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189680818"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:41:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
In-Reply-To: <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
 <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
Date: Tue, 28 Oct 2025 16:41:45 +0200
Message-ID: <3015f56dd17cf5c019824f69f532a0e06b98253a@intel.com>
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

On Tue, 28 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> This is the script I've used, but never bothered to upstream to igt. It
> does create separate commits for each kernel change, which was useful in
> catching up with a lot of kernel changes while remaining bisectable in
> igt.

Seems to work still. Running it now generates this log:

commit 3ce2a3f06b01cad80923740135bc33fe0967e237 (HEAD -> master)
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 28 16:39:30 2025 +0200

    lib: sync i915_pciids.h with kernel commit 5e0de2dfbc1b
    
    Synchronize i915_pciids.h with kernel commit:
    
    5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>

commit 27720193af75e531f505921e13a17d7dd36a6482
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 28 16:39:30 2025 +0200

    lib: sync i915_pciids.h with kernel commit c002b1764e7b
    
    Synchronize i915_pciids.h with kernel commit:
    
    c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>

commit 8dd7f13b8ee6f4dd10427481c9a5e28f6baeed2e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 28 16:39:30 2025 +0200

    lib: sync i915_pciids.h with kernel commit 78de8f876683
    
    Synchronize i915_pciids.h with kernel commit:
    
    78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>

commit 62e36b49a7441a7422e0b594c14dbdd2aca00968
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 28 16:39:30 2025 +0200

    lib: sync i915_pciids.h with kernel commit 32620e176443
    
    Synchronize i915_pciids.h with kernel commit:
    
    32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>

commit faa31026a59875bc636619e69f7296a1d69fe289
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 28 16:39:30 2025 +0200

    lib: sync i915_pciids.h with kernel commit edb660ad79ff
    
    Synchronize i915_pciids.h with kernel commit:
    
    edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel
