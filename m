Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 May 2020 11:11:02 -0000
Message-ID: <158867706268.25911.5134200985258251331@emeril.freedesktop.org>
References: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200505102702.2607265-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exploit_resource_contention_to_verify_execbu?=
 =?utf-8?q?f_independence_=28rev3=29?=
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

Series: i915/gem_ctx_exec: Exploit resource contention to verify execbuf independence (rev3)
URL   : https://patchwork.freedesktop.org/series/76896/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8427 -> IGTPW_4531
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html

Known issues
------------

  Here are the changes found in IGTPW_4531 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2] ([i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/fi-bwr-2160/igt@i915_selftest@live@gem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/fi-bwr-2160/igt@i915_selftest@live@gem.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [PASS][3] -> [FAIL][4] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-whl-u:           [PASS][5] -> [FAIL][6] ([fdo#103375])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/fi-whl-u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/fi-whl-u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][7] ([fdo#109271]) -> [FAIL][8] ([i915#62])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8427/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Participating hosts (50 -> 43)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5632 -> IGTPW_4531

  CI-20190529: 20190529
  CI_DRM_8427: d7afe86abe766f68e758be1c9db6618e55bdf38d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4531: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html
  IGT_5632: e630cb8cd2ec01d6d5358eb2a3f6ea70498b8183 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ctx_exec@basic-pi-active

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4531/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
