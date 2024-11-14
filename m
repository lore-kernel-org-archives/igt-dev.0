Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B1D65C6C
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 10:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9D10E7DA;
	Thu, 14 Nov 2024 10:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXbbx/oT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1910E7DA
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731580308; x=1763116308;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=q4IwgSPfEg47FyhPSX82YEZOoyY7sQFW7g0QeMhfztM=;
 b=VXbbx/oTxG4d174bePO620anWGnnkgX//u6od66aptJz+UIvamFDvBtv
 V5FVKZFwshaYsf3NovaSAJppy1tF+vxAEoMn43I9KNPd5HOyguPeAaYt6
 tbG9gW4rxLRXbb7YynFwjeSI8zweKbUcfUNB3SxhmVycm88L+wyDconHJ
 aToQRayQnSGUD/D8DoBnbDe7oIjcoenZFyCqwL5O4e7vhG6lfd0m1r3iP
 cQFJu/9DfOJP+efPcMadx59hqqak/CiEOad+Av1iDmvY0PMTM6tCmbb+a
 +vfUeLX4jDZNHUFIrAPNegVo/F4MDmlgEAgWa0S2tvkwGbq0YWoDAZ160 g==;
X-CSE-ConnectionGUID: P1No5oW/SHGdMWez2a3/yA==
X-CSE-MsgGUID: m/4u8/5eSe+w6TTDxL60xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31380131"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31380131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:31:48 -0800
X-CSE-ConnectionGUID: Q5r8zqNGRbG5/2S6E+X3kw==
X-CSE-MsgGUID: ENwaB+GfSU6WgT9lBqsZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93096072"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:31:46 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/2] lib/gpgpu_shader: simplify load/store shaders
Date: Thu, 14 Nov 2024 11:31:37 +0100
Message-Id: <20241114-gpgpu_send_rework-v1-0-e0914e09e7b2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrRNWcC/x3MQQ6CMBBG4auQWdtIsUHjVQwhA/yUxlCaGVATw
 t2tLr/FezspJEDpXuwkeAUNS8ywp4L6iaOHCUM2VWXlrC1r45NPW6uIQyt4L/I0N3vlC9zoagf
 KXRKM4fN/PprsjhWmE4799DttSVcBz+eZdYXQcXwBc+AFy4UAAAA=
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=708;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=q4IwgSPfEg47FyhPSX82YEZOoyY7sQFW7g0QeMhfztM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnNdGRnB2CM2xzhLmtgaeKQbhv13XZUWRHEuZLQ0EN
 X5x18S+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZzXRkQAKCRAjYrKT3hD91ytsDA
 CIpWxq+AKOBfO7lh+9tIXrQeL2RlD2XmI/FjuA5k1YCd5zVnuYJRygF8/cnCONXvUHrKaSOnn/o3zQ
 zelqNfMAIOBFLOEJdaKFNXze8TQx//yycGfnc3blI7gCNUvQTIuLJ/qc0tCmSbHjwhKKkqTSPz5TFo
 bwdqB/qFbtOTLcBQPVwI2smCRX6XmRihFYEV0j44BKZGAJ4EvKckqLwl6hBgSPJqQ5/iSj0uPBoshx
 cdHcmvcFVzMpOwWpEsDKzFAknsHuWEaAQkNGgYsZWlpyW8khNPK5UrnvxDIFVWZ+k7+4iTkDTb9KET
 iZvzsstXqEg9Lbrh9SpYNbJzHzZ3rPyJFmb85gpgKCBITTG3wbtjHhMxxXiIGqDtaO7vVoqx/HgmUf
 JVP5z9ZbseuoJzb0cloINt5rN/UxWufGGPcRK7sPQXCHt80LbxillAURHvlC24fdOVoC1Bzwp3hgae
 hBvMqDDGSV3UJtn3kqFSVJP9mTamRtkmnRpfAe1dJVGJw=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (2):
      scripts/generate_iga64_codes: add iga64_macros.h to checksum calculation
      lib/gpgpu_shader: simplify load/store shaders

 lib/gpgpu_shader.c           | 160 +++-----------------
 lib/iga64_generated_codes.c  | 338 +++++++++++++++++++++----------------------
 lib/iga64_macros.h           |  43 ++++++
 lib/meson.build              |   1 +
 scripts/generate_iga64_codes |   2 +-
 5 files changed, 232 insertions(+), 312 deletions(-)
---
base-commit: 190dec96be5487f86c45b7e6cf11b8174ebabf31
change-id: 20241106-gpgpu_send_rework-817a3e4f464e

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

