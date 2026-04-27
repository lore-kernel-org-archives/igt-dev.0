Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF61FF885E
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834F10E744;
	Mon, 27 Apr 2026 13:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYEUSe0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAC110E744
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294866; x=1808830866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yepbg4bHyGCzblQtk6YA1Fi6m4UqXfsx7OcGi+0jPOM=;
 b=FYEUSe0d088uaAnvq3darul0ev0djlNg92JkC7ovaakmJcqCo7NQpkSn
 94Ky2mf//W+pmle2wchC1xrXJv3avx51zG79AC4ulVFrWGqUL2kedCEQz
 xseBKPTWKuadON8gZmPHe60WeLoQ46OG0LAC3yFfCOeMpelrQvA5tzoY2
 8vuCC6GwEvlhUbOdI7Cc329zxZSOsQXUt5JJ3Q0XYRmllUGU6JTLxUhgW
 Weqjj8bRI+CA1BWC/2uFe37v3hEzqS9anl29TWiW+BwF0clhWsWeKPuYk
 LDzZ+YIwfg5JftqvSXOJPsjosf2WHMw+jH8pH/9aD6Ib7vYF+7E6Ho+AU A==;
X-CSE-ConnectionGUID: VNWdP9htQWWke169/rK4jw==
X-CSE-MsgGUID: Iw2mxpAoRCqaxZISESMwlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339318"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:05 -0700
X-CSE-ConnectionGUID: gUD9PJxcSXOafuwTFEQ7fw==
X-CSE-MsgGUID: m07h9S2SSJqJEyRSX0s9bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597793"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:01:03 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 7/8] tools/intel_vbt_decode: dump eDP joiner enable field
Date: Mon, 27 Apr 2026 18:16:06 +0530
Message-ID: <20260427124607.3115567-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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

v2: Use pipe_joiner_enable to match with kernel variable name. (Karthik)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tools/intel_vbt_decode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 24f626ebb152..78bc355b961d 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2515,6 +2515,10 @@ static void dump_edp(struct context *context,
 		if (context->bdb->version >= 251)
 			printf("\t\teDP DSC disable: %s\n",
 			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
+
+		if (context->bdb->version >= 261)
+			printf("\t\teDP Joiner Enable: %s\n",
+			       YESNO(panel_bool(edp->pipe_joiner_enable, i)));
 	}
 }
 
-- 
2.45.2

