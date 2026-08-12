Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B0C5CFEE
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E5310EFBF;
	Wed, 12 Aug 2026 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpmiUwzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB86A10EFB5
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786539855; x=1818075855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3+JjS2OHxAwLsgw8u6eBzGw+kFWKTLB6/2s/fzQYrjg=;
 b=YpmiUwzUE7ZuvmZPb/+6AoOvtBtMFSQeo2hJfxzwhG6lT1lt/JA/Ig8D
 Br5tVYKcm3n9ogssPTZ9JzW+bgqGWYFiWquAAqG43mU30KKPmjEIGLyxj
 duzMVXYB3iK3MpIpEAikiW4N0AtyWvN0wvsIgz/1HcUuc5HfSz3tSbHpO
 NLQVGkGOvglNXyt9wubQXzSOlfQvmMynGsvE0il+rptPo8/2lVMyRxazm
 uqrrJwFRyUQnB0csK3js/Ae/bCwAbjH/zLyc8ViEla66r+SeQV2ian5cz
 ACSQflXNYQah9Dss3mESjKQiwH1VEzHRnWbV0iBybBeFg17GG8mYdcFmJ Q==;
X-CSE-ConnectionGUID: sAPWu10gTYKQQCZr5ulp3Q==
X-CSE-MsgGUID: 7qN3loG1TFadaX8vQblqBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97439349"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="97439349"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:04:15 -0700
X-CSE-ConnectionGUID: BlHmJ8aDSq+MNVgAofPqpw==
X-CSE-MsgGUID: oDu/EIPYSZO33NN835UMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="265633089"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 06:04:12 -0700
Date: Wed, 12 Aug 2026 15:04:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Add xe_sriov_vram to NVL blocklist
Message-ID: <20260812130410.ylnepqu5wslvnvbv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260812131013.1369674-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812131013.1369674-1-jakub1.kolakowski@intel.com>
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
On 2026-08-12 at 13:10:13 +0000, Jakub Kolakowski wrote:
> NVL does not have VRAM and xe_sriov_vram skips on this platform.
> Add the test to NVL blocklist.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 14e76df47..c73ae500e 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -20,6 +20,7 @@ igt@xe_pm@d3hot-mmap-vram
>  igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
>  igt@xe_compute_preempt@.*vram.*
>  igt@xe_vm@out-of-memory
> +igt@xe_sriov_vram@.*

Please move it before xe_vm test, so it will be sort of sorted.
With this LGTM

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
>  # These PAT (Page Attribute Table) index subtests validate
> -- 
> 2.43.0
> 
