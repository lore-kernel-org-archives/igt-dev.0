Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532DEC71134
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 11:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0768110E61E;
	Wed, 11 Jun 2025 11:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nT+6nsuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F110E61E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749640046; x=1781176046;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7Edd9VsWmc4IUtN4nzK9eOmU7cFTKVfhmCq2ZQykbKc=;
 b=nT+6nsufUOvLw5vKnJ8BlTbxpVxtda4CD4hxpNVRLpn/GDoc/DH8yV4L
 q7VGd2gQg4mhV1t66JV6dFn8gKSjXUCO4cAAxPzRXqcldA7KUL9OtMcjZ
 UL+UnitlTpmDY1RWSbSIVRO+BI6mpF4VcyUr5EGGAg2ixWVPbSN77TTqO
 63tYkruG+KRX4y6qJi3bp73vpKSRsMd0Pq8CvCLQMq1fxC9N8z1g/PTDV
 tqiThKYXAE7k7OBpD73G8ZNDMd7eN0Djwl274pnti4B8xiY0UDvwxDjat
 BLHP7yNBDeJcqoKOErIiJq7oYv7yMTw3stMUt+Jshmat6U1fM4mMSMKk2 w==;
X-CSE-ConnectionGUID: LLXDaKs0RUW77pd1wGwiqg==
X-CSE-MsgGUID: rm7Im5odSxqneo4HMgI0nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62057468"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62057468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:26 -0700
X-CSE-ConnectionGUID: 6JHs0AoJS1Ks6slkbDUGpg==
X-CSE-MsgGUID: +kSqAnAgTYyT6P70sZe14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147015009"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:07:24 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 11 Jun 2025 13:06:39 +0200
Subject: [PATCH v2 4/5] meson: bump required and tested version of meson
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-bump_docker_distros-v2-4-90791ecb953d@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=7Edd9VsWmc4IUtN4nzK9eOmU7cFTKVfhmCq2ZQykbKc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSWND1TnmFAY2keLH4/LBCL6QJ+Ib//7B6nQ2D
 cKhuzmP1GeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEljQwAKCRAjYrKT3hD9
 1xZgDAClRlLFjzxDOTqSHoaf7X+5FFrY3/Fd9SmKNSSe1I8JzyJHcycQI4B2yUv9Z3gcapbAbnI
 oj8KGdnge0fKO+egof64p6WVPhO2SKm9iV6s5rYHpVZcDsvijZCluBfmWgn5nNEUP/lrBirh3WJ
 +eKJT1FjzPY8yOBred/8ggEq30mrAIFboKgQM3NznbE/LufKP7CrzP73LWNUf8889vKOcD++y5a
 PYFVv3G0/T0aQE26qyQsdKXuL1Jgf37rRfvevXIfFA37In8+HfQNcs5eXPTMNy/AhnTvMinz513
 Rfgsm6rSsyil3Z5ajlURUIMp0jSXVReSZZR90DH8FG+1ow/p9GJmpvJox+88pkHTY26NH3o3U3C
 JTPYWVUWleVV8pRdGTOkBDP/oM84gS/EscrxL/8QFK8XdNUEB0WFhnW7Y47+r2WvS7XK0xORiCK
 B1v+1up3VpNlu7Ne/Isy0Ghn7DH+kCDE1DyHL9Iw09x7jRjcc5JtrThUTZ/eL1CzcPubU=
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

Future patches will require meson 0.52. Let's set the oldest tested
and required release to 0.52.1.

v2: updated description

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-fedora | 2 +-
 meson.build             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 00f45857c20f82320500e7230e72c9522527e7a9..588738ac423e0d274fa42dfa4043b44d4cb1bad7 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -45,6 +45,6 @@ RUN dnf install -y findutils
 
 # Meson version switching shenanigans
 RUN dnf install -y python3-pip
-RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/e8/ec/3e6a68c9e0fd4b4f4fb6877a3ccfb6f6e6d09f2b4fc87674e671bf64b7b8/{meson-0.47.2.tar.gz}"
+RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/43/9a/e0bcec70d290986c6265d32e0a2d16ace7ef38f58aa5a65308967129d094/{meson-0.52.1.tar.gz}"
 
 RUN dnf clean all
diff --git a/meson.build b/meson.build
index b88098234e6d72dd2ed4cf26972e7afed1b1aede..3d18267e652943c5984575498ddeacdec7e079da 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.47.2')
+	meson_version : '>=0.52.1')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')

-- 
2.43.0

