Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8898E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 22:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D7210E034;
	Mon,  9 Dec 2024 22:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aP8Ik/5I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBE110E034
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733782766; x=1765318766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yvmoIEm2f66NISEqca5W58NLGHLs7BqiXPsXYmgkhx4=;
 b=aP8Ik/5IW387oICHyIKQSVcDFAs/rDfRFr78KNLNlo3otL9izSDlxODz
 P90YaSLrhd61V3B7TIZHMq4RFc2r07XXMjnT4mL5Dt3h8fnKXcwH+6eKJ
 SgLOVyIYHMkY35JFPiXb+F0wB2VdBUQf1OjNUm8U8BgSDfmcuDOAHO/df
 glPrH1kVmVRZF/GNI1vDgRzI9spgZGZdZxsclfulImyqWz1uQ+q/TSgXH
 tlPjsZXK9GEKrJDxHjS0W3sncsH0URigk0pl0vEX1rNsY2QBo0DNzICrm
 vaSiONXKC9fJW9oBcED/oqW1WF9NP3etBEL5Q+Hhb7xfp1VdlXlQnaT5q Q==;
X-CSE-ConnectionGUID: YIvYdPkpQL6ajf3ZY56qZg==
X-CSE-MsgGUID: bevUpI+uQYmLKhThvGHqmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34227838"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="34227838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 14:19:25 -0800
X-CSE-ConnectionGUID: UZRf/05uQfaLjQKCcngyAw==
X-CSE-MsgGUID: oY4bVSVESquMz3kjJcUiPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95272251"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.188])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 14:19:23 -0800
Date: Mon, 9 Dec 2024 23:19:19 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 eugene.kobyak@intel.com
Subject: Re: [PATCH] tests/intel/gem_ctx_param: Add GTT size test
Message-ID: <Z1ds5586PmGEAd_K@ashyti-mobl2.lan>
References: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
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

...

> +	igt_describe("Tests that total size of GTT is power of two");
> +	igt_subtest("gtt-size") {
> +		gem_context_get_param(fd, &arg);
> +
> +		igt_assert_neq_u64(arg.value, 0);
> +		igt_assert(is_power_of_two(arg.value));

is the power of two really needed?

Andi
