Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823BDCA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AC510E1BF;
	Wed, 30 Sep 2026 14:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCGr6oP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D093D10E14E
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790777605; x=1822313605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SSYPsKhYOk0VR9TxH41ggRu5hETrC2hsm7QRHBPvm0=;
 b=VCGr6oP8DLn+exoQUaNmTua6sBG+jR8hzc0WpYrs6C/Nar/+zlX4Hyzm
 Su4Z3B2CMyqbKNZ2bxfnN0wbuaGx/qxWBaIcNdJx6glivAeamHLbDassU
 hHRO6ZVJE5Zctg+grPugEk/Jn+Ao9t4LTeuXFNptzwZ/B6N0R1kNvHBbb
 XZO58EgYbrf56nYjNLpBDL7QItnPAspxgeYnlSEbU3HgOVH+zdhW5VDL9
 idN6oCrejKaKm+zDHKryG6j1Zqe0upobrw457TnWqt2OgC7mtYVBYgiui
 urgef8ATbDAkFFARVQ5o7aZuqd6V020cQM9zOpOoqXrV7NV2ten8JCRdK A==;
X-CSE-ConnectionGUID: +IU6+REKSQe0YfoNaPD+pQ==
X-CSE-MsgGUID: vpUipsEZR1a03aQF0NOmPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90375623"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90375623"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:13:25 -0700
X-CSE-ConnectionGUID: akuGDq/tQAyExyIjbh/Ebw==
X-CSE-MsgGUID: BvOxTOf7QNa5DE4JaI70KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="301973383"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:13:23 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 1/1] lib/intel_compute: Enable thread-group preemption
 on NVL-P
Date: Wed, 30 Sep 2026 16:13:09 +0200
Message-ID: <20260930141309.228834-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930141309.228834-1-jan.maslak@intel.com>
References: <20260930141309.228834-1-jan.maslak@intel.com>
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

NVL-P (Xe3p_LPG, graphics IP 35.10) supports thread-group preemption.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 409799bc8a..02aa3cb425 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2842,7 +2842,7 @@ static const struct {
 		.ip_ver = IP_VER(35, 10),
 		.compute_exec = xe3p_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
-		.preempt_type = PREEMPT_WMTP,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
 	{
 		.ip_ver = IP_VER(35, 11),
-- 
2.43.0

