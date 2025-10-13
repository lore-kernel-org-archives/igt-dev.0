Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1239CCD18D
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FCD10E399;
	Mon, 13 Oct 2025 13:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER48YnWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EA610E399
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362548; x=1791898548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cgs+R/ezuR7/df65N+jNePbXItRo0FE3NnE3KMu8Yp0=;
 b=ER48YnWt6XZkGBEFUar5FXdyR+duSQSTUru2ER72hXLL+Hu9LfNok8zp
 7dyFdMep0sNyQMTWFSN6LHV2XOt6ONIsrbFLdraeRfyiwwvZmMP5YHIBx
 ExZlv3IgKRWTjDjRKbOjLTmVlt2uosTOt26CeCQ3oId9rZ/b0t8rynkcm
 jIjNKNZwSyRro1fm2ed7FrLcZ8NRs/TyM719GHmlFR7xS5gNbDIG19Cm+
 38KW0dXGB2QRzrBa9Veu61sh4VoXBwdR7MgolMvpCGB9jzPXBwHD2EAZs
 WeqikXffz3EfM9dN2ild98irSvKb1M+Lini7dft1TuEkETXjpIJCC789X Q==;
X-CSE-ConnectionGUID: JgCdvD52ReWjOM89GIDWnQ==
X-CSE-MsgGUID: mYnv4D7PQUOLdhL747kW1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73106031"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73106031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:48 -0700
X-CSE-ConnectionGUID: L0G1uo2SQZGUwqSo1SAohw==
X-CSE-MsgGUID: 1v1YqDVRQKu3hEvuBgVSmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180844535"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:48 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v10 3/3] lib/intel_compute: Adjust long kernel usage for
 WMTP
Date: Mon, 13 Oct 2025 13:34:35 +0000
Message-ID: <20251013133439.543393-4-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013133439.543393-1-sobin.thomas@intel.com>
References: <20251013133439.543393-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

WMTP uses different shaders SIP and loop kernel and does not
require a separate long_kernel; Removed unused definition and
variable initialization.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4f0e86fd4..592dcdce8 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -72,7 +72,6 @@
  * WMTP - Walker Mid Thread Preemption
  */
 #define TGP_long_kernel_loop_count		10
-#define WMTP_long_kernel_loop_count		1000000
 #define XE2_THREADGROUP_PREEMPT_XDIM		0x4000
 
 struct bo_dict_entry {
@@ -2135,8 +2134,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
-	else
-		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
 	for (int i = 0; i < entries; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
-- 
2.51.0

