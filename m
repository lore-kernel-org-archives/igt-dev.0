Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF4C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 12:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49710E0A3;
	Thu, 27 Mar 2025 12:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXeONTAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB3F10E0A3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743079479; x=1774615479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/yYW3oB8eAIZk+cECmCHP6FWdsbhkjRMdawGKW+eOGU=;
 b=LXeONTApUpO6mUEtpdzADKyPPuxvdcukYQeo2SSSbIs6D99EmV906fVu
 gJyW21Mp9EGOKHKKrAEQ+2LGdF8oO+KZj8W8SWmRcqp4/S4nwnkTjAmbA
 G+20Jhoh5JsynJ9z/EPWAhebzf3PCtBCo8hwMhKLtqUGfE43/BEpR4ub3
 eH0NrOIng9m7KnIyT4KH8GYzrdLKo/trhOytkizLICCLvnN+sSrPDasMU
 GWd0H7yQpn6kZfk3OvLzTz+pGi+67hDd9G7IUfpnUXwU1Tvj1V227sHv5
 aaSV4E5Leu0EIRehkWrIhPti6NrL9Db4FdbjqgAH4v2UIXBlQDDfIUgg+ A==;
X-CSE-ConnectionGUID: mixFccyaTOCpDhKjIlQETA==
X-CSE-MsgGUID: 6PaJp+Y4QW+Rjqhgcd6LmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54609407"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="54609407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:44:39 -0700
X-CSE-ConnectionGUID: kDTxwP6lT7e9RLG1ny/ncg==
X-CSE-MsgGUID: Vk6eyfzIS9+wEi/DU1E1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162362082"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.254.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:44:37 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Do not treat probe
 success as error
Date: Thu, 27 Mar 2025 13:44:31 +0100
Message-Id: <20250327124431.620027-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Certain functions may not be called at all, such as xe_wopcm_init,
xe_guc_log_init, and xe_guc_ads_init during VF probe.
In such cases, a successful probe should not be treated as an error.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..f559d7c98 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -185,6 +185,8 @@ static void set_retval(const char function_name[], long long retval)
 static void
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
+	int err = 0;
+
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
@@ -192,8 +194,12 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	err = -errno;
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	if (err)
+		igt_assert_eq(err, INJECT_ERRNO);
+	else
+		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 }
 
 /**
-- 
2.31.1

