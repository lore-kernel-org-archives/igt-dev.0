Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17550D609D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 17:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF4410E81A;
	Tue, 16 Dec 2025 17:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKxEklSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0B710E81A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765906617; x=1797442617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pbn04uWQoic6GjWC15yC01VdiuDyybqar2RjYhTLyLU=;
 b=nKxEklSEuDGIG6s3xllpkpwkfZ/YTPDrA0wR8tux9kBn9FkOnuA3aENi
 4XZZTRcmcO/xqKATMg33xocsldvfIKnfULHiOErWQQb+AZ52SvPvpq6Qh
 BkD1KsHPdIwuifiWUPI39nix1FHOBvH5iax/tsQjpyxzk/Ccx/LAdNUyE
 jHefjumq9wHwZVtwxPO6y5r9+2P0LKFqfgxbDV9eWBpGVBDdMYVAmpVkd
 JFiDVD9KFuWmtzj7CN9V54zE2NWH3rKTDVRWcSxtC9lWNlfNCgk/hVWJ8
 bpPQK7x+76R5yA51C8tX13296klc4SGpL0C8wJG8Sh3r9Euxu+J0hIY8e Q==;
X-CSE-ConnectionGUID: hIO62CkaSjujwMNYSBFMuA==
X-CSE-MsgGUID: Ik20rIKOT4KsbrVuiJ/zyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67791755"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67791755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:36:56 -0800
X-CSE-ConnectionGUID: yTzXwmmxR0W2WvJ1Dx2/Yw==
X-CSE-MsgGUID: RwO0wL/2QpSYouwnDh7YeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198129521"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:36:55 -0800
Date: Tue, 16 Dec 2025 18:36:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
Message-ID: <20251216173653.knmo2oyysxzu2ohk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com
References: <20251216091433.1245664-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216091433.1245664-1-mohammed.bilal@intel.com>
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

Hi Mohammed,
On 2025-12-16 at 14:44:33 +0530, Mohammed Bilal wrote:

please simplify subject, just write:

[PATCH i-g-t] intel-ci: Enable additional Chamelium tests

> Enable additional Chamelium tests, including hibernate-related
> subtests and random plane comparison tests.
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/intel-ci/chamelium-only.testlist | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index 99d2f2409..50cba517a 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -67,3 +67,10 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>  igt@kms_chamelium_hpd@vga-hpd-without-ddc
>  igt@kms_chamelium_sharpness_filter@filter-basic
>  igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate

Instead of adding it at end, please keep this list sorted
alphabetically.

Regards,
Kamil

> -- 
> 2.48.1
> 
