Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AE2CD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 12:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBD910F03A;
	Thu,  7 May 2026 12:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icbYdpGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A6810F03A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778157344; x=1809693344;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=tDMjRorBFhDxpCoUj6t9r3XiT9EhpArJlTIJ8hgCYkk=;
 b=icbYdpGs/Dj0SDexH8X0RMxU61nYA6qoc1PL7tZ36PXmBqJLXfy4wj4Z
 qTVoHsCbzQMhZYf3Kqr6HgymrAMyUWX5mz2RWU2QRdRcCy89cDi8lDb5V
 klAfkUksd9coubzJ6OXTQEeX2C0VsxUVdrZ41pWiK8vpnpAsjC8F49ee7
 C73sL8YoMYngrZNTWw5ssPNRBhFHRCocWOcR8KUFNORjVzo5ReBzazxlb
 DMDRhlU7UBhNnUVNRAdZKkyATblkcWeEZIYI3cb/Fd240C9KyasEesjMg
 514eqaUNhRUDIkjgyPgzCdSiCOGZ2N+B6lJinDW8C3Tet69AFXTq8zp6y w==;
X-CSE-ConnectionGUID: sHsxTp7BRg6EH1TWp4L7xQ==
X-CSE-MsgGUID: 66WMjqqfRjq4vpeTGcxOaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81674966"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="81674966"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:43 -0700
X-CSE-ConnectionGUID: cv935/cGTD2IcKWVzBd37g==
X-CSE-MsgGUID: atC5LykJQHCH6osAGJxs/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236716811"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:41 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 0/3] lib/igt_core: add timestamps to error logs
Date: Thu, 07 May 2026 14:34:16 +0200
Message-Id: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMiG/GkC/3WOQQ6CMBBFr2K6tgpYVFx5D0NIaadQQ1vSKURDu
 LstrF2+yZ+XtxAErwHJ47AQD7NG7WyE4nggoue2A6plZFJkxTVjl4xyKZugDWDgZsQmuGZwHVJ
 5Z0oqeQPFBInPowelP5v4Ve+MU/sGEZItLVqOQFvPrejTaRoxeODmbDgG8GnRawzOf7e2OU+mP
 aPMyn8Zc05zWsiqVKyqYlD71DbAcBLOkHpd1x+A/ZEK8AAAAA==
X-Change-ID: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=tDMjRorBFhDxpCoUj6t9r3XiT9EhpArJlTIJ8hgCYkk=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp/IbTah3pfioN3REB1GIlbjORf8ULvDK6wIA79
 GbHgFJugiaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafyG0wAKCRAjYrKT3hD9
 19jEDAC4SZPjofkujv0o5DrfQVziWvD/yikWDA8f+pKwJXNsRGF2D/dfYA2OWJSTDAnLhr1UBVM
 Lf8fxEaum01Wn/sSIBJLbuAiC0pZRwtaGKYb3mYSlsy7Aky9c5NnzEQ//IIApLGNvtRjFYFSM6l
 xwEhI9xj5lc3LOOpONq7kLR8xBvs4qBqfGqfQRgFV0vVtpKGrbggryuLHPARDXlZ/DB/caQLCUQ
 rnZvAqJYlHOTIDsE+IUcGeS+jjFodbcmfMcNI3lgksj2cjeLahLCa/6BQMOEIQuK+ZaLfgikWZQ
 8A6YfpNEBmgryLu02hCs8bphj4+SM7fShGuu5H00AFomYK6i1ODe8YcAg2RbMhuJxfOAgfuhixP
 D7SSA99YXHXHmnuMX7UItyvAIMF4+BzmZjGGn11P9SjlZieQRNGFVAX6lKz66wuKNEDKf/C6Jj/
 GjzxistF3Dv3VMmIVOV48Y+RwohyZn6Txx7t/jRwQSGoy/0vtEMtScX28bvPlh8/wmXMs=
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

This patchset add timestamps to error logs in IGT.
One of side effects of adding timestamps is detection by CI of previously
hidden errors in errno handling.
According to manual errno should be read immediately AFTER library function
returns an error, otherwise errno can be overwriten by subsequent calls.
First patches fixes these errors.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Changes in v2:
- added fixes to errno handling
- adjusted format string to be the same as in dmesg
- Link to v1: https://patch.msgid.link/20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com

---
Andrzej Hajda (3):
      tests/core_auth: do not call any function before errno check
      lib/igt_sysfs: protect errno from being overwritten in igt_debug_on
      lib/igt_core: add timestamps to error logs

 lib/igt_core.c    | 13 +++++++++----
 lib/igt_sysfs.c   | 17 +++++++++++------
 tests/core_auth.c |  2 +-
 3 files changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 3e5747e536f148bf232049e49a00e2b683f91a83
change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

