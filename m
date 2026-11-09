Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1516F606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHmj3+/c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE6610E8A3;
	Mon,  9 Nov 2026 11:51:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268DD10E8A3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225006; x=1825761006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=++Qgb91d9/pMbmZMRdVFZusVBjrEkD0HkxUPOEvCbGE=;
 b=PHmj3+/cQaBSy8OhNS0llOTQEl7FU3FloNRvJfyDZEQCMrMNSyQFjmvO
 MxP5hm+BQZzODvnR0KDoYVkAa2rLN669JFUPF9K4zxLikKmi/JlNHMKdA
 AVZviqUwcYH7/9R/yyB4CHV4GkQI/f2jiDm+RtaF0rZ2gb3RLsk971txR
 AVNJgyTTBAFcMenC0KA9/cffnyLOuTgMKxdaT3iSz0AVYJv1VplU2doOK
 9QIsrcMUTDZcBpKOOg3GTbF5qrxqc2pTWXxxwqUiZmRgzraeCKfdtP/4H
 GyHMxVgCKUs5FgdbHvj7eFl6l6Lhs8IZLPiAOfXpnbs/JW+R9YPfoH9aI g==;
X-CSE-ConnectionGUID: XjjPOhCuQ4Kot1RFvUtocw==
X-CSE-MsgGUID: a123DflhQMKF6hDiT5de1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2970835"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2970835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:50:05 -0800
X-CSE-ConnectionGUID: vPP5HvcWSQeaQAaA/EsuyQ==
X-CSE-MsgGUID: Bo2d3pjzRke+Kb90QUhTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8008664"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:50:04 -0800
Date: Mon, 9 Nov 2026 12:50:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, alessio.belle@imgtec.com, 
 brajesh.gupta@imgtec.com
Subject: Re: [PATCH i-g-t] tests/imagination: add more heap info and static
 areas query tests
Message-ID: <h6d6q4b7dn7spx2txawcqhw4kyryongkpwr6rlj7nmrvci6dl5@bsghmrdtlldo>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, igt-dev@lists.freedesktop.org,
 alessio.belle@imgtec.com, brajesh.gupta@imgtec.com
References: <20261105-b4-heap-static-area-info-get-v1-1-8d5aa15a5e30@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105-b4-heap-static-area-info-get-v1-1-8d5aa15a5e30@imgtec.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Luigi,
On 2026-11-05 at 15:41:22 +0000, Luigi Santivetti wrote:
> Test the following combination of properties:
> 
>   P01. Make 1 ioctl call to query either heaps or static data
>   P02. Make 2 ioctl calls to query either heaps or static data
>   P03. UMD(stride) > KMD(stride)
>   P04. UMD(count) > KMD(count)
>   P05. UMD(count) < KMD(count)
>   P06. count is zero
>   P07. stride is too small
>   P08. retrieve the legacy value of KMD(stride)
>   P09. retrieve the legacy value of KMD(count)
>   P10. retrieve the value of KMD(stride)
>   P11. retrieve the value of KMD(count), where count is:
>        - for heaps, defined in the UAPI as DRM_PVR_HEAP_COUNT
>        - for static data areas, only known to the kernel
>   P12. count is UMD(DRM_PVR_HEAP_COUNT)
> 
> DRM_PVR_DEV_QUERY_HEAP_INFO_GET:
> 
>        |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
>    T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
>    T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
>    T3  |  X|   |   |   |   |   |   |   |   |   |   |  X|
>    T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
>    T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
>    T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
>    T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
>    T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
>    T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |
> 
> DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:
> 
>        |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
>    T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
>    T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
>    T3  | -------------------- N/A -------------------- |
>    T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
>    T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
>    T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
>    T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
>    T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
>    T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |
> 
> Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
> ---
> This patch depends on one kernel series that is not yet merged:
> 
>   https://lore.kernel.org/all/20261104-ioctl-query-count-stride-fixes-v1-0-2bf86dd7cf29@imgtec.com/

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. ping me when you will want this merged, here on on irc.

> ---
>  tests/imagination/pvr_heap_info.c | 585 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 585 insertions(+)
> 
[cut]
