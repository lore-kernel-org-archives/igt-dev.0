Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C08C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55310E3C5;
	Mon, 12 Jan 2026 13:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyF359d0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D823D10E3C5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222868; x=1799758868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N/mXGrmwjbl2jF8MHYAmSNFQ70KzlbvXE3pa2hhzgg4=;
 b=jyF359d0pL/+GpryTZw1Px8Ys/L7Q33u88USa3vd1oZ2UhzVT8GE/Idn
 LngdACAgQElNZbfzQ9JMpHF0wAPHgt9lL8/wziR71uXvUepjEwl2aLWm8
 hizqWVdp2OP47vMbLmoPe6ovsQdL+9+9b+J8UNiaQpDUNPREOfB0YYjFl
 3yqqdyylKC/WgX7CeKrf2o1hS6e2IOnMyAJLVzM7eSqZPANnib03vZ9Ts
 NM8z5Do+m9zrINUBX2aBgloP3pRfewQyiSXM6/C/jcTacd51wOgqSiW+V
 okWrIMR32XOTcHMPtlu6uTR39cWVB0I0S8e2/FhYyJz0ddI35JCXPD5sj w==;
X-CSE-ConnectionGUID: fjY1wV+GQj+kqnUXqPLcRQ==
X-CSE-MsgGUID: 16hLptkOS16ppF9YpJSejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545607"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:08 -0800
X-CSE-ConnectionGUID: lMLuDOt1RLCYXO/nU5I7UQ==
X-CSE-MsgGUID: +j7z9UyiQcG0RcZ727JAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095088"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:05 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 18/21] tests/xe_eudebug_online: Adapt several subtests
 to work with new vm bind event interface
Date: Mon, 12 Jan 2026 15:00:04 +0200
Message-ID: <20260112130008.1649357-19-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Add 'online_debug_data_trigger' to multiple test functions to adapt the
following subtests to the new debug data passing mechanism:
 - interrupt-all*
 - tdctl-parameters
 - single-step*
 - writes-caching*

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug_online.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index a9fa150114..473c362470 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1596,6 +1596,8 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 						ufence_ack_set_bp_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 						eu_attention_resume_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+						online_debug_data_trigger);
 
 		igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
 		xe_eudebug_debugger_start_worker(s->debugger);
@@ -1716,6 +1718,8 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
@@ -1851,6 +1855,8 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2024,6 +2030,8 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2237,6 +2245,8 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_single_step_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2334,6 +2344,8 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_caching_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-- 
2.43.0

