Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A513BCA1013
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 13:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2DF10E2ED;
	Fri,  5 Sep 2025 13:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxCmTS9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3210E2ED
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757080078; x=1788616078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RfsEr8owLvc/Ga+2crIfDWbI++ZWYNHXSFmMK/98pnc=;
 b=SxCmTS9wBz/YVQjPuX3JT3sHpB6+Uycyk6k97PIqKZyxnO9QysnuEGGu
 iMYR+EZoO6Aemd41nNJ2hvcIPesK0wCKZ0qiRXMqjoewlCObP4QoH5rn4
 Bma7C6N63pniQ/kB33UkId5+bsAnfinf/LmeduyRwQDzgKGogAw9Ccswu
 AJYy6OtnpsZ6dN0sRqOuO7Ty+iYXX7VVzKtAIgNy0n4Q6PNWe0tpSb4n1
 NQmcQKKEpBDvvchkKoxRUStq8t7Be4MjuhsW6jMlCBedZyNHLAtnKvvLi
 klRRTKt4R6+R6RCWydXiTiRbJSHtqCy2Fjo9bCYuYA/2bmKcOj0O20AoK Q==;
X-CSE-ConnectionGUID: +cPXuQvCRNCcSGAOSCk/sg==
X-CSE-MsgGUID: gyxusCyOR2uwjCzHwncuog==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59129759"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59129759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:47:58 -0700
X-CSE-ConnectionGUID: vJFrR24pQwucr/eOQXAW3g==
X-CSE-MsgGUID: l0vMtbjJQzmdD/Cr55Aojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="202982507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:47:56 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 3/5] docs: rename cross-building.txt to .md
Date: Fri,  5 Sep 2025 15:47:31 +0200
Message-ID: <20250905134735.132119-4-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905134735.132119-1-pawel.sikora@intel.com>
References: <20250905134735.132119-1-pawel.sikora@intel.com>
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

Rename cross-building.txt to cross-building.md
in order to be properly processed by the mkdocs
documentation tool.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/{cross-building.txt => cross-building.md} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/{cross-building.txt => cross-building.md} (100%)

diff --git a/docs/cross-building.txt b/docs/cross-building.md
similarity index 100%
rename from docs/cross-building.txt
rename to docs/cross-building.md
-- 
2.51.0

