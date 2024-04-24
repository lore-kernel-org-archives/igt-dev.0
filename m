Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FE2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 07:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7F2113644;
	Wed, 24 Apr 2024 07:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfodoZml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2062F10FDC7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713944731; x=1745480731;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zv2gK89JTiCp0X94Bk2JWnwVI2IphcQjn3Zj3mayb10=;
 b=ZfodoZmlkdz9XMKyT9aHHtuC08lQbgAwRb2wzZnHRAk3s7fVEJZhNfox
 WttPiFv2RKvMPTamXRHXf8MQZG5P1R9XYzLP0PW7dpx4NxQrITz8xWrnP
 SZXhxmQxXfVAyZDTxew1al+mJk745RQd97DAFiLHB71XSSP3MiTnvUQgt
 77t47kmLdDwThubpFqh+2/6ttUiMbBOYVjZuJNRtBMbNm8ld33x+JtYPM
 Wf3DEty96pHA6Y2gUCqdBTVq5nHzSnKq4Vlh2ZJzEHQmCX57/Df1AtO5g
 kr3vj3BL0XkoCNNBZ7lSpurPgwh1QeJdEXqNZW6b7GtMU5S/p6JKs54PP Q==;
X-CSE-ConnectionGUID: kdG0XgieT5uWPcZ9U86AMw==
X-CSE-MsgGUID: DDfrpvy8Rt2X4TrJDtJPSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9726971"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9726971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 00:45:30 -0700
X-CSE-ConnectionGUID: pi812HL6RfK7rRdiyJkvIw==
X-CSE-MsgGUID: JY6ry1SLQ6awtFb6e0wV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29286626"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 00:45:30 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.155])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7C17B206D89D;
 Wed, 24 Apr 2024 00:45:28 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:45:26 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel: Put "Run type" highest in
 i915 documentation hierarchy
Message-ID: <20240424094526.5f1ebc2f@maurocar-mobl2>
In-Reply-To: <20240423095344.3518545-4-katarzyna.piecielska@intel.com>
References: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
 <20240423095344.3518545-4-katarzyna.piecielska@intel.com>
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

On Tue, 23 Apr 2024 09:53:44 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put "Run type" at highest place in i915 documentation hierarchy. It
> will be reflected in html generated documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/i915_test_config.json | 150 +++++++++++++++---------------
>  1 file changed, 75 insertions(+), 75 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 61638a4f1..7b4e11ab5 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json

JSON file doesn't look right as it places all fields inside the
hierarchical part below Run Type, including fields that should be
outside, like Description.

Also, it is using tabs (meaning 4 spaces) instead of just
whitespaces, causing bad indentation with tabs convention for the
Kernel and IGT (tab = 8 spaces).

What about using instead:

{
    "description": "JSON file to be used to parse i915 documentation",
    "name": "Tests for i915 Driver",
    "drivers": [ "i915" ],
    "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
               "../core_getstats.c", "../core_getversion.c",
               "../core_hotunplug.c", "../core_setmaster.c",
               "../core_setmaster_vs_auth.c", "../debugfs_test.c",
               "../device_reset.c", "../dmabuf.c",
               "../drm_import_export.c", "../drm_mm.c",
               "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
               "../prime_mmap_coherency.c", "../prime_self_import.c",
               "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
               "../syncobj_timeline.c", "../syncobj_wait.c",
               "../vgem_basic.c", "../vgem_slow.c" ],
    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
                       "xe_*" ],
    "fields": {
        "Run type": {
            "_properties_": {
                "mandatory": true,
                "description": "Defines what category of testlist it belongs",
                "default-testlist": "FULL",
                "update-from-file": {
                    "exclude-type": "regex-ignorecase",
                    "append-value-if-not-excluded": "i915 FULL",
                    "include": [
                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
                    ],
                    "exclude": [
                        { "all": "../intel-ci/blacklist.txt" }
                    ]
                },
                "order": [
                    "boot",
                    "__all__",
                    "kunit"
                ]
            },
            "Category": {
                "_properties_": {
                    "mandatory": true,
                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
                },
                "Mega feature": {
                    "_properties_": {
                        "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                    },
                    "Sub-category": {
                        "_properties_": {
                            "mandatory": true,
                            "description": "Contains the technical feature/functionality"
                        },
                        "Functionality": {
                            "_properties_": {
                                "mandatory": true,
                                "description": "Groups page table tests on buckets containg more detailed functionality"
                            },
                            "Feature": {
                                "_properties_": {
                                    "description": "Describes the lowest level feature bucket"
                                }
                            }
                        }
                    }
                }
            }
        },
        "Test category": {
            "_properties_": {
                "description": "Defines the test category. Usually used at subtest level."
            }
        },
        "Test requirement": {
            "_properties_": {
                "description": "Defines Kernel parameters required for the test to run"
            }
        },
        "Issue": {
            "_properties_": {
                "description": "If the test is used to solve an issue, point to the URL containing the issue."
            }
        },
        "GPU excluded platform": {
            "_properties_": {
                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
            }
        },
        "GPU requirement": {
            "_properties_": {
                "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
            }
        },
        "Depends on" : {
            "_properties_": {
                "description": "List other subtests that are required to not be skipped before calling this one."
            }
        },
        "TODO": {
            "_properties_": {
                "description": "Point to known missing features at the test or subtest."
            }
        },
        "Description" : {
            "_properties_": {
                "description": "Provides a description for the test/subtest."
            }
        }
    }
}

