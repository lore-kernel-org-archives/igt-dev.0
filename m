Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 20:05:02 -0000
Message-ID: <158162430234.17959.13731412429786046147@emeril.freedesktop.org>
References: <20200213190316.3693878-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200213190316.3693878-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fflush=3A_Forgo_I915=5FEXEC=5FNORELOC?=
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

Series: i915/gem_exec_flush: Forgo I915_EXEC_NORELOC
URL   : https://patchwork.freedesktop.org/series/73423/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7934 -> IGTPW_4148
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4148/index.html

Known issues
------------

  Here are the changes found in IGTPW_4148 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4148/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][3] ([fdo#111732] / [fdo#112271]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7934/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4148/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937


Participating hosts (43 -> 46)
------------------------------

  Additional (8): fi-bsw-n3050 fi-hsw-peppy fi-skl-6770hq fi-bwr-2160 fi-gdg-551 fi-cfl-8109u fi-bsw-kefka fi-skl-lmem 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5440 -> IGTPW_4148

  CI-20190529: 20190529
  CI_DRM_7934: 16668f8cd3512f56f626acaed0dd9245692ea3dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4148/index.html
  IGT_5440: 860924b6ccbed75b66ab4b65897bb9abc91763ea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4148/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
