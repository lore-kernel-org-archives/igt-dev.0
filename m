Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07B10E283
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 19:24:31 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 12 Dec 2022 14:24:23 -0500
Message-ID: <20221212192425.387971-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Add Colorspace tests to kms_hdr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We've had a Colorspace property on the drm_connector
but no IGT tests. These patches add IGT tests for this
property. They're currently only enabled on amdgpu with
the kernel at [1] but could be enabled for other drivers
if those drivers decide to expose a debugfs to read the
currently applied colorspace.

[1] https://gitlab.freedesktop.org/hwentland/linux/-/tree/hdr-colorimetry

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Hung <Alex.Hung@amd.com>

Harry Wentland (2):
  tests/kms_hdr: Add test for output Colorspace
  tests/kms_hdr: Add suspend and DPMS Colorspace tests

 lib/igt_kms.c   |  51 ++++++++++++++++
 lib/igt_kms.h   |   6 ++
 tests/kms_hdr.c | 156 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+)

--
2.38.1
