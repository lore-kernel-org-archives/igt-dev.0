Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A39CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310BE10E097;
	Tue, 11 Nov 2025 06:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APjx+8su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B5910E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842351; x=1794378351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q3a9eRJvDdiXEWKlUTVHULXGxPwjbUfNIQ0gXUb4mLg=;
 b=APjx+8su6p7DDhgqjfwSF9++Kkazi6Q5Vr5einaLrrRA6Tl9FJxjMpYh
 SkFHyHWfuHVaW9n2wVwUiWlfDtbepx+ZVcAstMyznQ9I6OpZijRfg9SXs
 sywkSDMcliRsPXoZHd4RinIy9W3zhrW4/u6GpdkibQilxpjdEV5o5Z4ov
 13KXIddZnCSC2wm2E0dAmFlm7+6RBfDoyUWOTdjqmbwCFd8TUHr/kFqOO
 5+JRB/H6L6A+MvFV5LpyaJg8pTabos529qM1DK9uT+MvMtdJ+2/8mO3jZ
 Q3xl1fPmj+yjlFtJHYbk9hrg/urQCMcaOQnvl3V0PxZ982Pj7tRPOFl3w g==;
X-CSE-ConnectionGUID: B64CVfK7QAqTE+VDfbA6uw==
X-CSE-MsgGUID: IOf3oIBAQyGlPwA6lY42rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75196278"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75196278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:25:51 -0800
X-CSE-ConnectionGUID: HBmE9Pl7Qf+3liLq/LbqJQ==
X-CSE-MsgGUID: o7ohQWfqQ22RgpAVtOdShA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188209633"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:25:50 -0800
Message-ID: <e29c40a1-bc76-444b-80d6-d4088c0eeff3@intel.com>
Date: Tue, 11 Nov 2025 11:55:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1, 1/8] Revert "tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs"
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-2-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-2-mohammed.thasleem@intel.com>
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
> This reverts commit 022083725350b3a7f31c8d3f59e28c339fddc7e8.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

Before merging please get ack from Vinod as well

Thanks and Regards
Kunal Joshi
