Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36080CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 16:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C082110E153;
	Tue, 23 Sep 2025 16:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7QqWsG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9199810E153
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758646169; x=1790182169;
 h=from:to:cc:subject:date:message-id:reply-to:mime-version:
 content-transfer-encoding;
 bh=BRaSGFC3eKdD6fH4Wjb11qWEaRxK9hIu5MKopnUi2fc=;
 b=h7QqWsG4baH1VbV18UxuTx1lCd2ZpUItYNWeLZdy2qfGTHxVVLLhuWey
 bku2oRRjGpzKPzfLqOyaiMFZxJuOD3dzb+jQjE9WAK+McHB1FmO0f2o6E
 sAnZ/A48t69d04jGeo5fax8avZE3P0icQMyNejRxkHdhAdB+oHwFz1jnR
 HsL4go1Qx37KXwyEcp8XtQPdGr8Pqp2Cnd40JyJvPkmiU74F1gZBtQNTB
 iDO3kaHDXCdl9IqKtTuAS+BQOwIKtcdqGddgH9WoOwN6f5zslifWzQzNI
 /Oc/yIG6lZagMYRnAaf2hlt4jkoJIkUZxABl61rvzSzTjC0K5NMOmnq6r Q==;
X-CSE-ConnectionGUID: 5CfgkL9jT/27NsVqpHmXtA==
X-CSE-MsgGUID: 7AUWuDk+RUegWi2d06T9dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60149112"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="60149112"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:28 -0700
X-CSE-ConnectionGUID: +szQjAxzTvimDQvgqG25NQ==
X-CSE-MsgGUID: +V9D0FnGRdampUlBWV1CGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200510929"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:28 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [i-g-t 0/2] tests/intel: Resubmit Patch series
Date: Tue, 23 Sep 2025 09:48:57 -0700
Message-ID: <20250923164912.763020-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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
Reply-To: 20250819005622.2970399-3-daniele.ceraolospurio@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Sending patches again to resubmit CI.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

-- 
2.50.1

