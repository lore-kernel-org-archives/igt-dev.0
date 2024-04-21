Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A391AC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 09:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65610F4F4;
	Mon, 22 Apr 2024 09:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ourmail.work header.i=@ourmail.work header.b="XcRlDLcE";
	dkim-atps=neutral
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Sun, 21 Apr 2024 23:27:38 UTC
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4410E52F
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Apr 2024 23:27:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ourmail.work;
 s=default; t=1713741738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QN5QlP+c19u/HDFiJx8twQBCO47dRKMD86TF3VhpidE=;
 b=XcRlDLcEN9GP/13ZvSnF7Pqw/sDf5wmq0e30EIWoE6gFyUopLDH1APgIOT6n5ZTN0AkVYd
 UqJTIkQnHhyY/53tSWFmiODtir6MzxdovP2qJBjmXK9ch2q8KcbkxlqyuuMiJ8kOYptpFO
 EQQHZTqhzRdueT9ikUSlG7IP3PYzk5c=
From: Reagan Bohan <reagan@ourmail.work>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] Misc. musl libc fixes.
Date: Sun, 21 Apr 2024 23:20:45 +0000
Message-ID: <20240421232204.31704-1-reagan@ourmail.work>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 22 Apr 2024 09:09:36 +0000
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

These patches fix the non-standard includes sys/poll.h and sys/signal.h
as well as defines _LARGEFILE64_SOURCE for musl libc, else off64_t will
not be defined.

