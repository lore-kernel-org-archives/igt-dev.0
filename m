Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4296BC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 20:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C132A10F0F8;
	Tue, 12 Mar 2024 20:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSRXf2UW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41110F0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710276877; x=1741812877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sSOg7TCx6+zWXg/NRD7ZoWL0JzfJMtzCy38UXXrHKBc=;
 b=BSRXf2UWjhlCOuylNDPqpTGvdxC7WGPdctQxW7YAZzFdpaukp7epYBXj
 HPbT+TJu0JEdkeJ0tLkWpGuJED/nRH8T9eEBA/1co5mRNf0D9X5ezVQ6F
 2go9TB32dh1fQztDHYWifUFiRXpA2SKFcaztF1KgrI8fvKIER3ozDnTmH
 UlqZmGngIOJgr8aFWm+JwV7t2g37iSYhPCRy3Ypj55COOQ+hblVlvNEsb
 dyAFx4aJOi6lkRHMw6mkwnva3P8qIZtcIYoyYzMugbNgMzqt0rD8bFpUx
 1Jrs97dxQFywzsEM2NzATNNArGrdmSVFxMq2ybccjmdcSTKVYkqcvS3gq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4871518"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4871518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42668537"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:54:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t v3 0/2] Add GT IP version query support
Date: Tue, 12 Mar 2024 13:54:29 -0700
Message-ID: <20240312205431.2869411-1-matthew.d.roper@intel.com>
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

Update the Xe uapi header to match the proposed XeKMD uapi (i.e.,
replacing one of the reserved qwords of the GT query with IP version
fields) and add support to the Xe query test.

v2:
 - Rename 'revid' to 'rev' to match kernel series update.
v3:
 - Resend for CI now that we're ready to land the KMD and IGT changes.

Matt Roper (2):
  drm-uapi/xe: Add IP version to GT query
  tests/xe_query: Print and sanity-check GT ip versions

 include/drm-uapi/xe_drm.h | 10 +++++++++-
 tests/intel/xe_query.c    | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0

