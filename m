Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC7B89DB2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 10:53:20 +0000 (UTC)
Message-ID: <e8cff3ac1c5cf7b8f5f557017e4ff924d25413a4.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 23 Jul 2020 12:53:16 +0200
In-Reply-To: <20200723104634.GU20883@platvala-desk.ger.corp.intel.com>
References: <20200723102252.23677-1-janusz.krzysztofik@linux.intel.com>
 <20200723104634.GU20883@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/device_reset: Fix missing
 autotools support
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Marcin Bernatowicz <marcin.bernatowicz@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-07-23 at 13:46 +0300, Petri Latvala wrote:
> On Thu, Jul 23, 2020 at 12:22:52PM +0200, Janusz Krzysztofik wrote:
> > From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> > 
> > Updated Makefile.source to make device_reset test visible by autotools.
> > 
> > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks, pushe.

Janusz

> 
> 
> > ---
> >  tests/Makefile.sources | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index 0653c3d35..93d7768c4 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -22,6 +22,7 @@ TESTS_progs = \
> >  	core_setmaster \
> >  	core_setmaster_vs_auth \
> >  	debugfs_test \
> > +	device_reset \
> >  	dmabuf \
> >  	drm_import_export \
> >  	drm_mm \
> > -- 
> > 2.21.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
