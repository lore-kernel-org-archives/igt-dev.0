Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DD210E5CC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 14:00:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 19:28:43 +0530
Message-Id: <20220316135845.418963-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v8 i-g-t 0/2] New subtests for deep color
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

Bhanuprakash Modem (2):
  tests/kms_color_helper: Read deep-color capability from EDID
  tests/kms_color: Add support for Deep-Color

 lib/igt_edid.c           |  66 ++++++++++++++++++++++++
 lib/igt_edid.h           |   2 +
 tests/kms_color.c        | 107 ++++++++++++++++++++++++++++++---------
 tests/kms_color_helper.c |  54 +++++++++++++++++++-
 tests/kms_color_helper.h |   5 ++
 5 files changed, 209 insertions(+), 25 deletions(-)

--
2.35.1
