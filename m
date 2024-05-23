Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0676C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 16:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A25E10E83B;
	Thu, 23 May 2024 16:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqT2zWBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D3910E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716480054; x=1748016054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mYFWP+gtIJ8MKVHnj++W077bOwAcb8aCO2lkKtbRNeQ=;
 b=MqT2zWBAjzGtMVybI+C2FDcLlEcsa7F1ZdTHw7n6PaQU90c8xVNjAdr8
 l1VghQy2J2FcwGKQoJ1wReckH4wD7/IdAPygo8nG34ETih8Xs5Kcpd/O9
 sqmcqeh4VcNMYJQVMzDKHrjT6cBlEcJ8zq21+ibZJpFZrRhjDkHjKIPkv
 Qey7tUt4k/N7pnWybAvmOgbt2PKbwjc4IZDtQAJ8rectF79O3xDkTbwxT
 JljJUkNdLrCxOThoF00/xZtPGbSI4Eb0pPjfLEqrch0fPDzgllx2cUOJM
 6u7JeCjih2iuLt7S/YmRCREGpqM2Coohos00iGNU93E821QfH3GRMVobZ A==;
X-CSE-ConnectionGUID: SRzrh3c/RPS/yT3JwgWaKg==
X-CSE-MsgGUID: 3Q+FOGmKTsOXobrklwHU7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12683517"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12683517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 09:00:54 -0700
X-CSE-ConnectionGUID: CamLFh8lT5iqIaWgF9yhew==
X-CSE-MsgGUID: vDNqcbf+QKeSgWsjePbAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="64923565"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 09:00:52 -0700
Date: Thu, 23 May 2024 18:00:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel: Make Mega feature field
 mandatory in test documentation
Message-ID: <20240523160036.e7hoh6vrdswxm7al@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
 <20240523151729.877971-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523151729.877971-3-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-05-23 at 15:17:28 +0000, Katarzyna Piecielska wrote:
> Once we have Mega feature in place for Core tests, let's make it
> mandatory, so every new test has full needed documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/i915_test_config.json | 1 +
>  tests/intel/xe_test_config.json   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 3b3afb2fd..1a1c1aafa 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -43,6 +43,7 @@
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> +                        "mandatory": true,
>                          "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                      },
>                      "Sub-category": {
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 89c6c7ef6..4556025f7 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -31,6 +31,7 @@
>                  },
>                  "Mega feature": {
>                      "_properties_": {
> +                        "mandatory": true,
>                          "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                      },
>                      "Sub-category": {
> -- 
> 2.34.1
> 
