Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB43C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D5610FC3F;
	Wed, 20 Mar 2024 19:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiZKGXVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14C810FC3F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964203; x=1742500203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6IkmWykrLDsKZ56X7fBP2S8PFDf4QormuxH/ueI0TnA=;
 b=jiZKGXVdPR7FkJpVgHJuD2rrnKU97A2nHhAA19K99qO8hsulqCmLJTiW
 NpopIYyh+9GcP5NRPZ7YxMdII/zYkxXlX2v952bTOhAIiqKvz4GDKVOff
 +7MTHvrlum1Zv5icOQW+eX+1/nX/kwZdTdCD75ToUhwIvTmaPGXuN++7d
 wY2WDS0i8sFpB7n0U8HuWoQU583nUOZYtBoh8pLNC701uF3kBL4VwejMU
 JziHHJKVOuHk2OJyQs+5mUuBPi651gewySvxUWXtGBoXcQEyeXqrHQhO3
 GJ6Ooi6KBpnNi/h5mCxDw90aXTSo3kpjkRxUbZnwuaW2SME4k+ha5CZn8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5801183"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5801183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18741077"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:50:00 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v14 4/5] tests/intel/xe_exec_basic: add multigpu
 subtests
Date: Wed, 20 Mar 2024 20:49:58 +0100
Message-ID: <2300622.ZQ0cqP7t2B@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240320155659.33518-5-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Kamil,

On Wednesday, 20 March 2024 16:56:58 CET Kamil Konieczny wrote:
> Add a few multi-gpu subtests:
>=20
> multigpu-once-*
> multigpu-many-execqueues-many-vm-*
> multigpu-no-exec-*
>=20
> run on two or more GPUs. Many variant was limited to take at most
> few seconds.
>=20
> v10: use new renamed macro multi_fork_foreach_gpu_chip (Zbigniew)
> v13: use igt_multi_fork_foreach_gpu (Janusz)
>=20
> Cc: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

The code looks good to me, however, since I'm not quite on track with Xe an=
d=20
multi-GPU, I can't tell if such tests are what is needed, then instead of R=
=2Db:

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/intel/xe_exec_basic.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index e6f8db5b0..f0230a9ca 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -11,6 +11,7 @@
>   */
> =20
>  #include "igt.h"
> +#include "igt_multigpu.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> @@ -54,6 +55,18 @@
>   * Description: Run no-exec %arg[1] test
>   * Test category: functionality test
>   *
> + * SUBTEST: multigpu-once-%s
> + * Description: Run %arg[1] test only once on multiGPU
> + * Test category: functionality test
> + *
> + * SUBTEST: multigpu-many-execqueues-many-vm-%s
> + * Description: Run %arg[1] test on many exec_queues and many VMs on mul=
tiGPU
> + * Test category: stress test
> + *
> + * SUBTEST: multigpu-no-exec-%s
> + * Description: Run no-exec %arg[1] test on multiGPU
> + * Test category: functionality test
> + *
>   * arg[1]:
>   *
>   * @basic:				basic
> @@ -368,4 +381,27 @@ igt_main
> =20
>  	igt_fixture
>  		drm_close_driver(fd);
> +
> +	for (const struct section *s =3D sections; s->name; s++) {
> +		igt_subtest_f("multigpu-once-%s", s->name) {
> +			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
> +				xe_for_each_engine(gpu_fd, hwe)
> +					test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
> +			igt_waitchildren();
> +		}
> +
> +		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
> +			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
> +				xe_for_each_engine(gpu_fd, hwe)
> +					test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
> +			igt_waitchildren();
> +		}
> +
> +		igt_subtest_f("multigpu-no-exec-%s", s->name) {
> +			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
> +				xe_for_each_engine(gpu_fd, hwe)
> +					test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
> +			igt_waitchildren();
> +		}
> +	}
>  }
>=20




