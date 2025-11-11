Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5570CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6983F10E097;
	Tue, 11 Nov 2025 06:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuU4xhM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64F110E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842586; x=1794378586;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4uPpiG9dYOFNLdExxd9CsgpxXZxMeeETQ2dfJ8oVS8Y=;
 b=JuU4xhM4CKRpv2zwaO3sJAf7xldf1CvhiUzq1/nQEljreHG+oTtIDJuc
 FcTldcRDeytd6WuzImpIbmlt6hyslyh0zpejFrlgk7i2WQxqiHxKlajHz
 Pu79n4YcSDNLbvHEBUcRfaaEasBd5nDb4ROMm3Vyv4QJlnpXMvjf4eTPp
 zVsUsGS6FPXQGueX7z30xiR9cOKD9UdIvzewmxIoF1VcQqu6oNjxob4OM
 EXBZo7r0qiSPgE1v1lDtGQW6buo/emAehjsLo0tdJE6aBR5+GqwyBBXlY
 e2wcz9Qs8NzGEYBKVCM/3OpmtPNY7kegjx4iTqD8odT9IrsNgu6x5OVuW g==;
X-CSE-ConnectionGUID: FBBvRDEoQMGjhxUlVsUtPw==
X-CSE-MsgGUID: 4UGgQK9ATVqCyK3CxItZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64833859"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64833859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:29:45 -0800
X-CSE-ConnectionGUID: LIhp8MHxQdic/d5M6bqxkw==
X-CSE-MsgGUID: mvKdpa6bQ3COWfnJ3KHfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="219532748"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:29:44 -0800
Message-ID: <81304e75-5c07-409c-9bb7-411721cdc163@intel.com>
Date: Tue, 11 Nov 2025 11:59:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,4/8] Revert "tests/intel/kms_psr: Enable the tests support
 variations based on the WAs"
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-5-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-5-mohammed.thasleem@intel.com>
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
> This reverts commit 897af2724210dd42e98e2d560c526db5a6dbadbb.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
