Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E79FEB7ED7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2902210E176;
	Wed,  4 Mar 2026 12:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5sQuvCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051D10E176
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626664; x=1804162664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jtcdeKOVwf+HO2GDmRzX10dXBUxXNlrinIpLONpL2hw=;
 b=m5sQuvCXv4gmYlBNu29lWFDXkjfJrtzgpJTZrwJ+XBsZklQNuWCmZVl2
 I3G2Y2H93YI9R2czTUFiVFMUsDMpem0vPbQzKUq6UL3d74kTAf/xOB5Sn
 M75jB+2ur2mcMCd9Tn36UjpYlD8kKJHbHnLtTUchsB0XBS3wtYN/G1SiK
 tkRap6uuvLQQlMr/trn3EP0/cxy0IN1oLvARHnCmmbqgMfmBI2Q7QWVIR
 mzgggGJS7Ot/WmVK3y3qf97rSJt2sefTAz6AWX1dZjiRGKJLGf2D3kqbu
 2lZsOKWdi1ER0x/y2W8+urzjBDLKuMdrS32revlY/a01AoONNifRTMTOD g==;
X-CSE-ConnectionGUID: HbnCfDHITbqI/+/CdCBiwA==
X-CSE-MsgGUID: wK2r8GXgRKye9xb6GcnsrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84773819"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84773819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:44 -0800
X-CSE-ConnectionGUID: cTxDYq7DQi+72ovht6u/ig==
X-CSE-MsgGUID: 1mAvIreCSVavczrMdmr1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241333424"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [RFC PATCH i-g-t 0/2] Xe driver watch-queue implementation and example
Date: Wed,  4 Mar 2026 13:17:23 +0100
Message-ID: <20260304121725.161213-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

This series aims to provide an example how to use the xe driver watch-queue
interface. The interface provides a means for user-space render clients to get
asynchronous notifications with metadata attached.

The primary use-case would be the LR mode rebind worker running out of
memory. Currently the VM gets killed, but it should be possible to
recover, unbind buffer objects and restart.

Thomas Hellström (2):
  lib/xe: add xe_watch listener for watch queue events
  tests/intel/xe_exec_compute_mode: Add a listener for file events

 include/drm-uapi/xe_drm.h          |  46 ++++++
 include/drm-uapi/xe_drm_events.h   |  65 +++++++++
 lib/meson.build                    |   1 +
 lib/xe/xe_watch.c                  | 221 +++++++++++++++++++++++++++++
 lib/xe/xe_watch.h                  |  80 +++++++++++
 tests/intel/xe_exec_compute_mode.c |  59 +++++++-
 6 files changed, 470 insertions(+), 2 deletions(-)
 create mode 100644 include/drm-uapi/xe_drm_events.h
 create mode 100644 lib/xe/xe_watch.c
 create mode 100644 lib/xe/xe_watch.h

-- 
2.53.0

