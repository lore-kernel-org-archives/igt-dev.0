Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3296110E20C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 13:30:09 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 11 Apr 2023 10:29:43 -0300
Message-Id: <20230411132946.17459-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/vkms: Update VKMS's testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Considering the latest changes in the IGT codebase and in the VKMS driver,
update the VKMS's testlist by adding new tests. The first patch adds tests that
reflects changes, such as code restructure and generalization of tests for
non-i915 devices, in the IGT codebase. The second patch adds tests that reflects
changes in the driver code: now, the primary plane can be moved and don't have
to be full-screen. Finally, the third patch remove tests that are skipping, in
order to have a testlist with only tests that are passing.

Best Regards,
- Maíra Canal

Maíra Canal (3):
  tests/vkms: Add tests that changed its testing structure
  tests/vkms: Add tests that perform operations on the primary plane
  tests/vkms: Remove tests that are skipping

 tests/vkms_ci/vkms.testlist | 41 ++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

-- 
2.39.2
