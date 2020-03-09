Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4FB6E462
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 13:54:23 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id n6so6046932vsc.3
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Mar 2020 06:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
 <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
 <20200306142806.GY3839@platvala-desk.ger.corp.intel.com>
 <CACvgo523NjixBgqZL9naqmga4XtxRkSRUB8rukL9wfVWePwETg@mail.gmail.com>
 <20200309110105.GZ3839@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200309110105.GZ3839@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Mar 2020 13:53:39 +0000
Message-ID: <CACvgo50sRg_Cbn9Jv48cxMo2WvNjn4T8249ybvchmEBuvmfPvA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] ts/core_setmaster: new test for
 drop/set master semantics
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
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 9 Mar 2020 at 11:01, Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Fri, Mar 06, 2020 at 04:32:19PM +0000, Emil Velikov wrote:
> > On Fri, 6 Mar 2020 at 14:28, Petri Latvala <petri.latvala@intel.com> wrote:
> >
> > > It is _extremely_ likely that we (i915 CI) could sometimes run
> > > igt@i915_module_load@reload right before this test. Or
> > > igt@i915_selftest@live. When we do, there's no /dev/dri/card0 at the
> > > time of chmodding but is at the time of __drm_open_driver().
> > >
> > If I understand you correctly, if a test which does rmmod/modprobe
> > fails, the CI will still continue to run other tests.
>
> It's worse than that. All subtests of i915_module_load except @reload
> leave the module unloaded also on _success_. i915_selftest likewise
> leaves the module unloaded. If they loaded the module back on success,
> running module loading tests back-to-back would do an additional
> module reload roundtrip.
>
Ouch, this sounds pretty nasty....

Pretty much all other tests ensure the state is restored as original upon exit.
So it would make sense to fix these by adding modprobe as a closing fixture.

Regardless, v4 [1] has the close(open(...)) workaround which should
cater for this.

Thanks again for the time in explaining these IGT subtleties.
-Emil

[1] https://lists.freedesktop.org/archives/igt-dev/2020-March/021081.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
