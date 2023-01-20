Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1077A10E375
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 15:16:01 +0000 (UTC)
Date: Fri, 20 Jan 2023 16:15:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230120151556.lr54bmedwjyojzcq@kamilkon-desk1>
References: <20230120144500.29821-1-swati2.sharma@intel.com>
 <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8qpngjAz2oYS76B@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert VDSC lib changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-01-20 at 16:47:58 +0200, Petri Latvala wrote:
> On Fri, Jan 20, 2023 at 08:15:00PM +0530, Swati Sharma wrote:
> > This reverts
> >     commit 2a611c37bd170763052bf6c17aa2d48cf09a63c1
> >     commit 65202cbc6109f17cf786a95947f4ee9223aec6b8
> >     commit b6984b946ba66f6bb0452b223fe188429ddeab34
> >     commit bbc2a5ceadb656552c5bcf95a19ce2b292a78128
> > 
> > Series broke git pipeline, revert above commits.
> > 
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> 
> The ultimate root cause is gitlab CI using Debian buster and thus
> libdrm 2.4.97. Until that's changed (soon) #include <stddef.h> and
> maybe some others need to be liberally applied all around.
> 
> Thanks for the quick revert.
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> 
> > ---
> >  lib/igt.h                   |   1 -
> >  lib/igt_dsc.c               | 133 ----------------------------------
> >  lib/igt_dsc.h               |  19 -----
> >  lib/igt_kms.c               | 127 +++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h               |  10 +++

Looks like igt_kms.h is missing #include <stdint.h> before x86.

Regards,
Kamil

> >  lib/meson.build             |   1 -
> >  tests/i915/kms_dsc.c        | 137 ++++++++++++++++++++++++++++++++----
> >  tests/i915/kms_dsc_helper.c |  99 --------------------------
> >  tests/i915/kms_dsc_helper.h |  35 ---------
> >  tests/meson.build           |   9 +--
> >  10 files changed, 263 insertions(+), 308 deletions(-)
> >  delete mode 100644 lib/igt_dsc.c
> >  delete mode 100644 lib/igt_dsc.h
> >  delete mode 100644 tests/i915/kms_dsc_helper.c
> >  delete mode 100644 tests/i915/kms_dsc_helper.h
[cut]
