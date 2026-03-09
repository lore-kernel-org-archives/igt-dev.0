Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3296EA854D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A4489E59;
	Mon,  9 Mar 2026 11:59:41 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B2B89E59
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773057575; x=1804593575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=82FA7L47GrlTnCPVGvoPr156j2VMbCLhR+xfOz92vUU=;
 b=RcQx6GWcrShZfqKW3UmPll2GSNO83R7m3m5MAtrLivcCPYHASSH5qdaJ
 sw1r30zpuB1+5hWHhu8AgBL4l4C0yKYw2JnFk3K5yGR2WhSxQjsPjFwZ6
 SZkizZ2WRowczdswsdGN9GFozCixZ/0r00C0wSU1Qzmg+d2HVcaWBccM2
 cMPXbOEF0jNZayGvM6Iu5XJDh6099ErGreKudWZhjEDJJ51BhbjCVftty
 nMGDi6zAedEHS3UVGuarNcSekGp5FoMpZEVnbsaJOewq0zOMjcxPaAdUo
 WZOXNN1IbGNkrrQTDAYJygrDSnOgH+UuLQWWH0piYulkuR1h5VCdTsRuV Q==;
X-CSE-ConnectionGUID: B4RUYODUQBC2t9rYxXSOtg==
X-CSE-MsgGUID: blToRZd+Sk6aWi4uQoIBnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77956241"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77956241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:54:34 -0700
X-CSE-ConnectionGUID: uNFCKAFaQMes8V1YJ2EVJA==
X-CSE-MsgGUID: nm/0kCwXTu6PYIf/piqnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219675863"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:54:33 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 0/1] test/intel/xe_vm: Add oversubscribe concurrent
 bind stress subtest
Date: Mon,  9 Mar 2026 11:54:15 +0000
Message-ID: <20260309115416.1704717-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add test for oversubscribing VRAM in multi process environment that
creates VM (scratch page), bind large BOs and submit workloads nearly
simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, excercising
the bind pipeline under eviction pressure.

Sobin Thomas (1):
  test/intel/xe_vm: Add oversubscribe concurrent bind stress subtest

 tests/intel/xe_vm.c | 438 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 438 insertions(+)

-- 
2.43.0

