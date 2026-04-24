Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DB4FED3F2
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 18:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0EE10E041;
	Fri, 24 Apr 2026 18:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjzhvQNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316F310E14C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777056958; x=1808592958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=liB/yWPvHPvlkQmceC7gI0OIeXLzIYr8/Ut444+Sh/A=;
 b=AjzhvQNcSiFqG/ivtMZUQ58PSYDWNQskw5dBM2K9juwk21SQ1IOzfp5b
 0rX6nLq2NlNRN5eqOL+DbWbvaLSiKsoIEIjFVB/NRmFpBF5maf3PsCHcX
 b+VtcVmVdaMhKfRIXcGF41g9Cwh2lCIGBZWj4gCmD14e/Sjc0+QSW96AW
 l8amMtQAbOZcsJLc/ZjqQYFZJl3B63UXXtNJWG4ynuQA0hFHoJyDMrccG
 jrr7Fb2cYDcaXkz4BBeOM77+T0MxJnFF7NZ2xG/RFHEgQZ3AK+JyARKxR
 MB5NygpsLMdpearW/wv3aocXDtFOiQeDP9HE8oppCCAlCBe3uz76/ORmh Q==;
X-CSE-ConnectionGUID: MejIMXYcQSyxm9Nc1sRAsA==
X-CSE-MsgGUID: sDQOGMF6RO+J0veHC+hldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="100696726"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="100696726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:55:57 -0700
X-CSE-ConnectionGUID: XXTZGZHUQtOqp8KrwveoVw==
X-CSE-MsgGUID: EaBkKB7HR9uklmxlbGv/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256531473"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 11:55:55 -0700
Date: Fri, 24 Apr 2026 20:55:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v11 00/49] Unigraf integration
Message-ID: <20260424185552.435cmdlkzfklib7c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
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

Hi Louis,
On 2026-04-24 at 18:52:35 +0200, Louis Chauvet wrote:
> Hi everyone,
> 
> I am excited to share I currently have access to a Unigraf device,
> which I believe could significantly enhance the capabilities within IGT.
> This device has the potential to enable testing of low-level hardware
> features that are currently not covered. Specifically, Unigraf devices can
> assist in testing link training, signal integrity, HDCP, DSC, and more.
> 
> It's important to note that the Unigraf SDK is not open-source, and the
> communication protocol with the device is proprietary. As a result, I have
> utilized the libTSI.so library, which can be downloaded from [1]. In this
> series, I have not used the official TSI_types.h header because it was
> incompatible with C, so I hardcoded some necessary values.
> 
> This series is a bit longer than I expected, but can be splitted to be
> merged faster:
> -  PATCHES 1..17: Preparation for the series, I decided to move them at the
>                   start to avoid mixing unigraf and igt modifications
> -  PATCHES 18..20: Add basic unigraf configuration
> - *PATCH       21: Autoconnect unigraf when configured
> - *PATCHES 22..24: Add more unigraf configuration
> -  PATCHES 25..30: Add basic unigraf helpers
> - *PATCH       31: First basic unigraf test (connection, MST stream count)
> - *PATCHES 32..36: Add CRC calculation using unigraf instead of GPU CRC
> -  PATCHES 37..44: Move i915-specific helpers and create generic ones,
>                    clean some code
> -  PATCHES 45..48: Add unigraf configuration for link configuration
> - *PATCHES     49: Add link training tests
> 
> Each * is a new feature and the series can be partially applied to this
> point.
> 
> There is currently a crash *after* running IGT tests, I was not able to
> find why, so I would be happy if someone can direct me to resources/explain
> me how the igt_subtest and igt_fixture macro work.
> 

Can you share details? Or create a work item on IGT GitLab
and share links/reports there?

Regards,
Kamil

> Thanks,
> Louis Chauvet
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Changes in v11:
> - Add reviews and modifictions from Köry, thanks!
> - Link to v10: https://patch.msgid.link/20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com
> 
> Changes in v10:
> - Moved unigraf library to vendor subdirectory
> - Fixed stuff reported by Kory and Kamil
> - Link to v9: https://lore.kernel.org/r/20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com
> 
> Changes in v9:
> - Fix numbering in cover letter
> - Clarify authorship in array tests (file skeleton was generated by
>   Mistral, but edited by me)
> - Link to v8: https://lore.kernel.org/r/20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com
> 
> Changes in v8:
> - Fixed memory leaks found by Köry
> - Renamed list to array (I did not use the existing igt_list, it adds a
>   layer of complexity: new structure to store int + link, custom free
>   function...)
> - Added test for array
> - Link to v7: https://lore.kernel.org/r/20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com
> 
> Changes in v7:
> - Applied Kory's comments (I forgot to update this list ...)
> - Link to v6: https://lore.kernel.org/r/20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com
> 
> Changes in v6:
> - Fix missed conflicts on master, I don't know how I missed them, sorry
> - Link to v5: https://lore.kernel.org/r/20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com
> 
> Changes in v5:
> - Fixed all feedback from Luca (thanks a lot!)
> - Added PATCHES 39..40 to clean i915/dp (checkpatch warning)
> - Reordered 31..48 to be able to apply partially the series if needed.
> - Few modifications of 31..48 to rebase on master and apply some Luca's
>   comments
> - Link to v4: https://lore.kernel.org/r/20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com
> 
> Changes in v4:
> - Rebased on master
> - Fixed multiple unigraf callbacks
> - Created link training tests
> - Link to v3: https://lore.kernel.org/r/20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com
> 
> Changes in v3:
> - Rebased on master
> - Added support for MST
> - Repair autodetection and CRC usage
> - Link to v2: https://lore.kernel.org/r/20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com
> 
> Changes in v2:
> - Splitted in many commits
> - Add CRC support
> - Link to v1: https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com
> 
> ---
> Louis Chauvet (49):
>       lib/igt_kms: Add a detect timeout value
>       lib/igt_kms: Add helper to wait for a specific status on a connector
>       lib/igt_kms: Add function to list connected connectors
>       lib/igt_kms: Add helper to obtain a connector by its name or MST path
>       lib/igt_kms: Add helper to wait for new connectors
>       lib/tests: Add tests for array manipulations
>       lib/igt_kms: Add helper to get a pipe from a connector
>       lib/igt_kms: Expose dump_connector_attrs
>       lib/igt_kms: Expose reset_connectors_at_exit
>       lib/igt_kms: Expose connector_attr_set and igt_connector_attr_set
>       lib/igt_debugfs: Move debugfs helpers to the proper location
>       lib/igt_debugfs: Add const when make sense
>       lib/igt_amd: Add const when make sense
>       lib/igt_kms: Add const when make sense
>       lib/monitor_edids: Add helper functions for using monitor_edid objects
>       lib/monitor_edids: Add helper to get an EDID by its name
>       lib/monitor_edids: Add helper to print all available EDID names
>       lib/unigraf: Add used defines for TSI_Types
>       lib/unigraf: Add TSI.h
>       lib/unigraf: Initial Unigraf support
>       lib/igt_kms: Automatically connect unigraf on display require
>       lib/unigraf: Introduce device configuration
>       lib/unigraf: Introduce role configuration
>       lib/unigraf: Introduce input configuration
>       lib/unigraf: Add reset function
>       lib/unigraf: Add unigraf assert and deassert helpers
>       lib/unigraf: Add plug/unplug helpers
>       lib/unigraf: Allows sst/mst configuration
>       lib/unigraf: Add helpers to read and write edid
>       lib/unigraf: Add connector and EDID configuration
>       tests/unigraf: Add basic unigraf tests
>       lib/unigraf: Add unigraf CRC capture
>       lib/unigraf: Add configuration for CRC usage
>       lib/unigraf: add unigraf_get_connector_by_stream
>       lib/unigraf: Add helper to check timings received by unigraf
>       lib/igt_pipe_crc: Add unigraf crc calculation
>       lib/i915/dp: Move DP-related function for i915 to proper folder
>       lib/i915/dp: Rename functions to avoid confusion
>       lib/i915/dp: Add helper to get maximum supported rate
>       lib/i915/dp: Properly check sscanf results
>       lib/i915/dp: Use igt_output_name instead of private field
>       lib/igt_dp: Create generic helpers for DP information
>       lib/igt_kms: Add asserts to avoid null pointer dereference
>       lib/igt_kms: Add helper to get a CRTC from an output
>       lib/unigraf: Add lane count configuration
>       docs/unigraf: Add unigraf documentation
>       lib/unigraf: Add helpers to set maximum link rate
>       lib/unigraf: Add helpers to get the current LT status
>       tests/unigraf/unigraf_lt: Add test for link training
> 
>  docs/unigraf.txt                         |  81 +++
>  lib/i915/i915_dp.c                       | 392 +++++++++++++
>  lib/i915/i915_dp.h                       |  23 +
>  lib/igt_amd.c                            |   2 +-
>  lib/igt_amd.h                            |   2 +-
>  lib/igt_core.c                           |  32 ++
>  lib/igt_core.h                           |  10 +
>  lib/igt_debugfs.c                        |  96 +++-
>  lib/igt_debugfs.h                        |  15 +-
>  lib/igt_dp.c                             | 175 ++++++
>  lib/igt_dp.h                             |  30 +
>  lib/igt_kms.c                            | 857 +++++++++++++++--------------
>  lib/igt_kms.h                            |  41 +-
>  lib/igt_pipe_crc.c                       |  35 ++
>  lib/meson.build                          |  12 +
>  lib/monitor_edids/dp_edids.h             |   3 +
>  lib/monitor_edids/hdmi_edids.h           |   3 +
>  lib/monitor_edids/monitor_edids_helper.c | 126 +++++
>  lib/monitor_edids/monitor_edids_helper.h |  10 +-
>  lib/tests/igt_kms_array_diff.c           | 159 ++++++
>  lib/tests/meson.build                    |   1 +
>  lib/vendor/unigraf/TSI.h                 | 228 ++++++++
>  lib/vendor/unigraf/TSI_types.h           | 126 +++++
>  lib/vendor/unigraf/unigraf.c             | 913 +++++++++++++++++++++++++++++++
>  lib/vendor/unigraf/unigraf.h             | 106 ++++
>  meson.build                              |  14 +
>  tests/intel/kms_dp_link_training.c       |  19 +-
>  tests/intel/kms_dp_linktrain_fallback.c  |  57 +-
>  tests/meson.build                        |   4 +
>  tests/unigraf/meson.build                |  13 +
>  tests/unigraf/unigraf_connectivity.c     | 138 +++++
>  tests/unigraf/unigraf_lt.c               | 183 +++++++
>  32 files changed, 3437 insertions(+), 469 deletions(-)
> ---
> base-commit: a5c5d655807ead8204e01754b6434f0ecae40b96
> change-id: 20250425-unigraf-integration-11ed330755d5
> 
> Best regards,
> --  
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
