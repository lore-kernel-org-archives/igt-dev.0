Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C055C677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6010E61F;
	Wed, 11 Jun 2025 11:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdH74Jc/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744D610E61E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640045; x=1781176045;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VZwxH5ZySGt9yWbo/1sWkLygl2eMzUhVY8zAKNBMytw=;
 b=AdH74Jc/EysaGxwBxvOGM/w8R4dSgHk4ASDbyj8nEw9cztjrSLOK1fBF
 JR1aK5vAoKqQpf2zUNt1DIjoO62CWro+UsyTGFNBo5Fl0fdvURZvTa1Bm
 EgTN0SGjFxMnBbPPTM52MVok5rVjkrgACzvsiF9ngPEFrr/wfRfnk8Tg9
 xA9dmvJ6i9AsY3G64XkLv/yWa+ufC9ATLN/Jr8xy+xiz3k7YiLxFMhyVU
 hIWef4nuon055B7K8lTV24NrKIyahXZUphsbLbgJpobGkZbAh/Tvl2gw+
 uKc4KKkwmMux29ezSujbru2OYpuMee1lKo+dbFOhSdMQUyWWEtUQlG5BX g==;
X-CSE-ConnectionGUID: uebDVd2HQGCOSk5J+93Qgg==
X-CSE-MsgGUID: U+A+XXmiRH6HKVqOw1sWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057465"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057465"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:25 -0700
X-CSE-ConnectionGUID: dB3MgcHERtK4cLas4IxbXA==
X-CSE-MsgGUID: +RP+bB++Q6OHFLLSbd6Z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147015005"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:23 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 11 Jun 2025 13:06:38 +0200
Subject: [PATCH v2 3/5] Dockerfile: bump fedora version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-bump_docker_distros-v2-3-90791ecb953d@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=710;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=VZwxH5ZySGt9yWbo/1sWkLygl2eMzUhVY8zAKNBMytw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWNDHsq4TGgKv/33cd1t5mnHUnjmVR4kjR4u3
 4s9HbzYawaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljQwAKCRAjYrKT3hD9
 19+VC/46edSZ7yaTh0sQJyVuYGy4Cf2VIqWi9MJB0Br7661l0Y8+JqbPBDIrFG+2UPRkRTz7btK
 4o2kbtltrPq00enWGl0FU8GAARMu0QK3RK8VOYWR8zeoBSAGY9S6x3wnE8g+gFTnXAuGndF9WBj
 S1Bn2xU1CHZgSnjhrxrtsy5qYwwrLDcRvyUBbF8aE69jQWEQG55A/p3MPw0hqaXOUYSkgrCazH3
 cnTcqauuijm5DXf01hXeOqit2z9Ia4eEQ6DvwjDsRygMaW+KIz0GcpwzMZOwO1T+VO2i7c54y+S
 66uNVziuXGiWzgc3wdBnCxt0205lyNWltd6caZCxUUuEg/bH7HksEcytkT8AXceX2M2wmmpKW2a
 tYuvGsqtr9RJ+aWUrirpu1m7ctRrJeXgud6SmVNADJLVs92u2BxJmIaXrilPtt/LY1mwFZEfb9a
 QHNiSdWAwzXWo4QrTe+KItm9Muwp+LQacmSNYceIYab58IzMty9K6EPKisumwNpH/EtwM=
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

Fedora has not LTS versions so in this case we bump to version
close with release date of debian bullseye.

v2: updated description

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index dc5d1b16b48880694167750cd3990bd7d7154d43..00f45857c20f82320500e7230e72c9522527e7a9 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -1,4 +1,4 @@
-FROM fedora:31
+FROM fedora:33
 
 RUN dnf install -y \
 	gcc flex bison libatomic meson ninja-build xdotool \

-- 
2.43.0

