Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E8ACEDDA4
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 16:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9610E505;
	Tue, 18 Nov 2025 16:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vf3iLu1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2009F10E505
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763485011; x=1795021011;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TYd9DT8HdNuV/ZAhpBn0Wog+P+jX4IE6oTuDADTjE6s=;
 b=Vf3iLu1oJwGA82VNnn9W9R8npj81G05/NiyBthUFlnWUicInyb++AZ5p
 4vUQh2ayvVtx7GBh2GNYatOeGZs7+B3ccDpfHMekJawVIwLc61tKYbwGJ
 lhbvLsjqa+CeBuwBfwa1yJ2BuWJcM45eHYA/YAGGAlOHsf3Cl0GnZQnDY
 LRB20qb+A7T0GTJhpwLmhfvkmxYVvujzVWNhqUPBS2yATFZjfGr952HK3
 JhCn2JWPLdSv6G1LR3Vgds2xqAk7P6Tmm57SIQvROj4fPjJlVfBI82dq4
 iwvlp3rnaBGd3MhDb8iGVSaxPOdcIEWkegcdebuSVcoo8BMwCIHc7w4vU Q==;
X-CSE-ConnectionGUID: yPztSAbuRkW91S/AeoiDwQ==
X-CSE-MsgGUID: diQ56wDbQtOti/XHRfmKgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75838890"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="75838890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:56:50 -0800
X-CSE-ConnectionGUID: JUwnDrkARGyYJ5ELoNrUCQ==
X-CSE-MsgGUID: kE03UMPeT12b1YCt9xOF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228142361"
Received: from emccabe-mobl.ger.corp.intel.com (HELO [10.245.32.67])
 ([10.245.32.67])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:56:49 -0800
Message-ID: <08970521-fd84-4f75-88f4-a92b32292e94@linux.intel.com>
Date: Tue, 18 Nov 2025 17:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Redesign of the xe_debugfs test
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 11/13/2025 12:46 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> As part of the work on patch [1], it became necessary to update the
> xe_debugfs test to account for the new debugfs structure. However,
> while reviewing the test, I concluded that a broader redesign would make
> the test easier to maintain, extend, and adapt to future debugfs changes.
> 
> As part of this redesign, I propose replacing the old subtests with a new,
> clearer layout. Instead of the previous subtests:
> xe-base — validate debugfs root directory and check the contents of the info file
> xe-forcewake — check the forcewake node
> the new subtests would be:
> root-dir — validate the debugfs root directory
> tile-dir — validate the debugfs directory for each tile
> info-read — validate the contents of the info file
> 
> The new subtests rely on a table-driven approach: all expected debugfs
> nodes are defined in an array. This allows both conditional tests
> (e.g., testing vram_mm only when VRAM is available) and dynamically
> generated nodes (e.g., gt%u based on gt_mask, or tile%u based on
> tile_mask).

I think the redesign makes sense. Please let me know how can I help further.

Peter
