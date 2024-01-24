Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F88AC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 13:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEFA10F075;
	Wed, 24 Jan 2024 13:39:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F210F075
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706103581; x=1737639581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MWveNXuFvzJ7j41vfLaq/UiFZSfltz+aTnTZJXRMPCY=;
 b=QHSUCEbA7KoceWiMqF1EklcDPiEq2iIZ0vSx/QmTECt/Zg+ITFwzhuz3
 EYpxpYfgraTiI4C9TNjWjW+T4HEo2Q39Wdy1PJF7VEPX6EAQtQMofSImM
 9gcL0gjwCf1jNr7MjeA4zm6E5LtBAdqPwvWhAjpHwqnIWsb1PbFOizBOn
 MadVCMRey6syRf8tRwTWJ9RvNIWfDeImgxMaBZjIO9mUCTO95eZx/p606
 bCPcjQYcIZdA4b+2YLIPZn4S5tUJ4r+5RS4b1lEiic/qON3ZpHkLUX5mg
 AU+IPKJ4dIICZf3TlzTAAw8QvJapgHgzT++e+JtmBw9hKe/Szo8W3mVXm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="739920"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="739920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 05:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1927776"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:39:39 -0800
Date: Wed, 24 Jan 2024 14:39:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
Message-ID: <20240124133936.uffdw655o6ggywhl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
 <20240124115019.2067089-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124115019.2067089-5-anshuman.gupta@intel.com>
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

Hi Anshuman,
On 2024-01-24 at 17:20:19 +0530, Anshuman Gupta wrote:
> Adding d3-mmap to xe-fast-feedback.

How long did this test last? If few seconds you can add it to
fast-feedback (e.g. to BAT tests).

CI now no longer manages separate f-f lists, we can add them
if needed so if tests takes < 10seconds, please change subject
into:

[PATCH i-g-t v6 4/4] intel-ci/xe-fast-feedback: Add d3-mmap to BAT

> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f297fe965..1d5ecb19d 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -115,6 +115,8 @@ igt@xe_mmap@system
>  igt@xe_mmap@vram
>  igt@xe_mmap@vram-system
>  igt@xe_pm_residency@gt-c6-on-idle
> +igt@xe_pm@d3-mmap-system
> +igt@xe_pm@d3-mmap-vram

This should be before 

igt@xe_pm_residency@gt-c6-on-idle

with that fixed:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  igt@xe_prime_self_import@basic-with_one_bo
>  igt@xe_prime_self_import@basic-with_fd_dup
>  #igt@xe_prime_self_import@basic-llseek-size
> -- 
> 2.25.1
> 
