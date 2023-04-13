Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:48:47 -0700
Message-Id: <20230413004850.1985672-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t 0/3] tests/slpc: Add basic IGT test
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


Borrow some subtests from xe_guc_pc. Also add per GT debugfs helpers.

v3: Review comments and add HAX patch
v4: Modify the condition for skipping the test

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  lib/debugfs: Add per GT debugfs helpers
  i915_pm_freq_api: Add some basic SLPC igt tests
  HAX: tests/i915: Try out the SLPC IGT tests

 lib/igt_debugfs.c                     |  60 ++++++++++
 lib/igt_debugfs.h                     |   4 +
 tests/i915/i915_pm_freq_api.c         | 152 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   2 +
 tests/meson.build                     |   1 +
 5 files changed, 219 insertions(+)
 create mode 100644 tests/i915/i915_pm_freq_api.c

-- 
2.38.1
