Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F231D6D22A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 14:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2510E9EA;
	Thu, 18 Dec 2025 14:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNR0elM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A0E10E9EA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766067046; x=1797603046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RP02nOwkW6lznIKeiMJTncgrzPFb98APcEzPTRBM8EE=;
 b=bNR0elM9Z5opgOb7o3E3fkJPjnu8p/iquhv4iSU731e4b6TKNd5D1dyr
 +vRjZzATtbjjBGwMDYtxvLq0VNqdYCGqPqjFGIo3AIICrv1wphVe6LicV
 CV7t5jTC2NA/lLPdKoAdmZmWov4x/YYUWsIHFEr4Xm15ifOXSoWde8ATP
 37aWXiNvvJkwvGNJ9y6PMxV7oTM//PIxuHVE5G0HtpINQGDLQ70dxgA9u
 tl00xSwhcZ+6K3nL7aNHbQ9IrAxsX3ztoz8l4Dy/JymloS7HM/tC48VGG
 2Pmf2oroXto5INjEoS1y7d17ByZ112rdRVGL39BQ0Ezxd31MAoBte/Clv w==;
X-CSE-ConnectionGUID: Tv/hLKjwR7izVC7+/wu/CA==
X-CSE-MsgGUID: SnHvI/X1R1SiwWvxopIO6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90676589"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90676589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 06:10:46 -0800
X-CSE-ConnectionGUID: /EbX84RYThC0/Y2skOMDYQ==
X-CSE-MsgGUID: peH854s/Q6eq5MWikgBhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203104706"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 06:10:45 -0800
Date: Thu, 18 Dec 2025 15:10:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_test_config: Add SR-IOV VF FULL
 testlist
Message-ID: <20251218141042.ynstirp4ufiuulog@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251217165929.49760-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217165929.49760-1-jakub1.kolakowski@intel.com>
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

Hi Jakub,
On 2025-12-17 at 16:59:29 +0000, Jakub Kolakowski wrote:
> Currently we have BAT testlist for VF runs and both BAT and FULL for VM
> runs. Add missing FULL testlist for VF runs.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_test_config.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 65e685470..4d76fbe0f 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -11,13 +11,13 @@
>                  "default-testlist": "FULL",
>                  "update-from-file": {
>                      "exclude-type": "regex-ignorecase",
> -                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
> +                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VF, Xe FULL VM",
>                      "include": [
>                          { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe.fast-feedback.testlist" }
>                      ],
>                      "exclude": [
> -                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> -                        { "Xe BAT VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
> +                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VF, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
> +                        { "Xe BAT VF, Xe FULL VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
>                          { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe.sriov-vm.blocklist.txt"}
>                      ]
>                  },
> -- 
> 2.25.1
> 
