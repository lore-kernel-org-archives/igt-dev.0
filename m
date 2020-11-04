Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B246E992
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 10:34:14 +0000 (UTC)
Date: Wed, 4 Nov 2020 12:34:10 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201104103410.GP7444@platvala-desk.ger.corp.intel.com>
References: <20201026084840.13061-1-petri.latvala@intel.com>
 <871rhbc9ai.wl-ashutosh.dixit@intel.com>
 <20201103080513.GM7444@platvala-desk.ger.corp.intel.com>
 <87eelanii5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87eelanii5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Don't return too early in
 common_init_config
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 03:11:14PM -0800, Dixit, Ashutosh wrote:
> On Tue, 03 Nov 2020 00:05:13 -0800, Petri Latvala wrote:
> >
> > On Mon, Nov 02, 2020 at 09:13:25PM -0800, Dixit, Ashutosh wrote:
> > > On Mon, 26 Oct 2020 01:48:40 -0700, Petri Latvala wrote:
> > > >
> > > > common_init_config is responsible for adding the device filters
> > > > supplied through the environment to the filter list. If the .igtrc
> > > > file cannot be opened, make sure the filter is added still.
> > > >
> > > > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > > > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > > > ---
> > > >  lib/igt_core.c | 18 +++++++++---------
> > > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > > index b358173f..8f9d925b 100644
> > > > --- a/lib/igt_core.c
> > > > +++ b/lib/igt_core.c
> > > > @@ -775,21 +775,20 @@ GKeyFile *igt_load_igtrc(void)
> > > >  static void common_init_config(void)
> > > >  {
> > > >	GError *error = NULL;
> > > > -	int ret;
> > > > +	int ret = 0;
> > > >
> > > >	igt_key_file = igt_load_igtrc();
> > > > -	if (!igt_key_file)
> > > > -		return;
> > >
> > > I believe the only change needed is the one above. The remaining
> > > igt_key_file checks below are not needed because it looks like if we pass
> > > NULL igt_key_file g_key_file_get_string will return NULL and
> > > g_key_file_get_integer will return 0 (that is previously initialized values
> > > are undisturbed).
> > >
> > > At the link below it is not clearly stated what happens when GKeyFile is
> > > NULL so I am mostly inferring from the way it is handling other error
> > > cases, so if we want to do this we'll probably need to test it out:
> >
> > If it's not documented to work that way, I'm wary of calling those
> > functions with NULL. It could behave differently in different versions
> > of glib.
> 
> OK, once again:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks, merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
