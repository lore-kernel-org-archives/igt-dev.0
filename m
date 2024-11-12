Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7638D41D53
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5561310E233;
	Tue, 12 Nov 2024 05:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVUx1o3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77810E233
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731388284; x=1762924284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5XSbSLXlXpS958WvvjpKi7xhoPpR5He65Jmk12xjggQ=;
 b=kVUx1o3OZ8nzPaXys+zFmbNwGLKg+v46BO0GH5IU8WKq/kxWE6EEAYWW
 MWRjpBXk5Pv5/xfpaw81NxNoNLmfedn0ziUkqcGgDQGoOm6Yy5mm0/xSu
 x3Oci3kkNVPRhbp/vIJiG9a434cU5IJY+ZLzeBf7N9Exti4wK/EY32yaK
 BYfIk72EVlmJETTloBa8KGcw8Ee+8UsuBUgVKh7alVIQTmC4RqyHViLSj
 0dVeqrSk8Ms50Gzp9v5Gin1YHi4xvgGjTgj9sqnqHnnf1m21xU+ScE41C
 ZeSGZTMpT6jMwol6f2FSdj0FFxEGHTqz06xFtK+nPbxiy7Awd0br7mmx9 g==;
X-CSE-ConnectionGUID: 8dIMxWkEQfusUo2j29P33w==
X-CSE-MsgGUID: 5UJlNr9gTCmYWD98s05Vjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42304236"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42304236"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:11:23 -0800
X-CSE-ConnectionGUID: 4RamBxa/TRu2+iMLNZPIrw==
X-CSE-MsgGUID: GoYTHDbST5Ko/2JWVAyBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87695751"
Received: from jayarakr-mobl1.gar.corp.intel.com (HELO [10.247.246.122])
 ([10.247.246.122])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:11:22 -0800
Message-ID: <4f1ea6b6-63b1-4385-bbe8-6ee0878fd0f0@intel.com>
Date: Tue, 12 Nov 2024 10:41:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 3/3] lib/monitor_edids/hdmi_edids: Shuffle edid
 with the redundant one
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com
References: <20241112050442.1854319-1-pranay.samala@intel.com>
 <20241112050442.1854319-4-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241112050442.1854319-4-pranay.samala@intel.com>
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


On 12-11-2024 10:34, Pranay Samala wrote:
> The EDID for the 1920x1200 at 59.950 Hz mode is already included.
> It will be swapped with the EDID for the 2560x1600 at 59.972 Hz mode
> to ensure full coverage of all EDIDs.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
