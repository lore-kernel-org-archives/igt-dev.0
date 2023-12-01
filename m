Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02DD10E0EE
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 11:51:45 +0000 (UTC)
Message-ID: <5c0145ed-b5ba-4a93-95e7-b0d63cdf216e@intel.com>
Date: Fri, 1 Dec 2023 17:21:43 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
 <20231128061533.2612350-3-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231128061533.2612350-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 3/3] tests/intel-ci/xe: Add unsupported tests
 to XE blocklist
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

On 28-Nov-23 11:45 AM, Bhanuprakash Modem wrote:
> Add i915 specific tests to XE blocklist.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 71946a50f..1dfbf6825 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -52,9 +52,12 @@ igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
>   ##################################################################
>   # KMS: Tests specific to i915 driver
>   ##################################################################
> +igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
> +igt@kms_addfb_basic@basic-y-tiled-legacy
>   igt@kms_addfb_basic@bo-too-small-due-to-tiling
>   igt@kms_addfb_basic@clobberred-modifier
>   igt@kms_addfb_basic@.*framebuffer-vs-set-tiling
> +igt@kms_addfb_basic@tile-pitch-mismatch
>   igt@kms_busy@.*
>   igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
>   igt@kms_fence_pin_leak
