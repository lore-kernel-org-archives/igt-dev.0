Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CBCFC29A
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4121610E037;
	Fri, 21 Nov 2025 19:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2JGJVTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43710E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752034; x=1795288034;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=P+/EWVNuiB8+CIou6MYOpKuoZHCJ/8Wh0Z3uJ7YpB08=;
 b=j2JGJVTt7YZi9cfJToN4eQm68G6ElPxmAoAr1akxwpecxUGINVHA8t2y
 nQX3z3z9ALHpiQ6KQmkjP++jZ3+CrhI27a5QU+OuqmIcF1HTQAC/q4GHe
 JQDIcT9/7NeF4PtfuBvBbExPQf1XWjwmJH1JAAd3N4NweXZ3gBLOkREnM
 nqwWligMFhNXj7SGS81jKI+AI/N6B0AyFO7nABSRcwCWT1jF5yJDf9LuR
 jVV2xaTZtKQYGwP9yCzW3phR10A/RMgnMSXg76OkyluNcSX2XXvx9sOt0
 V484ks98ENXLDn3wmZ/uoshiUAznMB3alLOwzwWKMBiE3iDuu04hUrvRI Q==;
X-CSE-ConnectionGUID: kp115K2DRNW4GmyFO0ZfTQ==
X-CSE-MsgGUID: ixMG942ZT7iAiJazmEFC2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454433"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:05 -0800
X-CSE-ConnectionGUID: 6dRNzrLURyiYyAK0Vmk0Nw==
X-CSE-MsgGUID: 0Fnu/pP0RLCF5WTET4UaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537653"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:04 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/8] lib/kms: Turn the igt_output*prop*() marcos into
 functions
Date: Fri, 21 Nov 2025 21:06:31 +0200
Message-ID: <20251121190633.24522-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
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

Use functions instead of macros for the output property stuff.
Macros are generally not type safe, hideous to look at, and
a pain to modify. So using macros when you don't have to
is simply a bad idea.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b2c2a7062fe..8fbc78aa5b75 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -874,8 +874,11 @@ uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_pro
  *
  * Check whether a given @prop changed for the @Output.
  */
-#define igt_output_is_prop_changed(output, prop) \
-	(!!((output)->changed & (1 << (prop))))
+static inline bool igt_output_is_prop_changed(igt_output_t *output,
+					      enum igt_atomic_connector_properties prop)
+{
+	return output->changed & (1 << prop);
+}
 
 /**
  * igt_output_set_prop_changed:
@@ -884,8 +887,11 @@ uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_pro
  *
  * Sets the given @prop for the @output.
  */
-#define igt_output_set_prop_changed(output, prop) \
-	(output)->changed |= 1 << (prop)
+static inline void igt_output_set_prop_changed(igt_output_t *output,
+					       enum igt_atomic_connector_properties prop)
+{
+	output->changed |= 1 << prop;
+}
 
 /**
  * igt_output_clear_prop_changed:
@@ -894,8 +900,11 @@ uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_pro
  *
  * Clears the given @prop for the @output.
  */
-#define igt_output_clear_prop_changed(output, prop) \
-	(output)->changed &= ~(1 << (prop))
+static inline void igt_output_clear_prop_changed(igt_output_t *output,
+						 enum igt_atomic_connector_properties prop)
+{
+	output->changed &= ~(1 << prop);
+}
 
 /**
  * igt_output_set_prop_value:
@@ -905,11 +914,13 @@ uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_pro
  *
  * Sets the given @prop with the @value for the @output.
  */
-#define igt_output_set_prop_value(output, prop, value) \
-	do { \
-		(output)->values[prop] = (value); \
-		igt_output_set_prop_changed(output, prop); \
-	} while (0)
+static inline void igt_output_set_prop_value(igt_output_t *output,
+					     enum igt_atomic_connector_properties prop,
+					     uint64_t value)
+{
+	output->values[prop] = value;
+	igt_output_set_prop_changed(output, prop);
+}
 
 extern bool igt_output_try_prop_enum(igt_output_t *output,
 				     enum igt_atomic_connector_properties prop,
-- 
2.49.1

