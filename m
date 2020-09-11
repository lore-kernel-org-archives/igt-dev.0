Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 12:30:39 +0200
Message-Id: <20200911103039.4574-25-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 24/24] tests/core_hotunplug: Add
 unbind-rebind subtest to BAT scope
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Unbinding and rebinding the driver to a device scenario is a subset of
unloading and reloading the module and should give equally correct
results.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b98cdb245..aa2eb3295 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -158,6 +158,7 @@ igt@vgem_basic@sysfs
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
 
+igt@core_hotunplug@unbind-rebind
 igt@vgem_basic@unload
 igt@i915_module_load@reload
 igt@i915_pm_rpm@module-reload
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
