Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1680C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 20:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ECD10E171;
	Thu, 18 Jan 2024 20:13:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8AA10E907
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 20:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705608818; x=1737144818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/5CFdCxfJA1DeDUNUeS8Xxx/HsdtkhXXPJL7ESzOIc=;
 b=idAeqBW0B0ErbIq4Z6boomCA+SR8NCnXz0ewlTDeL/1dx4s6GD2DWY5c
 2NGSqW+kU9DQJszbUYl8yAKl741W4LLGiHRgsE9ijdaUK7p/DJxraCGHh
 /pk7NLhPAnIWkRnlLen2OCxlfxhep5Rm/Dvfyk64V0bml09dnuVeOnqr0
 9yw3IhOMJs5UQi1qdiDwd3vfIDMeEpwyXs+0Uy13D2jvJ30kbcJsgwywj
 aC9w02CV3dWDH4I+DFr6U79MyboivsoFs6uYP96d5/4zY6FXrsggu1tkJ
 kdShrI7+1mdWQUMdSWcdlD7hH0d6KF7s9U4jA6Gnjiz5VbUKyAp9xQdM/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="391009929"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="391009929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="19199721"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.72])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:13:24 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Fix prefetch on Xe2
Date: Thu, 18 Jan 2024 12:13:20 -0800
Message-Id: <20240118201321.961595-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Addressing Kamil and Matthews comments:
I have made the title as such to fit the char limit
while keeping the full path. I added Xe2 and i-g-t
as reccommended

Jagmeet Randhawa (1):
  tests/intel/xe_exec_store: Fix prefetch on Xe2

 tests/intel/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

