Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF213C4451C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 07:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60010EC9B;
	Wed, 22 Jul 2026 07:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NByYaHXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D33310ECA0
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784705421; x=1816241421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dK3QJmPmufj7tXOtqeGj3u/d/OwQADh+u40PyxYoZG8=;
 b=NByYaHXOgZSx4MajWSHtsp27yqhmqIVCVaFC2MRtot/pG6I0wCt40qYF
 bnWnH4PcVxTyGmPaBRtmK8TDH/GWr66JQ1K3eWIOSOGnZFV7mRCZjzHPK
 mke75s73KW6p8BQztNsPDTmU3CL/Znu2nlt4EL+hw00xeVGwspyDkDi/y
 KA8pnauKDYwVPpuKftMlCyWDLfDdhGJ+GkniA7hVfmswXmt60zViuBLcx
 iGEwti7yMVxNcn+zU9vpo8r+VvMA0GvpvabZJF43xyOyqXWdFS7uS3x2N
 9H7IG4D9gt5hFjpoHxirTNKPFf9w3rXhMkPQLerWkOTMuZ09hAv1yOd/9 w==;
X-CSE-ConnectionGUID: iKpfbMJlRli9BkayS7vUbQ==
X-CSE-MsgGUID: /oiPtqoGTLiglRtEd7CA/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110874741"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="110874741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:30:19 -0700
X-CSE-ConnectionGUID: 0LQdNAUNQDu2VoBntcB5wQ==
X-CSE-MsgGUID: wwNVgV7TSLqJ5OfhCHIhTA==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:30:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] meson: Remove Xe EUdebug
Date: Wed, 22 Jul 2026 09:29:59 +0200
Message-Id: <20260722072959.12790-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722072959.12790-1-dominik.karol.piatkowski@intel.com>
References: <20260722072959.12790-1-dominik.karol.piatkowski@intel.com>
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

Remove Xe EUdebug from meson and meson_options, as there are no EUdebug
files present.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 meson.build       | 2 --
 meson_options.txt | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/meson.build b/meson.build
index e09122a09..cb6dea30e 100644
--- a/meson.build
+++ b/meson.build
@@ -90,12 +90,10 @@ build_chamelium = get_option('chamelium')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
-build_xe_eudebug = get_option('xe_eudebug').enabled()
 build_vmtb = get_option('vmtb').enabled()
 with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
-build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
 build_info += 'Build VM Test Bench: @0@'.format(build_vmtb)
 
 inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
diff --git a/meson_options.txt b/meson_options.txt
index e23402b36..fc824dda9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,11 +42,6 @@ option('xe_driver',
        value : 'enabled',
        description : 'Build tests for Xe driver')
 
-option('xe_eudebug',
-       type : 'feature',
-       value : 'disabled',
-       description : 'Build library and tests for Xe EU debugger')
-
 option('vmtb',
        type : 'feature',
        value : 'disabled',
-- 
2.34.1

