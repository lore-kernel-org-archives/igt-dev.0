Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6157EC36000
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 08:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BBF10E081;
	Wed, 19 Mar 2025 08:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5Mpg4oW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5248910E081
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742373724; x=1773909724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X5C+7S5l3FQgycrSXY9ck+yuMtGBCo4cmKscd/TNYGs=;
 b=L5Mpg4oWr2MYMFG/bOYpn+Mu/g5uXtSBCiRE+4uWr1KgoFdVqDerGwAI
 FRq4L9K+Cr1RTsgzbQEQY2qnpn/NZhfSESocaYkI/JjxKde/54ZaU+fGw
 ivvXuKo8qWjCOpFN8U7HcQnzVlGjOulkGzfI3fMsRc76jlsmzM/KTF2Ld
 vf8lFNAylb5fOAzKP0+JfYstZCwoPCoV8O8rbhevaqqTZGPzfitK8KQBB
 BHlrUlT3Ll0rBsCrZu6u8L6loMqK9rCddF7rYL36GN5EY4AZFiAVbiaIG
 TZszydpoANw/kMnBH6P1qVVjccpA7s5QnRR9iBG0iFK4hqGGZxRmzxWKC w==;
X-CSE-ConnectionGUID: rboyqu9wRqeTPOFvbbj22g==
X-CSE-MsgGUID: 4vsas08cQR+fNYKX0+N1Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47328574"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="47328574"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:42:04 -0700
X-CSE-ConnectionGUID: /7qiL6eZQceSWx93YKWzlA==
X-CSE-MsgGUID: MZYDB3YrSAibqMlxjzAjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123276553"
Received: from anoopn-mobl3.gar.corp.intel.com (HELO [10.247.161.84])
 ([10.247.161.84])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:41:59 -0700
Message-ID: <8788fa2d-3498-4fc4-9c81-dbefc9d15aac@intel.com>
Date: Wed, 19 Mar 2025 14:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/5] lib/igt_kms: Add a detect timeout value
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com,
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20250110-b4-cv3-01-igt-kms-v4-1-0b0474708f9f@bootlin.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-1-0b0474708f9f@bootlin.com>
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


On 10-01-2025 23:12, Louis Chauvet wrote:
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
