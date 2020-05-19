Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 11:40:09 -0000
Message-ID: <158988840948.31239.1183736992330605036@emeril.freedesktop.org>
References: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fparams=3A_Fix_verifying_of_debugfs_parameters?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_params: Fix verifying of debugfs parameters
URL   : https://patchwork.freedesktop.org/series/77409/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8501 -> IGTPW_4586
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html

Known issues
------------

  Here are the changes found in IGTPW_4586 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [PASS][1] -> [INCOMPLETE][2] ([i915#1874])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-tgl-y:           [INCOMPLETE][3] ([i915#1803]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8501/fi-tgl-y/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/fi-tgl-y/igt@i915_selftest@live@execlists.html

  
  [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
  [i915#1874]: https://gitlab.freedesktop.org/drm/intel/issues/1874


Participating hosts (50 -> 42)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4586

  CI-20190529: 20190529
  CI_DRM_8501: c6bfff03c22fb90dcf1ddacb745667467ab5ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4586/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
