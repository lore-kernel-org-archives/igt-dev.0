Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD8DE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 04:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694610E4D7;
	Fri, 10 Jan 2025 04:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqxnNzeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59B10EF93
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 04:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736483321; x=1768019321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCIg54BX8GXp4/9oGXIENzqMQz1jjt1sp3t1RbvY/do=;
 b=jqxnNzeQ1ZS1m/WUHOibiJuJni23FsjJJU2rYaQ8SS2YU06FM+zsows9
 jNYr5JM+SLPlmg3dXAiJbnp2Tkxur6TXbaUvVLYvVZXIY3qv+/hu+L7Fe
 FMbx2XBOE5gjXizHm/ronmLzw+i0cUH0CJb2jy2l1PFo6v0GmuF+pgWQo
 5MffhHDYia8E+0hEKycnME9DB0JLYC8cM8FH50Ox32WMbQYOic9Jyms2n
 sMtY3E7fLSAv3iS3qxfYbDefM4v8HWMS4fSHzW6hNhKYBh50HzELhFgRH
 Y7JwV2JKD6nPP8tK9NesqTKyG2j2I7FWWLBp1dME3TqHmk6CraURUMogh Q==;
X-CSE-ConnectionGUID: lnBx1+pVSKmV/jcDKkNTzQ==
X-CSE-MsgGUID: yoADE1AxQXq6K8ZiOS6I7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36655321"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36655321"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:28:39 -0800
X-CSE-ConnectionGUID: DzOT6STMS3CwZXhcKcahAw==
X-CSE-MsgGUID: CkJWmnCuRxOgqM8ruF2Ppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103504527"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:28:37 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 2/2] lib/igt_kms.c: Enforce strict check for
 bigjoiner_possible
Date: Fri, 10 Jan 2025 09:57:52 +0530
Message-Id: <20250110042752.32846-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
References: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
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

update bigjoiner_mode_found to check for ultrajoiner possibility.
This ensures that the mode is only set to bigjoiner if ultrajoiner
is not possible.

v8: rebase and check fot ultra joiner possibility.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 95e3059f7..1a0819ce2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6419,7 +6419,8 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	bool found = false;
 
 	for (int i=0; i< connector->count_modes; i++) {
-		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
+		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock) &&
+		    !igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
 			*mode = connector->modes[i];
 			found = true;
 			break;
-- 
2.34.1

