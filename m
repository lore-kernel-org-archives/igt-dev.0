Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3FBCD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68D210F439;
	Fri, 12 Jun 2026 11:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYG9oTH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA610E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262064; x=1812798064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KLX1MripfqtdHpoUQmQceFKC022IpCLzaGbbdn+qhi8=;
 b=HYG9oTH922TXeV0uNef4FLCdOz1kC/cBM+IaTvM75dRS+nJlwgXBnlLP
 MRW+2vJt0sgPAGUqdgK0weUr3EBY6iYPbd7Vz8TnccgGSvp92oEFgzU9w
 L//w1cHSEAz4DXqAujDOh703EYrw+FR3iCcr1eSWmjm74XQ4V3Q7LMTrj
 pdccF2OmziHxEg0g0vvLqfn+Zh7g67so3wGI57K287DAoaEPozRx0odvY
 s5wPlwe781qu1aEZnDP3C528JkmwpOpqvOKY18uiYoRd/dcT9snBSUImc
 PKvoLS6tnuI0aj/WWd/ITLQmRo+EsLqOypNb2lIzEFKsn1oDsTlafCGMZ w==;
X-CSE-ConnectionGUID: I2sGG/BURrqiyxnmnRBeNg==
X-CSE-MsgGUID: OF5nJoLYQySpr6NHem0w7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85932748"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85932748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:03 -0700
X-CSE-ConnectionGUID: bH8iMma5SGuA8B+rtzHN5A==
X-CSE-MsgGUID: NTH1smU9QA2zW+GhtS+WMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251873514"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:01:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 2/4] lib/intel_device_info: add a helper to guess the
 PCI ID for a codename
Date: Fri, 12 Jun 2026 14:00:42 +0300
Message-ID: <b02ca4e981b402b630810c017ce144f14d7626a8.1781261899.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781261899.git.jani.nikula@intel.com>
References: <cover.1781261899.git.jani.nikula@intel.com>
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

The struct intel_device_info contains the codenames for the
corresponding PCI device IDs. Add a reverse lookup to get a PCI ID for a
codename.

It's a bit fuzzy, though. The codenames aren't always spelled the same,
there are suffixes sometimes omitted, and you can only pick one of the
matching PCI IDs. Name the helper intel_guess_device_id() to emphasize
the point, and try increasing fuzziness in the matching to find an
appropriate struct intel_device_info.

There's nothing exact about this, and it should not be considered as
such. But it will be useful in VBT parsing.

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/intel_chipset.h     |  1 +
 lib/intel_device_info.c | 75 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3fcc5b18d648..98a2a81fcffd 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -103,6 +103,7 @@ struct intel_device_info {
 };
 
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
+uint16_t intel_guess_device_id(const char *codenameish) __attribute__((pure));
 
 const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index da0b9f398885..3b5373265000 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -3,6 +3,7 @@
 #include "i915_pciids_local.h"
 
 #include <strings.h> /* ffs() */
+#include <ctype.h>
 
 static const struct intel_device_info intel_generic_info = {
 	.graphics_ver = 0,
@@ -746,6 +747,80 @@ out:
 	return cache;
 }
 
+static bool char_eq(char c1, char c2)
+{
+	c1 = isalnum(c1) ? tolower(c1) : '-';
+	c2 = isalnum(c2) ? tolower(c2) : '-';
+
+	return c1 == c2;
+}
+
+/*
+ * Return true if the codenames s1 and s2 match, with fuzziness.
+ *
+ * Case insensitive matching, ignoring differences in non-alnum characters. With
+ * non-zero fuzziness, accept matches up to the first non-alnum character.
+ */
+static bool codename_match(const char *s1, const char *s2, int fuzziness)
+{
+	while (*s1 && *s2 && char_eq(*s1, *s2)) {
+		s1++;
+		s2++;
+	}
+
+	/* full match */
+	if (!*s1 && !*s2)
+		return true;
+
+	/* sub-string match up to a non-alnum char */
+	if (fuzziness >=1) {
+		if (!*s1 && !isalnum(*s2))
+			return true;
+		if (!*s2 && !isalnum(*s1))
+			return true;
+	}
+
+	return false;
+}
+
+static uint16_t lookup_device_id(const char *codename, int fuzziness)
+{
+	int i;
+
+	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
+		const struct intel_device_info *info = (void *)intel_device_match[i].match_data;
+
+		if (codename_match(info->codename, codename, fuzziness))
+			return intel_device_match[i].device_id;
+	}
+
+	return 0;
+}
+
+/**
+ * intel_guess_device_id:
+ * @codenameish: something resembling a codename
+ *
+ * Based on something resembling a codename, try to fuzzy find the first PCI
+ * device ID matching the codename.
+ *
+ * Returns:
+ * PCI device ID fuzzy matching the @codenameish, or 0 if no match was found.
+ */
+uint16_t intel_guess_device_id(const char *codenameish)
+{
+	uint16_t devid;
+	int fuzziness;
+
+	for (fuzziness = 0; fuzziness < 2; fuzziness++) {
+		devid = lookup_device_id(codenameish, fuzziness);
+		if (devid)
+			return devid;
+	}
+
+	return 0;
+}
+
 /**
  * intel_get_cmds_info:
  * @devid: pci device id
-- 
2.47.3

