Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29108D60CF8
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EB710E56A;
	Mon, 18 Nov 2024 23:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="da2p6A/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2110E571
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bj9M7C0DQr35+AV9jiUejnxNFjJG4cp8nso19AZvrOQ=;
 b=da2p6A/buRF9Cdy40u1xIWD7bWeR0mWTDrcgINKtNTxOdQVY004UeVhF
 3ErbR06KpAvaG/B3MrkHDHAnmDvT+kYx1Hnub3DJA7x7uRPK72WILudB1
 9sicNJqAfctXNcc3sKS67hF/X6rbvTvbuoUv35zn4YkoKNK+EkI2m0GQr
 sbnSSD+IRn/d2V5BRaLmSOMYUjBtnlMNg1rA37FkpXpncnDKSpxoPAIDF
 xvKU83UhIlDHJqEPo9HOA1NwHAVjd6oMgOMqYFEa1LcqkM/2GhmHXzguF
 15f0klOaTYeyn1+Dp9ZoA/3hOokTVnXnYez7z3PxIOs1qLhb0dDTnExDO w==;
X-CSE-ConnectionGUID: sVU4S+nqSu+7takVPK6QRw==
X-CSE-MsgGUID: TiSdp2LbRQ+lPHM6S5HNbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451242"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: PxIrGICHTNaeaveONBdEpQ==
X-CSE-MsgGUID: LRw8Ny6QSn+NErxSD4ju1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245239"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 19/29] drm/xe: Do not allow usermap exec queues in exec
 IOCTL
Date: Mon, 18 Nov 2024 15:36:10 -0800
Message-Id: <20241118233620.2373819-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Not supported at the moment, may need something in the no doorbells
available.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 31cca938956f..898e4718d639 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -132,7 +132,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM ||
+			 xe_exec_queue_is_usermap(q))) {
 		err = -EINVAL;
 		goto err_exec_queue;
 	}
-- 
2.34.1

