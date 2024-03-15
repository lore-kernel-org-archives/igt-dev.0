Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E814C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 19:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1B2112473;
	Fri, 15 Mar 2024 19:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWvD01eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E7112473
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 19:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710530117; x=1742066117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XP99Xqjqh+/P5K40FhRH0JffHA2G0GluBFND2SC+tks=;
 b=WWvD01eoga9g5O3+Vdi4YTWlW0vsx+M1y19s6VZjoUeXIdXqa1jBHkM+
 8WS72Ir+bbAmDyxRds/mlDF3KQVL6nGDPS0lquAMTeHAAuInYj9hLresc
 jZhc24ZyLpkA0FgViTbokWsIajBND1NSDvMZXijy0vCvciwMky8UjjAz5
 7C6vwBo2jrkgx+emiAeUywAVG0q+1D2dfPHNhvb3N+gYETLqJgFFm9XvH
 Yan5Vr5AKNk5GJ/Vqo3Dxu91lhXDTI/QcdCX113QU38eNGXVG/Nztc0hC
 LFcsRwRpJ0jFgC2gA8C0JPdBr/FMse0NG3ax1cWRoctqUJWrVLZR5E6NE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16063999"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16063999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 12:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780749"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="827780749"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 12:15:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 21:15:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH i-g-t 1/5] wip: drm-uapi: add drm_plane_size_hints
Date: Fri, 15 Mar 2024 21:15:01 +0200
Message-ID: <20240315191505.27620-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add drm_plane_size_hints definition.

TODO: do this properly once the kernel stuff lands

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm-uapi/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index ea1b639bcb28..a1d8506ff56c 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -857,6 +857,17 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_plane_size_hint - Plane size hints
+ *
+ * The plane SIZE_HINTS property blob contains an
+ * array of struct drm_plane_size_hint.
+ */
+struct drm_plane_size_hint {
+	__u16 width;
+	__u16 height;
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.43.2

