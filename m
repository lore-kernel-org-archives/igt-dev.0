Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9316CFA754
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 09:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53E10E4B0;
	Tue,  8 Oct 2024 09:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Keatzdqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFEF10E4B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728378498; x=1759914498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YCOuzzhbG5QQEiICh2DtkxHFTnKZUfs+g8hng/LJRpY=;
 b=KeatzdqdVAI6YmdVvzSWwjboa6skrmh/n3eiT+zsWeUY3xBrEvDHLF/k
 VaNZLk9zHCJaNT7KzIxyM9ZlxKqo09jSfK+7zehhKVM3dtAnX8hkm8Dkj
 S5C5D4pLKbKJUhk3+Ho+e9gSTX5xpaZ8RWOUViZCIReXqUONRYzhEDhVk
 4HlhA0oWxhQ40UWg4RUPFAgCwaSnMeDGFmJSuTxNpX8v+0x3P8EHaOyd5
 fWrlNUpNtB5k/yD2oEpqRiClaXgHzfTpjvYBQftyjcmJzI0lg8SVlt07O
 VfsH2PoLog1VF+DzUDhlIUCPoQVI6YaOgNoeruwzde1YkZhTwNracN9Zb Q==;
X-CSE-ConnectionGUID: LKKA6qN7Tlq13Td4m9rlwQ==
X-CSE-MsgGUID: 5fOVG2MfSo2MUki5dbaKWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27442779"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27442779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:08:18 -0700
X-CSE-ConnectionGUID: VNSij6bMSQC5sjpGr6FWoQ==
X-CSE-MsgGUID: wnJk5ohwQJGx88zk5zb3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="80750383"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.25])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:08:10 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/xe_eudebug_online: Remove redundant space
Date: Tue,  8 Oct 2024 11:07:26 +0200
Message-Id: <20241008090727.4057-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove redundant space preceding create.vm_id in
xe_eudebug_client_vm_destroy function call.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/xe_eudebug_online: Remove redundant space

 tests/intel/xe_eudebug_online.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

