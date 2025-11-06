Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD57CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5203010E887;
	Thu,  6 Nov 2025 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COdShv6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B76C10E06B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424941; x=1793960941;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=p74N33aKwdk3t19YZLWvzUy7XWhBADmGReH6gfWGhBo=;
 b=COdShv6a9cXUikrpuHxZVUVxazcezd6oNfat0UYfus+WwsNZNw5evKdv
 MlK9bZu8d2bQy5L8J6LWXWT5qQBpJSRrV/7WiHa5hCukoFzPHNXoMgesh
 v1TKls9n0jAj0YLX481jjJYBWdznZRClutDtZmtHIq+yC2ldCNXDXIXJU
 Pryh1AsMUeyAUmFK+I+R5y+FGOr0wwgeuEzGvAbb9H+FLHQnPm81ICbgA
 5XM0XAzoB01X9GS5qY/+pogWKz+OuPKA+c2FBBUBa/qGdpOIo0maCuW7H
 gTCGrkHlAWjouutMnlTQouuS35lV8wXczH/tSajuK1GBilMiZtmLRLUrG A==;
X-CSE-ConnectionGUID: 2DIi4tUXT0qTivcLzwdHZA==
X-CSE-MsgGUID: TMeIrOoIQcepWlLDFDichg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960951"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:01 -0800
X-CSE-ConnectionGUID: 6a0I1bS/R4uThHsLTRLcpA==
X-CSE-MsgGUID: LjvlABsDTNK0LMaGL6yKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667897"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:00 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/7] lib/xe/xe_query: implement few query helpers
Date: Thu, 06 Nov 2025 11:27:25 +0100
Message-Id: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA14DGkC/x3MQQ6CMBBA0auQWTuR1mrAqxhDpnRKm2ALrRgI4
 e5Wl2/x/w6Zk+cM92qHxB+ffQwF4lRB7ygMjN4Ug6zlVYj6hit388Jp6xyPE6eMLalWXaRpZGO
 gZFNi69f/8vEs1pQZdaLQu99Iq/NEA1taxjfGwBgtvihscBxf6ASLEI0AAAA=
X-Change-ID: 20251106-xe_query_helpers-9a49432d828d
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=p74N33aKwdk3t19YZLWvzUy7XWhBADmGReH6gfWGhBo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgl5swPiMjYKN1sJWjbIPKhGgKmXRkfZwrDp
 YbIyyPCCG6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JQAKCRAjYrKT3hD9
 11MPC/9ylepUs3eU/NRLEjbw1abuSj2lkXbpewURnwZbBJ7KbI++W8ADkOhKTZ9dUgrPE9s3354
 DTkFEDYdK8dsm7SJnVId38QV5Q6AYPNlZfgmwkMTZRZ6KBA7dUqm7ZEVwQTkMcqa4dR/LCIjDjV
 OtzphwGGAHqert+gFegcz80uNjHyPg+PXBbX6zsOZAZlrNbCAgHHhX9BcJbU6/TX1jW3zDNu6MQ
 9naQmuEDptFRZ2LwibwzWLE3WK/qJhawa4Ku+ELx4BFeYdYs+oHifSQ2LVP/JN5t9ZkSaSDIFDX
 cmUmsPwZV4oSsyb2oAl/5UkdIjPFQQvmgSCjB3Dy0NDg5voGSokM+G49RWOtmAQuZhOVIriib6l
 ctjArqIuQcnYRvoa48oGDvkIVdDA/aDEn1pNioWKevxCM0nvVa1ZlsQ0Dyo8/teY7lSAKhqssSM
 bBevvzDXNLKl4TSJqqR3ySPCZSy4IOt2yWc3sUeU/hFe6KFoNpFq++/aLQCju59ufWwhQ=
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

This patchset adds following helpers to xe_query library:
- xe_hwconfig_get_u32 - to get single value from hwconfig,
  similar helper exists in kernel,
- xe_query_device - encapsulates common code around DRM_IOCTL_XE_DEVICE_QUERY,
- xe_for_each_topology_mask - iterator for blob returned by DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
Beside adding helpers patchset also shows their usefullness.

Cleaner code and diffstat of 85 insertions vs 282 deletions hopefuly
proves usability of these helpers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (7):
      lib/xe_query: add helper to get first value of hwconfig
      tests/intel/xe_eudebug_online: use helper to get hwconfig value
      lib/xe/xe_query: introduce helper for device query
      lib/xe/xe_query: introduce iterator for GT topology masks
      tests/intel/xe_eudebug_online: use xe_query helpers for query GT topology
      tests/intel/xe_query: use xe_query helpers for query GT topology
      lib/xe/xe_oa: use xe_query helpers for query GT topology

 lib/xe/xe_oa.c                  |  37 ++-----
 lib/xe/xe_query.c               | 212 +++++++++-------------------------------
 lib/xe/xe_query.h               |   8 ++
 tests/intel/xe_eudebug_online.c |  41 +-------
 tests/intel/xe_query.c          |  69 ++++---------
 5 files changed, 85 insertions(+), 282 deletions(-)
---
base-commit: b35f18b8bd2b3b18332e7db550e5dde851d7a8e1
change-id: 20251106-xe_query_helpers-9a49432d828d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

