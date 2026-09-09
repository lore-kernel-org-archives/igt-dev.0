Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF2EC79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 17:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C78310E1F9;
	Wed,  9 Sep 2026 17:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2dxcb3l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57410E1F9
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788976492; x=1820512492;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=WBQuTr8BpklpCeDI2hkRLcDs6jTpnWXM8gxiliVK10M=;
 b=S2dxcb3lNDGWkfmhS+4VMdUsUvqZwFiBGz7rm1+pmyjB27X3AsBIXPRX
 fU6sWL/KeIOHYIX6kFg9uqJVEE3RiDdPwBUlTVFL4bYnlsSRqeGg+g3CW
 GWkbftWUyCrRFVtlB1+7rbR1waxyZzos9+y56foczlNDbm0wi0nKpmLG9
 E7nIUTq/NPe7oWSlct4Ozx3aJJ4TvgFMqgNLueoZn+h0vTmgTQgNu2wcn
 jwxOHiMPVod5kJrgYoWby4fyAzoPhSzZezczsC+SYc3N/5xojZbaDwpjX
 RQEFjprHsLyubHRlp50bsMIJNtMHrToiwXDuRp3GdT7uz7By0Tgbu+DMx Q==;
X-CSE-ConnectionGUID: urN11PVtQqeE4FsRWEL+5Q==
X-CSE-MsgGUID: 2HV9nyLIThGMSG5wlruTGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112186708"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="112186708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 10:54:52 -0700
X-CSE-ConnectionGUID: IJdn4QsESwaLx8JIY/U64Q==
X-CSE-MsgGUID: YiPOOe1/QAKr9uO0tpffOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269635690"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 10:54:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 09 Sep 2026 10:54:28 -0700
Subject: [PATCH i-g-t v2] lib/xe: Use proper GT lookup in xe_gt_get_tile_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-gtlookup_noncontig-v2-1-e25a659b43a1@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NWw6CMBBFt0Lm2xpaEB9f7sMQ09YpTIQOaSvRE
 PZuZQF+npPccxeIGAgjXIoFAs4UiX0GtSvA9tp3KOiRGVSpmvJUSdGlgfn5mu6evWWfqBOyQnd
 udH0wtYM8nAI6em/RW5u5p5g4fLaPWf7s39wshRTV0SmlS2tMY67kEw57yyO067p+AdoOXeu0A
 AAA
X-Change-ID: 20260831-gtlookup_noncontig-13ef96a45b4f
To: igt-dev@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=WBQuTr8BpklpCeDI2hkRLcDs6jTpnWXM8gxiliVK10M=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqoZ1rwKv6lD8WoFdifwDy+/8qmLFT7Jpl12B28
 wVZtjerGL6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaqGdawAKCRBNeSQFyHKQ
 BPTaEACmgUXWLYk0eo8mXViRlKheziAbuiNDsEALeXuzL6vq4GHhMhQ+Buzm3qzJoi/TeGKkN/u
 ltI6g7HKWMqzsycuCe+O2ZZtH1tvExFn1iv20ZOHPZd/hvfxt1TIlZJ4/oYoh1tegn5amZ5emfn
 FtPNDneSZrMG7kYrLjINlHqavO9dWMIc3xAd/pS1GRe2Txrf7iQixocOYTmrIOp5aDcXbKSfGyw
 o7mYvY88RpWChAbUbDxLjvcypsEJK30owqVSAg2dkL4NlMN4O00Y+VCTsTBsapzw64d2Z9B7Z/3
 /CuwJHOt5ecrCChrd1psvlKWYiqefNJTjpBmziF6S+9lJx7fPRfCmoHHO3y/X48u608s8dv0zPa
 SIYxNd2WKoFo0pxrjWISeKgWIdPT7U0pnQINeHmbbnGEJ6OYFHa7DCcqB4NPAS8P3g26YktTy4W
 5ipGNNE3GpT8q5/SFucHtPsA8bH4O6fZWLulMErNmT4PwFCGI6aheHQ06itlIPB4Ckr9CDRh0eE
 064mF1LqLFXmsndQ8a59+/2XoX3UtBpzIlmk7vq/jgbIHKlQ1udvz38506MVYDF5eZIiNhDSqMw
 i0WaIqCAoFC0pq7hg9fN731INecEj2rTM+dYAHN++aKsJ0WBYEUOq0KALv7bjMuhpMMkhXaz1Ps
 nkuorpdgGWVjn8g==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

xe_gt_get_tile_id() should call xe_get_tile() to lookup the tile ID
associated with a GT ID rather than directly indexing into gt_list[].
The ID may not always match the array index on future platforms if we
ever have cases where GT IDs are non-contiguous.

v2:
 - Use xe_get_tile() to remove one extra step.  (Dnyaneshwar)

Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v2:
- Use xe_get_tile()  (Dnyaneshwar)
- Link to v1: https://lore.kernel.org/r/20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com
---
 lib/xe/xe_query.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 68e60ddc7..91ffc36e6 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1066,18 +1066,16 @@ bool xe_is_main_gt(int fd, int gt)
  * @fd: xe device fd
  * @gt: gt id
  *
- * Returns tile id for given @gt.
+ * Returns tile id for given @gt, or -ENOENT if GT ID cannot be found.
  */
 uint16_t xe_gt_get_tile_id(int fd, int gt)
 {
 	struct xe_device *xe_dev;
 
 	xe_dev = find_in_cache(fd);
-
 	igt_assert(xe_dev);
-	igt_assert(gt < xe_number_gt(fd));
 
-	return xe_dev->gt_list->gt_list[gt].tile_id;
+	return xe_get_tile(xe_dev, gt);
 }
 
 /**

---
base-commit: d822caac6e3589c05fffb63fbfc89134b0f7ccb3
change-id: 20260831-gtlookup_noncontig-13ef96a45b4f

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

