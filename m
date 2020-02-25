Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <6ad2e8c7-f3e3-a43e-ea4c-92ab57d69b06@linux.intel.com>
References: <20200224215650.39624-1-chris@chris-wilson.co.uk>
 <6ad2e8c7-f3e3-a43e-ea4c-92ab57d69b06@linux.intel.com>
Message-ID: <158265431375.3656.10896445408963081099@skylake-alporthouse-com>
Date: Tue, 25 Feb 2020 18:11:53 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_persistence:
 Check precision of hostile cancellation
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-02-25 18:08:14)
> 
> On 24/02/2020 21:56, Chris Wilson wrote:
> > Check that if we have to remove a hostile request from a non-persistent
> > context, we do so without harming any other concurrent users.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> > +     /* All other spinners should be left unharmed */
> > +     gem_quiescent_gpu(i915);
> > +     igt_assert_eq(sync_fence_wait(fence, reset_timeout_ms), 0);
> > +     igt_assert_eq(sync_fence_status(fence), 1);
> 
> I don't quite get this test. Why would other spinners be unharmed? They 
> are non-preemptible as well. And non-persistent spinner is alone on the 
> engine. So what aspect you wanted to test?

Per-engine reset. Termination of the non-persistent context should be
clean and precise, we don't allow creation of non-persistent contexts
unless we have that level of surgical precision. Otherwise it becomes a
new attack vector.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
