Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F5CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1224410E097;
	Tue, 11 Nov 2025 06:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTVz/cCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE410E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842653; x=1794378653;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YkvkE16d9Xh0uLC/e4NlHbRogvoQeId2V9jZv1W80ns=;
 b=XTVz/cCNihPqUmvSdnfjhXRNHGza/5Z0cBvYlWdt1XXS75MlUB+FKJCx
 87C4D9Hz/ghGMeDEV1aNqI79bZSfrCSV64ZI3kV5tZP/7lcAo9Fxxdklk
 dxCDcPGoo8axxR1jvjqofCjGZn89UYlyYXOyZXYSE0GPwZFNYP/JJIWeV
 7wfA9GvHmN168lriH/+agcgQQ2UbZ5uofzc8vxl+L5CmfFUXwsK1OQjI3
 eD8iKl248fdo3Wk+tPygHL9GVtuWuQiDZKLAph5nBc/eedrictS6+q8NY
 GHlpESH2Vh5moa9dHQ44V7Ar4KWr9RVAdVEx6wvRnjVRJQA1qTgr1ZqLt Q==;
X-CSE-ConnectionGUID: 69fm7wzpT1i9L7UUla0h5A==
X-CSE-MsgGUID: zsmXOTZnRv2joKjTd1amcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64786291"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64786291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:53 -0800
X-CSE-ConnectionGUID: fFqDZ5NPRvKPiXgRwz4D/w==
X-CSE-MsgGUID: H6KwpZeARJ2s81ikB1Sk2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188720229"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:50 -0800
Message-ID: <63a368c4-627f-40b5-9986-6532b5d7c978@intel.com>
Date: Tue, 11 Nov 2025 12:00:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,7/8] tests/intel/kms_psr: Skip FBC tests on BMG platform
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-8-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-8-mohammed.thasleem@intel.com>
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
