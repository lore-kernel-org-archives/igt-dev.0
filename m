Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6FB6E038
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 12:50:44 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 17 Jan 2020 12:44:40 +0000
Message-ID: <357202513f72d3e36517dfffacdc49577ab786c4.camel@intel.com>
References: <20200117091749.1606-1-mika.kahola@intel.com>
 <20200117121305.GT25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200117121305.GT25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <BE7B114D6267E7488B7D68553BE69FC2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Test only with
 one plane
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-01-17 at 14:13 +0200, Petri Latvala wrote:
> On Fri, Jan 17, 2020 at 11:17:49AM +0200, Mika Kahola wrote:
> > The test is intended to test resolution changes from higher to
> > lower and back. We can test this with only one plane and we don't
> > need to run through all planes. This will save significant amount
> > of test execution time.
> > 
> > Fix for
> > Bugzilla: https://gitlab.freedesktop.org/drm/intel/issues/899
> 
> I'm having a hard time understanding how this change fixes this
> issue.
For some reason crc's don't match if we loop through multiple overlay
planes. The reference image has primary, first overlay and cursors
plane. Crc already fails if we compare the reference with the image
having primary, second overlay and cursor plane. This I have been
testing with TGL.

> 
> 
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_plane_lowres.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> > index 4c3f5636..ee6fb1fb 100644
> > --- a/tests/kms_plane_lowres.c
> > +++ b/tests/kms_plane_lowres.c
> > @@ -208,7 +208,8 @@ test_planes_on_pipe_with_output(data_t *data,
> > enum pipe pipe,
> >  		igt_assert_crc_equal(&data->ref_lowres.crc,
> > &crc_lowres);
> >  
> >  		igt_plane_set_fb(plane, NULL);
> > -		tested++;
> > +		if (tested++)
> > +			break;
> 
> At this point one must ask: Why have the count variable anymore?
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
