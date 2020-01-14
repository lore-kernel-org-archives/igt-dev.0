Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5506E2F2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 08:23:28 +0000 (UTC)
Date: Tue, 14 Jan 2020 10:23:25 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200114082325.GM25209@platvala-desk.ger.corp.intel.com>
References: <20200109183338.17164-1-bob.j.paauwe@intel.com>
 <157867216283.30836.10618289646905876948@emeril.freedesktop.org>
 <20200113113040.44cd7487@bpaauwe-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113113040.44cd7487@bpaauwe-desk1.amr.corp.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Nv?=
 =?utf-8?q?lor=5Fencoding=3A_Fix_up_support_for_XYUV_format=2E_=28rev2=29?=
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
To: Martin Peres <martin.peres@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 11:30:40AM -0800, Bob Paauwe wrote:
> On Fri, 10 Jan 2020 16:02:42 +0000
> Patchwork <patchwork@emeril.freedesktop.org> wrote:
> 
> > == Series Details ==
> > 
> > Series: lib/color_encoding: Fix up support for XYUV format. (rev2)
> > URL   : https://patchwork.freedesktop.org/series/70516/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from CI_DRM_7713_full -> IGTPW_3911_full
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_3911_full absolutely need
> > to be verified manually.
> >   
> >   If you think the reported changes have nothing to do with the
> > changes introduced in IGTPW_3911_full, please notify your bug team to
> > allow them to document this new failure mode, which will reduce false
> > positives in CI.
> > 
> >   External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/index.html
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in
> > IGTPW_3911_full:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@gem_exec_reloc@basic-wc-gtt-active:
> >     - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
> >    [1]:
> > https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7713/shard-snb6/igt@gem_exec_reloc@basic-wc-gtt-active.html
> > [2]:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3911/shard-snb2/igt@gem_exec_reloc@basic-wc-gtt-active.html
> 
> The XYUV patch is simply adding a new format to the supported format
> list.  I don't believe that gem_exec_reloc makes use of the format list
> at all so this patch should not be the cause of these possible
> regressions.


Martin, one for you then.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
