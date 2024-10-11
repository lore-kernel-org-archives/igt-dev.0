Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D1AD0D78F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 13:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF1B10EAEC;
	Fri, 11 Oct 2024 13:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsxMeE3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89BB10EAEC
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728653812; x=1760189812;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=03ws8v3KC/NRDJKK+5/nYRKvPdfCBxPqW0KIQI9hnco=;
 b=IsxMeE3uiyShs3LB31tq0NJHBLA2b3nh4Xvsgtz2SoAVax+RdCeStMiy
 b4Vn9hjxpkSyK36j9v9iWScn7VcRT3vO0g97BqAvyjDRjvvWXNiPh6O3h
 MXZ8gGA1JosQi9LBCLawg+nzL5zEpDFnPCOmaSE9KYoNMu5GH6xpshXjp
 wiuA46aRged0u13++2Z6z/7jO8YmYRmfBOuPJ2uT4sAVNUuX4e2TJDdQm
 2VoP9LY5QGrME1u55LKpR+026ZOuRZvFW+OOwQaIwW/Q78tURw9HgVgnu
 /3XPSh63Zwt/w5VbiKv1ezxUlaBZsrHQlg7NUprUNW2/krO005XTbC+l+ Q==;
X-CSE-ConnectionGUID: BIW8mhyTTqWvXsQkoLVEfA==
X-CSE-MsgGUID: INEVMTN8R1+McpcYXGbhnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27922995"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="27922995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:36:49 -0700
X-CSE-ConnectionGUID: BVp739m6TNWf+ETWJs+Rcw==
X-CSE-MsgGUID: m/GIjfBWRzCM2IT8o3mivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81530004"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 06:36:31 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 11 Oct 2024 15:36:22 +0200
Subject: [PATCH] tests/xe_exec_sip: increase timeout margin for tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-xe_exec_sip_increase_timeout_margin-v1-1-7adc68a3fbed@intel.com>
X-B4-Tracking: v=1; b=H4sIANYpCWcC/x3NQQrCMBCF4auUWRtoQlT0KiIhScd2Fp2GmbYES
 u9udPkt3v8OUBRChWd3gOBOSgs32EsHeYo8oqGhGVzvvO2tNRUDVsxBqQTiLBgVw0ozLtsa5ig
 jsYk3n3Lyj/vVDdBKRfBD9f/yejentjFJIufp196Kwnl+AWHM7ueLAAAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=03ws8v3KC/NRDJKK+5/nYRKvPdfCBxPqW0KIQI9hnco=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnCSneAgVTQOJaykfvS1jwCX0zkV+oeNlvzjhATYHL
 j9HYjtKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZwkp3gAKCRAjYrKT3hD911czC/
 43mw8q0K6hyqNbiz183CHjopItPubTkyUrjaxp6qTpILUlPS+7N57vuV0hG7CjKyOfKUgJQ6vWmbUc
 pGYpH3ClNUzGfWZivqf0nhvYv2W7ywAJxjZ7US79Xuz57f72Qp5M7VkxNPEWq6HkCgH22CBkDaYCiS
 eF1ZCddX5Scy56SqGP0qujcT/C6TdmM4fQHHKjk85Slvg3ZOo20wZ3UufbuIM10jmqtZip8Ac72ALP
 7Bab0f12/W25Zm9+wLhjqISaXZvgdflhXb15Ppu04lgvOmy+YSAU1jQ39gSF6K3TCLhUnGAGQ4isN7
 9tRlonhfZ2n2JqBR2KTVsZA268AnD/RYpzt5ZHQP5sWmqIPTUWjEd6E3RmdS32e/oSQ/n2TAfPZDjf
 nQzdyiEPFYw8S/7C77k84WScqT0Oh8mpJD0pXT9e0NvTHjL5vteIYNysDYm4smsrTFp6LLKiqNzHSo
 04CD4bySVzlRgjWqSSKlGRevW3l8gdVTOx2Th/rUIomyA=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

In case engine reset happens 4s timeout margin sometimes is not enough and test
fails. It happens mostly on LNL due to devcoredump creation.
On CI it does not pass 5s, lets increase it to 8s to be on safe side.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_sip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 2294468c2983..50265c0c6a45 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -274,8 +274,8 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 
 	vm_id = xe_vm_create(fd, 0, 0);
 
-	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
-	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
+	/* Get timeout for job, and add 8s to ensure timeout processes in subtest. */
+	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 8ull * MSEC_PER_SEC;
 	timeout *= NSEC_PER_MSEC;
 	timeout *= igt_run_in_simulation() ? 10 : 1;
 

---
base-commit: cc3fa4e36bb0445565f40f989540b9deacb92e12
change-id: 20241011-xe_exec_sip_increase_timeout_margin-a64bcb49752d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

