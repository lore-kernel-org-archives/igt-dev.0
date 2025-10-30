Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D3CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 15:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455AB10E9D1;
	Thu, 30 Oct 2025 15:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WV/3880K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77C010E9D1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761836547; x=1793372547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t46nMGLfNL3NLCubgwNB153ARwveJG7q1ElMowos2xk=;
 b=WV/3880Kwh17pLSscWCdEo/Bb3PJkKCuR+zd2PqbLykphH77ZIQ8NbNz
 FGI8RiSOhJjxLI0eva+NgtuSBiBOYlr5xZyif2vnStJ/4l2YlUKF3f/Vb
 Ug/asXfnke0JPoh0a6fcTPcvqGpRIqBdb3nCIjNJgpnfn3UZJDBPKThqW
 sfo0qzq65sCA1sdPEIPhjyrtU71wqG6kto0Tw/Olf2FWjWIRn+1Hi6CaY
 iHLHHOPWmULVMhOw3yuKD8zbJdHEGwWUo1bnec5unuH2/iakPjMN3soZ9
 eWQe87BPngfJ1Xx1SBbNoI/gt/l40zmzKHsmJDGjlPntb6OT1+ioqbG7S Q==;
X-CSE-ConnectionGUID: Lw4uwe+vSKW7z+oIr8fVCw==
X-CSE-MsgGUID: fAdkrFwJSai6Umrj+RIshQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51552674"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="51552674"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:02:27 -0700
X-CSE-ConnectionGUID: +vLaq8ZfRZGXBLMuJSe5+Q==
X-CSE-MsgGUID: wT/jT7TpRk2BfXgLhBDALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190048417"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:02:26 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/1] gitlab-ci: fix api reference pages deploy
Date: Thu, 30 Oct 2025 16:02:15 +0100
Message-ID: <20251030150216.1183847-1-pawel.sikora@intel.com>
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

Remove unnecessary step with api_reference dir creation.
    
This fixes main 'html' directory with the API
Reference content being copied into docs/api_reference.

Regards,
Pawel

Pawel Sikora (1):
  gitlab-ci: fix api reference pages deploy

 .gitlab-ci.yml | 1 -
 1 file changed, 1 deletion(-)

-- 
2.51.0

