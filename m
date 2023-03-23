Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91810E791
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 12:57:30 +0000 (UTC)
Date: Thu, 23 Mar 2023 13:57:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230323125725.o2uv52kyvlvc2xuq@kamilkon-desk1>
References: <20230323090221.1929302-1-mauro.chehab@linux.intel.com>
 <20230323090221.1929302-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323090221.1929302-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/4] intel-ci: update blacklists to
 work with the Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-03-23 at 10:02:18 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> It doesn't make sense to run i915 tests with Xe driver and
> vice-versa. Update testlists to make it clear.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  .../{blacklist.txt => i915-blacklist.txt}     |  4 ++++
>  tests/intel-ci/xe-blacklist.txt               | 21 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  rename tests/intel-ci/{blacklist.txt => i915-blacklist.txt} (97%)
>  create mode 100644 tests/intel-ci/xe-blacklist.txt

imho we do not need symlink here but if you want to discuss it
please split this move to i915-blacklist.txt and 2/4 into
separate patchseries, so we will not block merging changes to
xe-blacklist.txt and adding igt@xe_.* to blacklist.txt

> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915-blacklist.txt
> similarity index 97%
> rename from tests/intel-ci/blacklist.txt
> rename to tests/intel-ci/i915-blacklist.txt
> index 6e5cc43667cf..389a2acb7f44 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/i915-blacklist.txt
> @@ -84,6 +84,10 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
>  igt@vc4_.*
>  igt@v3d_.*
>  ###############################################
> +# Intel Xe
> +###############################################
> +igt@xe/.*
-------- ^
There is no xe subdirectory with xe tests, all binaries are
named xe_* and are placed in build/tests/

This should be:

igt@xe_.*

> +###############################################
>  # AMD
>  ###############################################
>  igt@amdgpu/.*

See here, all amdgpu binaries are in this subfolder, so '/'
is used.

> diff --git a/tests/intel-ci/xe-blacklist.txt b/tests/intel-ci/xe-blacklist.txt
> new file mode 100644
> index 000000000000..986e91a67069
> --- /dev/null
> +++ b/tests/intel-ci/xe-blacklist.txt
> @@ -0,0 +1,21 @@
> +###############################################
> +# Broadcom
> +###############################################
> +igt@vc4_.*
> +igt@v3d_.*
> +###############################################
> +# Intel i915
> +###############################################
> +igt@i915/.*
---------- ^
Same here,

igt@i915_.*

Add also:

igt@gem.*
igt@gen.*

imho look at tests/i915, we should really put all that here
in alphabetical order and with regexp where possible to make
it as short as possible.

Regards,
Kamil

> +###############################################
> +# AMD
> +###############################################
> +igt@amdgpu/.*
> +###############################################
> +# Panfrost
> +###############################################
> +igt@panfrost_.*
> +###############################################
> +# Qualcomm
> +###############################################
> +igt@msm_.*
> -- 
> 2.39.2
> 

