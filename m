Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B7510E8E8
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 09:52:03 +0000 (UTC)
Date: Wed, 26 Apr 2023 11:51:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230426095159.wzcisbirlapkb5bj@zkempczy-mobl2>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-6-zbigniew.kempczynski@intel.com>
 <36a8416f-ba25-555d-3453-1634cd85d868@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36a8416f-ba25-555d-3453-1634cd85d868@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 05/15] lib/drmtest: Add driver enum
 for i915/xe
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

On Wed, Apr 26, 2023 at 10:23:00AM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 25.04.2023 17:40, Zbigniew Kempczyński wrote:
> > Library code like intel-bb and intel-buf which requires adoption
> > to handle both drivers should store driver on which fd they are
> > working on instead of calling costful is_i915/xe_device() helper.
> > 
> > Introduce intel_driver enum which will be used on library code
> > adoption to Xe.
> 
> Agree - this is a better place than intel_batchbuffer.
> 
> But then the question arises - how does this relate to the 'DRIVER_INTEL'
> and 'DRIVER_XE' value above? Looks like we could use those values instead.

Above values are not related to enum I introduced. I wanted to have enum
as compiler may check you're using valid values (like in switch() for ex.).

--
Zbigniew


> 
> Christoph
> 
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/drmtest.h | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 5878f65129..3c88b85c6f 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -62,6 +62,14 @@
> >    */
> >   #define DRIVER_ANY 	~(DRIVER_VGEM)
> > +/*
> > + * Compile friendly enum for i915/xe.
> > + */
> > +enum intel_driver {
> > +	INTEL_DRIVER_I915 = 1,
> > +	INTEL_DRIVER_XE,
> > +};
> > +
> >   void __set_forced_driver(const char *name);
> >   /**
