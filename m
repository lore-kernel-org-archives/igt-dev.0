Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF3C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920110EA7E;
	Mon, 25 Mar 2024 21:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9W6KU1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C12E10EA7E
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711402023; x=1742938023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YrY6HJR9Q4SvnluF8E7zaglKHd8mTrY//OXyC4/L1hE=;
 b=e9W6KU1NDHaqiesG7bJ1FXDjtVIU1RqSDeoG2p+f1MqQ09LwjYjYFhXL
 CMyZgAfG8ilcVz7Dt7ww2ryCxA8Q8oS3KJPSUaync9YtARbPE1bOi9lOS
 4Z2gCG2hl7Kid2y7esYb1UkHndIjjWrTv2nvcV74VXvs1kw38vDORX5Mg
 xdVaWIia8tpyvE13blebdnL/L3s6IzbbbqlVf7aj9ItCuihkuSMg+6MGY
 cAI5U2MVQQXqdJKEsQEtWBPfJk+CW2kCrq/quz/YgzSI5O9kLcEZJlLAn
 HLj40tuoTSD6qEja8ijR2hketryeeBLN9Z/8H1w2L+QsbUN/YvxyTy5lI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17064334"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="17064334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15712782"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:27:02 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com,
 jonathan.cavitt@intel.com, matthew.auld@intel.com,
 kamil.konieczny@linux.intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Date: Mon, 25 Mar 2024 14:26:59 -0700
Message-Id: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Addressing Oaks comments: So the reason I mentioned COH_MODE
is because for the test failure, we go into the folllowing
if statement and throw an error:

 "if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
     bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)){ 
     err = -EINVAL;
     goto put_obj; }"

We got the failure because
coh_mode = XE_COH_NONE and we wanted to do a DRM_XE_GEM_CPU_CACHING_WB
but in order to do writeback we need atleast 1 way coherency.
COH_MODE is probably set by default to NONE. Which is why we use
"bind.bind.pat_index = intel_get_pat_idx_wb(fd);" to get the correct
COH_MODE which then allowed the test to pass correctly.

Addressing Kamils comments: I have updated the subject
and simplified the description.

Jagmeet Randhawa (1):
  Fix WB caching PAT index for coherency mode

 tests/intel/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1

