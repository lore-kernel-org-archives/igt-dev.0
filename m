Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404096E964
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:27:42 +0000 (UTC)
References: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <1477c359-ef22-69ab-6224-fa44fcd65240@intel.com>
Date: Mon, 17 Feb 2020 16:27:39 +0200
MIME-Version: 1.0
In-Reply-To: <20200217142155.501499-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/6] New performance recording/replay
 tools for i915-perf
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 17/02/2020 16:21, Lionel Landwerlin wrote:
> Hi all,
>
> i915-perf was added about 3 or 4 years ago (first released in 4.13).
> At the time a new GPUTop [1] open source project was created to show
> case the usefulness of the data exposed through i915-perf. Initially
> GPUTop is entirely driven by traces coming from the GPU. Some effort
> came along later to use perf traces (mostly tracepoints) to complete
> the picture and connect the dots between GPU HW contexts and the
> processes that triggered those contexts running.
>
> About a year later Valve showcased another tool GPUvis [2]. GPUvis is
> currently only driven by traces recorded on the CPU (ftrace on Linux)
> but it's UI is undeniably better, showing a lot more information
> coming off ftrace.
>
> A few months ago Joonas thought it would be best to have GPUvis be the
> tool we spend time improving rather than our own effort, and I came to
> the same conclusion.
>
> So what does this have to do IGT?
>
> Well first, GPUvis is really only a few scripts around ftrace and some
> parsing code for ftrace as well as a user interface. But it does not
> deal directly with the kernel nor its drivers.
>
> So a recording tool for the i915-perf data needs to live somewhere.
> Right now this partly exists in GPUTop, except the data is never saved
> anywhere, it just resides in memory (either on the machine being
> monitored or the remote client inspecting the data).
>
> Secondly, GPUTop is also the place where we store the HW
> configurations for the Gen observation architecture as well as the
> equations to make up human readable data out of HW register values. If
> we're not going to invest much more effort into GPUTop, maybe it's a
> good idea to more that part into a more lively project.
>
>
> This series (probably too big for mail [3]) adds the following new
> things to IGT :
>
>     * A new library libi915_perf.so that helps you :
>
>        * parse i915-perf data from low level reports into logical
>          counters (with name & description)
>
>        * a library to load a file in which was recorded i915-perf data
>          along with other bits of information (device id, topology,
>          timestamp correlation, etc...)
>
>     * A set of tools to deal with :
>
>        * HW configurations stored in i915
>
>        * recording i915-perf data into a file that can be replay with
>          the library mentioned above
>
>        * basic replaying of i915-perf data (mostly showing how to use
>          the library above)
>
>
> Now with all this I have a GPUvis changes making use of this library &
> recording tool [4].
>
> Hopefully this explains what we're trying to do here.
>
> Cheers,
>
> [1] : https://github.com/rib/gputop
> [2] : https://github.com/mikesart/gpuvis
> [3] : https://github.com/djdeath/intel-gpu-tools/tree/review/i915-perf-tools
[4] : https://github.com/mikesart/gpuvis/pull/40
>
> Lionel Landwerlin (6):
>    lib/intel_chipset: identify Elkhart Lake
>    Add i915_perf library
>    lib/i915: Add support for loading perf configurations
>    tools: add i915 perf recorder tool
>    lib: add i915 perf data reader
>    tools: add i915-perf-reader
>
>   lib/i915-perf.pc.in                           |    11 +
>   lib/i915/perf-configs/README.md               |   115 +
>   lib/i915/perf-configs/codegen.py              |    33 +
>   lib/i915/perf-configs/guids.xml               |   319 +
>   lib/i915/perf-configs/mdapi-xml-convert.py    |  1006 +
>   lib/i915/perf-configs/oa-bdw.xml              | 15653 ++++++++++++++++
>   lib/i915/perf-configs/oa-bxt.xml              |  9595 ++++++++++
>   lib/i915/perf-configs/oa-cflgt2.xml           | 10866 +++++++++++
>   lib/i915/perf-configs/oa-cflgt3.xml           | 10933 +++++++++++
>   lib/i915/perf-configs/oa-chv.xml              |  9757 ++++++++++
>   lib/i915/perf-configs/oa-cnl.xml              | 10411 ++++++++++
>   lib/i915/perf-configs/oa-glk.xml              |  9346 +++++++++
>   lib/i915/perf-configs/oa-hsw.xml              |  4615 +++++
>   lib/i915/perf-configs/oa-icl.xml              | 11869 ++++++++++++
>   lib/i915/perf-configs/oa-kblgt2.xml           | 10866 +++++++++++
>   lib/i915/perf-configs/oa-kblgt3.xml           | 10933 +++++++++++
>   lib/i915/perf-configs/oa-lkf.xml              | 11803 ++++++++++++
>   lib/i915/perf-configs/oa-sklgt2.xml           | 11895 ++++++++++++
>   lib/i915/perf-configs/oa-sklgt3.xml           | 10933 +++++++++++
>   lib/i915/perf-configs/oa-sklgt4.xml           | 10956 +++++++++++
>   lib/i915/perf-configs/oa-tgl.xml              |  8491 +++++++++
>   lib/i915/perf-configs/oa_guid_registry.py     |    73 +
>   lib/i915/perf-configs/perf-codegen.py         |   850 +
>   lib/i915/perf-configs/update-guids.py         |   231 +
>   lib/i915/perf.c                               |   583 +
>   lib/i915/perf.h                               |   240 +
>   lib/i915/perf_data.h                          |   118 +
>   lib/i915/perf_data_reader.c                   |   383 +
>   lib/i915/perf_data_reader.h                   |   107 +
>   lib/intel_chipset.h                           |     1 +
>   lib/intel_device_info.c                       |     8 +-
>   lib/meson.build                               |    68 +
>   lib/tests/i915_perf_data_alignment.c          |    40 +
>   lib/tests/meson.build                         |     1 +
>   tools/i915-perf/i915_perf_configs.c           |   277 +
>   tools/i915-perf/i915_perf_control.c           |   133 +
>   tools/i915-perf/i915_perf_reader.c            |   279 +
>   tools/i915-perf/i915_perf_recorder.c          |  1052 ++
>   tools/i915-perf/i915_perf_recorder_commands.h |    39 +
>   tools/i915-perf/meson.build                   |    22 +
>   tools/meson.build                             |     1 +
>   41 files changed, 174911 insertions(+), 1 deletion(-)
>   create mode 100644 lib/i915-perf.pc.in
>   create mode 100644 lib/i915/perf-configs/README.md
>   create mode 100644 lib/i915/perf-configs/codegen.py
>   create mode 100644 lib/i915/perf-configs/guids.xml
>   create mode 100755 lib/i915/perf-configs/mdapi-xml-convert.py
>   create mode 100644 lib/i915/perf-configs/oa-bdw.xml
>   create mode 100644 lib/i915/perf-configs/oa-bxt.xml
>   create mode 100644 lib/i915/perf-configs/oa-cflgt2.xml
>   create mode 100644 lib/i915/perf-configs/oa-cflgt3.xml
>   create mode 100644 lib/i915/perf-configs/oa-chv.xml
>   create mode 100644 lib/i915/perf-configs/oa-cnl.xml
>   create mode 100644 lib/i915/perf-configs/oa-glk.xml
>   create mode 100644 lib/i915/perf-configs/oa-hsw.xml
>   create mode 100644 lib/i915/perf-configs/oa-icl.xml
>   create mode 100644 lib/i915/perf-configs/oa-kblgt2.xml
>   create mode 100644 lib/i915/perf-configs/oa-kblgt3.xml
>   create mode 100644 lib/i915/perf-configs/oa-lkf.xml
>   create mode 100644 lib/i915/perf-configs/oa-sklgt2.xml
>   create mode 100644 lib/i915/perf-configs/oa-sklgt3.xml
>   create mode 100644 lib/i915/perf-configs/oa-sklgt4.xml
>   create mode 100644 lib/i915/perf-configs/oa-tgl.xml
>   create mode 100644 lib/i915/perf-configs/oa_guid_registry.py
>   create mode 100755 lib/i915/perf-configs/perf-codegen.py
>   create mode 100755 lib/i915/perf-configs/update-guids.py
>   create mode 100644 lib/i915/perf.c
>   create mode 100644 lib/i915/perf.h
>   create mode 100644 lib/i915/perf_data.h
>   create mode 100644 lib/i915/perf_data_reader.c
>   create mode 100644 lib/i915/perf_data_reader.h
>   create mode 100644 lib/tests/i915_perf_data_alignment.c
>   create mode 100644 tools/i915-perf/i915_perf_configs.c
>   create mode 100644 tools/i915-perf/i915_perf_control.c
>   create mode 100644 tools/i915-perf/i915_perf_reader.c
>   create mode 100644 tools/i915-perf/i915_perf_recorder.c
>   create mode 100644 tools/i915-perf/i915_perf_recorder_commands.h
>   create mode 100644 tools/i915-perf/meson.build
>
> --
> 2.25.0


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
