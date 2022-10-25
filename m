Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342DD10E119
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 22:05:17 +0000 (UTC)
Message-ID: <583f2e51-0ff2-3d2d-db95-b673bc8ee611@intel.com>
Date: Wed, 26 Oct 2022 01:05:07 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
 <20221025200709.83314-2-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20221025200709.83314-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 01/29] lib/i915/perf-config: Bump up the
 soversion
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

On 25/10/2022 23:06, Umesh Nerlige Ramappa wrote:
> Add soversion update that was missed as part of the below patch:
>
> "lib/i915/perf-config: extend the device info"
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   lib/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 1fa6d6ee..50ffd8cd 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -321,7 +321,7 @@ lib_igt_i915_perf_build = shared_library(
>     dependencies: lib_igt_chipset,
>     include_directories : inc,
>     install: true,
> -  soversion: '1')
> +  soversion: '1.3')
>   
>   lib_igt_i915_perf = declare_dependency(
>     link_with : lib_igt_i915_perf_build,

