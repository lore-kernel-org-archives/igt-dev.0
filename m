Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED50DD2ECE9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 12:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C69710E5E6;
	Tue, 20 Jan 2026 12:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9ozovzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F4610E5E6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768913924; x=1800449924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bm32q106hOB0NNVH+Gmk5RHOfftzDQf8KwCB5TzK5JA=;
 b=b9ozovzGU8EMAp4EbcfXnxG6evu6JkvFKTPvEzIUEFRc8BKzTK5PNOts
 MG7pea0sPQPU3n/MamNUwaIf7GpLuX1+rHmokaLIWQIUkza66yFpSmsTJ
 A20BuDj01kLGV+HFkk5eaqsXzDj2vAv8oCPXCwbpESlfYEim+pdP9wi+3
 /fxSPMeOjYu1kuPx0ztt5TckVrEtmT17eUyztGDe8g82xEgMNBpE0r/hG
 Mwa8zYccscVFazNH5/ruQVfrjqt2oFEPfn3ZEpsznonlhJfafT4mCqGmg
 Od3Z+zRyRRvpA4b7v0sfJWa+yz1Jw6bE2IU6m7bry43N3U6iJrOcWAV/8 Q==;
X-CSE-ConnectionGUID: cGe30BN1T/i0Yt388BljTQ==
X-CSE-MsgGUID: vM5skzwAT4WWqoVYbuZd9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70209572"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70209572"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 04:58:43 -0800
X-CSE-ConnectionGUID: d+mKfzxyQQuFVboK01vCOA==
X-CSE-MsgGUID: qYuP59m+SeuSlw4YRkZatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205266067"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 04:58:41 -0800
Date: Tue, 20 Jan 2026 13:58:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, carlos.santa@intel.com,
 jeevaka.badrappan@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Message-ID: <20260120125838.t5l4r7nrz5j7m3c6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 carlos.santa@intel.com, jeevaka.badrappan@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114082323.2534785-1-s.sebinraj@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi S,
On 2026-01-14 at 13:53:23 +0530, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
> 
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>    - Primary plane:   signaled fence (simulating completed GPU work)
>    - Overlay-1 plane: signaled fence (simulating completed GPU work)
>    - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
> 
> Bug Detection:
> This test catches driver bugs where:
>  - Planes with signaled fences update prematurely before unsignaled
>    fences complete, breaking atomic commit semantics
>  - Fence states are mismanaged across multiple planes causing visual
>    glitches or corruption
>  - The driver fails to wait on all IN_FENCE_FDs atomically
> 
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
> 
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
> 
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>   of explicit fences when provided two or more buffers at once,
>   with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>   https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>   use of explicit fencing in the KMS Atomic Modesetting APIs.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   1 +
>  2 files changed, 373 insertions(+)
>  create mode 100644 tests/kms_explicit_fence.c
> 
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..d3cad5904
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright © 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fence states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple planes
> + * are updated in a single atomic commit with different fence states. This is
> + * critical for catching fence synchronization bugs where the driver might:
> + * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitches
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +#include <poll.h>

System headers should be first, then newline, then igt.
Also, sort them alphabetically:

> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>

> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"

Regards,
Kamil

> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
> + *              2 planes with signaled fences and 1 plane with unsignaled fence.
> + *              Validates that display waits for all fences before updating any plane.
> + */
[cut]
