Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92939606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ByuDVfEg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB98810E091;
	Mon, 26 Oct 2026 08:18:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B24C10EC20
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793002662; x=1824538662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=33JxBP17J9ezlxEBz2YwnzbG9XJCCwxGrXa6XWyDHfM=;
 b=ByuDVfEgh0ofBKpxSmoWcp/ZFw1nh+q+YijGaAOQWcKwfiYC/K4P8Xui
 P9jzbVBBvue2AtUVHiy7jAzResxs+8Z9PF5+vf0jMkQ8k00KrzPRH+Lk/
 1vtq1y3W6dm5zaJUbGjcw0CDueZMILqDdxGvHMwdcDFUt0/FDSWdfaL4R
 R8LAHZVbzgEmq6bTCIdDZPJJ82xgwmg/6EZQuE9iapRvo+N9k4RzRsJlp
 2oq0gYOa0kGA5aS6/yTYlNxbDrfyCxtD02rMHdCFLqAiOEH8becyl37aV
 q2goCQZOx30O2+0iyOLrIc/JFjvWzuw9eyZQZx0NtC/1S7eY2fdfL1rzp g==;
X-CSE-ConnectionGUID: tycn1DvVRaSG8hcVgjCE2g==
X-CSE-MsgGUID: 2rjZAbrJTAe9qEbVPlYX4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1563552"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1563552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 01:17:42 -0700
X-CSE-ConnectionGUID: 3dBmW1FJS6iCxyWwk6wcug==
X-CSE-MsgGUID: lp9lCgwTRPmVFeaPuhH/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4587216"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 01:17:40 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH i-g-t v2] lib/igt_eld: Avoid asserting on malformed SAD fields
Date: Mon, 26 Oct 2026 13:24:29 +0530
Message-ID: <20261026075429.2796932-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

eld_get_igt() parses every /proc/asound/card*/eld#* node before
filtering by monitor name, so a malformed ELD on an unrelated, non-IGT
device can abort a test that only cares about its own injected "IGT"
EDID.

parse_sad_field() strips the "[0x..]" prefix from sad%d_rates/bits via
strchr(value, ' ') + 1 and asserts that a space exists after the prefix.
But the kernel may not always print one if the ELD of a monitor is
malformed, which aborts unrelated audio subtests.

Skip the malformed SAD entry instead of asserting, propagating the
failure up through eld_parse_entry() so eld_get_igt()'s existing
continue logic moves on to the next ELD node.

While at it, fix a pre-existing fd leak on the ferror(f) path in
eld_parse_entry().

v2:
- Fix "before"/"after" wording describing the space check (Pranay)
- Unify freeing of sad_key (Pranay)

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 lib/igt_eld.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 896ab0e6b..0d3c6689b 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -103,14 +103,21 @@ static enum cea_sad_pcm_sample_size parse_sad_bit(const char *value)
 	}
 }
 
-static void parse_sad_field(struct eld_sad *sad, const char *key, char *value)
+static bool parse_sad_field(struct eld_sad *sad, const char *key, char *value)
 {
 	char *tok;
 
-	/* Some fields are prefixed with the raw hex value, strip it */
+	/*
+	 * Some fields are prefixed with the raw hex value, strip it. The
+	 * kernel doesn't always emit a space after the bracketed value
+	 * (e.g. a SAD on a real, unrelated monitor's ELD). Treat that as
+	 * "nothing to parse" instead of asserting, since we have no
+	 * control over third-party EDID content.
+	 */
 	if (value[0] == '[') {
 		value = strchr(value, ' ');
-		igt_assert(value != NULL);
+		if (!value)
+			return false;
 		value++; /* skip the space */
 	}
 
@@ -130,6 +137,8 @@ static void parse_sad_field(struct eld_sad *sad, const char *key, char *value)
 
 		tok = strtok(NULL, " ");
 	}
+
+	return true;
 }
 
 /** eld_parse_entry: parse an ELD entry
@@ -166,6 +175,7 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 	char *key, *value, *sad_key;
 	size_t len;
 	bool monitor_present = false;
+	bool sad_ok;
 	int sad_index;
 
 	memset(eld, 0, sizeof(*eld));
@@ -198,13 +208,20 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 		else if (sscanf(key, "sad%d_%ms", &sad_index, &sad_key) == 2) {
 			igt_assert(sad_index < ELD_SADS_CAP);
 			igt_assert(sad_index < eld->sads_len);
-			parse_sad_field(&eld->sads[sad_index], sad_key, value);
+			sad_ok = parse_sad_field(&eld->sads[sad_index], sad_key, value);
 			free(sad_key);
+			if (!sad_ok) {
+				igt_debug("Failed to parse ELD field %s in %s: %s\n",
+					  key, path, value);
+				fclose(f);
+				return false;
+			}
 		}
 	}
 
 	if (ferror(f) != 0) {
 		igt_debug("Failed to read ELD file %s: %d\n", path, ferror(f));
+		fclose(f);
 		return false;
 	}
 
-- 
2.50.1

