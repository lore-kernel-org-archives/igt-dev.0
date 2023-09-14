Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061A10E51E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 08:28:36 +0000 (UTC)
Date: Thu, 14 Sep 2023 10:28:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230914082814.cyqclw3caoijuuok@kamilkon-desk.igk.intel.com>
References: <20230913170719.2078729-1-bhanuprakash.modem@intel.com>
 <20230913170719.2078729-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913170719.2078729-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 1/2] intel-ci/xe: Update kms blocklist
 documentation
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

On 2023-09-13 at 22:37:18 +0530, Bhanuprakash Modem wrote:
> Add justification to kms blocklist.
> 

You did more than adding documentation, you also added/moved/removed
tests on blocklist so please add description what was done.

Also remove "documentation" from subject:

[i-g-t 1/2] intel-ci/xe: Update kms blocklist documentation
--------------------------------------------- ^^^^^^^^^^^^^

> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e73018ec6..48b979565 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -44,28 +44,29 @@ igt@syncobj_.*
>  igt@template
>  igt@tools_test
>  ##################################################################
> -# Pipe E, F, G and H
> +# KMS: Pipe E, F, G and H are not available on Intel hardware
>  ##################################################################
>  igt@.*@.*pipe-(e|f|g|h).*
> -##################################################################
> -# Multidisplay
> -##################################################################

Why removing this comment?

Regards,
Kamil

>  igt@kms_bw@.*-(5|6|7|8)-displays-.*
>  ##################################################################
> +# KMS: Tests specific to i915 driver
> +##################################################################
> +igt@kms_addfb_basic@clobberred-modifier
>  igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
> -igt@kms_pipe_b_c_ivb@.*
> -igt@kms_pwrite_crc
> -igt@kms_ccs@.*
> -igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
> -igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
>  igt@kms_fence_pin_leak
> -igt@kms_busy@.*
> -igt@kms_psr@.*_mmap_(cpu|gtt)
> -igt@kms_legacy_colorkey@basic
> -igt@kms_legacy_colorkey@invalid-plane
>  igt@kms_flip@2x-flip-vs-fences
>  igt@kms_flip@flip-vs-fences(-interruptible)
> -igt@kms_addfb_basic@clobberred-modifier
> -igt@kms_rotation_crc@exhaust-fences
>  igt@kms_force_connector_basic@force-load-detect
> +igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
> +igt@kms_legacy_colorkey@.*
> +igt@kms_pipe_b_c_ivb@.*
> +igt@kms_psr@.*_mmap_(cpu|gtt)
> +igt@kms_pwrite_crc
> +igt@kms_rotation_crc@exhaust-fences
> +##################################################################
> +# KMS: Yet to add/missing XE support
> +##################################################################
> +igt@kms_busy@.*
> +igt@kms_ccs@.*
> +igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
>  ##################################################################
> -- 
> 2.40.0
> 
