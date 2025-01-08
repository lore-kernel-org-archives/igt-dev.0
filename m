Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD8CE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 15:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE8310EBEC;
	Wed,  8 Jan 2025 15:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtJvArO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244C110EBEC
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736349664; x=1767885664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xOkZYqJbIZvqvtx0coMqjZwtjkw7GL+vCwhVfpxPveM=;
 b=ZtJvArO08mVs58WStRl38z4Yc7soXHTQVmbcTGrzXKnf5Nb15ln/0/rx
 F/4D7q28laTB1yUrSaIC6xHI0qmT7fTJh5W/Jy1sdQZ9qpCLFbG2LZrcG
 0/L5vvcfQKHJV+uy0vdo5opaRWPmOPExgakrtMUWxm9M+Yr7cYq9UlOfq
 YK10eRcmrNs3FvYkhN9RJvUlYRkr9Xie65fR68Suw9iDhH4eSLeakO8k3
 VttdV6qsADqTo1FGRioO9MEWy+uENT73NMpZ/2ZVECu/MBrMIzPuGXomH
 aWfIlaEwe7ZqTqPuoGktfCxSyTBLLH5HHrGwlx1AOkWZI+SkXPeuHNN/S A==;
X-CSE-ConnectionGUID: BacjKEF9SleguU4/3OaWYA==
X-CSE-MsgGUID: 9KgkzyHPQfeZwPfd4ZMZUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54128091"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="54128091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:21:03 -0800
X-CSE-ConnectionGUID: I7++8D8hTJOQ8kFVP57kxQ==
X-CSE-MsgGUID: SNNXmWGDQCiRpGlWyXrktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="133970857"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.0])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:21:03 -0800
Date: Wed, 8 Jan 2025 09:20:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for libghe version
Message-ID: <y2bx2mgyoyal4dhqk63qs5uf5ids2lavbgqj5f72gvvogbgd5c@ji3vc6nlthza>
References: <20250108150448.329219-1-mohammed.thasleem@intel.com>
 <20250108151606.333202-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108151606.333202-1-mohammed.thasleem@intel.com>
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

On Wed, Jan 08, 2025 at 08:46:06PM +0530, Mohammed Thasleem wrote:
>Update check for libghe version to avoid compilation issue.
>
>v2: Update version check and remove warning message. (Lucas)
>    Print messae at api else check. (Kamil)
>v3: Remove special case and update dependency declaration. (Lucas)
>v4: Update subject and discription.
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>---
> meson.build | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meson.build b/meson.build
>index 8b2a2a64a..3b6988cd6 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -197,9 +197,9 @@ else
> 	chamelium = disabler()
> endif
>
>-libghe = dependency('libghe', required : false)
>+libghe = dependency('libghe', version : '>=0.2.0', required : false)
> if libghe.found()
>-      config.set('HAVE_LIBGHE', 1)
>+  config.set('HAVE_LIBGHE', 1)

for some reason our meson.build doesn't follow the recommended
formatting (spaces vs tabs). This was already wrong and didn´t improve
here.... just leave it how it was. I will do that while merging this.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
