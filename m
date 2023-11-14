Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72510E1E2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:39:16 +0000 (UTC)
Message-ID: <567e83cd-8744-4370-a8ff-33c0f60ac3f8@intel.com>
Date: Tue, 14 Nov 2023 15:09:11 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
 <20231114090926.1618995-8-kunal1.joshi@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231114090926.1618995-8-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH 7/8] tests/intel-ci/fast-feedback: update
 renamed tests
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

On 14-Nov-23 2:39 PM, Kunal Joshi wrote:
> Previously since there were only two categories
> psr and psr2, there was no psr_ prefix, updated
> testlist with prefix
> 
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index c252e2cf0..aeba0ab29 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -123,10 +123,10 @@ igt@kms_pipe_crc_basic@read-crc-frame-sequence
>   igt@kms_pm_backlight@basic-brightness
>   igt@kms_pm_rpm@basic-pci-d3-state
>   igt@kms_pm_rpm@basic-rte
> -igt@kms_psr@primary_page_flip
> -igt@kms_psr@cursor_plane_move
> -igt@kms_psr@sprite_plane_onoff
> -igt@kms_psr@primary_mmap_gtt
> +igt@kms_psr@psr_primary_page_flip
> +igt@kms_psr@psr_cursor_plane_move
> +igt@kms_psr@psr_sprite_plane_onoff
> +igt@kms_psr@psr_primary_mmap_gtt
>   igt@kms_setmode@basic-clone-single-crtc
>   igt@i915_pm_rps@basic-api
>   igt@prime_self_import@basic-llseek-bad
