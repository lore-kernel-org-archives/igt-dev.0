Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E60D6E2CC
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 18:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6AA10E66B;
	Thu, 18 Dec 2025 18:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc3FbU41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4507710E66B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766081890; x=1797617890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KJWfsaBqrS+ItxsT/mg29h1DWSRwh6OOt6mvYSkx1Mk=;
 b=Jc3FbU411LQP5QJGELYBWM2AEylWHedkDcAH6aL7KNJO8/JfxT7ydrwQ
 YswjmIwiOL68h+dWTfQqqRd1I9/8fEfZ+lmXBwrdQtBKn45xbkLrV6xn/
 fa8CPnQ15uKC7sFwfmg+bWxFJorUzCw3kLVkJjwWQtrgcLYFwtKTxMFYt
 mCsRe/KJJgMAK8SJBT5X9t3LeLFpwgOAFPQ4JoptAPf1UJTG/oecvdQuD
 E+8TZYQgsghQIRz6+sz2QrA5ZRur7VeFJ36Qjq15k3yx1qG2ClMe/z3E2
 poQkWneyO0AJPLbkCuLr6NZEsneYmNN161yL6nqQvaCX9cjLCUIg7DpWy Q==;
X-CSE-ConnectionGUID: I16oah59Qj6Mg9KT5Krl0g==
X-CSE-MsgGUID: GejXTARJSgiUzr35indNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67040757"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67040757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:18:10 -0800
X-CSE-ConnectionGUID: 74wwtr02TXO5o4bQi+vE1g==
X-CSE-MsgGUID: +p424qDRTjOCqHqlqOXavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229705776"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:18:08 -0800
Date: Thu, 18 Dec 2025 19:17:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Add xe.wcl.core.blocklist.txt
Message-ID: <20251218181748.kxsdsk3kwwjzelfx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20251218175456.65275-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251218175456.65275-1-jakub1.kolakowski@intel.com>
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
On 2025-12-18 at 17:54:56 +0000, Jakub Kolakowski wrote:
> Add blocklist for WCL platform. Taking into account similarities between
> PTL and WCL make WCL blocklist a symbolic link to PTL blocklist.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>

+cc Jari
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/meson.build               | 1 +
>  tests/intel-ci/xe.wcl.core.blocklist.txt | 1 +
>  tests/intel/xe_test_config.json          | 1 +
>  3 files changed, 3 insertions(+)
>  create mode 120000 tests/intel-ci/xe.wcl.core.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 906bf5351..cf0023c63 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -29,6 +29,7 @@ intelci_files = [
>    'xe-sriov-vf.blocklist.txt',
>    'xe.sriov-vm.blocklist.txt',
>    'xe-sriov-vm.blocklist.txt',
> +  'xe.wcl.core.blocklist.txt',
>  ]
>  
>  if meson.version().version_compare('<1.3.0')
> diff --git a/tests/intel-ci/xe.wcl.core.blocklist.txt b/tests/intel-ci/xe.wcl.core.blocklist.txt
> new file mode 120000
> index 000000000..433bbb006
> --- /dev/null
> +++ b/tests/intel-ci/xe.wcl.core.blocklist.txt
> @@ -0,0 +1 @@
> +xe.ptl.core.blocklist.txt
> \ No newline at end of file
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 65e685470..74c1eedcb 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -80,6 +80,7 @@
>  			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
>  			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
> +			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
>  			{ "all": "../intel-ci/xe.blocklist.txt" }
>  		    ]
>  		}
> -- 
> 2.25.1
> 
