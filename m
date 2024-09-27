Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A962CDD1B3
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C46710EC53;
	Fri, 27 Sep 2024 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAtKfOaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37010EC53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727446415; x=1758982415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lHHoh526DEVWACES4dDy4S4CDqUC91ZrYvCYPZCajLM=;
 b=UAtKfOaLY5pwlc+04k4Pbanfi0+N1JHFD4LzClqDfVOF3Aef/zp+RSeC
 OFayI6LZ0OwMEynAL6UVPKrRqVP8IGqMRW2syKP0m9RIwzRq/QkaluWsm
 bEyXXPdHKcLCFi1FdG3aJgNrAL6VuETJjl2ITDYcS7rymNvCxsRbwZm3F
 2ftonfntoAeQ5hh5BgG0y58nY/WgkwwZ8TW8T97cFcVfiOwsxswWULa6A
 rSPN+/YKIenmQQeaX4QEEA+zWzhTtMSioKXe5QfBDG9Mx65ldJfA9fUlL
 KFS1mpP3Kfi8WHS6BE8Wcz31/u1EHGsPtbWrLydriC994HxOJmZc3ZMdC Q==;
X-CSE-ConnectionGUID: SnFwVW33StuL5VG2AU2L+A==
X-CSE-MsgGUID: 8rW2tEo2RFOloNcSqxSBTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26463525"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26463525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:13:34 -0700
X-CSE-ConnectionGUID: EwMxjZr7QhWC/DGNt54YIA==
X-CSE-MsgGUID: py9iR7nhR/K+NtkSijVf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="103355945"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:13:32 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t] drm-uapi/xe: Move eudebug uapi to experimental directory
Date: Fri, 27 Sep 2024 16:13:18 +0200
Message-Id: <20240927141319.52745-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently eudebug support is not available in drm-next. IGT support for
eudebug is experimental and disabled by default yet relevant uapi
was added to include/drm-uapi. This results in it getting deleted after
performing the documented uapi update procedure.

Since eudebug support is still experimental, create a separate
'drm-uapi-experimental' directory and move eudebug uapi there.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/{drm-uapi => drm-uapi-experimental}/xe_drm_eudebug.h | 0
 meson.build                                                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename include/{drm-uapi => drm-uapi-experimental}/xe_drm_eudebug.h (100%)

diff --git a/include/drm-uapi/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
similarity index 100%
rename from include/drm-uapi/xe_drm_eudebug.h
rename to include/drm-uapi-experimental/xe_drm_eudebug.h
diff --git a/meson.build b/meson.build
index 0d06721b4..64f57f232 100644
--- a/meson.build
+++ b/meson.build
@@ -96,7 +96,7 @@ with_libdrm = get_option('libdrm_drivers')
 build_info = ['Build type: ' + get_option('buildtype')]
 build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
 
-inc = include_directories('include', 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
+inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
 
 inc_for_gtkdoc = include_directories('lib')
 
-- 
2.34.1

