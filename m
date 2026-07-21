Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF514C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00D10E3AA;
	Tue, 21 Jul 2026 19:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDSHCznG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC710E3AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660433; x=1816196433;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=ttgeFOs9F/vNc1pwC/eZ7mO5BN953zzH7bYxjLFW6i8=;
 b=fDSHCznGAoGdtPA54BAShbq/PYn/i5wWUdlHrR5YW8J/x5BRJTbU0+34
 eDL5o8P678OKuaad57yt6PTkud9lGggFfJP8LpZuM7+ybLWnxaBvsVsqU
 GBmyjC1zXyO3o0mNqZBwMEC2hANYedzyuw/upLxRmIPUoG/XerB+yaHE1
 KFa5k9uMc9rsuu3q0ZV4GhuDQIvk0jm5qfR1x2pzCXU9GEMRbIvmol4n8
 j1vD4OmnevTS60a5NUICzCxW8ZEmipgWA5FgZc3KGYdN0DFDpw4yHCitm
 MZQYSi1wXEQuEkjdzb0J+nVlLR2F0vEbXlKWo6iOgExAQfYRZB8hpH99u w==;
X-CSE-ConnectionGUID: cID6OYeRTJ6VWJSxWW47qw==
X-CSE-MsgGUID: CPScuuroSmuebAe9oojzLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637684"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637684"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:33 -0700
X-CSE-ConnectionGUID: upyVYFICTZq8TArgWlileg==
X-CSE-MsgGUID: F3rMxUqFS8Olsout2M3O6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516543"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:31 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t 00/10] Implement Wa_14026539277
Date: Tue, 21 Jul 2026 15:59:53 -0300
Message-Id: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE3SVhl1FRERBrNBWkHSuLvG8
 i3+jxDYCwdosgieLwmybwk6z2Bch21hlCkZjDKVIm3xHnptE8rCGSIcybEja52pCVJ0eJ7l+Yc
 tCC54Qve+H7vFUT5nAAAA
X-Change-ID: 20260714-wa_14026539277-c79e97449287
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
Gustavo Sousa (10):
      lib/xe: Move lib/intel_wa to lib/xe/xe_wa
      lib/xe: Use stricter line-equality check when checking for workarounds
      lib/xe: Gather workarounds debugfs dumps
      lib/xe: Cache workaround information in xe_device
      lib/xe: Return boolean from xe_wa()
      tests/intel/xe_pat: Adapt pat_entry_is_wb() to Xe3p
      lib/xe: Add xe_wa_from_cache()
      lib/intel_pat: Encapsulate management of xe_device's pat_cache
      lib/intel_pat: Pass xe_device to xe_get_pat_config()
      intel: Implement Wa_14026539277

 lib/intel_pat.c      |  43 +++++++++++--
 lib/intel_pat.h      |   5 ++
 lib/intel_wa.c       |  66 --------------------
 lib/intel_wa.h       |  11 ----
 lib/meson.build      |   2 +-
 lib/xe/xe_query.c    |  15 ++---
 lib/xe/xe_query.h    |  13 ++--
 lib/xe/xe_wa.c       | 170 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_wa.h       |  19 ++++++
 tests/intel/xe_oa.c  |   4 +-
 tests/intel/xe_pat.c |  35 ++++++++---
 11 files changed, 278 insertions(+), 105 deletions(-)
---
base-commit: c35e1277421fed4160fe04067703843b9aa8878c
change-id: 20260714-wa_14026539277-c79e97449287

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

