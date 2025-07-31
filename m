Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC7C87FD3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 06:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C38F10E2B4;
	Mon,  4 Aug 2025 06:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zp/hdcJx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580510E740
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 09:24:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A3B343D71;
 Thu, 31 Jul 2025 09:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C65C4CEEF;
 Thu, 31 Jul 2025 09:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753953855;
 bh=oZn4nAohkSZx4730Lyy79hcp9xR/gR+wESqn1QVOdBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zp/hdcJxc8EcHkmTalLWy0p3R5G+G9L5OagsBZBVloF55Lyx2QKU7TB8Uq31sIELh
 m9MT6O77xS30oa39BtOL5MwvUyOqNBoLNs38b10uziWWXiEmiBx+0TOOWY5NJzcGeV
 w4dOlSQzCS7tQKzW+pTIg7TQ9vrOX8KCrJX7U2zYttT4K4KCdRp0A0+6U+xxdxeTjo
 ytaLiPdAJK8RJ3/taOapTCSNfWsDT7EylUtkP/Q8NdoKiTPz3Y62H67Bjs12f81YN/
 bFo0Q6DmFn9F8L5DN0ZjpAZQam6Czgq+GgG3neFZZae0qI99+00Mtl1FY0Ls1Dwpck
 Gah2Ncut9vnJg==
Message-ID: <287bdc56-21bf-450b-8c8d-a2a2485545db@kernel.org>
Date: Thu, 31 Jul 2025 18:21:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_pm: Skip LPM policy control on unsupported
 SATA hosts
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com, anshuman.gupta@intel.com
References: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 04 Aug 2025 06:08:50 +0000
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

On 7/31/25 4:41 PM, Chaitanya Kumar Borah wrote:
> With [1], LPM policy control is now disabled for external SATA ports.
> This led to a regression in our CI runs [2]. Discussions on the regression
> resulted in patch [3] which introduces a new sysfs entry, querying
> which we can determine if LPM policy control is allowed on a host or not.
> 
> Store/Re-store LPM policy only when it is allowed. If the sysfs entry is
> not present assume LPM policy control is allowed. This  maintains backward
> compatibility.
> 
> [1] https://lore.kernel.org/linux-ide/20250701125321.69496-8-dlemoal@kernel.org/
> [2] https://lore.kernel.org/linux-ide/07563042-6576-41cd-9a95-de83cfc95de1@intel.com/
> [3] https://lore.kernel.org/linux-ide/20250730001947.332661-1-dlemoal@kernel.org/

By the way, I queued up this patch and pushed it to libata for-next branch. So
you will see it in linux-next tomorrow I expect.
I will send this (plus other fixes) next week to Linus to have everything in
6.17-rc1.

-- 
Damien Le Moal
Western Digital Research
