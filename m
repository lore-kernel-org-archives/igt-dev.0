Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BCC10E15A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 13:06:18 +0000 (UTC)
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3247A580CD3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 06:04:36 -0700 (PDT)
Date: Wed, 29 Mar 2023 15:04:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230329150434.2bfbacb7@maurocar-mobl2>
In-Reply-To: <20230329123707.2590437-1-mauro.chehab@linux.intel.com>
References: <20230329123707.2590437-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: use
 xe_module_load@load
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

On Wed, 29 Mar 2023 14:37:07 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Provided that the force_load parameter is already set either as:
> 
> - boot time: xe.force_load=<value>
> - modprobe time: adding "option xe force_load=<value>" to a
>   /etc/modprobe.d/ file;
> - at boot time, via CONFIG_DRM_XE_FORCE_PROBE="<value>"
> 
> There's no need to use igt@xe_module_load@force_load. Use
> instead the cleaner test: igt@xe_module_load@load.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 3140d648833a..5f3bd2e917d5 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,5 +1,5 @@
>  # Should be the first test
> -igt@xe_module_load@force-load
> +igt@xe_module_load@load
>  
>  igt@xe_compute@compute-square
>  igt@xe_debugfs@base

Tested on an ADL-S booted with Xe module blacklisted:

$ lsmod|grep xe
$ sudo ./build/tests/xe_module_load --run load
IGT-Version: 1.27.1-gc6585fd1 (x86_64) (Linux: 6.2.0-xe-2bf8f2602+ x86_64)
Starting subtest: load
Subtest load: SUCCESS (2.772s)
gta@DUT1375ADLS:~/freedesktop-igt$ lsmod|grep xe
xe                   6721536  2
drm_ttm_helper         20480  1 xe
gpu_sched             159744  1 xe
drm_suballoc_helper    32768  1 xe
i2c_algo_bit           24576  1 xe
ttm                   307200  2 drm_ttm_helper,xe
drm_display_helper    536576  1 xe
drm_kms_helper        663552  2 drm_display_helper,xe
drm_buddy              40960  1 xe
drm                  1925120  9 gpu_sched,drm_kms_helper,drm_suballoc_helper,drm_display_helper,drm_buddy,drm_ttm_helper,xe,ttm
video                 102400  1 xe
