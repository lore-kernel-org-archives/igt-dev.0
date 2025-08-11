Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CADCA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1D10E044;
	Mon, 11 Aug 2025 18:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvGcdq6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444010E044
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754937221; x=1786473221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i4S9b9F4nyPGeZ9AWFPElJgDTDz+LWy4N1SVpPvnK8A=;
 b=ZvGcdq6Zj9RNsOXPv6LtUCLSSA0amQh3O2hyxvMWIvVweNHz4yKJzlNh
 fHYh5bByVdnE6BSmg1rPN07q3kJnzVjO2KaywLtkdmwelu0Gwprq+lZW9
 tkUEa0GfPFqB4QFCTDvt7Pcp77wxEOe1z3NHrKcKlhtw+5q/OULkEC78l
 oieoYp/HEOGzvTHBVSu7IFzU5M0Mq/hQJozyyXLeKb4f50EA+3qSXyiIm
 O8jLaLb8Low0iwl3uK7b/UfC5l4FnkPKvko6O7GHj2V4nLiskXhvlQJvz
 QWIwnC0TUDRIVD8Ymk/zszv//b8oIcHDbeMaaDSQz2I2a7Fum0zXtxmpS w==;
X-CSE-ConnectionGUID: uWWrcD2pTJOxJ7Sd1pWV0g==
X-CSE-MsgGUID: /B0CD6AUQuKLKlfyEli/qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68654429"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68654429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:33:41 -0700
X-CSE-ConnectionGUID: A3wSoYfBQnezVdhmK4dxfw==
X-CSE-MsgGUID: ip1LNd0HT4KiuUXFGY+5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166378047"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:33:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: satyanarayana.k.v.p@intel.com, matthew.s.atwood@intel.com,
 igt-dev@lists.freedesktop.org, himanshu.girotra@intel.com
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] intel/xe_fault_injection : Update function name for
 xe_wa_init
Date: Mon, 11 Aug 2025 11:33:25 -0700
Message-ID: <175493713910.2580137.4462595332267339241.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811161008.5355-1-himanshu.girotra@intel.com>
References: <20250811161008.5355-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 11 Aug 2025 21:40:08 +0530, himanshu.girotra@intel.com wrote:
> Update function xe_wa_init to xe_wa_gt_init as per latest kernel changes
> introduced in https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/342d1f84320994ab72a6ca96e18f2985868e1cbd
> 
> 

I just removed the extra space in the subject so it is
"intel/xe_fault_injection:" rather than
"intel/xe_fault_injection :" and applied.
Thanks!

[1/1] intel/xe_fault_injection : Update function name for xe_wa_init
      commit: 1e6c0d07b83cde9f2300b193f441c37d9dde5981

Lucas De Marchi

