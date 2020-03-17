Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1B89AEB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 05:11:32 +0000 (UTC)
From: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Date: Tue, 17 Mar 2020 05:11:27 +0000
Message-ID: <1EBC98102E7E77409022937977AC68920C3EDCBE@BGSMSX110.gar.corp.intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
 <20200307211751.22125-4-mohammed.khajapasha@intel.com>
 <87d09lnca7.fsf@intel.com>
 <1EBC98102E7E77409022937977AC68920C3E4633@BGSMSX110.gar.corp.intel.com>
 <878sk8oc32.fsf@intel.com> <20200310121445.GD13686@intel.com>
In-Reply-To: <20200310121445.GD13686@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe value
 to print pipe name
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
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Jani
 Nikula <jani.nikula@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, March 10, 2020 5:45 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe valu=
e to
> print pipe name
> =

> On Tue, Mar 10, 2020 at 10:20:33AM +0200, Jani Nikula wrote:
> > On Tue, 10 Mar 2020, "Khajapasha, Mohammed"
> <mohammed.khajapasha@intel.com> wrote:
> > > Are you saying, we should get rid of pipe enum and make it array
> > > index based? Is my understanding correct?  At present, every IGT
> > > subtest iterates over pipe list using "enum pipe" and this is
> > > getting passed down.
> >
> > I am saying do not conflate enum pipe and crtc index.
> >
> > If you call something a pipe, it should be the pipe, not crtc index.
> > And vice versa.
> >
> > It gets really confusing really quick if you call something a pipe,
> > and then go on to convert it into a pipe, as if it wasn't a pipe alread=
y.
> >
> > In i915 we've removed all assumptions that pipe =3D=3D crtc index. So
> > should igt.
> =

> I tend to agree, especially as other hw doens't use the "pipe"
> terminology, nor do they necessarily refer to them with A/B/C/...
> =

> The ugly part would be that we'd have maybe rename all tests with a pipe
> in the name. Should we just use the crtc index as a bare number in those
> cases?

As per my understandings, yes, we need to use bare number of crtc index
to get the pipe in display->pipes[] array for for_each_pipe() macros.

> =

> This would also have some complications for being able to quickly see
> which pipe had a specific failure as you have to dig through the logs to =
get
> that (though we'd anyway need to do that if the pipes are fused off in a
> way that makes the crtc index not match the pipe).
> =

> Also in some cases we may actually want to know which pipe we're dealing
> with, but currently there is no convenient way for userspace to find out
> which pipe maps to which crtc.
>
In this patch series, we are able to map the kernel pipe to IGT pipe using
GET_PIPE_FROM_CRTC_ID ioctl, with this we are able to print the logs for fa=
ilure
pipes in  IGT.
 =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
