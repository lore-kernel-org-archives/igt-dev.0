Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989CC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 13:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB28210E1B5;
	Wed, 15 Jul 2026 13:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oJPP19eL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09AE10E1B5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 13:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=ht34DGY/G7hzmy8FzcDJZKcXsWfifS6G/Jemy9ZzB9g=; b=oJPP19eLX/0QCIuIoeooLiV4f0
 HTBGoaIFR4W3/bgA2Tj3yOKfLsMJF58uQAWbGVscQlezIhrYT1V9nGMBAKpLOdMclANgTHRfw3Ctd
 +gD/8S5UfUaOzeO/s15/+kXsgjOtHiTTXZKUBA8hSL3PpRKtECwC91+KpeSY0zHb/cav4CqYPNsO+
 uGcvrALAPfwpfH+TGhc8PNJOS00GcF7mvZ6vmxlTVNCwhpD3rwkcBMFKKiSEDVPA3jTB1dVI3+kKP
 g2ZjazV04V1Hw2nKsIDqjUTQFYfDLYeld0IAE0FyRkkTyF84WvnEJxlRYglE62gz1RttXMcRhvNBB
 W8z2mfaA==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wjzma-00FTTw-7c; Wed, 15 Jul 2026 15:36:16 +0200
Message-ID: <87842c6f-f1b1-4a85-94bf-195a4930c247@igalia.com>
Date: Wed, 15 Jul 2026 14:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign
 + LR mode
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
References: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
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


On 14/07/2026 16:12, Marcin Bernatowicz wrote:
> This series extends gem_wsim VM management for Xe.
> 
> Patch 1 adds explicit VM create/assign steps in workload descriptors:
> V.N to create VM N and v.N.M to bind context M to VM N.
> 
> Patch 2 adds c.N to enable compute/LR mode on selected VMs.
> README is updated with syntax and VM usage examples.
> 
> Marcin Bernatowicz (2):
>    benchmarks/gem_wsim: add explicit VM create/assign steps
>    benchmarks/gem_wsim: add compute/LR mode support for Xe VMs

I see these two patches have my Suggested-by but to be honest I do not 
remember any of it! :)

Can I use the opportunity to ask how is the status of the tool on xe? Do 
working set and working set dependencies work for example?

Regards,

Tvrtko

>   benchmarks/gem_wsim.c  | 310 ++++++++++++++++++++++++++++++++++++-----
>   benchmarks/wsim/README |  32 +++++
>   2 files changed, 311 insertions(+), 31 deletions(-)
> 

