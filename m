Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15BC3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 09:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA610E146;
	Wed, 10 Jul 2024 09:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFnskD7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842C810E71E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720602337; x=1752138337;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9p0NK97ZRyJWuarmNAvhtsZY6pFDuAlbrRubOGR6W5s=;
 b=eFnskD7omSyw/Om2DDjWH1HAMZiueSbt5VRl/WO953yYlRBdbvbLKqQ5
 ppdg5MnLOkIIdkD+Ypfae+GbzmWCMDPxXMaMJV3oz6aP49dWDmMb8NvcD
 KUvI66wn9mu25+uj8dkcMV0eZbmrX73g2LumwYH/iXD+cMtXdyafrVS/z
 rt0peKuhoqZxWpsTO86n/ulUsD6FdVCM8W+CX45ozmBlithqiOzYLp/63
 AQku8elQoZ4pGbAzjK5L08B+xuFo4hJkhX7GskgCSO+idkKN9EKUIbotT
 8+I+NXP+M3NOoGM8TeYZ1cmss0HT39T8SiXWsCcTcY1CQPpnYqqZlksWS A==;
X-CSE-ConnectionGUID: r50UR9oyQFWhWa6nIzYYiA==
X-CSE-MsgGUID: i1a43KQxQWaIe9h1yzet6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18048021"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="18048021"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 02:05:36 -0700
X-CSE-ConnectionGUID: IeA+OkX5SpiSS6JQuUalyQ==
X-CSE-MsgGUID: cxRoojaWTeSj+frIr1kAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="52745069"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 02:05:34 -0700
Message-ID: <91eb1789-8125-4610-add8-1c599d69b3b0@linux.intel.com>
Date: Wed, 10 Jul 2024 11:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.blocklist: Add SR-IOV tests
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
References: <20240709112736.652364-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240709112736.652364-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Jakub,

On 7/9/2024 1:27 PM, Jakub Kolakowski wrote:
> Add SR-IOV tests to xe blocklist so that only desired tests will be run
> in CI.
> SR-IOV tests that should be running are as follows:
> - sriov_basic@enable-vfs-autoprobe-off (all dynamic subtests)
> - sriov_basic@enable-vfs-autoprobe-on@numvfs-all
> - sriov_basic@enable-vfs-bind-unbind-each@numvfs-all
> - sriov_basic@bind-unbind-vf@vf-1
> - sriov_basic@bind-unbind-vf@vf-last
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 828baf324..57e550885 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -83,3 +83,9 @@ igt@kms_prime@.*
>   ##################################################################
>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>   ##################################################################
> +# SR-IOV tests
> +##################################################################
> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-(?!all).*
> +igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-(?!all).*
> +igt@sriov_basic@bind-unbind-vf@vf-(?!(1$|last)).*
> +##################################################################

Does it work as described ?
