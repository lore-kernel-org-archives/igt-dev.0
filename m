Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8AF10E24D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 13:38:01 +0000 (UTC)
Date: Mon, 25 Sep 2023 09:37:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ZRGNME78aNTj81qs@intel.com>
References: <20230921163530.285456-1-juhapekka.heikkila@gmail.com>
 <ZQ4Le0BbHvdoAZZJ@intel.com>
 <9cda7f65-e8c4-607a-0c2c-fed69bd85cf5@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9cda7f65-e8c4-607a-0c2c-fed69bd85cf5@gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe: on xe driver use blitter for
 x-tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 11:02:43AM +0300, Juha-Pekka Heikkila wrote:
> Hi Rodrigo,
> 
> On 23.9.2023 0.47, Rodrigo Vivi wrote:
> > On Thu, Sep 21, 2023 at 07:35:30PM +0300, Juha-Pekka Heikkila wrote:
> > > on xe driver need to use blitter for x-tile
> > 
> > While testing the xe-uapi alignment series I noticed the pass rate had sunk.
> > And then noticed it was all related to display and blit.
> > 
> > A bisect in kernel and in igt brought me to this patch as the culprit for
> > the craches I was seeing on DG2.
> > 
> > And it looks CI is also not very happy:
> > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?
> > 
> > and my bet is on this patch here.
> > 
> > kms_cursor_legacy
> 
> I don't see these crashes, currently this show all green for me:
> https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?testfilter=kms_cursor_legacy%7Ckms_flip&hosts=dg2
> 
> From above link looking at any of those test histories there's no crashes in
> history, this patch went in on IGT_7497 which is still visible on the
> history while writing this.
> 
> I tried to run these tests also on our local dg2 against xe driver but I was
> not able to reproduce any crash here either running tests as per subtest or
> as a blob.

So, this is regressing my DG2. I'm trending more to send a revert than a
bug report.

> 
> /Juha-Pekka
> 
> > 6/6	6/6	6/6	6/6	6/6	6/6	6/6	0/6
> > basic-flip-after-cursor-atomic
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-after-cursor-legacy
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-after-cursor-varying-size
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-before-cursor-atomic
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-before-cursor-legacy
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-before-cursor-varying-size
> > pass	pass	pass	pass	pass	pass	pass	crash
> > kms_dsc
> > 0/0	0/0	0/0	0/0	0/0	0/0	0/0	0/0
> > dsc-basic
> > skip	skip	skip	skip	notrun	skip	skip	skip
> > kms_flip
> > 16/16	16/16	16/16	16/16	16/16	16/16	16/16	0/16
> > basic-flip-vs-dpms
> > 0/0	0/0	0/0	0/0	0/0	0/0	0/0	0/0
> > a-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > b-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > c-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > d-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-vs-modeset
> > 0/0	0/0	0/0	0/0	0/0	0/0	0/0	0/0
> > a-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > b-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > c-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > d-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-flip-vs-wf_vblank
> > 0/0	0/0	0/0	0/0	0/0	0/0	0/0	0/0
> > a-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > b-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > c-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > d-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > basic-plain-flip
> > 0/0	0/0	0/0	0/0	0/0	0/0	0/0	0/0
> > a-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > b-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > c-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > d-dp2
> > pass	pass	pass	pass	pass	pass	pass	crash
> > 
> > Results for igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> > Overview
> > Result: crash
> > 
> > Back to summary
> > 
> > Details
> > Detail	Value
> > Returncode	None
> > Time	0:00:00
> > Stdout	
> > Opened device: /dev/dri/card0
> > Starting subtest: basic-flip-before-cursor-varying-size
> > Using pipe A & DP-2
> > Subtest basic-flip-before-cursor-varying-size: CRASH (0.705s)
> > Stderr	
> > Starting subtest: basic-flip-before-cursor-varying-size
> > Received signal SIGBUS.
> > Stack trace:
> >   #0 [fatal_sig_handler+0x17b]
> >   #1 [__sigaction+0x50]
> >   #2 [emit_blt_block_copy+0x47e]
> >   #3 [blt_block_copy+0xeb]
> >   #4 [blitcopy+0x263]
> >   #5 [setup_linear_mapping+0x163]
> >   #6 [create_cairo_surface__gpu+0x32]
> >   #7 [igt_get_cairo_surface+0x88]
> >   #8 [igt_get_cairo_ctx+0xb]
> >   #9 [igt_create_pattern_fb+0x29]
> >   #10 [set_fb_on_crtc+0x39]
> >   #11 [basic_flip_cursor+0xcf]
> >   #12 [__igt_unique____real_main1887+0xa41]
> >   #13 [main+0x23]
> >   #14 [__libc_start_call_main+0x80]
> >   #15 [__libc_start_main+0x89]
> >   #16 [_start+0x25]
> > Subtest basic-flip-before-cursor-varying-size: CRASH (0.705s)
> > Command	
> > dmesg	
> > <6> [29102.951496] [IGT] kms_cursor_legacy: executing
> > <6> [29103.289314] [IGT] kms_cursor_legacy: starting subtest basic-flip-before-cursor-varying-size
> > <6> [29104.003123] [IGT] kms_cursor_legacy: finished subtest basic-flip-before-cursor-varying-size, CRASH
> > <6> [29104.012383] [IGT] kms_cursor_legacy: exiting, ret=135
> > 
> > 
> > > 
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> > >   lib/igt_fb.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 4b592825d..c8a7b31a8 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -2557,7 +2557,8 @@ static bool use_blitter(const struct igt_fb *fb)
> > >   	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
> > >   	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
> > >   	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> > > -	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
> > > +	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
> > > +	       is_xe_device(fb->fd);
> > >   }
> > >   static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
> > > -- 
> > > 2.25.1
> > > 
> 
