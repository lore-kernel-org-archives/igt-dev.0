Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE310E146
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 09:58:40 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.9.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 29202580D73
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 02:58:39 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qh6Wz-001rkt-0S
 for igt-dev@lists.freedesktop.org; Fri, 15 Sep 2023 11:58:37 +0200
Message-ID: <cc5a692b-62cc-a31b-44c9-ba8545ec0cb2@linux.intel.com>
Date: Fri, 15 Sep 2023 11:58:36 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-24-janusz.krzysztofik@linux.intel.com>
 <20230911105251.220d90ed@maurocar-mobl2>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230911105251.220d90ed@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 05/17] lib/kunit: Fix
 illegal igt_fail() calls inside subtest body
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

Hi Janusz,


On 9/11/23 10:52, Mauro Carvalho Chehab wrote:
> On Fri,  8 Sep 2023 14:32:39 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
>   
>   void igt_kunit(const char *module_name, const char *name, const char *opts)
>   {
> +	struct igt_ktest tst;
> +
> +	if (igt_ktest_init(&tst, module_name) != 0)
> +		return;
> Shouldn't it be calling igt_skip() here too?

Maybe due to that, but running:

     $ cd 
/lib/modules/6.5.0-rc7-xe-public-4a9681392cec+/kernel/drivers/gpu/drm/xe/tests
     $ sudo mv xe_bo_test.ko xe_blocked_bo_test.ko

     sudo ./build/tests/xe_live_ktest
     IGT-Version: 1.28-g3d29cbf02 (x86_64) (Linux: 
6.5.0-rc7-xe-public-4a9681392cec+ x86_64)
     Starting subtest: bo

     <IGT hangs forever waiting for module load to complete>


It seems that something at KUnit modprobe logic require fixes.

Regards,
Mauro

