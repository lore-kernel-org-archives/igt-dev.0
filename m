Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F50B3EE4
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 10:17:04 +0000 (UTC)
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 5 Aug 2022 12:16:51 +0200
Message-ID: <20220805101654.1152678-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add interpolated gamma tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Yannick
 Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The series aims to add two specific tests for interpolated gamma LUT.

The first patch is purely from a practical POV. It adds a blacklist for tests
that do not run on STM devices.

The second patch adds support of STM drivers, which is needed since this type of
gamma LUT is hardware-specific and not supported on all platforms.

Last part of the patchset focuses on the implementation of the test itself. It
adds two subsets in which working indexes of gamma LUTs are set at expected
value and then checked between interpolated LUT and standard LUT thanks to CR
state.

Raphael Gallais-Pou (2):
  stm-ci: Add STM blacklist
  lib/drmtest: add support for STM drivers

Raphaël Gallais-Pou (1):
  tests/kms_color: add interpolated gamma LUT test

 lib/drmtest.c                  |  13 +++
 lib/drmtest.h                  |   3 +
 tests/kms_color.c              | 147 +++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c       |  34 ++++++++
 tests/kms_color_helper.h       |   8 ++
 tests/meson.build              |   2 +
 tests/stm-ci/blacklist-stm.txt |  41 +++++++++
 tests/stm-ci/meson.build       |   6 ++
 8 files changed, 254 insertions(+)
 create mode 100644 tests/stm-ci/blacklist-stm.txt
 create mode 100644 tests/stm-ci/meson.build

-- 
2.25.1
