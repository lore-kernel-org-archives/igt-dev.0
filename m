Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A07C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433EB10E6F2;
	Tue, 25 Jun 2024 17:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHlq+slp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB210E6F6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337252; x=1750873252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nhO+Ot2xv5B8oIjHDSb8Sl6r9hWQlO054qbdie2NtH0=;
 b=HHlq+slpt5PfG4SHc0bDS1gFlb1a5oXHS5GBrY+06WkhjIfB8rvq1w6S
 zaXhll6pjX3RNtBWUrgC7blUrw6b+hbZvjfFScB6Zv5j+KZ8qPNJ9qN5u
 LAVrm9b7SkGJ6ZE9+X8mSuUhv05O0qlAbFWClCxh5E8GXo+CCcKuIQVzb
 gF+7EaMa6K7rXcf79XfstEvIJcAEAsfUNOyu1UIw3GzpFrRzNISWfINK9
 58EPRxAGLQcU9XPvyP8xieF94qg8mp7+WBlRWAP/c6mLNEvQ6r+teP90w
 u/740QBIVsnqnhS9Kz9Oq9rHVPQMLJBt996r+1FtNAl7hmP+kHF7coHPL g==;
X-CSE-ConnectionGUID: Pqc3nanfSCKklVFsIY/7ZQ==
X-CSE-MsgGUID: tCAKI9/ZTwejeSjd08iTFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184385"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:52 -0700
X-CSE-ConnectionGUID: JQYfXkJvRhiwJ8owZ0wRng==
X-CSE-MsgGUID: hYuE/9HxQyWtQkGkN9hHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701236"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/6] lib/rendercopy: Enable clear color consistently
Date: Tue, 25 Jun 2024 20:40:32 +0300
Message-ID: <20240625174032.10398-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

We are computing the clear color enable bit differently
for the reloc vs. what we stuff into the surface state
directly. Unify.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 04ec7ec99d9a..b4d34bc6864f 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -146,6 +146,12 @@ static const uint32_t xe2_render_copy[][4] = {
 	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
 };
 
+static bool cc_enable(struct intel_bb *ibb,
+		      const struct intel_buf *buf, bool fast_clear)
+{
+	return fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid));
+}
+
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
@@ -238,7 +244,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
 								   read_domain, write_domain,
-								   (buf->cc.offset ? (1 << 10) : 0)
+								   (cc_enable(ibb, buf, fast_clear) ? (1 << 10) : 0)
 								   | buf->ccs[0].offset,
 								   intel_bb_offset(ibb) + 4 * 10,
 								   buf->addr.offset);
@@ -246,7 +252,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
 		}
 
-		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
+		if (cc_enable(ibb, buf, fast_clear)) {
 			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
 			ss->ss10.clearvalue_addr_enable = 1;
-- 
2.44.2

