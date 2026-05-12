Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638DFCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813610EA7F;
	Tue, 12 May 2026 12:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqRJ9Hdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AF810E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588562; x=1810124562;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dGLZi1XptXNnx7JW4PEmNUuXrlb0YgNlN16ON58d/3M=;
 b=YqRJ9Hdp84Fv8KL52nwjQcXCqp24a5QT1lDstwRMIea5QFI3arwQRH1z
 tUIoRS+Uw7635WlMN+WOOrYjMd5AeB1fdr8CZcu/wXmMsdZxaDQWwAAQd
 gopzB/R4QWCEJWk2y0oD75dzkazT+dBxFLrQ/VBl14uPgDmyIwIuryQpe
 qudz1qCcmNjYVCNq9W502j0GY5DPMGL8MLaM2p4eHjS8KY63EtGd8aV7N
 IZ/78oXx+ReAKnrtTyGUB2+4NpzdP76Qm8GSTEbBYSSZJC9Gs2DycsPSU
 xsmyKvDT7nWkjZ+s9Hkq5/s3wRQxkHsNkqBqh/5bCX4fkvhTzwQu7tCwG A==;
X-CSE-ConnectionGUID: Q6K7Kp7wTGi04NYWn6Bf2Q==
X-CSE-MsgGUID: goWO5XtoRCSqwF53WezH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641395"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:42 -0700
X-CSE-ConnectionGUID: 21RP1/3SS8aBBIkG/BYWFw==
X-CSE-MsgGUID: Usjd/H4HTJGZzhWc6zEnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502790"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:41 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/25] lib/kms: Fill plane->format_mods_async for planes
 without IN_FORMATS
Date: Tue, 12 May 2026 15:21:32 +0300
Message-ID: <20260512122143.11013-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

Fill plane->format_mods_async for drivers that don't provide
the IN_FORMATS blob. Since we don't know any better we simply
make the assumption that all formats are async flip capable.

This should make it possible for tests to rely on
plane->format_mods_async without having to do additonal async
flip capability checks.

And if some driver can't deal with this then the proper solution
is to have it expose IN_FORMATS and IN_FORMATS_ASYNC.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ebc13063dfb0..b81be73978a1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6246,6 +6246,9 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
 		fill_plane_default_format_mods(plane, &plane->format_mods);
 
+		if (igt_has_drm_cap(display->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP))
+			fill_plane_default_format_mods(plane, &plane->format_mods_async);
+
 		return;
 	}
 
-- 
2.52.0

