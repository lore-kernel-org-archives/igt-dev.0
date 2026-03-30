Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999031061B0C
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4020E10E649;
	Mon, 30 Mar 2026 14:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBuIgZ/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DAB10E649
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774882286; x=1806418286;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SE2KWCE0tM4qBzN60IbYXHEkt6SonV7wS0xzLuJwByo=;
 b=HBuIgZ/V0c3eYr+ZoXn2E8WT1yMbFwCe2WcY+U4Z5P9PkFmskcyzO7z6
 Q4XzDrqFlECvHobkSwOfJWCWnqCbFrn0/DQz+TkbNm/1SQV+3OrmKOsxZ
 V6wfRXzGYJtmw7A/MSv5P6Vuy1S9/k5o9aJdflsKq/wrEo8wHSyEcsDU8
 bN/9NQPB+ZqSUVaDCtdhUtkTJtpDCTnoDv0XU4EOPiq6yG/EpJc9nVPYj
 cF1xk5zzGrxTNLB0eGUxtiG1N3ymocUzrI/fRQPRLGYpPDG2TJi4tIvTG
 9xw/u2n9so1QWaoiE+h7Sl5/9A+lQ2ojCoWwbZi2AKNR3zTzt2inSJhRV w==;
X-CSE-ConnectionGUID: pXWbf9RSTCaT6Elf5EVL9Q==
X-CSE-MsgGUID: El1IPQK5R0mlsQGUPAecYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79779455"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79779455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:51:26 -0700
X-CSE-ConnectionGUID: WzQ4A3gERL2J1nZVAFNLHg==
X-CSE-MsgGUID: yao+zuYlR5eRZMP3CR5pYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="222768554"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.123])
 ([10.245.245.123])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:51:25 -0700
Message-ID: <2d39a8ab-0690-4678-85b3-8520ed471510@intel.com>
Date: Mon, 30 Mar 2026 15:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/5] lib/intel_pat: Support other than gt0 during
 parsing debugfs PAT
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
 <20260330144032.1954771-8-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260330144032.1954771-8-zbigniew.kempczynski@intel.com>
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
> Main and media GTs may define different PTA entries so add gt as an
> argument during debugfs pat config selection.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
