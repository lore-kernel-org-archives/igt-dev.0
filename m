Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B1BC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 11:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254EF10E570;
	Thu, 21 Mar 2024 11:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QssAPKEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D010E570
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020516; x=1742556516;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qM0CvxuUgKiSg4aS+zUXRg6hSmj5vyL/1soUvslFVR0=;
 b=QssAPKEBD7cLMYd96vthRk2KLzw9nASST7W4k750Pd/tZdL575n0l+bZ
 oqBvP4vnq/LWjGuNAEa5jwSGx4o559J3Tc9LHPNGfWQpg+ci0ZedXXUFd
 sk3S75E7FGLCavySBdWV8KEDnrwFblwoZCytDBc/oR0BhIKSPEtwyWB3f
 qISCou3odZf2KrbUMe92qdzaRaiifu7fCSWafUeKCna2lt/fy6hloZhOi
 s7hqkIRT2V+vd91hUXZYkzoOI9+/ZFTM8kzzxbqpVVtzYDX+DdqpZChyC
 4Jm/qgBhoDV0WR7X5ygfyuYd1zFtH4+5K3vdCcZ42ppxXQ3fAcS2O9KJO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17140068"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17140068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="15119380"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 21 Mar 2024 04:28:34 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 1/3] lib/xe/xe_spin: Update xe_spin with exec_sync
Date: Thu, 21 Mar 2024 16:57:36 +0530
Message-Id: <20240321112738.8703-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240321112738.8703-1-sai.gowtham.ch@intel.com>
References: <20240321112738.8703-1-sai.gowtham.ch@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

