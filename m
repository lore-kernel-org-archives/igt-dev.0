Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CDC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88B010F1DE;
	Wed, 23 Sep 2026 21:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mr7QgzPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C15210F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199713; x=1821735713;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=tlZvQijU/LFms9Lzyc5rBrHacCNSqNlTjOSsYdM3LZE=;
 b=mr7QgzPGPwvIa2r/H9Da+WjOQAx5dv7H98xKzoYoDIWgrUQNIO7XcsQ4
 fYB7Fm3zP7QOS2/pgcHkEw2ki35wyjedj6UHZXXT8DQjYnu3ujwugn31Y
 ciWnQbxxxRkCnvEK/G8HwHUB+ozonD7sS67jrcCiAe22S+M8AYpt0k8NE
 OKBCqX5JwT5ZN13ec4i97aAWqvh8OeXqfCbNHIRb8gVtQlTZp8GbyTgoZ
 eadS8Fub4XrVgH3oQ18wX4KmdxOq9jOm/2Fp55+wKFCsQIt4D7gx9oKfI
 2PUMLYqEYWWFsKgLXyTwf8E+nz8qs1n9d8pvdhvd2Y37K1+8kgBHeyX2x w==;
X-CSE-ConnectionGUID: 70Ext1YLRsaKDT1IIvbIHw==
X-CSE-MsgGUID: vqI/H5dLQGmUOlFUNHWFzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445399"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445399"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:53 -0700
X-CSE-ConnectionGUID: ERqvKIi1QvKbtqC69z9c/g==
X-CSE-MsgGUID: g57/4XjCRCiqLanUC83UHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907679"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:39 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v2 00/11] Implement Wa_14026539277
Date: Wed, 23 Sep 2026 18:41:07 -0300
Message-Id: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQrCMBBEf6Xs2ZUkRtd48j+kSIjbdkEbSUpVS
 v/dEG8e3wzzZoHMSTjDqVkg8SxZ4ljAbBoIgx97RrkVBqPMQZG2+PJXbQvsd84QYSDHjqx15kh
 QRs/Enbyr8AKCPU7QlniQPMX0qTezruXPaPS/cdaoUAVtiZk77vxZxonv2xAf0K7r+gWHLCGls
 wAAAA==
X-Change-ID: 20260714-wa_14026539277-c79e97449287
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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

Wa_14026539277 requires handling from both KMD and userspace (which
includes IGT).  Do the required changes in IGT for Wa_14026539277.

Since we need to check for Wa_14026539277 as early as during IGT's
xe_device initialization (i.e. xe_device_get()), some preparatory
steps are required before the changes specific to the workaround.

So this series does that preliminary work with the initial set of
patches and then adds the workaround implementation as the final
patch.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- The approach remains basically the same, but there were some changes
  on how the debugfs dumps are cached: now a new struct called
  xe_wa_cache is used.
- Besides that, feedback from v1 was incorportated. See the changelogs
  in individual patches for details.
- Link to v1: https://patch.msgid.link/20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com

---
Gustavo Sousa (11):
      lib/xe: Move lib/intel_wa to lib/xe/xe_wa
      lib/xe: Make debugfs_file_has_wa() aware of the debugfs file layout
      lib/xe: Gather workarounds debugfs dumps in a cache struct
      lib/xe: Cache workaround information in xe_device
      lib/xe: Return boolean from xe_wa()
      lib/xe: Assert that cache is available for xe_wa()
      tests/intel/xe_pat: Adapt pat_entry_is_wb() to Xe3p
      lib/xe: Add xe_wa_from_cache()
      lib/intel_pat: Encapsulate management of xe_device's pat_cache
      lib/intel_pat: Pass xe_device to xe_get_pat_config()
      intel: Implement Wa_14026539277

 lib/intel_pat.c       |  43 ++++++++--
 lib/intel_pat.h       |   5 ++
 lib/intel_wa.c        |  66 --------------
 lib/intel_wa.h        |  11 ---
 lib/meson.build       |   2 +-
 lib/tests/meson.build |   1 +
 lib/tests/xe_wa.c     |  42 +++++++++
 lib/tests/xe_wa.h     |  12 +++
 lib/xe/xe_query.c     |  15 ++--
 lib/xe/xe_query.h     |  10 ++-
 lib/xe/xe_wa.c        | 233 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_wa.h        |  19 ++++
 tests/intel/xe_oa.c   |   4 +-
 tests/intel/xe_pat.c  |  35 ++++++--
 14 files changed, 396 insertions(+), 102 deletions(-)
---
base-commit: 65f84b280be2caf8ce376295d97987a808affdee
change-id: 20260714-wa_14026539277-c79e97449287

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

