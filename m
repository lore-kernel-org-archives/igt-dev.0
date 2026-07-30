Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B91C54FD2
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 09:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FA010EE34;
	Thu, 30 Jul 2026 09:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKAqL15H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1FE10EE34
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785404322; x=1816940322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5FVZK5l3hSp3q+eFROD3RiU+pHTMQv1KoZ9SDGhDK3k=;
 b=jKAqL15HwrAbrkN5Q/RSmQs7IYlPk4YtkkdwjPsCJqAsoFF8gEhjhN6o
 LyTR0ouwIjd65qnOSxBnvdPTjz+1Cv6kFiP5RkBRgsT3yPJMasW1BkgdB
 pb21gKpwWtJG/J9NTDvBbwiCVgU1bLKRxcYWtxt8n/QuAbZqzprXJ/Dmz
 rsz2FdGZIidvq0EoFVmOVLcZ0IYvN3h34/T/XsHPI6la2mZ1vOH3n1yP9
 d+dst8kgu9zMzEt0bkl0ZoAgKmYDteos3WyXdvWdgWeY3sLyU43U99gct
 /MS3ZbsJqoNKmiI6RcbvLWyN1repbCIwLoD6ycDLyavsaMFsoAO5XpWrH g==;
X-CSE-ConnectionGUID: mSekkzf/TU+E4mr2+PraLA==
X-CSE-MsgGUID: FbqVe3VjTZWcl/GIjd1yPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85892994"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85892994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:42 -0700
X-CSE-ConnectionGUID: LbqhEWdMQOKiCIidwAmwDw==
X-CSE-MsgGUID: TY4spK2+SMmE6H5ETYyLAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="283605845"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:41 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH 0/2] tests/intel/xe_sriov_flr: Extend GGTT clearing checks
Date: Thu, 30 Jul 2026 11:38:05 +0200
Message-ID: <20260730093807.926456-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

In addition to GPA clearing, verify that VFID and the page present bit
are correctly set after VF FLR.

On the occasion, add a shared xe_ggtt library with a common GGTT
definitions.

Lukasz Laguna (2):
  lib/xe/xe_ggtt: Extract generic GGTT code into library
  tests/intel/xe_sriov_flr: Extend GGTT clearing checks

 lib/meson.build            |  1 +
 lib/xe/xe_ggtt.c           | 37 +++++++++++++++++++++++++++++
 lib/xe/xe_ggtt.h           | 30 ++++++++++++++++++++++++
 lib/xe/xe_mmio.h           |  3 +--
 tests/intel/xe_sriov_flr.c | 48 +++++++++++++++++++++++++++-----------
 5 files changed, 104 insertions(+), 15 deletions(-)
 create mode 100644 lib/xe/xe_ggtt.c
 create mode 100644 lib/xe/xe_ggtt.h

-- 
2.43.0

