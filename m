Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092B6D29DE0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 08:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA0510E45A;
	Tue, 13 Jan 2026 08:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lf5HyliT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703D10E45A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768291592; x=1799827592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FhfsWogTvZ+mxo6ZbiIboSdtr26HyDFbqorUTsPGuPE=;
 b=Lf5HyliTQOHhlyonxp/2ao2JutbGyJur3CK0y7SGauQcarFJiWS/6wmx
 RpxdYm98BsBqnrMnQcWoKweg21VGoPdW37tIF+0oNZQaKETFQsmpRR5W3
 wQbaQXavmjzH6hLVOH9JuWirdP9cO32PnCl3krHM9/HuQDArrXsLqSVJ1
 7w/yAfcySfjc3Is1DSy2CxQsifm6mN983Mbpp4ZXd2ak2iqw0K5WvCRVW
 Pw658hFR6bO2dRbT+1bJl0HgU6fb8Z3JjFd8kc/bMTloWg4syyJNGYN2K
 w1/GbANyNDZ8jYHbX8guV+urlaAipGYddhlO7AjTTWfYk9UqtbevXqQ6O w==;
X-CSE-ConnectionGUID: manJIMooTaOWAUVsG1QZ2g==
X-CSE-MsgGUID: N8aWZbY7TjKnOsDo2e8N7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72153001"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72153001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:06:32 -0800
X-CSE-ConnectionGUID: n7XL2eL2QRSi/ugJVAKkIA==
X-CSE-MsgGUID: zjDr34gKRzqDkfdqhgQNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204212069"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:06:32 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] runner/executor: Adaptive dmesg disk write 
Date: Tue, 13 Jan 2026 08:06:24 +0000
Message-ID: <20260113080625.208986-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

In current scenario  when disk usage limit is exceeded during a test, in
batch mode the test exits abruptly.  Implement a logging suppression
mechanism that drains kernel messages without writing to disk, allowing
the test to complete.

- Add suppress parameter to dump_dmesg() to control disk write
- Return 0 bytes written when suppression enabled (prevents disk writes)
- Write status message when limit is reached, then continue test

Sobin Thomas (1):
  runner/executor: Adaptive dmesg disk write to prevent premature test
    exit

 runner/executor.c | 65 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 11 deletions(-)

-- 
2.51.0

