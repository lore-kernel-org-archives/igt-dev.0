Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFAF89798
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 11:01:08 +0000 (UTC)
Date: Mon, 9 Mar 2020 13:01:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200309110105.GZ3839@platvala-desk.ger.corp.intel.com>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
 <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
 <20200306142806.GY3839@platvala-desk.ger.corp.intel.com>
 <CACvgo523NjixBgqZL9naqmga4XtxRkSRUB8rukL9wfVWePwETg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo523NjixBgqZL9naqmga4XtxRkSRUB8rukL9wfVWePwETg@mail.gmail.com>
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 04:32:19PM +0000, Emil Velikov wrote:
> On Fri, 6 Mar 2020 at 14:28, Petri Latvala <petri.latvala@intel.com> wrote:
> 
> > It is _extremely_ likely that we (i915 CI) could sometimes run
> > igt@i915_module_load@reload right before this test. Or
> > igt@i915_selftest@live. When we do, there's no /dev/dri/card0 at the
> > time of chmodding but is at the time of __drm_open_driver().
> >
> If I understand you correctly, if a test which does rmmod/modprobe
> fails, the CI will still continue to run other tests.

It's worse than that. All subtests of i915_module_load except @reload
leave the module unloaded also on _success_. i915_selftest likewise
leaves the module unloaded. If they loaded the module back on success,
running module loading tests back-to-back would do an additional
module reload roundtrip.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
