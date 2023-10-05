Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63C210E3ED
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 13:48:58 +0000 (UTC)
Message-ID: <ae35734e-36c6-43c8-888e-9509c489b1fa@intel.com>
Date: Thu, 5 Oct 2023 19:18:51 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231005125948.2986826-1-bhanuprakash.modem@intel.com>
 <20231005125948.2986826-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231005125948.2986826-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2 1/2] intel-ci/xe: Update kms blocklist
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>


On 05-Oct-23 6:29 PM, Bhanuprakash Modem wrote:
> Add justification to kms blocklist.
> 
> V2: - Add justification for multidisplay blocklist
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index e73018ec6..f4a57aa01 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -44,20 +44,18 @@ igt@syncobj_.*
>   igt@template
>   igt@tools_test
>   ##################################################################
> -# Pipe E, F, G and H
> +# KMS: Pipe E, F, G and H are not available on Intel hardware,
> +# hence can't use more than 4 displays.
>   ##################################################################
>   igt@.*@.*pipe-(e|f|g|h).*
> -##################################################################
> -# Multidisplay
> -##################################################################
>   igt@kms_bw@.*-(5|6|7|8)-displays-.*
>   ##################################################################
> +# KMS: Tests specific to i915 driver
> +##################################################################
>   igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
>   igt@kms_pipe_b_c_ivb@.*
>   igt@kms_pwrite_crc
> -igt@kms_ccs@.*
>   igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
> -igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
>   igt@kms_fence_pin_leak
>   igt@kms_busy@.*
>   igt@kms_psr@.*_mmap_(cpu|gtt)
> @@ -69,3 +67,8 @@ igt@kms_addfb_basic@clobberred-modifier
>   igt@kms_rotation_crc@exhaust-fences
>   igt@kms_force_connector_basic@force-load-detect
>   ##################################################################
> +# KMS: Yet to add/missing XE support
> +##################################################################
> +igt@kms_ccs@.*
> +igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
> +##################################################################
