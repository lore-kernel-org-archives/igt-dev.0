Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D39C54E67
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 19:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0A2112476;
	Fri, 15 Mar 2024 19:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOkqjUMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AEE112474
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710530123; x=1742066123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wx7oAzwcX4xixiS/Y79A5vOX96hsWiUyje8PVYCKB00=;
 b=YOkqjUMQmHfgH3Ymt5qCrAz0459TZwv0gw7iEsItFNtHjDFwtq/1yq/M
 Bm773MyDORxi+xvcVYv9L02U3/I5FBgW4CMcEzYBWRdh+3uUxOmZRYl8J
 vDYzvMk8MtAgToWUaEHccnhwze29B7lgjfN6kHSHInEFDCE9Y2L30R5Nb
 MxW+RMwWSa4fN71KoMkNO7UUp1uBk/RedkIcY1DWZWzx9/Gnf5wFwrQim
 Xb52mRRrXeSLvtM14IcCmoqsLK+MRrUCUgHH1/FQd7IMb2ucbJYG7kvA/
 lA/u6UJVtms8xSTJ43IpA06A/WpNcL/tKs/GAWX1zkgxZPowLmmKh7agu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16064015"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16064015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 12:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="827780752"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="827780752"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 12:15:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 21:15:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH i-g-t 2/5] lib/igt_kms: Add IGT_PLANE_SIZE_HINTS
Date: Fri, 15 Mar 2024 21:15:02 +0200
Message-ID: <20240315191505.27620-3-ville.syrjala@linux.intel.com>
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

Add IGT_PLANE_SIZE_HINTS so that we can can query the plane
SIZE_HINTS property via igt_plane_{get,has}_prop().

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e18f6fe59882..aa6f63594422 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -681,6 +681,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b42f..b2cbbb7590a5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -344,6 +344,7 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_SCALING_FILTER,
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
+       IGT_PLANE_SIZE_HINTS,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.43.2

