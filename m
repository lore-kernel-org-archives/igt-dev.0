Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98BCCD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 15:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AEC10EC23;
	Tue, 16 Jun 2026 15:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="YsPV9wMC";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C2D10EC23
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 15:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781624610; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Tv6dQLTPulMhsgBqR+X/W2Gxy5S8kFjxtDxIfqzQ8xNv1OpYmA7bn6VI0EjKU2zgoFiJzlKOZEejbC4fgHkP6ta+adRJ6Xn3c+S875ZGtsitfbX+Te+Ok4W1a/IREKgW+UM6fsJMkTSvwlnn0WFfJovHUj2vvqNDUgLRSLJISbA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781624610;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gBuJ2qoqMubvGBewtx6p701Fm/40jROdKsogPdKtlR4=; 
 b=dasOJUdOK+ILjmLqpsoe8oUbelZqXpggeQ5tmIMEiv020M2G/RcAK6sUg0GIbsuPFMCsn1tVik2e4t3VVUZGu+DfEUy3sOVp6LUc+/SE/p4Av9m1gNuj7fK97nDXIdY8o4XYh7bn/U0TlcRSj1mn/WaCLQMuLwgr/2XBX0/DAEM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781624610; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=gBuJ2qoqMubvGBewtx6p701Fm/40jROdKsogPdKtlR4=;
 b=YsPV9wMCkCY9KymUzDo32ccJZToIk+7ROg5bt/drJp64AFw/VDLFztmY19R/QrwL
 8M+bB3l9WnaEIQexDcoinoiv+iUxIJot5aE2MlQ7Zkxx5IgCm3dfbqqs5jb2/w5s2+a
 q/+VvVwzOoSWzFHkxhj0H7Gu1iBrHwIq/9E4CAQs=
Received: by mx.zohomail.com with SMTPS id 1781624609580200.47300957458094;
 Tue, 16 Jun 2026 08:43:29 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH 0/2] panthor: Test for checking vm_bind address range is
 legitimate
Date: Tue, 16 Jun 2026 16:43:21 +0100
Message-Id: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDugQYP0KqWLJDM2Y2mUiYog3
 t205a2+xfsPyKzCGe7VAcqbZJlSQXOrIESXXoxCxWBqY2vbWJxdWuKkuH28JMIQObwdkaKnrsy
 0fUceyn1WHmT/pR/Pv/PqRw7LtwfneQGb5HmOfAAAAA==
X-Change-ID: 20260616-panthor-vmbind-checkaddr-bd5d5d2485db
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=qp3EbQIwoGuYFhguJDdCV8esm60iQUM+keBsKJiouSM=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqMW8eO5L/XCC7prvieQ09s2yun1rnCuaPrrMAs
 pDXcsHQ/SiJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajFvHgAKCRAOJn5M7lND
 PQY+C/sHqbjD3muZSfYArlqlzG/dKflkDUsw9zPmepn81ejfoVb5a6df7Rq7S6VAmewBRVpZ7W3
 Sbeg7kdwCVkGNJfuFIQsUr37cpcGLX/LtQ6poRQLsNslMEy3hKIywQ7ZyBeyXD3eySCZyphTi54
 WRF92MmTiGrVo1/7eAXy9NPJ5iOxXAJTGuC+nYXeHtcHBv13aJo0uNTeaElRbtayTPIRiLUrLAp
 rs7HvIFgfdH4DdxCUnIUICebf0dsrQO7GX8lrpSvwH+xmOGNjbAFn5ogGf1qa0kjh33X4US+Et9
 uK8a7e7w5S9ccyfBAx20WJdOvGkRrEDzpjHCQA8Gfs93Vf99sp/Ei7WQ6guOUJbYDVZX2AQBbOb
 0vTZp4HaMf3i1a6nyL9mG8RfIoO8MQvnrTNPEmS/rI5RDVxVm31tAlB5ZciDGME6sqRIQhaz+jM
 BJbbA6gfyE4599mPPGHFeVcyQ21ccuoLm2Rx+UbBEzjjzbs1659fXmW5v89AepFrFPcIU=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

Kernel changes needed for the test to make sense are available at
https://lore.kernel.org/dri-devel/20260616-vm_bind_checks-v1-0-956198602ae3@collabora.com/

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

---
Adrián Larumbe (2):
      panthor: Provide a way to access user VA range when creating a VM
      tests/panthor/panthor_vm: Add vm_bind intersect-with-kbo-range test

 lib/igt_panthor.c          |  5 ++++-
 lib/igt_panthor.h          |  7 ++++++-
 tests/panthor/panthor_vm.c | 17 +++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)
---
base-commit: 8d2d82db00ea4c2c8c5904520323067607e5d75b
change-id: 20260616-panthor-vmbind-checkaddr-bd5d5d2485db

Best regards,
--  
Adrián Larumbe <adrian.larumbe@collabora.com>

