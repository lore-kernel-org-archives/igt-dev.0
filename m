Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7863EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 16:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B610F19B;
	Fri, 26 Apr 2024 16:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azFAwMsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D216F10F19B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714149637; x=1745685637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aEMT7v6phWo8hZIKX1dvL9mQ2LymG4DVUcveYPkQuwU=;
 b=azFAwMsBy4YgzIqdrRc7qEeL3ZWv39kyDlP6SHOZdmIgndqwkUJOcUcY
 DRUxhuouzjZLN6ZhH0bL7AklqDpu4IJ0xsom9mvU2FsgT6wp8VKXIVQEh
 dIxY/jvb8fW+nIMDKMe/vqODyS5+C3wXoAZ5Ojrx7paEv8WnDHfQWQwtJ
 LcJVdwAxtSdZPhBqsaEgBhBlKsBlif14QjRGvJl0Esic+/HKw5qpKL5Nm
 gcD1oAEEaUQrBWKXzLu4Gf9Ljl+rfWUvmUWVFiuMv+pU5rVgjFHYEgotS
 WBi7jwi0fKP2XbPk8AUCdYi1HvagjtaAonp0j00pqOVlW6nDa2kpjkV4t w==;
X-CSE-ConnectionGUID: g73A3a7WRPGMpTqzONDDDA==
X-CSE-MsgGUID: JjoQD4zlSA2BSHvriWRZ4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9742351"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9742351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:40:36 -0700
X-CSE-ConnectionGUID: LE0BpwrERTiuLVIKsRuZMg==
X-CSE-MsgGUID: WET/EWEmSqOXnHcL6lEnDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="62950402"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:40:34 -0700
Date: Fri, 26 Apr 2024 18:40:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_queue_property: move skip into
 subtest
Message-ID: <20240426164030.s33sahee4dnw3pn6@zkempczy-mobl2>
References: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425143946.62074-1-kamil.konieczny@linux.intel.com>
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

On Thu, Apr 25, 2024 at 04:39:46PM +0200, Kamil Konieczny wrote:
> Skips in fixture are safe to use just after begin of igt_main()
> when they be working for all subtests. Later on, when used in
> fixture they can mislead developers reading logs, so move one
> into respective subtest.
> 
> v2: use bool var instead of fd (Zbigniew)
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 57baae305..c3a3751cb 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -203,7 +203,7 @@ igt_main
>  	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
>  	};
>  	int count = sizeof(property) / sizeof(property[0]);
> -	int sys_fd;
> +	bool has_sysfs;
>  	int xe;
>  	int gt;
>  
> @@ -233,14 +233,20 @@ igt_main
>  
>  	igt_subtest_group {
>  		igt_fixture {
> -			sys_fd = igt_sysfs_open(xe);
> -			igt_require(sys_fd != -1);
> -			close(sys_fd);
> +			int sys_fd = igt_sysfs_open(xe);
> +
> +			if (sys_fd != -1) {
> +				close(sys_fd);
> +				has_sysfs = true;
> +			} else {
> +				has_sysfs = false;
> +			}

Ok, you stop exposing stale fd outside, lgtm:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		}
>  
>  		for (int i = 0; i < count; i++) {
>  			for (typeof(*tests) *t = tests; t->name; t++) {
>  				igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +					igt_require(has_sysfs);
>  					xe_for_each_gt(xe, gt) {
>  						int engines_fd = -1;
>  						int gt_fd = -1;
> -- 
> 2.42.0
> 
