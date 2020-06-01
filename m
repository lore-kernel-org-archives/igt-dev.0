Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Jun 2020 09:16:44 -0000
Message-ID: <159100300427.14891.17807159756747006118@emeril.freedesktop.org>
References: <20200601084000.31583-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200601084000.31583-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Enhancements_=28rev2=29?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Enhancements (rev2)
URL   : https://patchwork.freedesktop.org/series/77694/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8560 -> IGTPW_4629
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4629:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-tgl-u}:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8560/fi-tgl-u/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/fi-tgl-u/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Participating hosts (50 -> 44)
------------------------------

  Additional (1): fi-ehl-1 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5687 -> IGTPW_4629

  CI-20190529: 20190529
  CI_DRM_8560: 02fe287fdb4a3d6bceb1bb61b3c8538b4b941b3c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4629: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html
  IGT_5687: 668a5be752186b6e08f361bac34da37309d08393 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@hdcp-1_4
+igt@kms_content_protection@hdcp-2_2
-igt@kms_content_protection@atomic
-igt@kms_content_protection@atomic-dpms
-igt@kms_content_protection@content_type_change
-igt@kms_content_protection@legacy
-igt@kms_content_protection@lic
-igt@kms_content_protection@mei_interface
-igt@kms_content_protection@srm
-igt@kms_content_protection@type1
-igt@kms_content_protection@uevent

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4629/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
