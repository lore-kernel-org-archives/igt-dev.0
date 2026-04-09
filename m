Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC74EE9DE6F
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBDB10E2E9;
	Thu,  9 Apr 2026 09:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cgs/CiP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495C10E747
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775727527; x=1807263527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3+nbhMbfzcqwFztMOL7n699b5uhN1yf2H5alSyEjQ8=;
 b=Cgs/CiP7wn8B8ropkg1O3ukVPVWDKBOMS0FTG54RH8YKbRpHShLtu73S
 TXoe5r8UTYqi0h69+g1vgt39+XYzNFfxz523dkcX3LNmukmPeZe87rJwr
 aw6eht02y4YlRXnuL0EG7JgpBmhezWU8wRVfBsFQDOTiGWeUOUvz2beju
 2LZRH2d4ek3PuP+njQ3WIyrOf8bz9SE4E6FR8MfSkR2QrM/Yg9xWMjRmt
 9crQLSTwENbSVAvhL52v2bHAu+KHMAoes9z5Hh4JEI+6IJD7TZV3IMVUl
 c1DJj5bDsR+mDJRvxJsnV1JDcqdlHU9WCxzj89cB3bmPRIKlT2iP9qA4N Q==;
X-CSE-ConnectionGUID: tWoRLC1ATiiXHai8w3DTYA==
X-CSE-MsgGUID: HASPNIw9RFmsLzcjTqi+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76798823"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76798823"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:38:47 -0700
X-CSE-ConnectionGUID: gdyn8fyNR++JxJSgyB1gkg==
X-CSE-MsgGUID: IOBHNj2sQw+ICFIsbRoTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230391537"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 02:38:45 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] DONT_MERGE: include/drm-uapi: Add ERROR_REPORTING
 capability
Date: Thu,  9 Apr 2026 15:06:38 +0530
Message-ID: <20260409093639.27449-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409093639.27449-1-jeevan.b@intel.com>
References: <20260409093639.27449-1-jeevan.b@intel.com>
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

KMD adds error reporting on atomic_ioctl failure. A capability has
been added for the same to check the compatability.

KMD patch is under review
https://patchwork.freedesktop.org/series/152275/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 include/drm-uapi/drm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..381b6eba4 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -776,6 +776,14 @@ struct drm_gem_open {
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
 
+/**
+ * DRM_CAP_ATOMIC_ERROR_REPORTING
+ *
+ * If set to 1, the driver supports reporting of failure codes on error in
+ * atomic ioctl().
+ */
+#define DRM_CAP_ATOMIC_ERROR_REPORTING 0x16
+
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
 	__u64 capability;
-- 
2.43.0

