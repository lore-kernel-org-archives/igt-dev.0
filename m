Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3ACD3420
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 08:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7429710E3A4;
	Tue,  3 Sep 2024 08:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuZRbria";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7310E3A4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725352762; x=1756888762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4PG0g/EFgzUoFMIz3bCtqYNHQt9No4qBhCPNveyS7GA=;
 b=VuZRbriaAZtp8yiTICy50qsrSgM2wthkNfLAo4BveooWxjPQ46/Mmg8Z
 DiPrVuxeEnoBcP8GVzUeJ1xljdwzASz9NKjPEkzCUHf92TFLv6ETxpht1
 xXQBpHHoYL+46R4IlkRYreS09flfs+Ych1+aEFRwHGhmxnsy0CW3ayfTg
 MtD3/g63r6w5mOrq8irCVw5xyrJ4x27EHqLBZKdKQNtaQglJiI+6SQorg
 7LvmqXgXUbjIfy75cHG+Hm66FKB5rugwFO7H8ApojALrjzWXEahk+yv5J
 gUTOWcoG3HQzJBSsiUZOsvXqxVRei5wLyrZc5qVHUnKxWDbMeBdCOMh26 Q==;
X-CSE-ConnectionGUID: dBf7vxX2SoqOsZIYvk+DZg==
X-CSE-MsgGUID: o/DudRsnSt61A7c9LMKvCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34544497"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="34544497"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:39:22 -0700
X-CSE-ConnectionGUID: aguR2BzBTgmQcsfNKFe7MA==
X-CSE-MsgGUID: /ghrrTCLSNq8J1uzpu0v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64665053"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.116])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:39:17 -0700
Date: Tue, 3 Sep 2024 10:39:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v5 13/17] tests/xe_eudebug: Test eudebug resource
 tracking and manipulation
Message-ID: <20240903083913.vrlydxa2attdjmff@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-14-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829144547.105371-14-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:43PM +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> For typical debugging under gdb one can specify two main usecases:
> accessing and manupulating resources created by the application and
> manipulating thread execution (interrupting and setting breakpoints).
> 
> This test adds coverage for the former by checking that:
> - the debugger reports the expected events for Xe resources created
> by the debugged client,
> - the debugger is able to read and write the vm of the debugged client.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  docs/testplan/meson.build |   20 +-
>  meson_options.txt         |    2 +-
>  tests/intel/xe_eudebug.c  | 2715 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |    6 +
>  4 files changed, 2741 insertions(+), 2 deletions(-)
>  create mode 100644 tests/intel/xe_eudebug.c
> 
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 5560347f1..3898a994a 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -33,11 +33,29 @@ else
>  	doc_dependencies = []
>  endif
>  
> +xe_excluded_tests = []
> +
> +if not build_xe_eudebug
> +	xe_excluded_tests += [
> +		'xe_eudebug.c',
> +	]
> +endif
> +
> +tmp = []
> +foreach test : xe_excluded_tests
> +	tmp += meson.current_source_dir() + '/../../tests/intel/' + test
> +endforeach
> +xe_excluded_tests = tmp
> +
> +if xe_excluded_tests.length() > 0
> +	xe_excluded_tests = ['--exclude-files'] + xe_excluded_tests
> +endif

Here I'm going to review only meson related part.

According to our offline discussion and experiments please use common
list defined in tests/meson.build and used conditionally regarding
xe_eudebug value. This way we may avoid defining test names twice.

> +
>  if build_xe
>  	test_dict = {
>  		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>  		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
> -		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist + xe_excluded_tests }
>  	    }
>  else
>  	test_dict = {
> diff --git a/meson_options.txt b/meson_options.txt
> index 11922523b..c410f9b77 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -45,7 +45,7 @@ option('xe_driver',
>  option('xe_eudebug',
>         type : 'feature',
>         value : 'disabled',
> -       description : 'Build library for Xe EU debugger')
> +       description : 'Build library and tests for Xe EU debugger')

<cut>

> diff --git a/tests/meson.build b/tests/meson.build
> index 00556c9d6..02d91567c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,12 @@ intel_xe_progs = [
>  	'xe_sysfs_scheduler',
>  ]
>  
> +if build_xe_eudebug
> +	intel_xe_progs += [
> +		'xe_eudebug',
> +	]
> +endif
> +

Here I mean you should define xe_eudebug_progs = [] and conditionally
add tests. This array may be used then in testplan meson.build.

>  chamelium_progs = [
>  	'kms_chamelium_audio',
>  	'kms_chamelium_color',
> -- 
> 2.34.1
>

Tests part I'm going to address in separate review.

--
Zbigniew


