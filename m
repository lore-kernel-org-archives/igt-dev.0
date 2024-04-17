Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE8C04FFF
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 16:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B14611367A;
	Wed, 17 Apr 2024 16:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XxeepDMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE510F72C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713370465; x=1744906465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SX42PAtBijMVlgTX4SBIrUJ+1U/I1NUqscc1aL0LgCM=;
 b=XxeepDMzK3DTp5VO65sdfrUIxiQ2drfANptYg3nRHrOxBbFXbF4sGxYJ
 JQpI5pl66Y4QpCr5S0UEVJ6peTAdBgiKmeYEoYJzOBMoAQq4YNahVUq6j
 J9A50WSj6KZ4HyyGmBMTQKU/U7ImCWg7103DgD2tnERxeEuOTfdKXQUuU
 PwXuTW73uKuvEujn8yuJeMRLE1SFFaioykkMWFvNGQize2H2Mz6fneaea
 B9Y8gTNXMfukuy68Y82E7hG+ajmzaq+BmtNfi0u8umwVbjoCbIgANJ228
 hFjNzKEhEutsCvSZlfdxydJVkTt1NkP9agbfSnX3wIB5WS9M3D/TvsQHF Q==;
X-CSE-ConnectionGUID: YJSh1tjOTZayTTG2CKKxEA==
X-CSE-MsgGUID: 4zbMEIOySjO1mb6Tz2rPGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12654580"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="12654580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 09:14:24 -0700
X-CSE-ConnectionGUID: oExQzkVpQt6pKaek1zI+Xw==
X-CSE-MsgGUID: +IMR6NZcSvqeybmN0rE/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53619402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 09:14:22 -0700
Date: Wed, 17 Apr 2024 18:14:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel: Put "Run type" highest in
 documentation hierarchy
Message-ID: <20240417161419.5i53vqvy3wqfpl3b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240417111324.3231762-1-katarzyna.piecielska@intel.com>
 <20240417111324.3231762-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240417111324.3231762-2-katarzyna.piecielska@intel.com>
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
On 2024-04-17 at 11:13:24 +0000, Katarzyna Piecielska wrote:
> Let's put "Run type" at highest place in documentation hierarchy. It
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
