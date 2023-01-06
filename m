Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450FE10E89A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jan 2023 17:17:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1544125wms.2
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Jan 2023 09:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20230103171515.740994-1-markyacoub@chromium.org>
 <167283401768.24956.14482256382491390778@emeril.freedesktop.org>
In-Reply-To: <167283401768.24956.14482256382491390778@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 6 Jan 2023 12:16:49 -0500
Message-ID: <CAJUqKUo=1FZ6CrqAwbV4h3pXL5eMzeiCWYbcHX8SQL26yqFqrw@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="000000000000e541a005f19b95a1"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Split_kms=5Fchamelium_into_multiple_kms=5Fchameli?=
	=?utf-8?q?um_tests_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000e541a005f19b95a1
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, can I get a rerun on this. Thank you!

On Wed, Jan 4, 2023 at 7:06 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Split kms_chamelium into multiple kms_chamelium
> tests (rev6)
> *URL:* https://patchwork.freedesktop.org/series/111501/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/index.html CI
> Bug Log - changes from CI_DRM_12541 -> IGTPW_8297 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8297 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8297, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/index.html
> Participating hosts (42 -> 42)
>
> Additional (1): fi-rkl-11600
> Missing (1): bat-dg2-oem1
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8297:
> IGT changes Possible regressions
>
>    -
>
>    igt@debugfs_test@read_all_entries:
>    - fi-icl-u2: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-icl-u2/igt@debugfs_test@read_all_entries.html>
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-icl-u2/igt@debugfs_test@read_all_entries.html>
>    -
>
>    {igt@kms_chamelium_edid@dp-edid-read} (NEW):
>    -
>
>       {fi-jsl-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html>
>       +8 similar issues
>       -
>
>       {bat-rpls-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html>
>       +7 similar issues
>       -
>
>    {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
>    -
>
>       fi-adl-ddr5: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       +8 similar issues
>       -
>
>       {fi-ehl-2}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       +8 similar issues
>       -
>
>       {bat-rpls-2}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       +8 similar issues
>       -
>
>       bat-dg1-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
>    - {bat-adln-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       +8 similar issues
>    -
>
>    {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
>    - {bat-adlp-9}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>       +8 similar issues
>    -
>
>    {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
>    -
>
>       fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>       +7 similar issues
>       -
>
>       bat-dg1-5: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>       +8 similar issues
>       -
>
>       {bat-dg1-7}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>       +8 similar issues
>       -
>
>       {bat-dg2-9}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
>    - {bat-adlp-6}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>       +8 similar issues
>    -
>
>    {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
>    -
>
>       {bat-jsl-3}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>       -
>
>       fi-rkl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>       -
>
>       {bat-dg2-11}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>       -
>
>       bat-adlp-4: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>       -
>
>       {bat-dg2-8}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>       -
>
>       {bat-adlm-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +8 similar issues
>
> New tests
>
> New tests have been introduced between CI_DRM_12541 and IGTPW_8297:
> New IGT tests (9)
>
>    -
>
>    igt@kms_chamelium_edid@dp-edid-read:
>    - Statuses : 41 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_edid@hdmi-edid-read:
>    - Statuses : 1 pass(s) 40 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_edid@vga-edid-read:
>    - Statuses : 41 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_frames@dp-crc-fast:
>    - Statuses : 41 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_frames@hdmi-crc-fast:
>    - Statuses : 1 pass(s) 40 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_hpd@common-hpd-after-suspend:
>    - Statuses : 1 pass(s) 36 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_hpd@dp-hpd-fast:
>    - Statuses : 41 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_hpd@hdmi-hpd-fast:
>    - Statuses : 1 pass(s) 40 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium_hpd@vga-hpd-fast:
>    - Statuses : 41 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8297 that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@debugfs_test@basic-hwmon:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html>
>       (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html>
>       (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@basic:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_lmem_swapping@basic.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +3 similar issues
>    -
>
>    igt@gem_tiled_pread_basic:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_tiled_pread_basic.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>    -
>
>    igt@i915_pm_backlight@basic-brightness:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html>
>       (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
>    -
>
>    igt@i915_selftest@live@gt_heartbeat:
>    - fi-apl-guc: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html>
>       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>    -
>
>    igt@i915_suspend@basic-s3-without-i915:
>    - fi-rkl-11600: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html>
>       (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817>)
>    -
>
>    {igt@kms_chamelium_edid@dp-edid-read} (NEW):
>    -
>
>       fi-bsw-n3050: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-bwr-2160: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-pnv-d510/igt@kms_chamelium_edid@dp-edid-read.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_edid@hdmi-edid-read} (NEW):
>    -
>
>       fi-cfl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-skl-6600u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_frames@dp-crc-fast} (NEW):
>    - fi-ilk-650: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>    -
>
>    {igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):
>    -
>
>       fi-cfl-8109u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-kbl-7567u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-kbl-8809g: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +7 similar issues
>       -
>
>    {igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):
>    -
>
>       fi-glk-j4005: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-snb-2600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):
>    - fi-skl-6700k2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +4 similar issues
>    -
>
>    {igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):
>    -
>
>       fi-cfl-8700k: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-blb-e6850: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       {bat-kbl-2}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>    {igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):
>    -
>
>       fi-apl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-bsw-kefka: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       {bat-atsm-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (i915#6078 <https://gitlab.freedesktop.org/drm/intel/issues/6078>)
>       +7 similar issues
>       -
>
>       fi-skl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-ivb-3770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-elk-e7500: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>       fi-bsw-nick: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +8 similar issues
>       -
>
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>       (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>    -
>
>    igt@kms_force_connector_basic@force-load-detect:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html>
>       (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>    -
>
>    igt@kms_psr@primary_page_flip:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_psr@primary_page_flip.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       +3 similar issues
>    -
>
>    igt@kms_setmode@basic-clone-single-crtc:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>    -
>
>    igt@prime_vgem@basic-read:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@prime_vgem@basic-read.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>       i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> /
>       i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>       +2 similar issues
>    -
>
>    igt@prime_vgem@basic-userptr:
>    - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@prime_vgem@basic-userptr.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>       i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301> /
>       i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>    -
>
>    igt@runner@aborted:
>    - fi-icl-u2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/fi-icl-u2/igt@runner@aborted.html>
>       (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> Possible fixes
>
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - bat-dg1-6: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>    -
>
>    igt@i915_selftest@live@migrate:
>    - {bat-atsm-1}: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-atsm-1/igt@i915_selftest@live@migrate.html>
>       (i915#7699 <https://gitlab.freedesktop.org/drm/intel/issues/7699>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-atsm-1/igt@i915_selftest@live@migrate.html>
>    -
>
>    igt@i915_selftest@live@slpc:
>    - bat-adlp-4: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-4/igt@i915_selftest@live@slpc.html>
>       (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-4/igt@i915_selftest@live@slpc.html>
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
>    - {bat-adlp-9}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12541/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html>
>       (i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html>
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7106 -> IGTPW_8297
>
> CI-20190529: 20190529
> CI_DRM_12541: b832866fa6063614b3637598aca19aee3bc3039f @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8297: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/index.html
> IGT_7106: 8cce332bdc50d2b20d553d7a0221737f4399d031 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> Testlist changes
>
> +++ 71 lines
> --- 73 lines
>

--000000000000e541a005f19b95a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Lakshminarayana, can I get a rerun on this. Thank =
you!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jan 4, 2023 at 7:06 AM Patchwork &lt;<a href=3D"mailto:patchwor=
k@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg=
-6298872193405745550">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Split kms_chamelium into m=
ultiple kms_chamelium tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/111501/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
1501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8297/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12541 -&gt; IGTPW_8297</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8297 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8297, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8297/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8297/index.html</a></p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (1): fi-rkl-11600 <br>
  Missing    (1): bat-dg2-oem1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8297=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-icl-u2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/fi-icl-u2/igt@debugfs_test@read_all_entries.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8297/fi-icl-u2/igt@debugfs_test@read_all_entries.html" target=3D"_blan=
k">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html" =
target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-rpls-1/igt@kms_chamelium_edid@dp-edid-read.html=
" target=3D"_blank">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-adl-ddr5/igt@kms_chamelium_edid@hdmi-edid-read.h=
tml" target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-ehl-2/igt@kms_chamelium_edid@hdmi-edid-read.html=
" target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-rpls-2/igt@kms_chamelium_edid@hdmi-edid-read.ht=
ml" target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg1-6/igt@kms_chamelium_edid@hdmi-edid-read.htm=
l" target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/bat-adln-1/igt@kms_chamelium_frames@hdmi-crc-fast.=
html" target=3D"_blank">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>{bat-adlp-9}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-=
suspend.html" target=3D"_blank">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_chamelium_hpd@dp-hpd-fast.html=
" target=3D"_blank">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg1-5/igt@kms_chamelium_hpd@dp-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg1-7/igt@kms_chamelium_hpd@dp-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg2-9/igt@kms_chamelium_hpd@dp-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/bat-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.htm=
l" target=3D"_blank">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-jsl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html" =
target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-rkl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-adlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html" =
target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-adlm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12541 and IGTPW_8297:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>Statuses : 1 pass(s) 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>Statuses : 1 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>Statuses : 41 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8297 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/7456" target=3D"_blank">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2190" target=3D"_blank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_lmem_swapping@basic.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613" target=3D"_blank">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@gem_tiled_pread_basic.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3282" target=3D"_blank">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@i915_pm_backlight@basic-brightnes=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/7561" target=3D"_blank">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8297/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html" target=
=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5334" target=3D"_blank">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i91=
5.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4817" target=3D"_blank">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@dp-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-bsw-n3050/igt@kms_chamelium_edid@dp-edid-read.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues<=
/p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-bwr-2160/igt@kms_chamelium_edid@dp-edid-read.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</=
p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-pnv-d510/igt@kms_chamelium_edid@dp-edid-read.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</=
p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_edid@hdmi-edid-read} (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-cfl-guc/igt@kms_chamelium_edid@hdmi-edid-read.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues<=
/p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-skl-6600u/igt@kms_chamelium_edid@hdmi-edid-read.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issue=
s</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@dp-crc-fast} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-ilk-650/igt@kms_chamelium_frames@dp-crc-fast.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues<=
/li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_frames@hdmi-crc-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issu=
es</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issu=
es</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-kbl-8809g/igt@kms_chamelium_frames@hdmi-crc-fast=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +7 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@common-hpd-after-suspend} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-glk-j4005/igt@kms_chamelium_hpd@common-hpd-after=
-suspend.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 simi=
lar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-snb-2600/igt@kms_chamelium_hpd@common-hpd-after-=
suspend.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 simil=
ar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@dp-hpd-fast} (NEW):</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-skl-6700k2/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-cfl-8700k/igt@kms_chamelium_hpd@hdmi-hpd-fast.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues<=
/p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-blb-e6850/igt@kms_chamelium_hpd@hdmi-hpd-fast.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues<=
/p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-kbl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-apl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-bsw-kefka/igt@kms_chamelium_hpd@vga-hpd-fast.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</=
p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/bat-atsm-1/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6078" target=3D"_blank">i915#6078</a>) +7 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-skl-guc/igt@kms_chamelium_hpd@vga-hpd-fast.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-ivb-3770/igt@kms_chamelium_hpd@vga-hpd-fast.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</p=
>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-elk-e7500/igt@kms_chamelium_hpd@vga-hpd-fast.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</=
p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8297/fi-bsw-nick/igt@kms_chamelium_hpd@vga-hpd-fast.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +8 similar issues</p=
>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4103" target=3D"_blank">i915#4103</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_force_connector_basic@force-l=
oad-detect.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109285" target=3D"_blank">fdo#109285</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_bla=
nk">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_psr@primary_page_flip.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1072" target=3D"_blank">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@kms_setmode@basic-clone-single-cr=
tc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4=
098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@prime_vgem@basic-read.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109295" target=3D"_blank">fdo#109295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3291" target=3D"_blank">i915#3291</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708" target=3D"_b=
lank">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-rkl-11600/igt@prime_vgem@basic-userptr.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109295" target=3D"_blank">fdo#109295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3301" target=3D"_blank">i915#3301</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708" target=3D=
"_blank">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8297/fi-icl-u2/igt@runner@aborted.html" target=3D"_blan=
k">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/431=
2" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/bat-dg1-6/igt@i915_selftest@live@hangcheck.html" target=3D"_b=
lank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8297/bat-dg1-6/igt@i915_selftest@live@hangcheck.html" target=3D"_=
blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-atsm-1}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/bat-atsm-1/igt@i915_selftest@live@migrate.html" target=3D"_bl=
ank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7699" target=3D"_blank">i915#7699</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-atsm-1/igt@i915_selftest@live@mig=
rate.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-adlp-4:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/bat-adlp-4/igt@i915_selftest@live@slpc.html" target=3D"_blank=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6367" target=3D"_blank">i915#6367</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-4/igt@i915_selftest@live@slpc.h=
tml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>{bat-adlp-9}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12541/bat-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-=
1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2867" target=3D"_blank">i915#2867</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8297/bat-adlp-9/igt@k=
ms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html" target=3D"_blank">PASS=
</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7106 -&gt; IGTPW_8297</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12541: b832866fa6063614b3637598aca19aee3bc3039f @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8297: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_829=
7/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8297/index.html</a><br>
  IGT_7106: 8cce332bdc50d2b20d553d7a0221737f4399d031 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
<h2>Testlist changes</h2>
<p>+++ 71 lines<br>
--- 73 lines</p>

</div>

</div></blockquote></div>

--000000000000e541a005f19b95a1--
