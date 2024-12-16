Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6041DE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 15:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6A110E6C9;
	Mon, 16 Dec 2024 15:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiLWN5fH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E50910E6CD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734362107; x=1765898107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I5/xl8rDSP2571/kC9J+W9iwjoa7dYmwn46/Rwd+Aio=;
 b=PiLWN5fH24u4053Ibjf7ObQ0hVv6PCoMgywnMU3Je9rSBrIG6VJBLaHx
 R6BHh21+m4vC/H5IuGcJeHOlX6PnHvGoA9O7PD2p9t3HV5qH0ODHRBufO
 JlKh65IDt7YxNjQji2KSBLkED6Li51XvdY67UsUfhx/otfKYLTEnYAnYu
 8WeJyoVRF1TOOpOvpqU5oF1RqrBjXGyn11IbCYl5pWDow1t+8Iu2MIJT+
 W6a7UGKK+e1lp1F8uY84aDhdGJlEOWQ/OplmvKkCppbpSqwWhRovjnCwU
 QcS3dbpUja3T1PzFHLYoOyhn8F7fzlYO6jgUrKovDxErs/2v4geHbiEhM Q==;
X-CSE-ConnectionGUID: 0Vgt0A4iT8ObvdOoqbmvdw==
X-CSE-MsgGUID: sINoNq3xTsm/PUynUb/sQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="60137429"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="60137429"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:15:07 -0800
X-CSE-ConnectionGUID: r/rMYFj9T3e+9+bGtVLX0w==
X-CSE-MsgGUID: lR28USWvQIaS0v1oKhFdhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128208752"
Received: from courtneypc.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.202.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:15:02 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 himal.prasad.ghimiray@intel.com, katarzyna.piecielska@intel.com,
 luciano.coelho@intel.com, nirmoy.das@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v14 resend 0/3] igt_facts for fact tracking
Date: Mon, 16 Dec 2024 16:14:17 +0100
Message-Id: <20241216151420.43042-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

igt_facts is a library that tracks facts about the system and reports
changes to the facts. This is useful for tracking changes in the
system configuration that may affect the test results.

The patch series adds the library, unit testing, the lsfacts tool, and
make changes to igt_runner to use the library. For igt_runner the facts
are disabled by default. To enable them use the command line argument
-f or --facts.

Here's 3 reasons why igt_facts seem useful:

  - CI itself performs some of these checks in the pipelines (loaded
    modules, kernel taints before testing starts, likely more in the
    future), so this could simplify fetching this data if we just
    parsed the IGT lsfacts output.

  - Simplicity: allows for quick examination of runner logs,
    identifying successful tests and isolating those that left the
    system tainted or caused the GPU to drop off the bus. This enables
    efficient filtering of relevant logs to pinpoint issues near
    reported fact changes. While this information could also be derived
    from dmesg outputs or standard error logs, igt_facts is more
    straightforward and convenient, particularly for non-kernel
    developers tasked with review and debugging.

  - It also makes it easier to notice passing tests that leave the
    system in an unclean state.

Here is an example of the output of igt_runner when using igt_facts:

  [229.606139] [FACT before any test] new: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
  [229.606305] [FACT before any test] new: kernel.is_tainted.taint_warn: true
  [229.608841] [001/267] (600s left) xe_module_load (load)
  [229.641224] Starting subtest: load
  [230.613328] Subtest load: SUCCESS (0.973s)
  [230.678868] [FACT xe_module_load (load)] new: hardware.pci.drm_card_at_addr.0000:03:00.0: card0
  [230.680801] [FACT xe_module_load (load)] new: kernel.kmod_is_loaded.xe: true

v14:
 - remove duplicated code from igt_facts_scan_pci_drm_cards()

v13:
 - remove enabled from igt_facts_config
 - use settings->facts instead of igt_facts_config.enabled
 - update serialize_settings() and read_settings_from_file() to save
   and restore igt_runner settings to and from disk
 - update igt_runner unit testing to test that:
   - Facts are disabled by default
   - Facts can be enabled by command line arguments
   - The choice about facts being enabled or not is saved to disk
     and restored from disk

v12:
 - split the patch in 3
 - updated comment style on .h files
 - updated module list to be closer to lib/drmtest.c and to
   include a comment mentioning lib/drmtest.c
 - Added a configuration struct to track the command line argument
   and udev status.
 - Add mechanism to disable udev to prevent error message spamming
   when udev is not available.
 - runner/executor: moved the call to igt_facts_lists_init() to after
   dry run check.
 - moved variable definitions from igt_facts.h to igt_facts.c
 - added #ifndef guards to igt_facts.h
 - removed double new lines
 - updated comment style that were still using //

v11:
 - fix typo

v10:
 - fix memory leaks from asprintf (Thank you Dominik Karol!)
 - fix comments for consistency (Thank you Dominik Karol!)

v9:
 - do not report new hardware when loading/unloading kmod changes the
   string of the GPU name. I accidentally reintroduced this issue
   when refactoring to use linked lists.
 - add tools/lsfacts: 9 lines of code that print either the facts or
   that no facts were found.
 - fix code comments describing functions
 - fix white space issues

v8:
 - fix white space issues

v7:
 - refactor to use linked lists provided by igt_lists
 - Added function arguments to code comments
 - updated commit message

v6:
 - sort includes in igt_facts.c alphabetically
 - add facts for kernel taints using igt_kernel_tainted() and
   igt_explain_taints()

v5:
 - fix the broken patch format from v4

v4:
 - fix a bug on delete_fact()
 - drop glib and calls to g_ functions
 - change commit message to indicate that report only on fact changes
 - use consistent format for reporting changes
 - fix SPDX header format

v3:
 - refreshed commit message
 - changed format SPDX string
 - removed license text
 - replace last_test assignment when null by two ternary operators
 - added function descriptions following example found elsewhere in
   the code
 - added igt_assert to catch failures to realloc()

v2:
 - add lib/tests/igt_facts.c for basic unit testing
 - bugfix: do not report a new gpu when the driver changes the gpu name
 - bugfix: do not report the pci_id twice on the gpu name

CC: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
CC: Helen Koike <helen.koike@collabora.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Maíra Canal <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>
CC: Petri Latvala <adrinael@adrinael.net>
CC: Rob Clark <robdclark@chromium.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
CC: Swati Sharma <swati2.sharma@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: dominik.karol.piatkowski@intel.com
CC: himal.prasad.ghimiray@intel.com
CC: katarzyna.piecielska@intel.com
CC: luciano.coelho@intel.com
CC: nirmoy.das@intel.com
CC: stuart.summers@intel.com

Peter Senna Tschudin (3):
  lib/igt_facts: Library and unit testing for fact tracking
  tools/lsfacts: Add tool for listing facts
  runner/executor: Integrate igt_facts functionality

 lib/igt_facts.c       | 779 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_facts.h       |  47 +++
 lib/meson.build       |   1 +
 lib/tests/igt_facts.c |  18 +
 lib/tests/meson.build |   1 +
 runner/executor.c     |  14 +
 runner/runner_tests.c |  11 +-
 runner/settings.c     |  10 +-
 runner/settings.h     |   1 +
 tools/lsfacts.c       |  27 ++
 tools/meson.build     |   1 +
 11 files changed, 908 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_facts.c
 create mode 100644 lib/igt_facts.h
 create mode 100644 lib/tests/igt_facts.c
 create mode 100644 tools/lsfacts.c

-- 
2.34.1

