Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6422A606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RdAigNA/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A3910E2A8;
	Fri, 23 Oct 2026 21:04:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519B410E2A8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789389; x=1824325389;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=QgItaur1H2tyvZzoOVfOw/4Yd7ZSK2vC5e3MWKET/FY=;
 b=RdAigNA/QSC2Yd44NQWeM/7Ly8CdKSNt9ItFfBuVdu8FJ4FJhVoJlSSF
 g5wj3pTBWn4Ayvjl+rdeMjPGgMdG8+9qLQY1kn9nHXB/E2WduKSX9mjnJ
 NX1rTVPzX2Qzct82d/uwqvdyhXTrO3rEgYeVzkmT77nJHNPwR7cDvw92c
 zf8b5xFAZdYFlL2jvj6SL1CFo9jQQwj9qUczs0S7T5BJqe1BhtA5YV1av
 nurCuG1VxYmL4ZgjwaI+FUndrM6CAhwTK45jy1vseOzDarASQArVHweiu
 PE1tn9api9qJ86Ukbdw7TL/Eq5/3RcwNG2xOtXra3EfAmEvxtTc0ECXMC w==;
X-CSE-ConnectionGUID: cAUbeyWeSCKmmT6pMAt1Eg==
X-CSE-MsgGUID: 7shjabO+RcO52Kj5XEKE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457457"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1457457"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:06 -0700
X-CSE-ConnectionGUID: pTwXsO3rRYe6uxBR3yLSEw==
X-CSE-MsgGUID: vZg443NuS26iRduLI3hLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5585757"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:03:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v3 00/11] Implement Wa_14026539277
Date: Fri, 23 Oct 2026 18:02:35 -0300
Message-Id: <20261023-wa_14026539277-v3-0-b8723ececb7f@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQrCMBBFryJZG2mmidO48h4iUtNpO6CtJCUqp
 Xc3xIWiy/eH92YWgTxTELvVLDxFDjwOCcr1Sri+HjqS3CQWUMC2QKXlvT4pncCUFhClQ0sWtbZ
 QoUjSzVPLjxw8CJadnMQxzT2HafTP/CaqfHwXQf0Wo5KFLJzSSEQttfWeh4kuGzdecyrCR7dQ/
 umQdAPV2aABaxv41pdleQEvSy3s8gAAAA==
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
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Changes in v3:
- Add tweaks related to igt_warn_on() to avoid CI noise like
  https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15892/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html .
- Link to v2: https://patch.msgid.link/20260923-wa_14026539277-v2-0-528b575299d2@intel.com

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

 lib/intel_pat.c       |  43 +++++++--
 lib/intel_pat.h       |   5 ++
 lib/intel_wa.c        |  66 --------------
 lib/intel_wa.h        |  11 ---
 lib/meson.build       |   2 +-
 lib/tests/meson.build |   1 +
 lib/tests/xe_wa.c     |  42 +++++++++
 lib/tests/xe_wa.h     |  12 +++
 lib/xe/xe_query.c     |  15 ++--
 lib/xe/xe_query.h     |  10 ++-
 lib/xe/xe_wa.c        | 240 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_wa.h        |  19 ++++
 tests/intel/xe_oa.c   |   4 +-
 tests/intel/xe_pat.c  |  35 ++++++--
 14 files changed, 403 insertions(+), 102 deletions(-)
---
base-commit: e40d80d42f9b8f1d22475b7f609252a34cd7355b
change-id: 20260714-wa_14026539277-c79e97449287

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

