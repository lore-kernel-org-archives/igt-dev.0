Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCE9C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 15:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B1910E9EA;
	Wed, 28 Feb 2024 15:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBWzKbWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766E610E9EA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709134566; x=1740670566;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lMBaMTojBt2QGtYb44Kwkg3HY/MEqqmRYFsIY+l5Ftk=;
 b=YBWzKbWlBMAi0lNStUlTRjCy8gFY9S4AuhEyr/t/5gmMlAIdtXKmhF+p
 elJMpZ+zJk+ghoDHIlGMqy2SXGsN/R2AetgNMBlafjcpiLloJgvStSd9c
 CJyXSUpz+BnVNOLwxPEfDv+17oisM4XNCuE+GowF9hy0hQ9jAN2siOnL3
 soMXRBXas44lwbdSOEao69QYAPIWKK0DcEz49C32LymR+OaN42PpPuUZ7
 NYPFsWzIHdLa9e/AWMUAW8QoF2eUudqOtvFgL9niZm4HWkB+gMEbwbVXX
 I6H2bEmHB5/lz5OS8DCzzNr5eZtbIoA54r3M4MY38Z7N2/8GdrEcVPdCD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3405347"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3405347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7898787"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:36:05 -0800
Message-ID: <7e54f2bf-4b87-4308-9e06-92cd1e90a83a@intel.com>
Date: Wed, 28 Feb 2024 15:36:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] lib/intel_batchbuffer: Fix intel_bb_dump for Xe
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-3-zbigniew.kempczynski@intel.com>
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
> Dumping bb is compiled conditionally so I haven't noticed it won't
> work properly on Xe until I just needed to use it.
> 
> Fix dumping batch allowing to dump in binary and hex form for
> external processing.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
