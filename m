Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93673CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F0810E097;
	Tue, 11 Nov 2025 06:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c76hOoob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327F10E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842567; x=1794378567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=44ecqWGUMhLur5s6k7XYGFmsb6T+JaffvrLPp1qpIfE=;
 b=c76hOoobcO3+ZQXCJ3jsy30UP4D4F1omNKBuENp0JtOn7HxkxnoXZ8wo
 pasXgcwqtdXG+cY3xKd2dIneuQrSwq68wzcqnX+26EkBpx5aTyCxR5KUo
 gKWvGfHWebk++VK8Iw/Mr8PBfCvPunQlM93c/PsJQdLQzj0BAilkI3wJj
 SOJqq8D2qDyi4c3l5WanF+Etv8f08LuiLgsBx2MKktjrP+zmAKGNjCxDo
 rIMB4238ObVDVztPOK0R2Row5J3zz/H/cIfjtXqDhBji3jnnIw3NB9gqv
 +6Jil5AjyCPMBC8fx7avWMPT1B//ATs871LQ9YsN2uA645CMlFoWr7sDn Q==;
X-CSE-ConnectionGUID: GGBhL1/WQaO48YALrMoWNQ==
X-CSE-MsgGUID: 5bS7KF/HT8GO2FkUZ81nCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65056565"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="65056565"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:29:26 -0800
X-CSE-ConnectionGUID: /Aqwvmm4QcGp7LlEwZvl+w==
X-CSE-MsgGUID: G55+8YI/ScWQsf8aLYo+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="194070544"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:29:24 -0800
Message-ID: <7ff21ca0-afef-4442-8b3f-b7c82c3edbc4@intel.com>
Date: Tue, 11 Nov 2025 11:59:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,3/8] Revert "tests/intel/kms_fbcon_fbt: Enable the tests
 support variations based on the WAs"
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-4-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-4-mohammed.thasleem@intel.com>
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
> This reverts commit 47b875a087b33f2c866492624d8a7a4ef45f55e9.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
