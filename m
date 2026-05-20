Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D753ACD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03D10EFAF;
	Wed, 20 May 2026 09:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guN208nI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9E010EFAF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779271081; x=1810807081;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=3F/U57RDI4Cr1+YTYoxL8MqYV5uMiJbU1CuijRUVyXI=;
 b=guN208nICFsX1g2NS+KxFzqJJ+S8GasfFNmS9UYuhsH3T21aqSOEkx0M
 Pw0ZsjezfLu+UpbweJsFZmC0Nh7ySx8Ia8KvrtLGRRdX/rJVfSQIMjPkL
 bAZtP5SjYFHpOMefiFSHl06qtH+6fJHVRc134DIwoScWVHSb+ZnphiKpy
 L0XiLB3S6EnOI7qKQANX3fBOn1YLWd9npL2vMlTeO7RN6UmEolu/CfHqL
 cwoFqYAi9pKn5VN2hUbnZjWM76wuvysp2tyLDVxBwN4JmIUXWJvRH0sI9
 ZlLRxVZHy4ygeT/bJFqGbki0KRfXNKMolM7nprqvdZQlNSHu2WO5epWzY w==;
X-CSE-ConnectionGUID: O9rSPmjuRE21ze6CjCdSQw==
X-CSE-MsgGUID: dUws8JWNSvGF1bhhpSk9CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79188872"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79188872"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:01 -0700
X-CSE-ConnectionGUID: +DgbVBRzRzOj2mswUTBQVg==
X-CSE-MsgGUID: Aafxfz5aQRq9NDVdgcKPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="239971509"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:00 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/3] lib/intel_batchbuffer: intel bb copy data improvements
Date: Wed, 20 May 2026 11:56:20 +0200
Message-Id: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAESFDWoC/yWMQQqDMBBFryKzNhBDa7VXkVIy41jHRSoZUwri3
 ZvU5Xv/8XdQjsIK92qHyB9ReYcMTV0BzT682MiYGZx1rb06awTxOcmX1XR9M16wI5zoBrlfI/+
 HnA+PkzXhwrSVg1KgVzYYfaC5qLQqHMcPgmsgd4MAAAA=
X-Change-ID: 20260520-ibb_fixes-891d4b8cbfc7
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=3F/U57RDI4Cr1+YTYoxL8MqYV5uMiJbU1CuijRUVyXI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDYVdrBH3yRBCDn9XnsG5qsi1hV/1MNuVcNKin
 ZG3LJOLgaiJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag2FXQAKCRAjYrKT3hD9
 10CoDACG4KoSPlh4ruvn4m8xXhxYF1qm63avk4/P6WhcasYN1Ay5NuKnkGSjNj5cp8zZtb0x18p
 AYO63I8GX1d2IZRcI/8iNAHkVK3YUS0N9jxuOgAbBBEoTytiIXEQE8CROGfd5jAlDSQQHi7Snx8
 cWlsXZUMcxkEr1PmxAAjg44icGi3LmIWX4bpRRw1Ple6VoSejlNMn214hBeNEqFtsNd3CbXY9Cw
 bey1PIH+SibvkewIE9oTYmQ4f8sMZp8y5sn7oLwWJVGhFg9yRuxyH+tz0qIbyfuW7KmzN8/zPXS
 qm+HcvtIbv250BmNJhavtpTpJATacvft2cjhn1IOz5sJtPJQ/pYdkHSWxDo3x7nrQBP/jAhomOD
 fS83YQgOFgT9zL5f89OtSHaUEmKTREoXQ6OoKRohlNcsXFXZakxp73E44uuWdYX9KV08oisXiQM
 Hz+I5SSvTNheepAU1ZpfllRKb2VPG1w3aVmV+f/g+g/QFhXObCpxn5hCqmqX+GnAqzP8Y=
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

GPU code misses batchbuffer overflow checks in some cases.
We can fix it just by using proper helpers.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Andrzej Hajda (3):
      lib/gpu_cmds: replace open coded ibb data copy with helper
      lib/gpgpu_shader: replace open coded ibb data copy with helper
      lib/intel_batchbuffer: log overflow size in case there is no place in ibb

 lib/gpgpu_shader.c      | 13 +------------
 lib/gpu_cmds.c          | 13 +------------
 lib/intel_batchbuffer.c |  2 +-
 3 files changed, 3 insertions(+), 25 deletions(-)
---
base-commit: 6b305d78c65768c09cc7c0e902273bf409bbd218
change-id: 20260520-ibb_fixes-891d4b8cbfc7

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

