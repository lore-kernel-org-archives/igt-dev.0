Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E40C47BC4
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 08:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B6B10E4B3;
	Tue,  6 Jan 2026 08:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jb3K29AZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A710E4B3
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767688716; x=1799224716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hOod1jjlh/0dtO4rhC/RM/7XF1hCynuwv/cpXPT/nFI=;
 b=jb3K29AZf703F3jYHT9w2iZp7SI9e23fOzHoYH4zaOjWTQs0T3D3+xUf
 1+T4WKcJ/crKw1raBdfrdyVb3auWBngfTnGZaqbQVRvd0zyqAB96LreGB
 fzr3T+JGweqxzACA3Z+7YOvgu+Vu4IiwVZhHI20tAauA4MHpt5MAxCOdS
 LXbdbTTsReow/WEUjBCl8LdUlgDzzd9/6P+3oAqs5pj9vIlg8DyudGfKZ
 90IGlWlikQwrseVkKICvZx9FT+xLt8UOzIWM1JfBAAlI6ifZ3pLzX/PKO
 jzbx1TcCRTYB3DBHi17YeUkxQYBeiVYdZ4KlNgC68ZhSbWh/4rlFtu6he g==;
X-CSE-ConnectionGUID: lOZlEbqJTKWlKa+Dp/HD+w==
X-CSE-MsgGUID: a+PHYEbZTty+ikhnm9A3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68959465"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68959465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 00:38:36 -0800
X-CSE-ConnectionGUID: EsVrX0UMQnaTJyenOAf0HA==
X-CSE-MsgGUID: 7elxzEN3TUqcblIgk6XQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207072465"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2026 00:38:34 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] Avoid crash from uninitialized pipe_crc pointer
Date: Tue,  6 Jan 2026 14:19:06 +0530
Message-Id: <20260106084906.31185-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

The data_t structure was not initialized, leaving pipe_crc with an
undefined value on first use and could result in freeing an invalid
pointer.
Initialize data_t to zero so pipe_crc starts as NULL and the
cleanup path safely manages the CRC object.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_fb_coherency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 59bc29d19..ca915bc16 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -238,7 +238,7 @@ static void select_valid_pipe_output_combo(data_t *data)
 
 int igt_main()
 {
-	data_t data;
+	data_t data = { 0 };
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.34.1

