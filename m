Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A361CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BBD10EBB0;
	Thu, 15 Oct 2026 13:11:21 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407AA10EBB0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1792069719;
 bh=dqCb+0UKyVgTvLjdI6mDXS49qXKydqt9GrwHlFTxb3w=;
 h=From:To:Cc:Subject:Date:From;
 b=BjvRsx7dD09I6x97DSeFDfQPTFRf8wQ7IsrSdPAFSWxo0Xl31KhrTNderxv2czyhN
 TAqi//BIlVQz/CyB9o9UUsgS0GvOSvuFRLMjTPY2p41hCUGIGbeF7PbnAOAnW9ljp4
 Hj6RR7SFNJOphspmE6Si/+mBPV4iJcyAVV21+f96jnDDFCDgEn0nvpJBZz/bBTdHaj
 Taj0XbPN5UYDor/onH2IQLr322sipgafaPkajuFf8fAwdE11ikOV06wJYcbHucWMTC
 ce2uEbaZ3OT/egGsbAcQ5fzf7NTYPOvNh9yCMYOiFqTEw2DSwULL6aVmVbHIZGz0s0
 QRDp0a/vqSqeg==
Received: from reinforced (unknown [100.64.0.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DB30C17E04E5;
 Thu, 15 Oct 2026 15:08:38 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
Subject: [PATCH 0/4] Add Panthor compute-shader test
Date: Thu, 15 Oct 2026 14:05:45 +0100
Message-ID: <20261015130837.710795-1-daniels@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
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

Hi,
This series adds a test to the Panthor suite to exercise a simple
compute shader. Whilst the existing group_submit test does validate that
we're able to execute CSF commands, it doesn't validate that we can use
this to actually run any shaders. This series should help as minimal
bringup and validation, inspired by a platform which was able to pass
group_submit just fine, but would immediately wedge the firmware when
trying to run a compute-shader test.

I don't plan to extend this much further - at least not with more
complex GPU command types or shader ISA, since that would require a lot
more divergent per-arch code to deal with changes in descriptor tables
and commands - but it does ensure that we can actually schedule and
execute jobs on a GPU.

Tested on v10 (RK3588), v13 (MT8196), and v14 (Lumex CSS FVP).

Cheers,
Daniel

