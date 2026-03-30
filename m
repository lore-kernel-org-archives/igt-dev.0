Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096531061B09
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE11B10E1B2;
	Mon, 30 Mar 2026 14:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu4I4TZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91A710E1B2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774882524; x=1806418524;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Vd75ofUjEOyoqyZjSDRNySaLaciujmXppuX9zz+ob2s=;
 b=Hu4I4TZObFXFOKRVolBPDERD+R2eeKk+DLSgX3PSNylpMG2hE4q9NMnJ
 Uwp/juPCG4nP1OwTR2EdeymUlBFfunCsLv4IuS4kd0BirXSQpMj7x+7bb
 63Kavyo8hWVwswjbqXrY6lS1e+uKPWfQDghMOjOr7onuyjw0R8se1RaJI
 z4gMgWbUCTJTKRsT7J0LhiRX61HsP/t8S75JuPTRmw3Pp2Ck/P553wlYV
 6+AQ+ufVY91bZe83jUi46rmlvajLJlbREzVNyDncz+R2wlG6gQw7Kqi7j
 hP+I1zXm/0EL4BDr8r/Hg8GRpuL9p1p8X3hJB+qFwr5ZyVx1+m2992PXQ Q==;
X-CSE-ConnectionGUID: RNccmNlPTDu5fkNXYvholw==
X-CSE-MsgGUID: TOpSI3wFQNiDhc932LQ/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75894351"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75894351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:55:23 -0700
X-CSE-ConnectionGUID: xSkGpreuQKuU1UGhX69QXA==
X-CSE-MsgGUID: V+dbZhRvTPuT0ChFOt/tWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="222769534"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.123])
 ([10.245.245.123])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:55:22 -0700
Message-ID: <b1d8c11a-e59f-4a10-9584-522aaeb66d54@intel.com>
Date: Mon, 30 Mar 2026 15:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/5] lib/intel_pat: Expose getter of PAT registers
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
 <20260330144032.1954771-9-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260330144032.1954771-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/03/2026 15:40, Zbigniew Kempczyński wrote:
> Kernel exposes two debugfs files (per gt) which describe PAT configuration
> - pat_sw_config and pat. First contain table which is written to PAT
> registers whereas second one returns tables via registers access.
> 
> Add possibility to parse second file which might be handy for tests
> which wants to verify register state.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
