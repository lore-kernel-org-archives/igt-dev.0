Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D2C369A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 17:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53E10E14B;
	Thu, 10 Apr 2025 17:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBD3wJ4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315410E14B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307301; x=1775843301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZIaQBOf3bdQiexoSOSN32PS4gN9TNLGVo43axAnyyHs=;
 b=HBD3wJ4tCIOhUHJXTQkW31NwqiSiCnZH0F/de+azJ27gxFnfyQbKgrFc
 j/PkcHc/0feegIXonVJYVtziF8J5X34G0Lzm3S/HjXuKtXLzR8GzC+Hc3
 CDXC1Z5GdJjNieoTwS36n2OS0UeJfXHmXkmhvhk4j1KGdqVfhOFwySaHJ
 dBUdrfONHS5HG5rFIzoIoQ5iR1RjNafrKA5l+pomXVobcVbmCGi8ItOEI
 v0vePz9HYswEm2HSijWt+jQITc5B7F5hLsS24T7R3ivIuajpebV+v2zDm
 eGz3P/HEWOBM22DZS1c9y4mYcvGCyHnDO2JtpVMyzvWbUbGPmNCvn2VxQ g==;
X-CSE-ConnectionGUID: N18zxp+HSZS1OrsKG+gO6A==
X-CSE-MsgGUID: +xJHe03lSJqX418PxecSfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45972837"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45972837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:48:17 -0700
X-CSE-ConnectionGUID: EKqtxWZRQAeaoaVBAItXPg==
X-CSE-MsgGUID: esOAynDRS9mFbDf9lFkMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="159946915"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 10:48:14 -0700
Date: Thu, 10 Apr 2025 19:47:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [i-g-t] tests/intel: Remove debugfs_test and xe_debugfs
Message-ID: <20250410174757.4snur7nkm5hpgduo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250403102313.181408-1-peter.senna@linux.intel.com>
 <85a59a03cab8dab9aba0f98a88425c4c554dc15c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85a59a03cab8dab9aba0f98a88425c4c554dc15c.camel@intel.com>
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

Hi,
On 2025-04-10 at 16:11:22 +0000, Knop, Ryszard wrote:
> On Thu, 2025-04-03 at 12:23 +0200, Peter Senna Tschudin wrote:
> > With the introduction of intel_sysfs_debugfs both debugfs_test and
> > xe_debugfs became redundant. It is also important to notice that
> > igt@debugfs_test@basic-hwmon was already redundant because intel_hwmon
> > covers both i915 and Xe. So:
> >  - remove debugfs_test
> >  - remove xe_debugfs
> >  - update meson.build
> >  - update code_coverage.md and code_cov_selftest.sh to use
> >    igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
> >  - update fast-feedback.testlist to use intel_sysfs_debugfs and
> >    intel_hwmon
> >  - update xe-fast-feedback.testlist to use intel_sysfs_debugfs and
> >    include xe-debugfs-read-all-entries and xe-sysfs-read-all-entries
> >  - update xe-sriov-vf.blocklist.txt to use intel_sysfs_debugfs
> >  - remove reference to debugfs_test.c from i915_test_config.json
> 
> Nothing here appears to affect us, but for posterity, from the CI team:
> 
> Acked-by: Ryszard Knop <ryszard.knop@intel.com>
> 

Thank you all, applied.

Regards,
Kamil

> > 
> > Cc: himanshu.girotra@intel.com
> > Cc: aditya.chauhan@intel.com
> > Cc: pravalika.gurram@intel.com
> > Cc: sai.gowtham.ch@intel.com
> > Cc: ramadevi.gandi@intel.com
> > Cc: lucas.demarchi@intel.com
> > Cc: rodrigo.vivi@intel.com
> > Cc: kamil.konieczny@linux.intel.com
> > Cc: katarzyna.piecielska@intel.com
> > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  docs/code_coverage.md                    |  18 +-
> >  scripts/code_cov_selftest.sh             |   2 +-
> >  tests/intel-ci/fast-feedback.testlist    |   6 +-
> >  tests/intel-ci/xe-fast-feedback.testlist |   8 +-
> >  tests/intel-ci/xe-sriov-vf.blocklist.txt |   2 +-
> >  tests/intel/debugfs_test.c               | 244 ---------------------
> >  tests/intel/i915_test_config.json        |   2 +-
> >  tests/intel/xe_debugfs.c                 | 268 -----------------------
> >  tests/meson.build                        |   2 -
> >  9 files changed, 20 insertions(+), 532 deletions(-)
> >  delete mode 100644 tests/intel/debugfs_test.c
> >  delete mode 100644 tests/intel/xe_debugfs.c
> > 
[...]

