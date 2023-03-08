Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A7E10E6BA
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 17:25:59 +0000 (UTC)
Date: Wed, 8 Mar 2023 18:25:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230308172555.zukogiowlzmiykdn@kamilkon-desk1>
References: <20220808093622.193800-1-mohammed.thasleem@intel.com>
 <20220814092816.34933-1-mohammed.thasleem@intel.com>
 <03ae8ec7-95a8-cab5-ba85-6f9a69b58592@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03ae8ec7-95a8-cab5-ba85-6f9a69b58592@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_display_modes: Fixed mode
 selection for extended mode tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-02-24 at 15:10:07 +0530, Modem, Bhanuprakash wrote:
> 
> 
> On Sun-14-08-2022 02:58 pm, Mohammed Thasleem wrote:
> > Added check on ENOSPC when two moniters connected through MST.
> > This will find the connector mode combo that fits into the
> > bandwidth when more than one monitor is connected.
> > 
> > Example:
> >    When two monitors connected through MST, the second monitor
> >    also tries to use the same mode. So two such modes may not
> >    fit into the link bandwidth. So, iterate through connected
> >    outputs & modes and find a combination of modes those fit
> >    into the link BW.
> > 
> > v2: -Updated commit msg and description. (Bhanu)
> >      -Renamed restart with retry. (Bhanu)
> >      -Moved igt_pipe_crc_new before retry. (Bhanu)
> >      -Removed unrelated changes and new line. (Bhanu)
> >      -Minor changes.
> > 
> > Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> > ---
> >   tests/kms_display_modes.c | 25 +++++++++++++++++++++----
> >   1 file changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> > index e4191811..19026dc1 100644
> > --- a/tests/kms_display_modes.c
> > +++ b/tests/kms_display_modes.c
> > @@ -43,7 +43,7 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> >   	igt_plane_t *plane[2];
> >   	igt_pipe_crc_t *pipe_crc[2] = { 0 };
> >   	igt_crc_t ref_crc[2], crc[2];
> > -	int count = 0, width, height;
> > +	int count = 0, width, height, ret;
> >   	cairo_t *cr;
> >   	for_each_connected_output(display, output) {
> > @@ -54,14 +54,16 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> >   			break;
> >   	}
> > +	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
> > +	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
> > +
> > +retry:
> >   	igt_output_set_pipe(extended_output[0], pipe1);
> >   	igt_output_set_pipe(extended_output[1], pipe2);
> >   	mode[0] = igt_output_get_mode(extended_output[0]);
> >   	mode[1] = igt_output_get_mode(extended_output[1]);
> > -	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
> > -	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
> >   	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
> >   			     DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
> > @@ -79,7 +81,22 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> >   	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
> >   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
> > -	igt_display_commit2(display, COMMIT_ATOMIC);
> > +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> 
> It would be better to add one or two line comment about this handling. Maybe
> you can add it while pushing this patch, no need to float a new rev.
> 
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> - Bhanu
> 

One more thing is how is it preventing infinite loop ?

> > +	if (ret != 0 && errno == ENOSPC) {
> > +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> > +
> > +		igt_require_f(found, "No valid mode combo found.\n");
> > +
> > +		for_each_connected_output(display, output)
> > +			igt_output_set_pipe(output, PIPE_NONE);
> > +
> > +		igt_remove_fb(data->drm_fd, &fbs[0]);
> > +		igt_remove_fb(data->drm_fd, &fbs[1]);
> > +
> > +		goto retry;
> > +	}
> > +
> > +	igt_assert(!ret);

This one should be more elaborate, maybe use igt_assert_f(!ret, "description here\n");

Regards,
Kamil

> >   	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
> >   	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
