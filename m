Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 18 Feb 2020 20:11:42 -0000
Message-ID: <158205670247.31430.10939512220510412452@emeril.freedesktop.org>
References: <20200218125333.29250-1-katarzyna.dec@intel.com>
In-Reply-To: <20200218125333.29250-1-katarzyna.dec@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBD?=
 =?utf-8?q?heck_if_device_is_not_wedged_while_opening_fd_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Check if device is not wedged while opening fd (rev2)
URL   : https://patchwork.freedesktop.org/series/73570/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7961 -> IGTPW_4178
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4178 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4178, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4178:

### IGT changes ###

#### Possible regressions ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-8809g/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-hsw-4770r:       [PASS][2] -> [FAIL][3] +21 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-hsw-4770r/igt@prime_vgem@basic-fence-flip.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-hsw-4770r/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][4] +21 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-7500u/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][5] +21 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
    - fi-cml-s:           [PASS][6] -> [FAIL][7] +21 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-cml-s/igt@prime_vgem@basic-fence-read.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cml-s/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-fence-wait-default:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][8] +21 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cfl-8109u/igt@prime_vgem@basic-fence-wait-default.html

  * igt@prime_vgem@basic-gtt:
    - fi-ilk-650:         [PASS][9] -> [FAIL][10] +21 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-ilk-650/igt@prime_vgem@basic-gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-ilk-650/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - fi-kbl-guc:         [PASS][11] -> [FAIL][12] +20 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-guc/igt@prime_vgem@basic-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-guc/igt@prime_vgem@basic-read.html
    - fi-icl-guc:         [PASS][13] -> [FAIL][14] +21 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-icl-guc/igt@prime_vgem@basic-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-icl-guc/igt@prime_vgem@basic-read.html
    - fi-bwr-2160:        [PASS][15] -> [FAIL][16] +16 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bwr-2160/igt@prime_vgem@basic-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bwr-2160/igt@prime_vgem@basic-read.html
    - fi-kbl-r:           NOTRUN -> [FAIL][17] +21 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-r/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-sync-default:
    - fi-hsw-4770:        [PASS][18] -> [FAIL][19] +21 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-hsw-4770/igt@prime_vgem@basic-sync-default.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-hsw-4770/igt@prime_vgem@basic-sync-default.html
    - fi-bxt-dsi:         [PASS][20] -> [FAIL][21] +21 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bxt-dsi/igt@prime_vgem@basic-sync-default.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bxt-dsi/igt@prime_vgem@basic-sync-default.html
    - fi-cml-u2:          [PASS][22] -> [FAIL][23] +21 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-cml-u2/igt@prime_vgem@basic-sync-default.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cml-u2/igt@prime_vgem@basic-sync-default.html

  * igt@prime_vgem@basic-wait-default:
    - fi-icl-dsi:         [PASS][24] -> [FAIL][25] +21 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-icl-dsi/igt@prime_vgem@basic-wait-default.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-icl-dsi/igt@prime_vgem@basic-wait-default.html
    - fi-pnv-d510:        [PASS][26] -> [FAIL][27] +21 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-pnv-d510/igt@prime_vgem@basic-wait-default.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-pnv-d510/igt@prime_vgem@basic-wait-default.html

  * igt@prime_vgem@basic-write:
    - fi-skl-lmem:        [PASS][28] -> [FAIL][29] +21 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-skl-lmem/igt@prime_vgem@basic-write.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-skl-lmem/igt@prime_vgem@basic-write.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][30] +21 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-skl-6600u/igt@prime_vgem@basic-write.html

  * igt@vgem_basic@debugfs:
    - fi-icl-u2:          [PASS][31] -> [FAIL][32] +21 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-icl-u2/igt@vgem_basic@debugfs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-icl-u2/igt@vgem_basic@debugfs.html

  * igt@vgem_basic@dmabuf-export:
    - fi-glk-dsi:         [PASS][33] -> [FAIL][34] +21 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-glk-dsi/igt@vgem_basic@dmabuf-export.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-glk-dsi/igt@vgem_basic@dmabuf-export.html
    - fi-apl-guc:         [PASS][35] -> [FAIL][36] +21 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-apl-guc/igt@vgem_basic@dmabuf-export.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-apl-guc/igt@vgem_basic@dmabuf-export.html
    - fi-snb-2520m:       [PASS][37] -> [FAIL][38] +20 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-snb-2520m/igt@vgem_basic@dmabuf-export.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-snb-2520m/igt@vgem_basic@dmabuf-export.html
    - fi-cfl-8700k:       [PASS][39] -> [FAIL][40] +21 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-cfl-8700k/igt@vgem_basic@dmabuf-export.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cfl-8700k/igt@vgem_basic@dmabuf-export.html

  * igt@vgem_basic@dmabuf-fence:
    - fi-icl-u3:          [PASS][41] -> [FAIL][42] +21 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-icl-u3/igt@vgem_basic@dmabuf-fence.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-icl-u3/igt@vgem_basic@dmabuf-fence.html
    - fi-cfl-guc:         [PASS][43] -> [FAIL][44] +21 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-cfl-guc/igt@vgem_basic@dmabuf-fence.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cfl-guc/igt@vgem_basic@dmabuf-fence.html
    - fi-snb-2600:        NOTRUN -> [FAIL][45] +21 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-snb-2600/igt@vgem_basic@dmabuf-fence.html
    - fi-skl-guc:         [PASS][46] -> [FAIL][47] +21 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-skl-guc/igt@vgem_basic@dmabuf-fence.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-skl-guc/igt@vgem_basic@dmabuf-fence.html

  * igt@vgem_basic@dmabuf-mmap:
    - fi-ivb-3770:        [PASS][48] -> [FAIL][49] +21 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-ivb-3770/igt@vgem_basic@dmabuf-mmap.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-ivb-3770/igt@vgem_basic@dmabuf-mmap.html

  * igt@vgem_basic@mmap:
    - fi-skl-6700k2:      [PASS][50] -> [FAIL][51] +21 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-skl-6700k2/igt@vgem_basic@mmap.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-skl-6700k2/igt@vgem_basic@mmap.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][52] +21 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-blb-e6850/igt@vgem_basic@mmap.html

  * igt@vgem_basic@second-client:
    - fi-kbl-x1275:       [PASS][53] -> [FAIL][54] +21 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-x1275/igt@vgem_basic@second-client.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-x1275/igt@vgem_basic@second-client.html

  * igt@vgem_basic@setversion:
    - fi-kbl-8809g:       [PASS][55] -> [FAIL][56] +36 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-8809g/igt@vgem_basic@setversion.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-8809g/igt@vgem_basic@setversion.html
    - fi-icl-y:           [PASS][57] -> [FAIL][58] +21 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-icl-y/igt@vgem_basic@setversion.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-icl-y/igt@vgem_basic@setversion.html
    - fi-gdg-551:         [PASS][59] -> [FAIL][60] +16 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-gdg-551/igt@vgem_basic@setversion.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-gdg-551/igt@vgem_basic@setversion.html

  * igt@vgem_basic@sysfs:
    - fi-bdw-5557u:       [PASS][61] -> [FAIL][62] +21 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bdw-5557u/igt@vgem_basic@sysfs.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bdw-5557u/igt@vgem_basic@sysfs.html
    - fi-bsw-nick:        [PASS][63] -> [FAIL][64] +20 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bsw-nick/igt@vgem_basic@sysfs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bsw-nick/igt@vgem_basic@sysfs.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-kbl-8809g:       [DMESG-WARN][65] ([i915#1209]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-8809g/igt@amdgpu/amd_prime@i915-to-amd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-8809g/igt@amdgpu/amd_prime@i915-to-amd.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        [SKIP][67] ([fdo#109271]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-8809g:       [SKIP][69] ([fdo#109271]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html
    - fi-snb-2520m:       [SKIP][71] ([fdo#109271]) -> [FAIL][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html
    - fi-kbl-guc:         [SKIP][73] ([fdo#109271]) -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-kbl-guc/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-wait-default:
    - fi-gdg-551:         [SKIP][75] ([fdo#109271]) -> [FAIL][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-gdg-551/igt@prime_vgem@basic-fence-wait-default.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-gdg-551/igt@prime_vgem@basic-fence-wait-default.html

  * igt@prime_vgem@basic-wait-default:
    - fi-bwr-2160:        [SKIP][77] ([fdo#109271]) -> [FAIL][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-bwr-2160/igt@prime_vgem@basic-wait-default.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-bwr-2160/igt@prime_vgem@basic-wait-default.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@prime_vgem@basic-fence-mmap:
    - {fi-tgl-u}:         [PASS][79] -> [FAIL][80] +21 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-tgl-u/igt@prime_vgem@basic-fence-mmap.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-tgl-u/igt@prime_vgem@basic-fence-mmap.html

  * igt@vgem_basic@debugfs:
    - {fi-tgl-dsi}:       [PASS][81] -> [FAIL][82] +21 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-tgl-dsi/igt@vgem_basic@debugfs.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-tgl-dsi/igt@vgem_basic@debugfs.html

  
Known issues
------------

  Here are the changes found in IGTPW_4178 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][83] -> [INCOMPLETE][84] ([i915#694] / [i915#816])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - {fi-ehl-1}:         [INCOMPLETE][85] ([i915#937]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-ehl-1/igt@gem_exec_parallel@contexts.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-ehl-1/igt@gem_exec_parallel@contexts.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-guc:         [INCOMPLETE][87] ([i915#151]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-skl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][89] ([i915#877]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7961/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1209]: https://gitlab.freedesktop.org/drm/intel/issues/1209
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (43 -> 43)
------------------------------

  Additional (7): fi-kbl-7500u fi-cfl-8109u fi-bsw-kefka fi-blb-e6850 fi-snb-2600 fi-skl-6600u fi-kbl-r 
  Missing    (7): fi-kbl-soraka fi-hsw-4200u fi-bsw-n3050 fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5448 -> IGTPW_4178

  CI-20190529: 20190529
  CI_DRM_7961: e922b318df45b82e75087ecfaceb998db2dd6213 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4178: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/index.html
  IGT_5448: 116020b1f83c1b3994c76882df7f77b6731d78ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4178/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
