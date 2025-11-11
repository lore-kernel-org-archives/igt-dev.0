Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952BFCCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1D410E097;
	Tue, 11 Nov 2025 06:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7oHbCTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4710E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842674; x=1794378674;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YkvkE16d9Xh0uLC/e4NlHbRogvoQeId2V9jZv1W80ns=;
 b=j7oHbCTkkkcj1NzGPmX3uATUd9F30J3onVNQJbElgP6PAIsbHn/Zda9e
 lPS+/RcPQmMvvOW/tKO7Fqj6D0dleX56s61drxpzXLZ6GKmjyd3QTuXmv
 xNIuj+ZsEBIEGscET+J9FKg7JsiczUI1QVc9DYRzk+Mz3ZzxyEr1+AeVG
 5jCsmzRkPV9wgcoevMtbY9TXvlPt3ReoMkM9qrWMdeiC1i3+DPSakjkJr
 CA6kbQ72CH2CJFQwSiTcfP8qLbxMLv0UJmOsndYTDRdChgNXq2o3gdxmI
 qBbZGltzjQgSNokXmdxXavPCWi08/CtpAbYDt5dfn0exOj6I4Oo1E3i+r Q==;
X-CSE-ConnectionGUID: a5YE5SD0TZaF+dHiT/bBAw==
X-CSE-MsgGUID: JekzVXs1TyaOWgUmJkVV9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64816856"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64816856"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:31:14 -0800
X-CSE-ConnectionGUID: i3jVe9sxSfKJsxvUlIGCNQ==
X-CSE-MsgGUID: cl5G1nM0QwKoM7r5qta1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188210832"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:31:12 -0800
Message-ID: <85ed8a60-0e4e-4595-be44-e44a842d89fd@intel.com>
Date: Tue, 11 Nov 2025 12:01:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,8/8] tests/intel/kms_psr2_sf: Skip FBC tests on BMG platform
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-9-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-9-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 11-11-2025 00:54, Mohammed Thasleem wrote:
> Skip FBC tests on Battlemage platform as the feature is not supported
> on this hardware.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
