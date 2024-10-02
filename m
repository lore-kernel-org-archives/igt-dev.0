Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677ACCF31B1
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 10:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2737B10E6F4;
	Wed,  2 Oct 2024 10:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4Ovb19e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEC710E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 10:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727865925; x=1759401925;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9GuXiFN4PY2+MOG6wnfc2PtMYxTaRBWJhn80oXWpHhk=;
 b=j4Ovb19eaug2fJMnOQvfSvYwEJdT/SFhDWJ3sVn/Vr1sch0uDrxXhf1Z
 bD5nLuEeOJVRBU49UaOMEj0F3hVms1MlPRAnj6WevDl33Ru7qG0d0gw9g
 QNYj9ngNTDhJXtXIyV0fP89RmfyAzTzpL53XsUHOLeRzEQEVfoT1EhZcB
 ijUtPeZwsKCymcsVCK3ygqdHIZKu72f6YlQCI7uPt+wYaQa7bLypxntaq
 j71YMw8KLgQHJrDvKc/ThmTJWvhflyS70AXADiIftG1pyw7Q5XVq9QWMl
 Ej1QIE6jlHF3u5apTU8nT0K48D9N/zvk5hdoD3+9y6VwnC3l68PqK872X w==;
X-CSE-ConnectionGUID: hDAxk7/aTY6WnTzy8uJSgg==
X-CSE-MsgGUID: qLpf3g1uQDGBmlp/T7leTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38382975"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38382975"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:45:24 -0700
X-CSE-ConnectionGUID: kATqvnWzSTCseHXmqaf76w==
X-CSE-MsgGUID: 9V9TBTLoQFC2T+uGy9x7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74077116"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 03:45:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 13:45:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/4] lib/intel: MI_STORE_DWORD doesn't need secure
 batches on i965
Date: Wed,  2 Oct 2024 13:45:14 +0300
Message-ID: <20241002104515.32164-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
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

Limit the MI_STORE_DWORD secure batch usage to just g4x and ilk.
i965 does not need this.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_gt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index a1075e8bbed1..b8faf2b7bd09 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -704,6 +704,7 @@ bool gem_store_dword_needs_secure(int fd)
 
 	switch (info->graphics_ver) {
 	case 4:
+		return info->is_eaglelake || info->is_cantiga;
 	case 5:
 		return true;
 	default:
-- 
2.45.2

