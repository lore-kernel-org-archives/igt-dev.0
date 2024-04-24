Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0741CC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 07:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1201138C4;
	Wed, 24 Apr 2024 07:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWeCVdo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91207113644
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713944682; x=1745480682;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FdGpfLq/Ik5WPlo19qdeE+20jFCJooDmrSahgr3xig=;
 b=WWeCVdo9r0JrpGg3dQHc8pcR1p5CjA+vBQEO+Ql4LRu3JCAv9jgInogK
 deKQ9ixKjHcJdvqlAHo5IPMbYFGqd+HFZF706dY+iJ06Ap+6kEe2uvuGe
 l1HTh0zf+q4U1PsZ5DMLdDlVliqiG4LKMMMu4sD1cHPJsSM9McZnH40uK
 K1fT9KkjbD0AP6q+NrfH70I33QNpiHDYojXLSN5ENybJDANCQL2SmO3zx
 DtCOPr1SAPOQOE667fOC4JH6vFW8/CCeVTFhM6eYZNFIZj9Ef8w2c6zzP
 EK+9fkamd6XmebwwQBfkIjQX864WqNuee5B841DDI7KsxKV2WpKa0pUGc g==;
X-CSE-ConnectionGUID: 5XqoV1/IQ/upAx7rrtw8Iw==
X-CSE-MsgGUID: q6+x349wRVOQkjfXF4P+SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9428625"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9428625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 00:43:02 -0700
X-CSE-ConnectionGUID: 55CriWiFSf2dAE/Fg5uMqw==
X-CSE-MsgGUID: fLM+pu1bQjqHkRgnXeB0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24629410"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 00:43:02 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.155])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 70768206D89D;
 Wed, 24 Apr 2024 00:43:00 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:42:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel: Put "Run type" highest in KMS
 documentation hierarchy
Message-ID: <20240424094258.05256a9b@maurocar-mobl2>
In-Reply-To: <20240423095344.3518545-3-katarzyna.piecielska@intel.com>
References: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
 <20240423095344.3518545-3-katarzyna.piecielska@intel.com>
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

On Tue, 23 Apr 2024 09:53:43 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put "Run type" at highest place in KMS documentation hierarchy. It
> will be reflected in html generated documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/kms_test_config.json | 94 ++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 47 deletions(-)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index f3f6bfad6..35010d886 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
JSON file doesn't look right, as it is placing Description and other
fields below Run type level.

What about using, instead:

{
    "description": "JSON file to be used to parse KMS documentation",
    "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
    "drivers": [ "xe", "i915" ],
    "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
    "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                       "kms_dsc_helper.c" ],
    "fields": {
        "Run type": {
            "_properties_": {
                "description": "Defines what category of testlist it belongs",
                "update-from-file": {
                    "append-value-if-not-excluded": "Xe FULL, i915 FULL",
                    "exclude-type": "regex-ignorecase",
                    "include": [
                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },

                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
                    ],
                    "exclude": [
                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                        ]
                    }
                },
            "Category": {
                "_properties_": {
                    "description": "Contains the major group for the tested functionality 'Display'"
                },
                "Mega feature": {
                    "_properties_": {
                        "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
                    },
                    "Functionality": {
                        "_properties_": {
                            "description": "Groups tests on buckets containg more detailed functionality"
                        }
                    }
                }
            }
        },
        "Driver requirement": {
            "_properties_": {
                "description": "Describes any Driver specific requrirement, like i915/xe."
            }
        },
        "Test category": {
            "_properties_": {
                "description": "Defines the test category. Usually used at subtest level."
            }
        },
        "Description" : {
            "_properties_": {
                "description": "Provides a description for the test/subtest."
            }
        }
    }
}
