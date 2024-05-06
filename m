Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04367C10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 13:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C910E3A1;
	Mon,  6 May 2024 13:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb0BNcK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED06810E3A1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715000874; x=1746536874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eaWruyDknFJX3NjuoEko01zZE3x2iUZ4zGAyTuq+RT0=;
 b=mb0BNcK2qXo3fBHPNJsSGfTmwSIJ973kMweTSVwR6OU+uRvJdLVhq8jS
 0ly7C36nz2CysMxLSaeZ8UIrfB8pHeeiMmrJ7CtpP08zmufEAk2KANmr0
 sG1zygoxNG7YfzVwBiRznqWnyj0FR5rV0ivDDG58Qwdr/RtR3RrEyBERt
 gXPn0A6z1XeB1r4GOFfKwszpPvn6K+x2BsvSvSF+PuGSWa+xlDlSsEItR
 771wo4RMoxyEZre/1xM7v+zyJ2OUlWHww/76MWH4Yvq26imS3rqU/PXay
 YToAigS0IsVfOI13yVrWq4ou4eeXkp4DJmHbisE2mI3rHljrRq9R7gxrQ g==;
X-CSE-ConnectionGUID: 2MCVAB1rRCOpwwD2dcFbbQ==
X-CSE-MsgGUID: sjuv21gERpmNQCcGnGQXvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="33251986"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="33251986"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:07:53 -0700
X-CSE-ConnectionGUID: N9oErwgYRUKN+xRy3IqMfA==
X-CSE-MsgGUID: Evz84umrSwyfrm9Gi25EyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28148619"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:07:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org,
	Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] igt_core: Update doc on generated test-list.txt
Date: Mon,  6 May 2024 06:08:44 -0700
Message-ID: <171500091635.61232.16230063809596020428.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503115545.44784-2-gustavo.sousa@intel.com>
References: <20240503115545.44784-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Fri, 03 May 2024 08:55:46 -0300, Gustavo Sousa wrote:
> Commit e72686b83b0b ("tests: create a single combined test list")
> updated the build to generate a single test-list.txt instead of the two
> single-tests.txt and multi-tests.txt files. Update the documentation in
> igt_core.c to reflect that.
> 
> 

Applied, thanks!

[1/1] igt_core: Update doc on generated test-list.txt
      commit: 7fbab9beb12cfb0aa8e35e3dec285eede8fdc67a

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
