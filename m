Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2B16E357
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:20:00 +0000 (UTC)
Date: Wed, 22 Apr 2020 11:19:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200422081957.GC9497@platvala-desk.ger.corp.intel.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-2-juhapekka.heikkila@gmail.com>
 <20200422080227.GA9497@platvala-desk.ger.corp.intel.com>
 <d910f10f-e9e8-70bb-70d4-cca8b901a49b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d910f10f-e9e8-70bb-70d4-cca8b901a49b@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/params: add igt_params.c for
 module parameter access
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 11:13:43AM +0300, Juha-Pekka Heikkila wrote:
> On 22.4.2020 11.02, Petri Latvala wrote:
> > On Tue, Apr 21, 2020 at 07:17:18PM +0300, Juha-Pekka Heikkila wrote:
> > > From: Jani Nikula <jani.nikula@intel.com>
> > > 
> > > We have generic helpers for sysfs access in igt_sysfs.c, but we also
> > > have a number of module parameter access specific helpers scattered here
> > > and there. Start gathering the latter into a file of its own.
> > > 
> > > For i915, the long-term goal is to migrate from module parameters to
> > > device specific debugfs parameters. With all igt module param access
> > > centralized in one place, we can make the transition much easier.
> > > 
> > > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > 
> > 
> > This patch is just moving code around without functional changes,
> > correct?
> 
> Yes, it's correct. It's just buildup for those changes that follow in those
> other patches.

Alright. Code motion patches are impossible to determine to be just
code motion without magic eyes. :P

> 
> > 
> > 
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index e2060430..c9af0403 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -17,6 +17,7 @@ lib_sources = [
> > >   	'igt_halffloat.c',
> > >   	'igt_matrix.c',
> > >   	'igt_perf.c',
> > > +	'igt_params.c',
> > >   	'igt_primes.c',
> > >   	'igt_rand.c',
> > >   	'igt_rapl.c',
> > 
> > Alphabetical ordering is off-by-one here.
> 
> I'll rearrange.


With that done, slap in a

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
