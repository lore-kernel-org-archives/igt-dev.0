Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD13810E94C
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jan 2022 17:22:39 +0000 (UTC)
Message-ID: <592a7a22-2381-1bbe-bcdf-d94862e4363a@intel.com>
Date: Fri, 7 Jan 2022 17:22:30 +0000
MIME-Version: 1.0
Content-Language: en-GB
References: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_userptr_blits: Skip sd-probe
 test for discrete platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 07/01/2022 17:10, Gwan-gyeong Mun wrote:
> The DRM_IOCTL_I915_GEM_SET_DOMAIN ioctl does not support for discrete gpu.
> It skips sd-probe test for discrete platforms.
> 
> https://patchwork.freedesktop.org/patch/msgid/20210715101536.2606307-5-matthew.auld@intel.com
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
