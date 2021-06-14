Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973089E19
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 11:19:17 +0000 (UTC)
Date: Mon, 14 Jun 2021 13:40:32 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210614104003.enhrwqwa42tcwidn@hatecraft.localdomain>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
 <20210608094020.21598-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608094020.21598-2-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] Revert "test/i915/gem_exec_reloc:
 Restore interclient testings"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Petri Latvala <petri.latvala@intel.com>, IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 11:40:15AM +0200, Daniel Vetter wrote:
> This reverts commit cf2f41b3d3dfabaf3a4837062f996f3491a350b1.
> 
> And I mean revert with extreme prejudice because this was already
> thrown out in
> 
> commit 39e9aa1032a4e60f776f34b3ccf4fb728abbfe5c
> Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date:   Mon Aug 10 11:00:34 2020 +0200
> 
>     tests/i915: Remove subtests that rely on async relocation behavior
> 
> and Chris then decided to undo that without any acks from the people
> who've removed these tests. Or well anyone else. Commit fights in
> upstream repositories are not acceptable.

Acked-by: Arkadiusz Hiler <arek@hiler.eu>

on the whole series, but especially on this patch.

Thanks for catching it and calling it out.

The full review is up to people familiar with Intel's hardware.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
