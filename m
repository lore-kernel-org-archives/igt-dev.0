Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <160259171539.2946.6786234434902437425@build.alporthouse.com>
References: <20201013121139.104017-1-matthew.auld@intel.com>
 <160259171539.2946.6786234434902437425@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Oct 2020 15:40:28 +0100
Message-ID: <160260002856.2946.10898844386341987245@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH] tests/gem_exec_params: test overly large batch
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
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-10-13 13:21:55)
> > +
> > +       /*
> > +       * batch_len seems like it can have different interaction depending on
> > +       * the engine and HW.
> > +       */
> > +       for_each_engine(e, fd) {
> > +              execbuf.flags = eb_ring(e);
> > +              /* Make the batch_len implicit */
> > +              __gem_execbuf(fd, &execbuf);
> 
> Expect success.

Except for when batch > GTT size. igt_require(gem_gtt_size() > 4G) ?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
