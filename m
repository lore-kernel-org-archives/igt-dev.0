Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCCC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 12:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036910E50B;
	Mon, 27 Jan 2025 12:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bx327G8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BA510E50F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737981073; x=1769517073;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=itarjibEtB3kNUwNeY9EqAoXdqDT0cBte2hEbT+WaNk=;
 b=bx327G8u3Quqkj/dUXMMVRqfDil0ddAD+0rj6BoFU/RDvdFwmt+FqI80
 HuqxAtwaANqDGtI2xLGNLCSKZynSh866l3cfcwgCHIgAKwbxewUV0g54g
 Ysj7FHFc9z4M23AcJ2w4tRIrLQZIhHfdHzbPMDlJIoX0wPqjViKsVhy+u
 rkK7z4TApDltrKaCJNzvkC8qtxHvfqauAxwTxlj3s6IdaBo1ke+3CW9dx
 FA51a6Tsxg7svqmss5GpJQCMbMMqYlha8fyfWxI8Qtl67pxQ5Bh7mkRfk
 mOjYYhfM/nBvj2VVnNOID2d4grA+kRraB3n4ZP289FisKZz2LCfqK00hf A==;
X-CSE-ConnectionGUID: sEF6gvXtTQabMNbdzFuD0g==
X-CSE-MsgGUID: iJCdsXBgR4eNzDh4sR0T9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49033091"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49033091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:31:12 -0800
X-CSE-ConnectionGUID: p7V2h4zZRGeZqDH+ovJUZQ==
X-CSE-MsgGUID: 1Oz51eOCQMaPyeE92UQ7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108219155"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.14])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:31:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH 0/4] add test to validate uhbr/non-uhbr over sst/mst
In-Reply-To: <20250115073243.2002014-1-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
Date: Mon, 27 Jan 2025 14:31:08 +0200
Message-ID: <87tt9ka16b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 15 Jan 2025, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Add new test validating UHBR and non-UHBR link rates for
> both SST and MST configurations. The series comprises three patches:
>
> 1. tests/intel/kms_joiner_helper:
>    - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
>    - Moves common joiner-related logic out of kms_joiner.c.
>
> 2. tests/intel/kms_mst_helper:
>    - Adds kms_mst_helper.c/h for MST-specific operations.
>    - Centralizes code for identifying and assigning MST outputs.
>
> 3. tests/kms_feature_discovery:
>    - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
>    - Uses the new helpers for pipe assignments and topology discovery.

AFAICT this adapts to what the driver reports. If the driver never
enables DP SST UHBR, it'll happily pass, and just skip the tests. Am I
right? Is that the kind of testing you want?


BR,
Jani.


> Kunal Joshi (4):
>   tests/intel/kms_joiner_helper: helper for joiner-related functions
>   tests/intel/kms_mst_helper: Add helper for MST-related functions
>   tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
>   HAX: DO NOT MERGE
>
>  tests/intel-ci/fast-feedback.testlist    |  14 ++
>  tests/intel-ci/xe-fast-feedback.testlist |  14 ++
>  tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
>  tests/intel/kms_joiner.c                 |  15 +-
>  tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
>  tests/intel/kms_joiner_helper.h          |  15 ++
>  tests/intel/kms_mst_helper.c             |  48 ++++++
>  tests/intel/kms_mst_helper.h             |  10 ++
>  tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
>  tests/meson.build                        |   6 +
>  10 files changed, 469 insertions(+), 37 deletions(-)
>  create mode 100644 tests/intel/kms_joiner_helper.c
>  create mode 100644 tests/intel/kms_joiner_helper.h
>  create mode 100644 tests/intel/kms_mst_helper.c
>  create mode 100644 tests/intel/kms_mst_helper.h

-- 
Jani Nikula, Intel
