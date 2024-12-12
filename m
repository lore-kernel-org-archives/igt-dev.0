Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37964E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 04:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE3810E18F;
	Thu, 12 Dec 2024 04:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJKEDyjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8110E18F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 04:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733978227; x=1765514227;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ys+eoQ6WX6cH2EzQ7iyV8jj+7FrX8A9mdnwYvXRZ8Rs=;
 b=KJKEDyjCnPAh7N93D5KsL76sqk6+I56CJ3lHWSg/hBUvU8rhwi3eVPgG
 MAPcon1AsRGsAmnxk9S4HV52KQX/9h9GxYjBpPHWQaehz4srXXhEK6eyJ
 Ue4p8ilLbsYs6aErA6gmoKwPBezxktrXI5QJyzSvmmybl5dfK0BQpvveN
 85eR8v8vKS3sxd+qljBNF7Y9xTG9IRMhicob5HwNYuF7sZkJgIN/mQ26U
 2tLw1VQhIfncXja14GkaH+WbPNY0fjdU5aeOJZJRIhqHX1AKEAJ1f2GPC
 O1EeSJSR4QvdhDdMGaGzfRsyRIqcSrUmW8OkMIS1I+CrMl5XJcrl0uJfx g==;
X-CSE-ConnectionGUID: y2/bxIFqTOyxPMN+AlPO5Q==
X-CSE-MsgGUID: 0K8UwAteTda9Dfjvp94WmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44851156"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44851156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:37:07 -0800
X-CSE-ConnectionGUID: 33SVDUJHSg2aICLc/2/zCQ==
X-CSE-MsgGUID: u4Yvk3mOSGCTAunajF21gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126922859"
Received: from jeevakrx-mobl2.amr.corp.intel.com (HELO [10.247.213.249])
 ([10.247.213.249])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:37:05 -0800
Message-ID: <d4b86f46-cfcd-461d-a7e2-be28699a43f8@intel.com>
Date: Thu, 12 Dec 2024 10:07:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel-ci: Update chamelium-only.testlist
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20241212042509.30614-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241212042509.30614-1-karthik.b.s@intel.com>
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


On 12-12-2024 09:55, Karthik B S wrote:
> kms_dp_tiled_display is renamed to kms_tiled_display.
> Update this in the chamelium-only.testslist
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3547
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
