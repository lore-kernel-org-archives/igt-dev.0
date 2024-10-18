Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AAED3C548
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 03:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02610E35F;
	Fri, 18 Oct 2024 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCC3Vs7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B5E10E35F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729223929; x=1760759929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtXyb0EJEG/3TR0pgcFMgtvJDQ3pMgS8+MdPVLQSDCs=;
 b=eCC3Vs7D6U9Iede9b2ve/mERqxxfh0W1jlb0ZIYkKydcg8fyKla7jih3
 DEUg15kytmNDow4L7CA0QWCR3y7IKTTuYUoWGZYL6G3enOKCBvhwH7UDV
 t8tzGo0zf3O+M6q+AorRgpQmskGxVdMdAFYRwnX4LNy61KDE6bG/6g8vc
 +7BJc8PlMPQxgXPeeu8AmBW1XW3AwrOkK+yKUq7IoXEtWXM6K6sF6TBfq
 h9YAbj9As+W2s0Otu8GI4O0FYAVGwdrqOSlRPltjeq6s/Ozgmb0asbLsk
 3nFi2mIZkMqEVlm8uJ4VDY+sDnk10TivGy0TI8KocUXR9SG5HluqH0sdI w==;
X-CSE-ConnectionGUID: jzo3ffKcRUm5qVeqL5dLtg==
X-CSE-MsgGUID: cBOgSvhlTAeyu6f0sdT4ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40141956"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="40141956"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 20:58:49 -0700
X-CSE-ConnectionGUID: fVjaRcAXSfqFV5Jmhp3JBw==
X-CSE-MsgGUID: u+gEmWW/TS+hSdikOvXN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="78416187"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2024 20:58:48 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] HAX: Do not merge
Date: Fri, 18 Oct 2024 09:29:14 +0530
Message-Id: <20241018035914.1740924-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018035914.1740924-1-pranay.samala@intel.com>
References: <20241018035914.1740924-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7f54eda16 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..8b70164f6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

