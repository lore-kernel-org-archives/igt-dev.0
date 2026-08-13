Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC4AC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 12:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30F510E286;
	Thu, 13 Aug 2026 12:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7XXfa/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB7F10E286
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786625914; x=1818161914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zFqP1SJJ4zzDs7ZffxkiqaimuQV2SN8goKfvkkCJhzs=;
 b=A7XXfa/PKzb/ELzOhVpDGtroRJGRn3Ou0PqdadKmria6aFzw2R1imVWp
 VSOVuDURXoM/I2zxOKEBZZ2zQF+WKtY1rAhgZTJki/bwRI+omK1JsHBVP
 iPFIIaffQnLk30vDZG2PEru3H4gK1uFYltHj+iAjD5VEEktiAyPW/KJu0
 KlOpPBRL+PMFGXX7B3HODfT+mBxBacy0k0d7hlAvLPUJrKB2BHk64/iwj
 o81X5IWXaCLcIA/4SU6rC80PKpfylKaw38ej6/3HbNbZSBc8245vNcLnd
 dkzq0N0IHyq5nujBNPcTYTBfZ+0GVK/J5AZY89cyjmd7THNTa7FMYJjkq w==;
X-CSE-ConnectionGUID: F9H75SGkSHK/AQPjiOqd3Q==
X-CSE-MsgGUID: +zxyPbT4Q7GE61X43Oc5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87217066"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87217066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:58:33 -0700
X-CSE-ConnectionGUID: AWqYeOpTSuyAlyqE5KBIaQ==
X-CSE-MsgGUID: 6ceCF0txRpialIbKHhNfoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="264517393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 05:58:31 -0700
Date: Thu, 13 Aug 2026 14:58:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH i-g-t v2] intel-ci: Add xe_sriov_vram to NVL blocklist
Message-ID: <20260813125810.ogpbt2m5vpg4biqq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260812142134.1371609-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812142134.1371609-1-jakub1.kolakowski@intel.com>
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
On 2026-08-12 at 14:21:34 +0000, Jakub Kolakowski wrote:
> NVL does not have VRAM and xe_sriov_vram skips on this platform.
> Add the test to NVL blocklist.
> 
> v2: move igt@xe_sriov_vram@.* before igt@xe_vm@out-of-memory (Kamil)
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 14e76df47..b36921519 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -19,6 +19,7 @@ igt@xe_evict.*
>  igt@xe_pm@d3hot-mmap-vram
>  igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
>  igt@xe_compute_preempt@.*vram.*
> +igt@xe_sriov_vram@.*
>  igt@xe_vm@out-of-memory
>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
> -- 
> 2.43.0
> 
