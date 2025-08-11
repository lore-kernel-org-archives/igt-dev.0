Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7150FC87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 12:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4E010E475;
	Mon, 11 Aug 2025 12:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2hEzz2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DE910E46D
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754916638; x=1786452638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhOD1H0n3HhfLNhvWOxXT5WPg0kbzSq7usw9uMW65j0=;
 b=l2hEzz2xBLXGeG1YfVVPpHgUrddf805P6MCRuLg42cetnbHU6WUWGfUZ
 m6+eojoQ6wg/gJnGEFX8k+eFSsYcaYcd1M2a/t1e6L6DyzpMB52wSDZYJ
 MRYphJ/aUoSe7+D76y7jpqQnLqFWR87kQme4ayMM4/LNZ78ALDGoVyd4B
 KkNh/j9L1JcSpJOqJctPtuGCcxoL4yplcn6Z6G/4xCbSMlE4vXy5eGUC1
 4hHNS/Mb3yIaVs5VcCUn06QqoAQeIALf33eZoCJX292k5rUCr2pJjOmnF
 yPI4AU36iSyPai6WysrdeqzpAhTXWFgsLjU94NpyLi3J3fESeVRP6FiAg Q==;
X-CSE-ConnectionGUID: 4ydtiRpeRC+8+mPfJS3Xkw==
X-CSE-MsgGUID: JZ78b/nQSPK/GpzZCoKt0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57089047"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57089047"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:38 -0700
X-CSE-ConnectionGUID: +4BplZpdRCOyBb9Wz12hfA==
X-CSE-MsgGUID: LHaLiAtMQm6YVaj36os+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166709188"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit bc3ca4d94369
Date: Mon, 11 Aug 2025 15:50:23 +0300
Message-ID: <83082d7c5ca34f7f71002f7493bb66dc89efe7e7.1754916577.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1754916577.git.jani.nikula@intel.com>
References: <cover.1754916577.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize intel_vbt_defs.h with kernel commit:

bc3ca4d94369 ("drm/i915: Make I2C terminology more inclusive")

Modify the tool accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 tools/intel_vbt_defs.h   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1b0d93d37394..85a160e08b44 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1196,7 +1196,7 @@ static void dump_child_device(struct context *context,
 	       dvo_port(child->dvo_port), child->dvo_port);
 
 	printf("\t\tAIM I2C pin: 0x%02x\n", child->i2c_pin);
-	printf("\t\tAIM Slave address: 0x%02x\n", child->slave_addr);
+	printf("\t\tAIM Target address: 0x%02x\n", child->target_addr);
 	printf("\t\tDDC pin: 0x%02x\n", child->ddc_pin);
 	printf("\t\tEDID buffer ptr: 0x%02x\n", child->edid_ptr);
 	printf("\t\tDVO config: 0x%02x\n", child->dvo_cfg);
@@ -1204,7 +1204,7 @@ static void dump_child_device(struct context *context,
 	if (context->bdb->version < 155) {
 		printf("\t\tDVO2 Port: 0x%02x (%s)\n", child->dvo2_port, dvo_port(child->dvo2_port));
 		printf("\t\tI2C2 pin: 0x%02x\n", child->i2c2_pin);
-		printf("\t\tSlave2 address: 0x%02x\n", child->slave2_addr);
+		printf("\t\tTarget2 address: 0x%02x\n", child->target2_addr);
 		printf("\t\tDDC2 pin: 0x%02x\n", child->ddc2_pin);
 	} else {
 		if (context->bdb->version >= 244)
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 1af8407e2081..e613288937e4 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -493,7 +493,7 @@ struct child_device_config {
 	u16 addin_offset;
 	u8 dvo_port; /* See DEVICE_PORT_* and DVO_PORT_* above */
 	u8 i2c_pin;
-	u8 slave_addr;
+	u8 target_addr;
 	u8 ddc_pin;
 	u16 edid_ptr;
 	u8 dvo_cfg; /* See DEVICE_CFG_* above */
@@ -502,7 +502,7 @@ struct child_device_config {
 		struct {
 			u8 dvo2_port;
 			u8 i2c2_pin;
-			u8 slave2_addr;
+			u8 target2_addr;
 			u8 ddc2_pin;
 		} __packed;
 		struct {
-- 
2.47.2

