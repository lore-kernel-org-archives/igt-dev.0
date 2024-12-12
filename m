Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4964FE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 07:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6610E0E7;
	Thu, 12 Dec 2024 07:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSrcVTa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9463510E0E7
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733987776; x=1765523776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wPVOcECOlWbYJFe0NNLCihnXQieg+BOAFy30lekFHQ=;
 b=cSrcVTa1JwMoHM8ZmxFkpA5qIMFIrzDqmh6WZhISOVwwCYwHR+rLE5nD
 adtk7SskHqGHQb85YfQWwn1Au09bV/khXyJbNurSys1laqB32spL50h/f
 Myp6/Jau1YGMw88F9aSQ1grewOBzLqyHmDRJ6QAk//DaEqzaF2/iAVzNU
 dJtyMIJQy/s7UVDVAvmOFymQP54kM856yKEYsnNnfbe+sw52YpbYn+Z88
 6xfj4Usc8Oqanq0ehU+D3ireXcwHDZZZ3Bbg/O4dz3Jbn4D5svItqNd8Q
 D6+oSUD9m0A88m4D8Vk+1YkBdleAqNUlypQmJLEia7QCft/hLzyFibCUE A==;
X-CSE-ConnectionGUID: a0poarJESfShTgIpKw+egA==
X-CSE-MsgGUID: B6oXlf78T4ioo5i7VOSNnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59787892"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="59787892"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:15 -0800
X-CSE-ConnectionGUID: FiSe8crET8iedI07On+55w==
X-CSE-MsgGUID: d4dqG1tyT+SE6rhzsg7Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96943199"
Received: from pbangalo-mobl1.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.201.113])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:11 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
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
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v12 0/3] igt_facts for fact tracking
Date: Thu, 12 Dec 2024 08:15:24 +0100
Message-Id: <20241212071527.64595-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

The patch series adds the library, unit testing, the lsfacts tool and
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
CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
CC: katarzyna.piecielska@intel.com
CC: luciano.coelho@intel.com
CC: nirmoy.das@intel.com
CC: stuart.summers@intel.com

Peter Senna Tschudin (3):
  lib/igt_facts: Library and unit testing for fact tracking
  tools/lsfacts: Add tool for listing facts
  runner/executor: Integrate igt_facts functionality

 lib/igt_facts.c       | 800 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_facts.h       |  47 +++
 lib/meson.build       |   1 +
 lib/tests/igt_facts.c |  21 ++
 lib/tests/meson.build |   1 +
 runner/executor.c     |  10 +
 runner/settings.c     |   9 +-
 tools/lsfacts.c       |  30 ++
 tools/meson.build     |   1 +
 9 files changed, 919 insertions(+), 1 deletion(-)
 create mode 100644 lib/igt_facts.c
 create mode 100644 lib/igt_facts.h
 create mode 100644 lib/tests/igt_facts.c
 create mode 100644 tools/lsfacts.c

-- 
2.34.1

