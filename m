Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 15 Apr 2021 13:34:00 +0200
Message-ID: <5786760.lOV4Wx5bFT@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <0bb651d1757d3f73239d7adfbb358ea8c71df923.camel@linux.intel.com>
References: <20210409085704.40233-1-janusz.krzysztofik@linux.intel.com>
 <0bb651d1757d3f73239d7adfbb358ea8c71df923.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [RFC PATCH] tests/gem_userptr_blits:
 Check for banned mmap-offset
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
To: igt-dev@lists.freedesktop.org, Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On czwartek, 15 kwietnia 2021 11:47:29 CEST Marcin Bernatowicz wrote:
> On Fri, 2021-04-09 at 10:57 +0200, Janusz Krzysztofik wrote:
> > Support for mmap-offset to userptr has been obsoleted, then related
> > lockdep splat reported issues are not going to be resolved other than
> > still banning mmap-offset to userptr attempts.
> > 
> > Replace "mmap-offset-invalidate-*" and "readonly-mmap-unsync"
> > subtests
> > which now skip with a negative "mmap-offset-banned" that fails if a
> > mmap-offset attempt to a userptr object doesn't return ENODEV.  Also,
> > remove mmap-offset to userptr dependent processing paths from other
> > subtest bodies and drop obsolete subtest variants.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com
...
> LGTM,
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Thank you Marcin, pushed.

Janusz




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
