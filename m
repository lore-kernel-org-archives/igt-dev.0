Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472ADC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44410E0AD;
	Sun,  6 Apr 2025 16:26:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00A410E083;
 Sun,  6 Apr 2025 16:26:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9164047201909998242=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_IGT_tests_for_the_KMS_Colo?=
 =?utf-8?q?r_Pipeline_API_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 16:26:42 -0000
Message-ID: <174395680268.41055.18111511928266665183@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326233609.2980110-1-alex.hung@amd.com>
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
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

--===============9164047201909998242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: IGT tests for the KMS Color Pipeline API (rev7)
URL   : https://patchwork.freedesktop.org/series/123448/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from XEIGT_8288_FULL -> XEIGTPW_12848_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12848_FULL absolutely need to=
 be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12848_FULL, please notify your bug team (I915-ci-in=
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
48_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_colorop@plane-xr24-xr24-bt2020_oetf (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][1] +45 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/i=
gt@kms_colorop@plane-xr24-xr24-bt2020_oetf.html

  * igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][2] +31 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/i=
gt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf.html

  * igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] +45 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463=
/igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          [PASS][4] -> ([CRASH][5], [PASS][6]) +1 other tes=
t ( 1 crash, 1 pass )
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@=
kms_fb_coherency@memset-crc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/i=
gt@kms_fb_coherency@memset-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/i=
gt@kms_fb_coherency@memset-crc.html
    - shard-dg2-set2:     [PASS][7] -> ([CRASH][8], [PASS][9]) +1 other tes=
t ( 1 crash, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/ig=
t@kms_fb_coherency@memset-crc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466=
/igt@kms_fb_coherency@memset-crc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435=
/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-lnl:          [PASS][10] -> ([PASS][11], [CRASH][12]) +1 other =
test ( 1 crash, 1 pass )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt=
@kms_fb_coherency@memset-crc@mmap-offset-wc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/=
igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/=
igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][13] -> ([INCOMPLETE][14], [PASS][15]) +1 o=
ther test ( 1 incomplete, 1 pass )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/i=
gt@kms_plane_lowres@tiling-4.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
5/igt@kms_plane_lowres@tiling-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_plane_lowres@tiling-4.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [PASS][16] -> ([PASS][17], [ABORT][18])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt=
@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/=
igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

 =20
New tests
---------

  New tests have been introduced between XEIGT_8288_FULL and XEIGTPW_12848_=
FULL:

### New IGT tests (94) ###

  * igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-bt2020_oetf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-bypass:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-multiply_125:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-multiply_inv_125:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_125_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_eotf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-3dlut_17_12_rgb:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-bt2020_oetf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-bypass:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-multiply_125:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-multiply_inv_125:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_125_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_properties@colorop-properties-atomic:
    - Statuses : 3 pass(s)
    - Exec time: [1.32, 2.75] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-atomic@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-atomic@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-atomic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@colorop-properties-atomic@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-legacy:
    - Statuses : 3 pass(s)
    - Exec time: [1.40, 2.73] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_properties@colorop-properties-legacy@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_properties@colorop-properties-legacy@pipe-b-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_properties@colorop-properties-legacy@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_properties@colorop-properties-legacy@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_properties@colorop-properties-legacy@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_properties@colorop-properties-legacy@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_properties@colorop-properties-legacy@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

 =20

Known issues
------------

  Here are the changes found in XEIGTPW_12848_FULL that come from known iss=
ues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linea=
r:
    - shard-lnl:          [PASS][19] -> ([PASS][20], [FAIL][21]) ([Intel XE=
#911]) +3 other tests ( 1 fail, 1 pass )
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/igt=
@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2/=
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.ht=
ml
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/=
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.ht=
ml

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-=
mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#255=
0] / [Intel XE#3767]) +15 other tests ( 2 skip )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc=
-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc=
-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#873])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [PASS][25] -> ([PASS][26], [SKIP][27]) ([Intel XE=
#664])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt=
@kms_async_flips@test-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/=
igt@kms_async_flips@test-cursor-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2/=
igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#316=
]) +1 other test ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2327])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/=
igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#232=
7]) +2 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/=
igt@kms_big_fb@linear-32bpp-rotate-90.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1407])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][34] ([Intel XE#4543])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-1=
/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#316]) +1 other te=
st skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1124]) +1 other t=
est skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#112=
4]) +3 other tests ( 2 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#112=
4]) +5 other tests ( 2 skip )
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#316])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-1=
/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1124])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/=
igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#4543]) =
+11 other tests dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/ig=
t@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-6=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1124]) +7 other t=
ests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/=
igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#112=
4]) +6 other tests ( 2 skip )
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1124]) +2 other t=
ests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-6=
/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][49] -> ([SKIP][50], [PASS][51]) ([Intel XE=
#2314] / [Intel XE#2894])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt=
@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/=
igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2314] / [Intel XE=
#2894])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/=
igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#219=
1])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#367=
])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][58], [SKIP][59]) ([Intel XE#367=
]) +1 other test ( 2 skip )
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#367=
])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/=
igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#787]) +158 other =
tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2652] / [Intel XE=
#787]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#265=
2] / [Intel XE#787]) +4 other tests ( 2 skip )
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#787=
]) +105 other tests ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2887])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2887]) +8 other t=
ests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/=
igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#288=
7]) +5 other tests ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#455] / [Intel XE#=
787]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#787]) +2 other te=
sts skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#343=
2]) +1 other test ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][76], [PASS][77]) ([Intel =
XE#3862]) +1 other test ( 1 incomplete, 1 pass )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([Intel XE#343=
2])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][80], [SKIP][81]) ([Intel XE#455=
] / [Intel XE#787]) +30 other tests ( 2 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#2907])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-2=
/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#266=
9]) +3 other tests ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#455] / [Intel XE#=
787]) +29 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][86] -> ([INCOMPLETE][87], [INCOMPLETE][88]=
) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#288=
7]) +2 other tests ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#2705] /=
 [Intel XE#4212]) +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][93] ([Intel XE#3124])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][94] -> ([INCOMPLETE][95], [DMESG-WARN][96]=
) ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#290=
7]) +1 other test ( 2 skip )
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#4416]) +3 other t=
ests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-43=
3/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> ([SKIP][100], [SKIP][101]) ([Intel XE#2=
325]) +1 other test ( 2 skip )
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_chamelium_color@ctm-max.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2325])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#3=
06]) +1 other test ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_chamelium_color@degamma.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#3=
06])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_chamelium_color@gamma.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#306])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
9/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2252]) +5 other =
tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#373])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][110], [SKIP][111]) ([Intel XE#3=
73]) +1 other test ( 2 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_chamelium_frames@vga-frame-dump.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#2=
252]) +4 other tests ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#3=
73]) +2 other tests ( 2 skip )
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#373])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][117] ([Intel XE#1178]) +1 other =
test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][118] ([Intel XE#1178])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2390])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#307])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([Intel XE#3=
07])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@kms_content_protection@dp-mst-lic-type-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][123], [FAIL][124]) ([Intel XE#3=
304])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2341]) +1 other =
test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][126] ([Intel XE#1188])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#4173]=
) +12 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@kms_cursor_crc@cursor-offscreen-128x42.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2320]) +2 other =
tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_cursor_crc@cursor-offscreen-256x85.html
    - shard-lnl:          NOTRUN -> ([SKIP][130], [SKIP][131]) ([Intel XE#1=
424])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][132], [SKIP][133]) ([Intel XE#3=
08])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> ([SKIP][134], [SKIP][135]) ([Intel XE#2=
320]) +1 other test ( 2 skip )
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_cursor_crc@cursor-random-32x32.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1424]) +1 other =
test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2321])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2286])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][139], [SKIP][140]) ([Intel XE#3=
23])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][141] -> ([PASS][142], [SKIP][143]) ([Intel=
 XE#2291]) +3 other tests ( 1 pass, 1 skip )
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#309]) +1 ot=
her test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.h=
tml

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][146] -> ([PASS][147], [SKIP][148]) ([Intel=
 XE#309]) +3 other tests ( 1 pass, 1 skip )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.h=
tml
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.h=
tml

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2291])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][150] -> ([SKIP][151], [SKIP][152]) ([Intel=
 XE#309])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> ([SKIP][153], [SKIP][154]) ([Intel XE#2=
286])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#1=
340])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     NOTRUN -> ([PASS][157], [SKIP][158]) ([Intel XE#4=
331])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][159], [SKIP][160]) ([Intel XE#2=
244])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][161], [SKIP][162]) ([Intel XE#4=
55]) +12 other tests ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_dsc@dsc-with-bpc-formats.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][163], [SKIP][164]) ([Intel XE#4=
422])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-bmg:          NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#4=
422])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#4422])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([Intel XE#4=
422])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#4422])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][171] -> ([SKIP][172], [PASS][173]) ([Intel=
 XE#310]) +7 other tests ( 1 pass, 1 skip )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][174] -> ([INCOMPLETE][175], [PASS][176]) (=
[Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-blocking-wf_vblank.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_flip@2x-blocking-wf_vblank.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          NOTRUN -> ([PASS][177], [SKIP][178]) ([Intel XE#2=
316])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_flip@2x-busy-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][179] -> [FAIL][180] ([Intel XE#2882]) +1 o=
ther test fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([Intel XE#2=
316]) +1 other test ( 2 skip )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][183] -> ([FAIL][184], [FAIL][185]) ([Intel=
 XE#3321]) +1 other test ( 2 fail )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][186] -> [FAIL][187] ([Intel XE#301] / [Int=
el XE#3321]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][188] -> [FAIL][189] ([Intel XE#301])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][190] -> ([FAIL][191], [PASS][192]) ([Intel=
 XE#3321]) +1 other test ( 1 fail, 1 pass )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][193] -> ([PASS][194], [FAIL][195]) ([Intel=
 XE#301]) +1 other test ( 1 fail, 1 pass )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][196] -> ([SKIP][197], [SKIP][198]) ([Intel=
 XE#2316]) +1 other test ( 2 skip )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2-set2:     [PASS][199] -> ([SKIP][200], [SKIP][201]) ([Intel=
 XE#310])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([Intel XE#1=
421]) +5 other tests ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][204] -> [SKIP][205] ([Intel XE#310]) +2 ot=
her tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_flip@2x-plain-flip-fb-recreate.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][206] ([Intel XE#2882]) +1 other =
test fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-dg2-set2:     [PASS][207] -> ([SKIP][208], [FAIL][209]) ([Intel=
 XE#2882] / [Intel XE#310])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][210] -> [FAIL][211] ([Intel XE#2882]) +2 o=
ther tests fail
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][212] -> [SKIP][213] ([Intel XE#2316]) +2 o=
ther tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-plain-flip-interruptible.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#1421])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][215] -> ([SKIP][216], [PASS][217]) ([Intel=
 XE#2316]) +1 other test ( 1 pass, 1 skip )
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#310]) +4 other t=
ests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][219] -> ([INCOMPLETE][220], [PASS][221]) (=
[Intel XE#2049])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][222], [PASS][223]) ([Inte=
l XE#2049])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][224] ([Intel XE#301])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][225], [PASS][226]) ([Intel XE#3=
01]) +1 other test ( 1 fail, 1 pass )
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][227], [FAIL][228]) ([Intel XE#3=
01])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][229] -> ([FAIL][230], [PASS][231]) ([Intel=
 XE#886]) +9 other tests ( 1 fail, 1 pass )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][232] -> ([FAIL][233], [PASS][234]) ([Intel=
 XE#2882])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@wf_vblank-ts-check.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp2:
    - shard-bmg:          NOTRUN -> ([FAIL][235], [PASS][236]) ([Intel XE#2=
882])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check@a-dp2.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#455]) +3 other t=
ests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2293] / [Intel X=
E#2380]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-lnl:          NOTRUN -> ([SKIP][239], [SKIP][240]) ([Intel XE#1=
401] / [Intel XE#1745])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pi=
pe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#1=
401])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pi=
pe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2293]) +2 other =
tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling:
    - shard-bmg:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#2=
293] / [Intel XE#2380]) +3 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode:
    - shard-adlp:         [PASS][246] -> [DMESG-FAIL][247] ([Intel XE#324] =
/ [Intel XE#4543]) +3 other tests dmesg-fail
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-v=
alid-mode.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-=
a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][248], [SKIP][249]) ([Intel XE#2=
293]) +3 other tests ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][250], [SKIP][251]) ([Intel XE#2=
312]) +1 other test ( 2 skip )
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][252], [SKIP][253]) ([Intel XE#6=
51] / [Intel XE#656]) +3 other tests ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2=
311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#656]) +1 other t=
est skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][257] ([Intel XE#656]) +5 other t=
ests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][258] -> ([PASS][259], [SKIP][260]) ([Intel=
 XE#656]) +12 other tests ( 1 pass, 1 skip )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][261] -> ([SKIP][262], [SKIP][263]) ([Intel=
 XE#656]) +1 other test ( 2 skip )
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#2=
312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][266] ([Intel XE#4141]) +6 other =
tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#4=
141]) +7 other tests ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([Intel XE#6=
51]) +3 other tests ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#651]) +1 other t=
est skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][272] ([Intel XE#2311]) +12 other=
 tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2312]) +1 other =
test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#656])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#2=
311]) +12 other tests ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#651]) +3 other t=
ests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#6=
51]) +8 other tests ( 2 skip )
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.=
html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#653]) +1 other t=
est skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-bmg:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([Intel XE#2=
313]) +12 other tests ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][283] ([Intel XE#2313]) +15 other=
 tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([Intel XE#2=
312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][286] ([Intel XE#4439])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> ([SKIP][287], [SKIP][288]) ([Intel XE#4=
439])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#653]) +5 other t=
ests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#6=
56]) +8 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][292], [SKIP][293]) ([Intel XE#6=
53] / [Intel XE#656]) +3 other tests ( 2 skip )
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#6=
53]) +8 other tests ( 2 skip )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][296] -> ([PASS][297], [SKIP][298]) ([Intel=
 XE#1503])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_hdr@invalid-hdr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_hdr@invalid-hdr.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#4=
329])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [PASS][301] -> [FAIL][302] ([Intel XE#1471]) +1 o=
ther test fail
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][303] -> ([FAIL][304], [PASS][305]) ([Intel=
 XE#616]) +1 other test ( 1 fail, 1 pass )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2-set2:     [PASS][306] -> [SKIP][307] ([Intel XE#4596])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_plane_multiple@2x-tiling-none.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][308] -> [SKIP][309] ([Intel XE#2571])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][310] ([Intel XE#4212])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][311] ([Intel XE#4540]) +1 other=
 test abort
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> ([SKIP][312], [SKIP][313]) ([Intel XE#2=
763]) +4 other tests ( 2 skip )
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][314] ([Intel XE#2763]) +9 other =
tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.ht=
ml

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#8=
70])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_pm_backlight@fade-with-dpms.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][317] ([Intel XE#870])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][318] ([Intel XE#2391])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][319] -> ([FAIL][320], [PASS][321]) ([Intel=
 XE#718])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_pm_dc@dc5-dpms.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_pm_dc@dc5-dpms.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][322] -> [FAIL][323] ([Intel XE#718])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@kms_pm_dc@dc5-psr.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([Intel XE#2=
505])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_pm_dc@deep-pkgc.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][326], [SKIP][327]) ([Intel XE#9=
08])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_pm_dc@deep-pkgc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#1439] / [Intel X=
E#836])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#1=
489]) +5 other tests ( 2 skip )
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> ([SKIP][331], [SKIP][332]) ([Intel XE#2=
893]) +1 other test ( 2 skip )
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][333] ([Intel XE#4570]) +2 other =
tests fail
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp=
-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][334] ([Intel XE#1489]) +2 other =
tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][335] ([Intel XE#1489]) +1 other =
test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][336] ([Intel XE#1489]) +1 other =
test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][337], [SKIP][338]) ([Intel XE#1=
489])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][339] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_psr@fbc-psr-primary-render.html
    - shard-bmg:          NOTRUN -> ([SKIP][340], [SKIP][341]) ([Intel XE#2=
234] / [Intel XE#2850]) +8 other tests ( 2 skip )
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_psr@fbc-psr-primary-render.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][342] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> ([FAIL][343], [FAIL][344]) ([Intel XE#4=
568]) +1 other test ( 2 fail )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_psr@fbc-psr2-basic@edp-1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][345] ([Intel XE#2234] / [Intel X=
E#2850]) +5 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][346], [SKIP][347]) ([Intel XE#2=
850] / [Intel XE#929]) +7 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_psr@fbc-psr2-dpms.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][348], [SKIP][349]) ([Intel XE#1=
406]) +1 other test ( 2 skip )
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_psr@pr-primary-page-flip.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#2414])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#2939])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> ([SKIP][352], [SKIP][353]) ([Intel XE#3=
414] / [Intel XE#3904])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_rotation_crc@bad-pixel-format.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][354] ([Intel XE#1435]) +2 other =
tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][355] -> [SKIP][356] ([Intel XE#1435])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_setmode@invalid-clone-single-crtc-stealing.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [PASS][357] -> ([PASS][358], [SKIP][359]) ([Intel=
 XE#455])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2426])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][361] -> [FAIL][362] ([Intel XE#899])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][363] -> [FAIL][364] ([Intel XE#899])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][365] -> ([FAIL][366], [PASS][367]) ([Intel=
 XE#4459]) +1 other test ( 1 fail, 1 pass )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@kms_vrr@cmrr@pipe-a-edp-1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][368] ([Intel XE#455]) +3 other t=
ests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> ([SKIP][369], [SKIP][370]) ([Intel XE#1=
499])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_vrr@max-min.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([Intel XE#1=
499])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@kms_vrr@seamless-rr-switch-vrr.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][373] ([Intel XE#756]) +1 other t=
est skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][374], [SKIP][375]) ([Intel XE#7=
56])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][376] ([Intel XE#455] / [Intel XE=
#488])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][377], [SKIP][378]) ([Intel XE#2=
905]) +5 other tests ( 2 skip )
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-access-parameters.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#2=
905] / [Intel XE#3889])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][381] ([Intel XE#2905])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> ([SKIP][382], [SKIP][383]) ([Intel XE#2=
905] / [Intel XE#4259])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_eudebug@discovery-race-sigint.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> ([SKIP][384], [SKIP][385]) ([Intel XE#2=
905])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_eudebug@multigpu-basic-client-many.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_eudebug@multigpu-basic-client-many.html
    - shard-adlp:         NOTRUN -> [SKIP][386] ([Intel XE#2905])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][387] ([Intel XE#2905]) +4 other =
tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([Intel XE#2=
905]) +3 other tests ( 2 skip )
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_eudebug_online@basic-breakpoint.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][390] ([Intel XE#4577])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-bmg:          NOTRUN -> ([SKIP][391], [SKIP][392]) ([Intel XE#4=
577])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> ([SKIP][393], [SKIP][394]) ([Intel XE#4=
577])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> ([SKIP][395], [SKIP][396]) ([Intel XE#4=
518])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_eudebug_sriov@deny-eudebug.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][397] ([Intel XE#4519])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> ([SKIP][398], [SKIP][399]) ([Intel XE#4=
518])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_eudebug_sriov@deny-eudebug.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][400], [SKIP][401]) ([Intel XE#4=
518])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@xe_eudebug_sriov@deny-sriov.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> ([SKIP][402], [SKIP][403]) ([Intel XE#6=
88])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_evict@evict-beng-large-external-cm.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][404] ([Intel XE#2322]) +2 other =
tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][405] ([Intel XE#1392])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#1=
392]) +1 other test ( 2 skip )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][408] -> [SKIP][409] ([Intel XE#1392]) +2 o=
ther tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][410] -> ([SKIP][411], [PASS][412]) ([Intel=
 XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][413], [SKIP][414]) ([Intel XE#2=
322]) +4 other tests ( 2 skip )
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][415] ([Intel XE#288]) +3 other t=
ests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][416] ([Intel XE#288]) +3 other t=
ests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#2=
88]) +12 other tests ( 2 skip )
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@xe_exec_fault_mode@many-userptr.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][419], [SKIP][420]) ([Intel XE#2=
360])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#2=
55])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_huc_copy@huc_copy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][423] -> ([FAIL][424], [FAIL][425]) ([Intel=
 XE#1999]) +2 other tests ( 2 fail )
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> ([SKIP][426], [SKIP][427]) ([Intel XE#2=
459] / [Intel XE#2596])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_media_fill@media-fill.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][428], [PASS][429], [PASS][430], [PASS][43=
1], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS]=
[437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PA=
SS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], =
[PASS][449], [PASS][450], [PASS][451], [PASS][452]) -> ([PASS][453], [PASS]=
[454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PA=
SS][460], [PASS][461], [PASS][462], [PASS][463], [PASS][464], [PASS][465], =
[PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471=
], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][=
477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PAS=
S][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [=
PASS][489], [SKIP][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494]=
, [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS][499], [PASS][5=
00], [PASS][501], [PASS][502], [PASS][503]) ([Intel XE#378])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1=
/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][504], [PASS][505], [PASS][506], [PASS][50=
7], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS]=
[513], [PASS][514], [PASS][515], [PASS][516], [PASS][517], [PASS][518], [PA=
SS][519], [PASS][520], [PASS][521], [PASS][522], [PASS][523]) -> ([PASS][52=
4], [PASS][525], [PASS][526], [PASS][527], [PASS][528], [PASS][529], [PASS]=
[530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PA=
SS][536], [PASS][537], [PASS][538], [PASS][539], [SKIP][540], [PASS][541], =
[PASS][542], [PASS][543], [PASS][544], [PASS][545], [PASS][546], [PASS][547=
], [PASS][548], [PASS][549], [PASS][550], [PASS][551], [PASS][552], [PASS][=
553], [SKIP][554], [PASS][555], [PASS][556], [PASS][557], [PASS][558], [PAS=
S][559], [PASS][560], [PASS][561], [PASS][562]) ([Intel XE#2457])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][563], [PASS][564], [PASS][565], [PASS][56=
6], [PASS][567], [PASS][568], [PASS][569], [PASS][570], [PASS][571], [PASS]=
[572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PA=
SS][578], [PASS][579], [PASS][580], [PASS][581], [PASS][582], [PASS][583], =
[PASS][584], [PASS][585], [PASS][586], [PASS][587]) -> ([PASS][588], [PASS]=
[589], [PASS][590], [PASS][591], [PASS][592], [PASS][593], [PASS][594], [PA=
SS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PASS][600], =
[PASS][601], [PASS][602], [PASS][603], [PASS][604], [PASS][605], [PASS][606=
], [SKIP][607], [PASS][608], [PASS][609], [PASS][610], [PASS][611], [PASS][=
612], [PASS][613]) ([Intel XE#378])
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
9/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
9/igt@xe_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_module_load@load.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@xe_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@xe_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][614] -> [DMESG-WARN][615] ([Intel XE#2953]=
 / [Intel XE#4173])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@many-reload.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][616] -> ([PASS][617], [FAIL][618]) ([Intel=
 XE#4541])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_oa@buffer-size.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@xe_oa@buffer-size.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][619] ([Intel XE#4541])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][620] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][621] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][622], [SKIP][623]) ([Intel XE#2=
541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_oa@privileged-forked-access-vaddr.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][624] ([Intel XE#2541] / [Intel X=
E#3573] / [Intel XE#4501])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][625] ([Intel XE#1173])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][626] ([Intel XE#2284])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][627] ([Intel XE#2284])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][628], [SKIP][629]) ([Intel XE#2=
284] / [Intel XE#366])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_pm@s3-d3cold-basic-exec.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][630] ([Intel XE#584])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][631] -> ([ABORT][632], [PASS][633]) ([Inte=
l XE#1794]) +1 other test ( 1 abort, 1 pass )
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_pm@s4-d3hot-basic-exec.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_pm@s4-d3hot-basic-exec.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][634] -> [ABORT][635] ([Intel XE#1794]) +1 =
other test abort
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_pm@s4-multiple-execs.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][636] ([Intel XE#944])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5=
/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> ([SKIP][637], [SKIP][638]) ([Intel XE#9=
44]) +1 other test ( 2 skip )
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_query@multigpu-query-invalid-extension.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-adlp:         NOTRUN -> [SKIP][639] ([Intel XE#944])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
1/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> ([SKIP][640], [SKIP][641]) ([Intel XE#9=
44])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_query@multigpu-query-invalid-extension.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][642] ([Intel XE#944])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][643], [SKIP][644]) ([Intel XE#9=
44]) +1 other test ( 2 skip )
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> ([SKIP][645], [SKIP][646]) ([Intel XE#4=
130])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2=
/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> ([SKIP][647], [SKIP][648]) ([Intel XE#3=
342])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@xe_sriov_flr@flr-vf1-clear.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][649] ([Intel XE#4351])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@xe_sriov_scheduling@equal-throughput.html

 =20
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][650] ([Intel XE#2314] / [Intel XE#2894]) -=
> ([PASS][651], [PASS][652])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][653] ([Intel XE#2705] / [Intel XE#42=
12] / [Intel XE#4345]) -> [PASS][654]
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#309]) -> [PASS][656]
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][657] ([Intel XE#2291]) -> ([PASS][658], [P=
ASS][659]) +2 other tests ( 2 pass )
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][660] ([Intel XE#2291]) -> [PASS][661]
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#309]) -> ([PASS][663], [PA=
SS][664]) +2 other tests ( 2 pass )
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#455]) -> ([PASS][666], [PA=
SS][667])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#3009]) -> ([PASS][669], [P=
ASS][670])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dp_aux_dev.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_dp_aux_dev.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][671] ([Intel XE#2373]) -> ([PASS][672], [P=
ASS][673])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_feature_discovery@display-2x.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_feature_discovery@display-2x.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][674] ([Intel XE#301]) -> [PASS][675] +4 ot=
her tests pass
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][676] ([Intel XE#301]) -> ([PASS][677], [PA=
SS][678]) +1 other test ( 2 pass )
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#310]) -> [PASS][680]
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_flip@2x-plain-flip-ts-check.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][681] ([Intel XE#2316]) -> ([PASS][682], [P=
ASS][683]) +1 other test ( 2 pass )
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][684] ([Intel XE#301] / [Intel XE#3321]) ->=
 [PASS][685] +1 other test pass
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][686] ([Intel XE#2049] / [Intel XE#25=
97]) -> ([PASS][687], [PASS][688]) +2 other tests ( 2 pass )
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-suspend-interruptible.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@flip-vs-suspend-interruptible.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][689] ([Intel XE#2049] / [Intel XE#25=
97]) -> [PASS][690]
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][691] ([Intel XE#4543]) -> [PASS][692=
] +7 other tests pass
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [DMESG-WARN][693] ([Intel XE#4173]) -> [PASS][694=
] +2 other tests pass
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#656]) -> ([PASS][696], [PA=
SS][697]) +3 other tests ( 2 pass )
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][698] ([Intel XE#656]) -> [PASS][699] +2 ot=
her tests pass
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][700] ([Intel XE#4328]) -> ([PASS][701], [P=
ASS][702])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [FAIL][703] ([Intel XE#1471]) -> [PASS][704] +1 o=
ther test pass
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@kms_plane_cursor@viewport.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
6/igt@kms_plane_cursor@viewport.html
    - shard-dg2-set2:     [FAIL][705] ([Intel XE#616]) -> [PASS][706] +1 ot=
her test pass
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_cursor@viewport.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][707] ([Intel XE#4596]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_plane_multiple@2x-tiling-none.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#4596]) -> [PASS][710]
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_multiple@2x-tiling-x.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#836]) -> ([PASS][712], [PA=
SS][713]) +1 other test ( 2 pass )
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_pm_rpm@modeset-non-lpsp.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_pm_rpm@modeset-non-lpsp.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][714] ([Intel XE#2883]) -> ([PASS][715], [P=
ASS][716]) +2 other tests ( 2 pass )
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@kms_setmode@basic@pipe-b-edp-1.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_setmode@basic@pipe-b-edp-1.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][717] ([Intel XE#771]) -> [PASS][718]
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][719] ([Intel XE#2953] / [Intel XE#41=
73]) -> [PASS][720] +1 other test pass
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_vblank@ts-continuation-suspend.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_=
compute:
    - shard-lnl:          [FAIL][721] ([Intel XE#4278]) -> [PASS][722] +1 o=
ther test pass
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_comput=
e.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_com=
pute.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1392]) -> ([PASS][724], [P=
ASS][725]) +2 other tests ( 2 pass )
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [SKIP][726] ([Intel XE#1392]) -> [PASS][727]
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][728] ([Intel XE#1794]) -> ([PASS][729], [=
PASS][730])
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_pm@s4-vm-bind-unbind-all.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@xe_pm@s4-vm-bind-unbind-all.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4=
/igt@xe_pm@s4-vm-bind-unbind-all.html

 =20
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#2191]) -> ([PASS][732], [S=
KIP][733]) ([Intel XE#2191])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][734] ([Intel XE#787]) -> ([SKIP][735], [SK=
IP][736]) ([Intel XE#455] / [Intel XE#787]) +8 other tests ( 2 skip )
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#787]) -> [SKIP][738] ([Int=
el XE#455] / [Intel XE#787]) +4 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#455] / [Intel XE#787]) -> =
([SKIP][740], [SKIP][741]) ([Intel XE#787]) +5 other tests ( 2 skip )
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#455] / [Intel XE#787]) -> =
[SKIP][743] ([Intel XE#787]) +1 other test skip
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][744] ([Intel XE#4440]) -> ([SKIP][745], [S=
KIP][746]) ([Intel XE#4418] / [Intel XE#4440])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cdclk@mode-transition-all-outputs.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cdclk@mode-transition-all-outputs.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][747] ([Intel XE#2341]) -> ([FAIL][748], [S=
KIP][749]) ([Intel XE#1178] / [Intel XE#2341])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_content_protection@atomic.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_content_protection@atomic.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][750] ([Intel XE#1178]) -> ([SKIP][751], [F=
AIL][752]) ([Intel XE#1178] / [Intel XE#2341])
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_content_protection@atomic-dpms.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_content_protection@atomic-dpms.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#455]) -> ([FAIL][754], [FA=
IL][755]) ([Intel XE#1178])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@lic-type-0.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_content_protection@lic-type-0.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][756] ([Intel XE#455]) -> ([SKIP][757], [FA=
IL][758]) ([Intel XE#1188] / [Intel XE#455])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@uevent.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_content_protection@uevent.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][759] ([Intel XE#2291]) -> ([SKIP][760], [P=
ASS][761]) ([Intel XE#2291])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [SKIP][762] ([Intel XE#309]) -> ([SKIP][763], [PA=
SS][764]) ([Intel XE#309])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][765] ([Intel XE#4302]) -> ([SKIP][766], [P=
ASS][767]) ([Intel XE#4302])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_display_modes@extended-mode-basic.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_display_modes@extended-mode-basic.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][768] ([Intel XE#455] / [i915#3804]) -> ([S=
KIP][769], [SKIP][770]) ([i915#3804])
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#310]) -> ([SKIP][772], [PA=
SS][773]) ([Intel XE#310])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][774] ([Intel XE#301]) -> ([FAIL][775], [PA=
SS][776]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][777] ([Intel XE#3321]) -> ([PASS][778], [F=
AIL][779]) ([Intel XE#3321]) +3 other tests ( 1 fail, 1 pass )
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][780] ([Intel XE#2316]) -> ([PASS][781], [S=
KIP][782]) ([Intel XE#2316])
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][783] ([Intel XE#301]) -> ([PASS][784], [FA=
IL][785]) ([Intel XE#301]) +2 other tests ( 1 fail, 1 pass )
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][786] ([Intel XE#301] / [Intel XE#3149]) ->=
 ([PASS][787], [FAIL][788]) ([Intel XE#301] / [Intel XE#3149]) +1 other tes=
t ( 1 fail, 1 pass )
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][789] ([Intel XE#4543]) -> [DMESG-FAI=
L][790] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][791] ([Intel XE#2311]) -> [SKIP][792] ([In=
tel XE#2312]) +5 other tests skip
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][793] ([Intel XE#656]) -> ([SKIP][794], [SK=
IP][795]) ([Intel XE#651]) +7 other tests ( 2 skip )
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][796] ([Intel XE#2311]) -> ([SKIP][797], [S=
KIP][798]) ([Intel XE#2312])
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][799] ([Intel XE#651]) -> [SKIP][800] ([Int=
el XE#656]) +2 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
    - shard-bmg:          [SKIP][801] ([Intel XE#2312]) -> ([SKIP][802], [S=
KIP][803]) ([Intel XE#2311] / [Intel XE#2312]) +2 other tests ( 2 skip )
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][804] ([Intel XE#2312]) -> [SKIP][805] ([In=
tel XE#2311]) +6 other tests skip
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][806] ([Intel XE#651]) -> ([SKIP][807], [SK=
IP][808]) ([Intel XE#651] / [Intel XE#656]) +11 other tests ( 2 skip )
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][809] ([Intel XE#2312]) -> ([SKIP][810], [S=
KIP][811]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][812] ([Intel XE#656]) -> ([SKIP][813], [PA=
SS][814]) ([Intel XE#656])
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][815] ([Intel XE#4141]) -> ([SKIP][816], [S=
KIP][817]) ([Intel XE#2312] / [Intel XE#4141]) +6 other tests ( 2 skip )
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][818] ([Intel XE#2312]) -> [SKIP][819] ([In=
tel XE#4141]) +4 other tests skip
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][820] ([Intel XE#4141]) -> [SKIP][821] ([In=
tel XE#2312]) +4 other tests skip
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][822] ([Intel XE#2312]) -> ([SKIP][823], [S=
KIP][824]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][825] ([Intel XE#2312]) -> ([SKIP][826], [S=
KIP][827]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][828] ([Intel XE#656]) -> [SKIP][829] ([Int=
el XE#651]) +1 other test skip
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][830] ([Intel XE#656]) -> ([SKIP][831], [SK=
IP][832]) ([Intel XE#651] / [Intel XE#656]) +2 other tests ( 2 skip )
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][833] ([Intel XE#2311]) -> ([SKIP][834], [S=
KIP][835]) ([Intel XE#2311] / [Intel XE#2312]) +9 other tests ( 2 skip )
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][836] ([Intel XE#651]) -> ([SKIP][837], [SK=
IP][838]) ([Intel XE#656]) +1 other test ( 2 skip )
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][839] ([Intel XE#656]) -> ([SKIP][840], [SK=
IP][841]) ([Intel XE#653]) +3 other tests ( 2 skip )
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.h=
tml
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.h=
tml

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][842] ([Intel XE#2312]) -> ([SKIP][843], [S=
KIP][844]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][845] ([Intel XE#656]) -> ([SKIP][846], [SK=
IP][847]) ([Intel XE#653] / [Intel XE#656])
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][848] ([Intel XE#2313]) -> ([SKIP][849], [S=
KIP][850]) ([Intel XE#2312] / [Intel XE#2313]) +10 other tests ( 2 skip )
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][851] ([Intel XE#2312]) -> [SKIP][852] ([In=
tel XE#2313]) +8 other tests skip
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][853] ([Intel XE#653]) -> ([SKIP][854], [SK=
IP][855]) ([Intel XE#653] / [Intel XE#656]) +16 other tests ( 2 skip )
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][856] ([Intel XE#2313]) -> ([SKIP][857], [S=
KIP][858]) ([Intel XE#2312])
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][859] ([Intel XE#656]) -> [SKIP][860] ([Int=
el XE#653]) +5 other tests skip
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][861] ([Intel XE#653]) -> [SKIP][862] ([Int=
el XE#656])
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][863] ([Intel XE#2312]) -> ([SKIP][864], [S=
KIP][865]) ([Intel XE#2312] / [Intel XE#2313]) +6 other tests ( 2 skip )
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][866] ([Intel XE#2313]) -> [SKIP][867] ([In=
tel XE#2312]) +4 other tests skip
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][868] ([Intel XE#455]) -> ([PASS][869], [SK=
IP][870]) ([Intel XE#455]) +1 other test ( 1 pass, 1 skip )
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_hdr@invalid-hdr.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
63/igt@kms_hdr@invalid-hdr.html
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][871] ([Intel XE#4596]) -> [SKIP][872] ([In=
tel XE#2493])
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_plane_multiple@2x-tiling-y.html
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8=
/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][873] ([Intel XE#4596]) -> [SKIP][874] ([In=
tel XE#455])
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_multiple@2x-tiling-y.html
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
66/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][875] ([Intel XE#362]) -> ([FAIL][876], [FA=
IL][877]) ([Intel XE#1729])
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
36/igt@kms_tiled_display@basic-test-pattern.html
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][878] ([Intel XE#1500]) -> ([SKIP][879], [S=
KIP][880]) ([Intel XE#362])
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][881] ([Intel XE#771]) -> [FAIL][882] ([Int=
el XE#771] / [Intel XE#899])
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          [FAIL][883] ([Intel XE#771]) -> [FAIL][884] ([Int=
el XE#899]) +2 other tests fail
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][885] ([Intel XE#756]) -> ([SKIP][886], [SK=
IP][887]) ([Intel XE#326] / [Intel XE#756]) +3 other tests ( 2 skip )
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_writeback@writeback-fb-id.html
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_writeback@writeback-fb-id.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][888] ([Intel XE#1392]) -> ([SKIP][889], [P=
ASS][890]) ([Intel XE#1392]) +2 other tests ( 1 pass, 1 skip )
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][891] ([Intel XE#1061]) -> ([SKIP][892], [F=
AIL][893]) ([Intel XE#1061] / [Intel XE#1173])
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_peer2peer@read.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
32/igt@xe_peer2peer@read.html
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-4=
64/igt@xe_peer2peer@read.html

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
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
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
  [Intel XE#326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/326
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
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
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
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

  * IGT: IGT_8288 -> IGTPW_12848

  IGTPW_12848: 12848
  IGT_8288: 8288
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/index.html

--===============9164047201909998242==
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
<tr><td><b>Series:</b></td><td>IGT tests for the KMS Color Pipeline API (re=
v7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/123448/">https://patchwork.freedesktop.org/series/123448/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8288_FULL -&gt; XEIGTPW_12848_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12848_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12848_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
848_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bt2020_oetf (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@kms_colorop@plane-xr24-xr24-bt20=
20_oetf.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_colorop@plane-xr24-xr24-pq_e=
otf-pq_inv_eotf.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_colorop@plane-xr30-xr30-pq=
_125_inv_eotf.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_fb_coherency@memset-crc.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bm=
g-8/igt@kms_fb_coherency@memset-crc.html">CRASH</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_fb_coherency=
@memset-crc.html">PASS</a>) +1 other test ( 1 crash, 1 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_fb_coherency@memset-crc.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-=
dg2-466/igt@kms_fb_coherency@memset-crc.html">CRASH</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_fb_coh=
erency@memset-crc.html">PASS</a>) +1 other test ( 1 crash, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-lnl-1/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sha=
rd-lnl-7/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html">CRASH</a>) +1=
 other test ( 1 crash, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg=
2-435/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_plane=
_lowres@tiling-4.html">PASS</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_create.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bin=
d_ioctl_ops_create.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm=
_bind_ioctl_ops_create.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8288_FULL and XEIGTPW_12848=
_FULL:</p>
<h3>New IGT tests (94)</h3>
<ul>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bt2020_oetf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-bypass:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_50_desat:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_overdrive:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-ctm_3x4_oversaturate:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-multiply_125:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-multiply_inv_125:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_125_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_125_inv_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_eotf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_eotf-pq_inv_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-pq_inv_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_eotf-srgb_inv_eotf-srgb_eotf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut-srgb_eotf_lut:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-3dlut_17_12_rgb:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf-bt2020_oetf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bt2020_oetf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-bypass:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_50_desat:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_dec_enc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc_dec:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_overdrive:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-ctm_3x4_oversaturate:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-multiply_125:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-multiply_inv_125:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_eotf-pq_inv_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_eotf-srgb_inv_eotf-srgb_eotf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut-srgb_eotf_lut:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.32, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.40, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-b-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12848_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-a-edp-1-linear.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2/igt@kms_async_flips@async-flip=
-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@kms_async_=
flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel =
XE#911</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
50">Intel XE#2550</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3767">Intel XE#3767</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_async_flips@invalid-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-6/igt@kms_async_flips@test-cursor-atomic.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/s=
hard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2/igt@k=
ms_async_flips@test-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12848/shard-dg2-436/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-=
90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel=
 XE#2327</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotat=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate=
-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-lnl-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate=
-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12848/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1=
080p.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-=
1920x1080p.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3=
-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays=
-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x=
2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays=
-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled=
-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +158 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled=
-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_ccs@ccs-on-anothe=
r-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +105 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_ccs@crc-pri=
mary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +=
1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-t=
iled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12848/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-m=
tl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_ccs@crc-primar=
y-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +30 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">I=
NCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12848/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg=
2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +1=
 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
48/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>=
) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@kms_chamelium_color@gamma.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/shard-lnl-4/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-9/igt@kms_chamelium_color@gamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
06">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-af=
ter-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspen=
d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable=
-disable-mode.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_content_protection@atomic@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_content_protection@lic-type-0@=
pipe-a-dp-4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_content_protection@uevent@=
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
48/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen=
-256x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_cursor_legacy@b=
asic-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">=
PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#22=
91</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_cursor_legacy@cursor=
b-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html=
">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/s=
hard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_cursor_legacy=
@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-fallback.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with=
-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-=
dirty-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>) +7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html">INCOMPLETE</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_f=
lip@2x-blocking-wf_vblank.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test ( 1 i=
ncomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_flip@2x-busy-flip.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sha=
rd-bmg-6/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE=
#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs=
-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-v=
s-modeset-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_flip@2x-flip-vs-=
expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/=
shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@k=
ms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other t=
est ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464=
/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interr=
uptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/=
shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate-interru=
ptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-interrupt=
ible.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2882">Intel XE#2882</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/=
shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#231=
6</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.ht=
ml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
48/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"=
>Intel XE#2316</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-d=
g2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-=
vblank@a-dp4.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vbl=
ank@a-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@b-hdmi-a6.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test (=
 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@d-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@d-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-=
edp1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interrupti=
ble@a-edp1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interrupti=
ble@a-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>) +9 other tests ( 1 fail, 1 pass )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bm=
g-4/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_flip@wf_vblan=
k-ts-check.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-d=
p2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-dp2.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel=
 XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
 +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_flip_scaled_crc=
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
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_flip_sca=
led_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2380">Intel XE#2380</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@kms_flip_sca=
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
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-=
3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_frontbuffer_=
tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_frontbuffer_trac=
king@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) +3 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests ( =
1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-ti=
ling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linea=
r.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test ski=
p</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
313">Intel XE#2313</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4439">Intel XE#4439</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@=
kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888=
-ytiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-6=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size=
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
xe/IGTPW_12848/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-s=
ize-64.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-siz=
e-64.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-none.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/s=
hard-dg2-464/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE=
#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) +1 other test abort</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-5@pipe-c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-5@pipe-c.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@k=
ms_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sha=
rd-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-update-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2893">Intel XE#2893</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4570">Intel XE#4570</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-bmg-2/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@kms_psr@fbc-psr2-basic@edp-1.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
848/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/s=
hard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
848/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel=
 XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-steali=
ng.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-=
5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-e=
dp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459">Intel XE#4459</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_vrr@flip-basic-fastset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_vrr@max-min.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg=
-1/igt@kms_vrr@max-min.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#14=
99</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_writeback@writeback-check=
-output-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@xe_ccs@block-copy-compressed-in=
c-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@xe_eudebug@basic-vm-access-pa=
rameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2905">Intel XE#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_eudebug@basic-vm-access-para=
meters-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_eudebug@basic-vm-access-parameters-=
userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@xe_eudebug@basic-vm-access-use=
rptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@xe_eudebug@discovery-race-sigin=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-bmg-1/igt@xe_eudebug@discovery-race-sigint.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel X=
E#2905</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@xe_eudebug@multigpu-basic-clien=
t-many.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@xe_eudebug@multigpu-basic-clien=
t-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@xe_eudebug@read-metadata.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@xe_eudebug_online@basic-breakpo=
int.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-bmg-6/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_evict@evict-beng-large-exter=
nal-cm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic=
-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@xe_exec_basic@multigpu=
-no-exec-bindexecqueue-userptr-rebind.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_exec_basic@multigpu-once-nul=
l-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexe=
cqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@xe_exec_fault_mode@many-execqu=
eues-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@xe_exec_fault_mode@many-userp=
tr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-dg2-464/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel =
XE#288</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinne=
r-interrupted-lr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-int=
errupted-lr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sh=
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
e/IGTPW_12848/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_k=
unit.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1999">Intel XE#1999</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_media_fill@media-fill.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/=
shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#=
2596</a>)</li>
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
e/intel-xe/IGTPW_12848/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/s=
hard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shar=
d-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12848/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
848/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12848/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12848/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
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
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12848/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
848/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@xe_module_load@load=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bm=
g-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
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
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-=
adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shar=
d-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@xe_module_load@load=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12848/shard-adlp-6/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adl=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/igt@x=
e_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-6/igt@xe_oa@create-destroy-userspace-=
config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_oa@invalid-remove-userspace=
-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_oa@privileged-forked-acces=
s-vaddr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12848/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait.html"=
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
/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">In=
tel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
848/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
4">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-=
2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_pm@s4-d3hot-basic=
-exec.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ab=
ort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-lnl-5/igt@xe_query@multigpu-query-cs-cycle=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-adlp-1/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@xe_query@multigpu-query-topology=
-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12848/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-=
guc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-lnl-2/igt@xe_sriov_auto_provisioning@fair=
-allocation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-allocatio=
n.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
8/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@xe_sriov_scheduling@equal-throug=
hput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_bw@connect=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-l=
egacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-atomic.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_cursor_legacy@2x-non=
blocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_cursor_legacy@curs=
orb-vs-flipa-atomic-transitions.html">PASS</a>) +2 other tests ( 2 pass )</=
li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-d=
g2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-dg2-432/igt@kms_dp_aux_dev.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_dp_aux_dev.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg=
-7/igt@kms_feature_discovery@display-2x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +4 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@ad-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ad-hdmi-a6-dp4.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-dg2-433/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_flip@2x-single-buffer-=
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
rg/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_flip@flip-vs-expired-vbl=
ank@a-dp4.html">PASS</a> +1 other test pass</li>
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
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_flip@flip=
-vs-suspend-interruptible@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-sh=
rfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_frontbu=
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
ntel-xe/IGTPW_12848/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.ht=
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
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>) =
+3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4328">Intel XE#4328</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12848/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joi=
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
848/shard-adlp-6/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
48/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Inte=
l XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#=
836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12848/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt=
@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12848/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-7/i=
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
/tree/intel-xe/IGTPW_12848/shard-adlp-2/igt@kms_universal_plane@cursor-fb-l=
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
01.org/tree/intel-xe/IGTPW_12848/shard-adlp-8/igt@kms_vblank@ts-continuatio=
n-suspend.html">PASS</a> +1 other test pass</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-3/igt@xe_comp=
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@xe_exec_basic=
@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS=
</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@xe_exec_basic@multigpu-=
many-execqueues-many-vm-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12848/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-lnl-4/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_bw@connected-linear-=
tiling-2-displays-2160x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_bw@connected-linea=
r-tiling-2-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_ccs@bad-aux-strid=
e-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_ccs@bad-au=
x-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_ccs@bad-rotatio=
n-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +4 other tests skip</li>
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
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_ccs@ccs-o=
n-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_ccs@cc=
s-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 =
other tests ( 2 skip )</li>
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
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12848/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2848/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt=
@kms_content_protection@atomic.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Int=
el XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12848/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-bmg-4/igt@kms_content_protection@atomic-dpms.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Inte=
l XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12848/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard=
-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434=
/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12848/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-le=
gacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12848/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#=
4302</a>)</li>
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
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_dither@fb-8bpc=
-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-=
off-vs-modeset-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_flip@2x-flip-vs-dp=
ms-off-vs-modeset-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-i=
nterruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +2 other tests ( 1 fail, 1 pass )</li>
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
rg/tree/intel-xe/IGTPW_12848/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12848/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
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
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-adlp-4/igt@kms_flip_s=
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
drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_t=
racking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-435/igt@kms_frontbuffe=
r_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tracking=
@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tes=
ts skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-433/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-2/igt@kms_frontbuffer_tr=
acking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 ot=
her test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-i=
ndfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
6">Intel XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_t=
racking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2312">Intel XE#2312</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tr=
acking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
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
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-463/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-8/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cu=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-1/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-466/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-436/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-3/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-6/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2313">Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12848/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sh=
ard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@kms_hdr@invalid=
-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
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
W_12848/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
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
xe/IGTPW_12848/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848=
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
el/issues/1500">Intel XE#1500</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_tiled_display@basic-t=
est-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12848/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12848/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel=
 XE#899</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel X=
E#756</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12848/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464=
/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/326">Intel XE#326</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) =
+3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-user=
ptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-432/igt@xe_exec_basic@multig=
pu-once-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-434/igt@xe_exec_basic@=
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
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12848/sh=
ard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12848/shard-dg2-464/igt@xe_peer2peer@read=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8288 -&gt; IGTPW_12848</li>
</ul>
<p>IGTPW_12848: 12848<br />
  IGT_8288: 8288<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============9164047201909998242==--
