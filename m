Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A082CD4F21
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0797E10E0E5;
	Tue, 12 May 2026 12:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="edGz3BCr";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CE110E058
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T02d50rc6hJU56+o6yBqZcMOY21R8Rp+fqhOaMuftzk=; b=edGz3BCrotg8mMtYRj8mEwpWMm
 WGCj9PyoUVNNfZBuHRFwD8t5uJHErTUcyplg1EqLftZyofJeXzybDsIyLHyNFHEznuxDsr+YDN4+0
 Gd3gPHT5TvpNcGgu5R5lNEjNQ45rCF29TQqo9xQJYNP57o32fIuve5lznRUjBTkdLKBNId1YYKSs5
 J4E7PUmZGUXqCwmgjBdACo47kB+KMChoYlkOrBUzxSe0MMwVIUikbQEzGoYGndgrrGPCxFDgJZQH9
 lsiHGxs6fOkyLFrnBt7q83iTPyxCkXmNL/E6qmg3Ju35RpKlgfmvZMkBmJK/O2Wx0+S+NcUAGo7wY
 1ydb4frg==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMmJn-009Sqa-UF; Tue, 12 May 2026 14:34:35 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t v2 0/5] tests/v3d_perfmon: Fix V3D 7.1 regression and
 extend perfmon testing
Date: Tue, 12 May 2026 09:29:45 -0300
Message-ID: <20260512123408.1115589-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series extends the V3D perfmon coverage in two directions: it fixes
an existing test that regressed on V3D 7.1 (Raspberry Pi 5), and it adds
coverage for the new DRM_IOCTL_V3D_PERFMON_SET_GLOBAL ioctl plus
companion counter-isolation tests.

PATCH 1 fixes create-perfmon-invalid-counters, which currently fails on
V3D 7.1 because it hardcodes V3D_PERFCNT_NUM (only valid for V3D 4.2)
instead of querying DRM_V3D_PARAM_MAX_PERF_COUNTERS as the UAPI
prescribes.

PATCHES 2-4 are the plumbing for the new tests:

  - sync the v3d UAPI header to expose DRM_IOCTL_V3D_PERFMON_SET_GLOBAL;
  - extend igt_v3d_perfmon_get_values() so callers can read counter
    values back into a caller-provided buffer;
  - add a small helper to query the V3D hardware version, since
    counter IDs and other details differ between v4.2 and v7.1.

PATCH 5 adds the new test coverage:

  - get-values-check-monotonically, which submits ten CL jobs in a row
    and asserts the counter values grow strictly between reads;
  - global-perfmon subtests covering input validation, single-perfmon
    semantics (EBUSY), implicit clear on perfmon destroy and on fd
    close, precedence over per-job perfmon (EAGAIN), and cross-fd
    accumulation;
  - perfmon-counter-isolation and perfmon-counter-isolation-subsequent-cl,
    which verify that the driver's queue serialization keeps pending CSD
    or earlier-CL work from leaking into a perfmon window.

Tested on Raspberry Pi 4 (V3D 4.2) and Raspberry Pi 5 (V3D 7.1).

Best regards,
- Maíra

---

v1 -> v2: https://lore.kernel.org/igt-dev/20260508124446.1260672-2-mcanal@igalia.com/T/

- [1/5, 2/5, 3/5, 4/5] Add Iago's R-b (Iago Toral)
- [5/5] Set `out_sync` only for the last job instead of setting it for all
  jobs (Iago Toral)
- [5/5] In "global-perfmon-valid-perfmon", also wait for the last to
  complete in the second submission (Iago Toral)
- [5/5] In "perfmon-counter-isolation-subsequent-cl", only wait for the
  second syncobj after we retrieve job1's values (Iago Toral)
- [5/5] Create two macros to define the number of CL and CSD jobs submitted

Maíra Canal (5):
  tests/v3d_perfmon: Don't use the deprecated V3D_PERFCNT_NUM
  drm-uapi/v3d: Sync v3d UAPI
  lib/v3d: Allow callers to retrieve perfmon counter values
  lib/v3d: Add helper to query the V3D hardware version
  tests/v3d_perfmon: Add global perfmon and counter isolation tests

 include/drm-uapi/v3d_drm.h |  21 ++
 lib/igt_v3d.c              |  22 +-
 lib/igt_v3d.h              |   3 +-
 tests/v3d/v3d_perfmon.c    | 576 ++++++++++++++++++++++++++++++++++++-
 tests/v3d/v3d_submit_cl.c  |   4 +-
 tests/v3d/v3d_submit_csd.c |   4 +-
 6 files changed, 616 insertions(+), 14 deletions(-)

-- 
2.54.0

