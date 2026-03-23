Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F0AEC01D4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FFE10E23D;
	Mon, 23 Mar 2026 12:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dtvo1ARh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C71E10E23D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774267599; x=1805803599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xLR8cpihOdjwGyHqZw+ICEnnrMlaQnV4g3WRzW7R2w=;
 b=Dtvo1ARhPBgV1B2KKyS6HRO2oVvDUOf5Ur5OVtaAiy6hQH31DLzZ8Hwf
 w/b04oQ0VHOxLqxAM22IV4clGILlvMQsLLwPniNaLo2NXaSCBaxFdVIar
 HoV49nVfjpWogzGFI/TkUjXn6cXu6O2OhA/Ov2f0q9ei6gg8BG1jmrArp
 GFmQmPCI2WFK+bHFWEWeTZiN4dkK7BBfjfdrk2VonZ1kR/m6N4XMChOcv
 8gyYybQrul66NKdVNlbHfMIuOTzHzChMzg2x2i815u6sT11NiyJ1BK8aO
 Zis0Q0tk+8gojfH7FeSFVr1KT7Ag2YmNE/g4XZ+7IcxUEcnWzp9LRhxjB Q==;
X-CSE-ConnectionGUID: Wsv9XDdfTvyvDYw7wpF5ZA==
X-CSE-MsgGUID: ykclerWJTKGaNc0SzXBtgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86333317"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86333317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:39 -0700
X-CSE-ConnectionGUID: JfJ441h5SJSpzUMBCqzj+w==
X-CSE-MsgGUID: kt1Bg9McRwCRoIXSYnxmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219646389"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 1/3] lib/kms: don't special case
 igt_get_single_output_for_crtc() implementation
Date: Mon, 23 Mar 2026 14:06:24 +0200
Message-ID: <3e7dac9015f75c2fd295e2b7226c4f23708e8e36.1774267502.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774267502.git.jani.nikula@intel.com>
References: <cover.1774267502.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

igt_get_single_output_for_crtc() can be trivially implemented in a more
generic way using for_each_crtc_with_single_output() instead of using
__igt_pipe_populate_outputs() and its implementation details directly.

Do so to make it all easier to understand, and to make refactoring
for_each_crtc_with_single_output() and __igt_pipe_populate_outputs()
easier.

Arguably the iteration is slower, but the bulk of the work is done in
__igt_pipe_populate_outputs() anyway, and we're talking about O(n)
search where n is 16.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 481b893fc025..b835584bef1e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3665,12 +3665,15 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
  */
 igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc)
 {
-	igt_display_t *display = crtc->display;
-	igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
+	igt_output_t *output;
+	igt_crtc_t *iter;
 
-	__igt_pipe_populate_outputs(display, chosen_outputs);
+	for_each_crtc_with_single_output(crtc->display, iter, output) {
+		if (iter == crtc)
+			return output;
+	}
 
-	return chosen_outputs[crtc->pipe];
+	return NULL;
 }
 
 static igt_output_t *igt_crtc_get_output(igt_crtc_t *crtc)
-- 
2.47.3

