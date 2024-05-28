Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B474C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C5810FF38;
	Tue, 28 May 2024 05:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dE76xYlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6A10FD14
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875390; x=1748411390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8nqJs7V6GztPzz+QMhUSpwp91nOEqVufqpRlUaqoXM4=;
 b=dE76xYlGIxsf2tbEjyfxM2BaL2nhgAt8vBMdiAimaLjARu7gXnVUdhQ1
 G0YxSpOO+NgWSt3UlLcCZZCrmAxragpVW7eRd6tCX7afJYb4WwOiivxNR
 +BDNjXZ72lhPatmcbH9Sc76EoqqxhoaHGdGAfRcy7MuID0OKcfMTEpPEh
 PgEB66tgkiUbzeahsdFpNEoNEdXNxj15vzU2o8TZHH9tXoznoqvC1g8zU
 I7DFYJDshiRSU975j+rBidsl6JQmPIf/cprbIUyWvdxZfKbfH95KHPTmj
 uY14dYtdHSmdDpQuxvksUKHepmQM56KJ2kjgwx3J0muhNS4frJECCzMQJ w==;
X-CSE-ConnectionGUID: f8hfhzFZReqS79QdCr4GTQ==
X-CSE-MsgGUID: YVaUoBAITCetFW9cRJXxRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615877"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:49 -0700
X-CSE-ConnectionGUID: lGwCdJusReS+8lSgNtjzyg==
X-CSE-MsgGUID: EI5MbblnQdCsIhvHNsXVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165885"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:48 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel-ci/xe: Drop fbdev tests from blocklist
Date: Tue, 28 May 2024 11:12:22 +0530
Message-ID: <20240528054223.2945356-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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

Drop fbdev tests from XE blocklist.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index fa963faf9..b33b568fa 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -36,7 +36,6 @@ igt@device_reset
 igt@drm_fdinfo
 igt@drm_read
 igt@dumb.*
-igt@fbdev
 igt@prime_.*
 igt@sw_sync
 igt@syncobj_.*
-- 
2.43.2

