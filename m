Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A2CD5BBF
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 10:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65010E348;
	Thu, 13 Nov 2025 10:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enfJA2wg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA6710E348
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763030292; x=1794566292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mrxV4Ff/pU3XOT6enUXJolKjJZFuU64JoCYSkHwz1rQ=;
 b=enfJA2wgsHqHvM7VupDphqsnPF+raK20XqDsMY1IPr9Q5KwvFNOyKRGd
 Jn5rxAl9T4fe0vA4yqVcpJL2YMDwijHenjE3kb2mqCzzm5K+K6IQrKJWV
 G4IciCsOX6G1Q6Ihf6mPXZg8H8P6bn+U43C7C6jI+JMdHygpm9DidOkIt
 EdnUMcgRAPjw2fein1Ov2apFRvEKBeybklzs7NPYl64xUF5NO20/b2KCH
 hPGlNS5NySmL5FdG0fDfD7/sUNkeFCx0AiRAkCkwuvILAlWIds6PlsSAO
 1+HO/8Z3yP+r55GL39/4IgYZNf0vgsejZqcui2ssKys+CvfMToGEAGJHv Q==;
X-CSE-ConnectionGUID: PpMM+cuzSsaZfn5YtXxQjw==
X-CSE-MsgGUID: nSKHA0KYRwiS1ykMNLUfDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82736315"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="82736315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:38:12 -0800
X-CSE-ConnectionGUID: Qi+QJ6xEQjulRpuFWAo4uQ==
X-CSE-MsgGUID: XUrpcWNSTkmblqanVi6FkQ==
X-ExtLoop1: 1
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.158])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 02:38:11 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Block Panthor testing
Date: Thu, 13 Nov 2025 11:38:08 +0100
Message-ID: <5426608.6fTUFtlzNn@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251112162834.12305-1-kamil.konieczny@linux.intel.com>
References: <20251112162834.12305-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, 12 November 2025 17:28:34 CET Kamil Konieczny wrote:
> Block non-Intel Panthor tests on i915. Also while at this, move
> it to proper place on Xe blocklist.
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/intel-ci/i915.blocklist.txt | 4 ++++
>  tests/intel-ci/xe.blocklist.txt   | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index b36015b53..083b660c7 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -118,6 +118,10 @@ igt@vmwgfx.*
>  ###############################################
>  igt@panfrost.*
>  ###############################################
> +# Panthor
> +###############################################
> +igt@panthor.*
> +###############################################
>  # Qualcomm
>  ###############################################
>  igt@msm.*
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 8706721e3..63f969416 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -7,13 +7,13 @@ igt@amdgpu.*
>  igt@msm.*
>  igt@nouveau_.*
>  igt@panfrost.*
> +igt@panthor.*
>  igt@v3d.*
>  igt@vc4.*
>  igt@vgem_.*
>  igt@.*virtgpu.*
>  igt@vkms.*
>  igt@vmwgfx.*
> -igt@panthor.*
>  ##################################################################
>  # Exclude all i915 tests
>  ##################################################################
> 




