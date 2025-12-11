Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5854D41D50
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 15:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4210E097;
	Thu, 11 Dec 2025 15:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuXAbJQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C8710E097
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765466351; x=1797002351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfvUM9nI3bZsKJfxgCUlMOkkmKKbIArOxVbrU/YEw9I=;
 b=NuXAbJQIqVtLtvUGELrkP8mphK+H/4dTPjYAInu1F4HzzFy6a+tV1gSw
 cfyKeBRSAdOmMhChGYh7ksYdJu+0GhLr8O3phnwq1jxDiU0sV/rQ5gl8Z
 w5cVJK1EpUpUH9LYhKr7Fm7KsOYBbWnJoV8xGQHpH6J5kd4hdayNFo+RP
 hJ3Dxq/N49tcNuqv4c5ms56IxJPs9Y56T5LANNxy7kvRTZR3Kd2NIrpb9
 jhOQLE9dRcATl0Yy6qUI4eyoHvnloi/H6coQdfuPHcecxa1EDdd+jLheS
 Fi5vW53zqoDHeH+H39j5hdssgPlAScCC3YyhJGp2EXVulIpZHhJ4qtLUG g==;
X-CSE-ConnectionGUID: yrjKR9hJS7SF4Au5Z7H27Q==
X-CSE-MsgGUID: G0DOQw9uR0KJo0iFi3IrOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78070310"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78070310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 07:19:10 -0800
X-CSE-ConnectionGUID: NlOf133nTACC0GwS4tCj5g==
X-CSE-MsgGUID: 4EVPqlhgQrKxWFgPwK4qlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="200987251"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.3])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 07:19:09 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/1] docs: update for platform-neutrality
Date: Thu, 11 Dec 2025 16:19:01 +0100
Message-ID: <20251211151903.323890-1-pawel.sikora@intel.com>
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

 docs/faq.md       | 14 ++++++++++----
 docs/platforms.md | 20 ++++++++++++--------
 2 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.51.0

