Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 12:51:25 -0000
Message-ID: <158211668542.21059.9346255195074806710@emeril.freedesktop.org>
References: <20200219121312.1428041-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200219121312.1428041-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fvm=5Fcreate=3A_Call_set-domain_manually?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_vm_create: Call set-domain manually
URL   : https://patchwork.freedesktop.org/series/73642/
State : success

== Summary ==

CI Bug Log - changes from IGT_5450 -> IGTPW_4183
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/index.html

Known issues
------------

  Here are the changes found in IGTPW_4183 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#1084])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][5] -> [INCOMPLETE][6] ([i915#424])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [DMESG-WARN][7] ([i915#585]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][9] ([fdo#109315]) -> [SKIP][10] ([fdo#109315] / [i915#585])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585


Participating hosts (51 -> 42)
------------------------------

  Additional (2): fi-bwr-2160 fi-snb-2520m 
  Missing    (11): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-bsw-kefka fi-kbl-7560u fi-byt-clapper fi-bsw-nick fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5450 -> IGTPW_4183

  CI-20190529: 20190529
  CI_DRM_7963: e0d737598eb749378a5dc4ed3dfafc6f79d512cb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4183: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/index.html
  IGT_5450: dfba090e720ed4e043158887f1ba6a76059491e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4183/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
