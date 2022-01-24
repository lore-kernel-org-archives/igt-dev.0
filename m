Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E4A10E849
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 11:27:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 24 Jan 2022 16:53:49 +0530
Message-Id: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] New subtests for deep color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, uma.shankar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add new subtests to support deep color.

Bhanuprakash Modem (3):
  tests/kms_color_helper: Read deep-color capability from EDID
  tests/kms_color: Add support for Deep-Color
  HAX: Add deep-color tests to BAT

 lib/igt_edid.c                        | 16 ++++++++
 lib/igt_edid.h                        |  1 +
 tests/intel-ci/fast-feedback.testlist |  4 ++
 tests/kms_color.c                     | 54 ++++++++++++++++++++++++---
 tests/kms_color_helper.c              | 32 +++++++++++++++-
 tests/kms_color_helper.h              |  4 ++
 6 files changed, 104 insertions(+), 7 deletions(-)

--
2.32.0
