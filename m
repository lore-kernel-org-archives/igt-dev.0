Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2304C3601B
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 08:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEC110E24A;
	Thu,  3 Apr 2025 08:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtTBiXW6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C40F10E24A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743669456; x=1775205456;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xf1FyxoClOnJECmBk0QSibw8bItoTCX2rQO95PLd0UA=;
 b=CtTBiXW6spC1SREFGRj5f090XLdnZ298hEeUxGsQt5f+NG/m4T0MDLah
 WBx3qsyoKWxhNTgtg6YmmjgUXQSJLZ3yWdOvg89eUftEwi97q0FS0hLVo
 nFMufnEkpVAfL+yzOsznHw6S4sub0mNWydgDHRBFP+pYdpg7BtVsOHG1h
 P958dqWV3ojdxF6NG6Y88eljpEnYA6uZmrp8vfbMvk1PHDMn1y1Dop8g0
 dBpNSGxdJVA4U0hIm2fnf1EqUvJ5cnFTHVBsgCb0uEd6czTH6+jAtoYQC
 v4JqY06NVH/qyINquXbe76OsHjVfNn7VKEwYh51EerrwIv931kL2qWcOv g==;
X-CSE-ConnectionGUID: RnDKkOkERdmc18LdHCvjRw==
X-CSE-MsgGUID: 6eNxWGGMQPeQG6cSUF1bvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62462446"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62462446"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:37:36 -0700
X-CSE-ConnectionGUID: Y53iCbQRQo21YE9vt2P+Hw==
X-CSE-MsgGUID: 9GdyoZFsRmiT2JzG8mb+yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164167148"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:37:34 -0700
Message-ID: <26141634-5bf7-41a4-a9d4-3631168089e9@linux.intel.com>
Date: Thu, 3 Apr 2025 10:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] intel-ci/xe: Block more i915 tests in Xe runs
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
 <20250402161207.66601-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250402161207.66601-3-kamil.konieczny@linux.intel.com>
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
> There was added new generic Intel test intel_sysfs_debugfs
> which checks sysfs and debugfs for both i915 and Xe.
> Lets block i915 ones for Xe runs.
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 80ceba9a5..d02d0f73e 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -20,6 +20,7 @@ igt@gen.*
>  igt@i915_.*
>  igt@perf.*
>  igt@sysfs_.*
> +igt@.*@i915.*
>  ##################################################################
>  # Exclude mock DRM KUnit from IGT, as those already run at build
>  # time on Intel CI

