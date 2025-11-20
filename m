Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29CCCF857C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6910E0F0;
	Thu, 20 Nov 2025 10:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec2tcygx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDFC10E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634202; x=1795170202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXtP92FG9XYWW7Enol5bd+aefwFTosBhfmcuzBxAFFU=;
 b=Ec2tcygxZN7lopvU4EM5mwuxHeWsmAztPMRTU5IrfnWUZBKPXqn1w6Af
 w+OvsxkwLUpSngjej1x9913IhXQWHyzaMcR7a8CMlPyU3cnnoDC5+9Kh0
 xN4DaFHxZk7e7uarBPUaRo6YIrkktQEg0DwR8QkuYEbcZYA26iquKPEwo
 u2B0VrL+m3u5s1NNcXh2tgUQIWN5I7KX0CTUE8JyqX6nnuwlnmRqfRiGS
 nnhzG1ECUHM4GDx6qgcocWvJEC5Tn7FKCzKXpPbmGXrE2Hh+ki97ZYS+F
 fv5o+pNZdehiXOy96sZf6ae32PpWV5CWGXULaRetpd3DOKyJgu5ZNpqyD A==;
X-CSE-ConnectionGUID: rfJEMmpLQxyA6+hwjlTpkQ==
X-CSE-MsgGUID: 2lTOZg5WQU+WpbqlxwgcXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77161550"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="77161550"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:21 -0800
X-CSE-ConnectionGUID: jnJQnZ70Rsiyw2URG9GuiQ==
X-CSE-MsgGUID: Lr7f/WttQ/iLRxc1jcEWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221965983"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 0/2] fix CRTC index to pipe conversion, cleanup
Date: Thu, 20 Nov 2025 12:23:12 +0200
Message-ID: <cover.1763634045.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There's a bunch of conflation with CRTC index and pipe usage in IGT. Fix
one obvious mistake, and drop the old ioctl fallback for CRTC id to pipe
mapping.

There's likely more to come, but start off small.


Jani Nikula (2):
  lib/igt_kms: Always return CRTC index from
    kmstest_get_pipe_from_crtc_id()
  lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping

 lib/igt_kms.c | 45 +++++++++------------------------------------
 1 file changed, 9 insertions(+), 36 deletions(-)

-- 
2.47.3

