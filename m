Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4779C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681E010FDA1;
	Wed, 20 Mar 2024 15:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRyATF1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0610FD9D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950126; x=1742486126;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9xYnl4KYijOSNCQzTd8lAGQbbs2IAwlDcmNQCv5B+1A=;
 b=bRyATF1qJ4a+5muypj/tzh7n8iFlPMShXmynyk6nGnovXMgrLL3Fb7Tw
 8ypfliKASWWsdizXxAL5KFUKZhtsAoHoTxQOHqLIHb+pKY/Ic8Hr06t+8
 f5Y63EC7lXezCOZupYwCU613KA65jpZCnLEd7l+rssRe+pT60Bp8/iPhB
 OfoC+N+H4Z0xfOQTyrlOlmM5msvFe4KcLcfrYEU+H23CGllEPjHaeu/Pi
 WjRfM4g9OzvHWUWfljqBtRLnY3z5w/tUpDb5uxNn4MRAGiK4rkGMHnn4E
 nlWHchU3JoyANdJsqywJVZ6ouQYQeLc/aqH3ZlAnCPZMKl//jRMO0eHEu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5821256"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5821256"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14590084"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 20 Mar 2024 08:55:25 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 1/3] lib/xe/xe_spin: Update xe_spin with exec_sync
Date: Wed, 20 Mar 2024 21:24:28 +0530
Message-Id: <20240320155430.11877-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

When a spinner is submitted with LR mode, exec_sync can be used
as GPU address when sync is passed in via exec IOCTL.

Cc:Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/xe/xe_spin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5c8c45143..87b7c1716 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -38,6 +38,7 @@ struct xe_spin {
 	uint32_t start;
 	uint32_t end;
 	uint32_t ticks_delta;
+	uint64_t exec_sync;
 };
 
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-- 
2.39.1

