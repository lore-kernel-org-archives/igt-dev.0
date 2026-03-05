Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34E0EF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD87A10E1D6;
	Thu,  5 Mar 2026 13:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TH9Ze/OA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE0010E1D6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718066; x=1804254066;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z6M1gszQ8bl3L5ne8nmosbnvmr+6hkjEixVwKoKVYE0=;
 b=TH9Ze/OAT9Q3a+o6cUFJPqc17UZeFETYV0lvktkh4FO3EUAmlKSsaaZG
 EthRriQZg3vAUElMHPs1zpkppYPH6gUuLV7SWHd25imTvOK7gPMhyOMNY
 32/9jOP+4DWPY0LmkzIade/iNR7l6qAA40dRy/GGDqG6JxpjTlLWNdD5L
 63SA6mzA2Ti4fzczW/ogM1gdqEBSDdKpLQYbNljNV7B1r4Iw/sFBi+ZXA
 vMY5oiS4bBTaXscViRnPXKqU/jysnKXTTs0PLXaljvdoNQ2p4tOTCBalI
 QSvu9o+i9bWnMPrhQld23wfjt7Gu7jqipRzgEI4as/MTrK10ca6dX9J7x g==;
X-CSE-ConnectionGUID: Zlf/fcUQQCqKCacHMqGQjA==
X-CSE-MsgGUID: kTl01nsJQPOUdlkzMUfrqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76405006"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76405006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:41:04 -0800
X-CSE-ConnectionGUID: LNSs6j2QRRm51sdi7+WyNQ==
X-CSE-MsgGUID: 0nJQdDViQHSfJGu0n/uWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218641274"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:41:03 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/5] lib/kms: Make igt_first_crtc_with_single_output()
 skip if no CRTC/output can be found
Date: Thu,  5 Mar 2026 15:40:38 +0200
Message-ID: <20260305134038.6995-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Have igt_first_crtc_with_single_output() skip if a suitable CRTC/output
combination can't be found. All callers currently skip based on the
return value.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                | 2 ++
 tests/intel/gem_exec_reloc.c | 1 -
 tests/kms_plane.c            | 1 -
 tests/kms_plane_scaling.c    | 1 -
 4 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a9673a9a6565..c302021be9b1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8019,6 +8019,8 @@ igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output
 		return crtc;
 	}
 
+	igt_skip("No valid CRTC/output combinations\n");
+
 	*ret_output = NULL;
 
 	return NULL;
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index ed4e77ec93d3..e480337a0bd8 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1517,7 +1517,6 @@ static void scanout(int i915,
 	igt_display_reset(dpy);
 
 	crtc = igt_first_crtc_with_single_output(dpy, &output);
-	igt_require(crtc);
 
 	igt_output_set_crtc(output, crtc);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 6a78c9ff0941..98705a897205 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1364,7 +1364,6 @@ static void test_planar_settings(data_t *data)
 	}
 
 	crtc = igt_first_crtc_with_single_output(display, &output);
-	igt_require(crtc);
 
 	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab619fb2b532..8d34619b328f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1181,7 +1181,6 @@ static void invalid_parameter_tests(data_t *d)
 
 	igt_fixture() {
 		crtc = igt_first_crtc_with_single_output(display, &output);
-		igt_require(crtc);
 
 		igt_output_set_crtc(output, crtc);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-- 
2.52.0

