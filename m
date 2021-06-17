Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD716E872
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 03:55:12 +0000 (UTC)
Date: Thu, 17 Jun 2021 06:57:06 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMrIEmrRM2hYb2Ay@platvala-desk.ger.corp.intel.com>
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-19-jason@jlekstrand.net>
 <87o8c65ywy.wl-ashutosh.dixit@intel.com>
 <87mtrq5xsl.wl-ashutosh.dixit@intel.com>
 <87lf7a5xgo.wl-ashutosh.dixit@intel.com>
 <CAOFGe95WwmW4f378aO9Wa3RE=e014cgWJuNNGPsAoNbphN79Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95WwmW4f378aO9Wa3RE=e014cgWJuNNGPsAoNbphN79Jg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 68/77] igt/dummyload: Require an
 intel_ctx_t for POLL_RUN and !ALL_ENGINES
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 12:30:42PM -0500, Jason Ekstrand wrote:
> On Tue, Jun 15, 2021 at 9:56 PM Dixit, Ashutosh
> <ashutosh.dixit@intel.com> wrote:
> >
> > On Tue, 15 Jun 2021 19:49:14 -0700, Dixit, Ashutosh wrote:
> > >
> > > I have another related question/observation. If what I am saying above is
> > > indeed true, is the "ctx_id" field in "struct igt_spin_factory" ever
> > > really used? If not we should delete it from the struct and we can get rid
> > > of these asserts.
> > >
> > > This is because I am saying above that we have an igt_assert(opts->ctx)
> > > above in igt_spin_factory() when "opts->engine != ALL_ENGINES" and then we
> > > have another igt_assert(opts->ctx) in emit_recursive_batch() when
> > > "opts->engine == ALL_ENGINES". So it appears we must always have
> > > intel_ctx_t and can never use the "ctx_id" field in "struct
> > > igt_spin_factory" so it should be removed.
> > >
> > > So appears the spinner interface will always need a intel_ctx_t (meaning
> > > more code changes).
> >
> > Sorry for harping on this again. Note that even with the code in this
> > series test like igt@gem_ctx_exec@norecovery (which have not been modified)
> > should now be broken. The code in this series is:
> 
> Yup.  That was a miss.  Not sure why CI didn't catch it.

The reason is

tests/intel-ci/blacklist.txt:igt@gem_ctx_exec@(?!.*basic).*


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
