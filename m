Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91FCD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 07:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED77410E89E;
	Tue, 16 Jun 2026 07:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4frRSLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1110E89A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781595822; x=1813131822;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lhIfDzxrmp0C/IOPf/y1XlBTPhstoIc62iBFcu+J3jw=;
 b=F4frRSLIIYC1scG9Z3GnDD7O5cqUv542cxdhLFtRtybINO/TrNxob6+s
 bYyIHQKrZItg3SNOMEjbx4nIRAD6ZvSsyDxqc+LPU4n++QrlEmQ/SEG42
 OvprZl/qvk/tG7cxNwmg8LBE2LsnD0cR56WGmjx9Kh/p6min2i70SLKYy
 E8pkYQouieDIqx8pIlMn4gIHwFBQJVhlehgV8lyhblwArlVIJybHjfrF5
 TTrUI4a1kZnJJmnHswTHqxItdSRPv3oX1oznplh9eN4/LW1P8cJRkBRis
 905dwKOHtNqegFdbWMK0b5umIJITmsVSdsR1p9jk0Qr9ABHU3htM/Acgr Q==;
X-CSE-ConnectionGUID: nzsMSZAnRfiT6Jvqk8oauA==
X-CSE-MsgGUID: 6dQ7D/w5ScGUqdX+sHDLtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82548748"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82548748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 00:43:42 -0700
X-CSE-ConnectionGUID: 23c/5/2CStOXNbHvQjVYQQ==
X-CSE-MsgGUID: 4YXL8SGaQnmC48DzXGSanw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="249587388"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 00:43:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>, janusz.krzysztofik@linux.intel.com,
 lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t v2] lib/intel_chipset: Extend intel_get_pci_device
 to PCI accelerator class
In-Reply-To: <20260615204723.18187-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615204723.18187-1-ashutosh.dixit@intel.com>
Date: Tue, 16 Jun 2026 10:43:37 +0300
Message-ID: <eb8c32f281d9f975ffadd4a2d4a0e03f750780b8@intel.com>
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

On Mon, 15 Jun 2026, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> +/**
> + * intel_get_pci_device_disp:
> + *
> + * Looks up display class pci device using libpciaccess
> + *
> + * Returns: The pci_device, exits the program on any failures
> + */
> +struct pci_device *intel_get_pci_device_disp(void)
> +{
> +	return __intel_get_pci_device(false);
> +}

Nitpick, can we please not use "disp" as an abbreviation for "display",
especially in fairly fundamental function names?

It does not abbreviate enough to be useful. Please just use the whole
word.


BR,
Jani.

-- 
Jani Nikula, Intel
