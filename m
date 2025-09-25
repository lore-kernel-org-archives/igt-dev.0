Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DACAC5B1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 14:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A210E94E;
	Thu, 25 Sep 2025 14:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVDQmpgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE4110E2C5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758810907; x=1790346907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VvmoiHUx/zcg/cuoUmGfwoHsWoXWapcdW4CM2R/VUHE=;
 b=MVDQmpgqt+B/3KJKaTs021SU4NHVYYYxxa0fwyIjSCjpyPpqiC6YtgFU
 3xOn+VN6s4Z+1IMXHi/S90J7bK4Y4lHr1P9/avwexcQTZcxn75WtNUhXI
 GBm/lSWDJv+E5jv1h5GnM2U1w6gl9+ffrCvFqc11L9azQmP1Ks3D/jvLn
 AyNTGLLCN4b3luQ/5jq4k2ygiz4lHqNgmZFfvYXeH+Z/UR4gldIe7W3xM
 P2rphRQORJpk3LZbuXhKLylWSXA4WIln9AU8HiOc0yqHSBDhk0q2FTz8K
 DXTaOhVKPcJeKuXonX0wEgpKhqodsy125jq2gtiYetzQvpQ0RTMM4pPzN w==;
X-CSE-ConnectionGUID: 6ckKzDSOQYK9DKYlf6QV5g==
X-CSE-MsgGUID: 3gqFDTxtSYyLslnihdvAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61079065"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61079065"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:35:05 -0700
X-CSE-ConnectionGUID: 8eNAkOPAS4iMliZol67YIA==
X-CSE-MsgGUID: MSTHhxvaQNKAbq27AfoAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177738402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 07:35:02 -0700
Date: Thu, 25 Sep 2025 16:34:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] lib/intel_blt.c: Fix MEM_COPY instruction for xe2+
 platforms
Message-ID: <20250925143445.ikl5jcy5mjng4i36@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923150926.1829954-1-balasubramani.vivekanandan@intel.com>
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

Hi Balasubramani,
On 2025-09-23 at 20:39:26 +0530, Balasubramani Vivekanandan wrote:

small nit about subject, please remove '.c' from it so it will be:

[PATCH] lib/intel_blt: Fix MEM_COPY instruction for xe2+ platforms

Regards,
Kamil

> There is a difference in the MEM_COPY instruction structure starting
> with xe2 based platforms. Fixed it.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  lib/intel_blt.c | 126 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 93 insertions(+), 33 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 71ed891c3..1a8808688 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1800,17 +1800,32 @@ int blt_fast_copy(int fd,
>  
>  struct xe_mem_copy_data {
>  	struct {
[cut]
