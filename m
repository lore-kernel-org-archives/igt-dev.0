Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BD410E5E1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 14:46:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e461c1f5bso37153435e9.3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 06:46:09 -0800 (PST)
Message-ID: <da45fb63-c8c9-4f48-b46d-3fb6a40f72d4@gmail.com>
Date: Wed, 10 Jan 2024 16:45:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 0/3] Sync i915_pciid.h
Content-Language: en-US
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Set look ok to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 10.1.2024 10.15, Chaitanya Kumar Borah wrote:
> Our original intent was to add ARL-S PCI IDs to IGT header. The ideal way
> to do that would be to sync i915_pciids.h between kernel and IGT.
> However, recently both files have diverged. See [2]
> 
> We tried adding just the ARL-S PCI ID to the IGT i915_pciids.h but
> this will further diverge both the files. Please see the discussions
> in [1].
> 
> To avoid this, we have decided to use i915_pciids_local.h to move out
> any difference between the kernel and IGT header and then sync both
> the headers.
> 
> I have not tested if the PVC and MTL changes causes any functional issue
> but verified that the build works.
> 
> [1] https://patchwork.freedesktop.org/patch/572027/?series=50957&rev=15
> [2] 17f9914c47c9 (lib: Add Pontevecchio platform)
>      77dd5222d165 (v2: Add mtl to perf-metrics-codegen.py (Umesh))
> 	
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Chaitanya Kumar Borah (3):
>    lib/i915/perf: include i915_pciids_local.h
>    lib: Add non-kernel macros to i915_pciids_local.h
>    lib: sync i915_pciids.h with kernel
> 
>   lib/i915/perf.c         |  1 +
>   lib/i915_pciids.h       | 56 ++++++++++++++++++-----------------------
>   lib/i915_pciids_local.h | 38 ++++++++++++++++++++++++++++
>   3 files changed, 64 insertions(+), 31 deletions(-)
> 
