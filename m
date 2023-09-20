Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAAF10E467
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 08:58:05 +0000 (UTC)
Date: Wed, 20 Sep 2023 10:57:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <ZQq0E62AoDND4cPW@ashyti-mobl2.lan>
References: <20230918164747.30171-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918164747.30171-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] Ignore some tests on MTL which
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,

On Mon, Sep 18, 2023 at 06:47:43PM +0200, Nirmoy Das wrote:
> Because of a HW bug in MTL it is recommended to do GGTT
> update using MI_UPDATE_GGTT[1] which happens through BCS0
> engine. If some test blocks bcs with a spinner then such
> tests will fail. This series ignore those tests on MTL.
> 
> v2: use macro,
> s/gem_has_ggtt_bind/gem_engine_can_block_ggtt_binder(Kamil)
> v3: Skip gem_ctx_schedule@in-order@bcs as well.
> Add two more tests in gem_spin_batch as hinted by the latest
> results from the i915 CI.
> 
> [1]https://patchwork.freedesktop.org/series/123329/
> 
> Nirmoy Das (4):
>   lib/igt_gt: Add gem_engine_can_block_ggtt_binder
>   tests/intel/gem_ctx_shared: Skip some test on MTL
>   tests/intel/gem_ctx_schedule: Skip some test on MTL
>   tests/intel/gem_spin_batch: Skip some test on MTL

for all patches:

Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
