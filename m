Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDA410A62C5
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C72110E926;
	Thu, 26 Mar 2026 12:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hou7NixF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B610E92C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529628; x=1806065628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K4D+5MNlQwlh++BZ4x4fdhcX5han5e+ntAPJXAho5Wk=;
 b=hou7NixFgMofOJJe2KPlyxgDINfKvTXAZhlHXafobhz6vd3XGbsiaMh4
 Ks0QGj+EZZaajvisPuUlv2E3BAFZ5nj08sJOtoEFL0oZyWSi9F3pzeZrr
 G/ag3/BslXl+w/s5TAdJHah4UXGSI3AWf82yB6wnWCTphD0k3zbd8Uiyo
 /X7BPh8oD5qhZxYLWaskmSqcKFM9rm4mpv2/81MR9gx2fMqMWXQ0b9AUl
 0Z9VGhxmbJB9EmQpT4j5I2/P9yszt5Dw17B21kjuR4tHUO7unrdrvu8LA
 A594OdtflRu4Ifn6+ka5fGT7IuVFN6/oMyQryiRYqMfvGaDeRg6gVf0kw A==;
X-CSE-ConnectionGUID: exTOxIUmTBqELdOOcRlwZw==
X-CSE-MsgGUID: D3kg+uA7QV6I/WHCweHrww==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78183015"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78183015"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:53:47 -0700
X-CSE-ConnectionGUID: xWIpYahMQXmYCV8G7KhrYA==
X-CSE-MsgGUID: 6NQIeyF6T0mv6PrAv5SoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220584625"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:53:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t v3 0/5] Prepare for returning NULL from
 igt_crtc_for_pipe()
Date: Thu, 26 Mar 2026 14:53:34 +0200
Message-ID: <cover.1774529527.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remaining patches from [1], as [2] was split out and merged separately.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1774002591.git.jani.nikula@intel.com
[2] https://lore.kernel.org/r/cover.1774342824.git.jani.nikula@intel.com

Jani Nikula (5):
  tests/amdgpu/amd_multidisplay_modeset: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_joiner: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_joiner_helper: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_pipe_b_c_ivb: Prepare for returning NULL from
    igt_crtc_for_pipe()
  tests/intel/kms_pipe_stress: Prepare for returning NULL from
    igt_crtc_for_pipe()

 tests/amdgpu/amd_multidisplay_modeset.c |  2 +
 tests/intel/kms_joiner.c                | 66 ++++++++++++++++++-------
 tests/intel/kms_joiner_helper.c         | 16 +++---
 tests/intel/kms_pipe_b_c_ivb.c          | 28 +++++++----
 tests/intel/kms_pipe_stress.c           |  4 ++
 5 files changed, 81 insertions(+), 35 deletions(-)

-- 
2.47.3

