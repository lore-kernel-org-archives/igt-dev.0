Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86F3C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 14:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5645810E05E;
	Fri,  5 Jul 2024 14:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv082R1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C15C10E237
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720188665; x=1751724665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/dde3Zz6xFNLANTu5vxpLFXLkiY+8B6uuQOO3XN7Z2M=;
 b=gv082R1iAza/FoWF4IJOYT/uOd8V2HhKee5Zx+iUDc2rzcPSwISwX/92
 X8IfjHdHRIN81Pan49bX3jA1Y8JTeLwrVHujnQuyN1h6CCRwWj93hUm28
 6/GEQD++TgOJMvf6hwPDUnJ/Du+Y1Ud2lOaoQnz858Z/hkuX4Pcf9X8LP
 5/QHcQ1AJ4QFlMg1Bm4XqUwaJX419HgK40fMeZ2UKurkTVs9JskzO/bEz
 7FXR8CQxF4qMwpocpELBZWI7XMcQ9oJUEjYVleswAscBRGW4emtwU+NSQ
 5i/lJQ7BZ/6cLDW9h7xAswMU2GBLM+7HETbufKpCVKHKwUV7IIZb+HJ6p g==;
X-CSE-ConnectionGUID: lWWPL3NKRzCNqMzIg/UGdw==
X-CSE-MsgGUID: t9OF4ueBSHOsw8U0jSptIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28638145"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="28638145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 07:11:05 -0700
X-CSE-ConnectionGUID: HS9ul4dlSQaEw5CGRt27BA==
X-CSE-MsgGUID: 9DTOAeJDROSw6dKmLAKs4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="51222998"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.28.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 07:11:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] lib/igt_device_scan: Skip attributes in subdirectories
Date: Fri,  5 Jul 2024 16:10:44 +0200
Message-Id: <20240705141044.115059-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Skip reading attributes in subdirectories as they are not used for
filtering. This change improves speed and reduces the impact of
non-DRM related component bugs on testing, such as the ASPM exposed
link/l1_aspm attribute issue. After removing a Virtual Function (VF),
accessing the link/l1_aspm attribute on the Physical Function (PF)
leads to NPD.

v2: removed unrelated changes, improved description (Michal)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_device_scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 9a2da3d62..8e2297087 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -448,6 +448,10 @@ static bool is_on_blacklist(const char *what)
 	if (what == NULL)
 		return false;
 
+	/* Skip attributes in subdirectories */
+	if (strchr(what, '/') != NULL)
+		return true;
+
 	while ((key = keys[i++])) {
 		if (strcmp(key, what) == 0)
 			return true;
-- 
2.31.1

