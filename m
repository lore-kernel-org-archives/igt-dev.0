Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E699B10F76A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 08:04:14 +0000 (UTC)
Date: Mon, 6 Jun 2022 11:01:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <Yp20a/lRcTpJQgus@platvala-desk.ger.corp.intel.com>
References: <20220531220313.9537-1-quic_jesszhan@quicinc.com>
 <Ypiy61MS536or/rv@platvala-desk.ger.corp.intel.com>
 <6e243c6f-d771-72fb-0d6a-a60942e2c46b@quicinc.com>
 <Ypm1aKs8hCcacXdx@platvala-desk.ger.corp.intel.com>
 <f0f0e2cc-ac1b-cdbf-6829-5cb1b810ab82@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f0e2cc-ac1b-cdbf-6829-5cb1b810ab82@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_pipe_crc_basic: Support
 custom CRC sources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 10:06:55AM -0700, Jessica Zhang wrote:
> 
> 
> On 6/3/2022 12:16 AM, Petri Latvala wrote:
> > On Thu, Jun 02, 2022 at 01:41:16PM -0700, Jessica Zhang wrote:
> > > 
> > > 
> > > On 6/2/2022 5:54 AM, Petri Latvala wrote:
> > > > On Tue, May 31, 2022 at 03:03:13PM -0700, Jessica Zhang wrote:
> > > > > Add a custom command line option that allows user to set a custom CRC
> > > > > source. This will allow different drivers to test their own CRC sources
> > > > > instead of just the "auto" option.
> > > > > 
> > > > > Example usage: `./kms_pipe_crc_basic -s intf`
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    tests/kms_pipe_crc_basic.c | 28 ++++++++++++++++++++++------
> > > > >    1 file changed, 22 insertions(+), 6 deletions(-)
> > > > 
> > > > While this sounds useful, why only kms_pipe_crc_basic?
> > > > 
> > > > How about checking an environment variable in igt_pipe_crc_new*() and
> > > > overriding the source string based on that, if the parameter is
> > > > "auto"? That would bring this capability to other tests as well.
> > > 
> > > Hey Petri,
> > > 
> > > The intention of this patch is to have *a* way to validate the custom CRC
> > > source. If we implement an environmental variable, we would have to run all
> > > the CRC-related tests manually for validation.
> > 
> > What's the difference though? Between running
> > 
> > ./kms_pipe_crc_basic -s intf
> > 
> > vs.
> > 
> > IGT_OVERRIDE_CRC_METHOD=intf ./kms_pipe_crc_basic
> > 
> > 
> > Or do you mean you want to first validate whether intf works for you
> > at all?
> 
> Yea, we added this patch mainly so we can do basic validation that the intf
> driver code works.

Even so a more generic method for selecting the crc method would be
better, not just for one test. I'm sure this won't be the last time
someone wants to create a new method and needs to test it.

Consider selecting the crc method with an environment variable like
above, or if a command line flag is better for you, add it for all
tests in igt_core.c



-- 
Petri Latvala





> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > -- 
> > Petri Latvala
> > 
> > 
> > 
> > > 
> > > Thanks,
> > > 
> > > Jessica Zhang
> > > 
> > > > 
> > > > 
> > > > -- 
> > > > Petri Latvala
> > > > 
> > > > 
> > > > > 
> > > > > diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> > > > > index 0861c46dbd9b..6a593aec4c6c 100644
> > > > > --- a/tests/kms_pipe_crc_basic.c
> > > > > +++ b/tests/kms_pipe_crc_basic.c
> > > > > @@ -36,6 +36,7 @@ typedef struct {
> > > > >    	int debugfs;
> > > > >    	igt_display_t display;
> > > > >    	struct igt_fb fb;
> > > > > +	char *crc_source;
> > > > >    } data_t;
> > > > >    static struct {
> > > > > @@ -104,7 +105,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
> > > > >    		if (flags & TEST_NONBLOCK) {
> > > > >    			igt_pipe_crc_t *pipe_crc;
> > > > > -			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> > > > > +			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, data->crc_source);
> > > > >    			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
> > > > >    			igt_pipe_crc_start(pipe_crc);
> > > > > @@ -119,7 +120,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
> > > > >    		} else {
> > > > >    			igt_pipe_crc_t *pipe_crc;
> > > > > -			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
> > > > > +			pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, data->crc_source);
> > > > >    			igt_pipe_crc_start(pipe_crc);
> > > > >    			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS, &crcs);
> > > > > @@ -202,8 +203,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
> > > > >    	igt_plane_set_fb(primary, &fb0);
> > > > >    	igt_display_commit(display);
> > > > > -	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
> > > > > -				    INTEL_PIPE_CRC_SOURCE_AUTO);
> > > > > +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, data->crc_source);
> > > > >    	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> > > > >    	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
> > > > > @@ -265,9 +265,25 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
> > > > >    	igt_remove_fb(data->drm_fd, &data->fb);
> > > > >    }
> > > > > -data_t data = {0, };
> > > > > +data_t data = {0, .crc_source = "auto"};
> > > > > -igt_main
> > > > > +static int opt_handler(int opt, int opt_index, void *_data)
> > > > > +{
> > > > > +	switch (opt) {
> > > > > +	case 's':
> > > > > +		data.crc_source = optarg;
> > > > > +		igt_debug("Setting CRC source to %s\n", data.crc_source);
> > > > > +		break;
> > > > > +	}
> > > > > +
> > > > > +	return IGT_OPT_HANDLER_SUCCESS;
> > > > > +}
> > > > > +
> > > > > +static const char help_str[] =
> > > > > +	"  -s\tPass in a custom source for crc test (default is \"auto\")\n";
> > > > > +
> > > > > +
> > > > > +igt_main_args("s:", NULL, help_str, opt_handler, NULL)
> > > > >    {
> > > > >    	enum pipe pipe;
> > > > > -- 
> > > > > 2.31.0
> > > > > 
