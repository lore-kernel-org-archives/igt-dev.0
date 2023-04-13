Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:48:50 -0700
Message-Id: <20230413004850.1985672-4-vinay.belgaumkar@intel.com>
In-Reply-To: <20230413004850.1985672-1-vinay.belgaumkar@intel.com>
References: <20230413004850.1985672-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] HAX: tests/i915: Try out the SLPC IGT
 tests
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

Trying out for CI. Do not review.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d9fcb62d..653668dd 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -139,6 +139,8 @@ igt@prime_self_import@basic-with_fd_dup
 igt@prime_self_import@basic-with_one_bo
 igt@prime_self_import@basic-with_one_bo_two_files
 igt@prime_self_import@basic-with_two_bos
+igt@i915_pm_freq_api@freq-basic-api
+igt@i915_pm_freq_api@freq-reset
 igt@prime_vgem@basic-fence-flip
 igt@prime_vgem@basic-fence-mmap
 igt@prime_vgem@basic-fence-read
-- 
2.38.1
