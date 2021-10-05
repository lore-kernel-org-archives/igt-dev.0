Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757036EB50
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:09:27 +0000 (UTC)
Message-ID: <d79c7839-b26e-2c44-c6bf-69be050be2c0@intel.com>
Date: Tue, 5 Oct 2021 15:39:16 +0530
Content-Language: en-US
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tests/kms_invalid_dotclock: Rename
 to kms_invalid_mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/16/2021 9:05 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Let's add some more tests for invalid modes. To that end rename
> the current kms_invalid_dotclock to kms_invalid_mode so we a

Hi,

Typo? so we a -> so we (have) a?

With this updated, looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> place where to put these.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/i915/{kms_invalid_dotclock.c => kms_invalid_mode.c} | 2 +-
>   tests/meson.build                                         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/i915/{kms_invalid_dotclock.c => kms_invalid_mode.c} (99%)
>
> diff --git a/tests/i915/kms_invalid_dotclock.c b/tests/i915/kms_invalid_mode.c
> similarity index 99%
> rename from tests/i915/kms_invalid_dotclock.c
> rename to tests/i915/kms_invalid_mode.c
> index 95136d366dd7..dc30e6bb5444 100644
> --- a/tests/i915/kms_invalid_dotclock.c
> +++ b/tests/i915/kms_invalid_mode.c
> @@ -25,7 +25,7 @@
>   #include "igt.h"
>   #include <stdbool.h>
>   
> -IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested dotclock is too high");
> +IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
>   
>   typedef struct {
>   	int drm_fd;
> diff --git a/tests/meson.build b/tests/meson.build
> index 8ad52596a491..3e3090e5d8b4 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -228,7 +228,7 @@ i915_progs = [
>   	'kms_flip_scaled_crc',
>   	'kms_flip_tiling',
>   	'kms_frontbuffer_tracking',
> -	'kms_invalid_dotclock',
> +	'kms_invalid_mode',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',

