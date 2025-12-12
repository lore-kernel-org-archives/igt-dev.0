Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9901D44164
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 10:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CB510E30C;
	Fri, 12 Dec 2025 10:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRGSpQ2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AEE10E30C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765536315; x=1797072315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sAAaQ+HWTdVjFGAdmFrbe5UbVKvjtwd2zfPKxu+/U6w=;
 b=ZRGSpQ2U9OC2PRxC52JJ3x+q+GgqOpxt1RQayMiyzUF7a8k7Aikf7pIn
 yb90vfAyKbZEAQIr6ZwARu5PTbKMaVqY9och0Tflq2IYBpW6eYeTlTiRe
 uatEdtHhPHZt1IDnsIgyFk059vS8tZuf6W2oUgpHBhtRNDbxeAriTQyay
 E8eolzv4DcOtm4ScnJMk2vuz3KxEgxwwho1Ld9/dE2E+egL7sySlToHDL
 Wcha4rJWUZiImO1Y59bGa929u5yDSN8b+SoRUMrFsPwuze4p8bjL7KD6/
 fpSJouzjVsOiVBnrhPRFk7ok3PzfskoCJeV2VltHY+ezKOZlvzrj0W/Qu Q==;
X-CSE-ConnectionGUID: gAVb+Mg8T2Oqafr8Bw9mkQ==
X-CSE-MsgGUID: GvrjmHEiQz6DnJjJDtpVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78237376"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78237376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:45:14 -0800
X-CSE-ConnectionGUID: CucRrYBKR9qqTj3c9BL4RA==
X-CSE-MsgGUID: e2ls+vamTy6uDh+wgrg2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196135950"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.95])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 02:45:13 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 0/1] docs: update for platform-neutrality
Date: Fri, 12 Dec 2025 11:45:02 +0100
Message-ID: <20251212104505.342095-1-pawel.sikora@intel.com>
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

Dear IGT Maintainers,
I am submitting this patch to update the documentation to better
reflect IGT's current multi-platform scope.

While IGT historically focused primarily on Intel GPU testing, 
the project has evolved to support multiple GPU platforms. 
However, some documentation still contains language that suggests 
Intel GPUs remain the primary or exclusive focus, which may mislead
new contributors and users about IGT's current capabilities and direction.

This patch updates Intel-specific language in the documentation
to use more platform-neutral terminology.

Kind regards, 
Pawel

Pawel Sikora (1):
  docs: fix intel-specific descriptions

 docs/faq.md       | 15 +++++++++++----
 docs/platforms.md | 23 ++++++++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.51.0

