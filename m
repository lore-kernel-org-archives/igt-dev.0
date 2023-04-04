Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2B210E6EE
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 16:01:04 +0000 (UTC)
Date: Tue, 4 Apr 2023 18:01:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230404160101.hrnfrlxzwdoxel4o@kamilkon-desk1>
References: <20230323162943.1961396-1-mauro.chehab@linux.intel.com>
 <20230323162943.1961396-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323162943.1961396-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [RFC 4/4] xe-blocklist.txt: add a blocklist for the
 Xe driver
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

On 2023-03-23 at 17:29:43 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The same way we have a blocklist for i915, add one for the Xe
> driver. It currently contain only non-xe drivers that also
> have test definitions.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-blocklist.txt | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 tests/intel-ci/xe-blocklist.txt
> 
> diff --git a/tests/intel-ci/xe-blocklist.txt b/tests/intel-ci/xe-blocklist.txt
> new file mode 100644
> index 000000000000..190b76293937
> --- /dev/null
> +++ b/tests/intel-ci/xe-blocklist.txt
> @@ -0,0 +1,23 @@
> +#############################################################
> +# This file is for blocking tests from running on i915 driver
---------------------------------------------------- ^^^^
This should be s/i915/Xe/

> +#############################################################

Put here special meta_tests, like in i915 (maybe with comment):

igt@meta_test(@.*)?

imho this (and other ci specific patches) should be also +cc
to ci team.

Regards,
Kamil

> +
> +################################################################
> +# Block tests for other hardware - please keep sorted per vendor
> +################################################################
> +
> +# AMD
> +igt@amdgpu/.*
> +
> +# Broadcom
> +igt@vc4_.*
> +igt@v3d_.*
> +
> +# Intel
> +igt@i915.*
> +
> +# Panfrost
> +igt@panfrost_.*
> +
> +# Qualcomm
> +igt@msm_.*
> -- 
> 2.39.2
> 

