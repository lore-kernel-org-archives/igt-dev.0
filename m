Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6948B6ED46
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 16:32:59 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id n6so1914190vsc.3
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Mar 2020 08:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
 <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
 <20200306142806.GY3839@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200306142806.GY3839@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 6 Mar 2020 16:32:19 +0000
Message-ID: <CACvgo523NjixBgqZL9naqmga4XtxRkSRUB8rukL9wfVWePwETg@mail.gmail.com>
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

On Fri, 6 Mar 2020 at 14:28, Petri Latvala <petri.latvala@intel.com> wrote:

> It is _extremely_ likely that we (i915 CI) could sometimes run
> igt@i915_module_load@reload right before this test. Or
> igt@i915_selftest@live. When we do, there's no /dev/dri/card0 at the
> time of chmodding but is at the time of __drm_open_driver().
>
If I understand you correctly, if a test which does rmmod/modprobe
fails, the CI will still continue to run other tests.

Personally it seems to me that any follow-up tests would be
'incorrect' or misleading at the very least.
As such I imagined that the CI will stop at this point.

If that's doable and something people are interested in, as follow-up
one can drop the implicit modprobe from _all_ the drm_open_driver()
calls. Thus getting IGT coverage closer to a real-world use-case - aka
udev does the loading.

Either way, all of this is a brain dump which illustrates my confusion
on the topic.
Thanks a million for the help.

Will send v4 with the workaround + a comment in a moment.

-Emil
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
