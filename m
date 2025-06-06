Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ADBC677C4
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 18:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DA510EB28;
	Fri,  6 Jun 2025 18:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NluthDuD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296210EB28
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749234925; x=1780770925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7+mZt5YCy7GvRgKwbA5FG7LE8l/mGBO/tIEkdR9+riE=;
 b=NluthDuDTpIQ9OjRJTHb2Ti3sAqVzn05OVFrjC18IBV4bG0OrBz4lnQI
 cxaO4xxHXypXkvDes+HTtaqf3XrN3E274keqGNLMT0eKU0G07DmBbYl55
 FfWRex4/ofwKS1273PpBC+HQTlxRGq9M5As5JHJCTqoBYCDcfT6jsLNFy
 fMKRHHqUq4cRDT8Rsv+VIlTqqoxvKMux73PtYfaJwgXn7YVscztuAOJHg
 1E7VKyAaHOzY+oeOHL2n5OG2GegFJn2QZ4md0IBMeYNM8GcuAyzdK1pz4
 Jj1Nqhld2Fgp73AW2V6IiCA3sjn1QZAue+ikuQeHotMAeQgXI/Hh1/TN1 g==;
X-CSE-ConnectionGUID: Zc4m/l8JRdqX/xrUBWuf+w==
X-CSE-MsgGUID: ap6Goz+pTI6lHR2Z/J/P8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="76787103"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="76787103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:35:23 -0700
X-CSE-ConnectionGUID: /X5OVA76Qm6iNlMrW6OuCA==
X-CSE-MsgGUID: TykSZ/D4RHqG9408s3Q84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150769710"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:35:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v4 0/2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Date: Fri,  6 Jun 2025 18:35:17 +0000
Message-ID: <20250606183519.78736-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently, numerous fault messages have been included in the dmesg
ignore list, and this list continues to expand.  Each time a new fault
injection point is introduced or a new feature is activated, additional
fault messages appear, making it cumbersome to manage the dmesg ignore
list.

However, we can safely assert that all dmesg reports that contain
*ERROR* in their message can be ignored, so add them to the dmesg ignore
list.  This unfortunately does not include the device probe error
itself, so that must be added separately.

While we're here, we should also assert that any errors we see are only
coming from the target PCI device.  We can do this by passing the
pci_slot name to the dmesg ignore list, which is generated during test
initialization.  In order to pass this information, all test functions
need to take the pci_slot name as a parameter.

Some functions already take the pci_slot name as a parameter but should
be modified to make the pci_slot parameter a const variable.

v2:
- Only ignore error-level dmesg reports (or, at least, reports with
  *ERROR* in them), and device probe failues
- Add PCI data to regex (Michal)

v3: (Michal)
- Revert name change
- Add change log
- Remove fixes tag from commit
- Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
  move to lib/igt_core.c
- Minor code fixes

v4:
- Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
  keep it renamed to ignore_dmesg_errors_from_dut (Kamil)

v5:
- Pass preexisting pci name instead of attempting to regenerate it on
  each run of ignore_dmesg_errors_from_dut (Daniele)
- Make pci_slot a const parameter (John)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Jonathan Cavitt (1):
  tests/intel/xe_fault_injection: Make pci_slot const

Satyanarayana K V P (1):
  tests/intel/xe_fault_injection: Ignore all errors while injecting
    fault

 tests/intel/xe_fault_injection.c | 64 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 35 deletions(-)

-- 
2.43.0

