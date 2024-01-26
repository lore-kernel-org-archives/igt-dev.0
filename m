Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC4DC47422
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 12:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4EB10F9E8;
	Fri, 26 Jan 2024 12:40:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198E10F9E8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272824; x=1737808824;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=fs+PJvM4Di54WZZI1xFM31jnxLflEAX++WFxcBgph7g=;
 b=Pjlmyhtvomb/aK/0gbnaRKkMDeObsSbrNaI+L2EuM26I4hTtOtYCmBn0
 WUj+Q2GxhmlakvHKQk2UupVkqi4l2Oedkqqc32MMZgJcsUrWZOUEYihg9
 oR0AY5kuq72wcdxSCw0o63wE7VoAYb6gDEm4p+wKSxXHysoaSZQ2HIU8O
 ik5Ty5nLx/AG7+rxh1ht7K1TS+C8s5UghblbEJ77DZVzEf4+UHnlVMgBJ
 OEeuM9qjSNtD3Izlx/n3n8LxHXEkccInbkOcUhDhjTB9H5DpTm1m2rbC7
 n3v8eZE/DItphc43z4FpmUKGI01rGiMwl2QD2oq+mp2iGEXDUTGI3qFYJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466735522"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="466735522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="21385834"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:25 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F1E5A580E03
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 04:40:24 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rTLVO-0000000BKa3-3PH1 for igt-dev@lists.freedesktop.org;
 Fri, 26 Jan 2024 13:40:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Generate testlist files for Intel CI runs
Date: Fri, 26 Jan 2024 13:37:26 +0100
Message-ID: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Improve igt_doc tool to handle multiple config files when producing
Intel CI testlists and add a PHONY target to generate them.

After such change, those files will be installed as:

    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/xe/default/full.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/xe/default/chamelium.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/xe/default/bat-chamelium.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/xe/default/other.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/xe/default/bat.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/i915/default/full.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/i915/default/chamelium.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/i915/default/bat-chamelium.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/i915/default/other.testlist
    ${install_dir}/libexec/igt-gpu-tools/intel-ci-tests/i915/default/bat.testlist

The generated testlists will take into account i915, Xe and KMS testplan
config files, grouping tests altogether.

---

Mauro Carvalho Chehab (3):
  scripts/igt_doc.py: allow using multiple config files at the same time
  testplan/meson.build: add a ninja PHONY target for Intel CI testlists
  scripts/igt_doc.py: don't be verbose when creating testlists

 docs/testplan/meson.build |  17 +++++
 scripts/igt_doc.py        | 132 +++++++++++++++++++++++++++-----------
 2 files changed, 110 insertions(+), 39 deletions(-)

-- 
2.43.0

