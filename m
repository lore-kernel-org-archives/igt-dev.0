Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 15:33:16 -0000
Message-ID: <158592799649.13349.13324219262850402186@emeril.freedesktop.org>
References: <20200403132414.920346-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200403132414.920346-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliOiBC?=
 =?utf-8?q?ump_estimates_for_object_overhead?=
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

Series: lib: Bump estimates for object overhead
URL   : https://patchwork.freedesktop.org/series/75462/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8245 -> IGTPW_4404
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html

Known issues
------------

  Here are the changes found in IGTPW_4404 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#656])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [SKIP][3] ([fdo#109271]) -> [PASS][4] +24 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8245/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (50 -> 45)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4404

  CI-20190529: 20190529
  CI_DRM_8245: 94d1039c46f041c764a8f620b7bd0f9ccac2a2b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4404: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4404/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
