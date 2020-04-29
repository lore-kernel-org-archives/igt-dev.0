Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <4e867fdf-6ae1-fab8-83bf-b7c02fcf3cc3@intel.com>
References: <20200429145113.588577-1-chris@chris-wilson.co.uk>
 <20200429150500.588743-1-chris@chris-wilson.co.uk>
 <4e867fdf-6ae1-fab8-83bf-b7c02fcf3cc3@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158817400505.2633.14772542047833812485@build.alporthouse.com>
Date: Wed, 29 Apr 2020 16:26:45 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] perf: Flush the work
 between rounds of gen8-unprivileged-single-ctx-counter
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-04-29 16:23:34)
> On 29/04/2020 18:05, Chris Wilson wrote:
> > Wait until the GPU is idle before starting a fresh round of probing
> > gen8-unprivileged-single-ctx-counter. This avoids building up a huge
> > backlog of render copies, hogging buffers and stale contexts, and
> > invoking the oomkiller.
> >
> > v2: Release everything before starting again.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> 
> Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

I guess I don't want to hear the answer, but does OA also want to pin
frequencies?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
