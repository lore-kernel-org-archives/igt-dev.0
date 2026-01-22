Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB11D3EE67
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 13:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921E010E9AC;
	Thu, 22 Jan 2026 13:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NIV9UFVo";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093CD10E9AE
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 13:39:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 67016C21AA4;
 Thu, 22 Jan 2026 13:39:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8B43F606B6;
 Thu, 22 Jan 2026 13:39:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5232E119B81FC; Thu, 22 Jan 2026 14:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769089143; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=YwDxDdGkFZg633wDIMhZ8MXYy/VKIraW7XuYeU8fGMI=;
 b=NIV9UFVoen6GcSxqqPw6HVduAnLx9jEsc43r41iwRvSiIEEuOue0rkz6mLrKoCy/H1hZO4
 jvByDB9Gzu9NWphkIGytLAVykW6h9ZMqB3j/KBeVt5s/IFL6YCDw2SNJ5UI+5Zix9ZH2H3
 RWK1/kXUUjtknjVmv3DZiAXFWJYNTxyZVQHV0U5LNVWUDBxVE5vGCI2fzG56sOLJNmlowy
 XATpplUUfjpmI7/D6vzkBmdY4RScrEZ0gdHoqckFSRuStH28vBDfpGToLsigsnu+fFOsRt
 RPKoJgd1AHL4ocnJllYd2732vinyDb7Q/91tICAS2lfgJBpPVBSE04mvLf1YnQ==
Message-ID: <e8f4c0f4-8b96-4d58-98a1-bc1ae78078c9@bootlin.com>
Date: Thu, 22 Jan 2026 14:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 0/5] lib/igt_kms: Helpers for connector managment
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com
References: <20260122110400.330188-1-mohammed.bilal@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260122110400.330188-1-mohammed.bilal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

Can you take a look at [1]. The first patches of the series are the 
same, and my colleague started to review them (I am working on the v5).

I don't think there are too much difference, so can you review the 
series so the first few patches will be applicable on the next iteration?

Thanks a lot,
Louis Chauvet

[1]:https://lore.kernel.org/all/20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com

On 1/22/26 12:03, Mohammed Bilal wrote:
> Changes in v5:
> - Rebase on top of current master branch
> - Resolve merge conflicts in lib/igt_kms.c due to new writeback and lobf
>    debugfs functions added to the codebase
> - Add necessary includes alongside existing headers
> 
> Louis Chauvet (5):
>    lib/igt_kms: Add a detect timeout value
>    lib/igt_kms: Add helper to wait for a specific status on a connector
>    lib/igt_kms: Add function to list connected connectors
>    lib/igt_kms: Add helper to obtain a connector by its name or MST path
>    lib/igt_kms: Add function to get valid pipe for specific output
> 
>   lib/igt_core.c |   4 +
>   lib/igt_kms.c  | 270 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h  |  18 ++++
>   3 files changed, 292 insertions(+)
> 

