Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87FBC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 12:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D7810E162;
	Thu, 20 Jun 2024 12:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJAxEsEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E3B10E162
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718887027; x=1750423027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9+KNdiVIqarlg/BJaWDPq3MnYXKqe+4e0W2aZfLTvQ4=;
 b=MJAxEsEMF/B78m4Xa+Bmd64Ft+xhcTldrvITIt6FShlN2xJ0FMWbf8bt
 RgMn50lj8tEMEk8ptQ6J0OYQCViwxYRh271TEBouvmFmOIJ/To2lCAGRZ
 eEgIvqPjA5epyXx5bbzDipHI8b7vCxDPEXr41+1QzXMBjWMmGdLnIuEV7
 8017IEQJREgvcCS+sLR2fITbmgaCLI1XHyYIdewFky9K3JgY6e/7buk14
 6qSEyq24cGCxSmQKT9iBxz+w4IZr8cdbfRRwAPSvzlribWIqjdd1Ninn5
 3FHopAyJrVK4GxhcoJ0xd6qQ+DbwCP1SENYEiVmpYMhluQ6DMkJsw92HK A==;
X-CSE-ConnectionGUID: nnLLRvlZSRyk8lyV2Qy0aA==
X-CSE-MsgGUID: 8KmLctrDSsmpFZe/vejHIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15566352"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15566352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:36:47 -0700
X-CSE-ConnectionGUID: 2yu8hybKT5usgHz0MudeJw==
X-CSE-MsgGUID: wS/S0aCMQLyhCi41guijnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73431705"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:36:45 -0700
Date: Thu, 20 Jun 2024 14:36:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 1/2] tests/kms_3d: "1080p-left.png": No such file
 or directory fix
Message-ID: <20240620123630.fa56r36b36zwgfpb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 kunal1.joshi@intel.com
References: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,,
On 2024-06-18 at 17:46:37 +0530, Naladala, Ramanaidu wrote:

files are present after 'meson install' but if you also want them
in <build> path, you can add something like this to tests/meson.build:

foreach file : image_files
    # put PNG files also in build folder
    configure_file(input: file, output: file, copy: true)
endforeach

Nit.1: please create also coverletter and send it with all you patches

Nit.2: do not send mails to 'Naladala@freedesktop.org', put in your
global git config file (on Linux it is ~/.gitconfig )

[user]
        email = ramanaidu.naladala@intel.com
        name = Ramanaidu Naladala


Regards,
Kamil
> [...cut...]
