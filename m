Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8402C3601B
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 08:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883A610E24A;
	Thu,  3 Apr 2025 08:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6Jd3fHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A58810E24A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743669441; x=1775205441;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YdhHQS0a7LDRvkLTWkjswPOOZjXgDxvgViESuLddNxs=;
 b=S6Jd3fHy9X4ofpUhn8cuN2AYyCe/K1O9d0RmjJMmt2+6/MVjVoUB+Iiu
 y4CELUfhOl5bW/jArOfCiMEuAETX9Zkj44P6W/9IWEvaA0LzjN/+UFb3n
 FrcLJZCoImEqU8k/SVRKOPJ93uhoYTjBZ874oLl25AJkxrFU/sOsMr+kh
 r6l1ob+si1wsUJ+od10RbM8fOfSlYj+PXF6NblMmtTCfOncjhztNMilIk
 nQCo9w9QmTcg/l9FDqL2szJ8JbT3QpcOu3xyWO3GZ8YO/uG1xq6ELIh4Y
 0zHnrTQNu6MfqWXomBocNdNYL8CRDQGZO+mTDaTe6yphOxtDoSqVsJvF/ A==;
X-CSE-ConnectionGUID: ZrKPZBN8TbCHV4n5c3jQVA==
X-CSE-MsgGUID: yoY99MLeTW+MdVQ4+79Ctw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62462431"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62462431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:37:21 -0700
X-CSE-ConnectionGUID: GHbJcvxBQXWStdjxWsqAzA==
X-CSE-MsgGUID: 1GrBCCc4SeyhjY5rXNCHlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164167139"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:37:19 -0700
Message-ID: <429c92c1-a49c-469f-9be6-743e969925d3@linux.intel.com>
Date: Thu, 3 Apr 2025 10:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] intel-ci/i915: Block more Xe tests in i915
 runs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
 <20250402161207.66601-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250402161207.66601-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 4/2/2025 6:12 PM, Kamil Konieczny wrote:
> There was recently added new generic Intel test
> intel_sysfs_debugfs@xe-debugfs-read-all-entries which is causing
> a valid skip on DG2. Lets block all similar Xe tests from i915
> runs.
> 
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13983
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 9917bf46a..1afea1c86 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -2,6 +2,7 @@
>  # This file is for non-Xe tests only
>  ###############################################
>  igt@xe.*
> +igt@.*@xe.*
>  
>  igt@meta_test(@.*)?
>  

