Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785F0C7115B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10B110E727;
	Tue, 17 Jun 2025 14:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NG5PPnWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27110E727
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750169181; x=1781705181;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=9axi0haCdTEmBKtgsrBc8OYrB6hj3DqO2qSOi4I1MHE=;
 b=NG5PPnWzdZfoW7dxRjYqhcNzgfDEtqxIodJsNkjKtDt8eSVkssJHSOZA
 aV0sZOl7TD5AEmJ4zCKyLF0QnVtK8Sg76GBhghdCMefUDxjzjnszGR8H1
 TbPYD7yszP2X9E2g1BOtFpwsgtIW5DnzLqYkCDiKelhWjZVkLh9db35M7
 PpSViqx9+n0G0tl2Wn55Kpjl235ZKHDcxhW8HIXlB24yCzKnt9KDwIbwb
 62Cy8mvCdfiFLR2LazZPiBqmajOAGOJe2WyTp4NTL1AywCl7kHUcW5iB1
 9IygwHW35jOABtFZtZ5Njk9DbNjbkKFEcNBw1lCImxBqMJD22ZPaXdoBg Q==;
X-CSE-ConnectionGUID: Klo3/xAQQSigIR1D83WizA==
X-CSE-MsgGUID: zfu8tLMNT2Gx0kE10D+Wxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52431603"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52431603"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:20 -0700
X-CSE-ConnectionGUID: FucufKx/T62VJngEg0Zn4Q==
X-CSE-MsgGUID: CuSuGSwJQLSkgjfX+qxzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="172036305"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:19 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/3] gitlab-ci: bump fedora version to the latest
Date: Tue, 17 Jun 2025 16:05:22 +0200
Message-Id: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJ2UWgC/x3MTQ7CIBBA4as0s5ZYEEz0KsaQAaaWBT8ZqDFpe
 nfR5bd4b4dGHKnBfdqB6R1bLHlAnibwK+YXiRiGQc3KzFd5EW5L1S4UCqPtxWollA7a3YzRzks
 YXWVa4uf/fDyHHTYSjjH79XfaautMmM4JWyeG4/gCjQ9Q/4UAAAA=
X-Change-ID: 20250613-bump_fedora_to_42-24d4b9554bc1
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=9axi0haCdTEmBKtgsrBc8OYrB6hj3DqO2qSOi4I1MHE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoUXYr8fVCfb30M6fT3nz9Je6Ge4Ju4jGuFLatC
 vSRbI+qITyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaFF2KwAKCRAjYrKT3hD9
 11w7C/99dYC0rCAn49uvgSjoFj1DND6MbUpj3rD2hq9DbN2pjMKTCoQwL5RXqzdRqUglCyIyaZJ
 U/ZrgBjwxmRCAZHrypoW9LDW8uLZdvQ9PdrfUAfTv8NJRnNq0X8NSQbA0SXuX95Iz92V+2ZtFJa
 F2y0QxFgQIPF3JnzzSW7J/SZRiUwz0XNb8RkQ4j3TyioOV0gUeKQX57HfXkGWCH2rQIUe5GCtAJ
 V6COPz4L6VyZUMwkduXZ6qrqho5u6VSgPvIexzi4h3Uld6+SBHWR+kp2ARddpe0gIL4nM6VFk3D
 7HyDlP5B/4FdOb5i4bO33uDJrzW837gVEkmRQp2RJakLuwolhyXlAsMNSvvAHFifhoEGD7VQZiW
 v+eOhihsc2Hrlz3wJ/ce2yIu5TYRtN14AZ5S/uno+MJ/t20GCPHLBE6E4k7T5jn2KglzmKaZdea
 sbffXlS5U4Fk2R9/OYzFdp/9gFtJe2XEilR3hs04dB28jRcC5Hwg6leZIWPxxZWwAXDdE=
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

There are two preparatory patches before fedora upgrade.
They are required to pass gitlab-ci pipelines after fedora upgrade.
Tested pipeline logs are here:
https://gitlab.freedesktop.org/andrzej.hajda/igt-gpu-tools/-/pipelines/1452050

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (3):
      gitlab-ci: build docs before installation
      lib/tests/igt_assert: use volatile cast in igt_assert
      Dockerfile: bump fedora version to the newest one

 .gitlab-ci.yml          | 2 +-
 Dockerfile.build-fedora | 5 +++--
 lib/tests/igt_assert.c  | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)
---
base-commit: a0d787e069ce10aa444c54b7d1ffdf5894826c68
change-id: 20250613-bump_fedora_to_42-24d4b9554bc1

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

