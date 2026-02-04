Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA1E9536D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BFB10E5B0;
	Wed,  4 Feb 2026 10:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xupli4t4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893110E5B0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770200710; x=1801736710;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0trloMImGTosAYIB4xjXQCb/jsmcIwyQMsq+9/93yB8=;
 b=Xupli4t4CkA+Xn84mRZ5fadq04NHRsV0Ga0497EWCbkxvUH1cluFGdU+
 9/RbW0e2lyjPvDjkQSAUUPK7ICws84XWmALwG85lvgkuyfw2WeaeBhbpM
 2TAaMXgXmq6J9FUeglV5PPzFydLLy2z7FNWsufGFcj3aqkv3d/HPehudf
 905taGGYrHGAY/cTQx0pl89BobwYjiHnlVURwWeMY4cqOFHnPh2Hljmzk
 bVPoBqKCbAD9cKHbgOXp1q+deU66AQ5oHTWdfPCSckpjr6wsJSepVNoul
 +DwMXXdL/LaC+7hv8+hF8Z8Qrgvevp4ZfkSKcOzmm6NH5ZjxrJODhYHiV w==;
X-CSE-ConnectionGUID: 5JA9tUrmTo+1OQHHWWQ5Bw==
X-CSE-MsgGUID: AgaEEG3vQUillX+SduFleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71468824"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71468824"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:25:10 -0800
X-CSE-ConnectionGUID: +nd/9a5uRkSrEQm5D2Y9SQ==
X-CSE-MsgGUID: GdKNHt3ESv6lsmfqhUu89g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210177957"
Received: from kirancha-mobl2.gar.corp.intel.com (HELO [10.247.183.166])
 ([10.247.183.166])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:25:09 -0800
Message-ID: <ec86974c-dcd0-4683-9105-6f091f404d46@intel.com>
Date: Wed, 4 Feb 2026 15:54:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v2,
 1/3] tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260203061036.21482-2-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203061036.21482-2-jouni.hogander@intel.com>
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


On 03-02-2026 11:40, Jouni Högander wrote:
> Implement helper to detect need for Early Transport check and use that to
> figure out if Early Transport check is needed. Drop et_flag from data_t.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
