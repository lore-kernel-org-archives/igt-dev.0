Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDEC10E762
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 10:38:03 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/2] add new test for dark screen detection
In-Reply-To: <20231213103442.2599632-1-kunal1.joshi@intel.com>
References: <20231213103442.2599632-1-kunal1.joshi@intel.com>
Date: Wed, 13 Dec 2023 12:37:59 +0200
Message-ID: <87bkauwfp4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 13 Dec 2023, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> dark screen detection feature when enable will monitor frames
> and if black frame is detcted it will raise drm_error, added
> two tests for positive (black frame) and negative case (white frame)

Please settle on either "darkscreen" or "dark_screen" throughout the
kernel and igt, and stick to it. Either one is fine, but please don't
mix.

And please figure out the design [1].

BR,
Jani.


[1] https://lore.kernel.org/r/87sf46whjj.fsf@intel.com


>
> Kunal Joshi (2):
>   lib/igt_debugfs: added helper to enable/disable dark screen detection
>   tests/intel/kms_dark_screen_detection: Added IGT for validating dark
>     screen detection
>
>  lib/igt_debugfs.c                      |  39 +++++
>  lib/igt_debugfs.h                      |   2 +
>  tests/intel/kms_darkscreen_detection.c | 196 +++++++++++++++++++++++++
>  tests/meson.build                      |   1 +
>  4 files changed, 238 insertions(+)
>  create mode 100644 tests/intel/kms_darkscreen_detection.c

-- 
Jani Nikula, Intel
