Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA1C5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FE310E865;
	Sat, 21 Feb 2026 03:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhW0Stvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A2210E865
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644018; x=1803180018;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+HfWPxkEG7YzUnyGD6u3m4BdAhhbkjgds7FpWuSgdm4=;
 b=VhW0StvwgMmswEmicXaBP+kXMRbshPsKzTGRbf6FnuD81MqyDhbOHAfa
 OFPhHZHtarmA8cKx16jdtOmPq6jjUifE7lhJX7vwAt9XHQ9C9i8lbs25Z
 GEkcqrM+OmXI6tP7rUlmQFITdRV6w4p3KLcgSNTUz73btH6P+yIzPK2G9
 ArwOU++H4iZsz6n4fJMHBgL6j/Sx+5Uu+x4oL0kQmP5NQ7qTk20N43Kel
 evTy+Z7e6t4Zxtf3eKPWCt6/ZPW1ENgGlKk1TzFAZWTNSgzmRcOgdSuym
 XYUNzV+fV8/bLlJ3VYQKfyadLNItNIAeH1Hg0kYfWTpUb8MPZU/28MxqQ w==;
X-CSE-ConnectionGUID: fdK4XKhhSuiHP9JH0Ruoug==
X-CSE-MsgGUID: StI179QHSXSdnR9D6CBHvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75345748"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75345748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:18 -0800
X-CSE-ConnectionGUID: xFeP8H3SReWkkz2wjQwbVg==
X-CSE-MsgGUID: lpjtg71fS4qmlI2EEcW65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252720227"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:17 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 03/23] tests/intel/kms_flip_scaled_crc: Remove unused
 'enum pipe pipe'
Date: Sat, 21 Feb 2026 05:19:42 +0200
Message-ID: <20260221032003.30936-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

kms_flip_scaled_crc has a data.pipe member that it never uses
for anythinh. Nuke it.

 #include "scripts/iterators.cocci"

@find_pipe@
typedef igt_crtc_t;
typedef igt_display_t;
identifier PIPE;
type T;
@@
T {
  ...
  enum pipe PIPE;
  ...
};

@use_pipe depends on find_pipe@
identifier find_pipe.PIPE;
find_pipe.T S;
find_pipe.T *P;
@@
(
S.PIPE
|
P->PIPE
)

@remove_pipe depends on find_pipe && !use_pipe@
identifier find_pipe.PIPE;
type find_pipe.T;
@@
T {
  ...
-  enum pipe PIPE;
  ...
};

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 9a0b99e46ddd..83674d5c267f 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -143,7 +143,6 @@ typedef struct {
 	int drm_fd;
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
 	uint32_t gen;
 	struct igt_fb small_fb;
 	struct igt_fb big_fb;
-- 
2.52.0

