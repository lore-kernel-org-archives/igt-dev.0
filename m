Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AE4E73163
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 13:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A94010E2B0;
	Mon,  2 Feb 2026 13:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtTmybZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987C10E2B0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770038205; x=1801574205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ySZ8CIGd/EtfEiyDiOpWpu6fbzAVv38YQgcDkBnXTu0=;
 b=KtTmybZvLQwPh5MtriDLH9wOy9WLauDv9kUOKCkcKWrUICNYgYFi9SPH
 PN40xpxZ3FFnyzR7YtnJ58IYvZ+lMYAW9ko4a2yE/sq4nPYUjayLkv8cT
 8hmbqafHoVXInp3N7kF+xTnkvssmGS9OrHugii85+rE5X+KwhXF3d+qTY
 cLGMD/rIrNEmokYpBJjGoZLdkNj0/+23jBGfhmuD3fnS4HXc4CajCeGQO
 5qHfX9t8eIOs/4NM+LK82mFkQhUp+Su0qkUKNfHuXoUEbL90kmjZzow/x
 7sqQYXB74gO7UNOCvtJMdfNSgqj7Y4AbqVTUrrCsKreOyOvLLT6RbKxJX w==;
X-CSE-ConnectionGUID: NLnaqmY7Q/2PxUupEzjZcg==
X-CSE-MsgGUID: x6viHsQpQ7W7XfGoXDlTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75044379"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75044379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:45 -0800
X-CSE-ConnectionGUID: wDsVyPgKTIiku78cHOu5yg==
X-CSE-MsgGUID: A0TtMnxhSy+kyl7Yc6lfAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214050794"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 05:16:44 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 0/3] Run PSR2 and PR tests on panel supporting both
Date: Mon,  2 Feb 2026 15:16:19 +0200
Message-ID: <20260202131622.1369539-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently we are running only PR tests on panel supporting PSR2 and
PR. Running PSR2 tests as wel on such panel would provide us valuable
information. This patch set is addressing that.

Also some other improvements is made and code is simplified:

 - drop some complexity from fixture for detection of working PSR
 - instead of "not run" "fail" on setup where PSR is broken already
   before kms_psr2_sf testcase is executed.
 - drop et_flag from data_t and detect need for Early Transport check
   on fly.

Jouni Högander (3):
  tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
  kms_psr2_sf: Check pipe and output validity for Selective Fetch test
  tests/kms_psr2_sf: Allow testing of both PSR2 and Panel Replay if
    supported

 tests/intel/kms_psr2_sf.c | 241 +++++++++++++-------------------------
 1 file changed, 79 insertions(+), 162 deletions(-)

-- 
2.43.0

