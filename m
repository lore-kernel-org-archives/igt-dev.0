Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5497410E5AF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 11:16:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 16:45:00 +0530
Message-Id: <20220316111503.417452-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 i-g-t 0/3] New subtests for deep color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new subtests to support deep color.

Bhanuprakash Modem (3):
  tests/kms_color_helper: Read deep-color capability from EDID
  tests/kms_color: Add support for Deep-Color
  HAX: Add deep-color tests to BAT

 lib/igt_edid.c                        |  66 ++++++++++++++++
 lib/igt_edid.h                        |   2 +
 tests/intel-ci/fast-feedback.testlist |   4 +
 tests/kms_color.c                     | 107 ++++++++++++++++++++------
 tests/kms_color_helper.c              |  54 ++++++++++++-
 tests/kms_color_helper.h              |   5 ++
 6 files changed, 213 insertions(+), 25 deletions(-)

--
2.35.1
