Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9D1CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 21:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51B10E12A;
	Mon, 25 May 2026 21:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QdNjk53r";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEDB10E12A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UldoAce+2KeS4ZZTDO0YtRK+0VDTuLo0FQ7khByova4=; b=QdNjk53r/onbmKoszty+TpSWUn
 zmTWUXscYxvOgR+1sEW5kGwGwuvirUF9zpAK96xdOGZzpDnnJrlAWAar0lKM2eV7KOJMMs4iClVax
 TRisG8wfrYnea4aAJP3IvNIBBfBUbNStWtoa6w3K0UIWds/FtJatvugIWL92agA7lZqcXp8pwBwoE
 WhHI7EkMoEKE+KnwKu3gXHQw1xzAy3pXyhMhzFULyMtMmiGiGuGP0YQ1bkOTSaVdaNITTAE521QNU
 Uhp0i25W02jNtG0ROsFdvh4sBnxXbYTERiu7Pr/0bZfb2evK/LxQQ09s7WRRwbzT89/Bsow7bNMMl
 Cdx1r9mw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wRco3-008ATe-8J
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 23:25:51 +0200
Message-ID: <7016a9eb-48a0-412e-8b27-fd9f29ed9dea@Igalia.com>
Date: Mon, 25 May 2026 14:25:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fcolorop=3A_Assorted_fixes_and_support_for_i915/Xe?=
To: igt-dev@lists.freedesktop.org
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
 <177974334638.7222.8314337428486114681@6beec6c84f66>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177974334638.7222.8314337428486114681@6beec6c84f66>
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

Forgot to mention in the cover note but this patch set is based upon:
https://patchwork.freedesktop.org/series/156913/

John.


On 5/25/26 14:09, Patchwork wrote:
> == Series Details ==
>
> Series: tests/kms_colorop: Assorted fixes and support for i915/Xe
> URL   : https://patchwork.freedesktop.org/series/167234/
> State : failure
>
> == Summary ==
>
> Applying: tests/kms_colorop: Add early skip if pipeline is not supported
> Applying: tests/kms_colorop: Assert that the CRC query succeeded
> Applying: tests/kms_colorop: Add cleanup of writeback connector
> Applying: lib/igt_color, igt_fb: Add more BGR support to various helpers
> Patch failed at 0004 lib/igt_color, igt_fb: Add more BGR support to various helpers
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
>

