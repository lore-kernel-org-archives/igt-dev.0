Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD1CC71141
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8D10E7ED;
	Thu, 12 Jun 2025 11:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEITq95l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2393910E7ED
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729463; x=1781265463;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7AOQ0Q9EPjpZiNRULSGLNMiKtpGNlwFOBCr1eklFeE8=;
 b=VEITq95lWh2vi9bv7EM5Abxfxnb5spK1HfgQp9xDjTvYpCBq0+6GJAFP
 aMVxrJv5+zqCpZikAtdgyYDmlPagHneL/5R6HQX9/DuqqcDCfLfN6qojY
 i551XWAPOWLB8+Tg2hjknfj2hiQXAD+6gqdwFGd5ZsXL8urdcds2kl0Gp
 CJYxeEtqXAmZ31UXn7HT0QtFNg0MZEKcZIN/3AIuuL3a97TtReBqRrs4K
 BdhYZW9bZdqgYcBKJvU2RsHMMIPaKaWM/9/YwyR4hjcB9f589D8KxOzh4
 QvAkZQQZlTV996erEjd86ay4r+ZDTolCrD1Xlrdh69rGFCTzTD0FEl2kc A==;
X-CSE-ConnectionGUID: Me+SDvEMRS+kou/JAL2oug==
X-CSE-MsgGUID: Wa+yfTYsQbWuM8pAX6tWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343060"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:42 -0700
X-CSE-ConnectionGUID: HTTdPhpxRwGKeYC+4jJHCw==
X-CSE-MsgGUID: Zn8974iKQ+SZmXyWqEJNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644855"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:40 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:29 +0200
Subject: [PATCH v3 4/6] Dockerfile: bump fedora version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-4-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=7AOQ0Q9EPjpZiNRULSGLNMiKtpGNlwFOBCr1eklFeE8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB+hIQ+PHVMk7W35X4ijvABTVEwpxCGMgQHL
 mv8Fy+wSLWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfgAKCRAjYrKT3hD9
 14vEC/44T+VHeH/U/wGMpFDfYI3/V2BUIJ2fyIhiNWnbRLQezu4yWcPGAYvMR25BTYjaJn2OWuG
 PFU1wueV8wfX7Sq41C3CNn9GjsCge1L4IqoFnPs5fZm2imsRmBeJlI8Uq3vgHYv8kuX8DZRx3rv
 Eb2O666XfFEJ8klzksCaNliQt0XEYURYjB1y/6f+CfZhFJurN4mTpDrtRrYAO5vCTW+7bTJnsaF
 hbNm/9EcK547vWRLV34Z+vRCndWrmHV8l3B3h1hAoSBSQj9GnALUqYvMr+N8xM+Z5xZ4z8Rc4B4
 9D4cITGWV3cso39ORG+o4VLRtP3xnAUgRSClTNDhO/lpBhQiPXB02gjhHou5n2tfLFzAed3s6rn
 c33inpzkh6LXho30HNjr76au3Bfh0jHQSmhL9kegGPg1ZNiPEzxiRrFz5OtHGcVbWC52zXAwoxS
 xEZY5kEegWz3xAmVhaSfgppDsMdBfdkMMsylEjlgvMWFY2XpQHAan5x8kbsHJSsqoQLnQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Strategy for fedora is to bump to the latest version.

v2: updated description
v3: bump to latest version

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index dc5d1b16b48880694167750cd3990bd7d7154d43..fb0750783028b3a9aa834de3da8a64a6ed6e3792 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -1,4 +1,4 @@
-FROM fedora:31
+FROM fedora:42
 
 RUN dnf install -y \
 	gcc flex bison libatomic meson ninja-build xdotool \

-- 
2.43.0

