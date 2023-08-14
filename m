Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1FE10E10D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 06:21:49 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5236c9ff275so5306558a12.1
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Aug 2023 23:21:49 -0700 (PDT)
Message-ID: <05660ff7-f7c8-9f03-d54e-db9159619ef1@gmail.com>
Date: Mon, 14 Aug 2023 09:21:41 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 00/20] Add XE suppor for display tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Our xe display shards results would go scarlet (luckily, not running 
now). Changes on brief look appear as expected and essential. Once these 
are in we'll start to see what's all the things broken on xe display 
code and can start to fix them.

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 7.8.2023 22.54, Bhanuprakash Modem wrote:
> Add IGT support to work kms tests on XE driver.
> 
> V2: - Rebase
> V3: - Update testlist
> 
> Bhanuprakash Modem (20):
>    lib: Add tiling support for XE
>    tests/kms_cursor_edge_walk: Fix intel specific checks
>    tests/kms_getfb: Extended ccs tests to support XE
>    tests/kms_addfb_basic: Add tiling support for XE
>    tests/kms_plane: Add tiling support for XE
>    tests/kms_plane_lowres: Add tiling support for XE
>    tests/kms_plane_scaling: Add tiling support for XE
>    tests/kms_rotation_crc: Add tiling support for XE
>    tests/i915/kms_big_fb: Add tiling support for XE
>    tests/i915/kms_draw_crc: Add tiling support for XE
>    tests/i915/kms_flip_scaled_crc: Add tiling support for XE
>    tests/i915/kms_flip_tiling: Add tiling support for XE
>    tests/i915/kms_ccs: Add XE support
>    tests/i915/kms_fb_coherancy: Add XE support
>    tests/i915/kms_fbcon_fbt: Add XE support
>    tests/kms_async_flips: Add XE support
>    tests/kms_prime: Add XE support
>    tests/intel-ci: Update Xe ffb testlist & blocklist for
>      kms_frontbuffer_tracking
>    tests/intel-ci: Drop tiling tests from xe blocklist
>    HAX: Run tiling tests in XE fast-feedback
> 
>   lib/igt_draw.c                           |   5 +-
>   lib/igt_fb.c                             |   8 +-
>   lib/intel_bufops.c                       |  13 +-
>   tests/i915/kms_big_fb.c                  |  23 +-
>   tests/i915/kms_ccs.c                     |  42 +-
>   tests/i915/kms_draw_crc.c                |   4 -
>   tests/i915/kms_fb_coherency.c            |  43 +-
>   tests/i915/kms_fbcon_fbt.c               |   2 +-
>   tests/i915/kms_flip_scaled_crc.c         |   6 -
>   tests/i915/kms_flip_tiling.c             |   6 -
>   tests/intel-ci/xe-fast-feedback.testlist | 672 ++++++++++++++++-------
>   tests/intel-ci/xe.blocklist.txt          |  13 +-
>   tests/kms_addfb_basic.c                  |  17 +-
>   tests/kms_async_flips.c                  |  12 +-
>   tests/kms_cursor_edge_walk.c             |   2 +-
>   tests/kms_getfb.c                        |  10 +-
>   tests/kms_plane.c                        |   4 -
>   tests/kms_plane_lowres.c                 |   3 -
>   tests/kms_plane_scaling.c                |   4 -
>   tests/kms_prime.c                        | 260 +++++++--
>   tests/kms_rotation_crc.c                 |   8 +-
>   21 files changed, 781 insertions(+), 376 deletions(-)
> 
> --
> 2.40.0
> 
