Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD44C54E4A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 17:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289910E5C0;
	Wed, 28 Feb 2024 17:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9LPmmR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240D10E5C0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709140636; x=1740676636;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JjGQHKKfbQwMHTxJ7IuCemAe7PQM8pKDXwPyV59FqJU=;
 b=B9LPmmR+7XXfUkMBAkvBYKffZ4rzXI5nFKdM6bi/KUpQ403zFxqT4Scj
 KiasAzID1PxZ4a610tTms1+ltzFkqb1XD/kdFLHKB6jbleBh8+ETpQ4Db
 /Niw3Aw0h+RNzY9xf3W7fwzj50CNS0RcTZT+queDieFNNM07YPkox5me9
 STu/RpyL9h1TmwKlSBY7E2X9sP9BPWVnS1LB+053LvSrFbvkaX22CZxwI
 Ya7PYOK1Ug8cPOvuhW/4W/L9Yjimkj7Fook8CIuBeievz1v5QhT4knjSi
 OWCXpESqw5v0ZJoZWpB7QCxgF/QKkR0yt6ISxTmMi8Ie8SaTHcRqiBLvm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26019912"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="26019912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="45025106"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:17:15 -0800
Message-ID: <ec050e14-4356-4e4d-8a86-4fd022b7659e@intel.com>
Date: Wed, 28 Feb 2024 17:17:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/7] lib/intel_bufops: Use common helper to fill
 buffer with pattern
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-6-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-6-zbigniew.kempczynski@intel.com>
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

On 28/02/2024 14:54, Zbigniew Kempczyński wrote:
> Filling pattern is now common in different tests so extract it
> to bufops dropping duplicates in few places.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
