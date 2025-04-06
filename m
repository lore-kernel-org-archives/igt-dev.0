Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4063C36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 15:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B71410E0AD;
	Sun,  6 Apr 2025 15:58:52 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44210E0AD;
 Sun,  6 Apr 2025 15:58:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8498354218108846960=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel-ci/xe-sriov-vm?=
 =?utf-8?q?=2Eblocklist=2Etxt=3A_Blocklist_for_SR-IOV_VM_runs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 15:58:51 -0000
Message-ID: <174395513120.41054.13592201247251401698@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250326124203.222643-1-marcin.bernatowicz@linux.intel.com>
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

--===============8498354218108846960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: tests/intel-ci/xe-sriov-vm.blocklist.txt: Blocklist for SR-IOV VM r=
uns (rev2)
URL   : https://patchwork.freedesktop.org/series/146800/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from XEIGT_8288_FULL -> XEIGTPW_12843_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12843_FULL absolutely need to=
 be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12843_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in C=
I.

 =20

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_128=
43_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomp=
lete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/ig=
t@kms_plane_lowres@tiling-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435=
/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [PASS][3] -> ([DMESG-WARN][4], [PASS][5])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/ig=
t@kms_plane_lowres@tiling-none.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435=
/igt@kms_plane_lowres@tiling-none.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432=
/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/ig=
t@kms_plane_lowres@tiling-none@pipe-a-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435=
/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [PASS][8] -> ([PASS][9], [ABORT][10])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@=
xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/i=
gt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/=
igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

 =20
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [FAIL][11] ([Intel XE#1178]) -> ([FAIL][12], [INC=
OMPLETE][13]) ([Intel XE#1178]) +1 other test ( 1 fail, 1 incomplete )
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt=
@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/=
igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/=
igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

 =20
Known issues
------------

  Here are the changes found in XEIGTPW_12843_FULL that come from known iss=
ues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          NOTRUN -> ([FAIL][14], [PASS][15]) ([Intel XE#827=
]) +1 other test ( 1 fail, 1 pass )
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/=
igt@kms_async_flips@alternate-sync-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/=
igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#4427]) +1 oth=
er test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/i=
gt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linea=
r:
    - shard-lnl:          [PASS][18] -> ([PASS][19], [FAIL][20]) ([Intel XE=
#911]) +3 other tests ( 1 fail, 1 pass )
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/=
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.ht=
ml
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/=
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.ht=
ml

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-=
mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#2550] / [Intel XE=
#3767]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc=
-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#873=
])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
6/igt@kms_async_flips@invalid-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [PASS][24] -> [SKIP][25] ([Intel XE#664])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt=
@kms_async_flips@test-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/=
igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#316=
]) +1 other test ( 2 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2327]) +2 other t=
ests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/=
igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#232=
7]) +1 other test ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_big_fb@linear-32bpp-rotate-90.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#140=
7])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][33] ([Intel XE#4543])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-1=
/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#316]) +1 other te=
st skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][35], [SKIP][36]) ([Intel XE#112=
4]) +4 other tests ( 2 skip )
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#112=
4]) +6 other tests ( 2 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#316])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-1=
/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#112=
4]) +4 other tests ( 2 skip )
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][42] -> [DMESG-FAIL][43] ([Intel XE#4543]) =
+11 other tests dmesg-fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/ig=
t@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-6=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1124]) +3 other t=
ests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1124]) +7 other t=
ests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/=
igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1124]) +2 other t=
ests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-6=
/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#231=
4] / [Intel XE#2894])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#219=
1])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#367=
]) +1 other test ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#367=
])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#367]) +1 other te=
st skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#367])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#787=
]) +89 other tests ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#265=
2] / [Intel XE#787]) +4 other tests ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +147 other =
tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#=
787]) +26 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2887]) +9 other t=
ests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/=
igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#288=
7]) +6 other tests ( 2 skip )
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#455] / [Intel XE#=
787]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#787]) +2 other te=
sts skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#290=
7])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#343=
2])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][72] -> [INCOMPLETE][73] ([Intel XE#3862]) =
+1 other test incomplete
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/i=
gt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#3432])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#343=
2])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#455=
] / [Intel XE#787]) +24 other tests ( 2 skip )
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2907])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-2=
/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#266=
9]) +3 other tests ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][82] -> ([INCOMPLETE][83], [PASS][84]) ([In=
tel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][85] -> ([INCOMPLETE][86], [INCOMPLETE][87]=
) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#3124] / =
[Intel XE#4212])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#288=
7]) +3 other tests ( 2 skip )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][90] -> [INCOMPLETE][91] ([Intel XE#2705] /=
 [Intel XE#4212])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][92] -> ([PASS][93], [DMESG-WARN][94]) ([In=
tel XE#1727] / [Intel XE#3113])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][95] -> [INCOMPLETE][96] ([Intel XE#3124])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][97] -> ([INCOMPLETE][98], [PASS][99]) ([In=
tel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2907])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2652] / [Intel X=
E#787]) +12 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4416]) +3 other =
tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#2=
325])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_chamelium_color@ctm-max.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#306])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][106], [SKIP][107]) ([Intel XE#3=
06])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_chamelium_color@degamma.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#3=
06])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_chamelium_color@gamma.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#306])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
9/igt@kms_chamelium_color@gamma.html
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2325])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2252]) +5 other =
tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#373])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#3=
73]) +2 other tests ( 2 skip )
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_chamelium_frames@vga-frame-dump.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#2=
252]) +4 other tests ( 2 skip )
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#3=
73]) +2 other tests ( 2 skip )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][120] ([Intel XE#1178])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2390])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#307])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> ([SKIP][123], [SKIP][124]) ([Intel XE#3=
07])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_content_protection@dp-mst-lic-type-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][125], [FAIL][126]) ([Intel XE#3=
304])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#2=
341]) +1 other test ( 2 skip )
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_content_protection@mei-interface.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][129] ([Intel XE#1178]) +2 other =
tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#1188])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][131] -> [DMESG-WARN][132] ([Intel XE#4173]=
) +12 other tests dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@kms_cursor_crc@cursor-offscreen-128x42.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2320]) +1 other =
test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1424])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#308])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#2=
320]) +2 other tests ( 2 skip )
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_cursor_crc@cursor-random-32x32.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> ([SKIP][138], [SKIP][139]) ([Intel XE#1=
424]) +1 other test ( 2 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@kms_cursor_crc@cursor-random-max-size.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2321]) +1 other =
test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][141], [PASS][142]) ([Intel XE#3=
09])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#2=
286]) +1 other test ( 2 skip )
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][145], [SKIP][146]) ([Intel XE#3=
23])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#309]) +1 ot=
her test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.h=
tml

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [PASS][150]) ([Intel XE#2=
291]) +3 other tests ( 1 pass, 1 skip )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][151] -> ([SKIP][152], [PASS][153]) ([Intel=
 XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1508])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#1=
340])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     NOTRUN -> ([PASS][157], [SKIP][158]) ([Intel XE#4=
331])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#2=
244])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][161], [SKIP][162]) ([Intel XE#4=
55]) +11 other tests ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_dsc@dsc-with-bpc-formats.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#4422])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#4422])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4422])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#4=
422])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([Intel XE#4=
422]) +1 other test ( 2 skip )
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][170] -> ([SKIP][171], [PASS][172]) ([Intel=
 XE#310]) +5 other tests ( 1 pass, 1 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
    - shard-bmg:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#2=
316])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][175] -> [SKIP][176] ([Intel XE#2316]) +1 o=
ther test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> ([SKIP][177], [PASS][178]) ([Intel XE#2=
316]) +2 other tests ( 1 pass, 1 skip )
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][179] -> [FAIL][180] ([Intel XE#3321])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][181] -> [FAIL][182] ([Intel XE#301])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][183] -> [FAIL][184] ([Intel XE#301] / [Int=
el XE#3321])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][185] -> ([FAIL][186], [PASS][187]) ([Intel=
 XE#3321]) +1 other test ( 1 fail, 1 pass )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][188] -> ([PASS][189], [FAIL][190]) ([Intel=
 XE#301]) +3 other tests ( 1 fail, 1 pass )
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][191], [SKIP][192]) ([Intel XE#1=
421]) +5 other tests ( 2 skip )
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#1421])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [PASS][194] -> [SKIP][195] ([Intel XE#310]) +1 ot=
her test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_flip@2x-modeset-vs-vblank-race.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> ([FAIL][196], [PASS][197]) ([Intel XE#2=
882]) +1 other test ( 1 fail, 1 pass )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][198] -> [FAIL][199] ([Intel XE#2882]) +3 o=
ther tests fail
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][200] -> ([SKIP][201], [SKIP][202]) ([Intel=
 XE#2316]) +1 other test ( 2 skip )
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-plain-flip-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][203] -> ([SKIP][204], [PASS][205]) ([Intel=
 XE#2316]) +5 other tests ( 1 pass, 1 skip )
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [PASS][206] -> ([SKIP][207], [SKIP][208]) ([Intel=
 XE#310]) +1 other test ( 2 skip )
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_flip@2x-wf_vblank-ts-check.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@2x-wf_vblank-ts-check.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#310]) +4 other t=
ests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][210] -> [INCOMPLETE][211] ([Intel XE#2049])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][212] ([Intel XE#2049])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][213] -> ([FAIL][214], [PASS][215]) ([Intel=
 XE#886]) +1 other test ( 1 fail, 1 pass )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][216], [FAIL][217]) ([Intel XE#3=
01]) +1 other test ( 2 fail )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([PASS][218], [FAIL][219]) ([Intel XE#3=
01])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][220] ([Intel XE#455]) +3 other t=
ests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-bmg:          NOTRUN -> ([SKIP][221], [SKIP][222]) ([Intel XE#2=
293] / [Intel XE#2380]) +5 other tests ( 2 skip )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-lnl:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#1=
401] / [Intel XE#1745])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pi=
pe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#1=
401])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2293] / [Intel X=
E#2380])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@=
pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][228] ([Intel XE#2293])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pip=
e-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode:
    - shard-adlp:         [PASS][229] -> [DMESG-FAIL][230] ([Intel XE#324] =
/ [Intel XE#4543]) +3 other tests dmesg-fail
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-v=
alid-mode.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-=
a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#2=
293]) +5 other tests ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#2311]) +11 other=
 tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#656]) +1 other t=
est skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#656]) +5 other t=
ests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([Intel XE#2=
311]) +13 other tests ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#4141]) +8 other =
tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][239] -> ([SKIP][240], [SKIP][241]) ([Intel=
 XE#656]) +1 other test ( 2 skip )
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][242] -> ([SKIP][243], [PASS][244]) ([Intel=
 XE#656]) +7 other tests ( 1 pass, 1 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([Intel XE#2=
312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][247] -> [SKIP][248] ([Intel XE#656]) +2 ot=
her tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#2312]) +5 other =
tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#4=
141]) +3 other tests ( 2 skip )
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#6=
51]) +2 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#651]) +1 other t=
est skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.ht=
ml
    - shard-lnl:          NOTRUN -> [SKIP][255] ([Intel XE#651])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2=
312]) +3 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#6=
51] / [Intel XE#656]) +2 other tests ( 2 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][260], [SKIP][261]) ([Intel XE#2=
311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#6=
51]) +7 other tests ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.=
html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#651]) +6 other t=
ests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2313]) +11 other=
 tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#653]) +1 other t=
est skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#2=
313]) +14 other tests ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#2=
312] / [Intel XE#2313]) +5 other tests ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#4439])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([Intel XE#4=
439])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#653]) +6 other t=
ests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#6=
56]) +8 other tests ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#6=
53] / [Intel XE#656]) +5 other tests ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][279], [SKIP][280]) ([Intel XE#6=
53]) +5 other tests ( 2 skip )
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#4329])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [PASS][282] -> [FAIL][283] ([Intel XE#1471]) +1 o=
ther test fail
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][284] -> ([FAIL][285], [PASS][286]) ([Intel=
 XE#616]) +1 other test ( 1 fail, 1 pass )
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][287] -> [SKIP][288] ([Intel XE#4596])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_plane_multiple@2x-tiling-4.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][289] -> ([SKIP][290], [PASS][291]) ([Intel=
 XE#2571])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2-set2:     [PASS][292] -> ([SKIP][293], [PASS][294]) ([Intel=
 XE#309]) +3 other tests ( 1 pass, 1 skip )
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([Intel XE#2=
763]) +14 other tests ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.ht=
ml
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.ht=
ml

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][297], [SKIP][298]) ([Intel XE#8=
70]) +1 other test ( 2 skip )
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_pm_backlight@fade-with-dpms.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][299] ([Intel XE#2391])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][300] -> ([FAIL][301], [PASS][302]) ([Intel=
 XE#718])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@kms_pm_dc@dc5-psr.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_pm_dc@dc5-psr.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#2=
505])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_pm_dc@deep-pkgc.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][305], [SKIP][306]) ([Intel XE#9=
08])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_pm_dc@deep-pkgc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([Intel XE#1=
439] / [Intel XE#836])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([Intel XE#1=
489]) +4 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][311], [SKIP][312]) ([Intel XE#2=
893]) +1 other test ( 2 skip )
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#1=
489]) +1 other test ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][315] ([Intel XE#1489]) +1 other =
test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][316] ([Intel XE#1489]) +3 other =
tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][317] ([Intel XE#1489]) +1 other =
test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#2=
234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_psr@fbc-psr-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][320] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> ([FAIL][321], [FAIL][322]) ([Intel XE#4=
568]) +1 other test ( 2 fail )
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_psr@fbc-psr2-basic@edp-1.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][323] ([Intel XE#2234] / [Intel X=
E#2850]) +10 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#2=
850] / [Intel XE#929]) +7 other tests ( 2 skip )
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_psr@fbc-psr2-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][326] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][327], [SKIP][328]) ([Intel XE#1=
406]) +1 other test ( 2 skip )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_psr@pr-primary-page-flip.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#2=
414])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][331], [SKIP][332]) ([Intel XE#2=
939])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][333] ([Intel XE#3414] / [Intel X=
E#3904])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][334] ([Intel XE#1435]) +1 other =
test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][335] -> ([SKIP][336], [PASS][337]) ([Intel=
 XE#1435])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_setmode@invalid-clone-single-crtc-stealing.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [PASS][338] -> ([SKIP][339], [PASS][340]) ([Intel=
 XE#455])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][341] ([Intel XE#2426])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][342] -> ([FAIL][343], [FAIL][344]) ([Intel=
 XE#771] / [Intel XE#899])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][345] -> [FAIL][346] ([Intel XE#899])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][347] -> ([FAIL][348], [PASS][349]) ([Intel=
 XE#4459]) +1 other test ( 1 fail, 1 pass )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@kms_vrr@cmrr@pipe-a-edp-1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#455]) +4 other t=
ests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#1=
499])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_vrr@max-min.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][353] -> [SKIP][354] ([Intel XE#1499])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_vrr@negative-basic.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> ([SKIP][355], [SKIP][356]) ([Intel XE#1=
499])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@kms_vrr@seamless-rr-switch-vrr.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#7=
56]) +1 other test ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][359], [SKIP][360]) ([Intel XE#7=
56])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][361] ([Intel XE#455] / [Intel XE=
#488])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#2=
905]) +5 other tests ( 2 skip )
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@xe_eudebug@basic-vm-access-parameters.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][364], [SKIP][365]) ([Intel XE#2=
905] / [Intel XE#3889])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][366] ([Intel XE#2905])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> [SKIP][367] ([Intel XE#2905] / [Intel X=
E#4259])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> ([SKIP][368], [SKIP][369]) ([Intel XE#2=
905])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_eudebug@multigpu-basic-client-many.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_eudebug@multigpu-basic-client-many.html
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#2905])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([Intel XE#2=
905]) +5 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_eudebug@read-metadata.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#4577])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-bmg:          NOTRUN -> [SKIP][374] ([Intel XE#4577])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> ([SKIP][375], [SKIP][376]) ([Intel XE#4=
577])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][377] ([Intel XE#2905]) +2 other =
tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][378] ([Intel XE#4518])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][379] ([Intel XE#4519])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> ([SKIP][380], [SKIP][381]) ([Intel XE#4=
518])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_eudebug_sriov@deny-eudebug.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][382], [SKIP][383]) ([Intel XE#4=
518])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_eudebug_sriov@deny-sriov.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> ([SKIP][384], [SKIP][385]) ([Intel XE#6=
88])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_evict@evict-beng-large-external-cm.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userpt=
r:
    - shard-bmg:          NOTRUN -> [SKIP][386] ([Intel XE#2322]) +4 other =
tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.h=
tml

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][387] ([Intel XE#1392])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> [SKIP][388] ([Intel XE#1392])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][389] -> ([PASS][390], [SKIP][391]) ([Intel=
 XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#1=
392])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][394] -> [SKIP][395] ([Intel XE#1392])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][396], [SKIP][397]) ([Intel XE#1=
392])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][398], [SKIP][399]) ([Intel XE#2=
322]) +5 other tests ( 2 skip )
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][400] ([Intel XE#288]) +3 other t=
ests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][401], [SKIP][402]) ([Intel XE#2=
88]) +7 other tests ( 2 skip )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][403] ([Intel XE#288]) +7 other t=
ests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][404] ([Intel XE#2360])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
    - shard-dg2-set2:     [PASS][405] -> ([PASS][406], [DMESG-WARN][407]) (=
[Intel XE#3876])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][408], [SKIP][409]) ([Intel XE#2=
55])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_huc_copy@huc_copy.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][410] -> ([PASS][411], [FAIL][412]) ([Intel=
 XE#1999]) +2 other tests ( 1 fail, 1 pass )
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#2459] / [Intel X=
E#2596])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][414], [PASS][415], [PASS][416], [PASS][41=
7], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS]=
[423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PA=
SS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], =
[PASS][435], [PASS][436], [PASS][437], [PASS][438]) -> ([PASS][439], [PASS]=
[440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PA=
SS][446], [PASS][447], [PASS][448], [SKIP][449], [PASS][450], [PASS][451], =
[PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457=
], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [PASS][=
463], [PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PAS=
S][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [=
PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480]=
, [SKIP][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][4=
86], [PASS][487], [PASS][488], [PASS][489]) ([Intel XE#378])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][490], [PASS][491], [PASS][492], [PASS][49=
3], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS]=
[499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PA=
SS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509]) -> ([PASS][51=
0], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [SKIP][515], [PASS]=
[516], [PASS][517], [PASS][518], [PASS][519], [PASS][520], [PASS][521], [PA=
SS][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], =
[PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533=
], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][=
539], [PASS][540], [PASS][541], [PASS][542], [PASS][543], [PASS][544], [PAS=
S][545], [SKIP][546], [PASS][547], [PASS][548]) ([Intel XE#2457])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][549], [PASS][550], [PASS][551], [PASS][55=
2], [PASS][553], [PASS][554], [PASS][555], [PASS][556], [PASS][557], [PASS]=
[558], [PASS][559], [PASS][560], [PASS][561], [PASS][562], [PASS][563], [PA=
SS][564], [PASS][565], [PASS][566], [PASS][567], [PASS][568], [PASS][569], =
[PASS][570], [PASS][571], [PASS][572], [PASS][573]) -> ([PASS][574], [PASS]=
[575], [PASS][576], [PASS][577], [PASS][578], [PASS][579], [PASS][580], [PA=
SS][581], [PASS][582], [PASS][583], [PASS][584], [PASS][585], [PASS][586], =
[SKIP][587], [PASS][588], [PASS][589], [PASS][590], [PASS][591], [PASS][592=
], [PASS][593], [PASS][594], [PASS][595], [PASS][596], [PASS][597], [PASS][=
598], [PASS][599]) ([Intel XE#378])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
9/igt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
9/igt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][600] -> [DMESG-WARN][601] ([Intel XE#2953]=
 / [Intel XE#4173])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@many-reload.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][602] -> ([PASS][603], [FAIL][604]) ([Intel=
 XE#4541])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_oa@buffer-size.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_oa@buffer-size.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][605] ([Intel XE#4541])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][606] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@xe_oa@create-destroy-userspace-config.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][607], [SKIP][608]) ([Intel XE#2=
541] / [Intel XE#3573]) +1 other test ( 2 skip )
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@xe_oa@create-destroy-userspace-config.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][609] ([Intel XE#2541] / [Intel X=
E#3573]) +2 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][610] ([Intel XE#2541] / [Intel X=
E#3573] / [Intel XE#4501])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][611] ([Intel XE#1173])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][612] ([Intel XE#2284])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][613] ([Intel XE#2284])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][614], [SKIP][615]) ([Intel XE#2=
284] / [Intel XE#366])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_pm@s3-d3cold-basic-exec.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> ([SKIP][616], [SKIP][617]) ([Intel XE#5=
84])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_pm@s3-d3hot-basic-exec.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][618] -> [ABORT][619] ([Intel XE#1794]) +1 =
other test abort
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_pm@s4-multiple-execs.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][620] ([Intel XE#944]) +1 other t=
est skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-adlp:         NOTRUN -> [SKIP][621] ([Intel XE#944])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
1/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> ([SKIP][622], [SKIP][623]) ([Intel XE#9=
44]) +1 other test ( 2 skip )
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_query@multigpu-query-invalid-extension.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          NOTRUN -> ([SKIP][624], [SKIP][625]) ([Intel XE#9=
44])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_query@multigpu-query-oa-units.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     NOTRUN -> [SKIP][626] ([Intel XE#944])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][627], [SKIP][628]) ([Intel XE#9=
44])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> ([SKIP][629], [SKIP][630]) ([Intel XE#4=
130])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2=
/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> ([SKIP][631], [SKIP][632]) ([Intel XE#3=
342])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@xe_sriov_flr@flr-vf1-clear.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> ([SKIP][633], [SKIP][634]) ([Intel XE#4=
351])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@xe_sriov_scheduling@equal-throughput.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@xe_sriov_scheduling@equal-throughput.html

 =20
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][635] ([Intel XE#3719] / [Intel XE#911]) ->=
 [PASS][636] +3 other tests pass
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1=
/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#2191]) -> ([PASS][638], [P=
ASS][639])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][640] ([Intel XE#2314] / [Intel XE#2894]) -=
> ([PASS][641], [PASS][642])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][643] ([Intel XE#2705] / [Intel XE#42=
12] / [Intel XE#4345]) -> [PASS][644]
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][645] ([Intel XE#2291]) -> ([PASS][646], [P=
ASS][647]) +1 other test ( 2 pass )
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][648] ([Intel XE#309]) -> [PASS][649] +1 ot=
her test pass
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#309]) -> ([PASS][651], [PA=
SS][652]) +1 other test ( 2 pass )
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][653] ([Intel XE#2291]) -> [PASS][654] +1 o=
ther test pass
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][655] ([Intel XE#4302]) -> ([PASS][656], [P=
ASS][657])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_display_modes@extended-mode-basic.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_display_modes@extended-mode-basic.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#455]) -> ([PASS][659], [PA=
SS][660])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#3009]) -> [PASS][662]
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dp_aux_dev.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-bmg:          [SKIP][663] ([Intel XE#2316]) -> [PASS][664]
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][665] ([Intel XE#301]) -> ([PASS][666], [PA=
SS][667])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][668] ([Intel XE#2316]) -> ([PASS][669], [P=
ASS][670]) +1 other test ( 2 pass )
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][671] ([Intel XE#301] / [Intel XE#3321]) ->=
 [PASS][672] +1 other test pass
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][673] ([Intel XE#301]) -> [PASS][674] +3 ot=
her tests pass
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][675] ([Intel XE#2049] / [Intel XE#25=
97]) -> ([PASS][676], [PASS][677]) +1 other test ( 2 pass )
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-suspend-interruptible.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend-interruptible.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][678] ([Intel XE#2049] / [Intel XE#25=
97]) -> [PASS][679] +1 other test pass
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_flip@flip-vs-suspend@c-dp4.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][680] ([Intel XE#4543]) -> [PASS][681=
] +7 other tests pass
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [DMESG-WARN][682] ([Intel XE#4173]) -> [PASS][683=
] +2 other tests pass
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][684] ([Intel XE#656]) -> ([PASS][685], [PA=
SS][686]) +4 other tests ( 2 pass )
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#656]) -> [PASS][688] +1 ot=
her test pass
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#4328]) -> ([PASS][690], [P=
ASS][691])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [FAIL][692] ([Intel XE#1471]) -> [PASS][693] +1 o=
ther test pass
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@kms_plane_cursor@viewport.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
6/igt@kms_plane_cursor@viewport.html
    - shard-dg2-set2:     [FAIL][694] ([Intel XE#616]) -> ([PASS][695], [PA=
SS][696])
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_cursor@viewport.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_plane_cursor@viewport.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][697] ([Intel XE#616]) -> [PASS][698]
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][699] ([Intel XE#836]) -> [PASS][700]
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#836]) -> ([PASS][702], [PA=
SS][703])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_pm_rpm@modeset-non-lpsp.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_pm_rpm@modeset-non-lpsp.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][704] ([Intel XE#2883]) -> ([PASS][705], [P=
ASS][706]) +2 other tests ( 2 pass )
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@kms_setmode@basic@pipe-b-edp-1.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@kms_setmode@basic@pipe-b-edp-1.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6=
/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][707] ([Intel XE#771]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][709] ([Intel XE#2953] / [Intel XE#41=
73]) -> [PASS][710] +1 other test pass
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_vblank@ts-continuation-suspend.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#455]) -> [PASS][712]
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_vrr@negative-basic.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_=
compute:
    - shard-lnl:          [FAIL][713] ([Intel XE#4278]) -> [PASS][714] +1 o=
ther test pass
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_comput=
e.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_com=
pute.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#1392]) -> ([PASS][716], [P=
ASS][717])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [SKIP][718] ([Intel XE#1392]) -> [PASS][719] +2 o=
ther tests pass
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][720] ([Intel XE#1794]) -> ([PASS][721], [=
PASS][722])
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_pm@s4-vm-bind-unbind-all.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@xe_pm@s4-vm-bind-unbind-all.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5=
/igt@xe_pm@s4-vm-bind-unbind-all.html

 =20
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#787]) -> ([SKIP][724], [SK=
IP][725]) ([Intel XE#455] / [Intel XE#787]) +9 other tests ( 2 skip )
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][726] ([Intel XE#455] / [Intel XE#787]) -> =
([SKIP][727], [SKIP][728]) ([Intel XE#787]) +6 other tests ( 2 skip )
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#787]) -> [SKIP][730] ([Int=
el XE#455] / [Intel XE#787]) +3 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#455] / [Intel XE#787]) -> =
[SKIP][732] ([Intel XE#787])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][733] ([Intel XE#2341]) -> ([FAIL][734], [S=
KIP][735]) ([Intel XE#1178] / [Intel XE#2341])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_content_protection@atomic.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_content_protection@atomic.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][736] ([Intel XE#455]) -> ([FAIL][737], [FA=
IL][738]) ([Intel XE#1178])
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@lic-type-0.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_content_protection@lic-type-0.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#455]) -> ([FAIL][740], [SK=
IP][741]) ([Intel XE#1178] / [Intel XE#455])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@srm.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_content_protection@srm.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#455]) -> ([SKIP][743], [FA=
IL][744]) ([Intel XE#1188] / [Intel XE#455])
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@uevent.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_content_protection@uevent.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#309]) -> ([PASS][746], [SK=
IP][747]) ([Intel XE#309])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][748] ([Intel XE#2291]) -> ([SKIP][749], [P=
ASS][750]) ([Intel XE#2291])
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][751] ([Intel XE#455] / [i915#3804]) -> ([S=
KIP][752], [SKIP][753]) ([i915#3804])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][754] ([Intel XE#2373]) -> ([SKIP][755], [P=
ASS][756]) ([Intel XE#2373])
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_feature_discovery@display-2x.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_feature_discovery@display-2x.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#310]) -> ([SKIP][758], [PA=
SS][759]) ([Intel XE#310])
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][760] ([Intel XE#3321]) -> ([FAIL][761], [S=
KIP][762]) ([Intel XE#2316] / [Intel XE#3321])
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][763] ([Intel XE#3321]) -> ([PASS][764], [F=
AIL][765]) ([Intel XE#3321]) +1 other test ( 1 fail, 1 pass )
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][766] ([Intel XE#301]) -> ([PASS][767], [FA=
IL][768]) ([Intel XE#301]) +2 other tests ( 1 fail, 1 pass )
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][769] ([Intel XE#2316]) -> ([PASS][770], [S=
KIP][771]) ([Intel XE#2316])
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_flip@2x-plain-flip-fb-recreate.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][772] ([Intel XE#301]) -> ([PASS][773], [FA=
IL][774]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][775] ([Intel XE#301] / [Intel XE#3149]) ->=
 ([PASS][776], [FAIL][777]) ([Intel XE#301] / [Intel XE#3149]) +1 other tes=
t ( 1 fail, 1 pass )
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][778] ([Intel XE#4543]) -> [DMESG-FAI=
L][779] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][780] ([Intel XE#2311]) -> ([SKIP][781], [S=
KIP][782]) ([Intel XE#2312])
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][783] ([Intel XE#2311]) -> ([SKIP][784], [S=
KIP][785]) ([Intel XE#2311] / [Intel XE#2312]) +15 other tests ( 2 skip )
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][786] ([Intel XE#656]) -> [SKIP][787] ([Int=
el XE#651]) +4 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][788] ([Intel XE#651]) -> [SKIP][789] ([Int=
el XE#656]) +3 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][790] ([Intel XE#2312]) -> ([SKIP][791], [S=
KIP][792]) ([Intel XE#2311]) +4 other tests ( 2 skip )
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][793] ([Intel XE#2311]) -> [SKIP][794] ([In=
tel XE#2312]) +8 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][795] ([Intel XE#2312]) -> ([SKIP][796], [S=
KIP][797]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][798] ([Intel XE#651]) -> ([SKIP][799], [SK=
IP][800]) ([Intel XE#651] / [Intel XE#656]) +12 other tests ( 2 skip )
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][801] ([Intel XE#2312]) -> ([SKIP][802], [S=
KIP][803]) ([Intel XE#2312] / [Intel XE#4141])
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][804] ([Intel XE#4141]) -> ([SKIP][805], [S=
KIP][806]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][807] ([Intel XE#2312]) -> [SKIP][808] ([In=
tel XE#4141]) +4 other tests skip
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][809] ([Intel XE#4141]) -> ([SKIP][810], [S=
KIP][811]) ([Intel XE#2312])
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][812] ([Intel XE#2312]) -> ([SKIP][813], [S=
KIP][814]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][815] ([Intel XE#4141]) -> [SKIP][816] ([In=
tel XE#2312]) +3 other tests skip
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][817] ([Intel XE#2312]) -> [SKIP][818] ([In=
tel XE#2311]) +8 other tests skip
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][819] ([Intel XE#656]) -> ([SKIP][820], [SK=
IP][821]) ([Intel XE#651] / [Intel XE#656]) +2 other tests ( 2 skip )
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.=
html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][822] ([Intel XE#656]) -> ([SKIP][823], [SK=
IP][824]) ([Intel XE#651]) +5 other tests ( 2 skip )
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][825] ([Intel XE#651]) -> ([SKIP][826], [SK=
IP][827]) ([Intel XE#656])
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][828] ([Intel XE#2313]) -> [SKIP][829] ([In=
tel XE#2312]) +5 other tests skip
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][830] ([Intel XE#2313]) -> ([SKIP][831], [S=
KIP][832]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][833] ([Intel XE#656]) -> [SKIP][834] ([Int=
el XE#653]) +2 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.h=
tml

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][835] ([Intel XE#2312]) -> ([SKIP][836], [S=
KIP][837]) ([Intel XE#2312] / [Intel XE#2313]) +1 other test ( 2 skip )
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][838] ([Intel XE#656]) -> ([SKIP][839], [SK=
IP][840]) ([Intel XE#653] / [Intel XE#656]) +1 other test ( 2 skip )
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][841] ([Intel XE#2312]) -> ([SKIP][842], [S=
KIP][843]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][844] ([Intel XE#2313]) -> ([SKIP][845], [S=
KIP][846]) ([Intel XE#2312] / [Intel XE#2313]) +12 other tests ( 2 skip )
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][847] ([Intel XE#2312]) -> [SKIP][848] ([In=
tel XE#2313]) +10 other tests skip
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][849] ([Intel XE#653]) -> ([SKIP][850], [SK=
IP][851]) ([Intel XE#653] / [Intel XE#656]) +11 other tests ( 2 skip )
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][852] ([Intel XE#653]) -> [SKIP][853] ([Int=
el XE#656]) +3 other tests skip
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][854] ([Intel XE#656]) -> ([SKIP][855], [SK=
IP][856]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][857] ([Intel XE#653]) -> ([SKIP][858], [SK=
IP][859]) ([Intel XE#656])
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][860] ([Intel XE#455]) -> ([SKIP][861], [PA=
SS][862]) ([Intel XE#455]) +1 other test ( 1 pass, 1 skip )
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_hdr@invalid-hdr.html
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
34/igt@kms_hdr@invalid-hdr.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][863] ([Intel XE#4596]) -> [SKIP][864] ([In=
tel XE#2493])
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_plane_multiple@2x-tiling-y.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][865] ([Intel XE#4596]) -> [SKIP][866] ([In=
tel XE#455])
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_multiple@2x-tiling-y.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
33/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][867] ([Intel XE#362]) -> ([FAIL][868], [FA=
IL][869]) ([Intel XE#1729])
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_tiled_display@basic-test-pattern.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][870] ([Intel XE#1500]) -> [SKIP][871] ([In=
tel XE#362])
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
64/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][872] ([Intel XE#771]) -> [FAIL][873] ([Int=
el XE#771] / [Intel XE#899])
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak.html
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          [FAIL][874] ([Intel XE#771]) -> ([FAIL][875], [FA=
IL][876]) ([Intel XE#771] / [Intel XE#899]) +1 other test ( 2 fail )
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak.html
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][877] ([Intel XE#771]) -> ([FAIL][878], [PA=
SS][879]) ([Intel XE#899])
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7=
/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][880] ([Intel XE#1392]) -> ([SKIP][881], [P=
ASS][882]) ([Intel XE#1392]) +2 other tests ( 1 pass, 1 skip )
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
63/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][883] ([Intel XE#1061]) -> ([FAIL][884], [S=
KIP][885]) ([Intel XE#1061] / [Intel XE#1173])
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_peer2peer@read.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
66/igt@xe_peer2peer@read.html
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-4=
32/igt@xe_peer2peer@read.html

 =20
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4427
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8288 -> IGTPW_12843

  IGTPW_12843: 12843
  IGT_8288: 8288
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/index.html

--===============8498354218108846960==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel-ci/xe-sriov-vm.blocklist.txt: Bl=
ocklist for SR-IOV VM runs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146800/">https://patchwork.freedesktop.org/series/146800/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8288_FULL -&gt; XEIGTPW_12843_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12843_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12843_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
843_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2=
-435/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a> +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-dg2-435/igt@kms_plane_lowres@tiling-none.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms=
_plane_lowres@tiling-none.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12843/shard-dg2-435/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMES=
G-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_create.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bin=
d_ioctl_ops_create.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm=
_bind_ioctl_ops_create.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1178">Intel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_content_protection@atomic-dpms=
@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-=
a-dp-2.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 1 fail, 1 incomp=
lete )</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12843_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_async_flips@alternate-sync-=
async-flip.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/827">Intel XE#827</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume@pipe=
-d-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-res=
ume@pipe-d-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4427">Intel XE#4427</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_async_flips@async-flip-wit=
h-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel X=
E#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">=
Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-6/igt@kms_async_flips@test-cursor-atomic.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12843/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">I=
ntel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate=
-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12843/shard-lnl-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate=
-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_big_fb@y-tiled-=
max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays=
-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_bw@linear-tiling-3-display=
s-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_ccs@bad-aux-stri=
de-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +89 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled=
-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +147 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-ti=
led-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-bmg-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs=
-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-=
tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12843/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-m=
tl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_ccs@crc-primar=
y-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12843/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
43/shard-bmg-4/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>=
)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_chamelium_color@ctm-max.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_chamelium_color@gamma.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-lnl-5/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-9/igt@kms_chamelium_color@gamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
06">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
25">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-af=
ter-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspen=
d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable=
-disable-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_content_protection@lic-type-0@=
pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-bmg-2/igt@kms_content_protection@mei-interface.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"=
>Intel XE#2341</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_content_protection@srm@pip=
e-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
43/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12843/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@kms_cursor_crc@cursor-random-ma=
x-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
4">Intel XE#1424</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cur=
sor-vs-flip-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_cursor_legacy@b=
asic-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_cursor_legacy@cursora=
-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-varying-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-v=
arying-size.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2291">Intel XE#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with=
-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12843/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-r=
ectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-out-visible-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +5 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-=
interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank-interrup=
tible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interrup=
tible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs=
-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-v=
s-modeset-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interr=
uptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/=
shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recre=
ate-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-=
interruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass =
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt=
@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12843/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
43/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) +5 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sha=
rd-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_f=
lip@2x-wf_vblank-ts-check.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Inte=
l XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-v=
blank@a-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sha=
rd-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#=
886</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@b-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test (=
 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@c-hdmi-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@c-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>) +5 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Inte=
l XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@kms_flip_sca=
led_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-=
7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-r=
gb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb10=
1010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-s=
hrfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-ti=
ling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linea=
r.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 othe=
r tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4439">Intel XE#4439</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-6=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size=
-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-s=
ize-64.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-siz=
e-64.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-=
bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
43/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-d=
g2-433/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_plane_scaling@planes-unity-=
scaling-downscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sha=
rd-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#=
1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
36">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-update-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2893">Intel XE#2893</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay=
-primary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_psr@fbc-psr-dpms.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shar=
d-bmg-6/igt@kms_psr@fbc-psr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>=
) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/s=
hard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
35">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-steali=
ng.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12843/shard-dg2-435/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-=
5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg=
-8/igt@kms_vrr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/ig=
t@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12843/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#14=
99</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_writeback@writeback-check-outpu=
t-xrgb2101010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_writeback@writeback-check=
-output-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@xe_ccs@block-copy-compressed-in=
c-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@xe_eudebug@basic-vm-access-pa=
rameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2905">Intel XE#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@xe_eudebug@basic-vm-access-para=
meters-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters-=
userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@xe_eudebug@basic-vm-access-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_eudebug@discovery-race-sigint=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_eudebug@multigpu-basic-clien=
t-many.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@xe_eudebug@multigpu-basic-clien=
t-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@xe_eudebug@read-metadata.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/=
shard-bmg-7/igt@xe_eudebug@read-metadata.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_eudebug_online@writes-caching=
-sram-bb-vram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4518">Intel XE#4518</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_evict@evict-beng-large-exter=
nal-cm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-lnl-4/igt@xe_evict@evict-beng-large-external-cm.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_exec_basic@multig=
pu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-nu=
ll-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@xe_exec_basic@multigpu-once-nul=
l-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexe=
cqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@xe_exec_fault_mode@many-execq=
ueues-userptr-invalidate-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@xe_exec_fault_mode@man=
y-execqueues-userptr-invalidate-imm.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@xe_exec_fault_mode@many-userpt=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner=
-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@xe_exec_threads@threads-hang-userptr-rebind-er=
r.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind=
-err.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-rebind-er=
r.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_k=
unit.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1999">Intel XE#1999</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/s=
hard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12843/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-l=
nl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
3/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shar=
d-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12843/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12843/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Inte=
l XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12843/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12843/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12843/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bm=
g-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8288/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8288/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_828=
8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8288/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8288/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-9/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-=
adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12843/shard-adlp-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shar=
d-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adl=
p-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@x=
e_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-6/igt@xe_oa@create-destroy-userspace-=
config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@xe_oa@create-destroy-userspac=
e-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-434/igt@xe_oa@create-destroy-userspace-config.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@xe_oa@privileged-forked-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_pm@s3-d3hot-basic-exec.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@xe_query@multigpu-query-invalid-=
extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-1/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-lnl-4/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@xe_query@multigpu-query-oa-unit=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12843/shard-bmg-7/igt@xe_query@multigpu-query-oa-units.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE=
#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@xe_query@multigpu-query-topolo=
gy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-=
guc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-lnl-2/igt@xe_sriov_auto_provisioning@fair=
-allocation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12843/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-allocatio=
n.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
3/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@xe_sriov_scheduling@equal-throu=
ghput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351"=
>Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events=
-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-1/igt@kms_async_flip=
s@async-flip-with-page-flip-events-atomic.html">PASS</a> +3 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_bw@connected-linear-=
tiling-2-displays-2160x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_bw@connected-linea=
r-tiling-2-displays-2160x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-atomic.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_cursor_legacy@cursorb-=
vs-flipa-atomic-transitions.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-le=
gacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html=
">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggl=
e.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-d=
g2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-=
dg2-432/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12843/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@ac-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ac-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbl=
ank@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi=
-a6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-=
dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-sh=
rfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_frontbu=
ffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +7 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12843/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>) =
+4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4328">Intel XE#4328</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12843/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joi=
ner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-1/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#14=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-adlp-6/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
843/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms=
_plane_cursor@viewport.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size=
-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe=
-a-hdmi-a-6-size-64.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#=
836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12843/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt=
@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12843/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-6/i=
gt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>) +2 other tests ( 2 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-adlp-2/igt@kms_universal_plane@cursor-fb-l=
eak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12843/shard-adlp-8/igt@kms_vblank@ts-continuatio=
n-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/=
shard-dg2-463/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-d=
rm_xe_engine_class_compute.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-3/igt@xe_comp=
ute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@xe_exec_basic@multigpu-=
many-execqueues-many-vm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12843/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-lnl-5/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_ccs@bad-aux-strid=
e-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_ccs@bad-au=
x-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_ccs@ccs-o=
n-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_ccs@cc=
s-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-=
cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_ccs@missing=
-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12843/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt=
@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12843/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2843/shard-dg2-435/igt@kms_content_protection@srm.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt=
@kms_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12843/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-436=
/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-=
legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_dither@fb-8bpc=
-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg=
-7/igt@kms_feature_discovery@display-2x.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-=
off-vs-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_flip@2x-flip-vs-dp=
ms-off-vs-modeset-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-i=
nterruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank=
@ac-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pas=
s )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12843/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@ad-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12843/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests ( 1 fail, 1 =
pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12843/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard=
-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12843/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-adlp-4/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_=
frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Int=
el XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_t=
racking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-433/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_frontbu=
ffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-46=
4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/651">Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cu=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-8/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-436/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@kms_hdr@invalid=
-hdr.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12843/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12843/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12843/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843=
/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12843/shard-dg2-464/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12843/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-l=
nl-7/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12843/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@=
pipe-c-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12843/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-=
c-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@xe_exec_basic@multig=
pu-once-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-463/igt@xe_exec_basic@=
multigpu-once-bindexecqueue-userptr-rebind.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2=
 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12843/sh=
ard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12843/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8288 -&gt; IGTPW_12843</li>
</ul>
<p>IGTPW_12843: 12843<br />
  IGT_8288: 8288<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============8498354218108846960==--
