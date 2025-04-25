Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA10C369D5
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 09:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831010E8F7;
	Fri, 25 Apr 2025 09:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnqCpJ1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DD510E8F7
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 09:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745574574; x=1777110574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djcMcXMZicDcHvfEulTUgx5ULxXcqaKWbj2g+4nyu/U=;
 b=DnqCpJ1Z6YmzZCUS87EC4Rao9U0H7uhSfN6eTTYZtWF3j0BVzg07PE8v
 A/oTNFulX19AOyAQ6GHqQs6Z5jZvDew7Vgn31tuFbrYn8lj3Q/UQgBr1A
 3QJ0bME1C3cWE3gqPFq5BBVa0A0BXgVFWAl04qAXqmcsac8D4CNX4w33q
 tVtlKTstPgMJdgm5p647SmHmwSTAf/Q6SOPGosLgiH2xyNTJspz80si4l
 r7On6T7Y8L3fBjleDNwtSWrQwJq9NsryGRERilfekshWbjRgc4sFQW89K
 d5HuJvdpA2M8uuqZhL5WFATfY80pczAl5pYaHPhXKhEeVMxjj8CpdOyh/ Q==;
X-CSE-ConnectionGUID: 8/CSeit4TaqSFbv26ZfCWA==
X-CSE-MsgGUID: FJQncPxMQn2rLrpO9d+JjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57874363"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="57874363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:34 -0700
X-CSE-ConnectionGUID: qBUk+TJeTr6hDm6grvK6LA==
X-CSE-MsgGUID: aAC+QyZrSi2kkc7Xvdpmlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132606770"
Received: from szymonos-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.252.47])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:33 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_facts: Remove unnecessary extern from header
Date: Fri, 25 Apr 2025 11:49:03 +0200
Message-ID: <20250425094904.221857-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425094904.221857-1-peter.senna@linux.intel.com>
References: <20250425094904.221857-1-peter.senna@linux.intel.com>
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

There was an unnecessary extern on the header. Remove it.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_facts.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_facts.h b/lib/igt_facts.h
index e96f88083..109f0d3bd 100644
--- a/lib/igt_facts.h
+++ b/lib/igt_facts.h
@@ -37,7 +37,6 @@ struct igt_facts_config {
 	bool enabled;
 	bool disable_udev;
 };
-extern struct igt_facts_config igt_facts_config;
 
 void igt_facts_lists_init(void);
 void igt_facts(const char *last_test);
-- 
2.43.0

