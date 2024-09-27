Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3683CDD1B2
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7130F10EC61;
	Fri, 27 Sep 2024 14:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8BPorXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E800410EC62
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445840; x=1758981840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5gNAzOLV/4RIIb7ZKV+iFkFxBzjrtfEspu/dlWABX9I=;
 b=b8BPorXhQ/U0IIryM/mENYowKEK0jb2LrGulL15DalYZKDcxIbnwAy0W
 c4moL1b0jj5db8Ja3ZNxsHJWpWfAjH5/NzUFy+6sefhA9H8KtAdLxeSPb
 Yzn91nzR+fESAJRV3PInOOiN9L5d/f79Y8ZuHrzawzpYSMS1kVosc4q2J
 BWdp5uUhPNssxK2tf92X+rXWLyujJQfyVPELvR5AYoedOFy/J1At4W8zO
 5ucT1XXwEaHtVsVFiLg63kNmmm09OBF+oiz+SUXQdnS3Ny6adK00qFNcA
 yBBUU1xeafOQvp8IIsJXtziljq+i0qy0cxQd2WxnY4ykCS9j2lWezzgGk Q==;
X-CSE-ConnectionGUID: tgup5wPqThyWJsazy9C1Ww==
X-CSE-MsgGUID: RY/TzzfESFWvlRXyUjVa/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30480492"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30480492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:04:00 -0700
X-CSE-ConnectionGUID: TXhFEWgbQCqwdh07CZ6gFg==
X-CSE-MsgGUID: 9eQxx0CjTFOU0gpC9AE92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72203133"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:58 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 4/4] lib/xe_eudebug: Increase default pipe timeout value
Date: Fri, 27 Sep 2024 16:53:35 +0300
Message-Id: <20240927135335.1107326-4-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
References: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
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

Our discovery tests are quite heavy, there can be tens of
threads of clients and debuggers racing against eachothers.

If there are lots of debugs enabled in kernel config, it is
in real of possibility to end up in a situation where one
client or one debugger really was starved more than 25 seconds.

This timeout is used in communication between test framework,
debuggers and debuggees and thus if we timeout on it,
it will lead to confusing errors in middle tests.

The tradeoff is that for really failing tests where the
other endpoint ceases to respond, we will detect that now
slower.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 29ab68fee..6e4666333 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -112,7 +112,7 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
  * Default abort timeout to use across xe_eudebug lib and tests if no specific
  * timeout value is required.
  */
-#define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		25ULL
+#define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		60ULL
 
 #define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
 #define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
-- 
2.34.1

