Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4054D10E0E4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 16:04:32 +0000 (UTC)
Date: Tue, 23 May 2023 18:04:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230523160420.rr7m7lha7vx7wktw@kamilkon-desk1>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
 <20230523063243.669540-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230523063243.669540-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V3 01/82] tests/chamelium: Move chamelium
 helpers to lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-05-23 at 12:01:22 +0530, Bhanuprakash Modem wrote:
> The correct place for helpers is lib as the tests directory is
> supposed to have test files, also having the helpers in tests
> dir will break the compilation of testplan. Hence move all
> helpers to library.
> 
> Expectation is to have an executable binary for each .c file
> the "tests" dir.

When moving into library you should at least document public
functions, maybe as a separate later patch. Please also send
cc to developers, here +cc Mark.

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  .../kms_chamelium_helper.c => lib/igt_chamelium_helper.c      | 4 ++--
>  .../kms_chamelium_helper.h => lib/igt_chamelium_helper.h      | 0
------------------------------------ ^
Why not just kms_chamelium.c and .h for names in lib ?

Regards,
Kamil

>  lib/meson.build                                               | 1 +
>  tests/chamelium/kms_chamelium_audio.c                         | 2 +-
>  tests/chamelium/kms_chamelium_edid.c                          | 2 +-
>  tests/chamelium/kms_chamelium_frames.c                        | 2 +-
>  tests/chamelium/kms_chamelium_hpd.c                           | 2 +-
>  tests/meson.build                                             | 3 +--
>  8 files changed, 8 insertions(+), 8 deletions(-)
>  rename tests/chamelium/kms_chamelium_helper.c => lib/igt_chamelium_helper.c (99%)
>  rename tests/chamelium/kms_chamelium_helper.h => lib/igt_chamelium_helper.h (100%)
> 
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/lib/igt_chamelium_helper.c
> similarity index 99%
> rename from tests/chamelium/kms_chamelium_helper.c
> rename to lib/igt_chamelium_helper.c
> index 197d29be9..3c1a802d3 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/lib/igt_chamelium_helper.c
> @@ -25,7 +25,7 @@
>   */
>  
>  #include "igt_edid.h"
> -#include "kms_chamelium_helper.h"
> +#include "igt_chamelium_helper.h"
>  
>  void chamelium_init_test(chamelium_data_t *data)
>  {
> @@ -344,4 +344,4 @@ bool chamelium_check_analog_bridge(chamelium_data_t *data,
>  		return true;
>  
>  	return false;
> -}
> \ No newline at end of file
> +}
> diff --git a/tests/chamelium/kms_chamelium_helper.h b/lib/igt_chamelium_helper.h
> similarity index 100%
> rename from tests/chamelium/kms_chamelium_helper.h
> rename to lib/igt_chamelium_helper.h
> diff --git a/lib/meson.build b/lib/meson.build
> index 85f100f75..2d3456577 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -17,6 +17,7 @@ lib_sources = [
>  	'i915/intel_cmds_info.c',
>  	'i915/i915_blt.c',
>  	'i915/i915_crc.c',
> +	'igt_chamelium_helper.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
>  	'igt_crc.c',
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index 6c6177fc5..a4204fbb6 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -26,7 +26,7 @@
>  
>  #include "igt_eld.h"
>  #include "igt_infoframe.h"
> -#include "kms_chamelium_helper.h"
> +#include "igt_chamelium_helper.h"
>  
>  /* Playback parameters control the audio signal we synthesize and send */
>  #define PLAYBACK_CHANNELS 2
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 4a52e6922..fc78d4a07 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -42,7 +42,7 @@
>  #include "igt_eld.h"
>  #include "igt_vc4.h"
>  #include "igt_infoframe.h"
> -#include "kms_chamelium_helper.h"
> +#include "igt_chamelium_helper.h"
>  #include "monitor_edids/dp_edids.h"
>  #include "monitor_edids/hdmi_edids.h"
>  #include "monitor_edids/monitor_edids_helper.h"
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index 22a7ba936..2d90b45b2 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -31,7 +31,7 @@
>  
>  #include "igt_eld.h"
>  #include "igt_infoframe.h"
> -#include "kms_chamelium_helper.h"
> +#include "igt_chamelium_helper.h"
>  
>  #define connector_dynamic_subtest(name__, type__)                   \
>  	igt_subtest_with_dynamic(name__)                            \
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index efd40ba54..ea0ee10e7 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -29,7 +29,7 @@
>   * Category: Display
>   */
>  
> -#include "kms_chamelium_helper.h"
> +#include "igt_chamelium_helper.h"
>  
>  #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
>  #define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
> diff --git a/tests/meson.build b/tests/meson.build
> index f71be1dbe..5d2c573d5 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -343,8 +343,7 @@ endforeach
>  if chamelium.found()
>  	foreach prog : chamelium_progs
>  		test_executables += executable(prog,
> -				 [join_paths('chamelium', prog + '.c'),
> -					join_paths('chamelium', 'kms_chamelium_helper.c')],
> +				 join_paths('chamelium', prog + '.c'),
>  				 dependencies : test_deps,
>  				 install_dir : libexecdir,
>  				 install_rpath : libexecdir_rpathdir,
> -- 
> 2.40.0
> 

