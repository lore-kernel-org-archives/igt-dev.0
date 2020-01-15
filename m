Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E776E8FE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 10:28:13 +0000 (UTC)
References: <20200115091307.2602311-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <27d07f2d-f313-f7df-d4be-09bc7eb1cbc9@intel.com>
Date: Wed, 15 Jan 2020 10:28:11 +0000
MIME-Version: 1.0
In-Reply-To: <20200115091307.2602311-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Drop extended basic mmap
 testing from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 15/01/2020 09:13, Chris Wilson wrote:
> Now that we have basic page faulting support (and more) for mmap in
> selftests, we don't need the same redundant exercise in BAT.
> 
> While these individual tests are quite quick, on some systems such as
> fi-kbl-soraka we incur much longer delays between each test; removing
> 20 tests can easily shorten the BAT runtime by 20s.
> 
> References: 6fedafacae1b ("drm/i915/selftests: Wrap vm_mmap() around GEM objects")
> References: 9771d5f72966 ("drm/i915/selftests: Extend fault handler selftests to all memory regions")
> References: 0658186283ba ("drm/i915/selftests: Compare user mmap against GPU")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
