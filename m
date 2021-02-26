Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B976E8F7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Feb 2021 08:18:40 +0000 (UTC)
Date: Fri, 26 Feb 2021 10:18:56 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YDiu8Bfvcf/JCAma@platvala-desk.ger.corp.intel.com>
References: <20210225090954.31197-1-ankit.k.nautiyal@intel.com>
 <YDdsiQXH1k9Xx9qK@platvala-desk.ger.corp.intel.com>
 <ec39dabd-3db2-bcfd-299c-cdb34ab1d890@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec39dabd-3db2-bcfd-299c-cdb34ab1d890@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_invalid_dotclock: Skip the
 test if big joiner is supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 03:22:25PM +0530, Nautiyal, Ankit K wrote:
> Hi Petri,
> =

> Thanks for your comments. Please find my response inline:
> =

> On 2/25/2021 2:53 PM, Petri Latvala wrote:
> > On Thu, Feb 25, 2021 at 02:39:54PM +0530, Ankit Nautiyal wrote:
> > > Currently the test assumes that the modes with clock more than the
> > > maximum dot clock will be rejected. This fails in case of
> > > platforms that combine multiple pipes and modes higher than the
> > > maximum dotclock can still be supported.
> > > =

> > > This patch adds a check to skip the test if big joiner can be
> > > supported for a given platform and connector.
> > > =

> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >   tests/kms_invalid_dotclock.c | 51 +++++++++++++++++++++++++++++++++=
+--
> > >   1 file changed, 49 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotcloc=
k.c
> > > index 402629ab..5692736b 100644
> > > --- a/tests/kms_invalid_dotclock.c
> > > +++ b/tests/kms_invalid_dotclock.c
> > > @@ -44,6 +44,44 @@ static bool has_scaling_mode_prop(data_t *data)
> > >   				    NULL, NULL, NULL);
> > >   }
> > > +static bool
> > > +is_dsc_capable(int drm_fd, drmModeConnector *connector)
> > > +{
> > > +	int debugfs_fd =3D igt_debugfs_dir(drm_fd);
> > > +	char filename[128];
> > > +	char buf[512];
> > > +	bool dsc =3D false;
> > > +
> > > +	sprintf(filename, "%s-%d",
> > > +		kmstest_connector_type_str(connector->connector_type),
> > > +		connector->connector_type_id);
> > > +
> > > +	strcat(filename, "/i915_dsc_fec_support");
> > > +
> > > +	if (igt_debugfs_simple_read(debugfs_fd, filename, buf,
> > > +				    sizeof(buf)) > 0)
> > > +		dsc =3D strstr(buf, "DSC_Sink_Support: yes") ? true : false;
> > > +
> > > +	close(debugfs_fd);
> > > +
> > > +	return dsc;
> > > +}
> > Consider moving this to lib/. There's another such function in
> > kms_dp_dsc.c already.
> =

> Agreed. To be honest this quite "inspired" from the kms_dp_dsc.c :)
> =

> In the test kms_dp_dsc, there are other functions as well which read the
> same debugfs entry and parse different cap/support.
> =

> The=A0 igt_debugfs_dir is opened once in the beginning of the test and re=
ad
> again and again in different functions.
> =

> What do you suggest? Should we move only the common function? or move oth=
er
> functions as well.


Move only the functions that would get duplicated in multiple tests,
unless moving more makes the test code much cleaner. Somewhat easy
thumb rule :P


> =

> Also, the common function will need to be passed an open debugfs fd.
> =

> So the test using will open debugfs, call this common function and close =
the
> debugfs.


One possibility is two functions, one you call with the device fd and
one with the debugfs fd so both use cases are covered and the test
code for both needs minimal jumping through hoops. Up to you. Much
harder to do because then you need to come up with good names for the
two versions and naming things is hard...

-- =

Petri Latvala


> Thanks & Regards,
> =

> Ankit
> =

> =

> > =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
