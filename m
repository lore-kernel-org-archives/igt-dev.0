Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15A5C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 15:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4366210E7B6;
	Wed, 24 Apr 2024 15:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9f/Vsn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64910E7B6
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713973683; x=1745509683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JXV+ZLm7GpZXxmyW1WXaUBTwNjVB0y6sn+ED9m6Z5Zw=;
 b=g9f/Vsn5NQusoK49iFMf3o0F2En7nBI9QngKCRQyZqzDLbCvGZMdzIBR
 Ut/0nOn8HOMpEZopmu9XkyHl2hVo4EAappcQn+D6dcK0+hj1AGNgdrsv3
 dPRrk67EXDE2GqnN5+igqVFlCXAUOEivVSR4uarySvPmhM50E07KV3ja9
 6N4kTdvJsgZLNac/08ePhUF9ZklQEs8lyvr+5o2UVOZBgDNf/IspwXlf3
 /Ru/ss45f/wga2XEzqWykjI5P4lskOwUa8/Wp1cXrMEhnh2iP40kyUeGK
 bKiWerIEU7xX0eDifDNKu+2bl0UkE6SbciFtExjIMmHttRve1L5czagX6 g==;
X-CSE-ConnectionGUID: 7HY+9TJVSDWym+y9cuQ3Bg==
X-CSE-MsgGUID: DXEQ/7xlQzKVS+0h8/LrOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20306790"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="20306790"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 08:48:02 -0700
X-CSE-ConnectionGUID: ELsnK8ooQ1S3sh+oJrou7g==
X-CSE-MsgGUID: JQXmjKjBTAa/4eR94CbJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="48017598"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:48:01 -0700
Date: Wed, 24 Apr 2024 17:47:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/3] tests/intel: Put "Run type" highest in Xe
 documentation hierarchy
Message-ID: <20240424154758.p5knwnbvpd633wvj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
 <20240424080533.3611723-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240424080533.3611723-2-katarzyna.piecielska@intel.com>
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
On 2024-04-24 at 08:05:31 +0000, Katarzyna Piecielska wrote:
> Let's put "Run type" at highest place in Xe documentation hierarchy. It
> will be reflected in html generated documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
> -- 
> 2.34.1
> 
