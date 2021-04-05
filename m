Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B8289C60
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Apr 2021 18:37:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b4so18758830lfi.6
 for <igt-dev@lists.freedesktop.org>; Mon, 05 Apr 2021 11:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210323150851.209365-1-markyacoub@chromium.org>
 <161661819759.19037.1754458381205940638@emeril.freedesktop.org>
 <CAJUqKUogsmr9RV-UraSN72ab4pGtPRxSpvNWCknnQ29RJ_8wcA@mail.gmail.com>
 <YF2opaUVX77vBIlE@platvala-desk.ger.corp.intel.com>
 <ef102442b3534e66a80f546244ee6651@intel.com>
 <CAC0gqY7q=+L+-jp22nmAX56WGdPxto0ALqF8v3q5jovoSK77rw@mail.gmail.com>
 <YGHh7upi7TGqEQvI@platvala-desk.ger.corp.intel.com>
 <CAC0gqY6-5+KCWSV5Ksm81BCE4LqZyQA3HkmZB-BD7X75L2jkSA@mail.gmail.com>
In-Reply-To: <CAC0gqY6-5+KCWSV5Ksm81BCE4LqZyQA3HkmZB-BD7X75L2jkSA@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 5 Apr 2021 14:36:53 -0400
Message-ID: <CAJUqKUpi3W9uP2T2-ibkr4wCgezeZvd53w0uJhFQqOpNN=+SiQ@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fatomic=5Ftransition=3A_Enable_Primary_Plane_on_Ena?=
	=?utf-8?q?bling_CRTC=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0739167085=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Mark Yacoub <markyacoub@google.com>, Petri Latvala <petri.latvala@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0739167085==
Content-Type: multipart/alternative; boundary="000000000000f0652e05bf3dfbe4"

--000000000000f0652e05bf3dfbe4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"friendly ping"

On Mon, Mar 29, 2021 at 10:24 AM Mark Yacoub <markyacoub@google.com> wrote:

> Awesome perfect! Glad it's ready for review.
>
> On Mon, Mar 29, 2021 at 10:18 AM Petri Latvala <petri.latvala@intel.com>
> wrote:
> >
> > On Mon, Mar 29, 2021 at 10:10:48AM -0400, Mark Yacoub wrote:
> > > Hi Lakshmi, is it still re-reported as false positive?
> >
> >
> > It's now showing as a success.
> >
> >
> > --
> > Petri Latvala
> >
> >
> >
> > >
> > > On Fri, Mar 26, 2021 at 1:39 PM Vudum, Lakshminarayana
> > > <lakshminarayana.vudum@intel.com> wrote:
> > > >
> > > > Re-reported.
> > > >
> > > > -----Original Message-----
> > > > From: Petri Latvala <petri.latvala@intel.com>
> > > > Sent: Friday, March 26, 2021 2:26 AM
> > > > To: Mark Yacoub <markyacoub@chromium.org>; Vudum, Lakshminarayana <
> lakshminarayana.vudum@intel.com>
> > > > Cc: igt-dev@lists.freedesktop.org
> > > > Subject: Re: [igt-dev] =E2=9C=97 Fi.CI.IGT: failure for
> tests/kms_atomic_transition: Enable Primary Plane on Enabling CRTC. (rev2=
)
> > > >
> > > > (Aside: Please subscribe to the mailing list to avoid delays with
> mail delivery. Your mails get held in moderation queue without it.)
> > > >
> > > > On Thu, Mar 25, 2021 at 12:59:54PM -0400, Mark Yacoub wrote:
> > > > > I don't think this is me but just an unrelated flake, can someone
> > > > > please take a look?
> > > >
> > > >
> > > > Yep, a false positive. Lakshmi, see below.
> > > >
> > > >
> > > >
> > > >
> > > > >
> > > > > On Wed, Mar 24, 2021 at 4:36 PM Patchwork
> > > > > <patchwork@emeril.freedesktop.org>
> > > > > wrote:
> > > > >
> > > > > > *Patch Details*
> > > > > > *Series:* tests/kms_atomic_transition: Enable Primary Plane on
> > > > > > Enabling CRTC. (rev2)
> > > > > > *URL:* https://patchwork.freedesktop.org/series/88327/
> > > > > > *State:* failure
> > > > > > *Details:*
> > > > > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html
> CI
> > > > > > Bug Log - changes from CI_DRM_9888_full -> IGTPW_5654_full
> Summary
> > > > > >
> > > > > > *FAILURE*
> > > > > >
> > > > > > Serious unknown changes coming with IGTPW_5654_full absolutely
> need
> > > > > > to be verified manually.
> > > > > >
> > > > > > If you think the reported changes have nothing to do with the
> > > > > > changes introduced in IGTPW_5654_full, please notify your bug
> team
> > > > > > to allow them to document this new failure mode, which will
> reduce false positives in CI.
> > > > > >
> > > > > > External URL:
> > > > > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html
> > > > > > Possible new issues
> > > > > >
> > > > > > Here are the unknown changes that may have been introduced in
> > > > > > IGTPW_5654_full:
> > > > > > IGT changes Possible regressions
> > > > > >
> > > > > >    - igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
> > > > > >       - shard-snb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@kms_p=
ipe_crc_basic@suspend-read-crc-pipe-b.html
> >
> > > > > >       -> DMESG-WARN
> > > > > >
> > > > > > <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@
> > > > > > kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
> > > > > >
> > > > > > Known issues
> > > > > >
> > > > > > Here are the changes found in IGTPW_5654_full that come from
> known issues:
> > > > > > IGT changes Issues hit
> > > > > >
> > > > > >    -
> > > > > >
> > > > > >    igt@feature_discovery@display-3x:
> > > > > >    -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@featur=
e_discovery@display-3x.html
> >
> > > > > >       ([fdo#109271]) +72 similar issues
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@featu=
re_discovery@display-3x.html
> >
> > > > > >       ([i915#1839])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@featu=
re_discovery@display-3x.html
> >
> > > > > >       ([i915#1839])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_ctx_param@set-priority-not-supported:
> > > > > >    -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_c=
tx_param@set-priority-not-supported.html
> >
> > > > > >       ([fdo#109314])
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_c=
tx_param@set-priority-not-supported.html
> >
> > > > > >       ([fdo#109314])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_ctx_persistence@legacy-engines-mixed:
> > > > > >    - shard-snb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ct=
x_persistence@legacy-engines-mixed.html
> >
> > > > > >       ([fdo#109271] / [i915#1099]) +5 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-deadline:
> > > > > >    -
> > > > > >
> > > > > >       shard-kbl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_ex=
ec_fair@basic-deadline.html
> >
> > > > > >       ([i915#2846])
> > > > > >       -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_ex=
ec_fair@basic-deadline.html
> >
> > > > > >       ([i915#2846])
> > > > > >       -
> > > > > >
> > > > > >       shard-apl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_ex=
ec_fair@basic-deadline.html
> >
> > > > > >       ([i915#2846])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-none-rrul@rcs0:
> > > > > >    - shard-kbl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@gem_e=
xec_fair@basic-none-rrul@rcs0.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@gem_ex=
ec_fair@basic-none-rrul@rcs0.html
> >
> > > > > >       ([i915#2842])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-none-share@rcs0:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb7/igt@gem_=
exec_fair@basic-none-share@rcs0.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_e=
xec_fair@basic-none-share@rcs0.html
> >
> > > > > >       ([i915#2842])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-none-vip@rcs0:
> > > > > >    - shard-tglb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_e=
xec_fair@basic-none-vip@rcs0.html
> >
> > > > > >       ([i915#2842])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-pace@rcs0:
> > > > > >    - shard-tglb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb1/igt@gem_=
exec_fair@basic-pace@rcs0.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_e=
xec_fair@basic-pace@rcs0.html
> >
> > > > > >       ([i915#2842])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-pace@vcs1:
> > > > > >    - shard-iclb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_e=
xec_fair@basic-pace@vcs1.html
> >
> > > > > >       ([i915#2842]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-throttle@rcs0:
> > > > > >    - shard-glk: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk7/igt@gem_e=
xec_fair@basic-throttle@rcs0.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk4/igt@gem_ex=
ec_fair@basic-throttle@rcs0.html
> >
> > > > > >       ([i915#2842]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_params@no-vebox:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_e=
xec_params@no-vebox.html
> >
> > > > > >       ([fdo#109283])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_e=
xec_params@no-vebox.html
> >
> > > > > >       ([fdo#109283])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_exec_reloc@basic-many-active@vcs1:
> > > > > >    - shard-iclb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_e=
xec_reloc@basic-many-active@vcs1.html
> >
> > > > > >       ([i915#2389])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_reloc@basic-parallel:
> > > > > >    -
> > > > > >
> > > > > >       shard-kbl: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_ex=
ec_reloc@basic-parallel.html
> >
> > > > > >       ([i915#3183])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_e=
xec_reloc@basic-parallel.html
> >
> > > > > >       ([i915#3183])
> > > > > >       -
> > > > > >
> > > > > >       shard-apl: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_ex=
ec_reloc@basic-parallel.html
> >
> > > > > >       ([i915#3183])
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_e=
xec_reloc@basic-parallel.html
> >
> > > > > >       ([i915#3183])
> > > > > >       -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_ex=
ec_reloc@basic-parallel.html
> >
> > > > > >       ([i915#3183])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_exec_schedule@u-fairslice@bcs0:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@gem_=
exec_schedule@u-fairslice@bcs0.html
> >
> > > > > >       -> DMESG-WARN
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_e=
xec_schedule@u-fairslice@bcs0.html
> >
> > > > > >       ([i915#2803])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_schedule@u-fairslice@rcs0:
> > > > > >    - shard-apl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@gem_e=
xec_schedule@u-fairslice@rcs0.html
> >
> > > > > >       -> DMESG-WARN
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@gem_ex=
ec_schedule@u-fairslice@rcs0.html
> >
> > > > > >       ([i915#1610])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_schedule@u-fairslice@vecs0:
> > > > > >    - shard-kbl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@gem_e=
xec_schedule@u-fairslice@vecs0.html
> >
> > > > > >       -> DMESG-WARN
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@gem_ex=
ec_schedule@u-fairslice@vecs0.html
> >
> > > > > >       ([i915#1610] / [i915#2803])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_pwrite@basic-exhaustion:
> > > > > >    - shard-apl: NOTRUN -> WARN
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pw=
rite@basic-exhaustion.html
> >
> > > > > >       ([i915#2658])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_r=
ender_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
> >
> > > > > >       ([i915#768])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_softpin@evict-snoop:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_s=
oftpin@evict-snoop.html
> >
> > > > > >       ([fdo#109312])
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_userptr_blits@coherency-unsync:
> > > > > >    -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_u=
serptr_blits@coherency-unsync.html
> >
> > > > > >       ([fdo#110542]) +1 similar issue
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_u=
serptr_blits@coherency-unsync.html
> >
> > > > > >       ([fdo#109290])
> > > > > >       -
> > > > > >
> > > > > >    igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
> > > > > >    - shard-snb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_us=
erptr_blits@mmap-offset-invalidate-active@wb.html
> >
> > > > > >       ([fdo#109271]) +353 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@gen3_render_tiledx_blits:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_=
render_tiledx_blits.html
> >
> > > > > >       ([fdo#109289]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@gen9_exec_parse@bb-secure:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_=
exec_parse@bb-secure.html
> >
> > > > > >       ([fdo#112306]) +3 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@gen9_exec_parse@valid-registers:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_=
exec_parse@valid-registers.html
> >
> > > > > >       ([fdo#112306]) +3 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@i915_hangman@engine-error@rcs0:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_h=
angman@engine-error@rcs0.html
> >
> > > > > >       ([fdo#109271]) +188 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_p=
m_lpsp@kms-lpsp@kms-lpsp-dp.html
> >
> > > > > >       ([fdo#109271] / [i915#1937])
> > > > > >    -
> > > > > >
> > > > > >    igt@i915_selftest@live@hangcheck:
> > > > > >    - shard-snb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@i915_=
selftest@live@hangcheck.html
> >
> > > > > >       -> INCOMPLETE
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@i915_s=
elftest@live@hangcheck.html
> >
> > > > > >       ([i915#2782])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_big_fb@linear-16bpp-rotate-270:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_b=
ig_fb@linear-16bpp-rotate-270.html
> >
> > > > > >       ([fdo#111614]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_big_fb@linear-64bpp-rotate-270:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_b=
ig_fb@linear-64bpp-rotate-270.html
> >
> > > > > >       ([fdo#110725] / [fdo#111614]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_b=
ig_fb@yf-tiled-addfb-size-overflow.html
> >
> > > > > >       ([fdo#111615]) +5 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_chamelium@dp-hpd-storm:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_c=
hamelium@dp-hpd-storm.html
> >
> > > > > >       ([fdo#109284] / [fdo#111827]) +10 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_chamelium@hdmi-edid-read:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_c=
hamelium@hdmi-edid-read.html
> >
> > > > > >       ([fdo#109284] / [fdo#111827]) +12 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
> > > > > >    - shard-kbl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_ch=
amelium@hdmi-hpd-for-each-pipe.html
> >
> > > > > >       ([fdo#109271] / [fdo#111827]) +14 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_chamelium@hdmi-mode-timings:
> > > > > >    - shard-snb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_ch=
amelium@hdmi-mode-timings.html
> >
> > > > > >       ([fdo#109271] / [fdo#111827]) +20 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_color@pipe-c-degamma:
> > > > > >    - shard-iclb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_c=
olor@pipe-c-degamma.html
> >
> > > > > >       ([i915#1149])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_color@pipe-d-ctm-0-5:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_c=
olor@pipe-d-ctm-0-5.html
> >
> > > > > >       ([fdo#109278] / [i915#1149]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> > > > > >    -
> > > > > >
> > > > > >       shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_co=
lor_chamelium@pipe-a-ctm-limited-range.html
> >
> > > > > >       ([fdo#109271] / [fdo#111827]) +21 similar issues
> > > > > >       -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_co=
lor_chamelium@pipe-a-ctm-limited-range.html
> >
> > > > > >       ([fdo#109271] / [fdo#111827]) +13 similar issues
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_content_protection@srm:
> > > > > >    - shard-apl: NOTRUN -> TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_co=
ntent_protection@srm.html
> >
> > > > > >       ([i915#1319])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_c=
ursor_crc@pipe-c-cursor-512x170-random.html
> >
> > > > > >       ([fdo#109278] / [fdo#109279])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_c=
ursor_crc@pipe-d-cursor-512x170-random.html
> >
> > > > > >       ([fdo#109279])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_c=
ursor_crc@pipe-d-cursor-64x21-sliding.html
> >
> > > > > >       ([fdo#109278]) +11 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-legacy.html
> >
> > > > > >       ([fdo#109274] / [fdo#109278]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
> > > > > >    - shard-glk: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_dr=
aw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
> >
> > > > > >       ([i915#52] / [i915#54])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
> > > > > >    - shard-glk: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk1/igt@kms_d=
raw_crc@draw-method-rgb565-mmap-wc-ytiled.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_dr=
aw_crc@draw-method-rgb565-mmap-wc-ytiled.html
> >
> > > > > >       ([i915#52] / [i915#54]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip@2x-nonexisting-fb:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_f=
lip@2x-nonexisting-fb.html
> >
> > > > > >       ([fdo#109274]) +4 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
> > > > > >    - shard-tglb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_f=
lip@flip-vs-blocking-wf-vblank@a-edp1.html
> >
> > > > > >       ([i915#2122])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip@flip-vs-suspend@a-dp1:
> > > > > >    - shard-apl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl1/igt@kms_f=
lip@flip-vs-suspend@a-dp1.html
> >
> > > > > >       -> DMESG-WARN
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_fl=
ip@flip-vs-suspend@a-dp1.html
> >
> > > > > >       ([i915#180])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> > > > > >    - shard-apl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
> >
> > > > > >       ([i915#2641])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip_scaled_crc
> @flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
> >
> > > > > >       ([fdo#109271] / [i915#2672])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
> >
> > > > > >       ([fdo#109271] / [i915#2642])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_frontbuffer_tracking@fbc-2p-rte:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_f=
rontbuffer_tracking@fbc-2p-rte.html
> >
> > > > > >       ([fdo#111825]) +27 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_frontbuffer_tracking
> @fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> >
> > > > > >       ([fdo#109280]) +15 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_frontbuffer_tracking
> @psr-1p-primscrn-spr-indfb-draw-blt:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@kms_=
frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> >
> > > > > >       ([i915#49]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> > > > > >    - shard-kbl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_fr=
ontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> >
> > > > > >       ([fdo#109271]) +85 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_invalid_dotclock:
> > > > > >    -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_i=
nvalid_dotclock.html
> >
> > > > > >       ([fdo#110577])
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_i=
nvalid_dotclock.html
> >
> > > > > >       ([fdo#109310])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> > > > > >    -
> > > > > >
> > > > > >       shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pi=
pe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> >
> > > > > >       ([fdo#109271] / [i915#533]) +1 similar issue
> > > > > >       -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pi=
pe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> >
> > > > > >       ([fdo#109271] / [i915#533]) +1 similar issue
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_pipe_crc_basic@read-crc-pipe-d:
> > > > > >    - shard-kbl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pi=
pe_crc_basic@read-crc-pipe-d.html
> >
> > > > > >       ([fdo#109271] / [i915#533]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> > > > > >    - shard-apl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_pl=
ane_alpha_blend@pipe-a-alpha-basic.html
> >
> > > > > >       ([fdo#108145] / [i915#265])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> > > > > >    - shard-apl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_pl=
ane_alpha_blend@pipe-b-alpha-transparent-fb.html
> >
> > > > > >       ([i915#265])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> > > > > >    -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_pl=
ane_alpha_blend@pipe-b-constant-alpha-max.html
> >
> > > > > >       ([fdo#108145] / [i915#265])
> > > > > >       -
> > > > > >
> > > > > >       shard-kbl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_pl=
ane_alpha_blend@pipe-b-constant-alpha-max.html
> >
> > > > > >       ([fdo#108145] / [i915#265])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_plane_lowres@pipe-a-tiling-none:
> > > > > >    - shard-glk: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pl=
ane_lowres@pipe-a-tiling-none.html
> >
> > > > > >       ([i915#899])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_plane_lowres@pipe-b-tiling-yf:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb6/igt@kms_=
plane_lowres@pipe-b-tiling-yf.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_p=
lane_lowres@pipe-b-tiling-yf.html
> >
> > > > > >       ([i915#899])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_prime@basic-crc@first-to-second:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_p=
rime@basic-crc@first-to-second.html
> >
> > > > > >       ([i915#1836])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_p=
rime@basic-crc@first-to-second.html
> >
> > > > > >       ([i915#1836])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_p=
sr2_sf@overlay-plane-update-sf-dmg-area-4.html
> >
> > > > > >       ([i915#658]) +1 similar issue
> > > > > >       -
> > > > > >
> > > > > >       shard-kbl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_ps=
r2_sf@overlay-plane-update-sf-dmg-area-4.html
> >
> > > > > >       ([fdo#109271] / [i915#658]) +4 similar issues
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_p=
sr2_sf@overlay-plane-update-sf-dmg-area-5.html
> >
> > > > > >       ([i915#2920])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_ps=
r2_sf@plane-move-sf-dmg-area-2.html
> >
> > > > > >       ([fdo#109271] / [i915#658]) +3 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_psr2_su@frontbuffer:
> > > > > >    -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_ps=
r2_su@frontbuffer.html
> >
> > > > > >       ([fdo#109271] / [i915#658]) +4 similar issues
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_p=
sr2_su@frontbuffer.html
> >
> > > > > >       ([i915#2596])
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_p=
sr2_su@frontbuffer.html
> >
> > > > > >       ([fdo#109642] / [fdo#111068] / [i915#658])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_psr2_su@page_flip:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_=
psr2_su@page_flip.html
> >
> > > > > >       -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_p=
sr2_su@page_flip.html
> >
> > > > > >       ([fdo#109642] / [fdo#111068] / [i915#658])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_psr@psr2_primary_mmap_cpu:
> > > > > >    - shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_=
psr@psr2_primary_mmap_cpu.html
> >
> > > > > >       -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_p=
sr@psr2_primary_mmap_cpu.html
> >
> > > > > >       ([fdo#109441]) +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_psr@psr2_sprite_mmap_gtt:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_p=
sr@psr2_sprite_mmap_gtt.html
> >
> > > > > >       ([fdo#109441])
> > > > > >    -
> > > > > >
> > > > > >    igt@kms_vrr@flip-suspend:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_v=
rr@flip-suspend.html
> >
> > > > > >       ([fdo#109502])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_v=
rr@flip-suspend.html
> >
> > > > > >       ([fdo#109502])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_writeback@writeback-invalid-parameters:
> > > > > >    -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_w=
riteback@writeback-invalid-parameters.html
> >
> > > > > >       ([i915#2437])
> > > > > >       -
> > > > > >
> > > > > >       shard-kbl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_wr=
iteback@writeback-invalid-parameters.html
> >
> > > > > >       ([fdo#109271] / [i915#2437])
> > > > > >       -
> > > > > >
> > > > > >       shard-glk: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_wr=
iteback@writeback-invalid-parameters.html
> >
> > > > > >       ([fdo#109271] / [i915#2437])
> > > > > >       -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_w=
riteback@writeback-invalid-parameters.html
> >
> > > > > >       ([i915#2437])
> > > > > >       -
> > > > > >
> > > > > >    igt@kms_writeback@writeback-pixel-formats:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_wr=
iteback@writeback-pixel-formats.html
> >
> > > > > >       ([fdo#109271] / [i915#2437])
> > > > > >    -
> > > > > >
> > > > > >    igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouve=
au_crc@ctx-flip-threshold-reset-after-capture.html
> >
> > > > > >       ([i915#2530])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouve=
au_crc@ctx-flip-threshold-reset-after-capture.html
> >
> > > > > >       ([i915#2530])
> > > > > >       -
> > > > > >
> > > > > >    igt@perf@per-context-mode-unprivileged:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@=
per-context-mode-unprivileged.html
> >
> > > > > >       ([fdo#109289])
> > > > > >    -
> > > > > >
> > > > > >    igt@perf@polling-parameterized:
> > > > > >    - shard-apl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl2/igt@perf@=
polling-parameterized.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@perf@p=
olling-parameterized.html
> >
> > > > > >       ([i915#1542])
> > > > > >    -
> > > > > >
> > > > > >    igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
> > > > > >    - shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prime=
_nv_api@i915_nv_import_twice_check_flink_name.html
> >
> > > > > >       ([fdo#109291]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@prime_nv_pcopy@test3_2:
> > > > > >    - shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime=
_nv_pcopy@test3_2.html
> >
> > > > > >       ([fdo#109291]) +2 similar issues
> > > > > >    -
> > > > > >
> > > > > >    igt@prime_vgem@fence-write-hang:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime=
_vgem@fence-write-hang.html
> >
> > > > > >       ([fdo#109295])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime=
_vgem@fence-write-hang.html
> >
> > > > > >       ([fdo#109295])
> > > > > >       -
> > > > > >
> > > > > >    igt@sysfs_clients@recycle:
> > > > > >    - shard-apl: NOTRUN -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_=
clients@recycle.html
> >
> > > > > >       ([i915#3028])
> > > > > >    -
> > > > > >
> > > > > >    igt@sysfs_clients@recycle-many:
> > > > > >    -
> > > > > >
> > > > > >       shard-iclb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb5/igt@sysf=
s_clients@recycle-many.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@sysfs=
_clients@recycle-many.html
> >
> > > > > >       ([i915#3028])
> > > > > >       -
> > > > > >
> > > > > >       shard-kbl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@sysfs=
_clients@recycle-many.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@sysfs_=
clients@recycle-many.html
> >
> > > > > >       ([i915#3028])
> > > > > >       -
> > > > > >
> > > > > >       shard-tglb: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb7/igt@sysf=
s_clients@recycle-many.html
> >
> > > > > >       -> FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@sysfs=
_clients@recycle-many.html
> >
> > > > > >       ([i915#3028])
> > > > > >       -
> > > > > >
> > > > > >    igt@sysfs_clients@sema-10@rcs0:
> > > > > >    - shard-apl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@sysfs=
_clients@sema-10@rcs0.html
> >
> > > > > >       -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@sysfs_=
clients@sema-10@rcs0.html
> >
> > > > > >       ([fdo#109271] / [i915#3026])
> > > > > >    -
> > > > > >
> > > > > >    igt@sysfs_clients@split-10@bcs0:
> > > > > >    - shard-apl: NOTRUN -> SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_=
clients@split-10@bcs0.html
> >
> > > > > >       ([fdo#109271] / [i915#3026])
> > > > > >    -
> > > > > >
> > > > > >    igt@sysfs_heartbeat_interval@mixed@rcs0:
> > > > > >    - shard-kbl: PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@sysfs=
_heartbeat_interval@mixed@rcs0.html
> >
> > > > > >       -> INCOMPLETE
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@sysfs_=
heartbeat_interval@mixed@rcs0.html
> >
> > > > > >       ([i915#1731])
> > > > > >
> > > > > > Possible fixes
> > > > > >
> > > > > >    -
> > > > > >
> > > > > >    igt@feature_discovery@psr2:
> > > > > >    - shard-iclb: SKIP
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@feat=
ure_discovery@psr2.html
> >
> > > > > >       ([i915#658]) -> PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@featu=
re_discovery@psr2.html
> >
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_eio@in-flight-contexts-immediate:
> > > > > >    - shard-tglb: TIMEOUT
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb6/igt@gem_=
eio@in-flight-contexts-immediate.html
> >
> > > > > >       ([i915#3063]) -> PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_e=
io@in-flight-contexts-immediate.html
> >
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-flow@rcs0:
> > > > > >    - shard-tglb: FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb5/igt@gem_=
exec_fair@basic-flow@rcs0.html
> >
> > > > > >       ([i915#2842]) -> PASS
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_e=
xec_fair@basic-flow@rcs0.html
> >
> > > > > >       +1 similar issue
> > > > > >    -
> > > > > >
> > > > > >    igt@gem_exec_fair@basic-none@vcs0:
> > > > > >    - shard-kbl: FAIL
> > > > > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl4/igt@gem_e=
xec_fair@basic-none@vcs0.html
> >
> > > > > >       ([i915#2842]) -> PASS
> > > > > >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/s>
> +3 similar
> > > > > >       issues
> > > > > >
> > > > > >
> > > >
> > > > > _______________________________________________
> > > > > igt-dev mailing list
> > > > > igt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > > >
>

--000000000000f0652e05bf3dfbe4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;friendly ping&quot;</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 10:24 AM =
Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com" target=3D"_blank">=
markyacoub@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Awesome perfect! Glad it&#39;s ready for review.<br>
<br>
On Mon, Mar 29, 2021 at 10:18 AM Petri Latvala &lt;<a href=3D"mailto:petri.=
latvala@intel.com" target=3D"_blank">petri.latvala@intel.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On Mon, Mar 29, 2021 at 10:10:48AM -0400, Mark Yacoub wrote:<br>
&gt; &gt; Hi Lakshmi, is it still re-reported as false positive?<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s now showing as a success.<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Petri Latvala<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Mar 26, 2021 at 1:39 PM Vudum, Lakshminarayana<br>
&gt; &gt; &lt;<a href=3D"mailto:lakshminarayana.vudum@intel.com" target=3D"=
_blank">lakshminarayana.vudum@intel.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Re-reported.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Petri Latvala &lt;<a href=3D"mailto:petri.latvala@inte=
l.com" target=3D"_blank">petri.latvala@intel.com</a>&gt;<br>
&gt; &gt; &gt; Sent: Friday, March 26, 2021 2:26 AM<br>
&gt; &gt; &gt; To: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@chromium.or=
g" target=3D"_blank">markyacoub@chromium.org</a>&gt;; Vudum, Lakshminarayan=
a &lt;<a href=3D"mailto:lakshminarayana.vudum@intel.com" target=3D"_blank">=
lakshminarayana.vudum@intel.com</a>&gt;<br>
&gt; &gt; &gt; Cc: <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=
=3D"_blank">igt-dev@lists.freedesktop.org</a><br>
&gt; &gt; &gt; Subject: Re: [igt-dev] =E2=9C=97 Fi.CI.IGT: failure for test=
s/kms_atomic_transition: Enable Primary Plane on Enabling CRTC. (rev2)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; (Aside: Please subscribe to the mailing list to avoid delays=
 with mail delivery. Your mails get held in moderation queue without it.)<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, Mar 25, 2021 at 12:59:54PM -0400, Mark Yacoub wrote:=
<br>
&gt; &gt; &gt; &gt; I don&#39;t think this is me but just an unrelated flak=
e, can someone<br>
&gt; &gt; &gt; &gt; please take a look?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yep, a false positive. Lakshmi, see below.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Mar 24, 2021 at 4:36 PM Patchwork<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org"=
 target=3D"_blank">patchwork@emeril.freedesktop.org</a>&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; *Patch Details*<br>
&gt; &gt; &gt; &gt; &gt; *Series:* tests/kms_atomic_transition: Enable Prim=
ary Plane on<br>
&gt; &gt; &gt; &gt; &gt; Enabling CRTC. (rev2)<br>
&gt; &gt; &gt; &gt; &gt; *URL:* <a href=3D"https://patchwork.freedesktop.or=
g/series/88327/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.fre=
edesktop.org/series/88327/</a><br>
&gt; &gt; &gt; &gt; &gt; *State:* failure<br>
&gt; &gt; &gt; &gt; &gt; *Details:*<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5654/index.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html</a> CI<br>
&gt; &gt; &gt; &gt; &gt; Bug Log - changes from CI_DRM_9888_full -&gt; IGTP=
W_5654_full Summary<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; *FAILURE*<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Serious unknown changes coming with IGTPW_5654_ful=
l absolutely need<br>
&gt; &gt; &gt; &gt; &gt; to be verified manually.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; If you think the reported changes have nothing to =
do with the<br>
&gt; &gt; &gt; &gt; &gt; changes introduced in IGTPW_5654_full, please noti=
fy your bug team<br>
&gt; &gt; &gt; &gt; &gt; to allow them to document this new failure mode, w=
hich will reduce false positives in CI.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; External URL:<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5654/index.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/index.html</a><br>
&gt; &gt; &gt; &gt; &gt; Possible new issues<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Here are the unknown changes that may have been in=
troduced in<br>
&gt; &gt; &gt; &gt; &gt; IGTPW_5654_full:<br>
&gt; &gt; &gt; &gt; &gt; IGT changes Possible regressions<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - igt@kms_pipe_crc_basic@suspend-read=
-crc-pipe-b:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- shard-snb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@kms_pipe_crc_bas=
ic@suspend-read-crc-pipe-b.html" rel=3D"noreferrer" target=3D"_blank">https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@kms_pipe_crc=
_basic@suspend-read-crc-pipe-b.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5654/shard-snb6/igt@" rel=3D"noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@</a><br>
&gt; &gt; &gt; &gt; &gt; kms_pipe_crc_basic@suspend-read-crc-pipe-b.html&gt=
;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Known issues<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Here are the changes found in IGTPW_5654_full that=
 come from known issues:<br>
&gt; &gt; &gt; &gt; &gt; IGT changes Issues hit<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@feature_discovery@display-3x:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@feature_discovery=
@display-3x.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@feature_discovery@display-3x=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271]) +72 simil=
ar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@feature_discover=
y@display-3x.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@feature_discovery@display-=
3x.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1839])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@feature_discover=
y@display-3x.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@feature_discovery@display-=
3x.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1839])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_ctx_param@set-priority-not-su=
pported:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_ctx_param@se=
t-priority-not-supported.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_ctx_param@=
set-priority-not-supported.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109314])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_ctx_param@se=
t-priority-not-supported.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_ctx_param@=
set-priority-not-supported.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109314])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_ctx_persistence@legacy-engine=
s-mixed:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-snb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ctx_persisten=
ce@legacy-engines-mixed.html" rel=3D"noreferrer" target=3D"_blank">https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_ctx_persiste=
nce@legacy-engines-mixed.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#10=
99]) +5 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-deadline:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; =
FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_exec_fair@bas=
ic-deadline.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-kbl1/igt@gem_exec_fair@basic-deadline=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2846])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_fair@bas=
ic-deadline.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_fair@basic-deadline=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2846])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; =
FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_exec_fair@bas=
ic-deadline.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@gem_exec_fair@basic-deadline=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2846])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-none-rrul@rcs=
0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@gem_exec_fair@ba=
sic-none-rrul@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@gem_exec_fair@basic-=
none-rrul@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@gem_exec_fair@bas=
ic-none-rrul@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@gem_exec_fair@basic-no=
ne-rrul@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-none-share@rc=
s0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb7/igt@gem_exec_fair@b=
asic-none-share@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb7/igt@gem_exec_fair@bas=
ic-none-share@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_fair@ba=
sic-none-share@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_fair@basic=
-none-share@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-none-vip@rcs0=
:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@ba=
sic-none-vip@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-n=
one-vip@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-pace@rcs0:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb1/igt@gem_exec_fair@b=
asic-pace@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb1/igt@gem_exec_fair@basic-pac=
e@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_exec_fair@ba=
sic-pace@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@gem_exec_fair@basic-pace@=
rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-pace@vcs1:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_exec_fair@ba=
sic-pace@vcs1.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_exec_fair@basic-pace@=
vcs1.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842]) +2 similar=
 issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-throttle@rcs0=
:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-glk: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk7/igt@gem_exec_fair@ba=
sic-throttle@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk7/igt@gem_exec_fair@basic-t=
hrottle@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk4/igt@gem_exec_fair@bas=
ic-throttle@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk4/igt@gem_exec_fair@basic-thr=
ottle@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842]) +1 similar=
 issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_params@no-vebox:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_params@=
no-vebox.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_params@no-vebox.html<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109283])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_exec_params@=
no-vebox.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_exec_params@no-vebox.html<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109283])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_reloc@basic-many-active@=
vcs1:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_exec_reloc@b=
asic-many-active@vcs1.html" rel=3D"noreferrer" target=3D"_blank">https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@gem_exec_reloc@ba=
sic-many-active@vcs1.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2389])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_reloc@basic-parallel:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; =
TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_exec_reloc@ba=
sic-parallel.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@gem_exec_reloc@basic-parall=
el.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3183])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_exec_reloc@b=
asic-parallel.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gem_exec_reloc@basic-para=
llel.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3183])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; =
TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_exec_reloc@ba=
sic-parallel.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@gem_exec_reloc@basic-parall=
el.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3183])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_reloc@b=
asic-parallel.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gem_exec_reloc@basic-para=
llel.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3183])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_reloc@ba=
sic-parallel.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@gem_exec_reloc@basic-parall=
el.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3183])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_schedule@u-fairslice@bcs=
0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@gem_exec_schedu=
le@u-fairslice@bcs0.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@gem_exec_schedule@=
u-fairslice@bcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_schedul=
e@u-fairslice@bcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_exec_schedule@u-=
fairslice@bcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2803])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_schedule@u-fairslice@rcs=
0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@gem_exec_schedul=
e@u-fairslice@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@gem_exec_schedule@u-=
fairslice@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@gem_exec_schedule=
@u-fairslice@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@gem_exec_schedule@u-fa=
irslice@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1610])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_schedule@u-fairslice@vec=
s0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@gem_exec_schedul=
e@u-fairslice@vecs0.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@gem_exec_schedule@u=
-fairslice@vecs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@gem_exec_schedule=
@u-fairslice@vecs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@gem_exec_schedule@u-f=
airslice@vecs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1610] / [i915#280=
3])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_pwrite@basic-exhaustion:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; WARN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pwrite@basic-=
exhaustion.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@gem_pwrite@basic-exhaustion.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2658])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_render_copy@y-tiled-mc-ccs-to=
-vebox-y-tiled:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_render_copy@=
y-tiled-mc-ccs-to-vebox-y-tiled.html" rel=3D"noreferrer" target=3D"_blank">=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@gem_ren=
der_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#768])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_softpin@evict-snoop:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_softpin@evic=
t-snoop.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_softpin@evict-snoop.html</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109312])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_userptr_blits@coherency-unsyn=
c:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_userptr_blit=
s@coherency-unsync.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_userptr_blits@co=
herency-unsync.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#110542]) +1 simila=
r issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_userptr_blit=
s@coherency-unsync.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@gem_userptr_blits@co=
herency-unsync.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109290])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_userptr_blits@mmap-offset-inv=
alidate-active@wb:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-snb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_userptr_blits=
@mmap-offset-invalidate-active@wb.html" rel=3D"noreferrer" target=3D"_blank=
">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb6/igt@gem_us=
erptr_blits@mmap-offset-invalidate-active@wb.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271]) +353 simi=
lar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gen3_render_tiledx_blits:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_render_tile=
dx_blits.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@gen3_render_tiledx_blits.html<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109289]) +1 simila=
r issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gen9_exec_parse@bb-secure:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_exec_parse@=
bb-secure.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@gen9_exec_parse@bb-secure.htm=
l</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#112306]) +3 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gen9_exec_parse@valid-registers:<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_exec_parse@=
valid-registers.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@gen9_exec_parse@valid-r=
egisters.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#112306]) +3 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@i915_hangman@engine-error@rcs0:<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_hangman@engi=
ne-error@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@i915_hangman@engine-error@=
rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271]) +188 simi=
lar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp=
:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_pm_lpsp@kms-=
lpsp@kms-lpsp-dp.html" rel=3D"noreferrer" target=3D"_blank">https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@k=
ms-lpsp-dp.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#19=
37])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@i915_selftest@live@hangcheck:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-snb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@i915_selftest@li=
ve@hangcheck.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_9888/shard-snb7/igt@i915_selftest@live@hangche=
ck.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; INCOMPLETE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@i915_selftest@liv=
e@hangcheck.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@i915_selftest@live@hangcheck=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2782])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_big_fb@linear-16bpp-rotate-27=
0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_big_fb@linea=
r-16bpp-rotate-270.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@kms_big_fb@linear-16=
bpp-rotate-270.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#111614]) +1 simila=
r issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_big_fb@linear-64bpp-rotate-27=
0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_big_fb@linea=
r-64bpp-rotate-270.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_big_fb@linear-64=
bpp-rotate-270.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#110725] / [fdo#111=
614]) +1 similar issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_big_fb@yf-ti=
led-addfb-size-overflow.html" rel=3D"noreferrer" target=3D"_blank">https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@kms_big_fb@yf-t=
iled-addfb-size-overflow.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#111615]) +5 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_chamelium@dp-hpd-storm:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_chamelium@dp=
-hpd-storm.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109284] / [fdo#111=
827]) +10 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_chamelium@hdmi-edid-read:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_chamelium@hd=
mi-edid-read.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_chamelium@hdmi-edid-re=
ad.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109284] / [fdo#111=
827]) +12 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_chamelium@hdmi-hpd-for-each-p=
ipe:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_chamelium@hdm=
i-hpd-for-each-pipe.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_chamelium@hdmi-h=
pd-for-each-pipe.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [fdo#111=
827]) +14 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_chamelium@hdmi-mode-timings:<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-snb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_chamelium@hdm=
i-mode-timings.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5654/shard-snb5/igt@kms_chamelium@hdmi-mode-t=
imings.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [fdo#111=
827]) +20 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_color@pipe-c-degamma:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_color@pipe-c=
-degamma.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_color@pipe-c-degamma.html<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1149])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_color@pipe-d-ctm-0-5:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_color@pipe-d=
-ctm-0-5.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_color@pipe-d-ctm-0-5.html<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109278] / [i915#11=
49]) +1 similar issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_color_chamelium@pipe-a-ctm-li=
mited-range:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_color_chameli=
um@pipe-a-ctm-limited-range.html" rel=3D"noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_color_ch=
amelium@pipe-a-ctm-limited-range.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [fdo#111=
827]) +21 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_color_chameli=
um@pipe-a-ctm-limited-range.html" rel=3D"noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_color_ch=
amelium@pipe-a-ctm-limited-range.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [fdo#111=
827]) +13 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_content_protection@srm:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_content_prote=
ction@srm.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_content_protection@srm.htm=
l</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1319])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_cursor_crc@pipe-c-cursor-512x=
170-random:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_cursor_crc@p=
ipe-c-cursor-512x170-random.html" rel=3D"noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_cursor_=
crc@pipe-c-cursor-512x170-random.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109278] / [fdo#109=
279])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_cursor_crc@pipe-d-cursor-512x=
170-random:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_cursor_crc@p=
ipe-d-cursor-512x170-random.html" rel=3D"noreferrer" target=3D"_blank">http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@kms_cursor_=
crc@pipe-d-cursor-512x170-random.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109279])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_cursor_crc@pipe-d-cursor-64x2=
1-sliding:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_cursor_crc@p=
ipe-d-cursor-64x21-sliding.html" rel=3D"noreferrer" target=3D"_blank">https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_cursor_c=
rc@pipe-d-cursor-64x21-sliding.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109278]) +11 simil=
ar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_cursor_legacy@cursorb-vs-flip=
b-legacy:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_cursor_legac=
y@cursorb-vs-flipb-legacy.html" rel=3D"noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_cursor_le=
gacy@cursorb-vs-flipb-legacy.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109274] / [fdo#109=
278]) +2 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_draw_crc@draw-method-rgb565-m=
map-gtt-ytiled:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-glk: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_draw_crc@draw=
-method-rgb565-mmap-gtt-ytiled.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_draw_=
crc@draw-method-rgb565-mmap-gtt-ytiled.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#52] / [i915#54])<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_draw_crc@draw-method-rgb565-m=
map-wc-ytiled:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-glk: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk1/igt@kms_draw_crc@dra=
w-method-rgb565-mmap-wc-ytiled.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-glk1/igt@kms_draw=
_crc@draw-method-rgb565-mmap-wc-ytiled.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_draw_crc@draw=
-method-rgb565-mmap-wc-ytiled.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_draw_c=
rc@draw-method-rgb565-mmap-wc-ytiled.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#52] / [i915#54]) =
+2 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip@2x-nonexisting-fb:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_flip@2x-none=
xisting-fb.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_flip@2x-nonexisting-fb.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109274]) +4 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip@flip-vs-blocking-wf-vbla=
nk@a-edp1:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_flip@flip-vs=
-blocking-wf-vblank@a-edp1.html" rel=3D"noreferrer" target=3D"_blank">https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_flip@fli=
p-vs-blocking-wf-vblank@a-edp1.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2122])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip@flip-vs-suspend@a-dp1:<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl1/igt@kms_flip@flip-vs=
-suspend@a-dp1.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl1/igt@kms_flip@flip-vs-suspend=
@a-dp1.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-WARN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_flip@flip-vs-=
suspend@a-dp1.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_flip@flip-vs-suspend@a=
-dp1.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#180])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-32bpp-ytileccs.html" rel=3D"noreferrer" target=3D"_b=
lank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@km=
s_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2641])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html" rel=3D"noreferrer" targe=
t=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#26=
72])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-64bpp-ytile:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-64bpp-ytile.html" rel=3D"noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl7/igt@kms_f=
lip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#26=
42])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_frontbuffer_tracking@fbc-2p-r=
te:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_frontbuffer_=
tracking@fbc-2p-rte.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_frontbuffer_tra=
cking@fbc-2p-rte.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#111825]) +27 simil=
ar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb4/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html" rel=3D"noreferrer" =
target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard=
-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-rende=
r.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109280]) +15 simil=
ar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-blt:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@kms_frontbuffer=
_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html" rel=3D"noreferrer" targe=
t=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-icl=
b3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_frontbuffer_=
tracking@psr-1p-primscrn-spr-indfb-draw-blt.html" rel=3D"noreferrer" target=
=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html</a>&g=
t;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#49]) +2 similar i=
ssues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-wc:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_frontbuffer_t=
racking@psr-rgb101010-draw-mmap-wc.html" rel=3D"noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl7/igt@kms_f=
rontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271]) +85 simil=
ar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_invalid_dotclock:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_invalid_dotc=
lock.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb3/igt@kms_invalid_dotclock.html</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#110577])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_invalid_dotc=
lock.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb8/igt@kms_invalid_dotclock.html</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109310])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_pipe_crc_basic@compare-crc-sa=
nitycheck-pipe-d:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-apl: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pipe_crc_basi=
c@compare-crc-sanitycheck-pipe-d.html" rel=3D"noreferrer" target=3D"_blank"=
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_pip=
e_crc_basic@compare-crc-sanitycheck-pipe-d.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#53=
3]) +1 similar issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pipe_crc_basi=
c@compare-crc-sanitycheck-pipe-d.html" rel=3D"noreferrer" target=3D"_blank"=
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_pip=
e_crc_basic@compare-crc-sanitycheck-pipe-d.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#53=
3]) +1 similar issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_pipe_crc_basic@read-crc-pipe-=
d:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pipe_crc_basi=
c@read-crc-pipe-d.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_pipe_crc_basic@rea=
d-crc-pipe-d.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#53=
3]) +2 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_plane_alpha_blend@pipe-a-alph=
a-basic:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_plane_alpha_b=
lend@pipe-a-alpha-basic.html" rel=3D"noreferrer" target=3D"_blank">https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@kms_plane_alpha_=
blend@pipe-a-alpha-basic.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#108145] / [i915#26=
5])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_plane_alpha_blend@pipe-b-alph=
a-transparent-fb:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_plane_alpha_b=
lend@pipe-b-alpha-transparent-fb.html" rel=3D"noreferrer" target=3D"_blank"=
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl3/igt@kms_pla=
ne_alpha_blend@pipe-b-alpha-transparent-fb.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#265])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_plane_alpha_blend@pipe-b-cons=
tant-alpha-max:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_plane_alpha_b=
lend@pipe-b-constant-alpha-max.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk6/igt@kms_plane=
_alpha_blend@pipe-b-constant-alpha-max.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#108145] / [i915#26=
5])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; =
FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_plane_alpha_b=
lend@pipe-b-constant-alpha-max.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl4/igt@kms_plane=
_alpha_blend@pipe-b-constant-alpha-max.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#108145] / [i915#26=
5])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_plane_lowres@pipe-a-tiling-no=
ne:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-glk: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_plane_lowres@=
pipe-a-tiling-none.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk3/igt@kms_plane_lowres@pipe=
-a-tiling-none.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#899])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_plane_lowres@pipe-b-tiling-yf=
:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb6/igt@kms_plane_lowre=
s@pipe-b-tiling-yf.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb6/igt@kms_plane_lowres@pi=
pe-b-tiling-yf.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_plane_lowres=
@pipe-b-tiling-yf.html" rel=3D"noreferrer" target=3D"_blank">https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_plane_lowres@pipe=
-b-tiling-yf.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#899])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_prime@basic-crc@first-to-seco=
nd:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_prime@basic-=
crc@first-to-second.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_prime@basic-crc=
@first-to-second.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1836])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_prime@basic-=
crc@first-to-second.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb1/igt@kms_prime@basic-crc=
@first-to-second.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1836])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr2_sf@overlay-plane-update-=
sf-dmg-area-4:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_psr2_sf@over=
lay-plane-update-sf-dmg-area-4.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@kms_psr2=
_sf@overlay-plane-update-sf-dmg-area-4.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#658]) +1 similar =
issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_psr2_sf@overl=
ay-plane-update-sf-dmg-area-4.html" rel=3D"noreferrer" target=3D"_blank">ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_psr2_s=
f@overlay-plane-update-sf-dmg-area-4.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#65=
8]) +4 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr2_sf@overlay-plane-update-=
sf-dmg-area-5:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_psr2_sf@over=
lay-plane-update-sf-dmg-area-5.html" rel=3D"noreferrer" target=3D"_blank">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_psr2=
_sf@overlay-plane-update-sf-dmg-area-5.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2920])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr2_sf@plane-move-sf-dmg-are=
a-2:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_psr2_sf@plane=
-move-sf-dmg-area-2.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@kms_psr2_sf@plane-mo=
ve-sf-dmg-area-2.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#65=
8]) +3 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr2_su@frontbuffer:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_psr2_su@front=
buffer.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5654/shard-glk9/igt@kms_psr2_su@frontbuffer.html</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#65=
8]) +4 similar issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_psr2_su@fron=
tbuffer.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@kms_psr2_su@frontbuffer.html</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2596])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@fron=
tbuffer.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@frontbuffer.html</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109642] / [fdo#111=
068] / [i915#658])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr2_su@page_flip:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr2_su@pag=
e_flip.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr2_su@page_flip.html</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@page=
_flip.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@kms_psr2_su@page_flip.html</a>&gt=
;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109642] / [fdo#111=
068] / [i915#658])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr@psr2_primary_mmap_cpu:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr@psr2_pr=
imary_mmap_cpu.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb2/igt@kms_psr@psr2_primary_mm=
ap_cpu.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_psr@psr2_pri=
mary_mmap_cpu.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_psr@psr2_primary_mmap=
_cpu.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109441]) +1 simila=
r issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_psr@psr2_sprite_mmap_gtt:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_psr@psr2_spr=
ite_mmap_gtt.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5654/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_g=
tt.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109441])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_vrr@flip-suspend:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_vrr@flip-sus=
pend.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@kms_vrr@flip-suspend.html</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109502])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_vrr@flip-sus=
pend.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_vrr@flip-suspend.html</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109502])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_writeback@writeback-invalid-p=
arameters:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_writeback@wr=
iteback-invalid-parameters.html" rel=3D"noreferrer" target=3D"_blank">https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@kms_writebac=
k@writeback-invalid-parameters.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2437])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_writeback@wri=
teback-invalid-parameters.html" rel=3D"noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@kms_writeback@=
writeback-invalid-parameters.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#24=
37])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-glk: NOTRUN -&gt; =
SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_writeback@wri=
teback-invalid-parameters.html" rel=3D"noreferrer" target=3D"_blank">https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-glk5/igt@kms_writeback@=
writeback-invalid-parameters.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#24=
37])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_writeback@wr=
iteback-invalid-parameters.html" rel=3D"noreferrer" target=3D"_blank">https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@kms_writebac=
k@writeback-invalid-parameters.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2437])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@kms_writeback@writeback-pixel-for=
mats:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_writeback@wri=
teback-pixel-formats.html" rel=3D"noreferrer" target=3D"_blank">https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@kms_writeback@write=
back-pixel-formats.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#24=
37])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@nouveau_crc@ctx-flip-threshold-re=
set-after-capture:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouveau_crc@ctx-=
flip-threshold-reset-after-capture.html" rel=3D"noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@nouv=
eau_crc@ctx-flip-threshold-reset-after-capture.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2530])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouveau_crc@ctx-=
flip-threshold-reset-after-capture.html" rel=3D"noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@nouv=
eau_crc@ctx-flip-threshold-reset-after-capture.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2530])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@perf@per-context-mode-unprivilege=
d:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@per-context=
-mode-unprivileged.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@perf@per-context-mod=
e-unprivileged.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109289])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@perf@polling-parameterized:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl2/igt@perf@polling-par=
ameterized.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_9888/shard-apl2/igt@perf@polling-parameterized.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@perf@polling-para=
meterized.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5654/shard-apl6/igt@perf@polling-parameterized.htm=
l</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1542])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@prime_nv_api@i915_nv_import_twice=
_check_flink_name:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prime_nv_api@i91=
5_nv_import_twice_check_flink_name.html" rel=3D"noreferrer" target=3D"_blan=
k">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb1/igt@prim=
e_nv_api@i915_nv_import_twice_check_flink_name.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109291]) +2 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@prime_nv_pcopy@test3_2:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime_nv_pcopy@t=
est3_2.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5654/shard-tglb8/igt@prime_nv_pcopy@test3_2.html</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109291]) +2 simila=
r issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@prime_vgem@fence-write-hang:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime_vgem@fence=
-write-hang.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-iclb3/igt@prime_vgem@fence-write-hang=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109295])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: NOTRUN -&gt;=
 SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime_vgem@fence=
-write-hang.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5654/shard-tglb7/igt@prime_vgem@fence-write-hang=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109295])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@sysfs_clients@recycle:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_clients@rec=
ycle.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5654/shard-apl8/igt@sysfs_clients@recycle.html</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3028])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@sysfs_clients@recycle-many:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-iclb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb5/igt@sysfs_clients@r=
ecycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb5/igt@sysfs_clients@recycle-many=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@sysfs_clients@re=
cycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-iclb5/igt@sysfs_clients@recycle-many.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3028])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-kbl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@sysfs_clients@re=
cycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_9888/shard-kbl1/igt@sysfs_clients@recycle-many.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@sysfs_clients@rec=
ycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5654/shard-kbl2/igt@sysfs_clients@recycle-many.htm=
l</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3028])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0shard-tglb: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb7/igt@sysfs_clients@r=
ecycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb7/igt@sysfs_clients@recycle-many=
.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@sysfs_clients@re=
cycle-many.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-tglb6/igt@sysfs_clients@recycle-many.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3028])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@sysfs_clients@sema-10@rcs0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@sysfs_clients@se=
ma-10@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_9888/shard-apl7/igt@sysfs_clients@sema-10@rcs0.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@sysfs_clients@sem=
a-10@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5654/shard-apl2/igt@sysfs_clients@sema-10@rcs0.htm=
l</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#30=
26])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@sysfs_clients@split-10@bcs0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-apl: NOTRUN -&gt; SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_clients@spl=
it-10@bcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5654/shard-apl1/igt@sysfs_clients@split-10@bcs0.h=
tml</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([fdo#109271] / [i915#30=
26])<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@sysfs_heartbeat_interval@mixed@rc=
s0:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: PASS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@sysfs_heartbeat_=
interval@mixed@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl3/igt@sysfs_heartbeat_int=
erval@mixed@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; INCOMPLETE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@sysfs_heartbeat_i=
nterval@mixed@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-kbl6/igt@sysfs_heartbeat_inter=
val@mixed@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#1731])<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Possible fixes<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@feature_discovery@psr2:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-iclb: SKIP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@feature_discove=
ry@psr2.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_9888/shard-iclb3/igt@feature_discovery@psr2.html</a=
>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#658]) -&gt; PASS<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@feature_discover=
y@psr2.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5654/shard-iclb2/igt@feature_discovery@psr2.html</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_eio@in-flight-contexts-immedi=
ate:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: TIMEOUT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb6/igt@gem_eio@in-flig=
ht-contexts-immediate.html" rel=3D"noreferrer" target=3D"_blank">https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb6/igt@gem_eio@in-fligh=
t-contexts-immediate.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#3063]) -&gt; PASS=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_eio@in-fligh=
t-contexts-immediate.html" rel=3D"noreferrer" target=3D"_blank">https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb2/igt@gem_eio@in-flight-=
contexts-immediate.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-flow@rcs0:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-tglb: FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb5/igt@gem_exec_fair@b=
asic-flow@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-tglb5/igt@gem_exec_fair@basic-flo=
w@rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842]) -&gt; PASS=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@ba=
sic-flow@rcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5654/shard-tglb5/igt@gem_exec_fair@basic-flow@=
rcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+1 similar issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 -<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 igt@gem_exec_fair@basic-none@vcs0:<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 - shard-kbl: FAIL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl4/igt@gem_exec_fair@ba=
sic-none@vcs0.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_9888/shard-kbl4/igt@gem_exec_fair@basic-none@=
vcs0.html</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0([i915#2842]) -&gt; PASS=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/s" rel=3D"noreferrer" target=3D"=
_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5654/s</a>&gt; +3 si=
milar<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0issues<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; &gt; igt-dev mailing list<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=
=3D"_blank">igt-dev@lists.freedesktop.org</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listin=
fo/igt-dev" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.=
org/mailman/listinfo/igt-dev</a><br>
&gt; &gt; &gt;<br>
</blockquote></div>

--000000000000f0652e05bf3dfbe4--

--===============0739167085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0739167085==--
