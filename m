Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFCC6E526
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 09:26:06 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:26:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201119092603.GG7444@platvala-desk.ger.corp.intel.com>
References: <20201119083559.2157131-1-chris@chris-wilson.co.uk>
 <20201119085304.GE7444@platvala-desk.ger.corp.intel.com>
 <160577643202.20188.14707147021361714887@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160577643202.20188.14707147021361714887@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kms: Range check pipe before lookup
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 09:00:32AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-11-19 08:53:04)
> > On Thu, Nov 19, 2020 at 08:35:59AM +0000, Chris Wilson wrote:
> > > Make sure the lookup index is within the range of the table before
> > > accessing.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  lib/igt_kms.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > index e5d8e82c9..9175e50fe 100644
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -1902,7 +1902,7 @@ static void igt_fill_display_format_mod(igt_display_t *display);
> > >   */
> > >  void igt_require_pipe(igt_display_t *display, enum pipe pipe)
> > >  {
> > > -     igt_skip_on_f(!display->pipes[pipe].enabled,
> > > +     igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].enabled,
> > >                       "Pipe %s does not exist or not enabled\n",
> > >                       kmstest_pipe_name(pipe));
> > 
> > Who's calling this with an invalid 'pipe' value? display->pipes size
> > is no longer display->n_pipes, right?
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9356/shard-skl8/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b.html
> Starting subtest: disable-crc-after-crtc-pipe-B
> Received signal SIGSEGV.
> Stack trace:
>  #0 [fatal_sig_handler+0xd6]
>  #1 [killpg+0x40]
>  #2 [igt_output_get_mode+0x0]
>  #3 [__real_main261+0x629]
>  #4 [main+0x27]
>  #5 [__libc_start_main+0xe7]
>  #6 [_start+0x2a]
> Subtest disable-crc-after-crtc-pipe-B: CRASH (0.087s)
> 
> Suggests that the output is NULL/garbage, so I was looking for ideas as
> to how we end up dying there. The loop in test_read_crc() doesn't look
> susceptible to corrupting the local variable, so I guess the output was
> suspect to begin with.


Hmm yeah.

Other tests are explicitly checking that
igt_get_single_output_for_pipe returns non-null, that one doesn't...

In fact it doesn't even call igt_require_pipe. Even before the support
for fused pipes was merged, that test looks broken.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
