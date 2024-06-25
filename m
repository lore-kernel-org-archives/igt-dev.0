Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF7C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B3C10E711;
	Tue, 25 Jun 2024 17:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npvqP70G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCCD10E6F2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337241; x=1750873241;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lr0s4KQeF18EDpoA3/eq4HGL2m78XTNZXuMO3TTyO2k=;
 b=npvqP70G/ZevHOyymKZADCdRoAJ2ZrzThRP0mqtdv5d8hA1xcfmffi6I
 9hmPICcSUUVSFndL8ck2AEhKpIgp8tnu5qqejwIF6GkrcMYgQbwLuSrRV
 x07cYHrapns6BGwddeDqLOWiwb/H1DZtY9Jtv/JlP5tpo+YC76HP0oH4Y
 EN/lDWBApxv/veZyINjlIZ35iMkfFEm/0XRqzVDslsXRKCrY7afTWtO+Q
 2YulUInczLJSyIgrYELoEU73jWRkZ+JBOcFMBZsbYPWXYqpfaZxF93Ke0
 yRmZhlaybBJtEewuj0Rmyah7Ehqk0LLNWUrdcZO5uzrmakXKQ3VFxUrzj A==;
X-CSE-ConnectionGUID: FNduRAc3Q3itzZ/Q4E4Vtw==
X-CSE-MsgGUID: SRVhz3x/QBK0XEmMHV5+jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184367"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:41 -0700
X-CSE-ConnectionGUID: 95WAKN7yRwCIcAN0NxyB+Q==
X-CSE-MsgGUID: 5ffsgHf7RbqSBYmBJP9/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701213"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/6] tests/kms_big_fb: Use igt_fb_create_intel_buf()
Date: Tue, 25 Jun 2024 20:40:28 +0300
Message-ID: <20240625174032.10398-3-ville.syrjala@linux.intel.com>
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

Use igt_fb_create_intel_buf() instead of hand rolling something
similar but less capable (igt_fb_create_intel_buf() handles
planar and compressed formats, the hand rolled version does not).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 605813f7fd2e..1838ee6261ae 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -188,32 +188,7 @@ static struct intel_buf *init_buf(data_t *data,
 				  const struct igt_fb *fb,
 				  const char *buf_name)
 {
-	struct intel_buf *buf;
-	enum intel_driver driver = buf_ops_get_driver(data->bops);
-	uint32_t name, handle, tiling, width, height, bpp, size;
-	uint64_t region = driver == INTEL_DRIVER_XE ?
-				vram_if_possible(data->drm_fd, 0) : -1;
-
-	igt_assert_eq(fb->offsets[0], 0);
-
-	tiling = igt_fb_mod_to_tiling(fb->modifier);
-	bpp = fb->plane_bpp[0];
-	size = fb->size;
-	width = fb->strides[0] / (bpp / 8);
-	height = fb->height;
-
-	name = gem_flink(data->drm_fd, fb->gem_handle);
-	handle = gem_open(data->drm_fd, name);
-	buf = intel_buf_create_full(data->bops, handle, width, height,
-				    bpp, 0, tiling, 0, size, 0,
-				    region,
-				    intel_get_pat_idx_uc(data->drm_fd),
-				    DEFAULT_MOCS_INDEX);
-
-	intel_buf_set_name(buf, buf_name);
-	intel_buf_set_ownership(buf, true);
-
-	return buf;
+	return igt_fb_create_intel_buf(data->drm_fd, data->bops, fb, buf_name);
 }
 
 static void fini_buf(struct intel_buf *buf)
-- 
2.44.2

