Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D3C47DAF
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 15:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC40510F3FF;
	Mon, 22 Jan 2024 15:19:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6567910F403
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705936751; x=1737472751;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Zmvwe7eWJNIOY8a3Unh3YIfWBvubjKvzVqqWY94Ov3k=;
 b=oImSsDJSmOMU7176AWAxBvW2d67oruILFCcP6OtCp6WLVRbOozDlLsJD
 XVGuQtEv3jSGWeQ6IkTCUCbroUMLhxm6MJ+W70JvWCnZdht2zQx3U/lG8
 U3zOV6UifiQBCEwOGCKL97zbo5bjVPm1Tw+6CvOpUHQjK+n4YLCjg2XRS
 ix53k7YxP6ypOER0rBPuTFZeO32avc2nMcCiqRCmc+HT15LiIdbqudcFf
 5bzuOMv43g1qYUARhR8TEdwli9sA973imMG0TsNXna9SpvB3m5rjEh4Ml
 FzREhCaj1G9OvxhUBLMjASlSRjFbzd2RsTtIS07Wj2yFWuxgdBVwDY+s3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14576536"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="14576536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="958768086"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="958768086"
Received: from boherlih-mobl1.ger.corp.intel.com (HELO [10.252.18.185])
 ([10.252.18.185])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:18:19 -0800
Message-ID: <f90cf779-2bd5-4384-97d7-1a066bf72e5a@intel.com>
Date: Mon, 22 Jan 2024 15:18:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] lib/intel_batchbuffer: Implicitly increase
 requested bb size for xe
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240122151641.330759-1-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240122151641.330759-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/01/2024 15:16, Zbigniew Kempczyński wrote:
> Due to batch prefetching on xe driver lets add implicitly additional size
> to user requested batch size. Such should protect the user from being
> affected by CAT errors when hw will touch offsets after user requested
> batch size.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

