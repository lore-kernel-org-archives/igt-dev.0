Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C871AC3ABCB
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 20:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887BA10E3DE;
	Mon, 16 Sep 2024 20:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+PjSyB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51B210E3DE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Sep 2024 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726517927; x=1758053927;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=62VPdtBSIYg53cT6P7J34d9TNOsENWLcIbILsv0zkoo=;
 b=a+PjSyB+11n7wGWbBN2axIe7S+pl8oa97f6+GalhD7MnT50AQnNdhpO4
 MfGAVIIg0i61yQpX8qN8HCey68P5y93wb3GnNJh7aFUYv21Ul6sOb5PLj
 mPxNrZ9gV87X2lXJh+BOhvpSMBZBwyUgZfXiNytyzPY0Ov3RNhZ4i3n5L
 Yj/fqGzr4uRytf/Ks4OEt/+7auUtXzin1XaTgtOIe67I+q0mcuZXL7ylO
 7S4KC+QuUBUmGT9g3NmSu8rTy3PON+u9wnhTMeaBSOBVn4S+79qE8G6R/
 GBw4mWg0geb2lFEmRkPAxrWBIbnT9vBm3XrJEGAPxb2VCxTmHWcIvWdU7 w==;
X-CSE-ConnectionGUID: rpFS5RZ8TjatpwUn7lC+5w==
X-CSE-MsgGUID: kRi7SA8nSe2F1x44d7tdFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36499475"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36499475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 13:18:46 -0700
X-CSE-ConnectionGUID: ecwkPmvgTA2jU/Sr0p6xZg==
X-CSE-MsgGUID: SfD+GN7dRkGrlVA8trFDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69070728"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Sep 2024 13:18:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 23:18:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/5] lib/power: Allow use of rapl by specifying fd=-1
Date: Mon, 16 Sep 2024 23:18:37 +0300
Message-ID: <20240916201841.29592-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

igt_power_open() is currently defunct when you don't have
the GPU driver loaded, or when you explicitly want to measure
via rapl even when using a DGPU. Allow those use cases by
accepting fd<0 to indicate that we explicitly want to use rapl.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 810859b134dc..f4d3efcf0cec 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -106,7 +106,7 @@ int igt_power_open(int fd, struct igt_power *p, const char *domain)
 	p->hwmon_fd = -1;
 	p->rapl.fd = -1;
 
-	is_dgfx = is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd);
+	is_dgfx = fd >= 0 && (is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd));
 	if (is_dgfx) {
 		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
 			p->hwmon_fd = igt_hwmon_open(fd);
-- 
2.44.2

