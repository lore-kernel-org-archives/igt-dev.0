Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8586F8E4A7
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2110E28E;
	Fri, 17 Apr 2026 04:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqB1r8sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC810E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 04:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776399923; x=1807935923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZy+OLT4znbXvNWmlZmhsOSA9WCpcamYpcxmabPDuRE=;
 b=eqB1r8syMYmXjXWESrZDUrX3y1iUkYUjyEDyzY7V4EDMUEkwBnsZKLFg
 BpGvXeN8dded1FYwnq7pcPwwBBAgoum1844rNqgtWvCuoD6sNPF01He1q
 fqJ4l/srWaw403F73LlSry2fiCJ+LzyVcbKXagnqWUxibJj9F3upQgu72
 wxIHSHe6gMiTwvqWGy+/FyNHJYEONcXOPecY082LNwoW6o+Fba2bIwZcb
 kcFJG5pVY37ELjc2Asvj/yu61Nx3AmtP8+L5ATkXt27M+mfNhj6Vk50tw
 2d8mmHEcELUJhzIP4XvhDzDbRFyWZniPVGtJPHLaeYuTS6710/E+m8iHm Q==;
X-CSE-ConnectionGUID: Y5ODCAo2TeqER/Z8F4bIsQ==
X-CSE-MsgGUID: n+TlpBYsRzKcg8ig5pJzOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81282683"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81282683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:23 -0700
X-CSE-ConnectionGUID: U7JvAOWdQ+GrGIbWnNtSjg==
X-CSE-MsgGUID: sE9TAgNBQPCv2KpeUQ2auQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="229922459"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:21 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/4] tools/intel_vbt_decode: dump eDP joiner enable field
Date: Fri, 17 Apr 2026 09:40:29 +0530
Message-ID: <20260417041031.2187889-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
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

Add decoding support for the eDP joiner enable field introduced
in VBT version 261+.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743e42..a96b936d4b8e 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2483,6 +2483,10 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 251)
 			printf("\t\teDP DSC disable: %s\n",
 			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
+
+		if (context->bdb->version >= 261)
+			printf("\t\teDP Joiner Enable: %s\n",
+			       YESNO(panel_bool(edp->joiner_enable, i)));
 	}
 }
 
-- 
2.45.2

