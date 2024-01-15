Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9284510E012
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jan 2024 15:21:50 +0000 (UTC)
Date: Mon, 15 Jan 2024 16:21:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/2] build: Build xe tests by default
Message-ID: <20240115152146.gfbx6qs5wb743kra@kamilkon-desk.igk.intel.com>
References: <20240111213358.1656641-1-lucas.demarchi@intel.com>
 <20240115081517.059f5ca1@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240115081517.059f5ca1@maurocar-mobl2>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,
On 2024-01-15 at 08:15:17 +0100, Mauro Carvalho Chehab wrote:
> On Thu, 11 Jan 2024 13:33:57 -0800
> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> 
> > Swap the default value so xe tests are built by default. Once CI and
> > others are adapted, then the option can be removed.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 

I merged first patch,

Regards,
Kamil

> > ---
> >  meson_options.txt | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meson_options.txt b/meson_options.txt
> > index 12b5bb3c3..6a9493ea6 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -37,15 +37,10 @@ option('tests',
> >         type : 'feature',
> >         description : 'Build tests')
> >  
> > -# Currently, Xe uAPI is not stable: it may still change while the driver is
> > -# not merged upstream.
> > -# So, add an option to enable it, as distros shall not be shipping
> > -# binaries with Xe tests on it, as they will most certainly fail once
> > -# drivers get upstreamed.
> >  option('xe_driver',
> >         type : 'feature',
> > -       value : 'disabled',
> > -       description : 'Build tests for Xe driver (experimental)')
> > +       value : 'enabled',
> > +       description : 'Build tests for Xe driver')
> >  
> >  option('libdrm_drivers',
> >         type : 'array',

