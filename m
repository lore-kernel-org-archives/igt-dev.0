Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C775CF9C7A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 19:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0383010E7D1;
	Thu, 20 Nov 2025 19:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsgbQAHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805C610E7D1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763666095; x=1795202095;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7QuD882+5ZYGj1EQwkqgJ2dyI9b3dAqZ8KETG+B1kgs=;
 b=TsgbQAHEFIdCa8Ri9py6fNSMcfFtbdo9Rv+nSduddZJ1etw2zQwgRWw5
 aLEI642Eltc1NHkU9vsl8ulTT1u4hdGUPoRQO0KhrC+DPLUJlIEwpudtH
 IxwSRofXa+8j0XEauaXJu1VXeIAiV6sTGk4u7NjmUur+RLrE1W0wQUszV
 tAhBqDR/dIJW/Hp52j/YNKP5ny8GXrKiqNdWtKzUICctR42dF0ilAN8HA
 EJg3Au9zb42Uo5J3H+iEnvmIEW+Lel4PD0aqSYX830JOhH76TYFAnE3qh
 PA3ORKex5EHIUU7SnZ1fbiPq059qHEXWhZ57/KO4bhlFQ4OPFDLdmezZJ w==;
X-CSE-ConnectionGUID: vS7hzoTiRCerYPH9Bb+9SA==
X-CSE-MsgGUID: ZaaUQxqNRf+h9nHJQZtUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838692"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65838692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:55 -0800
X-CSE-ConnectionGUID: H4jfh+rfT5+YurBJiqFFng==
X-CSE-MsgGUID: 3K4gfFcNRmujY1uKb5iLZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191308209"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:14:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/7] scripts/cocci: Add iterators.cocci
Date: Thu, 20 Nov 2025 21:14:15 +0200
Message-ID: <20251120191415.4236-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
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

Coccinelle often chokes on magic iterator macros. We
can lend it a hand by explicitly declaring those macros
as iterators. Start collecting them in
scripts/iterators.cocci which people can easily include
in their cocci scripts.

The "struct dummy" is there because coccinelle doesn't
like an empty script. Dunno if there's a cleaner way
around that?

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 scripts/iterators.cocci | 53 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 scripts/iterators.cocci

diff --git a/scripts/iterators.cocci b/scripts/iterators.cocci
new file mode 100644
index 000000000000..90d3ae437a15
--- /dev/null
+++ b/scripts/iterators.cocci
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: MIT
+//
+// Use with
+// #include "scripts/iterators.cocci"
+// at the start of your cocci script
+
+@@
+iterator name for_each_collection_data;
+iterator name for_each_combination;
+iterator name for_each_connected_output;
+iterator name for_each_connector_mode;
+iterator name for_each_ctx_engine;
+iterator name for_each_disconnected_output;
+iterator name for_each_format;
+iterator name for_each_if;
+iterator name for_each_output;
+iterator name for_each_pipe;
+iterator name for_each_pipe_static;
+iterator name for_each_pipe_with_single_output;
+iterator name for_each_pipe_with_valid_output;
+iterator name for_each_plane_on_pipe;
+iterator name for_each_prime_number;
+iterator name for_each_sriov_enabled_vf;
+iterator name for_each_sriov_num_vfsfor_each_sriov_vf;
+iterator name for_each_sriov_num_vfs_in_rangefor_each_sriov_vf_in_range;
+iterator name for_each_sriov_vf;
+iterator name for_each_sriov_vf_in_range;
+iterator name for_each_subset;
+iterator name for_each_subset;
+iterator name for_each_sysfs_gt_dirfd;
+iterator name for_each_sysfs_gt_path;
+iterator name for_each_sysfs_tile_dirfd;
+iterator name for_each_tiling;
+iterator name for_each_valid_output_on_pipe;
+iterator name for_each_variation_nr;
+iterator name for_each_variation_r;
+iterator name igt_for_each_drm_client;
+iterator name igt_list_for_each_entry;
+iterator name igt_list_for_each_entry_reverse;
+iterator name igt_list_for_each_entry_safe;
+iterator name igt_list_for_each_entry_safe_reverse;
+iterator name igt_dynamic;
+iterator name igt_dynamic_f;
+iterator name igt_fixture;
+iterator name igt_fork;
+iterator name igt_require;
+iterator name igt_subtest;
+iterator name igt_subtest_f;
+iterator name igt_subtest_group;
+iterator name igt_subtest_with_dynamic;
+iterator name igt_subtest_with_dynamic_f;
+@@
+struct dummy
-- 
2.49.1

