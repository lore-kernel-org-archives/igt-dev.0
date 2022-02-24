Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE710EB59
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 05:05:54 +0000 (UTC)
Date: Thu, 24 Feb 2022 06:05:47 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20220224060547.00f754aa@maurocar-mobl2>
In-Reply-To: <YhY/taVJQSNTGcV+@platvala-desk.ger.corp.intel.com>
References: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
 <20220223111641.467123-10-mauro.chehab@linux.intel.com>
 <YhY/taVJQSNTGcV+@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 9/9] docs: add documentation for code coverage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 23 Feb 2022 16:07:49 +0200
Petri Latvala <petri.latvala@intel.com> wrote:

> On Wed, Feb 23, 2022 at 12:16:41PM +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Document the IGT runner features related to code coverage data capture.
> > 
> > Acked-by: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  docs/code_coverage.md | 293 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 293 insertions(+)
> >  create mode 100644 docs/code_coverage.md
> > 
> > diff --git a/docs/code_coverage.md b/docs/code_coverage.md
> > new file mode 100644
> > index 000000000000..b071df7437bd
> > --- /dev/null
> > +++ b/docs/code_coverage.md
> > @@ -0,0 +1,293 @@
> > +# Collecting code coverage data from IGT tests
> > +
> > +## Introduction
> > +
> > +Ensuring that a test plan covers all the driver code is not trivial. Also,
> > +as time goes by, changes at both the tests and drivers may badly affect
> > +the code coverage. So, some tools are needed in order to be able to verify
> > +and improve the driver test coverage. While static analyzers can help
> > +checking the driver's code, it is not as effective as runtime tests.
> > +
> > +Thankfully gcc has a feature which allows capturing such data in realtime,
> > +called gcov. LLVM/clang also has a similar feature (llvm-cov). Such feature
> > +is available at the Linux Kernel since 2009.
> > +
> > +## Building a Kernel with GCOV support
> > +
> > +Enabling GCOV at the Linux Kernel requires two steps:
> > +
> > +1. Enable GCOV_KERNEL:
> > +
> > +   ```
> > +   ./scripts/config -e DEBUG_FS -e GCOV_KERNEL
> > +   ```
> > +
> > +
> > +2. Enable per-driver or per-makefile GCOV support. In order to enable support
> > +   for all DRM drivers:
> > +
> > +   ```
> > +   for i in $(find drivers/gpu/drm/ -name Makefile); do
> > +       sed '1 a GCOV_PROFILE := y' -i $i
> > +   done
> > +   ```
> > +
> > +When gcov is enabled for a given driver or directory, GCC will generate
> > +some special object files, like:
> > +
> > +```
> > +...
> > +drivers/gpu/drm/drm_probe_helper.gcno
> > +drivers/gpu/drm/drm_dp_dual_mode_helper.gcno
> > +drivers/gpu/drm/drm_plane.gcno
> > +drivers/gpu/drm/drm_lease.gcno
> > +drivers/gpu/drm/drm_mipi_dsi.gcno
> > +drivers/gpu/drm/drm_dsc.gcno
> > +drivers/gpu/drm/drm_property.gcno
> > +drivers/gpu/drm/drm_dp_aux_dev.gcno
> > +drivers/gpu/drm/drm_blend.gcno
> > +...
> > +```
> > +
> > +Those will be stored at the Kernel object directory, which is usually
> > +the same as the Kernel source directory, except if the Kernel was built
> > +with:
> > +
> > +```
> > +make O=kernel_output_dir
> > +```
> > +
> > +Such compile-time files are compiler-dependent and they're needed in order
> > +to properly decode the code coverage counters that will be produced in
> > +runtime.
> > +
> > +## Collecting GCOV data in runtime
> > +
> > +Once a GCOV-enabled Kernel boots, the Kernel will keep track of the code
> > +monitored via GCOV under sysfs, at `/sys/kernel/debug/gcov/`.
> > +
> > +There is a special file there: `/sys/kernel/debug/gcov/reset`. When something
> > +is written to it, all counters will be cleaned.
> > +
> > +There are also driver-related counters and softlinks stored there:
> > +
> > +```
> > +ls -la ./home/gta/linux/drivers/gpu/drm/
> > +...
> > +-rw------- 1 root root 0 Feb 16 07:03 drm_probe_helper.gcda
> > +lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_probe_helper.gcno -> /home/gta/linux/drivers/gpu/drm/drm_probe_helper.gcno
> > +-rw------- 1 root root 0 Feb 16 07:03 drm_property.gcda
> > +lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_property.gcno -> /home/gta/linux/drivers/gpu/drm/drm_property.gcno
> > +-rw------- 1 root root 0 Feb 16 07:03 drm_rect.gcda
> > +lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_rect.gcno -> /home/gta/linux/drivers/gpu/drm/drm_rect.gcno
> > +...
> > +```
> 
> This is an example path but it could be made clearer. Something like
> s!/home/gta/linux!/path/to/kernel/sources! or so?

Makes sense. What about this:

	sed 's!/home/gta/!/basedir/!;s,\./basedir,/basedir,' -i docs/code_coverage.md 

diff --git a/docs/code_coverage.md b/docs/code_coverage.md
index b071df7437bd..34d56d283a75 100644
--- a/docs/code_coverage.md
+++ b/docs/code_coverage.md
@@ -72,14 +72,14 @@ is written to it, all counters will be cleaned.
 There are also driver-related counters and softlinks stored there:
 
 ```
-ls -la ./home/gta/linux/drivers/gpu/drm/
+ls -la /basedir/linux/drivers/gpu/drm/
 ...
 -rw------- 1 root root 0 Feb 16 07:03 drm_probe_helper.gcda
-lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_probe_helper.gcno -> /home/gta/linux/drivers/gpu/drm/drm_probe_helper.gcno
+lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_probe_helper.gcno -> /basedir/linux/drivers/gpu/drm/drm_probe_helper.gcno
 -rw------- 1 root root 0 Feb 16 07:03 drm_property.gcda
-lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_property.gcno -> /home/gta/linux/drivers/gpu/drm/drm_property.gcno
+lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_property.gcno -> /basedir/linux/drivers/gpu/drm/drm_property.gcno
 -rw------- 1 root root 0 Feb 16 07:03 drm_rect.gcda
-lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_rect.gcno -> /home/gta/linux/drivers/gpu/drm/drm_rect.gcno
+lrwxrwxrwx 1 root root 0 Feb 16 07:03 drm_rect.gcno -> /basedir/linux/drivers/gpu/drm/drm_rect.gcno
 ...
 ```
 
@@ -168,17 +168,17 @@ parameter, e. g.:
 ```
 $ echo "igt@debugfs_test@read_all_entries" > my.testlist
 $ ./scripts/run-tests.sh -T my.testlist -k ~/linux -c scripts/code_cov_capture.sh -P
-Found test list: "/home/gta/igt/build/tests/test-list.txt"
+Found test list: "/basedir/igt/build/tests/test-list.txt"
 [31410.499969] [1/1] debugfs_test (read_all_entries)
 [31411.060446] Storing code coverage results...
-[31418.01]     Code coverage wrote to /home/gta/igt/results/code_cov/debugfs_test_read_all_entries.info
+[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/debugfs_test_read_all_entries.info
 Done.
 ```
 
 The script will be called as:
 
 ```
-scripts/code_cov_capture.sh /home/gta/igt/results/code_cov/debugfs_test_read_all_entries
+scripts/code_cov_capture.sh /basedir/igt/results/code_cov/debugfs_test_read_all_entries
 ```
 
 Please notice that any character that it is not a number nor a letter at the
@@ -198,7 +198,7 @@ An info file looks like:
 ```
 TN:fbdev_eof
 ...
-SF:/home/gta/linux/drivers/gpu/drm/i915/intel_runtime_pm.c
+SF:/basedir/linux/drivers/gpu/drm/i915/intel_runtime_pm.c
 ...
 FN:158,__intel_runtime_pm_get
 FNDA:2,__intel_runtime_pm_get
