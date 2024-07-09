Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F120C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 12:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B52310E539;
	Tue,  9 Jul 2024 12:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMezMfvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EDD10E539
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720528769; x=1752064769;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0T9H6GvSQkaH/9PZT2DDjwXpe2hmZZFTB9OYuXgE5vQ=;
 b=GMezMfvAeVwC2Mw/93pnUyTpCl5p5UjIe2NIQfyfpmC88Nla9CsJKije
 5qOcX1j28fzBTc+whbmBUZXVI8AEvJXs475Wzi4SfMNL+XxzShAkdUmDK
 /JHFsa7T2VMHli5yaLD9s/6F+XkznzBurYAccRp5mwGEeGj5t5mbaSfah
 loQqJFHeVWW/276Ub/QkzvVwvEeZoVmGsAMJO9husTzF42B4SATNkwwwb
 RIlPV4cGf+ACt4f+SxoS0HU1kCo+ZkdwEwZTYbF/eySNiJW7n9D8QIGqc
 dS7nGGTIJFYhCzbwLRx5+8VWaTV9vr28gOCeg6BO/JJb4Qt4YioNVvGNH A==;
X-CSE-ConnectionGUID: mecAc8g6SPOUfDOoasDvPg==
X-CSE-MsgGUID: H6axrDDMQz+GdZ3ap5wEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21649753"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="21649753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:39:29 -0700
X-CSE-ConnectionGUID: x4m0jFxhSBWoadl45wduCg==
X-CSE-MsgGUID: EWoygRkfQE2b0qNJM37O7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47629212"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 05:39:27 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 334A3312CD;
 Tue,  9 Jul 2024 13:39:25 +0100 (IST)
Message-ID: <e021610a-57dd-4990-9809-9413003eb631@intel.com>
Date: Tue, 9 Jul 2024 14:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.blocklist: Add SR-IOV tests
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20240709112736.652364-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240709112736.652364-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 09.07.2024 13:27, Jakub Kolakowski wrote:
> Add SR-IOV tests to xe blocklist so that only desired tests will be run
> in CI.
> SR-IOV tests that should be running are as follows:
> - sriov_basic@enable-vfs-autoprobe-off (all dynamic subtests)
> - sriov_basic@enable-vfs-autoprobe-on@numvfs-all

I'm not sure that we want to keep this test above in CI as it is almost
like a stress-test, and test below will provide the same functional
coverage, without being a stress

> - sriov_basic@enable-vfs-bind-unbind-each@numvfs-all
> - sriov_basic@bind-unbind-vf@vf-1
> - sriov_basic@bind-unbind-vf@vf-last

IMO those two do not bring any additional coverage compared to above:

 sriov_basic@enable-vfs-bind-unbind-each@numvfs-all

so lets drop them from the CI (and maybe consider killing them for good)

> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 828baf324..57e550885 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -83,3 +83,9 @@ igt@kms_prime@.*
>  ##################################################################
>  igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>  ##################################################################
> +# SR-IOV tests
> +##################################################################
> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-(?!all).*
> +igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-(?!all).*
> +igt@sriov_basic@bind-unbind-vf@vf-(?!(1$|last)).*
> +##################################################################
