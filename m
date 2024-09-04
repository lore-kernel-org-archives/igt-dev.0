Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A57CD5BA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1B10E7F0;
	Thu,  5 Sep 2024 09:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=alyssa.is header.i=@alyssa.is header.b="RALhRIFI";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jIO6DGM/";
	dkim-atps=neutral
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2024 13:56:21 UTC
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C6810E795
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 13:56:21 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5AFAB1140234;
 Wed,  4 Sep 2024 09:50:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Wed, 04 Sep 2024 09:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1725457809; x=1725544209; bh=gNvrB8PgtmPnQWFL8ZKKd
 cQM6Xq7dIYgQHJZ5tkDbDI=; b=RALhRIFI+IwXHq4Htf2vC88+Ex6Q3He6g4tVw
 a2TSF2L6JkpTJgTbvQb8jjd8pMiO0SWDptrniCcOSjYpwcbPrBQRlxP1aBISsjef
 zODiZZz3KNfmFNpDBJw3xIMfbuxi0cXXzk5YPG+PdR0Pqcbpr+J0/Tcav1JMmz8x
 6nO8V8NzPvPUxENNHIbsjYvIkOOS+6rvw8qlK7nFU3bkzL/wO6Di4mjlAc3jq0DY
 LO2m7nW8HDLCvM6tKwhTaN2DS7Dv+FJS0kqqjye7GrcbscqJbRCbn5s2o9iRC7Y9
 wiozao40zfWLQWnUSDaG6qdfK+ll12DiywvqQy4HeKDfuU71Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1725457809; x=1725544209; bh=gNvrB8PgtmPnQWFL8ZKKdcQM6Xq7
 dIYgQHJZ5tkDbDI=; b=jIO6DGM/59fmlUf6zbL8EGnRNXLuMiqw+JL63sLKdSnU
 33fM7eINyUmE3XxVD4M+iIZqx9WH29yja/e/XnZoRzHj73iNojZHftmO2eVGMRvU
 /MASlCZpn9MA4L1UwiA0DcUeqH6SRr9F8CK/VKDL83VhEDEOQlXgdxPTOKZBp5K9
 IYOgCGsBRM2vLbzrXyNfSZb+teBu5Rc87XstgQ5Xd5qdTU8y7NXfreQqTOEs3fpW
 0cH3vbD8XlE/zyplSKxljgsAILkivcfZ5E1W7u+SwBgnr0HIF5Dx+VnR/6Jx3KxO
 vJiywnNkz22YLhYFURyJ9qkMlQYHh/XKp50HlbEWiQ==
X-ME-Sender: <xms:kGXYZgEfmZWhGhdsHsdvb2ksBc6QQUDSQFGsc7Mk_ZHIsQitboH3dA>
 <xme:kGXYZpU17_6DX-m7a3Zp7NRP831nQU2Edf71RmNyOHJG0LhohduNht-b3pmeVJbf2
 DpjDXrVR5MODuH6QA>
X-ME-Received: <xmr:kGXYZqIGugjtWWulRe3ZXbrNthESQmtU8vZ5fec7jDNnjpIo-LN28HC7JMoSvBJCzRGxdUfdtfcjL-IF8rao-2KtXxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
 rhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhisheqnecuggftrf
 grthhtvghrnhepheekgfdtveettdekuddugeeugfdujeehuefgleegtedthfffudfhhedu
 hfduuefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 ephhhisegrlhihshhsrgdrihhspdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopeigsghjfhhkrdhgihhthhhusgesghhmrghilhdrtghomhdprh
 gtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepjhgrnhhushii
 rdhkrhiihihsiihtohhfihhksehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoh
 epkhgrmhhilhdrkhhonhhivggtiihnhieslhhinhhugidrihhnthgvlhdrtghomhdprhgt
 phhtthhopehighhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpd
 hrtghpthhtohepshhtfehrgehgsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthho
 pehtrhhirghllhgrgiesthhuthgrnhhothgrrdgtohhmpdhrtghpthhtohephihukhgrse
 ihuhhkrgdruggvvh
X-ME-Proxy: <xmx:kGXYZiHLZbcS1gvJ0DD1qttBlthmrmeQ1CWQqScHgGsWS0uwio8y0w>
 <xmx:kGXYZmXnhqfPkURfVmDavH1GPpj-Yy1vOt_i4k-oIqMUE1I9n2CIRA>
 <xmx:kGXYZlPgV_DhaFqdT9IfnLCpfoPDYSTpjvvJ4Df5IcSa0Xwr397GOw>
 <xmx:kGXYZt2mFoJg5EWSRePgYfezEAaInjIaoxIvI5Is_mJ2SMvHjd3lBQ>
 <xmx:kWXYZqrbX6Qr1ygsAAvOX6oEJFSMUF8vBJOcpBce0t1_C1lfJXoGparT>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 09:50:08 -0400 (EDT)
Received: by sf.qyliss.net (Postfix, from userid 1000)
 id E2EF13028F6EC; Wed, 04 Sep 2024 15:50:06 +0200 (CEST)
From: Alyssa Ross <hi@alyssa.is>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Anas <triallax@tutanota.com>,
 Stefano Ragni <st3r4g@protonmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Reagan Bohan <xbjfk.github@gmail.com>, Yureka <yuka@yuka.dev>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: use basename from libgen.h
Date: Wed,  4 Sep 2024 15:49:48 +0200
Message-ID: <20240904134948.1337335-1-hi@alyssa.is>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Sep 2024 09:25:56 +0000
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

musl only provides the libgen.h version of basename() that may modify
it's argument.  That's fine in this case, because in the one use of
basename() in this file, the buffer is never read from again.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 tests/intel/kms_pm_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 5af3e81bc..852e9cb5f 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -27,6 +27,7 @@
 #endif
 
 #include <dirent.h>
+#include <libgen.h>
 
 #include "config.h"
 #include "i915/gem.h"

base-commit: fc3113c8c1e99797b2d4769aaf02265be64a7589
-- 
2.45.2

