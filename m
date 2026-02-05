Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF7EC1EB5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3A810E8A5;
	Thu,  5 Feb 2026 13:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NY22S1X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709CF10E8A4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298252; x=1801834252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oKQE9tUYVmDsapjYxZRuMWvQrOliwJzi+zgpGEzvP6I=;
 b=NY22S1X5CDicTvMFSATAw+yp9DhuFHsZa4YiKikus4z3YFbxJF3GZAZ/
 2Qw2qDzbZl3YowVidifnH4kzo7W2p4X7hGsvRupKjN+4+cyCHmdbcnnR7
 c7nb+yOsC67jDLVKXXM8HOPACy5Dh9Ajo8zw/eqHHnRxODP5PJ157F856
 xTWO7mNVDMaxGKE6sobfb9q14vaygc6x5NQYfw2jOWM9E0oN9WLA8tTjC
 1KPRAPMXGt08SlWAuFKCdiaKnA9i6GxFkR/Ww8Kwn3cRbaMvfrY1zODW8
 9MMAkFU/wQhoUitAaZtU9yXDtha16N5TNwxrA0BHObNU7n5VbNOoVOn5H g==;
X-CSE-ConnectionGUID: JQYFPifjQ0+ZLUML89H6rw==
X-CSE-MsgGUID: OLkFUUfbShK4szNm0/QT6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693534"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693534"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:51 -0800
X-CSE-ConnectionGUID: qAGCL+IWSlS7sBvh1LwjLg==
X-CSE-MsgGUID: 6pPke+sXQOC+O6NWVlvJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499304"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/12] tests/kms: Convert to for_each_crtc(), part 3
Date: Thu,  5 Feb 2026 15:30:15 +0200
Message-ID: <20260205133019.9161-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc(). In
these cases the iterator is stored in some kind of data
structure (data->pipe) which we still want to keep up to
date to avoid functional changes.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe;
iterator name for_each_crtc;
identifier PIPE;
expression DISPLAY, X;
@@
- for_each_pipe(DISPLAY, X->PIPE)
+ for_each_crtc(DISPLAY, crtc)
{
+ X->PIPE = crtc->pipe;
<...
(
- igt_crtc_for_pipe(..., X->PIPE)
+ crtc
|
- kmstest_pipe_name(X->PIPE)
+ igt_crtc_name(crtc)
|
- X->PIPE
+ crtc->pipe
)
...>
}

@depends on change@
identifier FUNC, CRTC;
@@
FUNC(...)
{
+ igt_crtc_t *CRTC;
<+...
for_each_crtc(..., CRTC) { ... }
...+>
}

@@
identifier CRTC;
@@
 igt_crtc_t *CRTC;
...
- igt_crtc_t *CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index d74575f91d83..fdb5b782cf02 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -88,23 +88,25 @@ static void setup_pipe_on_outputs(data_t *data,
 				      igt_output_t *outputs[],
 				      int *output_count)
 {
+	igt_crtc_t *crtc;
 	int i = 0;
 
 	igt_require_f(data->n_pipes >= *output_count,
 		      "Need %d pipes to assign to %d outputs\n",
 		      data->n_pipes, *output_count);
 
-	for_each_pipe(&data->display, data->pipe) {
+	for_each_crtc(&data->display, crtc) {
+		data->pipe = crtc->pipe;
 		if (i >= *output_count)
 			break;
 		/*
 		 * TODO: add support for modes requiring joined pipes
 		 */
 		igt_info("Setting pipe %s on output %s\n",
-			 kmstest_pipe_name(data->pipe),
+			 igt_crtc_name(crtc),
 			 igt_output_name(outputs[i]));
 		igt_output_set_crtc(outputs[i],
-				    igt_crtc_for_pipe(outputs[i]->display, data->pipe));
+				    crtc);
 		i++;
 	}
 }
-- 
2.52.0

