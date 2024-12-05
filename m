Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F32E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 09:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDEC10F046;
	Fri,  6 Dec 2024 09:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hfKdeLan";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598C610E3BD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7KSH3TSnpljEqMz0GqgwmPRYNjaEeeNj/gznaPWE5u0=; b=hfKdeLanc6/OeJ+EpN0dmgK0nd
 hSZjoKvzrhb9eQrcCrk26dFZgkxvwwWq5iCxqKkK7a/4DeEzexjRlt0ctS5ihESd3a99Iv4YTzjlw
 RhXj9kTSO9QEb97PIBObjKywmFySJDUSQ2zleO96OqscK8qgaKUuFSluAPiruuJgojAZs4Xp7a8RD
 c5lr+uW+Ey9Agy99NHh/3Wx7JlUZXKbRM9DiBMR5II4z1iFctvIbEIFTjc5qUJ99Wtb/FgZAPetvl
 zlu44/DAhxsCpVIOkPDRTkACDVl5ZcOng9Xbm6m9bx0VSxVLXHAHD+xsc6dgJRdDhHJg45c4Gj9Zd
 dLMTsLRw==;
Received: from [177.139.20.227] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tJDmW-00H1hF-SG; Thu, 05 Dec 2024 16:28:45 +0100
Message-ID: <f6ee3a67-32a6-4e4a-886e-c1c4b37da918@igalia.com>
Date: Thu, 5 Dec 2024 12:28:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] tests/kms_async_flips: add atomic test
To: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 kernel-dev@igalia.com, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20241201183841.71046-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241201183841.71046-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 09:25:54 +0000
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

Em 01/12/2024 15:38, André Almeida escreveu:
> Despiste async page flip support for atomic uAPI being merged into the kernel,
> the respective test wasn't merged [1]. I have rebased it and proposing it again.
> 

I just realized that a similar patch was merged [1], so this one can be 
ignored.

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/296891df840e70801f806898d46ccb0abf5e2db8
