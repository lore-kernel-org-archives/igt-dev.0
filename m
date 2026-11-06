Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6B606A32E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UKdBQN7e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0810E3C4;
	Fri,  6 Nov 2026 18:33:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6717010E32D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793989973; x=1825525973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DzX+e/ZgbcjWK46wfGFw9WY7s+SYwtrdnUh3fNYwb2g=;
 b=UKdBQN7eXNoEws1YZvQb5MpU43Rvg++92DuR1zlm9qzfAE1y4ANsSDiw
 8fk2fv9+6kodv9CdD9dWBUSVHx3fXLdPNEdbwnB4ahaSy7zD1TcQBZP3Q
 5I2/sBQxKsEdQxjpdXFY2jaWQ2UqsV7DOyQVrORHcym+LoQvBzfYee0e5
 S33ex0OqujELU75SiYXUlUmeH6ELgt+D0B7et5ji4G3cXMmf81KB6izCm
 6jWlUajsdev699St4fHEDYJRFXfADQSG0G8I35nZt3oCRMgFzHvTtCPwM
 tUH4R7TFT5Wl2bvIGKLsQLrb9jHgtOE1UEdIR9NZEShqQFkPfH6hZcUGF A==;
X-CSE-ConnectionGUID: AgcfFhLwSsa/LBFyZLp5QA==
X-CSE-MsgGUID: Nfv2/03mReK5iNQNWrPWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2910364"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2910364"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:32:53 -0800
X-CSE-ConnectionGUID: RPcSJv7DTCO/H/uK6UWQCg==
X-CSE-MsgGUID: f9O9ppP/Tm6iyVHmiuf0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9198509"
Received: from dut4040nvlp.fm.intel.com (HELO DUT4040NVLP) ([10.105.10.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:32:52 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v6 0/3] Multi-queue CGP_SYNC replay coverage
Date: Fri,  6 Nov 2026 18:32:43 +0000
Message-ID: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A CGP_SYNC message can be lost during VF migration and is replayed by the
KMD on recovery. Covering that needs a CGP_SYNC queued or outstanding on a
live multi-queue group at the moment the migration lands, which the
existing multi-queue subtests never produce: they keep every queue in one
group and never change a priority after creation.

The first two patches are preparation. threads() learns to take a worker
and queue count, and the exec queue arrays are allocated to that count
rather than to a fixed maximum.

The third adds three subtests, two driving registration syncs across
several full groups and one driving dynamic priority updates on them,
from both the legacy and the compute mode paths.

All three are bounded by igt_until_timeout() so the runtime stays flat. On
NVL-P they take 6 to 11 seconds and raise the CGP_SYNC count from 32 on
multi-queue-basic to 16k, with no group bans or GT resets.

Jagmeet Randhawa (3):
  tests/intel/xe_exec_threads: Parametrise worker and queue counts
  tests/intel/xe_exec_threads: Allocate the exec queue arrays
    dynamically
  tests/intel/xe_exec_threads: Add multi-queue CGP_SYNC replay subtests

 tests/intel/xe_exec_threads.c | 179 ++++++++++++++++++++++++++--------
 1 file changed, 139 insertions(+), 40 deletions(-)

-- 
2.53.0

