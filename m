Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6009DD6ACF7
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 17:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7510EB7B;
	Wed, 27 Nov 2024 17:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAmkB4oX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AFA10EB7B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732727180; x=1764263180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rTf3wOEKvAW26lalouYmCUUh47jfmOSJ5rZEezD+/aA=;
 b=IAmkB4oXwNa67EUabCBTeaM1PZiZmk0Y9LKRQ27bkTnm45tVPRapXtFc
 HUlbCEgzx4wOhhwtZLDydVbwtuslQluWpHo/DLgh9m34EMy/vify7SrlP
 N3HiCWFtDnXy4Zlq1vz+eAo4/8n1YYZ8fK5V/d1epEgxD0Wp04nv1uDeQ
 9MPB+NNEaAeJ8oqOgZ0j+gJ3WJELRFgwv4pNsp/sVvFtFmHh4qEU9ZbY0
 6R31M8IIpr+AFYgl3eSUeuT0KW3Ul24V4mN3qT15/HvNzr+xpnyXGvDcm
 YiorNOA4oex+i/8mOEqZOqspSU3lgc4IUMvo8IiSiP8bS9VMMcyMqEmbN Q==;
X-CSE-ConnectionGUID: Ruh5FHvyTUaSvHQqnY543w==
X-CSE-MsgGUID: F37tJPPcRzGkFyfDzpVSiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32994331"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32994331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:06:19 -0800
X-CSE-ConnectionGUID: vJWBNl3NQxiATn+U9aHgzw==
X-CSE-MsgGUID: 7LpGt0aATYe0oBrT0R6AWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91621170"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.120])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 09:06:16 -0800
Date: Wed, 27 Nov 2024 18:06:12 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com,
 krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <Z0dRhNam6i6ZFsAN@ashyti-mobl2.lan>
References: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
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

Hi Mikolaj,

On Mon, Nov 25, 2024 at 10:25:50AM +0100, Mikolaj Wasiak wrote:
> Apply workaround when running background spins in hangman test.
> Disable bcs0 background engine when testing ccs0 and vice-versa.
> 
> Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
> ---
>  tests/intel/i915_hangman.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> index a556eec53..2948cebd7 100644
> --- a/tests/intel/i915_hangman.c
> +++ b/tests/intel/i915_hangman.c
> @@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
>  #define ERR_FENCE_END  3
>  #define ERR_FENCE_STAT 4
>  
> +static bool
> +is_bcs_ccs(const struct intel_execution_engine2 *e) {

Please use Linux kernel coding style here.

Besides this declaration fits in one line within 80 characters,
no need to break it into two lines.

Otherwise the patch is fine.

Andi
