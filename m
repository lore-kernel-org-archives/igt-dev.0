Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67D1CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0310E097;
	Tue, 11 Nov 2025 06:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOeb41Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8510E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842401; x=1794378401;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PlVs+g3Rae25gMXHQusT6QeIIibJCurdGKD/cdvA+S4=;
 b=hOeb41Dxth8rbGdJNOmtjwL5v9Aza6ZcOiB8hP+WT3EHqLaZe6B6Xsy4
 PUBQYO2DJYlx2TJxJe64q32IdS3i/eto9RcCcnhrrnUGUBsh6idEIvXfi
 ueNkXlEKOyCSu3nU/9PoQBvehSa694cDA4YLYxiSqBFLcj21/ePeE/FFc
 G16WVZ9IzBBypITiEjfIRXh3IXc1iRGbwa9LRtcE7GeFG3jUXQpye/ZS3
 n937gfgmUN9Ai4uLyxO90yFaZXstq/i60spcCcScr72Pn3QDjTLkQH/Bc
 KGFF6HKcLMCy0JX6m6gHJ9JFZ5CTL2qpq5C3jcCmaLxk08L09a7tUhO+p g==;
X-CSE-ConnectionGUID: DA0p8G2ZRyyVBJVnBvzXCA==
X-CSE-MsgGUID: yW0BbSwhTDmDn+5O2U0zpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75196335"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75196335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:26:41 -0800
X-CSE-ConnectionGUID: 6CEjNBZVRxOSHh22sst+1Q==
X-CSE-MsgGUID: VaKukb3NRDO5fm5i11D4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188209840"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:26:40 -0800
Message-ID: <3760c074-d44b-4a6f-bba7-4164b861612a@intel.com>
Date: Tue, 11 Nov 2025 11:56:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,2/8] Revert "tests/intel/kms_dirtyfb: Enable the tests
 support variations based on the WAs"
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-3-mohammed.thasleem@intel.com>
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
> This reverts commit 692c8ec03ac38699bb4aef87942651d565f578e4.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
