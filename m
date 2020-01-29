Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806606E391
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 13:39:31 +0000 (UTC)
Date: Wed, 29 Jan 2020 15:39:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200129133927.GT25209@platvala-desk.ger.corp.intel.com>
References: <20200128114801.12282-1-petri.latvala@intel.com>
 <158022544274.20534.12830596180736565523@emeril.freedesktop.org>
 <158022697117.2129.13610280385807886022@skylake-alporthouse-com>
 <20200129132449.GS25209@platvala-desk.ger.corp.intel.com>
 <158030448468.11197.16540157364945457011@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158030448468.11197.16540157364945457011@skylake-alporthouse-com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Make_sure_output_is__still_collected_when_killing_test_due_?=
 =?utf-8?q?to_taint?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 01:28:04PM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-01-29 13:24:49)
> > On Tue, Jan 28, 2020 at 03:56:11PM +0000, Chris Wilson wrote:
> > > Quoting Patchwork (2020-01-28 15:30:42)
> > > > == Series Details ==
> > > > 
> > > > Series: runner: Make sure output is still collected when killing test due to taint
> > > > URL   : https://patchwork.freedesktop.org/series/72657/
> > > > State : success
> > > > 
> > > > == Summary ==
> > > > 
> > > > CI Bug Log - changes from IGT_5394 -> IGTPW_4016
> > > > ====================================================
> > > > 
> > > > Summary
> > > > -------
> > > > 
> > > >   **WARNING**
> > > > 
> > > >   Minor unknown changes coming with IGTPW_4016 need to be verified
> > > >   manually.
> > > >   
> > > >   If you think the reported changes have nothing to do with the changes
> > > >   introduced in IGTPW_4016, please notify your bug team to allow them
> > > >   to document this new failure mode, which will reduce false positives in CI.
> > > > 
> > > >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/index.html
> > > > 
> > > > Possible new issues
> > > > -------------------
> > > > 
> > > >   Here are the unknown changes that may have been introduced in IGTPW_4016:
> > > > 
> > > > ### IGT changes ###
> > > > 
> > > > #### Warnings ####
> > > > 
> > > >   * igt@gem_exec_suspend@basic-s3:
> > > >     - fi-cml-s:           [FAIL][1] ([fdo#103375]) -> [TIMEOUT][2]
> > > >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
> > > >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
> > > 
> > > Incomplete or Timeout?
> > > 
> > > Starting subtest: basic-S3
> > > [160.045053] Killing the test because the kernel is tainted.
> > > [160.119964] Aborting: Kernel badly tainted (0x240) (check dmesg for details):
> > >       (0x200) TAINT_WARN: WARN_ON has happened.
> > > 
> > > I'd rather have stern purple than whimsical blue.
> > 
> > I can probably make that happen and it's almost going to be easy.
> > 
> > Do you mind if I do it in a followup patch though? I'd like to get
> > this in, the questions about incomplete output are increasing every
> > day...
> 
> Sure. Could we also ticking down earlier i.e. periodic taint checking?


A possibility, yes.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
