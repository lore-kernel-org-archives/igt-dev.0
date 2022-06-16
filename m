Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AE710E906
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 17:44:25 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-fe32122311so2728547fac.7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220611203845.15118-1-juhapekka.heikkila@gmail.com>
 <165539167623.17457.16512838795415136619@emeril.freedesktop.org>
 <467794c6-b2a1-afeb-3846-2054d190ef97@gmail.com>
In-Reply-To: <467794c6-b2a1-afeb-3846-2054d190ef97@gmail.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 16 Jun 2022 20:44:12 +0300
Message-ID: <CAJ=qYWTV+OOH0ZyFfW=rQ==rKSni=07maD3xvkGpoqMHmiYwSQ@mail.gmail.com>
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000004336a405e19430cb"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
	=?utf-8?q?t=5Ffb=3A_Allow_XY=5FFAST=5FCOPY=5FBLT_on_DG2_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000004336a405e19430cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I accidentally had added Lakshmi in reply-to: instead of to: so here's
retry to reach Lakshmi :)

/Juha-Pekka

to 16. kes=C3=A4k. 2022 klo 18.41 Juha-Pekka Heikkila <
juhapekka.heikkila@gmail.com> kirjoitti:

> Hi Lakshmi,
>
> here would be false positive again, gem_exec_schedule on kbl cannot be
> affected by my change in any way.
>
> /Juha-Pekka
>
> On 16.6.2022 18.01, Patchwork wrote:
> > *Patch Details*
> > *Series:*     lib/igt_fb: Allow XY_FAST_COPY_BLT on DG2 (rev4)
> > *URL:*        https://patchwork.freedesktop.org/series/105025/
> > <https://patchwork.freedesktop.org/series/105025/>
> > *State:*      failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html
> > <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html>
> >
> >
> >   CI Bug Log - changes from CI_DRM_11766_full -> IGTPW_7323_full
> >
> >
> >     Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_7323_full absolutely need to =
be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_7323_full, please notify your bug team to allow the=
m
> > to document this new failure mode, which will reduce false positives in
> CI.
> >
> > External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html
> >
> >
> >     Participating hosts (12 -> 9)
> >
> > Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> >
> >
> >     Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_7323_full:
> >
> >
> >       IGT changes
> >
> >
> >         Possible regressions
> >
> >   * igt@gem_exec_schedule@wide@vecs0:
> >       o shard-kbl: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_=
exec_schedule@wide@vecs0.html
> >
> >         -> INCOMPLETE
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_ex=
ec_schedule@wide@vecs0.html
> >
> >
> >
> >         Suppressed
> >
> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> >
> >   * igt@perf@gen12-oa-tlb-invalidate:
> >       o {shard-rkl}: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@per=
f@gen12-oa-tlb-invalidate.html
> >
> >         -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@perf@=
gen12-oa-tlb-invalidate.html
> >
> >
> >
> >     Known issues
> >
> > Here are the changes found in IGTPW_7323_full that come from known
> issues:
> >
> >
> >       IGT changes
> >
> >
> >         Issues hit
> >
> >   *
> >
> >     igt@feature_discovery@chamelium:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@featu=
re_discovery@chamelium.html
> >
> >         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@featu=
re_discovery@chamelium.html
> >
> >         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827
> >)
> >
> >   *
> >
> >     igt@feature_discovery@display-3x:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@featu=
re_discovery@display-3x.html
> >
> >         (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/183=
9
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@featu=
re_discovery@display-3x.html
> >
> >         (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/183=
9
> >)
> >
> >   *
> >
> >     igt@gem_ctx_param@set-priority-not-supported:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_c=
tx_param@set-priority-not-supported.html
> >
> >         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
314
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_c=
tx_param@set-priority-not-supported.html
> >
> >         (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
314
> >)
> >
> >   *
> >
> >     igt@gem_ctx_persistence@engines-mixed-process:
> >
> >       o shard-snb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_ct=
x_persistence@engines-mixed-process.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#1099
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +1
> >         similar issue
> >   *
> >
> >     igt@gem_exec_balancer@parallel-bb-first:
> >
> >       o shard-iclb: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@gem=
_exec_balancer@parallel-bb-first.html
> >
> >         -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@gem_e=
xec_balancer@parallel-bb-first.html
> >
> >         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/452=
5
> >)
> >   *
> >
> >     igt@gem_exec_fair@basic-pace@rcs0:
> >
> >       o
> >
> >         shard-glk: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@gem_=
exec_fair@basic-pace@rcs0.html
> >
> >         -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk4/igt@gem_ex=
ec_fair@basic-pace@rcs0.html
> >
> >         (i915#2842
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +5
> >         similar issues
> >
> >       o
> >
> >         shard-kbl: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_=
exec_fair@basic-pace@rcs0.html
> >
> >         -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@gem_ex=
ec_fair@basic-pace@rcs0.html
> >
> >         (i915#2842
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@gem_exec_fair@basic-throttle@rcs0:
> >
> >       o shard-iclb: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@gem=
_exec_fair@basic-throttle@rcs0.html
> >
> >         -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gem_e=
xec_fair@basic-throttle@rcs0.html
> >
> >         (i915#2849 <https://gitlab.freedesktop.org/drm/intel/issues/284=
9
> >)
> >   *
> >
> >     igt@gem_huc_copy@huc-copy:
> >
> >       o shard-tglb: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb8/igt@gem=
_huc_copy@huc-copy.html
> >
> >         -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_h=
uc_copy@huc-copy.html
> >
> >         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/219=
0
> >)
> >   *
> >
> >     igt@gem_lmem_swapping@parallel-random:
> >
> >       o shard-apl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl7/igt@gem_lm=
em_swapping@parallel-random.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613
> >)
> >   *
> >
> >     igt@gem_pread@exhaustion:
> >
> >       o
> >
> >         shard-apl: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl3/igt@gem_pr=
ead@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gem_p=
read@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >       o
> >
> >         shard-glk: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk8/igt@gem_pr=
ead@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_p=
read@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >       o
> >
> >         shard-kbl: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@gem_pr=
ead@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >       o
> >
> >         shard-snb: NOTRUN -> WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_pr=
ead@exhaustion.html
> >
> >         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/265=
8
> >)
> >
> >   *
> >
> >     igt@gem_pxp@reject-modify-context-protection-on:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@gem_p=
xp@reject-modify-context-protection-on.html
> >
> >         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/427=
0
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@gem_p=
xp@reject-modify-context-protection-on.html
> >
> >         (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/427=
0
> >)
> >
> >   *
> >
> >     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@gem_r=
ender_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
> >
> >         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>=
)
> >   *
> >
> >     igt@gem_softpin@evict-single-offset:
> >
> >       o
> >
> >         shard-glk: NOTRUN -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk9/igt@gem_so=
ftpin@evict-single-offset.html
> >
> >         (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/417=
1
> >)
> >
> >       o
> >
> >         shard-kbl: NOTRUN -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_so=
ftpin@evict-single-offset.html
> >
> >         (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/417=
1
> >)
> >
> >   *
> >
> >     igt@gem_userptr_blits@coherency-sync:
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@gem_u=
serptr_blits@coherency-sync.html
> >
> >         (fdo#109290 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290
> >)
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@gem_u=
serptr_blits@coherency-sync.html
> >
> >         (fdo#110542 <https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542
> >)
> >
> >   *
> >
> >     igt@gem_userptr_blits@dmabuf-sync:
> >
> >       o shard-apl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@gem_us=
erptr_blits@dmabuf-sync.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323
> >)
> >   *
> >
> >     igt@gen3_mixed_blits:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@gen3_=
mixed_blits.html
> >
> >         (fdo#109289
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109289>) +2
> >         similar issues
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb6/igt@gen3_=
mixed_blits.html
> >
> >         (fdo#109289
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109289>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@gen9_exec_parse@unaligned-access:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gen9_=
exec_parse@unaligned-access.html
> >
> >         (i915#2527
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
> >         i915#2856
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
> >         similar issue
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gen9_=
exec_parse@unaligned-access.html
> >
> >         (i915#2856
> >         <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@i915_pm_dc@dc6-dpms:
> >
> >       o shard-iclb: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@i91=
5_pm_dc@dc6-dpms.html
> >
> >         -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@i915_=
pm_dc@dc6-dpms.html
> >
> >         (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>=
)
> >   *
> >
> >     igt@i915_pm_dc@dc9-dpms:
> >
> >       o shard-apl: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-apl6/igt@i915=
_pm_dc@dc9-dpms.html
> >
> >         -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@i915_p=
m_dc@dc9-dpms.html
> >
> >         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271
> >)
> >   *
> >
> >     igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@i915_=
pm_rpm@modeset-non-lpsp-stress-no-wait.html
> >
> >         (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
892
> >)
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@i915_=
pm_rpm@modeset-non-lpsp-stress-no-wait.html
> >
> >         (fdo#111644
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111644> /
> >         i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397=
>
> >         / i915#2411 <
> https://gitlab.freedesktop.org/drm/intel/issues/2411>)
> >
> >   *
> >
> >     igt@i915_pm_sseu@full-enable:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@i915_=
pm_sseu@full-enable.html
> >
> >         (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/438=
7
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@i915_=
pm_sseu@full-enable.html
> >
> >         (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/438=
7
> >)
> >
> >   *
> >
> >     igt@i915_selftest@live@hangcheck:
> >
> >       o shard-tglb: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb7/igt@i91=
5_selftest@live@hangcheck.html
> >
> >         -> DMESG-WARN
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@i915_=
selftest@live@hangcheck.html
> >
> >         (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/559=
1
> >)
> >   *
> >
> >     igt@kms_atomic@atomic_plane_damage:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_a=
tomic@atomic_plane_damage.html
> >
> >         (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/476=
5
> >)
> >   *
> >
> >     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@kms_b=
ig_fb@4-tiled-32bpp-rotate-90.html
> >
> >         (i915#5286
> >         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
> >         similar issue
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_b=
ig_fb@4-tiled-32bpp-rotate-90.html
> >
> >         (i915#5286
> >         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_b=
ig_fb@yf-tiled-16bpp-rotate-0.html
> >
> >         (fdo#111615
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111615>) +2
> >         similar issues
> >   *
> >
> >     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_b=
ig_fb@yf-tiled-8bpp-rotate-180.html
> >
> >         (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
723
> >)
> >   *
> >
> >     igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@kms_c=
cs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html
> >
> >         (fdo#111615
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111615> /
> >         i915#3689
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +3
> >         similar issues
> >   *
> >
> >     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@kms_c=
cs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html
> >
> >         (i915#6095
> >         <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +1
> >         similar issue
> >   *
> >
> >     igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_c=
cs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> >
> >         (i915#3689
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
> >         i915#3886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
> >         similar issue
> >
> >       o
> >
> >         shard-glk: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk7/igt@kms_cc=
s@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#3886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
> >         similar issue
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_c=
cs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> >
> >         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109278> /
> >         i915#3886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
> >         similar issue
> >
> >       o
> >
> >         shard-kbl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_cc=
s@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#3886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_c=
cs@pipe-b-random-ccs-data-y_tiled_ccs.html
> >
> >         (i915#3689
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +4
> >         similar issues
> >   *
> >
> >     igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
> >
> >       o shard-apl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@kms_cc=
s@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         i915#3886
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +3
> >         similar issues
> >   *
> >
> >     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_c=
cs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html
> >
> >         (i915#3689
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
> >         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095
> >)
> >   *
> >
> >     igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
> >
> >       o shard-apl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_cc=
s@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>) +162
> >         similar issues
> >   *
> >
> >     igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_c=
cs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
> >
> >         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109278>) +23
> >         similar issues
> >   *
> >
> >     igt@kms_chamelium@dp-hpd-enable-disable-mode:
> >
> >       o
> >
> >         shard-glk: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_ch=
amelium@dp-hpd-enable-disable-mode.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +8
> >         similar issues
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_c=
hamelium@dp-hpd-enable-disable-mode.html
> >
> >         (fdo#109284
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109284> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +7
> >         similar issues
> >
> >   *
> >
> >     igt@kms_chamelium@hdmi-edid-read:
> >
> >       o shard-snb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb4/igt@kms_ch=
amelium@hdmi-edid-read.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +8
> >         similar issues
> >   *
> >
> >     igt@kms_chamelium@vga-hpd:
> >
> >       o
> >
> >         shard-apl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl1/igt@kms_ch=
amelium@vga-hpd.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +13
> >         similar issues
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_c=
hamelium@vga-hpd.html
> >
> >         (fdo#109284
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109284> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +8
> >         similar issues
> >
> >   *
> >
> >     igt@kms_color@pipe-d-ctm-max:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_c=
olor@pipe-d-ctm-max.html
> >
> >         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109278> /
> >         i915#1149 <https://gitlab.freedesktop.org/drm/intel/issues/1149
> >)
> >   *
> >
> >     igt@kms_color_chamelium@pipe-a-ctm-max:
> >
> >       o shard-kbl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl7/igt@kms_co=
lor_chamelium@pipe-a-ctm-max.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271> /
> >         fdo#111827
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>) +8
> >         similar issues
> >   *
> >
> >     igt@kms_color_chamelium@pipe-d-degamma:
> >
> >       o shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_c=
olor_chamelium@pipe-d-degamma.html
> >
> >         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109278> /
> >         fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84>
> >         / fdo#111827 <
> https://bugs.freedesktop.org/show_bug.cgi?id=3D111827>)
> >   *
> >
> >     igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_c=
ursor_crc@pipe-a-cursor-512x512-random.html
> >
> >         (fdo#109279
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109279> /
> >         i915#3359
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +3
> >         similar issues
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_c=
ursor_crc@pipe-a-cursor-512x512-random.html
> >
> >         (fdo#109278
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109278> /
> >         fdo#109279
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109279>) +1
> >         similar issue
> >
> >   *
> >
> >     igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
> >
> >       o shard-kbl: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_cu=
rsor_crc@pipe-b-cursor-32x32-onscreen.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>) +84
> >         similar issues
> >   *
> >
> >     igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_c=
ursor_crc@pipe-b-cursor-max-size-sliding.html
> >
> >         (i915#3359
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
> >         similar issue
> >   *
> >
> >     igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_c=
ursor_crc@pipe-c-cursor-32x32-sliding.html
> >
> >         (i915#3319
> >         <https://gitlab.freedesktop.org/drm/intel/issues/3319>) +1
> >         similar issue
> >   *
> >
> >     igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
> >
> >       o shard-snb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb7/igt@kms_cu=
rsor_crc@pipe-d-cursor-512x170-random.html
> >
> >         (fdo#109271
> >         <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>) +144
> >         similar issues
> >   *
> >
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> >
> >       o shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_c=
ursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> >
> >         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/410=
3
> >)
> >   *
> >
> >     igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_d=
p_tiled_display@basic-test-pattern-with-chamelium.html
> >
> >         (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/352=
8
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_d=
p_tiled_display@basic-test-pattern-with-chamelium.html
> >
> >         (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/352=
8
> >)
> >
> >   *
> >
> >     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
> >
> >       o shard-glk: PASS
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@kms_=
draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
> >
> >         -> FAIL
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_dr=
aw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
> >
> >         (i915#1888
> >         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
> >         i915#5160 <https://gitlab.freedesktop.org/drm/intel/issues/5160
> >)
> >   *
> >
> >     igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
> >
> >       o
> >
> >         shard-tglb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@kms_d=
raw_crc@draw-method-rgb565-pwrite-4tiled.html
> >
> >         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/528=
7
> >)
> >
> >       o
> >
> >         shard-iclb: NOTRUN -> SKIP
> >         <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@kms_d=
raw_crc@draw-method-rg
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@kms_=
draw_crc@draw-method-rgb565-pwrite-4tiled.html>

--0000000000004336a405e19430cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I accidentally had added Lakshmi in reply-to: instea=
d of to: so here&#39;s retry to reach Lakshmi :)</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">/Juha-Pekka<br><br><div class=3D"gmail_quote" dir=
=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">to 16. kes=C3=A4k. 2022 klo=
 18.41 Juha-Pekka Heikkila &lt;<a href=3D"mailto:juhapekka.heikkila@gmail.c=
om">juhapekka.heikkila@gmail.com</a>&gt; kirjoitti:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi Lakshmi,<br>
<br>
here would be false positive again, gem_exec_schedule on kbl cannot be <br>
affected by my change in any way.<br>
<br>
/Juha-Pekka<br>
<br>
On 16.6.2022 18.01, Patchwork wrote:<br>
&gt; *Patch Details*<br>
&gt; *Series:*=C2=A0 =C2=A0 =C2=A0lib/igt_fb: Allow XY_FAST_COPY_BLT on DG2=
 (rev4)<br>
&gt; *URL:*=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://patchwork.freedes=
ktop.org/series/105025/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://patchwork.freedesktop.org/series/105025/</a> <br>
&gt; &lt;<a href=3D"https://patchwork.freedesktop.org/series/105025/" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.freedesktop.=
org/series/105025/</a>&gt;<br>
&gt; *State:*=C2=A0 =C2=A0 =C2=A0 failure<br>
&gt; *Details:* <br>
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/index.html</a> <br>
&gt; &lt;<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/ind=
ex.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7323/index.html</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0CI Bug Log - changes from CI_DRM_11766_full -&gt; IGTPW_73=
23_full<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Summary<br>
&gt; <br>
&gt; *FAILURE*<br>
&gt; <br>
&gt; Serious unknown changes coming with IGTPW_7323_full absolutely need to=
 be<br>
&gt; verified manually.<br>
&gt; <br>
&gt; If you think the reported changes have nothing to do with the changes<=
br>
&gt; introduced in IGTPW_7323_full, please notify your bug team to allow th=
em<br>
&gt; to document this new failure mode, which will reduce false positives i=
n CI.<br>
&gt; <br>
&gt; External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7323/index.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/index.html</a><br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Participating hosts (12 -&gt; 9)<br>
&gt; <br>
&gt; Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Possible new issues<br>
&gt; <br>
&gt; Here are the unknown changes that may have been introduced in <br>
&gt; IGTPW_7323_full:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT changes<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Possible regressions<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* igt@gem_exec_schedule@wide@vecs0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-kbl: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_schedule@wide@vecs0=
.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_schedule@wide@vec=
s0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; INCOMPLETE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_exec_schedule@wide@vecs0.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_exec_schedule@wide@vecs0.h=
tml</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Suppressed<br>
&gt; <br>
&gt; The following results come from untrusted machines, tests, or statuses=
.<br>
&gt; They do not affect the overall result.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* igt@perf@gen12-oa-tlb-invalidate:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o {shard-rkl}: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@perf@gen12-oa-tlb-invalidat=
e.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11766/shard-rkl-2/igt@perf@gen12-oa-tlb-invali=
date.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate=
.html</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Known issues<br>
&gt; <br>
&gt; Here are the changes found in IGTPW_7323_full that come from known iss=
ues:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IGT changes<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Issues hit<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@feature_discovery@chamelium:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@chamelium.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@chamelium.h=
tml</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#111827 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@feature_discovery@chamelium.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@feature_discovery@chamelium.h=
tml</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#111827 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@feature_discovery@display-3x:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@display-3x.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@feature_discovery@display-3x=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#1839 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1839" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/1839</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@feature_discovery@display-3x.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@feature_discovery@display-3x=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#1839 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1839" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/1839</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_ctx_param@set-priority-not-supported:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_ctx_param@set-priority-no=
t-supported.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_ctx_param@se=
t-priority-not-supported.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109314 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109314" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109314</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_ctx_param@set-priority-no=
t-supported.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_ctx_param@se=
t-priority-not-supported.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109314 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109314" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109314</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_ctx_persistence@engines-mixed-process:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-snb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_ctx_persistence@engines-mi=
xed-process.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_ctx_persisten=
ce@engines-mixed-process.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#1099<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1099" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/1099</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_exec_balancer@parallel-bb-first:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@gem_exec_balancer@parallel-=
bb-first.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@gem_exec_balancer=
@parallel-bb-first.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@gem_exec_balancer@parallel-bb=
-first.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@gem_exec_balancer@par=
allel-bb-first.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4525 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4525" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4525</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_exec_fair@basic-pace@rcs0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@gem_exec_fair@basic-pace@rcs=
0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@gem_exec_fair@basic-pace@=
rcs0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2842<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2842" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/2842</a>&gt;) +5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs=
0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11766/shard-kbl1/igt@gem_exec_fair@basic-pace@=
rcs0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2842<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2842" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/2842</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_exec_fair@basic-throttle@rcs0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@gem_exec_fair@basic-throttl=
e@rcs0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-iclb8/igt@gem_exec_fair@basic=
-throttle@rcs0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gem_exec_fair@basic-throttle@=
rcs0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gem_exec_fair@basic-thr=
ottle@rcs0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2849 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2849" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2849</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_huc_copy@huc-copy:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-tglb8/igt@gem_huc_copy@huc-copy.html"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_11766/shard-tglb8/igt@gem_huc_copy@huc-copy.html</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_huc_copy@huc-copy.html" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7323/shard-tglb6/igt@gem_huc_copy@huc-copy.html</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2190 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2190" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2190</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_lmem_swapping@parallel-random:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-apl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl7/igt@gem_lmem_swapping@parallel-ran=
dom.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl7/igt@gem_lmem_swapping@paralle=
l-random.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#4613 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4613" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4613</a>&gt;=
)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_pread@exhaustion:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl3/igt@gem_pread@exhaustion.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-apl3/igt@gem_pread@exhaustion.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gem_pread@exhaustion.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7323/shard-tglb3/igt@gem_pread@exhaustion.html</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk8/igt@gem_pread@exhaustion.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-glk8/igt@gem_pread@exhaustion.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_pread@exhaustion.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7323/shard-iclb5/igt@gem_pread@exhaustion.html</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@gem_pread@exhaustion.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-kbl4/igt@gem_pread@exhaustion.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-snb: NOTRUN -&gt; WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-snb2/igt@gem_pread@exhaustion.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-snb2/igt@gem_pread@exhaustion.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2658 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2658" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2658</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_pxp@reject-modify-context-protection-on:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@gem_pxp@reject-modify-context=
-protection-on.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@gem_pxp@rejec=
t-modify-context-protection-on.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4270 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4270" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4270</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@gem_pxp@reject-modify-context=
-protection-on.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@gem_pxp@rejec=
t-modify-context-protection-on.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4270 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4270" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4270</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@gem_render_copy@y-tiled-mc-cc=
s-to-yf-tiled-ccs.html" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb4/igt@gem_render=
_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#768 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/768" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/768</a>&gt;)<=
br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_softpin@evict-single-offset:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk9/igt@gem_softpin@evict-single-offse=
t.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7323/shard-glk9/igt@gem_softpin@evict-single-of=
fset.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4171 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4171" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4171</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_softpin@evict-single-offse=
t.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7323/shard-kbl1/igt@gem_softpin@evict-single-of=
fset.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4171 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4171" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4171</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_userptr_blits@coherency-sync:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@gem_userptr_blits@coherency-s=
ync.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@gem_userptr_blits@cohere=
ncy-sync.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109290 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109290" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109290</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@gem_userptr_blits@coherency-s=
ync.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@gem_userptr_blits@cohere=
ncy-sync.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#110542 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D110542" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D110542</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gem_userptr_blits@dmabuf-sync:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-apl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@gem_userptr_blits@dmabuf-sync=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3323 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3323" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/3323</a>&gt;=
)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gen3_mixed_blits:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@gen3_mixed_blits.html" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7323/shard-tglb7/igt@gen3_mixed_blits.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109289<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109289" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109289</a>&gt;) +2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb6/igt@gen3_mixed_blits.html" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7323/shard-iclb6/igt@gen3_mixed_blits.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109289<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109289" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109289</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@gen9_exec_parse@unaligned-access:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gen9_exec_parse@unaligned-acc=
ess.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@gen9_exec_parse@unaligne=
d-access.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2527<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2527" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/2527</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#2856<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2856" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/2856</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gen9_exec_parse@unaligned-acc=
ess.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@gen9_exec_parse@unaligne=
d-access.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#2856<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2856" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/2856</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@i915_pm_dc@dc6-dpms:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_11766/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#454 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/454" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/454</a>&gt;)<=
br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@i915_pm_dc@dc9-dpms:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-apl: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-apl6/igt@i915_pm_dc@dc9-dpms.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_11766/shard-apl6/igt@i915_pm_dc@dc9-dpms.html</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@i915_pm_dc@dc9-dpms.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7323/shard-apl8/igt@i915_pm_dc@dc9-dpms.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>=
&gt;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@i915_pm_rpm@m=
odeset-non-lpsp-stress-no-wait.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#110892 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D110892" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D110892</a>=
&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@i915_pm_rpm@m=
odeset-non-lpsp-stress-no-wait.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#111644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111644" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111644</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#1397 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1397" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/1397</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ i915#2411 &lt;<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2411" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/2411</a>&g=
t;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@i915_pm_sseu@full-enable:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@i915_pm_sseu@full-enable.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@i915_pm_sseu@full-enable.html</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4387 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4387" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4387</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@i915_pm_sseu@full-enable.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@i915_pm_sseu@full-enable.html</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4387 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4387" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4387</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@i915_selftest@live@hangcheck:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-tglb7/igt@i915_selftest@live@hangchec=
k.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11766/shard-tglb7/igt@i915_selftest@live@hangc=
heck.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@i915_selftest@live@hangcheck.=
html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@i915_selftest@live@hangcheck=
.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#5591 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5591" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/5591</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_atomic@atomic_plane_damage:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_atomic@atomic_plane_damag=
e.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_atomic@atomic_plane_da=
mage.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4765 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4765" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4765</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_big_fb@4-tiled-32bpp-rotate-90:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb1/igt@kms_big_fb@4-tiled-32b=
pp-rotate-90.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#5286<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5286" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/5286</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_big_fb@4-tiled-32b=
pp-rotate-90.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#5286<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5286" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/5286</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_big_fb@yf-tiled-16bpp-rotate-0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_big_fb@yf-tiled-16=
bpp-rotate-0.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#111615<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111615" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111615</a>&gt;) +2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_big_fb@yf-tiled-8bpp-rotate-180:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-180.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_big_fb@yf-tiled-8=
bpp-rotate-180.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#110723 &lt;<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D110723" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D110723</a>=
&gt;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tile=
d_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-ro=
tation-180-yf_tiled_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb2/igt@kms_=
ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#111615<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111615" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111615</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3689<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3689</a>&gt;) +3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc=
_ccs_cc:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-ba=
sic-4_tiled_dg2_rc_ccs_cc.html" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb8/igt@km=
s_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#6095<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/6095</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12=
_mc_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_ccs@pipe-b-missing-ccs-bu=
ffer-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@km=
s_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3689<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3689</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3886<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3886</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk7/igt@kms_ccs@pipe-b-missing-ccs-buf=
fer-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk7/igt@kms_=
ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3886<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3886</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_ccs@pipe-b-missing-ccs-bu=
ffer-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@km=
s_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109278</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3886<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3886</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buf=
fer-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_=
ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3886<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3886</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_ccs@pipe-b-random-ccs-dat=
a-y_tiled_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb6/igt@kms_ccs@pipe-b=
-random-ccs-data-y_tiled_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3689<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3689</a>&gt;) +4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_=
mc_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-apl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-bas=
ic-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl6/igt@kms_c=
cs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3886<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3886</a>&gt;) +3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_=
dg2_mc_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-pla=
nes-basic-4_tiled_dg2_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt=
@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3689<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3689</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#6095 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/6095" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/6095</a>&gt;=
)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_m=
c_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-apl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_ccs@pipe-d-bad-pixel-forma=
t-y_tiled_gen12_mc_ccs.html" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-apl8/igt@kms_cc=
s@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt;) +162<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled=
_dg2_rc_ccs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb7/igt@kms_ccs@pipe-d-crc-primary-ro=
tation-180-4_tiled_dg2_rc_ccs.html" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb7/ig=
t@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109278</a>&gt;) +23<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_chamelium@dp-hpd-enable-disable-mode:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_chamelium@dp-hpd-enable-di=
sable-mode.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_chamelium@dp-h=
pd-enable-disable-mode.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_chamelium@dp-hpd-enable-d=
isable-mode.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_chamelium@dp=
-hpd-enable-disable-mode.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109284<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109284" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109284</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_chamelium@hdmi-edid-read:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-snb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-snb4/igt@kms_chamelium@hdmi-edid-read.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-snb4/igt@kms_chamelium@hdmi-edid-read.h=
tml</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_chamelium@vga-hpd:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-apl1/igt@kms_chamelium@vga-hpd.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7323/shard-apl1/igt@kms_chamelium@vga-hpd.html</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +13<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_chamelium@vga-hpd.html" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_chamelium@vga-hpd.html</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109284<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109284" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109284</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_color@pipe-d-ctm-max:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_color@pipe-d-ctm-max.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7323/shard-iclb8/igt@kms_color@pipe-d-ctm-max.html</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109278</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#1149 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1149" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/1149</a>&gt;=
)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_color_chamelium@pipe-a-ctm-max:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-kbl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm=
-max.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl7/igt@kms_color_chamelium@pipe=
-a-ctm-max.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#111827<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a>&gt;) +8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_color_chamelium@pipe-d-degamma:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_color_chamelium@pipe-d-de=
gamma.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_color_chamelium@pi=
pe-d-degamma.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109278</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#109284 &lt;<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109284" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109284</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ fdo#111827 &lt;<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D111827</a=
>&gt;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_crc@pipe-a-cursor-512x512-random:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-=
512x512-random.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_cr=
c@pipe-a-cursor-512x512-random.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109279<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109279</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#3359<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3359" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3359</a>&gt;) +3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-=
512x512-random.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_cursor_cr=
c@pipe-a-cursor-512x512-random.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109278<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109278</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdo#109279<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109279</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-kbl: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-3=
2x32-onscreen.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-kbl4/igt@kms_cursor_crc@=
pipe-b-cursor-32x32-onscreen.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt;) +84<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-=
max-size-sliding.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_=
crc@pipe-b-cursor-max-size-sliding.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3359<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3359" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3359</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-=
32x32-sliding.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb7/igt@kms_cursor_crc=
@pipe-c-cursor-32x32-sliding.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3319<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3319" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/3319</a>&gt;) +1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issue<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_crc@pipe-d-cursor-512x170-random:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-snb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-snb7/igt@kms_cursor_crc@pipe-d-cursor-5=
12x170-random.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-snb7/igt@kms_cursor_crc@=
pipe-d-cursor-512x170-random.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt;) +144<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similar issues<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_cursor_legacy@basic-busy-flip-before-cursor=
-varying-size:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#4103 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4103" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/4103</a>&gt=
;)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_dp_tiled_display@basic-test-pattern-with-ch=
amelium:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@kms_dp_tiled_display@basic-te=
st-pattern-with-chamelium.html" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb3/igt@km=
s_dp_tiled_display@basic-test-pattern-with-chamelium.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3528 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3528" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/3528</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@kms_dp_tiled_display@basic-te=
st-pattern-with-chamelium.html" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb5/igt@km=
s_dp_tiled_display@basic-test-pattern-with-chamelium.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#3528 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3528" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/3528</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o shard-glk: PASS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@kms_draw_crc@draw-method-rgb=
565-mmap-gtt-xtiled.html" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11766/shard-glk9/igt@kms_dra=
w_crc@draw-method-rgb565-mmap-gtt-xtiled.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_draw_crc@draw-method-rgb56=
5-mmap-gtt-xtiled.html" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-glk2/igt@kms_draw_cr=
c@draw-method-rgb565-mmap-gtt-xtiled.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#1888<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1888" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/drm/intel/issues/1888</a>&gt; /<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i915#5160 &lt;<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5160" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/5160</a>&gt;=
)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@kms_draw_crc@draw-method-rgb5=
65-pwrite-4tiled.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-tglb5/igt@kms_draw_cr=
c@draw-method-rgb565-pwrite-4tiled.html</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#5287 &lt;<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5287" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/drm/intel/issues/5287</a>&gt=
;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0o<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt; SKIP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@kms_draw_crc@draw-method-rgb5=
65-pwrite-4tiled.html" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7323/shard-iclb1/igt@kms_draw_cr=
c@draw-method-rg</a></blockquote></div></div></div>

--0000000000004336a405e19430cb--
