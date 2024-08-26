Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2334C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA2710E22D;
	Mon, 26 Aug 2024 15:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWZdAUM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8C110E22D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724685057; x=1756221057;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pGNQVmA8iLtCrD5VKPQwdR+yI5k/6azvhUOQY67PCaA=;
 b=lWZdAUM0+sgqIkRoJdVncEPHb4oQbbX5j1kI93i7JZB5Gl9WSQv5zMf7
 F767xJFJy83t/hjKpHjxpPmxtwSHdu/xE1J6OX0hWrcfsuRUcWcIkrOdZ
 qNSfnq2XqhUnzbR0mIIAAJ9ZyhU+5PgjS3ugKhapqkQYjuOkIERJ66aKb
 +Kn7ohcoFIH/8uGrNanExv7Zjn8Gwi1hXOxQaz7uayYPaYec1eBFnncqD
 f/2V2OaeuJu1y/7QomAhfs5R3yQ/Z+LJoZTHRvojp3Hm4p3ffUVv3lQ45
 yIRmekjRhrBnUlqZ3HbREoHAqYju0x2r/Z23sVQIPLwuPJmghJl1Htkna Q==;
X-CSE-ConnectionGUID: Ell8bWhrSAinprNod/E9jw==
X-CSE-MsgGUID: QNyQXqtBRAiwh63C0QxC2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45633239"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="45633239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:10:57 -0700
X-CSE-ConnectionGUID: WMZLuwKmRgKYAACmjXd0Tg==
X-CSE-MsgGUID: a7ohVEngTUKnrdDFPYZfCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67364777"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.106])
 ([10.245.246.106])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:10:56 -0700
Message-ID: <41712787-a0e9-4ced-82eb-386db5eb0720@intel.com>
Date: Mon, 26 Aug 2024 17:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_cov?=
 =?UTF-8?Q?erage_for_GPU_debug_support_=28rev4=29?=
To: igt-dev@lists.freedesktop.org
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <172444862443.748003.4226951397882504920@2413ebb6fbb6>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172444862443.748003.4226951397882504920@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23.08.2024 23:30, Patchwork wrote:
> == Series Details ==
> 
> Series: Test coverage for GPU debug support (rev4)
> URL   : https://patchwork.freedesktop.org/series/136623/
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256581 for the overview.
> 
> build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/62677573):
>    Program rst2man found: YES (/usr/bin/rst2man)
>    Program rst2man.sh found: YES (/builds/gfx-ci/igt-ci-tags/man/rst2man.sh)
>    Native dependency gtk-doc found: YES 1.29
>    Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
>    Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
>    Configuring version.xml using configuration
>    Program sphinx-build skipped: feature sphinx disabled
>    Program rst2html-3 found: NO
>    Program rst2html found: YES (/usr/bin/rst2html)
>    Program rst2pdf found: NO
>    
>    docs/testplan/meson.build:48:1: ERROR:  Division works only with integers.

Looks like string concatenation was added in meson 0.49.0, I will fix it 
in the next revision.


>    
>    A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
>    section_end:1724448351:step_script
>    section_start:1724448351:cleanup_file_variables
>    Cleaning up project directory and file based variables
>    section_end:1724448351:cleanup_file_variables
>    ERROR: Job failed: exit code 1
> 
> == Logs ==
> 
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1256581
