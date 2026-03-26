Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBEC10A62C4
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD17810E926;
	Thu, 26 Mar 2026 12:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/tnrDfC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302EB10E165
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529656; x=1806065656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a/pX1sNs3M9C6qz1CiJFgph1arZRy1YwNGMCzpc1E70=;
 b=F/tnrDfCsrgT0pX7fTZ7xjoAOlpvEqiTU+fdSBxsGBNRMmXbEgr9S7Sj
 QQYdxP2gpzxBAbm6ipTR+Pg3v1ghIxsWEiJN6cF+/sFihZFG51ueKDDez
 uP2SvnUOLvEP9ihOusjs500q8gu1cSHTId/XdUeOEX4XXdJOOaUvVu4NO
 6+KdN9+6F0ZIZKBV2s6Ce6jm+k5uUeWpv/LGXSMvUbiaeSdeTjCH8yXWQ
 noi7RF21rsRlC6EDvU5ilU1Hz6m5BWffJ8V2QZbqqbWyXq5Ktg54wgPB3
 8qzl/X8Mgmp17UGwvUNH89nLiXpXY8nHZ4dbkcVXaJCq4P4fox6swa8ar g==;
X-CSE-ConnectionGUID: nYq+g24nTr21I+w/Fzi8lQ==
X-CSE-MsgGUID: 6zSQVEooQEeyLI7VyAY55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78183135"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78183135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:16 -0700
X-CSE-ConnectionGUID: rv+zAd5CQ/ayx/Y32Wvgyg==
X-CSE-MsgGUID: 9ZdiGvKXST2kthceEjU7Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220584704"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t v3 5/5] tests/intel/kms_pipe_stress: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Thu, 26 Mar 2026 14:53:39 +0200
Message-ID: <b6778322a799eb2c0f583e4e245cb20edad9f5b2.1774529527.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774529527.git.jani.nikula@intel.com>
References: <cover.1774529527.git.jani.nikula@intel.com>
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

Ensure we only operate on valid CRTCs. Either assert or continue the
loop, depending on the case.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound. The follow-up
can change the check from crtc->valid to crtc != NULL with no functional
change here.

The test is a bit weird because the pipe (or just int i) is conflated
and used for more things than just the pipe. I think the test could use
some refactoring around these parts, but I'm unsure how exactly. I hope
this is the minimal fix that gets the job done for NULL returns from
igt_crtc_for_pipe().

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index a0ce3c4d7ecb..1dec3d85c443 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -579,6 +579,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, pipe);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 		igt_assert_f(crtc->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
@@ -740,6 +741,7 @@ static void destroy_framebuffers(struct data *data)
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, i);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(i));
 
 		for (j = 0; j < MAX_PLANES; j++) {
 			if (data->fb[i * MAX_PLANES + j].fb_id) {
@@ -801,6 +803,8 @@ static void prepare_test(struct data *data)
 		igt_assert(data->highest_mode[i]);
 
 		crtc = igt_crtc_for_pipe(display, i);
+		if (!crtc->valid)
+			continue;
 
 		if (data->highest_mode[i]) {
 			igt_info("Using mode: \n");
-- 
2.47.3

