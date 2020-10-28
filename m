Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E596E233
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2020 07:37:59 +0000 (UTC)
Date: Wed, 28 Oct 2020 09:37:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201028073751.GB7444@platvala-desk.ger.corp.intel.com>
References: <20201023231151.383909-1-jose.souza@intel.com>
 <20201026083456.GW7444@platvala-desk.ger.corp.intel.com>
 <1d7e9b6870961ee2904405dcd1f2f854498337ce.camel@intel.com>
 <20201027084934.GZ7444@platvala-desk.ger.corp.intel.com>
 <5b9297d93e06ae0bd8ae19e395d1e88bc3755fe9.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b9297d93e06ae0bd8ae19e395d1e88bc3755fe9.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Skip frontbuffer
 test in TGL
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 07:07:14PM +0200, Souza, Jose wrote:
> On Tue, 2020-10-27 at 10:49 +0200, Petri Latvala wrote:
> > On Mon, Oct 26, 2020 at 07:47:15PM +0200, Souza, Jose wrote:
> > > On Mon, 2020-10-26 at 10:34 +0200, Petri Latvala wrote:
> > > > On Fri, Oct 23, 2020 at 04:11:51PM -0700, Jos=E9 Roberto de Souza w=
rote:
> > > > > Due the commit 71c1a4998320 ("drm/i915/tgl/psr: Fix glitches when
> > > > > doing frontbuffer modifications"), frontbuffer test is expected to
> > > > > fail on TGL, so here skiping this test on TGL.
> > > > > When PSR issues is fixed the patch above will be reverted and we
> > > > > can revert this skip too.
> > > > =

> > > > How does the previous failure behave? I mean in the sense that what
> > > > does this skip gain? The skip will have to be cibuglog-filtered too=
 so
> > > > no gain on that side.
> > > > =

> > > > Did the fail kill the machine, or is this just for saving runtime?
> > > =

> > > Just saving time.
> > > So no need for it?
> > =

> > Depends on the amount. Do you have numbers for this? I guess if it
> > saves entire minutes it becomes worth it.
> > =

> > =

> =

> Takes about one second when fails a little less when it was passing on TG=
L.
> Just want to avoid a new freedesktop issue to be filed, we are tracking t=
he right kernel fix in Jira. =


Skip would also need a new fdo issue on platforms >=3D ICL. Let's just let =
it fail.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
