Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BFCC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 07:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D96112876;
	Mon, 22 Apr 2024 07:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtndVt+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9D9112876
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713772787; x=1745308787;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQVR7fFX/IjYaitUlAV6NiDl81NmKZ+wWA00CBI/nLI=;
 b=PtndVt+xa5FHobXYQGfLCoEeLK2SHmdBXVVx7/J6WgzCeu8N55mFbPUX
 yCXu9TUKwOwonEGBPdgawkDtKilr7gcrKxUVrlF1LaWGh/2c5epX+xq9U
 dh16x28AtJIw4HtmOVvBUHzAolq6oLdqfmwkJUOHyFkkM1bFqhuivejKU
 g62itY/USRDzwABUzq0ua2YJGwhfh1pgaZUKDVlR1JvGjziDrsOPBFX1J
 HkjKaZGTabdSlHd/IMzlbaFXb2pIgmcubd4AQm7QmVM0QaBQsCGANmjZK
 xx8D6m/umoL5warJvazQ9pwdVQszU+Bj6Aibc7xFlVmbdWglikM0nup9D w==;
X-CSE-ConnectionGUID: jnHGpJTrQ8yDSmeJw/ZXXA==
X-CSE-MsgGUID: 2hRNXb1TSqmUATIfunteLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19991507"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="19991507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 00:59:46 -0700
X-CSE-ConnectionGUID: 45zailP5SiCZ44Q/do454Q==
X-CSE-MsgGUID: gooIbZtFRL2u7q3Mez63mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23982406"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 00:59:45 -0700
Received: from maurocar-mobl2 (unknown [10.245.244.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4BA83206D89D;
 Mon, 22 Apr 2024 00:59:44 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:59:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel: Put "Run type" highest in
 documentation hierarchy
Message-ID: <20240422095941.5a3c08c2@maurocar-mobl2>
In-Reply-To: <20240417111324.3231762-2-katarzyna.piecielska@intel.com>
References: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
 <20240417111324.3231762-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 17 Apr 2024 11:13:24 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put "Run type" at highest place in documentation hierarchy. It
> will be reflected in html generated documentation.

If this works best for validation leaders, it works for me.

You should likely do the same also for KMS and i915, having all
using the same basic hierarchy.

Once you add KMS and i915 patches, feel free to add:
	Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

To the patch(es).

Regards,
Mauro

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/xe_test_config.json | 66 ++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 22b43ffac..f88883414 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -4,51 +4,51 @@
>      "drivers": [ "xe" ],
>      "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
>      "fields": {
> -        "Category": {
> +        "Run type": {
>              "_properties_": {
>                  "mandatory": true,
> -                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
> +                "description": "Defines what category of testlist it belongs",
> +                "default-testlist": "FULL",
> +                "update-from-file": {
> +                    "exclude-type": "regex-ignorecase",
> +                    "append-value-if-not-excluded": "Xe FULL",
> +                    "include": [
> +                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> +                    ],
> +                    "exclude": [
> +                        { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                    ]
> +                },
> +                "order": [
> +                    "boot",
> +                    "__all__",
> +                    "kunit"
> +                ]
>              },
> -            "Mega feature": {
> +            "Category": {
>                  "_properties_": {
> -                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
> +                    "mandatory": true,
> +                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
>                  },
> -                "Sub-category": {
> +                "Mega feature": {
>                      "_properties_": {
> -                        "mandatory": true,
> -                        "description": "Contains the the technical feature/functionality"
> +                        "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
>                      },
> -                    "Functionality": {
> +                    "Sub-category": {
>                          "_properties_": {
>                              "mandatory": true,
> -                            "description": "Groups page table tests on buckets containg more detailed functionality"
> +                            "description": "Contains the technical feature/functionality"
>                          },
> -                        "Feature": {
> +                        "Functionality": {
>                              "_properties_": {
> -                                "description": "Describes the lowest level feature bucket"
> -                            }
> -                        }
> -                    },
> -                    "Run type": {
> -                        "_properties_": {
> -                            "mandatory": true,
> -                            "description": "Defines what category of testlist it belongs",
> -                            "default-testlist": "FULL",
> -                            "update-from-file": {
> -                                "exclude-type": "regex-ignorecase",
> -                                "append-value-if-not-excluded": "Xe FULL",
> -                                "include": [
> -                                    { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
> -                                ],
> -                                "exclude": [
> -                                    { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> -                                ]
> +                                "mandatory": true,
> +                                "description": "Groups page table tests on buckets containg more detailed functionality"
>                              },
> -                            "order": [
> -                                "boot",
> -                                "__all__",
> -                                "kunit"
> -                            ]
> +                            "Feature": {
> +                                "_properties_": {
> +                                    "description": "Describes the lowest level feature bucket"
> +                                }
> +                            }
>                          }
>                      }
>                  }
