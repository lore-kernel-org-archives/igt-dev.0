Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E35C61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 05:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEB010E0F6;
	Fri, 13 Jun 2025 05:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3059Q/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6511110E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749792824; x=1781328824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HI7YERTBWDuUXhF4K5cjF+pqmpF0s0Ub//WhQRQu4/M=;
 b=S3059Q/b5BtlG24uJlqBk2GFhwDnKx858BHlmQNQSOSHrK9rR1SZg7QQ
 HNcYIbx5Kh7G3aIzikgQXH7TKqgy0hLo0gqmUIjIPA0f0lDuP/vW6oEUk
 Ann3L3bHWLiMRaob3EqutM76nocOIpeuJDqxwM1cDdMPrg1R+GBjIRRMC
 LuR5cNyGvRZ7ekpgCPVDH3faPfmHXMHBd1MkLe1bJWof7wZumN5EX3Skv
 +2HTFjdo/mY3+jsfxYg3TiRuT+JDzLBEY/f3+75wO6tzBEaHG4iVU242u
 AtR+i+gz5i6+1YMakUy8/kl3cwbsjv+Ley0Y9K3HFayQAJ6+oazAuB3Hw A==;
X-CSE-ConnectionGUID: PGG7vKt5RM2JtUJgDwHmjA==
X-CSE-MsgGUID: 5+iKwj84TNeEfBKEMvXUUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62652289"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="62652289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:33:43 -0700
X-CSE-ConnectionGUID: z0ZCYjK0Sx6JJ96Uy0QNqg==
X-CSE-MsgGUID: IbAETyamS9G9pY3+BSkFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="153019269"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:33:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci: Blocklist unsupported Xe scaling
 tests
Date: Fri, 13 Jun 2025 11:03:14 +0530
Message-ID: <20250613053314.3304339-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
References: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
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

The second scaler does not support downscaling in either
vertical or horizontal dimensions. Blocklist the affected IGT
kms_plane_scaling tests that involve downscaling scenarios
unsupported by the second scaler.

v2: Update list as per review comments. (Karthik)

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ebe1ff006..dcdce8b20 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,6 +82,8 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 igt@kms_plane_scaling@.*downscale-factor-0-25.*
+igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
+igt@kms_plane_scaling@planes-upscale-.*downscale-.*
 igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
 igt@kms_writeback@writeback.*
-- 
2.43.0

