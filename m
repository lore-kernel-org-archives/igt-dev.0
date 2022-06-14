Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D5110FA6F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 03:58:21 +0000 (UTC)
Message-ID: <535037d9-b5d1-bd99-f4a5-683a969c6f11@intel.com>
Date: Tue, 14 Jun 2022 09:27:55 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220610091153.4089928-1-bhanuprakash.modem@intel.com>
 <165514870706.9736.4782922417933593348@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165514870706.9736.4782922417933593348@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_IGT_test_cleanup_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue-14-06-2022 01:01 am, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_pipe_crc_basic: IGT test cleanup (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/104916/ 
> <https://patchwork.freedesktop.org/series/104916/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11755 -> IGTPW_7289
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7289 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7289, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/index.html
> 
> 
>     Participating hosts (44 -> 39)
> 
> Missing (5): fi-cml-u2 fi-bxt-dsi bat-adlm-1 bat-dg2-9 bat-adlp-4
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7289:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc:
>       o bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         +5 similar issues

These skips are expected as this patch converts existing tests to 
Dynamic. Please help to re-report.

- Bhanu

> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_11755 and IGTPW_7289:
> 
> 
>       New IGT tests (170)
> 
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.43] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.34, 0.72] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [0.51, 2.84] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.32, 0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.35, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.26, 0.37] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.35] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.27, 0.36] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.83, 1.03] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.30, 2.42] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.28, 0.37] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.28, 0.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.90] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.26, 0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.41] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.81, 1.02] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [1.26, 2.43] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.28, 0.35] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.28, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.26, 0.29] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.06] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.40, 2.42] s
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.30, 0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc:
> 
>       o Statuses : 6 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.03] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.45, 2.10] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.96, 5.36] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.79, 1.11] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.91, 1.36] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.84] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.71, 1.16] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.92] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.75, 0.91] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.87, 2.33] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [2.73, 5.05] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.75, 1.00] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.73, 1.35] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.39] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.71, 1.24] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.01] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.88, 2.35] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [2.69, 4.99] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.75, 0.98] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.74, 1.29] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.71, 0.76] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.39] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [2.96, 4.98] s
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.88, 1.16] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.60] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.53, 0.88] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [0.62, 2.95] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.48, 0.61] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.53, 0.74] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.43, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.44, 0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.00, 1.16] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.43, 2.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.44, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.43, 0.71] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.23] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.42, 0.61] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.57] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.00, 1.17] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [1.40, 2.57] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.44, 0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.43, 0.72] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.42, 0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.20] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.53, 2.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.46, 0.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.58] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.54, 0.88] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [0.63, 2.94] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.48, 0.61] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.54, 0.72] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.43, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.44, 0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.00, 1.14] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.42, 2.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.44, 0.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.44, 0.72] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.31] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.42, 0.62] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.00, 1.13] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [1.40, 2.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.44, 0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.43, 0.68] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.42, 0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.14] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.52, 2.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.46, 0.56] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.47, 0.82] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [0.59, 2.84] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.41, 0.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.47, 0.67] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.62] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.37, 0.52] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.37, 0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.94, 1.11] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.37, 2.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.37, 0.49] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.36, 0.64] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.15] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.36, 0.57] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.93, 1.10] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [1.35, 2.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.37, 0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.36, 0.62] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.36, 0.37] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.12] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.46, 2.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.39, 0.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.47, 0.81] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [0.58, 2.86] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [0.41, 0.54] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.46, 0.68] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.61] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.37, 0.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.37, 0.45] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.94, 1.12] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
> 
>       o Statuses : 9 pass(s)
>       o Exec time: [1.38, 2.49] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [0.37, 0.47] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.36, 0.69] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.16] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [0.36, 0.55] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.51] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.94, 1.10] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
> 
>       o Statuses : 8 pass(s)
>       o Exec time: [1.33, 2.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.37, 0.44] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-2:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [0.36, 0.64] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-c-vga-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [0.36, 0.40] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.15] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.47, 2.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [0.40, 0.49] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o Statuses : 4 skip(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.98] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [5.24, 5.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [2.74, 6.88] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [2.08, 3.63] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [2.09, 4.28] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.03] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
> 
>       o Statuses : 4 pass(s)
>       o Exec time: [1.75, 2.28] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.23] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [2.00, 2.87] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [5.01, 5.15] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
> 
>       o Statuses : 7 pass(s)
>       o Exec time: [3.52, 14.16] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
> 
>       o Statuses : 5 pass(s)
>       o Exec time: [1.70, 11.70] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [2.01, 4.28] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.46] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.04] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.84] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dsi-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [5.32, 5.50] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
> 
>       o Statuses : 6 pass(s)
>       o Exec time: [3.48, 5.25] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [1.99, 11.84] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
> 
>       o Statuses : 3 pass(s)
>       o Exec time: [1.98, 4.20] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
> 
>       o Statuses : 2 pass(s)
>       o Exec time: [1.73, 2.04] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dsi-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.49] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-edp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.73] s
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.00] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7289 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-bdw-5557u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bdw-5557u/igt@i915_selftest@live@gt_heartbeat.html>
>         (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o
> 
>         fi-hsw-4770: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
> 
>       o
> 
>         fi-bdw-5557u: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921 <https://gitlab.freedesktop.org/drm/intel/issues/3921>)
> 
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
> 
>       o fi-tgl-u2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html>
>         (i915#402 <https://gitlab.freedesktop.org/drm/intel/issues/402>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o fi-kbl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
> 
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +6
>         similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc:
> 
>       o
> 
>         fi-kbl-7567u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +6
>         similar issues
> 
>       o
> 
>         fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-kbl-8809g/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +6
>         similar issues
> 
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> 
>       o
> 
>         fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +6
>         similar issues
> 
>       o
> 
>         fi-bdw-gvtdvm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bdw-gvtdvm/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +5
>         similar issues
> 
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-hsw-4770/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
> 
>       o
> 
>         fi-cfl-8700k: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-cfl-8700k/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {fi-ehl-2}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>         (i915#5122
>         <https://gitlab.freedesktop.org/drm/intel/issues/5122>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o fi-cfl-8109u: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>   *
> 
>     igt@i915_selftest@live@gem_contexts:
> 
>       o fi-bdw-5557u: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html>
>         (i915#5502
>         <https://gitlab.freedesktop.org/drm/intel/issues/5502>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-bdw-5557u/igt@i915_selftest@live@gem_contexts.html>
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o {fi-jsl-1}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html>
>         (i915#5334
>         <https://gitlab.freedesktop.org/drm/intel/issues/5334>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o bat-dg1-6: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957
>         <https://gitlab.freedesktop.org/drm/intel/issues/4957>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@i915_selftest@live@late_gt_pm:
> 
>       o fi-cfl-8109u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         +29 similar issues
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o fi-cfl-8109u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904> / i915#62
>         <https://gitlab.freedesktop.org/drm/intel/issues/62>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>   *
> 
>     igt@kms_flip@basic-flip-vs-modeset@b-edp1:
> 
>       o {bat-adlp-6}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         +2 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o fi-cfl-8109u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         +5 similar issues
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6522 -> IGTPW_7289
> 
> CI-20190529: 20190529
> CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7289: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7289/index.html
> IGT_6522: 5be5a1a1f168a59614101b77385f05f12ec7d30a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck
> +igt@kms_pipe_crc_basic@disable-crc-after-crtc
> +igt@kms_pipe_crc_basic@hang-read-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> +igt@kms_pipe_crc_basic@read-crc
> +igt@kms_pipe_crc_basic@read-crc-frame-sequence
> +igt@kms_pipe_crc_basic@suspend-read-crc
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-e
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-f
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-b
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-c
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-d
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-e
> -igt@kms_pipe_crc_basic@hang-read-crc-pipe-f
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-c-frame-sequence
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e-frame-sequence
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f
> -igt@kms_pipe_crc_basic@nonblocking-crc-pipe-f-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-a
> -igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-b
> -igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-c
> -igt@kms_pipe_crc_basic@read-crc-pipe-c-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-d
> -igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-e
> -igt@kms_pipe_crc_basic@read-crc-pipe-e-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc-pipe-f
> -igt@kms_pipe_crc_basic@read-crc-pipe-f-frame-sequence
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-e
> -igt@kms_pipe_crc_basic@suspend-read-crc-pipe-f
> 
