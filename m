Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC42310E231
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:06:38 +0000 (UTC)
Date: Thu, 1 Jun 2023 12:06:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <20230601100635.5bk6ohxgncshd6av@kamilkon-desk1>
References: <20230601092820.422236-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230601092820.422236-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/intel-ci/xe: Blocklist non-Xe
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-06-01 at 14:58:20 +0530, Swati Sharma wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> To enable the CI for Xe full run, exclude all non-Xe tests.
> 
> v2: -create different sections (Kamil)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 42 ++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 4285881b..2749d3b4 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -1,5 +1,45 @@
> +###############################################
> +# This file is for Xe tests only
> +###############################################
> +igt@meta_test(@.*)?
>  ##################################################################
> -#Pipe E, F, G and H
> +# Non-Xe driver tests
> +##################################################################
> +igt@amdgpu.*
> +igt@i915_.*
> +igt@msm_.*
> +igt@nouveau_.*
> +igt@panfrost_.*
> +igt@v3d.*
> +igt@vc4.*
> +igt@vgem_.*
> +igt@vmwgfx.*
> +##################################################################
> +# Exclude all other non-Xe tests
---------------------- ^^^^^^
/non-XE/i915/

> +##################################################################
> +igt@gem.*
> +igt@gen.*
> +igt@perf.*

Please add here:

##################################################################
# Exclude temporarily kselftest
##################################################################

dmabuf
drm_buddy
drm_mm
kms_selftest

> +##################################################################
> +# Exclude all other non-Xe tests
> +##################################################################
> +igt@api.*
-- ^^^^^^^
Move to i915 section.

> +igt@core.*
> +igt@debugfs.*
> +igt@device_reset
> +igt@dmabuf.*
-- ^
> +igt@drm.*
---^
Both dmabuf and drm* should be in kselftest section

> +igt@dumb.*
> +igt@fbdev
> +igt@feature_discovery
> +igt@prime_.*
> +igt@sw_sync
> +igt@syncobj_.*
> +igt@sysfs_.*
-- ^^^^^^^
Move to i915 section.

With that fixed:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +igt@template
> +igt@tools_test
> +##################################################################
> +# Pipe E, F, G and H
>  ##################################################################
>  igt@.*@.*pipe-(e|f|g|h).*
>  ##################################################################
> -- 
> 2.25.1
> 
