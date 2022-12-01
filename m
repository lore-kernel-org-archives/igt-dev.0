Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4D210E16F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 20:21:40 +0000 (UTC)
Date: Thu, 1 Dec 2022 12:21:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <Y4kMyMW5iAVq/sy3@unerlige-ril>
References: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
 <20221129010522.994524-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221129010522.994524-2-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915: add MTL performance
 metrics
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

On Mon, Nov 28, 2022 at 05:05:21PM -0800, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>v2: Add mtl to perf-metrics-codegen.py (Umesh)
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Hi Lionel,

Tried this on an MTL and works fine. Thanks for sharing the patches.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> lib/i915/perf-configs/guids.xml               |   400 +
> lib/i915/perf-configs/mdapi-xml-convert.py    |     3 +-
> lib/i915/perf-configs/oa-mtlgt2.xml           | 30844 +++++++++
> lib/i915/perf-configs/oa-mtlgt3.xml           | 52917 ++++++++++++++++
> .../perf-configs/perf-metricset-codegen.py    |     2 +-
> lib/i915/perf-configs/update-guids.py         |     1 +
> lib/i915/perf.c                               |    44 +
> lib/i915_pciids.h                             |     9 +-
> lib/meson.build                               |     1 +
> 9 files changed, 84216 insertions(+), 5 deletions(-)
> create mode 100644 lib/i915/perf-configs/oa-mtlgt2.xml
> create mode 100644 lib/i915/perf-configs/oa-mtlgt3.xml
>
>diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
>index 2f9cd937..cc0dc916 100644
>--- a/lib/i915/perf-configs/guids.xml
>+++ b/lib/i915/perf-configs/guids.xml
>@@ -2340,4 +2340,404 @@
>     <guid config_hash="e7efe91c7aeb591043358c1b5e3c019d" mdapi_config_hash="94ecec147a25de742814fbb01fd4e9c3" id="a864bceb-7b38-4248-9fc8-0f0f7b8c6426" chipset="acmgt3" name="Ext1006" />
>     <guid config_hash="ae85ee9664f10b42cc854c26878d6cba" mdapi_config_hash="de92fab5a4df472219094e6a3b635632" id="361fc5ef-d568-4a9b-8ca2-d34707d10575" chipset="acmgt3" name="Ext1007" />
>     <guid config_hash="310dddcb04d1088a3865f698d758cbc2" mdapi_config_hash="c6a3be7d49b5697074021ca673a39a57" id="b5663ed9-0a8f-4a22-a3d4-a1ab08fad60f" chipset="acmgt3" name="Ext1010" />
>+    <guid config_hash="765a4838b8533765250eb3ad9c55819b" mdapi_config_hash="8285f749ef42ef7730742aef723e70fd" id="232e858b-7116-44e8-a4be-856c59026650" chipset="mtlgt2" name="RenderBasic" />
>+    <guid config_hash="47dd4aee9ef5ba2d15e61d25f735d1d4" mdapi_config_hash="c4c86e8bd7e0cfffa7c553517340292a" id="fea2b2b7-a072-41c5-9092-2d7c48bb56c6" chipset="mtlgt2" name="ComputeBasic" />
>+    <guid config_hash="da49b5c7e497eab30522295f416dd84a" mdapi_config_hash="80f802eb9434e078d1c158be06940d88" id="011e5c80-c877-46fd-90ff-fd0bb29cb5ec" chipset="mtlgt2" name="AsyncCompute" />
>+    <guid config_hash="1a28d05d945714b099a9417181b72962" mdapi_config_hash="0cdf3168ffd88a84c2a42d4c62567189" id="5f430543-ba1e-487c-b217-90570cfb85f9" chipset="mtlgt2" name="XveActivity" />
>+    <guid config_hash="30a171d29dd5020b9c3e783770d368fa" mdapi_config_hash="7bab7a09782a068f84c86a936d26cbd8" id="3cb64fed-0f61-4e41-a754-b9c5b4892f77" chipset="mtlgt2" name="GpuBusyness" />
>+    <guid config_hash="65340d74cb80df3ee2401d71d4b95c0d" 

[snip]
