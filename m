Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E145BC71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0BC10E2CF;
	Mon, 16 Jun 2025 08:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y54XUnhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CC110E2CF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750060830; x=1781596830;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=g7kgjx8QE1OqH476k1y1oxJbNjfn/wqQwyLoyKFH7RM=;
 b=Y54XUnhMtvRHS5fzyR0NxU5hQKmFMQkglGzmhMg+yeBVKjgCGhzz+H3W
 5k7ySkDoHJgS9WhhAqXKjjvnubOC2teaaOtAfGZRnYoOuQtP3QHELLriH
 H9AsC7OBld9LyfbiaZEX4Vx8IW1k6Nih3x1El7hQ+uHvJKm86ROGT0TC1
 DbezIIQcc1ufNYsXSU5SwbHmVvb1n6TrXYGLvfb2b8zd36gPBbD/btRg2
 13oSkTBef10YcyKuqNW2PwnQ6YVKvKibzVX13XJgAjFhATVm+bOojSA6x
 HdVKwjS9jCYocwWpKtXSw9jOFE23t7B3RkZSyhRp9ka3fW0pt1hcSw3md Q==;
X-CSE-ConnectionGUID: 6y4qDKGITsy9hsDenI2jmA==
X-CSE-MsgGUID: XU8H5ckUTBqI/EnyJzapCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52066772"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52066772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:00:29 -0700
X-CSE-ConnectionGUID: gPnF4f1kQQKpMGL3PLksVA==
X-CSE-MsgGUID: xWHayqKqTEKDXPQcEg/edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="179300642"
Received: from ggangana-mobl.gar.corp.intel.com (HELO [10.247.144.134])
 ([10.247.144.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:00:29 -0700
Message-ID: <5fd5b3f6-8f8d-4f70-aad3-21b01b2f1cc3@intel.com>
Date: Mon, 16 Jun 2025 13:30:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250610174244.1292-3-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250610174244.1292-3-mohammed.thasleem@intel.com>
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

Hello Thasleem,

On 10-06-2025 23:12, Mohammed Thasleem wrote:
> This will check the fbc supported based on given workarunds.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM, maybe going forward it should be placed somewhere in intel/xe 
directory instead of i915.
But that can be taken later.

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
