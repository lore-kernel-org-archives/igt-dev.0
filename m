Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AD810E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:45:10 +0000 (UTC)
Message-ID: <594f0cf9-e03b-0acf-48a5-8f61c02e6f96@intel.com>
Date: Mon, 12 Jun 2023 11:14:49 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230609101205.2803975-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] RFC Enable kms_frontbuffer_tracking
 on XE
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

Hi Kunal,

Apart from the minor comments, this series looks good to me.
As pre-merge IGT testing is not enabled for XE, please try to have one 
round of local execution. Also, make sure it not breaking the i915 testing.

- Bhanu

On Fri-09-06-2023 03:42 pm, Kunal Joshi wrote:
> This series is intended to extend kms_frontbuffer_tracking
> test to be supported on xe driver
> 
> Kunal Joshi (5):
>    RFC tests/i915/kms_frontbuffer_tracking: Add xe support
>    RFC tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as
>      of now
>    tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported
>      for xe as of now
>    RFC lib/ioctl_wrappers: GEM_SET_DOMAIN ioctl not supported on xe
>    RFC tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC,
>      BLT, RENDER
> 
>   tests/i915/kms_frontbuffer_tracking.c | 84 +++++++++++++++++++--------
>   1 file changed, 61 insertions(+), 23 deletions(-)
> 
