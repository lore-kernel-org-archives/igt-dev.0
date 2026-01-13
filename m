Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C765D2D0E3
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B910E337;
	Tue, 13 Jan 2026 12:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAR4wSJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917D410E337
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305891; x=1799841891;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Jb7rqgUOE1JLubm+vGA3JjFaXcwu79ryA6dW7k758xI=;
 b=bAR4wSJ8RycnBZNpMD18nMpDJtbmSrqsAuyKPz/dRW77SgkIQw6edpsC
 n8j/Vb52KVugQHSQRJudujOA0rWFA/NVIcC/29FB5BNy+9YbG6jqWXQMn
 W80gJJCKf7I5R8D+YGHUitydJPjnJX9wMvgFIHxKpopTcxuUUDsi7C+6S
 WHmrJpBrTB8Yij/f/J2Jc6gFDdVssjya+XtnBe7JN5Z1AZGSzD5z/VMxC
 r29LXw6qm13j3176zoluYMs7IxiVIdsGXK+6rX0YBi67jLf2vE8VcufgF
 I4/7C5u1F8dc9C883WALRRGT26JCtVfXmmSGW4mi7k537PqIx6aQy8FzS g==;
X-CSE-ConnectionGUID: cLUPOs4PSsG0/6F4PiKPLA==
X-CSE-MsgGUID: W34kNrAqTgeU9OXZJWxLKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256377"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:50 -0800
X-CSE-ConnectionGUID: +Fk7Lb7FRPiB4uUe7poI0A==
X-CSE-MsgGUID: WKZ/aAsrSQaFAHPfviBSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835619"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:49 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/8] tests/intel/i915_pm_rpm: Nuke bogus NULL check
Date: Tue, 13 Jan 2026 14:04:33 +0200
Message-ID: <20260113120439.12577-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
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

'&data->display' is never NULL, so don't check for it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/i915_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 778f46dbcfb9..b4da27b21b20 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -356,7 +356,7 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 	igt_output_t *output = NULL;
 	igt_display_t *display = &data->display;
 
-	if (!data->res || !display)
+	if (!data->res)
 		return false;
 
 	for_each_connected_output(display, output) {
-- 
2.51.2

