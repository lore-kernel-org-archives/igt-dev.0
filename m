Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C9C10E607
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 07:59:55 +0000 (UTC)
Message-ID: <25b355d0-cd89-f325-ef80-eb063caee083@intel.com>
Date: Tue, 4 Apr 2023 10:59:50 +0300
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] lib/i915/perf: Speed up the build
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

On 03/04/2023 20:47, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The perf xml stuff generates terrible C code that is giving
> gcc a big headache and leading to disgustingly long build
> times. Try to generate a bit more sensible code to speed
> up the build.
>
> Total build time change for the series:
> $ ninja -Cbuild  clean
> $ time ninja -Cbuild
>   ADL (4+8 cores):
>    - real        1m18,244s
>    + real        0m36,695s
>   VLV (2 cores):
>    - real        17m29.100s
>    + real        9m44.268s
>
> For comparison this is what I get if I skip all the perf xml
> files apart from hsw:
>   ADL:
>    real  0m20,080s
>   VLV
>    real  7m3.045s
>
> Thinking of further ways to reduce this... There are about a
> thousand "Ext" metric sets. Are those *actually* useful or
> could we just skip them? That would give us a total build
> time of:
>   ADL:
>    real  0m24,593s
>   VLV:
>    real  8m15.977s
>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


>
> Ville Syrjälä (3):
>    lib/i915/perf: Stop generating silly C code
>    lib/i915/perf: Stop making copies of the registers
>    lib/i915/perf: Convert the metric counters to an array as well
>
>   .../perf-configs/perf-metricset-codegen.py    | 81 ++++++++++++++-----
>   .../perf-configs/perf-registers-codegen.py    | 30 +++----
>   lib/i915/perf.h                               |  8 +-
>   3 files changed, 78 insertions(+), 41 deletions(-)
>
