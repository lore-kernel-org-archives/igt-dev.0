Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08436C36010
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22988DE5;
	Thu, 27 Mar 2025 17:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2i+UNZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2CC89263
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743095027; x=1774631027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rkaeDzuZUwbGUEBTSWw8bskp+QYmCzgU9SqB1Y2vxys=;
 b=Q2i+UNZ+XMcY5ZkxAF1zry1q3fMBsohlrGfzOlMkvQfRaX6rm/PwWZj9
 2Ms6RirsBGZFyGkzQmP14wTRxm4oIYWzf7dDN74g+rpWeXAAESdYzVXcM
 nUroGGU/fc4czWg2I3NwvcFxeEMJnY6bFrEtlRpgwELEKe7TNWPVN+sOQ
 mrHSgxvs+nyiN2mB6ftHD5uCWmaTAJaSR4vn6OpO6rv+9AzXbq6KxegUc
 vVv4zPl/MVGfw563G48tgcdIJ3wlLbf9z3d93n/3DjpJDQRKiFjyfhI/d
 YD+iLOG99kQyY7dxbbohvZRg/Q5Ak5/p0nICs+akwbdO4GpEkI/OYFh+o w==;
X-CSE-ConnectionGUID: NjiOcVSoRICkoQSiSM1kCw==
X-CSE-MsgGUID: V1qMUomTTyauc124J3/C1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="32044123"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="32044123"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:03:46 -0700
X-CSE-ConnectionGUID: iCm30NWmTOalmefloEFwUw==
X-CSE-MsgGUID: qL82xh/gQfyVID2XTztJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="148388262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 10:03:44 -0700
Date: Thu, 27 Mar 2025 18:03:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt:
 Blocklist for SR-IOV VM runs
Message-ID: <20250327170341.uyqvv6jni77qjmc2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-26 at 13:42:03 +0100, Marcin Bernatowicz wrote:
> This file contains tests that are not applicable for QEMU Virtual Machine
> (VM) runs. It extends xe.blocklist.txt and should be kept as minimal as
> possible.

Do this apply to all suspend related tests? I see only two added,
but grep gives:

grep -A2 igt_system_suspend tests/intel/xe*c

tests/intel/xe_pm_residency.c
tests/intel/xe_gt_freq.c

> 
> v2: Added igt@xe_css@suspend-resume.
>     Removed inaccessible reference. (Lukasz)
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel-ci/xe-sriov-vm.blocklist.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 tests/intel-ci/xe-sriov-vm.blocklist.txt
> 
> diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> new file mode 100644
> index 000000000..06ed60b52
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
> @@ -0,0 +1,8 @@
> +##################################################################
> +# Block list for VM runs
> +##################################################################
> +#
> +# rtcwake does not wake the VM from s2idle
> +#
> +igt@xe_pm@s2idle.*
> +igt@xe_ccs@suspend-resume

This last could be:
igt@xe_.*@suspend.*

Up to you.

Regards,
Kamil

> -- 
> 2.31.1
> 
