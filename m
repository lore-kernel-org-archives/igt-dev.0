Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C185BC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 12:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5A110E61A;
	Tue,  3 Jun 2025 12:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSMIyXl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873C10E678
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748954486; x=1780490486;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wCLGTaf+PKfunnpKFMd3p/6G+Je7JQlzac2L+DBWSno=;
 b=aSMIyXl6Hn4HesfnVmR30hBqBKXWN4XQXDkcjr6nUSQMo2KrY0vsQIcm
 uhApgnrqCtCGbJyAchkFbioLhmoAJfzsUvC/WTIbg1Bx1mEmc2LK/l3cO
 HBdtuAHh4PrFesHCC6pQlosUVrWj4741s7AQbKzUzV5r2/IdFXHU0hjoA
 5fo4LkhzaxnEYFGsjIroWNB3A2zSZ5N+g7Gecqq4AAE5qwiaWpCtZApib
 8Oe8ntiz0GdNuKwL/xu7CshGOJCCx5767Z8zZLRfazjJ23y5l2Sr6/5Cy
 fTUWK1l4FKE2WqDR77C3gfMRSBL4l3Vn3njj4w93IQYD+QsGHnlu6LISv w==;
X-CSE-ConnectionGUID: BADVfl4hQb2rXEW6kUcudA==
X-CSE-MsgGUID: e6wF6FVYTJqA6jj6EjGeCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62045697"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62045697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:26 -0700
X-CSE-ConnectionGUID: iqUggDCSSBGfHnGSO3rAtg==
X-CSE-MsgGUID: 33gVGNjsQfum72Mkrb550A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149719701"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:25 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 03 Jun 2025 14:40:38 +0200
Subject: [PATCH 1/3] Dockerfile: bump Debian version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-bump_docker_distros-v1-1-cf7e062e339c@intel.com>
References: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
In-Reply-To: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=wCLGTaf+PKfunnpKFMd3p/6G+Je7JQlzac2L+DBWSno=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoPu1PUnmx9mIFBVz8tcRrvkfOZ9u7iGf8C/e++
 JI9uyXQtNeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaD7tTwAKCRAjYrKT3hD9
 1/sfDACl8uWIA3SnKDNmznOezcXBLKTytq2Dfo6wlnTs+btelBAo9DFFo5BdKd48CLML7Irwz1j
 rtbMbqKtaDO/Wjz6p0zyGwjfNs3CtqhmpXbVj73q9809PrHcn9bIJQQRWijGAlGjv/Hb3fdkPZn
 euSQrKbQZifqg+xruVck4l7iyfx1zUbBzAcKq79U9PEoyK9B87qVumaFogaKqWO++AaAkmZOePH
 I14yFC0OelbN41SUyZndbLsKIZ575L/8uJ9ofUZIblqP/4rqupGcEQq14HOowjCKFtFMQGpc/w4
 zgQAeErrg3DpTgxXWJIdZJb7ehrlC4trlxhwSy5L8f2oxDeYaejxR+IiN1c46fFTLHINL21dZuN
 F/45z2lmBEj6GvmbsOMDl2TWvp9tZ41dAPicYyqqWnzewMBbPdTdsSsOmXE75WHa5VxRrZ8CFh1
 SY88I/w3V7CVwYkXytlPS64jdcEnlYtp+KrRU9nJ8wPn+ZmD7NYGHpd9+aan/mTq+jrKA=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Prior to bump meson version (required by future patches)
we need to bump distro versions.
Anyway Debian Buster is already old and it is EOL.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 Dockerfile.build-debian-arm64   | 2 +-
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 Dockerfile.build-debian-mips    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index 573c7096feb8da1789f2520e556109e358a351fa..448fc98ab91bf52e6787343c2c37bc9c30ef2580 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 737ca3645f1ba37bd694f7bdf19c2a4d7293be72..769d03ab86fdd19a9ba523f7011f2433897afdfc 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 64edf4b4313ee482b7b2c5212fe31f1021c9cccf..3850fb43e5cc3bc958663ca225bb6130ae947b76 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-mips b/Dockerfile.build-debian-mips
index 9b7c0a5b4703e8dd9461406731af248b050a0a2b..56a1b6d5288725a3e9db55435612285279daf7e2 100644
--- a/Dockerfile.build-debian-mips
+++ b/Dockerfile.build-debian-mips
@@ -1,4 +1,4 @@
-FROM debian:buster
+FROM debian:bullseye
 
 RUN apt-get update
 RUN apt-get install -y \

-- 
2.43.0

