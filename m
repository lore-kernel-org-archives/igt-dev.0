Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA55CCC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 22:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D6010E15E;
	Tue, 13 Oct 2026 22:25:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E2F10E15E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 22:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791930262; x=1823466262;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=eKkc7EDoihVQZFAUJX6IVt7T8lWPBM2iArnS+M7n3bc=;
 b=KxT4mnmSB/uIPKZMrl+broWo8MTjb3Fs3UWBGA4WBhljzmChGYbfmKvE
 pCnrfwXUaV7fF17L0xf0YHtZKa1MSznllLpONQH4Ps2Uq3fu4vgikNu7w
 VA+Dwz6dOWxi75gRE1xiMwCOl8vyWdnHN4rQeuC3pGylo3rHwvbqmX/RF
 nOhaa/h2rha4yDnTJpb9M7/lqzoJvq8nUAWU055wcbjOrLtqYCYx8Ahuz
 E4tCZJ4PFzkwl+S++5VnxOUnSS+D1BnRXuvCBJnszYnp88l+1j7zM+CJK
 IIxTCLe7/R+ILW2sPVoeddUH0lD60gdo9Ken3ZZOJ5z+KM4z+bFwdxRH5 Q==;
X-CSE-ConnectionGUID: 2si2EuS3TZOgrkjf65p0GQ==
X-CSE-MsgGUID: aledjrj7QW6ICkzjL03ZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="566017"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="566017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:21 -0700
X-CSE-ConnectionGUID: 8lCDVwsMTPShdXIqMPHfYg==
X-CSE-MsgGUID: ytHf6ujTTwKU1XlWhoKCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1713173"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:19 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v2 0/2] Fix igt_runner hang and resource leak
 associated with pw-reserve
Date: Tue, 13 Oct 2026 19:23:34 -0300
Message-Id: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQ6CMBBEf4Xs2TVtIUU98R+GQ4EFNtFC2qZqS
 P/dpvHmcWby3hzgyTF5uFUHOIrsebM5qFMF42rsQshTzqCE0lIIjT5sO+4vdJTJSGhI16Jpzay
 mBjK1O5r5XYx3YFwwQJ/rlTPoPuUnyjL+lO2fMkoUaIZhqodLe9VSdWwDPc7j9oQ+pfQFLUqAS
 bUAAAA=
X-Change-ID: 20261006-stop-pw-reserve-ae63047af2d4
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Daniel Charles <daniel.charles@intel.com>
X-Mailer: b4 0.15-dev
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

When running igt_runner on an interactive SSH session we realized that
the runner would hang when testlists contained test cases that would
unbind/rebind (or unload/reload) the driver multiple times.

Some debugging revealed that the hangs were caused by pw-reserve
processes created by IGT not being properly terminated.  Let's fix
that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- Incorporate review feedback (see patch changelog for details).
- Link to v1: https://patch.msgid.link/20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com

---
Gustavo Sousa (2):
      lib/igt_core: Check if helper proc was alive before kill()
      lib/igt_aux: Call pw-reserve with execlp()

 lib/igt_aux.c  | 11 ++++-------
 lib/igt_core.c | 21 +++++++++------------
 2 files changed, 13 insertions(+), 19 deletions(-)
---
base-commit: aada5ae74aa135d2b448e25ec417f4f0dee9439c
change-id: 20261006-stop-pw-reserve-ae63047af2d4

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

