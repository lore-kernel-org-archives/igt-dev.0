Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707EF6E0CB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 07:38:25 +0000 (UTC)
References: <20210811073513.726866-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <9af9970e-e7f2-d669-b8e4-6adc908725d3@linux.intel.com>
Date: Wed, 11 Aug 2021 09:38:20 +0200
MIME-Version: 1.0
In-Reply-To: <20210811073513.726866-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Add the
 gem_lmem_swapping test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: CQ Tang <cq.tang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>


On 8/11/21 9:35 AM, Thomas Hellström wrote:
> From: CQ Tang <cq.tang@intel.com>
>
> This test exercises the lmem eviction functionality with one
> dynamic subtest per lmem region.
>
> In essence the various subtests create lmem buffers objects consuming more
> lmem memory than available and check that they are successful submitting
> workload subsets whose lmem size requirements are smaller than the total
> amount of lmem available, forcing eviction of buffer objects under
> various conditions.
>
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---

Hmm, I should've run checkpatch.pl on this before submission. I will fix 
up related style errors in v2.

/Thomas

