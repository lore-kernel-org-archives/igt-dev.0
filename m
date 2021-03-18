Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Mar 2021 11:27:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFMc5Iqzw3hw91iL@platvala-desk.ger.corp.intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
 <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test 32x32 cursors
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
To: Martin Peres <martin.peres@mupuf.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:39:01AM +0200, Martin Peres wrote:
> On 18/03/2021 00:45, Lyude wrote:
> > From: Lyude Paul <lyude@redhat.com>
> > 
> > Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
> > least test both of them.
> 
> This adds 36 subtests, which take about 1s in average. So the runtime is not
> significantly increased on the Intel side.
> 
> It also seems that Intel should add skips or fix the kernel to support these
> 32xXX format.
> 
> @Petri, could you get someone to investigate this?


Ville, J-P?


-- 
Petri Latvala



> 
> In the mean time, here is my:
> 
> Reviewed-by: Martin Peres <martin.peres@mupuf.org>
> 
> Martin
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Martin Peres <martin.peres@free.fr>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Jeremy Cline <jcline@redhat.com>
> > ---
> >   tests/kms_cursor_crc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 0be8f7f8..c70c4a8f 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -683,7 +683,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
> >   	igt_fixture
> >   		igt_remove_fb(data->drm_fd, &data->fb);
> > -	for (cursor_size = 64; cursor_size <= 512; cursor_size *= 2) {
> > +	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
> >   		int w = cursor_size;
> >   		int h = cursor_size;
> > 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
