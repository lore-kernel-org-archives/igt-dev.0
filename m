Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: igt-dev-request@lists.freedesktop.org
Subject: igt-dev Digest, Vol 51, Issue 197
To: igt-dev@lists.freedesktop.org
Reply-To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 13:22:01 +0000
Message-ID: <mailman.2573.1645622521.1121.igt-dev@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Send igt-dev mailing list submissions to
	igt-dev@lists.freedesktop.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.freedesktop.org/mailman/listinfo/igt-dev
or, via email, send a message with subject or body 'help' to
	igt-dev-request@lists.freedesktop.org

You can reach the person managing the list at
	igt-dev-owner@lists.freedesktop.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of igt-dev digest..."


Today's Topics:

   1. ? Fi.CI.BAT: success for Use safe alignment as a default
      (Patchwork)
   2. [PATCH i-g-t, v3] i915/gem_flink_basic: Add subtests
      description for test case (apoorva1.singh@intel.com)
   3. Re: [PATCH i-g-t v4] tests/i915:Extend
      kms_frontbuffer_tracking to test FBC on multiple pipes (Ville Syrj?l?)


----------------------------------------------------------------------

Message: 1
Date: Wed, 23 Feb 2022 12:12:20 -0000
From: Patchwork <patchwork@emeril.freedesktop.org>
To: Zbigniew Kempczy?ski <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: [igt-dev] ? Fi.CI.BAT: success for Use safe alignment as a
	default
Message-ID:
	<164561834094.25291.1427999903627867120@emeril.freedesktop.org>
Content-Type: text/plain; charset="utf-8"

== Series Details ==

Series: Use safe alignment as a default
URL   : https://patchwork.freedesktop.org/series/100627/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11270 -> IGTPW_6682
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/index.html

Participating hosts (41 -> 42)
------------------------------

  Additional (3): fi-kbl-soraka fi-bxt-dsi bat-adlp-4 
  Missing    (2): fi-bdw-samus fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_6682 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - fi-blb-e6850:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-blb-e6850/igt@amdgpu/amd_basic@cs-multi-fence.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271]) +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@gem_lmem_swapping@basic.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-bxt-dsi/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][8] ([i915#3282])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][9] ([i915#1886] / [i915#2291])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][12] ([fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-4:         NOTRUN -> [SKIP][13] ([i915#4103]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][14] ([fdo#109271]) +30 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-4:         NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#533])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#533])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][18] -> [FAIL][19] ([i915#4547])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-4:         NOTRUN -> [SKIP][20] ([i915#3291] / [i915#3708]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][21] ([i915#3301] / [i915#3708])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [INCOMPLETE][22] ([i915#4898]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][24] ([i915#5026]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-cfl-8109u:       [DMESG-WARN][26] ([i915#165]) -> [PASS][27] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-cfl-8109u/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [DMESG-WARN][28] ([i915#165] / [i915#295]) -> [PASS][29] +13 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][30] ([i915#4494] / [i915#4957]) -> [DMESG-FAIL][31] ([i915#4957])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][32] ([i915#1436] / [i915#4312]) -> [FAIL][33] ([i915#4312])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11270/fi-skl-6600u/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4898]: https://gitlab.freedesktop.org/drm/intel/issues/4898
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5026]: https://gitlab.freedesktop.org/drm/intel/issues/5026
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6354 -> IGTPW_6682

  CI-20190529: 20190529
  CI_DRM_11270: c008324ab90112f841b4bfa3a1399ddb8d044a8d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6682: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/index.html
  IGT_6354: 7146765b80919e3f134398ba433b36a56377e4c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@api_intel_allocator@alignment

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6682/index.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <https://lists.freedesktop.org/archives/igt-dev/attachments/20220223/d294be83/attachment-0001.htm>

------------------------------

Message: 2
Date: Wed, 23 Feb 2022 18:28:37 +0530
From: apoorva1.singh@intel.com
To: igt-dev@lists.freedesktop.org,	kamil.konieczny@linux.intel.com
Subject: [igt-dev] [PATCH i-g-t, v3] i915/gem_flink_basic: Add
	subtests description for test case
Message-ID: <20220223125837.340407-1-apoorva1.singh@intel.com>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

v2: Modified a description to be more clear

v3: Rebase

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_flink_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 48b0b8b1..ad370eb4 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -161,16 +161,24 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Check if gem object can be exported to global namespace and then opened");
 	igt_subtest("basic")
 		test_flink(fd);
+
+	igt_describe("Tests that multiple flinks for the same gem object share the same name");
 	igt_subtest("double-flink")
 		test_double_flink(fd);
+
+	igt_describe("Verify that GEM_FLINK ioctl with invalid gem object retuns relevant error");
 	igt_subtest("bad-flink")
 		test_bad_flink(fd);
+
+	igt_describe("Verify that GEM_OPEN ioctl with invalid flink name retuns relevant error");
 	igt_subtest("bad-open")
 		test_bad_open(fd);
 
 	/* Flink lifetime is limited to that of the gem object it points to */
+	igt_describe("Tests flink lifetime by referencing it from multiple fd's");
 	igt_subtest("flink-lifetime")
 		test_flink_lifetime(fd);
 }
-- 
2.25.1



------------------------------

Message: 3
Date: Wed, 23 Feb 2022 15:21:57 +0200
From: Ville Syrj?l? <ville.syrjala@linux.intel.com>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@intel.com
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915:Extend
	kms_frontbuffer_tracking to test FBC on multiple pipes
Message-ID: <YhY09fYwofNN8O81@intel.com>
Content-Type: text/plain; charset=iso-8859-1

On Mon, Feb 21, 2022 at 05:40:57PM +0530, Nidhi Gupta wrote:
> In future more platforms will support FBC on
> multiple pipes, so to validate the same extending
> the kms_frontbuffer_tracking test.
> 
> In kernel code now  FBC debugfs files are exposed
> for each crtc so added debugfs_read_crtc function
> to get the per pipe fbc status.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/i915/kms_frontbuffer_tracking.c | 40 ++++++++++++++-------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 532bfbb9..c31adc38 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -732,8 +732,21 @@ static int __debugfs_write(const char *param, char *buf, int len)
>  	return igt_sysfs_write(drm.debugfs, param, buf, len - 1);
>  }
>  
> +static void __debugfs_read_crtc(const char *param, char *buf, int len)
> +{
> +	int dir;
> +	enum pipe pipe;
> +
> +	pipe = prim_mode_params.pipe;
> +	dir = igt_debugfs_pipe_dir(drm.fd, pipe, O_RDONLY);

Shouldn't that be O_DIRECTORY?

> +	igt_require_fd(dir);
> +	igt_debugfs_simple_read(dir, param, buf, len);
> +	close(dir);
> +}
> +
>  #define debugfs_read(p, arr) __debugfs_read(p, arr, sizeof(arr))
>  #define debugfs_write(p, arr) __debugfs_write(p, arr, sizeof(arr))
> +#define debugfs_read_crtc(p, arr) __debugfs_read_crtc(p, arr, sizeof(arr))
>  
>  static char last_fbc_buf[128];
>  
> @@ -742,7 +755,7 @@ static bool fbc_is_enabled(int lvl)
>  	char buf[128];
>  	bool print = true;
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	if (lvl != IGT_LOG_DEBUG)
>  		last_fbc_buf[0] = '\0';
>  	else if (strcmp(last_fbc_buf, buf))
> @@ -825,8 +838,8 @@ static struct timespec fbc_get_last_action(void)
>  	char *action;
>  	ssize_t n_read;
>  
> -	debugfs_read("i915_fbc_status", buf);
>  
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	action = strstr(buf, "\nLast action:");
>  	igt_assert(action);
>  
> @@ -874,8 +887,8 @@ static void fbc_setup_last_action(void)
>  	char buf[128];
>  	char *action;
>  
> -	debugfs_read("i915_fbc_status", buf);
>  
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	action = strstr(buf, "\nLast action:");
>  	if (!action) {
>  		igt_info("FBC last action not supported\n");
> @@ -893,7 +906,7 @@ static bool fbc_is_compressing(void)
>  {
>  	char buf[128];
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	return strstr(buf, "\nCompressing: yes\n") != NULL;
>  }
>  
> @@ -906,7 +919,7 @@ static bool fbc_not_enough_stolen(void)
>  {
>  	char buf[128];
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	return strstr(buf, "FBC disabled: not enough stolen memory\n");
>  }
>  
> @@ -914,7 +927,7 @@ static bool fbc_stride_not_supported(void)
>  {
>  	char buf[128];
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
>  }
>  
> @@ -922,7 +935,7 @@ static bool fbc_mode_too_large(void)
>  {
>  	char buf[128];
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	return strstr(buf, "FBC disabled: mode too large for compression\n");
>  }
>  
> @@ -1388,7 +1401,7 @@ static bool fbc_supported_on_chipset(void)
>  {
>  	char buf[128];
>  
> -	debugfs_read("i915_fbc_status", buf);
> +	debugfs_read_crtc("i915_fbc_status", buf);
>  	if (*buf == '\0')
>  		return false;
>  
> @@ -1404,17 +1417,6 @@ static void setup_fbc(void)
>  		return;
>  	}
>  
> -	/*
> -	 * While some platforms do allow FBC on pipes B/C, this test suite
> -	 * is not prepared for that yet.
> -	 * TODO: solve this.
> -	 */
> -	if (prim_mode_params.pipe != PIPE_A) {
> -		igt_info("Can't test FBC: primary connector doesn't support "
> -			 "pipe A\n");
> -		return;
> -	}
> -
>  	/* Early Generations are not able to report compression status. */
>  	if (!AT_LEAST_GEN(devid, 7))
>  		opt.fbc_check_compression = false;
> -- 
> 2.26.2

-- 
Ville Syrj?l?
Intel


------------------------------

Subject: Digest Footer

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev


------------------------------

End of igt-dev Digest, Vol 51, Issue 197
****************************************
