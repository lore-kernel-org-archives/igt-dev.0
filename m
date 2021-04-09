Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F116E497
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 11:39:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat, 10 Apr 2021 01:00:43 +0530
Message-Id: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] Fix mode selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

When two monitors connected through MST, the second monitor also
tries to use the same mode. So two such modes may not fit into the
link bandwidth.

This series will find a combination of modes that fit into the BW.

By parsing the PATH property, we can add a link_group_id field to
igt_output_t to identify all connectors that shares the BW of the
same link.

Parsing the PATH property consists of finding all connectors with
the same X prefix in the X-Y[-Z...] path property format and assigning
a unique non-zero link_group_id to all such connectors. Connectors
without a PATH property are not an MST output, so their link_group_id
can be left at 0.

IGT core helper would override the mode on all connectors that will
be modeset by the next igt_display_commit() call in the test. These
are all the connectors in igt_display_t that have a pending_pipe set
by the test up to the point of calling this helper.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (5):
  lib/igt_kms: Add a support to read PATH connector property
  lib/igt_kms: Identify outputs that shares link bandwidth
  lib/igt_kms: helper to override the mode on all connectors
  tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
  tests/kms_cursor_legacy: Fix mode selection for 2x tests

 lib/igt_kms.c                    | 71 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h                    |  3 ++
 tests/kms_cursor_legacy.c        | 53 ++++++++++++++++++++++--
 tests/kms_frontbuffer_tracking.c | 35 ++++++++++++++++
 4 files changed, 159 insertions(+), 3 deletions(-)

--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
