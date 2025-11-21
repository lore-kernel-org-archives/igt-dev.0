Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA3CFC501
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985010E8F4;
	Fri, 21 Nov 2025 19:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAw9sokv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13410E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752034; x=1795288034;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KXZ8d1QjAFtZNcwrDiESflvd69bHdWC0mDESA0YI6Xk=;
 b=aAw9sokv0dyFZlyK2bnWM8hxNJvqv9uBar2oBi7fGyyBg8U/5cCfwaiy
 0q7R5la1xoWmnKSmY9e0s0Vk0HDqfaOACiYQPTIgLqYWudVqc4NsZ3bgW
 eE/xit7VQhTiW0QQRF29q0gSW1AM4E8/WAyrW3wx0DL3ccP3nQuaBdhRa
 QJQRBVwFv63TNbkXsNO3gkkiTZUszwj21G+RoTX8vzdTFASYC69d1KEsa
 jryUSpefr4XptpjS6xKeo9ySiGA1cV/EWgqsGA5PsXs5Aay0rqjTaE4wS
 8tLi49oqlDTnKFcFYjwq/d506rGDlT5YGqGcE7igCOg4s9s5LhXbNBSVn g==;
X-CSE-ConnectionGUID: ZDocF0jkQFOuZDrj/nKsyg==
X-CSE-MsgGUID: aFAMnlJOT9i/mqk/3vPTGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454444"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454444"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:10 -0800
X-CSE-ConnectionGUID: UYKfFZWhRUedhVQ/kiHvEw==
X-CSE-MsgGUID: zFJF2CK1RWeSrRaYoKEY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537668"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:07:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/8] lib/kms: Turn the igt_pipe_obj*prop*() marcos into
 functions
Date: Fri, 21 Nov 2025 21:06:32 +0200
Message-ID: <20251121190633.24522-8-ville.syrjala@linux.intel.com>
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

Use functions instead of macros for the crtc property stuff.
Macros are generally not type safe, hideous to look at, and
a pain to modify. So using macros when you don't have to
is simply a bad idea.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 50 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8fbc78aa5b75..66168e7b732c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -957,8 +957,11 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Check whether a given @prop changed for the @pipe_obj.
  */
-#define igt_pipe_obj_is_prop_changed(pipe_obj, prop) \
-	(!!((pipe_obj)->changed & (1 << (prop))))
+static inline bool igt_pipe_obj_is_prop_changed(igt_pipe_t *pipe_obj,
+						enum igt_atomic_crtc_properties prop)
+{
+	return pipe_obj->changed & (1 << prop);
+}
 
 /**
  * igt_pipe_is_prop_changed:
@@ -967,8 +970,12 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Check whether a given @prop changed for the @pipe.
  */
-#define igt_pipe_is_prop_changed(display, pipe, prop) \
-	igt_pipe_obj_is_prop_changed(&(display)->pipes[(pipe)], prop)
+static inline bool igt_pipe_is_prop_changed(igt_display_t *display,
+					    enum pipe pipe,
+					    enum igt_atomic_crtc_properties prop)
+{
+	return igt_pipe_obj_is_prop_changed(&display->pipes[pipe], prop);
+}
 
 /**
  * igt_pipe_obj_set_prop_changed:
@@ -977,8 +984,11 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Sets the given @prop for the @pipe_obj.
  */
-#define igt_pipe_obj_set_prop_changed(pipe_obj, prop) \
-	(pipe_obj)->changed |= 1 << (prop)
+static inline void igt_pipe_obj_set_prop_changed(igt_pipe_t *pipe_obj,
+						 enum igt_atomic_crtc_properties prop)
+{
+	pipe_obj->changed |= 1 << prop;
+}
 
 /**
  * igt_pipe_obj_clear_prop_changed:
@@ -987,8 +997,11 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Clears the given @prop for the @pipe_obj.
  */
-#define igt_pipe_obj_clear_prop_changed(pipe_obj, prop) \
-	(pipe_obj)->changed &= ~(1 << (prop))
+static inline void igt_pipe_obj_clear_prop_changed(igt_pipe_t *pipe_obj,
+						   enum igt_atomic_crtc_properties prop)
+{
+	pipe_obj->changed &= ~(1 << prop);
+}
 
 /**
  * igt_pipe_obj_set_prop_value:
@@ -998,11 +1011,13 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Sets the given @prop with the @value for the @pipe_obj.
  */
-#define igt_pipe_obj_set_prop_value(pipe_obj, prop, value) \
-	do { \
-		(pipe_obj)->values[prop] = (value); \
-		igt_pipe_obj_set_prop_changed(pipe_obj, prop); \
-	} while (0)
+static inline void igt_pipe_obj_set_prop_value(igt_pipe_t *pipe_obj,
+					       enum igt_atomic_crtc_properties prop,
+					       uint64_t value)
+{
+	pipe_obj->values[prop] = value;
+	igt_pipe_obj_set_prop_changed(pipe_obj, prop);
+}
 
 /**
  * igt_pipe_set_prop_value:
@@ -1012,8 +1027,13 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Sets the given @prop with the @value for the @pipe.
  */
-#define igt_pipe_set_prop_value(display, pipe, prop, value) \
-	igt_pipe_obj_set_prop_value(&(display)->pipes[(pipe)], prop, value)
+static inline void igt_pipe_set_prop_value(igt_display_t *display,
+					   enum pipe pipe,
+					   enum igt_atomic_crtc_properties prop,
+					   uint64_t value)
+{
+	igt_pipe_obj_set_prop_value(&display->pipes[pipe], prop, value);
+}
 
 extern bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe,
 				       enum igt_atomic_crtc_properties prop,
-- 
2.49.1

