Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED49CD5BD2
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1990C10E4C5;
	Tue, 26 May 2026 14:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rWsTRM0x";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694A410E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MPTgDVR6WvVCgRs8QtHCmx358hjkTGabcpVPIqj9ALQ=; b=rWsTRM0x1lgXp3ACT/iW3FhkwW
 /8gDwoxQKt8RABytNaX7/dreFuoNBGMGdExLTtbY1U1sIC3IOiiVtV+KiP7QPZi8hZbrJkiIlo+H2
 H1SNUmJNy0V622ZL2pQuJdom/2HTaKKX+l3W1hdRJhibRheJ/XNqFgxIvGUL0jw1HFPvAQ7Wt51iI
 4h5tLFUcdGHvBozz1qapRRGcTNwq2zUxfaPAcyeeXhehJxHRW2V/6voIKGXIRTJeV8tnkGa4m6+rk
 gy72y0elmMiEYQQVD/KMsrJPIMJkjNUwA8ShNSuHZoieDZFdJFhnLlQCI1qPpkc0O3qgjWDY5qpVe
 jKLkOu9A==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRsSX-008Sz5-Rg; Tue, 26 May 2026 16:08:41 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t 0/2] test/kms_colorop_helper: don't requests colorop
 updates indefinitely
Date: Tue, 26 May 2026 16:05:02 +0200
Message-ID: <20260526140752.503380-1-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
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

After committing colorop settings, colorops are still flagged as
changed, even if there is no new request for updates. The first patch
clear colorop flag after commit so that the next patch doesn't try to
re-submit changes on inactive color pipeline. The second patch prevents
colorop to be marked as changed just because it was checking if a
property enum value is supported.

These changes are consistent with the current expecation of allowing
property changes in colorop that are part of a current active color
pipeline or a color pipeline that will be activated or deactived in the
same atomic commit; but rejecting attempts to change inactive colorops.

Lemme know your thought!

Melissa

Melissa Wen (2):
  lib/igt_kms: clear colorop-changed flag after commit
  test/kms_colorop_helper: only check if a given enum value exist

 lib/igt_kms.c              | 41 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h              |  4 ++++
 tests/kms_colorop_helper.c |  4 +++-
 3 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.53.0

