Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1666D6E0A1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 12:14:49 +0000 (UTC)
Date: Tue, 10 Mar 2020 14:14:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200310121445.GD13686@intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
 <20200307211751.22125-4-mohammed.khajapasha@intel.com>
 <87d09lnca7.fsf@intel.com>
 <1EBC98102E7E77409022937977AC68920C3E4633@BGSMSX110.gar.corp.intel.com>
 <878sk8oc32.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878sk8oc32.fsf@intel.com>
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 10:20:33AM +0200, Jani Nikula wrote:
> On Tue, 10 Mar 2020, "Khajapasha, Mohammed" <mohammed.khajapasha@intel.co=
m> wrote:
> > Are you saying, we should get rid of pipe enum and make it array index
> > based? Is my understanding correct?  At present, every IGT subtest
> > iterates over pipe list using "enum pipe" and this is getting passed
> > down.
> =

> I am saying do not conflate enum pipe and crtc index.
> =

> If you call something a pipe, it should be the pipe, not crtc index. And
> vice versa.
> =

> It gets really confusing really quick if you call something a pipe, and
> then go on to convert it into a pipe, as if it wasn't a pipe already.
> =

> In i915 we've removed all assumptions that pipe =3D=3D crtc index. So sho=
uld
> igt.

I tend to agree, especially as other hw doens't use the "pipe"
terminology, nor do they necessarily refer to them with A/B/C/...

The ugly part would be that we'd have maybe rename all tests with
a pipe in the name. Should we just use the crtc index as a bare
number in those cases?

This would also have some complications for being able to quickly =

see which pipe had a specific failure as you have to dig through
the logs to get that (though we'd anyway need to do that if the
pipes are fused off in a way that makes the crtc index not match
the pipe).

Also in some cases we may actually want to know which pipe we're
dealing with, but currently there is no convenient way for userspace
to find out which pipe maps to which crtc.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
