Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42A76EC45
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 11:40:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 17so11291384wmo.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 04:40:47 -0700 (PDT)
Date: Thu, 16 Jul 2020 08:40:38 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20200716114038.bfieynyqbsc2fsa3@smtp.gmail.com>
References: <cover.1592840756.git.melissa.srw@gmail.com>
 <0cef6a7b7dbd8510de62f0c17e8cd952cfa84678.1592840756.git.melissa.srw@gmail.com>
 <20200715124706.f6bvf7g7dqbcnyaj@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715124706.f6bvf7g7dqbcnyaj@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] test/kms_cursor_crc:
 release old pipe_crc before create a new one
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, twoerner@gmail.com, kernel-usp@googlegroups.com
List-ID: <igt-dev@lists.freedesktop.org>

On 07/15, Arkadiusz Hiler wrote:
> On Mon, Jun 22, 2020 at 01:37:55PM -0300, Melissa Wen wrote:
> > When a subtest fails, it skips the cleanup, and its pipe_crc remains allocated.
> > As a consequence, the following subtest also fails (timeout) when trying to
> > create a new one. This patch releases any remaining pipe_crc to enable the
> > creation of a new one for the next subtest.
> > 
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  tests/kms_cursor_crc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index f105e295..5976df5f 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -423,6 +423,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
> >  	igt_display_commit(display);
> >  
> >  	/* create the pipe_crc object for this pipe */
> > +	if (data->pipe_crc)
> > +		igt_pipe_crc_free(data->pipe_crc);
> 
> That's a welcome improvement, but you may want to also look at
> 06333955bf3d ("tests/kms_cursor_crc: start crc only once per test")
> for some extra inspiration for future work on this.
> 
> It should be possible to initiate pipe crc to be initalized only once
> per each tested pipe in run_tests_on_pipe() - igt_pipe_crc_new() can be
> costly on some real panels.

Hi,

Thanks for the advice! 
As I have one more refactoring in mind for this test, I will add this in
the works and send a patchset with everything together.

For now, I just submitted a v2 of this patch because I dropped the other
one that was in the same patchset.

Melissa
> 
> Anyway,
> Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> 
> 
> >  	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
> >  					  INTEL_PIPE_CRC_SOURCE_AUTO);
> >  
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
