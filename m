Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDDFE674B5
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 15:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0765888647;
	Mon, 22 Dec 2025 15:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhL8xSKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B910E6D5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766419013; x=1797955013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gN/Jq7uikGXxf65cKrw3wS04RFVfnQz/i63Cex3G+88=;
 b=BhL8xSKCwjIHYuGuWpm9skKyR3dkqrWnjX/izNOHPNzuCU2TjakYqO18
 JJCG2KpCQXZAaMsrcuBV1A0hIOoQbiEFRMOJPYu+HvNCR30xFOhDfcv7q
 ofI8i3ckN9EftglwxdjRLt+x8eJjgSd0THmWuUSW55CSz3K1Lm1NmwoHO
 Wx+hM2r5q63iCMrm4CIllaU7x0ComJFkxTx1+W3qOcLMBHQYhI7fXgIh0
 Vis4vdvMgquxYhtVpMSiOw7/yoinSS1CIIGH82bM82bNlWf0VEN+H/+dQ
 rmeyTMN7PmFaMpZHb70z0xTL4rTGsOZtwjMnilBNVGjxgI0x9fidVvw2u Q==;
X-CSE-ConnectionGUID: 1SOern25QL2B+pWgMsJ69g==
X-CSE-MsgGUID: lnPxvU7lQTGd4jm/jQaVqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90934971"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90934971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:53 -0800
X-CSE-ConnectionGUID: uxbjt2BnTAqAzOEz4xAPug==
X-CSE-MsgGUID: inthiyJlRLWQ4yawbamJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="200445559"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:56:50 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v3 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Date: Mon, 22 Dec 2025 21:15:40 +0530
Message-Id: <20251222154541.4119131-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222154541.4119131-1-soham.purkait@intel.com>
References: <20251222154541.4119131-1-soham.purkait@intel.com>
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

Make function xe_spin_sync_wait() public
Which waits for the spin batch associated with the
given igt_spin object to complete by waiting
on its syncobj after spin end is executed.

v1:
 - Add simple commit message. (Kamil)
v2:
 - Add fd description for xe_spin_sync_wait. (Kamil)
 - Add improved documentation for xe_spin_sync_wait. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_spin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5dfe05cb5..31154997b 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -81,6 +81,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_preempt_wait(struct xe_spin *spin);
 void xe_spin_preempt_nowait(struct xe_spin *spin);
 
-- 
2.34.1

