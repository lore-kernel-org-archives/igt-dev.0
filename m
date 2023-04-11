Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB1510E23A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:15:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:45 +0300
Message-Id: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/9] tests/kms_color: Improve CTM tests
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>


Bunch of fixe and cleanups to the CTM tests. Also add a new
"signed" subtest to highlight a bug in the i915 CHV CGM code.

v2: Tweak the dyamic subtest stuff in order to
    make CHV actually run the tests

Ville Syrjälä (9):
  tests/kms_color: Use legacy LUT for chopping off the lsbs
  tests/kms_color: Use named initializers
  tests/kms_color: Make loads of stuff static const
  tests/kms_color: Pass down the colors used to paint the fb
  tests/kms_color: Get rid of hand coded "expected_colors"
  tests/kms_color: Add and additional "signed" subtest
  tests/kms_color: Dump the CTM before/after color values
  tests/kms_color: Move dynamic subtests up one level
  tests/intel-ci/fast-feedback: Run ctm tests

 tests/intel-ci/fast-feedback.testlist |  11 +
 tests/kms_color.c                     | 335 +++++++++++++++-----------
 tests/kms_color_helper.c              |   4 +-
 tests/kms_color_helper.h              |   4 +-
 4 files changed, 208 insertions(+), 146 deletions(-)

-- 
2.39.2
