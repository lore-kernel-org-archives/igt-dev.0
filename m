Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E61CCA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 11:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413A910EB8A;
	Fri, 29 Aug 2025 11:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCfglocG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD59B10EB8A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756466274; x=1788002274;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YRTZ0Nq4D6bgCfCtpbRjBE5gXqSY35QDy8bnOZXN2UU=;
 b=GCfglocGQH6MndSwRpfIEu31hZcUzhHfH4EKD1pQok2FRmh/q7FgMB1W
 dba/S3Iz2QK1DA1BbJE25Cy+nLQbVJd6cscMQbwDruEDzGTq/zzuBu/xe
 8iAW7R0Ggwg5bKINOT09GECCxgJR9H+EOB9HrwmEMQ5qHC0rBjsHfcime
 81t7xjqnYey0fQ2uu7QZFbwoHj3sKqnicTNgvz6v+UV0fFaqXO87kxtDB
 7fR5Zm73veNfRJYk22StEc3JeEH9ASGQTxPXyfgusC7UwMhlxo8uZoKYv
 noNDpVqaTJbrNR0T9zesq7d6yLQFo8PMSoelfrfPBZbVehjwzki6LRVY6 Q==;
X-CSE-ConnectionGUID: M7Z8mYliSDanaRKBczfxuA==
X-CSE-MsgGUID: zcDuVJatTya/GDQGQqA3Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81341426"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81341426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:17:53 -0700
X-CSE-ConnectionGUID: 3QozEplmQpyzS0BsgFQIwA==
X-CSE-MsgGUID: hFLlKB2eS1azAbEz6Q9Etw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169927358"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.112.195])
 ([10.245.112.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 04:17:51 -0700
Message-ID: <fd80a247-147c-4ec4-8025-ed64a3bf4303@linux.intel.com>
Date: Fri, 29 Aug 2025 13:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel-ci/: Extend VF and VM blocklists
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
 <20250825165346.504290-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250825165346.504290-2-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/25/2025 6:53 PM, Jakub Kolakowski wrote:
> Currently VF and VM blocklists are supposed to be short and only
> contain tests that are breaking/aborting the CI run. However with the
> huge amount of expected skips present in VM runs it is justified to
> change the approach of using those blocklists and include all tests that
> are expected to skip when driver is in VF mode.
> Extend VF and VM blocklists and include expected skips. This should
> speed up CI runs in configurations where driver is in VF mode (mainly VM
> runs where many kms tests are skipping).
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel-ci/xe-sriov-vf.blocklist.txt | 54 +++++++++++++++++++++++-
>   tests/intel-ci/xe-sriov-vm.blocklist.txt | 52 +++++++++++++++++++++++
>   2 files changed, 105 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> index 03371d80c..69d647ef0 100644
> --- a/tests/intel-ci/xe-sriov-vf.blocklist.txt
> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> @@ -4,4 +4,56 @@
>   #
>   # Prevent potential module reloads during tests
>   #
> -igt@xe_module_load
> +igt@xe_module_load@.*
> +#
> +# tests applicable for PF only
> +#
> +igt@sriov_basic.*
> +igt@xe_eudebug_sriov.*
> +igt@xe_pmu@.*fn-engine-activity.*
> +igt@xe_sriov.*
> +#
> +# display related tests
> +#
> +igt@fbdev.*
> +igt@kms.*
> +igt@testdisplay
> +igt@xe_pat@.*display.*
> +igt@xe_pxp@.*display.*
> +#
> +# power management related tests
> +#
> +igt@xe_gt_freq.*
> +igt@xe_pm_residency.*
> +#
> +# OA is disabled in VF mode
> +#
> +igt@xe_oa@.*
> +igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs
> +igt@xe_query@.*query-oa-units
> +#
> +# engine utilization data not available in VF mode
> +#
> +igt@xe_drm_fdinfo@.*utilization.*
> +#
> +# EU stall feature not available in VF mode
> +#
> +igt@xe_eu_stall.*
> +#
> +# The "mocs" debugfs entry is expected to be missing in VF mode
> +#
> +igt@xe_exec_reset@gt-mocs-reset
> +igt@xe_live_ktest@xe_mocs
> +igt@xe_pm@.*-mocs
> +#
> +# PCI power management capability not present in VF mode
> +#
> +igt@xe_pm@.*d3
> +#
> +# freq0 node not available for VF
> +#
> +igt@xe_pmu@gt-frequency
> +#
> +# The feature query_cs_cycles is not supported on VF
> +#
> +igt@xe_query@.*cs-cycles
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> index 06ed60b52..6271b1a70 100644
> --- a/tests/intel-ci/xe-sriov-vm.blocklist.txt
> +++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> @@ -6,3 +6,55 @@
>   #
>   igt@xe_pm@s2idle.*
>   igt@xe_ccs@suspend-resume
> +#
> +# tests applicable for PF only
> +#
> +igt@sriov_basic.*
> +igt@xe_eudebug_sriov.*
> +igt@xe_pmu@.*fn-engine-activity.*
> +igt@xe_sriov.*
> +#
> +# display related tests
> +#
> +igt@fbdev.*
> +igt@kms.*
> +igt@testdisplay
> +igt@xe_pat@.*display.*
> +igt@xe_pxp@.*display.*
> +#
> +# power management related tests
> +#
> +igt@xe_gt_freq.*
> +igt@xe_pm_residency.*
> +#
> +# OA is disabled in VF mode
> +#
> +igt@xe_oa@.*
> +igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs
> +igt@xe_query@.*query-oa-units
> +#
> +# engine utilization data not available in VF mode
> +#
> +igt@xe_drm_fdinfo@.*utilization.*
> +#
> +# EU stall feature not available in VF mode
> +#
> +igt@xe_eu_stall.*
> +#
> +# The "mocs" debugfs entry is expected to be missing in VF mode
> +#
> +igt@xe_exec_reset@gt-mocs-reset
> +igt@xe_live_ktest@xe_mocs
> +igt@xe_pm@.*-mocs
> +#
> +# PCI power management capability not present in VF mode
> +#
> +igt@xe_pm@.*d3
> +#
> +# freq0 node not available for VF
> +#
> +igt@xe_pmu@gt-frequency
> +#
> +# The feature query_cs_cycles is not supported on VF
> +#
> +igt@xe_query@.*cs-cycles
> \ No newline at end of file

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
