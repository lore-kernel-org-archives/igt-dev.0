Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B48C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BCB10E4B2;
	Mon, 27 May 2024 07:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzC0Ojbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5310E0DA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795262; x=1748331262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iUjMiyGpYVAWMwYlqaGPDymPxSqQ6LP5hQ2GxTeVwQ=;
 b=MzC0OjbwhHkVbqZXF0XAp2l06Lhi6vv1zjpz/xyWINunsUHLvlWCOP5t
 ZtjX49Evidf5/VVAcL83w79/1qQ2ZBKvAn9nIPIc4S8KhYQWoPCmME2+x
 xbpATALTTOv9w4S7EoSQoD3/HSQfexLwoLI2q6FUzTSUbLI6NvXXgxZLa
 dMIaFtSj8miNXapBt0K3cpaaHpeWSOU0ETqHqh/tB5kPdjYOvBK9OPBjA
 5nVML1REXM6+V9SLBB4C+4+DXJt8qGd1ldeA3KLV4hjvlxdYE2lOa3Rjo
 XTpbgiwYa8PX3EM+XMIr5vAtVy/h1xAc3XR0nz2bcslHxEtLLBuLp4l+P A==;
X-CSE-ConnectionGUID: 618gjKbBS9OdiN6PUeKiWA==
X-CSE-MsgGUID: o5j5hgOxTD+B0TNdwI0DuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225250"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:21 -0700
X-CSE-ConnectionGUID: WO4/JXx2SLyy9FhdXekbBQ==
X-CSE-MsgGUID: 2au0hNaASPCAF96azKxgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584421"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 04/12] lib/intel_bufops: Add Tile4 in linear_to and
 to_linear helpers
Date: Mon, 27 May 2024 09:33:37 +0200
Message-Id: <20240527073345.54729-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

intel_buf_to_linear() and linear_to_intel_buf() allows easy tile/detile,
only thing they need is to select appropriate implementation. There's
missing switch for Tile4 so let's add it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 30ba2547dc..56e37d2da7 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -804,6 +804,10 @@ void intel_buf_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 		igt_assert(bops->ys_to_linear);
 		bops->ys_to_linear(bops, buf, linear);
 		break;
+	case I915_TILING_4:
+		igt_assert(bops->tile4_to_linear);
+		bops->tile4_to_linear(bops, buf, linear);
+		break;
 	}
 
 	if (buf->compression)
@@ -836,6 +840,10 @@ void linear_to_intel_buf(struct buf_ops *bops, struct intel_buf *buf,
 		igt_assert(bops->linear_to_ys);
 		bops->linear_to_ys(bops, buf, linear);
 		break;
+	case I915_TILING_4:
+		igt_assert(bops->linear_to_tile4);
+		bops->linear_to_tile4(bops, buf, linear);
+		break;
 	}
 
 	if (buf->compression)
@@ -1942,6 +1950,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
 		}
 		break;
 
+	case I915_TILING_4:
+		igt_debug("-> use SW on tiling 4\n");
+		break;
+
 	default:
 		igt_warn("Invalid tiling: %d\n", tiling);
 		was_changed = false;
-- 
2.34.1

