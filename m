Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946FED65C72
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAF210ED01;
	Wed, 17 Dec 2025 15:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMqCMAsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90C10ED01
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985910; x=1797521910;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KWwxMBEKTyabuOLKiC1poMUJ4iF5Pf4A+v8zn2k4utE=;
 b=NMqCMAsUOheNHEjCPiVJ1GfIttkPjYMZ69X0LajopdQf0eEeXizeUyEh
 xdNVhQ3FLYCWLYvB9jKVXa5JxPiQ41jFSprd7kUXJiHEfIESOwVv7IEig
 2BKO957SvsL7DPRReBDFej1w8WpS6dF/72daCuoaqMX0FtpTydRuXXg18
 1u3qN1NOIhwaLzyA2ECAwy/OQNhzkzsH0meF6IYy2oxjUS8GPreJlwcTz
 64lmxwseYEGzazo/hx3heJLMzfHb/CeeK4AnxDQh8XJXu9ugIijcYDS8t
 l3DEbufdOQW/Jq2avHohpn6hm0GT5VqoSX917x0J6usQ1mZknJeXAINNh g==;
X-CSE-ConnectionGUID: CvkMWnOcS520NTtlybXdoA==
X-CSE-MsgGUID: QCY7Fx1OQlW8SbB1Q8Wc/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71557020"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71557020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:30 -0800
X-CSE-ConnectionGUID: 1Lo5yxclSzGLfv+ePaVqcQ==
X-CSE-MsgGUID: Ca6c9d4vRQaMq9hhOYDuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718739"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/11] lib/kms: Use '{old,
 new}_primary' variable names in plane swapping
Date: Wed, 17 Dec 2025 17:37:54 +0200
Message-ID: <20251217153758.9369-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Make the primary plane swapping a bit less confusing by
renaming the variables to '{old,new}_primary'

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7ae166253a3f..ef3215332e29 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3022,10 +3022,10 @@ void igt_display_reset_outputs(igt_display_t *display)
 		output = igt_get_single_output_for_pipe(display, i);
 
 		if (pipe->num_primary_planes > 1) {
-			igt_plane_t *primary = &pipe->planes[0];
-			igt_plane_t *assigned_primary =
+			igt_plane_t *old_primary = &pipe->planes[0];
+			igt_plane_t *new_primary =
 				igt_get_assigned_primary(output, pipe);
-			int assigned_primary_index = assigned_primary->index;
+			int new_primary_index = new_primary->index;
 
 			/*
 			 * If the driver-assigned primary plane isn't at
@@ -3034,11 +3034,11 @@ void igt_display_reset_outputs(igt_display_t *display)
 			 *
 			 * This way, the primary plane is always at index 0.
 			 */
-			if (assigned_primary_index != 0) {
-				assigned_primary->index = 0;
-				primary->index = assigned_primary_index;
+			if (new_primary_index != 0) {
+				new_primary->index = 0;
+				old_primary->index = new_primary_index;
 
-				igt_swap(pipe->planes[assigned_primary_index],
+				igt_swap(pipe->planes[new_primary_index],
 					 pipe->planes[0]);
 			}
 		}
-- 
2.51.2

