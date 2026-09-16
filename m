Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E73C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B597F10E043;
	Wed, 16 Sep 2026 11:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QybaIITp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A8810E69C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557091; x=1821093091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vi4L8EXl0IZ9wMsJm74JKicmUzX6UjxF7YfYQdpag84=;
 b=QybaIITpvZQNv/BeKa+cerlqVNMhlhVA7yVJg/rGDq8BI94vrOU6FYfB
 RNJFALkoKzGL0Agc+C7p+d6GGJdq61cnReGxblU86NGsszjBX8gsxo6sW
 IvMmlnhj7q/6mNavF7qiHUrINFzSzhefRP7KR/3XN/rg1xavaBwno1Vsq
 OA7hszYlZf0xDFEJ6L/bDCV2f/BVpjPbh7wLZEjVfa4JdkdeO/Hwgh+qo
 ZW1mAHzm7Ut/Xm2HSYhpbXy2OxhzSkejKu8lXbRx7H2wsi2GUPz4FGa0Y
 Cz2o+wbdwF3BSYw1F1ORwciFyjw/XXMpGltc6HUoYUC7nwHQDkTm5s0wZ A==;
X-CSE-ConnectionGUID: jbOyjT0MTl6lKzCxUEpTuw==
X-CSE-MsgGUID: lwpueyjeS7iWMDANvw11/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440506"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:30 -0700
X-CSE-ConnectionGUID: dAtHZTnPRtGAQ2S3TRS3/Q==
X-CSE-MsgGUID: 591EWeVfTaOs7Z4iCxunzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800602"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 00/16] tools/intel_hdcp: HDCP tool updates
Date: Wed, 16 Sep 2026 16:36:53 +0530
Message-ID: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

intel_hdcp is the manual bring-up tool for HDCP: it puts a picture on a
protected output and lets an operator drive Content Protection from the
keyboard.

This series handles below fixes.

Fixes first. The tool only touches HDCP Content Type on connectors that
actually have it, and only reads Content Protection where it exists. The
display no longer freezes while the tool waits for you to type, because
it does not hold the display lock while reading stdin. Shutdown is now
cooperative rather than killing the input thread mid-operation, which
could leave a lock held and hang the exit. 'q', Ctrl-C and EOF all take
the same path out and set Content Protection back to UNDESIRED, so the
tool no longer exits leaving the link protected. If no connected output
supports Content Protection, it says so and stops instead of crashing
later, and it checks that HDCP is applied to the same connector that the
picture is on.

Then reporting. A version line at startup and --version tell you which
build a log or a photo of the screen came from. Every Content Protection
change is logged with how long the previous state lasted and, when the
link comes up, how long the kernel took to authenticate. On exit you get
a summary: how many times it authenticated, how many times the link
dropped, the min/avg/max authentication time and the total protected
time, ready to paste into a bug report.

The rest is the on-screen overlay, which is what you watch during a demo.
The state badge now shows what the kernel reports instead of what was
asked for, so it no longer goes green on a link that never came up. The
top bar names the output, connector id and sink capability; the bottom
bar shows elapsed time and the key legend. A band sweeps across the
picture so you can tell a live frame from a frozen one, and the last few
transitions appear under the badge. Drawing alternates between two
framebuffers so the tool is not painting into the one on screen. The
overlay runs from startup rather than only after HDCP is requested.

Santhosh Reddy Guddati (16):
  tools/intel_hdcp: Don't set HDCP Content Type unconditionally
  tools/intel_hdcp: Read stdin outside the display lock
  tools/intel_hdcp: Exit cleanly on quit and on Ctrl-C
  tools/intel_hdcp: Keep the picture and the protected link together
  tools/intel_hdcp: Report the tool and IGT version
  tools/intel_hdcp: Don't read Content Protection from every connector
  tools/intel_hdcp: Report content protection changes as they happen
  tools/intel_hdcp: Print a session summary on exit
  tools/intel_hdcp: Add Content Protection state helpers
  tools/intel_hdcp: Rework the on-screen overlay
  tools/intel_hdcp: Run the overlay for the full session
  tools/intel_hdcp: Show the transition log on the display
  tools/intel_hdcp: Report authentication time
  tools/intel_hdcp: Actually select HDCP1.4 when it is asked for
  tools/intel_hdcp: Colour the overlay by HDCP state
  tools/intel_hdcp: Say what the numbers in a transition line mean

 tools/intel_hdcp.c | 1092 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 922 insertions(+), 170 deletions(-)

-- 
2.43.0

