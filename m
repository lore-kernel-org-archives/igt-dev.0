Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A1CFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD2110E2C2;
	Fri, 21 Nov 2025 19:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbrJC7wB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB810E2C2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752016; x=1795288016;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Hpk5GCPjx7VfACWBoiryLHfHemfpNvq340D4dCQP0KY=;
 b=cbrJC7wB0Se7JeJxJqGLTwbBSGotcztUGytUDIjlZPMd+hQeyn1Bvrva
 HNiG7mtf2eafXDyaNBTgdS5FCdMPupE9tiWwrDNaDnbzcDnufeIYc8CzR
 sJQsH0mkiAy1VL1czBUrHa5hnxACxc05r9arnDZlxbe6GXAYj512rkDiY
 Ozfd/AYzA8Q1hUW0EUVXakbyqk4dQNrPzfpuZGGvD197LHLhPC9fQExA8
 l1GuH9ZA5WVkIGyk5xY8nC/uxd48MhzFpZ9L4l3NUVq7lxquHQExqFgxr
 CJHKTKJ7ARQwvOuqQSMiyjEuut5Eer2i/OmAxqa40d8cMHKeQQ4jW/Fwp A==;
X-CSE-ConnectionGUID: iYvkHQvWS06M8lyXJyP1Jg==
X-CSE-MsgGUID: ZajxRH5HQeK24ainsfDHLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454405"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:56 -0800
X-CSE-ConnectionGUID: 7LZEKc/xRoW3uViTmMavUw==
X-CSE-MsgGUID: Jk9MMAZISs2uu0+SpA1VDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537613"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:55 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/8] igt/kms: Nuke unused igt_pipe_*prop*() marcos and
 functions
Date: Fri, 21 Nov 2025 21:06:29 +0200
Message-ID: <20251121190633.24522-5-ville.syrjala@linux.intel.com>
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

We have a bunch of unused macros and functions related to
crtc property handling. Nuke them all.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 101 --------------------------------------------------
 1 file changed, 101 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c9216dd5bdbe..91776e73e309 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -928,42 +928,6 @@ igt_pipe_obj_has_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 
 uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
-/**
- * igt_pipe_get_prop:
- * @display: Pointer to display.
- * @pipe: Target pipe.
- * @prop: Property to return.
- *
- * Return current value on a pipe for a given property.
- *
- * Returns: The value the property is set to, if this
- * is a blob, the blob id is returned. This can be passed
- * to drmModeGetPropertyBlob() to get the contents of the blob.
- */
-static inline uint64_t
-igt_pipe_get_prop(igt_display_t *display, enum pipe pipe,
-		  enum igt_atomic_crtc_properties prop)
-{
-	return igt_pipe_obj_get_prop(&display->pipes[pipe], prop);
-}
-
-/**
- * igt_pipe_has_prop:
- * @display: Pointer to display.
- * @pipe: Pipe to check.
- * @prop: Property to check.
- *
- * Check whether pipe supports a given property.
- *
- * Returns: True if the property is supported, otherwise false.
- */
-static inline bool
-igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
-		  enum igt_atomic_crtc_properties prop)
-{
-	return display->pipes[pipe].props[prop];
-}
-
 /**
  * igt_pipe_obj_is_prop_changed:
  * @pipe_obj: Pipe object to check.
@@ -994,16 +958,6 @@ igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
 #define igt_pipe_obj_set_prop_changed(pipe_obj, prop) \
 	(pipe_obj)->changed |= 1 << (prop)
 
-/**
- * igt_pipe_set_prop_changed:
- * @pipe: Pipe object to check.
- * @prop: Property to check.
- *
- * Sets the given @prop for the @pipe.
- */
-#define igt_pipe_set_prop_changed(display, pipe, prop) \
-	igt_pipe_obj_set_prop_changed(&(display)->pipes[(pipe)], prop)
-
 /**
  * igt_pipe_obj_clear_prop_changed:
  * @pipe_obj: Pipe object to check.
@@ -1014,16 +968,6 @@ igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
 #define igt_pipe_obj_clear_prop_changed(pipe_obj, prop) \
 	(pipe_obj)->changed &= ~(1 << (prop))
 
-/**
- * igt_pipe_clear_prop_changed:
- * @pipe: Pipe object to check.
- * @prop: Property to check.
- *
- * Clears the given @prop for the @pipe.
- */
-#define igt_pipe_clear_prop_changed(display, pipe, prop) \
-	igt_pipe_obj_clear_prop_changed(&(display)->pipes[(pipe)], prop)
-
 /**
  * igt_pipe_obj_set_prop_value:
  * @pipe_obj: Pipe object to check.
@@ -1056,54 +1000,9 @@ extern bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe,
 extern void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe,
 				       enum igt_atomic_crtc_properties prop,
 				       const char *val);
-
-/**
- * igt_pipe_try_prop_enum:
- * @pipe: Target pipe.
- * @prop: Property to check.
- * @val: Value to set.
- *
- * Returns: False if the given @pipe doesn't have the enum @prop or
- * failed to set the enum property @val else True.
- */
-#define igt_pipe_try_prop_enum(display, pipe, prop, val) \
-	igt_pipe_obj_try_prop_enum(&(display)->pipes[(pipe)], prop, val)
-
-/**
- * igt_pipe_set_prop_enum:
- * @pipe: Target pipe.
- * @prop: Property to check.
- * @val: Value to set.
- *
- * This function tries to set given enum property @prop value @val to
- * the given @pipe, and terminate the execution if its failed.
- */
-#define igt_pipe_set_prop_enum(display, pipe, prop, val) \
-	igt_pipe_obj_set_prop_enum(&(display)->pipes[(pipe)], prop, val)
-
 extern void igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe,
 					   enum igt_atomic_crtc_properties prop,
 					   const void *ptr, size_t length);
-
-/**
- * igt_pipe_replace_prop_blob:
- * @pipe: pipe to set property on.
- * @prop: property for which the blob will be replaced.
- * @ptr: Pointer to contents for the property.
- * @length: Length of contents.
- *
- * This function will destroy the old property blob for the given property,
- * and will create a new property blob with the values passed to this function.
- *
- * The new property blob will be committed when you call igt_display_commit(),
- * igt_display_commit2() or igt_display_commit_atomic().
- *
- * Please use igt_output_override_mode() if you want to set #IGT_CRTC_MODE_ID,
- * it works better with legacy commit.
- */
-#define igt_pipe_replace_prop_blob(display, pipe, prop, ptr, length) \
-	igt_pipe_obj_replace_prop_blob(&(display)->pipes[(pipe)], prop, ptr, length)
-
 void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
 
 void igt_enable_connectors(int drm_fd);
-- 
2.49.1

