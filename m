Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBF6E5BF
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:32:06 +0000 (UTC)
Date: Thu, 30 Jan 2020 12:32:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200130103203.GW25209@platvala-desk.ger.corp.intel.com>
References: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
 <158034094513.5462.8180511184268816239@emeril.freedesktop.org>
 <0b8ec791-96cd-db8b-d81e-e458e58ca767@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b8ec791-96cd-db8b-d81e-e458e58ca767@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Add_SIGINT_injection?=
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 03:55:05PM -0800, Antonio Argenziano wrote:
> 
> 
> On 29/01/20 15:35, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: i915/gem_exec_reloc: Add SIGINT injection
> > URL   : https://patchwork.freedesktop.org/series/72745/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from IGT_5405 -> IGTPW_4036
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >    **FAILURE**
> > 
> >    Serious unknown changes coming with IGTPW_4036 absolutely need to be
> >    verified manually.
> >    If you think the reported changes have nothing to do with the changes
> >    introduced in IGTPW_4036, please notify your bug team to allow them
> >    to document this new failure mode, which will reduce false positives in CI.
> > 
> >    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
> > 
> > Possible new issues
> > -------------------
> > 
> >    Here are the unknown changes that may have been introduced in IGTPW_4036:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >    * igt@runner@aborted:
> >      - fi-bsw-nick:        NOTRUN -> [FAIL][1]
> >     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/fi-bsw-nick/igt@runner@aborted.html
> 
> I doubt this was caused by this patch, can I merge?


The thumb rule is to wait for full CI results (the CI.IGT results, aka shards) first anyway.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
