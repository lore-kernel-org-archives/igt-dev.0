Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AB610E092
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 12:15:05 +0000 (UTC)
Date: Thu, 18 May 2023 14:15:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230518121501.cawh6uqlrgrb6gpx@kamilkon-desk1>
References: <20230518112858.246095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230518112858.246095-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/intel-ci: Add display blacklist for XE
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

Hi Bhanuprakash,

On 2023-05-18 at 16:58:58 +0530, Bhanuprakash Modem wrote:
> Add display blacklist for XE, until we complete the testplan
--------------- ^
Lets start using blocklist word, here and in following.

> documentation.
> 
> This will unblock the CI to enable the XE full run, once testplan
> documentation changes got landed, we can revert this patch.
------------------------------------------ ^^^^^^

Btw this should stay longer as we do not have pipes E...H, so
change commit description or write two patches.

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/meson.build      |  1 +
>  tests/intel-ci/xe.blacklist.txt | 37 +++++++++++++++++++++++++++++++++
---------------------- ^
xe.blocklist.txt

Regards,
Kamil

>  2 files changed, 38 insertions(+)
>  create mode 100644 tests/intel-ci/xe.blacklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index bbbd55700..b16765172 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -6,6 +6,7 @@ intelci_files = [
>    'blacklist.txt',
>    'blacklist-pre-merge.txt',
>    'xe-fast-feedback.testlist',
> +  'xe.blacklist.txt',
>  ]
>  
>  install_data(sources : intelci_files, install_dir : datadir)
> diff --git a/tests/intel-ci/xe.blacklist.txt b/tests/intel-ci/xe.blacklist.txt
> new file mode 100644
> index 000000000..4285881be
> --- /dev/null
> +++ b/tests/intel-ci/xe.blacklist.txt
> @@ -0,0 +1,37 @@
> +##################################################################
> +#Pipe E, F, G and H
> +##################################################################
> +igt@.*@.*pipe-(e|f|g|h).*
> +##################################################################
> +# Multidisplay
> +##################################################################
> +igt@kms_bw@.*-(5|6|7|8)-displays-.*
> +##################################################################
> +igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
> +igt@kms_draw_crc@fill-fb
> +igt@kms_pipe_b_c_ivb@.*
> +igt@kms_pwrite_crc
> +igt@kms_ccs@.*
> +igt@kms_frontbuffer_tracking@.*
> +igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
> +igt@kms_fence_pin_leak
> +igt@kms_busy@.*
> +igt@kms_psr@.*_mmap_(cpu|gtt)
> +igt@kms_legacy_colorkey@basic
> +igt@kms_legacy_colorkey@invalid-plane
> +igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf)tile-.*
> +igt@kms_big_fb@(4|x|y|yf)-tiled-.*
> +igt@kms_flip@2x-flip-vs-fences
> +igt@kms_flip@flip-vs-fences(-interruptible)
> +igt@kms_addfb_basic@clobberred-modifier
> +igt@kms_addfb_basic@.*-tiling
> +igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
> +igt@kms_async_flips@.*
> +igt@kms_plane_multiple@tiling-(4|x|y|yf)
> +igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
> +igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
> +igt@kms_rotation_crc@exhaust-fences
> +igt@kms_force_connector_basic@force-load-detect
> +igt@kms_getfb@.*-ccs
> +igt@kms_plane_lowres@tiling-(4|x|y|yf)
> +##################################################################
> -- 
> 2.40.0
> 
