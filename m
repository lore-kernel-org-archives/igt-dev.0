Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC14C35FF1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21E10EA07;
	Fri, 14 Mar 2025 14:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC65mXSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A7910EA04
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741964368; x=1773500368;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=d3QvaGem7l/OWm1nO4t+Ot90LdJbgI7aTV29rf5mWAw=;
 b=UC65mXSe/xhQF+my4/iP/4Fs2ZSfSyXTkdq7GYb9pDu3nS3vFoleSN8N
 ozKPo1RelzCPXEhH4VHzfc0HE5L2tZYUX/ucZJZR1RyPn9zcyAhOo6W/w
 Uxba/NXjX7+RcYPTuYHI4dKqpYPHa0ST26vz0R7Rfz9lbb+rntEKJZUEk
 z7z6oQTMqz6q4qGRIANmRf7BYbuXqW67rIjJZY9omubeYY8MvVWnSl3C7
 pfpt+uf40LHFZ8wsbUhjcZyjsIOqF95/HY6B2tzBvIl2ZIypL49JA3Df1
 4fM5yh9b40r83Crwm1DmwLwEDBaSFiX4XJ2AA7vr5bspCbbjQG2NOmNlZ w==;
X-CSE-ConnectionGUID: WWPFMBx+SuaN6g3XqIfg+Q==
X-CSE-MsgGUID: SBxiKK16QY2VINJS+c8AQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43025071"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43025071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:28 -0700
X-CSE-ConnectionGUID: kswgAoCiT6OfdYtcuZIcwg==
X-CSE-MsgGUID: B18EM/FpQLah3Uh0yB4IqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126178685"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:27 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/4] lib/iga64: miscelanious improvements
Date: Fri, 14 Mar 2025 15:59:07 +0100
Message-Id: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADtE1GcC/x3MQQqEMAxA0atI1lNoY3XhVUSGtEbNwioNDgPi3
 a0u3+L/E5SzsEJXnZD5JypbKnCfCuJCaWYjYzGgxcbWzhuZqfXfVTQaJIuTdzY0DqEEe+ZJ/u+
 sH4oDKZuQKcXlWRy7wnXdsUlf/HIAAAA=
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=727;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=d3QvaGem7l/OWm1nO4t+Ot90LdJbgI7aTV29rf5mWAw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBn1ERM2bOt9f0ywnVpDC5yAq43i+EFs9i1Ctat1mP3
 3sOQueyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ9RETAAKCRAjYrKT3hD911q+DA
 C7GY2oAJ9/bcc/OlUhUsRcfvIYeqAc3prrZc8+f/TQTOxvmQ46KPZYdGq6F01oRMJtve1MiIyQcHYS
 Siud/+UJY/axT9vEuee3X18/ddKRQK0nw4zt9fChwk96cXeipBCpAVRROpyFzYb+/ohr+JiKToEVjs
 psFjFE2q3D/mw1E0Do/gTNYroFuDq1fJ5KRcftkto0j8XU9HdFKlnGaUO6nmlFitTaxz2QQdeJLM+w
 LCAhDTI3IEo97Ic4MnLcRqFCfpONuJen/gJN7wO/FHj17dWrmC4ZEZTGkFu9gHvIRiWmSvmQkd/UdH
 5pdMf5Qefbll4kRMOaOXrxn3mDiPIypUwNn1pGztaDMKn4KLKYb1F/tsePj3aAo/dp64sDN5e0c/23
 RakhoyAbBhqTD+gZLhPE8aL/0YMIot56ftzT1wx4lkt3IjKbimd6iOSFtlNmCkIHIRAm+Fsr8nS+Nj
 Sv3L05X6RQr1l1C/H0P/bwelCHUB8amSw/Hp+p9J1HhDk=
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

Several iga64 assembly related improvements.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (4):
      lib/iga64: fix send macro for DG2 platforms
      scripts/generate_iga64_codes: make script less chatty
      scripts/generate_iga64_codes: fix handling empty asms
      scripts/generate_iga64_codes: remove parenthesis around ARG macro body

 lib/iga64_generated_codes.c  |  2 +-
 lib/iga64_macros.h           |  2 +-
 scripts/generate_iga64_codes | 11 +++++------
 3 files changed, 7 insertions(+), 8 deletions(-)
---
base-commit: a851348546d61620c263d3292148f67620efa7d0
change-id: 20250314-iga64_misc-2a02f410b512

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

