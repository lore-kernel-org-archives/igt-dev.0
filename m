Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1985FC36008
	for <igt-dev@archiver.kernel.org>; Sat, 29 Mar 2025 19:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D6010E05E;
	Sat, 29 Mar 2025 19:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QNe5vd20";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4B10E05E
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Mar 2025 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ytqJ/v0uX2ykl4h95jrUdFdpCPJth2vPL6GzrJmN540=; b=QNe5vd20tssQhB5QD76Lz6dK2G
 IMJiXipZRxqp9dHiTTSQlxMoBQt9Fp4p9DT0YAjfVYdKhBP/Uywy2xsvTKhWYnoqSaZPw+puK3jNJ
 2t97JVp+Y/FtmNDkNofS7FXyL6/aDBFePMRcgpO4cHECR+RwPvgFsnQIooPhI62gHGet+KTnaYXd9
 7OxBbsvTC5o6Kq390bldnRe7v661t2hF69iLK75rlAluUFgvxsdQVTCeakN53ASILsqq0EFqFJ2OE
 jVMYBAKYBtu8LOwrk9yslxqjPKGii4nuPTpE7WUNDnXqkqvmnwCrQH0XMxS+ZwLtWtVfH09D/9dth
 XNNXzTVw==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyc0r-008Tbn-5g; Sat, 29 Mar 2025 20:38:37 +0100
Date: Sat, 29 Mar 2025 16:38:26 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v4 0/3] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <dazbbo3yakxx5fh64xffcbuqi3o27ef5l5ev7lqfngrmctlxjz@uzvrgccgedf7>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327221601.19086-1-andrealmeid@igalia.com>
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

On 03/27, André Almeida wrote:
> This patchset creates a subtest for overlay planes. This is supported by amdgpu
> and is merged in the kernel:
> 
> https://lore.kernel.org/lkml/173948734065.719858.7405160715916126757.b4-ty@linaro.org/

Hey,

I ran these changes in kernels w/ and w/o atomic async flip support and
w/ and w/o overlay async flip support. I found some problems, mainly in
the way the test handles failures, but also with overlay async support,
overlay-atomic skips when running in the `kms_async_flip` subtest
sequence.

I tested with Cezanne DCN2.1 with Debian and amd-staging-drm-next branch
with your overlay async patches on top (kernel w/ overlay async), kernel
from distro (kernel w/ atomic asycn w/o overlay async) and mainline 6.6.

Melissa

> 
> v4:
>  - Created a patch to check for DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP, so drivers
>  without support for it, skips instead of failing (Melissa)
>  - Encapsulated all test paths options into a function to easy maintenance (Melissa)
>  - Brought back test description for GitLab compilation
> 
> v3:
>  - Fixed a bug that was mixing `alternate_sync_async = true` with the overlay path
>  - Refactored how the test parameters are being set/unset (patch 1/2)
>  - Fixed a bug where a primary buffer was being used with an overlay plane
> 
> v2: Add test description for GitLab compilation
> 
> André Almeida (3):
>   tests/kms_async_flips: Check for atomic async flip cap
>   kms_async_flips: Refactor data options
>   tests/kms_async_flips: Create subtest for overlay planes
> 
>  tests/kms_async_flips.c | 86 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 74 insertions(+), 12 deletions(-)
> 
> -- 
> 2.49.0
> 
