Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F054C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 19:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1567310E701;
	Wed, 14 May 2025 19:44:10 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEF510E701;
 Wed, 14 May 2025 19:44:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4348254496391277160=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Replace_intel=5Fsysfs=5Fd?=
 =?utf-8?q?ebugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 May 2025 19:44:08 -0000
Message-ID: <174725184856.80824.5721280696854527833@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============4348254496391277160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace intel_sysfs_debugfs
URL   : https://patchwork.freedesktop.org/series/149023/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8364 -> IGTPW_13128
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13128 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13128, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/index.html

Participating hosts (45 -> 44)
------------------------------

  Additional (1): bat-arlh-2 
  Missing    (2): bat-twl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13128:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries:
    - bat-mtlp-6:         [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg2-9:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-adlp-11:        [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg1-6:          [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg1-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg1-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-adlp-6:         [PASS][9] -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-twl-2:          [PASS][11] -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-twl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-twl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg2-11:         [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg2-14:         [PASS][15] -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-14/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-14/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-atsm-1:         [PASS][17] -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-mtlp-9:         [PASS][19] -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-arls-6:         [PASS][21] -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-mtlp-8:         [PASS][23] -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg2-8:          [PASS][25] -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-adls-6:         [PASS][27] -> [SKIP][28] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-arlh-3:         [PASS][29] -> [SKIP][30] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arlh-3/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-3/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-dg1-7:          [PASS][31] -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg1-7/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg1-7/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-adlp-9:         [PASS][33] -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html

  * igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries:
    - bat-rpls-4:         [PASS][35] -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-rpls-4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-rpls-4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - bat-arls-5:         [PASS][37] -> [SKIP][38] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-5/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-5/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - bat-rplp-1:         [PASS][39] -> [SKIP][40] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-rplp-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-rplp-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - fi-rkl-11600:       [PASS][41] -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-rkl-11600/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-rkl-11600/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - fi-tgl-1115g4:      [PASS][43] -> [SKIP][44] +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-tgl-1115g4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-tgl-1115g4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html

  
Known issues
------------

  Here are the changes found in IGTPW_13128 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-arlh-2:         NOTRUN -> [SKIP][45] ([i915#11345] / [i915#11346]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arlh-2:         NOTRUN -> [SKIP][46] ([i915#11346] / [i915#1849])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][47] ([i915#10213] / [i915#11346] / [i915#11671]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][48] ([i915#11343] / [i915#11346])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][49] ([i915#10197] / [i915#10211] / [i915#11346] / [i915#11725])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][50] ([i915#11346] / [i915#12637]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arlh-2:         NOTRUN -> [SKIP][51] ([i915#10206] / [i915#11346] / [i915#11724])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arlh-2:         NOTRUN -> [SKIP][52] ([i915#10209] / [i915#11346] / [i915#11681])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live:
    - bat-arlh-2:         NOTRUN -> [ABORT][53] ([i915#13723]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@reset:
    - bat-atsm-1:         [PASS][54] -> [ABORT][55] ([i915#14201])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@i915_selftest@live@reset.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [PASS][56] -> [DMESG-FAIL][57] ([i915#12061]) +1 other test dmesg-fail
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][58] -> [DMESG-FAIL][59] ([i915#12061]) +1 other test dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  * igt@intel_hwmon@hwmon-read:
    - bat-arlh-2:         NOTRUN -> [SKIP][60] ([i915#11346] / [i915#11680] / [i915#7707]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@intel_hwmon@hwmon-read.html

  * igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries:
    - fi-cfl-guc:         [PASS][61] -> [SKIP][62] +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-kbl-x1275:       [PASS][63] -> [SKIP][64] +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-x1275/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-x1275/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-cfl-8109u:       [PASS][65] -> [SKIP][66] +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-8109u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-8109u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-ilk-650:         [PASS][67] -> [SKIP][68] +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-ilk-650/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-ilk-650/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-blb-e6850:       [PASS][69] -> [SKIP][70] +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-blb-e6850/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-blb-e6850/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - bat-kbl-2:          [PASS][71] -> [SKIP][72] +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-kbl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-kbl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-skl-6600u:       [PASS][73] -> [SKIP][74] +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-skl-6600u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-skl-6600u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-cfl-8700k:       [PASS][75] -> [SKIP][76] +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-8700k/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-8700k/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-ivb-3770:        [PASS][77] -> [SKIP][78] +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-ivb-3770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-ivb-3770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-elk-e7500:       [PASS][79] -> [SKIP][80] +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-elk-e7500/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-elk-e7500/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-bsw-nick:        [PASS][81] -> [SKIP][82] +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-bsw-nick/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-bsw-nick/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-hsw-4770:        [PASS][83] -> [SKIP][84] +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-hsw-4770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-hsw-4770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-kbl-guc:         [PASS][85] -> [SKIP][86] +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-bsw-n3050:       [PASS][87] -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-bsw-n3050/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-bsw-n3050/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-pnv-d510:        [PASS][89] -> [SKIP][90] +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-pnv-d510/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-pnv-d510/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
    - fi-glk-j4005:       [PASS][91] -> [SKIP][92] +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-glk-j4005/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-glk-j4005/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html

  * igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries:
    - fi-kbl-7567u:       [PASS][93] -> [SKIP][94] +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-7567u/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-7567u/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - fi-kbl-8809g:       [PASS][95] -> [SKIP][96] +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-8809g/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-8809g/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
    - bat-apl-1:          [PASS][97] -> [SKIP][98] +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-apl-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-apl-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arlh-2:         NOTRUN -> [SKIP][99] ([i915#10200] / [i915#11346] / [i915#11666] / [i915#12203])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-arlh-2:         NOTRUN -> [SKIP][100] ([i915#10200] / [i915#11346] / [i915#11666]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-arlh-2:         NOTRUN -> [SKIP][101] ([i915#11346]) +34 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arlh-2:         NOTRUN -> [SKIP][102] ([i915#10208] / [i915#11346] / [i915#8809])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arlh-2:         NOTRUN -> [SKIP][103] ([i915#10212] / [i915#11346] / [i915#11726])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-arlh-2:         NOTRUN -> [SKIP][104] ([i915#10214] / [i915#11346] / [i915#11726])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arlh-2:         NOTRUN -> [SKIP][105] ([i915#10216] / [i915#11346] / [i915#11723])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [INCOMPLETE][106] ([i915#12904]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-apl-1/igt@dmabuf@all-tests.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [DMESG-FAIL][108] ([i915#12061]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-9:          [DMESG-FAIL][110] ([i915#12061]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-11:         [DMESG-FAIL][112] ([i915#12061]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [FAIL][114] ([i915#13930]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][116] ([i915#12061] / [i915#13929]) -> [ABORT][117] ([i915#14201])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@i915_selftest@live.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
  [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
  [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12203]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
  [i915#12637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#13930]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13930
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8364 -> IGTPW_13128
  * Linux: CI_DRM_16544 -> CI_DRM_16545

  CI-20190529: 20190529
  CI_DRM_16544: 2e72fd09b4fb0823282977f0717159e47328a533 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16545: dd6a856541dd90fa4ef755783898fcfbea3b9961 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13128: 13128
  IGT_8364: 8364

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/index.html

--===============4348254496391277160==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Replace intel_sysfs_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149023/">https://patchwork.freedesktop.org/series/149023/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8364 -&gt; IGTPW_13128</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13128 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13128, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Additional (1): bat-arlh-2 <br />
  Missing    (2): bat-twl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13128:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg1-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg1-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-twl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-twl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-11/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-14/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-14/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-mtlp-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-mtlp-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-8/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adls-6/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arlh-3/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-3/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg1-7/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg1-7/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-adlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-adlp-9/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-rpls-4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-rpls-4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-5/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-5/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-rplp-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-rplp-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-rkl-11600/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-rkl-11600/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-tgl-1115g4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-tgl-1115g4/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13128 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345">i915#11345</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213">i915#10213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343">i915#11343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725">i915#11725</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637">i915#12637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724">i915#11724</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209">i915#10209</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-x1275/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-x1275/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-8109u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-8109u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-ilk-650/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-ilk-650/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-blb-e6850/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-blb-e6850/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-kbl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-kbl-2/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-skl-6600u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-skl-6600u/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-cfl-8700k/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-cfl-8700k/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-ivb-3770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-ivb-3770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-elk-e7500/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-elk-e7500/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-bsw-nick/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-bsw-nick/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-hsw-4770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-hsw-4770/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-guc/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-bsw-n3050/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-bsw-n3050/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-pnv-d510/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-pnv-d510/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-glk-j4005/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-glk-j4005/igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-7567u/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-7567u/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-kbl-8809g/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-kbl-8809g/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-apl-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-apl-1/igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200">i915#10200</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666">i915#11666</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726">i915#11726</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arlh-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723">i915#11723</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13930">i915#13930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8364/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13128/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8364 -&gt; IGTPW_13128</li>
<li>Linux: CI_DRM_16544 -&gt; CI_DRM_16545</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16544: 2e72fd09b4fb0823282977f0717159e47328a533 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16545: dd6a856541dd90fa4ef755783898fcfbea3b9961 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13128: 13128<br />
  IGT_8364: 8364</p>

</body>
</html>

--===============4348254496391277160==--
