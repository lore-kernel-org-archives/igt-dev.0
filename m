Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6946CFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7047310E290;
	Fri,  4 Oct 2024 10:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nllzQTAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088B710E290
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038520; x=1759574520;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Uk2UZRyo/Uo1xKGcbxTu4Cllisx0DgfdUYAAnnBOr1M=;
 b=nllzQTAEEeuiwKB9xGvs0J4ORhQvXJEmfad/kgvW0PTGKnqTMoUW7lNj
 GnlvAnUq/moPLAQ7N9RQgfCUSCHytei9t1JApqF8C721ueDfnfF46Cwf3
 +EnhzCOW5p1TLdTpef+OuQ5fA5ADICD8/z0DaHUH+uBAsfbKWaFdSUxe0
 0m/Nx69w98t89SuC2LCpCs8Jd2URDz1k+a+uUggWW7hZ1ICcz7JSihD7l
 C3WuqDLyov7o6FnQPCXOOB2fUnuj9kubutzs5bZ+xD6rpUA25zdG/jDTY
 Mmn5OBfZswQ+bZIVABkH3AIYn9yvX5nsN+3NJlKVetOL2Aflc+lUYy3FA A==;
X-CSE-ConnectionGUID: Fv1bJMMJS1GjHDoP539fEA==
X-CSE-MsgGUID: NL/o0fmkTSGi2hdBiqW/3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140573"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:42:00 -0700
X-CSE-ConnectionGUID: UV/r8sJ3Q8iZni+4VjjEUQ==
X-CSE-MsgGUID: yXOfpJr0RRCUi1CCFmbVHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778444"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/14] lib/igt_aux: Add igt_ror() and igt_rol()
Date: Fri,  4 Oct 2024 13:41:20 +0300
Message-ID: <20241004104121.32750-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

Add helpers to do bitwise rotate operatios.
igt_rol(): bitwise rotate left
igt_ror(): bitwise rotate right

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_aux.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 4b8116dc0998..bfd83adcacb9 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -337,6 +337,13 @@ void pipewire_pulse_stop_reserve(void);
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 #define DIV_ROUND_CLOSEST(n, d) (((n) + (d) / 2) / (d))
 
+#define igt_rol(value, shift, size) \
+	(((value) << (shift)) | \
+	 ((value) >> ((size) - (shift))))
+#define igt_ror(value, shift, size) \
+	(((value) >> (shift)) | \
+	 ((value) << ((size) - (shift))))
+
 uint64_t vfs_file_max(void);
 
 void *igt_memdup(const void *ptr, size_t len);
-- 
2.45.2

