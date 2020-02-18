Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFEA6E4DE
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 18:57:52 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
 <20200217142155.501499-5-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217142155.501499-5-lionel.g.landwerlin@intel.com>
Message-ID: <158205226777.8112.12214621080932657728@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 18:57:47 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tools: add i915 perf recorder tool
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-02-17 14:21:53)
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  lib/i915-perf.pc.in                           |    1 +
>  lib/i915/perf_data.h                          |  118 ++
>  lib/meson.build                               |    1 +
>  lib/tests/i915_perf_data_alignment.c          |   40 +
>  lib/tests/meson.build                         |    1 +
>  tools/i915-perf/i915_perf_control.c           |  133 +++
>  tools/i915-perf/i915_perf_recorder.c          | 1052 +++++++++++++++++
>  tools/i915-perf/i915_perf_recorder_commands.h |   39 +
>  tools/i915-perf/meson.build                   |   11 +
>  9 files changed, 1396 insertions(+)
>  create mode 100644 lib/i915/perf_data.h
>  create mode 100644 lib/tests/i915_perf_data_alignment.c
>  create mode 100644 tools/i915-perf/i915_perf_control.c
>  create mode 100644 tools/i915-perf/i915_perf_recorder.c
>  create mode 100644 tools/i915-perf/i915_perf_recorder_commands.h
> 
> diff --git a/lib/i915-perf.pc.in b/lib/i915-perf.pc.in
> index e72efdc3..8cfa3dbe 100644
> --- a/lib/i915-perf.pc.in
> +++ b/lib/i915-perf.pc.in
> @@ -6,5 +6,6 @@ includedir=@includedir@
>  Name: i915-perf
>  Description: i915 perf library
>  Version: @version@
> +Requires: libdrm

You only use the uAPI headers, and they are in include/drm-uapi/
Right?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
