Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7C10E00A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 01:20:36 +0000 (UTC)
Date: Mon, 28 Nov 2022 17:20:18 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <Y4VeUrVjMRVbq8cq@unerlige-ril>
References: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add OA support for MTL
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

On Mon, Nov 28, 2022 at 05:05:20PM -0800, Umesh Nerlige Ramappa wrote:
>Add OA MTL metrics support and enable OA tests for MTL.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Lionel Landwerlin (1):
>  lib/i915: add MTL performance metrics

^ this one is waiting moderator approval since the message is large. The 
XML files for MTL seem to add to the size.

Thanks,
Umesh
>
>Umesh Nerlige Ramappa (1):
>  i915/perf: Enable MTL OA tests
>
> lib/i915/perf-configs/guids.xml               |   400 +
> lib/i915/perf-configs/mdapi-xml-convert.py    |     3 +-
> lib/i915/perf-configs/oa-mtlgt2.xml           | 30844 +++++++++
> lib/i915/perf-configs/oa-mtlgt3.xml           | 52917 ++++++++++++++++
> .../perf-configs/perf-metricset-codegen.py    |     2 +-
> lib/i915/perf-configs/update-guids.py         |     1 +
> lib/i915/perf.c                               |    44 +
> lib/i915_pciids.h                             |     9 +-
> lib/meson.build                               |     1 +
> tests/i915/perf.c                             |    12 +-
> 10 files changed, 84223 insertions(+), 10 deletions(-)
> create mode 100644 lib/i915/perf-configs/oa-mtlgt2.xml
> create mode 100644 lib/i915/perf-configs/oa-mtlgt3.xml
>
>-- 
>2.36.1
>
