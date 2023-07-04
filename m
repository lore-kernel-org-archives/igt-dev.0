Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184ED10E295
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 07:15:50 +0000 (UTC)
Date: Tue, 4 Jul 2023 09:15:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230704091544.469629b7@maurocar-mobl2>
In-Reply-To: <20230626160106.2632928-3-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
 <20230626160106.2632928-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V3 i-g-t 2/4] tests/intel/prime_mmap_kms: Add
 missing documentation
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

On Mon, 26 Jun 2023 21:31:04 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Add missing documentation for i915 testplan.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel/prime_mmap_kms.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index 8b127a13c..3c3c2e94f 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -37,6 +37,19 @@
>  IGT_TEST_DESCRIPTION(
>     "Efficiently sharing CPU and GPU buffers");
>  
> +/**
> + * TEST: prime mmap kms
> + * Category: Infrastructure
> + * Feature: prime
> + * Functionality: memory management
> + * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
> + *
> + * SUBTEST: buffer-sharing
> + * Description: Test efficiently sharing CPU and GPU buffers
> + */
> +
>  /*
>   * render_process_t:
>   *
