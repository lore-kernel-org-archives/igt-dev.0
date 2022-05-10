Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8D10E430
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 10:53:54 +0000 (UTC)
Message-ID: <46136c3b-a335-4166-5db7-39701c9cf1ad@intel.com>
Date: Tue, 10 May 2022 16:23:49 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V2 0/5] Add support for connector & crtc debugfs
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

Series look good to me.
Few kms_hdr tests are failing on HDMI due to the downgrading of BPC to 
min (8-bpc).
ex. on GLK 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102502v5/index.html?testfilter=kms_hdr
which looks like driver issue and should be fixed from driver side.

@ville any inputs here?

Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 11-Apr-22 3:11 PM, Bhanuprakash Modem wrote:
> Add helper functions to read debugfs & update the subtests
> to use newly added helper functions:
>      - Read maximum bpc from connector debugfs
>      - Read Current bpc from crtc debugfs
>      - Compare/Assert if Current & Requested bpc are not equal
> 
> Bhanuprakash Modem (5):
>    lib/igt_kms: Add helper functions to read few debugfs
>    tests/kms_color: Use debugfs apis for deep-color
>    tests/kms_hdr: Adopt to use updated debugfs functions
>    tests/kms_dither: Adopt to use updated debugfs functions
>    tests/amdgpu: Adopt to use updated debugfs functions
> 
>   lib/igt_kms.c              | 110 +++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h              |   7 +++
>   tests/amdgpu/amd_dp_dsc.c  |  56 +------------------
>   tests/amdgpu/amd_max_bpc.c |  47 +---------------
>   tests/kms_color.c          |   9 ++-
>   tests/kms_color_helper.c   |  46 ++--------------
>   tests/kms_color_helper.h   |   2 +-
>   tests/kms_dither.c         |  11 ++--
>   tests/kms_hdr.c            |  69 +++--------------------
>   9 files changed, 151 insertions(+), 206 deletions(-)
> 
> --
> 2.35.1
> 

-- 
~Swati Sharma
