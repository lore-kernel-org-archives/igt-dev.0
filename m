Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE709C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36810E832;
	Thu, 12 Jun 2025 12:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uf93C+55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DB310E835
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749731499; x=1781267499;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eTUl8dL/kW19bdM54V4mBiEpp3uLS2zJU99wpFLyMaM=;
 b=Uf93C+55fJnj17suOrnwDk/PUaYXV3x493G61MsSBhc9XQE198/kFZuh
 LFnfKZLzIKmI8sm0rUVaP8m3N69Z1XV/HfzmFD4+CyPoRDWXc1ez0zC1F
 2VslBvVLjgZFfyOYp1bCD5kz6uI6Bisi88L/km0OiEMkeESXqQ6lXHHF5
 URjjphPrPVetq/YVH6viUOuIkV6YmuSKz7oy+CHYNC94ir8nZMZ0DjDJP
 5zi65PiPO26OMl6wABYHF3iKbO9ej+bGpsqnjef4+YIwfp581SQBWN3Xo
 9FbgiRffkCyvJRRgXDx4LnGNsmYf5cvBCAWqX7GrXixrNDtwePJeo4z77 g==;
X-CSE-ConnectionGUID: LXC80bjeSfqwGUxpA4If/A==
X-CSE-MsgGUID: Cx3uTj/KRlmUIWaneuaDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51777809"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51777809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:36 -0700
X-CSE-ConnectionGUID: fJ7mMbiETD6YlgyB19squw==
X-CSE-MsgGUID: HGpWNx/bS1yl0fV0mTYW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148061603"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:31:23 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 14:30:16 +0200
Subject: [PATCH v4 5/6] meson: bump required and tested version of meson
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v4-5-10d18745c7d4@intel.com>
References: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v4-0-10d18745c7d4@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=eTUl8dL/kW19bdM54V4mBiEpp3uLS2zJU99wpFLyMaM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSshisWhmVRkpCYUvjvDG0mIZ4zePOMndK6trN
 POr3czSTTWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErIYgAKCRAjYrKT3hD9
 122hDAC2vV5JXnOKPZec53u4YEZhGdsnCV0yKJi0h/oPwTixLqC3upSvNJjvgEY/QqzebBaZN9E
 K5c1YryofyhlpCNIacIBGLZzHuSE1CYFurAe24n5Rfqbc2vNTQ6uynt8MF3KEzpWWTgOZLIREl9
 JyxF4SRAWV1NNdNC5+I+hZAchC8gZRy46iVM1UD6DbaRlVQ7I7CSu33meH0H28g9vjjuo00bGWa
 Y1Wvjk8p/NIhfduoDpKZ0yLP6ozdFQepA2GFC1qBU5+f8hn0fOhm9kiWgOn33RqiNQQpk7OoL5H
 5G3asaVJb8Nosd/rKtZafbFtCgrNHpyPmlIOZ1n36RQmkOBc7iywmIKl18pbNvWwgTYJLFCFShd
 sWU6uSmQIfmMq7jxyRKyJY7tL2eKR9SQEBNKRzjXOnUAzJGFxcJOoV7aS7rkaHGugZj7NmnYy/l
 0ny/DGxZ9+Bv1pCblAmncFvLi9HrD/6vk2okwWlJB2X5qaPleHDi4uZk2wM56TU/JuDiY=
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
Acked-by: Petri Latvala <adrinael@adrinael.net> #irc
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

