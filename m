Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6C0CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 05:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2352210F172;
	Thu, 18 Jun 2026 05:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+R2utJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C0910F172
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 05:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781761819; x=1813297819;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=phuH4uozBqatkcoGiwOyg9hpbw1s3C6ljCFdy+jTDMs=;
 b=S+R2utJFxGFqD5JUWqgDBrGJebNpAAVdMaSJLcKF+wYHSSyXSS8bnpTt
 p79Reu3GGd3PTcF73/POKmXIQ8YkTCmbQo0enYVjABXedkOu37bHuy51m
 7MIJYumQ7AsercnH8m3eTbPRmMyJwC93hB5uPXVT5cCnkSOP+ydvSq3Mg
 ibD4QaqT5YIh9CAq1r/zv+OQdScTZIT/qyTrAUQmVc1ZEeUSoovyZf5Hu
 pVhBnTTKFRjaoUctDOfKvrb+cJlMZRB5FWjUqtp/vXQMK4MZJtc3c5+fi
 cuBvTBezH0/VXk2+d1IwQqKt+NfiofPoveEHEGnENaGGS9Otax2WCRHyt g==;
X-CSE-ConnectionGUID: 7W6Gc+ylR22rNoG4Pg81rA==
X-CSE-MsgGUID: gERg3AKsRhCsdvSxnboN+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93698080"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="93698080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 22:50:19 -0700
X-CSE-ConnectionGUID: Os0iyTKpR1WA4Z1q9EyehQ==
X-CSE-MsgGUID: wLJ34E61SUaNQ1F+q7q2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="253250836"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 22:50:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v1 2/2] tools/intel_reg: Create default
 accelerator access
In-Reply-To: <20260617202600.251889-3-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
 <20260617202600.251889-3-kamil.konieczny@linux.intel.com>
Date: Thu, 18 Jun 2026 08:50:13 +0300
Message-ID: <1b4a7ea05916e95a5ec4416754cf988507ccc348@intel.com>
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

On Wed, 17 Jun 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Among computing devices there are GPU and accelerators and the
> intel_reg tool worked only with former ones. Create new way for
> finding a compute device and when no Intel GPU is found, then
> search for Intel accelerator. Also, inform user about which type
> of device will be accessed.
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/intel_reg.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 49afe91c0..b4f8cd0fd 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -1382,6 +1382,18 @@ int main(int argc, char *argv[])
>  				return EXIT_FAILURE;
>  		} else {
>  			config.pci_dev = intel_get_pci_device();
> +			if (config.pci_dev) {
> +				fprintf(stderr, "Found Intel GPU PCI device 0x%x\n", config.pci_dev->device_id);
> +			} else {
> +				config.pci_dev = intel_get_pci_accelerator_device();
> +				if (config.pci_dev)
> +					fprintf(stderr, "Found Intel accelerator PCI device 0x%x\n", config.pci_dev->device_id);
> +			}

Please don't print anything on success. It's a distraction.

BR,
Jani.


> +
> +			if (!config.pci_dev) {
> +				fprintf(stderr, "Cannot find Intel GPU nor accelerator device\n");
> +				return EXIT_FAILURE;
> +			}
>  		}
>  
>  		config.devid = config.pci_dev->device_id;

-- 
Jani Nikula, Intel
