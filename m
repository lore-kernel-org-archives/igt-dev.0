Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187C66E484
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 07:01:11 +0000 (UTC)
Message-ID: <7350bf26fc74b02873fd8dd7b447159c58214bff.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 09:00:33 +0200
In-Reply-To: <98f14695d85b4c4db75ba7435c00ec76@intel.com>
References: <20210818140651.819205-1-thomas.hellstrom@linux.intel.com>
 <98f14695d85b4c4db75ba7435c00ec76@intel.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_lmem_swapping: Add
 the gem_lmem_swapping test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Tang, CQ" <cq.tang@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2021-08-18 at 15:51 +0000, Tang, CQ wrote:
> 
> 
> > -----Original Message-----
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Sent: Wednesday, August 18, 2021 7:07 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tang, CQ <cq.tang@intel.com>; Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com>; Dixit, Ashutosh
> > <ashutosh.dixit@intel.com>; Thomas Hellström
> > <thomas.hellstrom@linux.intel.com>; Chris Wilson
> > <chris@chris-wilson.co.uk>
> > Subject: [PATCH i-g-t v2] tests/i915/gem_lmem_swapping: Add the
> > gem_lmem_swapping test
> > 
> > From: CQ Tang <cq.tang@intel.com>
> > 
> > This test exercises the lmem eviction functionality with one
> > dynamic subtest
> > per lmem region.
> > 
> > In essence the various subtests create lmem buffers objects
> > consuming
> > more lmem memory than available and check that they are successful
> > submitting workload subsets whose lmem size requirements are
> > smaller
> > than the total amount of lmem available, forcing eviction of buffer
> > objects
> > under various conditions.
> 
> I see this is not the latest code version. I made modification
> yesterday to further reduce the testing runtime. There are other
> differences as well.
> Is this intended?

Yes, there have been some recent changes lately. The code sent upstream
is currently intended only for DG1, and does not have some of the speed
adjustment needed for newer hardware and some code used to adjust the
number of loops for the workload to be similar across most tests on
DG1, where no test typically runs for longer than 20-30s. The code is
also completely adapted to the new uapi changes.

/Thomas

