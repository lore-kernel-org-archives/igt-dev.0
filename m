Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49806E890
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 20:07:33 +0000 (UTC)
Date: Tue, 18 May 2021 13:07:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210518200731.GC36960@orsosgc001.ra.intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/8] lib/i915/perf: Small improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 10:44:36AM +0300, Lionel Landwerlin wrote:
>Hi all,
>
>Here are a few improvements for converter scripts & meson build system
>files.

lgtm,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
>Cheers,
>
>Lionel Landwerlin (8):
>  lib/i915/perf: add name checker for conversion
>  lib/i915/perf-configs: rename metric descriptions
>  lib/i915/perf-config: simplify converter script
>  lib/i915/perf-config: document devinfo fields
>  lib/i915/perf-config: don't forget to resolve single variable
>  lib/i915/perf-config: sanitize GT names
>  lib/i915/perf: have python scripts a custom_target input
>  tools/i915-perf-recorder: print out oa format
>
> lib/i915/perf-configs/codegen.py              | 45 ++++++++++++-------
> lib/i915/perf-configs/mdapi-xml-convert.py    | 26 +++++------
> lib/i915/perf-configs/oa-adl.xml              | 18 ++++----
> lib/i915/perf-configs/oa-bdw.xml              | 24 +++++-----
> lib/i915/perf-configs/oa-bxt.xml              | 24 +++++-----
> lib/i915/perf-configs/oa-cflgt2.xml           | 26 +++++------
> lib/i915/perf-configs/oa-cflgt3.xml           | 26 +++++------
> lib/i915/perf-configs/oa-chv.xml              |  8 ++--
> lib/i915/perf-configs/oa-cnl.xml              | 16 +++----
> lib/i915/perf-configs/oa-dg1.xml              | 18 ++++----
> lib/i915/perf-configs/oa-ehl.xml              | 20 ++++-----
> lib/i915/perf-configs/oa-glk.xml              | 20 ++++-----
> lib/i915/perf-configs/oa-hsw.xml              | 12 ++---
> lib/i915/perf-configs/oa-icl.xml              | 20 ++++-----
> lib/i915/perf-configs/oa-kblgt2.xml           | 22 ++++-----
> lib/i915/perf-configs/oa-kblgt3.xml           | 22 ++++-----
> lib/i915/perf-configs/oa-rkl.xml              | 20 ++++-----
> lib/i915/perf-configs/oa-sklgt2.xml           | 22 ++++-----
> lib/i915/perf-configs/oa-sklgt3.xml           | 22 ++++-----
> lib/i915/perf-configs/oa-sklgt4.xml           | 22 ++++-----
> lib/i915/perf-configs/oa-tglgt1.xml           | 20 ++++-----
> lib/i915/perf-configs/oa-tglgt2.xml           | 20 ++++-----
> lib/i915/perf-configs/oa_guid_registry.py     | 29 ++++++++++++
> .../perf-configs/perf-metricset-codegen.py    |  4 +-
> lib/i915/perf-configs/update-guids.py         |  4 +-
> lib/i915/perf.h                               |  6 +++
> lib/meson.build                               | 25 +++++------
> meson.build                                   |  4 +-
> tools/i915-perf/i915_perf_recorder.c          |  5 ++-
> 29 files changed, 297 insertions(+), 253 deletions(-)
>
>--
>2.27.0
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
