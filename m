Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D9AC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 16:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2A1125D6;
	Fri, 22 Mar 2024 16:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEbgl0l+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F7D1125D6
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 16:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711125175; x=1742661175;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OUPaF+s85z2YCh4T29cB4ZsAwFWfinoqscPNQIDMgnM=;
 b=ZEbgl0l+Un0C0ANg+9PKCcH6mTh7CGAnQn2TBzExfHsiSQ/Rw/YylWAM
 DcxgL5tEnvpMTrRMGTnYIwhl5jwk3MecAUEGt7TVe2Gnt8rePIeJnm/kl
 j0ZpqwA3WFl/4HF/DzDHrnoR5Cclja32i9KtmX3HlPjmuD9xL5D/YP2B9
 /80Up70XbGgrFB+bIo3329bqDumMTof+d+cLKYsdYHin6q7cDEK7t39yq
 yS2t8rQOJjP+TbjTurFyIn40UL86Bl8pWpzPzKWe5ISrAStbAgyxFz5/Q
 nP8jTiFbc9VknwNozALoMKMHb/gmdZiKnHN5l5B/5TOEwU82sq7cyYZpZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17574997"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17574997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="827783529"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="827783529"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 09:32:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 18:32:51 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/5] tools/intel_vbt_decode: Improve panel type handling
Date: Fri, 22 Mar 2024 18:32:46 +0200
Message-ID: <20240322163251.11102-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Implement real support for panel_type2, and for handling
panel_type==255.

Ville Syrjälä (5):
  tools/intel_vbt_decode: Extract dump_panel()
  tools/intel_vbt_decode: Extract panel_str()
  tools/intel_vbt_decode: Change panel indicator from * to (1)
  tools/intel_vbt_decode: Also dump the second panel (panel_type2)
  tools/intel_vbt_decode: Optionally determine panel type from EDID

 tools/intel_vbt_decode.c | 184 +++++++++++++++++++++++++++++++++------
 1 file changed, 157 insertions(+), 27 deletions(-)

-- 
2.43.2

