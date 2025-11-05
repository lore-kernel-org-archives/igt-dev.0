Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92BACCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 10:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FABF10E2B6;
	Wed,  5 Nov 2025 10:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BH7lJ7VL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703C510E2B6
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762338598; x=1793874598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TshJYK+moZQuw4C2aQBr6emBos9wS5rQNQZ1Lcu9Xo0=;
 b=BH7lJ7VLKS6t45yzsg+x3XuB7ewSQ2QJy76O7XTsEDysdEVmuHBte0J6
 WbtDgovSLmox9lckzyeWmVirW0Uc84DbNBe3MxkK+X4lYuHbeGMDI8wPO
 Vh48SQ9scDUkYbNNfHP/0l8ueszbA1QxS1TNkU4l3/yU/scARgiNx0NcC
 EFOVkzEIHJ1VYDAAuF8iXNGQgk5DxIDD1kp2QMDoAWNHPShWsA5j0bIzg
 kyMTa5sw/ialXbDAuzPWk3WATQcnDLL+ihdSsu1uVFe5mCmkMVXhVuZoQ
 PROHK6r9tC7kpzIacnqwLaqnfvaPOnijedX2In9dQvNFGpDgETJiC3QxK Q==;
X-CSE-ConnectionGUID: g+KGlli7TWuDG+tjst/8iQ==
X-CSE-MsgGUID: yWVbXBn2Rgmop9siy5OFpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64485936"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64485936"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 02:29:58 -0800
X-CSE-ConnectionGUID: ZxkQSPVLTrKzp9W0fiBetQ==
X-CSE-MsgGUID: 7l7OMXUKSCC9k4rOd3ccrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="191709015"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:29:56 -0800
Date: Wed, 5 Nov 2025 11:29:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
Message-ID: <20251105102953.22qnkaavzq3haih2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com
References: <20251105084426.601123-1-karthik.poosa@intel.com>
 <20251105084426.601123-3-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105084426.601123-3-karthik.poosa@intel.com>
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

Hi Karthik,
On 2025-11-05 at 14:14:26 +0530, Karthik Poosa wrote:

I will not comment on patch, only for some clarifications in
descriptions.

> Add subtest aspm_link_residency to verify ASPM Link state residency

Please describe here what ASPM means, for example

s/ASPM/Active-State Power Management (ASPM)/

If I guess it wrong please use correct one.

> using link state counters from debugfs - dgfx_pcie_link_residencies.
> 
> v2:
>  - Add dedicated function to get pcie endpoint upstream port. (Badal)
>  - Read residency counter as unsigned long long int instead of
>    unsigned long int.
>  - Print residency counter before sleep also.
>  - Don't assert if sysfs not corresponding to aspm_link_state
>    is not present. (Badal)
>  - Run workload before validation of aspm link residency. (Anshuman)
> 
> v3:
>  - Move igt_device_get_pci_usp to separate patch. (Kamil)
>  - Move reading of residency to separate function. (Badal)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 159 ++++++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  mode change 100644 => 100755 tests/intel/xe_pm_residency.c
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index 1749d6467..0db1a6ba5
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>  	TEST_IDLE,
>  };
>  
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char* filename;
> +	char state;
> +	const char* parse_str;
> +} link_state_sysfs [] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>  /**
>   * SUBTEST: gt-c6-on-idle
>   * Description: Validate GT C6 state on idle
> @@ -64,6 +85,9 @@ enum test_type {
>   * SUBTEST: cpg-gt-toggle
>   * Description: Toggle GT coarse power gating states by acquiring/releasing
>   *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for ASPM link states entry while device is in D0.

Same here, write s/ASPM/ASPM Active-State Power Management/
or other way s/ASPM/Active-State Power Management (ASPM)/

Regards,
Kamil

[cut]
