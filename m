Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 04 Apr 2020 11:10:48 -0000
Message-ID: <158599864806.1393.12921804255748463065@emeril.freedesktop.org>
References: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Skip_interruptible_testing_for_negative_and_hangs_tests?=
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

Series: kms_flip: Skip interruptible testing for negative and hangs tests
URL   : https://patchwork.freedesktop.org/series/75493/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8253 -> IGTPW_4406
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html

Known issues
------------

  Here are the changes found in IGTPW_4406 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [SKIP][1] ([fdo#109271]) -> [PASS][2] +24 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271


Participating hosts (41 -> 42)
------------------------------

  Additional (9): fi-kbl-soraka fi-bdw-5557u fi-hsw-peppy fi-ilk-650 fi-gdg-551 fi-cfl-8109u fi-blb-e6850 fi-byt-n2820 fi-snb-2600 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-byt-squawks fi-snb-2520m fi-skl-lmem fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5563 -> IGTPW_4406

  CI-20190529: 20190529
  CI_DRM_8253: 8bbc7715c48433ba115be5c3066d029891819547 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4406: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html
  IGT_5563: 7ab7807727262b7ed7e12197b78e867287a17ef6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@kms_flip@2x-flip-vs-dpms-interruptible
-igt@kms_flip@2x-flip-vs-modeset-interruptible
-igt@kms_flip@2x-flip-vs-modeset-vs-hang-interruptible
-igt@kms_flip@2x-flip-vs-panning-vs-hang-interruptible
-igt@kms_flip@flip-vs-dpms-interruptible
-igt@kms_flip@flip-vs-modeset-interruptible
-igt@kms_flip@flip-vs-modeset-vs-hang-interruptible
-igt@kms_flip@flip-vs-panning-vs-hang-interruptible

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
