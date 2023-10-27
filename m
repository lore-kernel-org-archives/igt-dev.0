Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55910E057
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 08:19:01 +0000 (UTC)
Message-ID: <111eb22a-3c75-50bb-5a67-15fb9551e1c4@linux.intel.com>
Date: Fri, 27 Oct 2023 10:18:55 +0200
MIME-Version: 1.0
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
References: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 0/2] lib/intel_batchbuffer: allow GTT size be
 not power of 2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

+ Zbigniew

On 10/26/2023 5:50 PM, Andrzej Hajda wrote:
> This patchset should solve issues detected during
> applying Wa_16018031267 / Wa_16018063123.
> This Wa requires to allocate one page at the end of PPGTT,
> thus reported vm size is lower than full 480bits
> and currently some IGT tests fails in such case [1],
> particulary api_intel_bb.
>
> [1]: https://patchwork.freedesktop.org/series/124011/
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Looks good to me.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> for the series.


> ---
> Andrzej Hajda (2):
>        lib/igt_aux: fix roundup_power_of_two implementation
>        lib/intel_batchbuffer: allow GTT size be not power of 2
>
>   lib/igt_aux.h           | 2 +-
>   lib/intel_batchbuffer.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: 62ac3d2ddb6005b16df00a36565779848c1390c9
> change-id: 20231026-gtt_size_fix-835c73de2a19
>
> Best regards,
