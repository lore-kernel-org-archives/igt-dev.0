Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E823CC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 10:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECA410EA89;
	Thu, 27 Feb 2025 10:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUEzVau9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EBF10EA89
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740652075; x=1772188075;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yPVO9TtmwYF+WXU1CS1IF6UUc35JwsYvp7PQMELcavc=;
 b=WUEzVau9/ehFQtrCKUsyrH8+4AG2zlZlYOfhioAVbY+nAXBFk+5JwZ5N
 9WCdrkArfpYLiw1n/2W5o8WhGcm9NIFMKLfjyFfn87cGbw59lCr7YSvAY
 fn/D7ExYKOmi0WQXnJxsWkb4rY5I/XvLybPdbViMHYXxOT7/u7oeiXONJ
 ybJVgc2BEDANWHSw8rnsu2vjLZgMKKgSXxBmqxazrS3ZwAZKWZvVONGhu
 bm7/AsinJ5LmtteKhLhvteuTG1l3YtwlRpDdMM14Z1PoxgdvK57PXlDaL
 xCbSDOIZ/U1NaeYL4ZB3tgGb4P2CinRREmFqIHWEWNvvwrku2yZ592RVA g==;
X-CSE-ConnectionGUID: gbTYLXXgQJqBf3lu5wAQmQ==
X-CSE-MsgGUID: ZvNFxRXaRbeB4zTAOObSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66905803"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="66905803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:27:55 -0800
X-CSE-ConnectionGUID: dsxEXo1SRMGYnBSqtH8BBA==
X-CSE-MsgGUID: NdRRYQVWTo63ORNvZEjAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121108134"
Received: from mviannax-mobl.amr.corp.intel.com (HELO [10.245.80.7])
 ([10.245.80.7])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:27:52 -0800
Message-ID: <c4c07559-0bd7-4d77-a890-309b3f772359@linux.intel.com>
Date: Thu, 27 Feb 2025 11:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: vitaly prosyak <vprosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
 <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Hello again Vitaly,

[...]

> Hi Peter,
> 
> Thanks for the update! I really appreciate the effort you’ve put into making the approach more global and vendor-agnostic—great work!
> 
> It would be incredibly useful to have both --kmemleak options available (for the entire test list and individual tests).
> 
> Could you kindly provide guidance on how to add these options (-konce or -keach) to igt-runner? For example, how should I modify the following commands to include them?
> 
> sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic  

I’ve sent another revision of the patch that updates scripts/run-tests.sh,
adding the -K option. This allows you to run tests like this:

sudo ./scripts/run-tests.sh -K each -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic

> 
> or
> 
> sudo ./scripts/run-tests.sh -v -T /home/infra/igt/custom.testlist  

Same here:

sudo ./scripts/run-tests.sh -v -K each -T /home/infra/igt/custom.testlist

You can find the patch here: https://patchwork.freedesktop.org/series/143996/

Would you be open to reviewing the new patch and sending your Reviewed-by
once you think it’s ready? That would help speed up the merge process.

Let me know if I can assist in any way.

Cheers,

Peter
