Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAA3D11185
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 06:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6876210E381;
	Mon,  4 Nov 2024 06:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faQmjRb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4710E37E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730701174; x=1762237174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtXyb0EJEG/3TR0pgcFMgtvJDQ3pMgS8+MdPVLQSDCs=;
 b=faQmjRb8NLq+r0YIv/rCFNMYZrlfk8EJztj2USrIo4aoL1s6HK3BH2pV
 wRd5iIG1qhR45evoi91H6+Rzb9yI5IVWuzPx2smJlpa8NYujsXv2xkujG
 3tjkQsr+rq2M5a3VS112ktNL8ekR+0EPMmNOXJPhspr8pBHHXISqmxF9r
 rSZ3mFwAxU2bDyKtDyYesSbgkbyzx53oKRdODEUJFHQwVpN1VpdicQJh6
 uo5p7lb3dkYDkn476ztOggRJD7y5hJc3qUFx3EQjYGqAT7XQyF+pO7FI5
 LXys3CscTvkMOpA5w0Q6+8ROevRx6rf0GTFzQWopqRh64ET02i9HO9MIp A==;
X-CSE-ConnectionGUID: ocGBa6zySoeb2Oj/xC7uXw==
X-CSE-MsgGUID: Z+sL3d8GR6iEKupxIA3fqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41017549"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41017549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 22:19:34 -0800
X-CSE-ConnectionGUID: itsVBaxgQWCIoHOMZ2ug6g==
X-CSE-MsgGUID: qpeihFlcS8WNggyf3IH5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83082996"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 22:19:31 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] HAX: Do not merge
Date: Mon,  4 Nov 2024 11:50:01 +0530
Message-Id: <20241104062001.1813180-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104062001.1813180-1-pranay.samala@intel.com>
References: <20241104062001.1813180-1-pranay.samala@intel.com>
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

