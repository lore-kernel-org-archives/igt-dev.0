Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A62CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF3D10EAE3;
	Fri, 14 Nov 2025 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLGx8His";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BA010EAD9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140979; x=1794676979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kqaqNibEnMChuDD2ar8o5aVkA1NiAFlMZk9FZADHEIU=;
 b=YLGx8HisNlfypKV6bL6wiE2JdqHdaqMNjV+hXt7DRowwpDwi0o5Epq9Z
 z5aNM9Vl2j2E/yYTY/COXo//YtpeMEJsxRRUkPvjGeTIpzLrk4ZViDX88
 O9Eeyf0ngUA0VbPvwLI/9vEdLEEW6f4VY9TtnxneHsdQ+w1cuywqCulf3
 QEwuk8f/q0oMxN/AW7kY5AWRXW91ezZTc4/VmosszboJXYmoNQ3ijQam4
 ecAmMbL8yp3s+d23kSCHkHUR58wB3R/0B7+PpIXB6ESktKDW/gjsiyUcf
 98zs25Eiuo49Dqxo3LE583a2NzQ5brUKEJ2LgdK7iVgfXbZPTMGc0SJnk g==;
X-CSE-ConnectionGUID: DCBW/VicQ2KhabYy+do64w==
X-CSE-MsgGUID: nthRD52MT/+eQ5fkBT0dUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871461"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:59 -0800
X-CSE-ConnectionGUID: RAC7zilIRuufAVlYbcX6qQ==
X-CSE-MsgGUID: qVmkg2TDQVGerE7RVuKnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981631"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:57 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v4 19/23] tests/kms_color_helper: Add support for
 DRM_COLOROP_1D_LUT_MULTSEG
Date: Fri, 14 Nov 2025 22:59:04 +0530
Message-Id: <20251114172908.1027816-20-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Extend colorop handling for multisegment LUTs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 35b4a53d8..66193f050 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -454,6 +454,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT_MULTSEG)
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -600,6 +604,9 @@ void set_colorop(igt_display_t *display,
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		igt_colorop_set_multseg_1dlut(display, colorop->colorop, colorop->multseg_lut1d_info);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
-- 
2.25.1

