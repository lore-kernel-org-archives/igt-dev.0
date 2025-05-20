Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651CCC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 10:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21D610E48E;
	Tue, 20 May 2025 10:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lqu1b63K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1E610E48E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747738604; x=1779274604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VL8kjZ7FrHTepdMlxwe1E9qcFQne6k6IijpacXHskRo=;
 b=Lqu1b63KiTnq+VpNn3zHHL7oQyb3jTff/1thfT0/e7PtU/xb23gNp2DG
 KKJozsDMkIaSg1ixa9wEZhmebSXQnqLTMPMvk0zlgJrUTF5z5SNOETf9k
 d1x1zzZALHN1iyBK8Tzj6Q+tbVwMA23eIgXZZ4/kyZjkyDNWPVtmtaHTd
 SkKyw7nPNwR3Z+BIe4t35b1o0qPdr777JYbq/JwSRyGnxrSn7KjWHEtd9
 K+aBytVYzmVr3y8EW5wEjSN17OuqzhXiM59efpCYU5oSRHHiMdnzulioR
 JOiemXO+3sv6hWoHGk3Go3Ou4Z6XY+asCRXUlZpTpKktSqSFbKWeq3wJ2 A==;
X-CSE-ConnectionGUID: iEqFKXNgR7qgckybbj3yrQ==
X-CSE-MsgGUID: dcMIVmVCT1m82Vae/G158g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53466774"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53466774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:56:43 -0700
X-CSE-ConnectionGUID: nB69MKQuQF2aNwAJVaiw5A==
X-CSE-MsgGUID: RAPtBf4CTkyI9GVJYBHagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139560644"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:56:41 -0700
Date: Tue, 20 May 2025 12:56:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Message-ID: <20250520105628.6qcy53tyvi5qhufk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com,
 katarzyna.piecielska@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
References: <20250520101400.1522-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520101400.1522-1-himanshu.girotra@intel.com>
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

Hi Himanshu,
On 2025-05-20 at 15:44:00 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Add blocklist file for LNL/BMG and core blocklist for debugger
> functionality

One nit, see below (also see Ramadevi note about adding' .txt')

> 
> v2: Add files to meson.build (Rama)
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> ---
>  tests/intel-ci/meson.build                  | 3 +++
>  tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
>  tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
>  tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
>  4 files changed, 18 insertions(+)
>  create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
>  create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cb775e2f1..84bbdabc6 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -9,9 +9,12 @@ intelci_files = [
>    'fast-feedback-chamelium-only.testlist',
>    'meta.testlist',
>    'xe.blocklist.txt',
> +  'xe.eudebug.blocklist',

Please keep it in alphabetical order, after last xe.bmg
and before xe.lnl
so remove it from here.

>    'xe.bmg.core.blocklist.txt',
> +  'xe.bmg.eudebug.blocklist',
>    'xe.bmg.display.blocklist.txt',

Put it here:
     'xe.eudebug.blocklist',

Regards,
Kamil

>    'xe.lnl.core.blocklist.txt',
> +  'xe.lnl.eudebug.blocklist',
>    'xe.lnl.display.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..661e3122a
> --- /dev/null
> +++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> @@ -0,0 +1,5 @@
> +#####################################################
> +# BMG specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-ci/xe.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..e13a5cc2b
> --- /dev/null
> +++ b/tests/intel-ci/xe.eudebug.blocklist.txt
> @@ -0,0 +1,4 @@
> +#####################################################
> +# Core Blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
> diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> new file mode 100644
> index 000000000..cabac8858
> --- /dev/null
> +++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> @@ -0,0 +1,6 @@
> +#####################################################
> +# LNL specific blocklist for Xe EUdebugger tests
> +#####################################################
> +igt@.*@.*tiles
> +igt@.*@*multigpu.*
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> -- 
> 2.40.0
> 
