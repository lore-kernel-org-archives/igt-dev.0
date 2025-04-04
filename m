Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB5C36014
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 13:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60E10EBBF;
	Fri,  4 Apr 2025 13:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXADdvP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D2110EBBF
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743773886; x=1775309886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W61OasxFX1pkAIm0WmfzNRDnDTacWeVGKTP0miZWkUo=;
 b=fXADdvP5jEyycqc8PucW++Hy+EodFQC8klOTywEIZnfJ2+ERPVLY3C9S
 eXzjKR0TXV91f68zZRPFh6yT+U5Dd1BwQddE0Yblwzz6lhzYFqO0oM/+R
 uE+VSQP2v8B7jeZV+/tHOdSsT+zcwc1UZ8wYSCajOk4ANCCDvWBLwTCRz
 ypvkKVO1Eth3QTA9Yp2NvfyLsQRX8/WZivuD+w9ifOYm68+Dgk4U/jlqZ
 gOqfGx6EAoF39ZR26iF36qs9/XSz/hdNyVy9T3ZwJ8nKjxhecQZZttb4M
 oYQ7dtGRjGlCaOKapDaCPWKYy2Hy/ZHiCd8yRiMD7Wo3h+lHmC1C65dFu g==;
X-CSE-ConnectionGUID: QWvjw8yiRNamV7+emOLPmw==
X-CSE-MsgGUID: LYYDx0QmTQW9gpsXgOIpOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45230239"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45230239"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 06:38:00 -0700
X-CSE-ConnectionGUID: Su6mjGG8QK+i4tigxognzQ==
X-CSE-MsgGUID: SF9WTm6tQsOJ2JVDZOADqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127836109"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:37:58 -0700
Date: Fri, 4 Apr 2025 15:37:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v4 2/3] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Message-ID: <20250404133741.hhirek5yu234fyb7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
 <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
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

Hi Satyanarayana,
On 2025-03-28 at 16:45:31 +0530, Satyanarayana K V P wrote:

please make title a little shorter, like:

[PATCH i-g-t v4 2/3] tests/intel/xe_fault_injection: Inject errors in xe_guc_* calls

Also please do not end subjects with dot '.' in your other patches.

> Use the kernel fault injection infrastructure to test error handling
> of xe during driver probe when executing xe_guc_ct_send_recv() /
> xe_guc_mmio_send_recv() so that more code paths are tested, such as
> error handling and unwinding.
> 
> All xe_init() kind of functions are called just once during driver probe,
> so it is sufficient to fail first/all calls to them. Driver communicates
> with the GuC multiple times, and the real failure can happen at different
> call, hence the need to inject failure in GuC communication functions,
> like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
> all calls, but we need to be able to select specific iteration to fail.
> 
> To address this problem, the environmental variable IGT_FAULT_INJECT_ITERATION
> is used. If the IGT_FAULT_INJECT_ITERATION is not exported, an error will
> be injected in every possible function call starting from first up to the
> max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
> as 100. Also, using IGT_FAULT_INJECT_ITERATION, an error can be injected at
> specific function call.
> 
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 61 ++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 1325a1716..a49070b4d 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -26,6 +26,7 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define INJECT_ITERATIONS	100
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -43,6 +44,24 @@ struct fault_injection_params {
>  	uint32_t space;
>  };
>  
> +/**
> + *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION

As Lukasz already said, it is better to have a command line option
for this and in base cases go with some small numbers.

> + *  using which an error can be injected at specific function call.
> + *  When unset test will run for INJECT_ITERATIONS iterations.
> + *  When set to <=0 or malformed - same as unset.
> + *  When set to >0 it will run single n-th iteration only.
> + */
> +static int get_fault_inject_iter(void)
> +{
> +	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
> +
> +	/* Return 0 if not exported / -ve value */
> +	if (!env || atoi(env) <= 0)
> +		return 0;
> +
> +	return atoi(env);
> +}
> +
>  static int fail_function_open(void)
>  {
>  	int debugfs_fail_function_dir_fd;
> @@ -228,6 +247,34 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>  }
>  
> +/**
> + * SUBTEST: probe-fail-guc-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
> + * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
> + */
> +static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
> +               struct fault_injection_params *fault_params)

Why not make it a params here?
		...
               struct fault_injection_params *fault_params,
	       int start, int end)
or better:
	       int start, int count)

Then you could consider obvious subtests: 
first with (0, 1), last with (max - 1, 1) and then some random from 1...max-1
or even some random sequence of three errors?

Regards,
Kamil

> +{
> +	int iter_start = 0, iter_end = 0, iter = 0;
> +
> +	igt_assert(fault_params);
> +
> +	/* Get the iteration count from environment */
> +	iter = get_fault_inject_iter();
> +	iter_start = iter ? : 0;
> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
> +	for (int i = iter_start; i < iter_end; i++) {
> +		fault_params->space = i;
> +		setup_injection_fault(fault_params);
> +		inject_fault_probe(fd, pci_slot, function_name);
> +		igt_kmod_unbind("xe", pci_slot);
> +	}
> +}
> +
>  /**
>   * SUBTEST: exec-queue-create-fail-%s
>   * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
> @@ -406,6 +453,7 @@ igt_main
>  {
>  	int fd, sysfs;
>  	struct drm_xe_engine_class_instance *hwe;
> +	struct fault_injection_params fault_params;
>  	static uint32_t devid;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
> @@ -463,6 +511,12 @@ igt_main
>  		{ }
>  	};
>  
> +	const struct section guc_fail_functions[] = {
> +		{ "xe_guc_mmio_send_recv" },
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -505,6 +559,13 @@ igt_main
>  		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>  			inject_fault_probe(fd, pci_slot, s->name);
>  
> +   for (const struct section *s = guc_fail_functions; s->name; s++)
> +       igt_subtest_f("probe-fail-guc-%s", s->name) {
> +           memcpy(&fault_params, &default_fault_params,
> +                   sizeof(struct fault_injection_params));
> +           probe_fail_guc(fd, pci_slot, s->name, &fault_params);
> +       }
> +
>  	igt_fixture {
>  		close(sysfs);
>  		drm_close_driver(fd);
> -- 
> 2.35.3
> 
