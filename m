Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF791606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGg0YUz6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9D210EE26;
	Mon, 23 Nov 2026 14:00:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92810E7D4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795442387; x=1826978387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CyqV811IP8ZMABgO9ZAlTgE5csSp6LEJxnmoIThI1s8=;
 b=VGg0YUz6yz5VTtznz5BPlU/y/Sc7W1rucSoI3s+nttHoW5f7H3nftuMA
 UHn/kzgF4LNVH39mmcf7fO2WVKvu7pLFgj5Hcgesz0Ng+du1z1QeyTTA6
 mKMHqnrBbw9KdsceVsBQkjc4aIM7aUpAbBEc22to975MhppuVwoja72j8
 tX2sWg+yN9hsYDjZ1WD+UUyIzaCNPOEVRsJcNwH7AkKLkc9IlmKEMxWDF
 US8J8YQANmVRhrx0Wvm5PeAQkXLCRLy8egfs4NIiaD8GpXIuI+fVjxOBn
 0RPPzIPiPmBdvOwGVIT6Ydvn8tjMlWyVDNozireC7SHzNbU6YuRIdXFU/ A==;
X-CSE-ConnectionGUID: S4jNI2VZTEmIFii1EXm32w==
X-CSE-MsgGUID: 2TqV1pVSRQSnVKHVwyQ7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4355036"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4355036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:59:47 -0800
X-CSE-ConnectionGUID: 31gUJXn/SRq0xrKheYiESQ==
X-CSE-MsgGUID: 1K2bxbNeTfu07KqG2HDb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11626354"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:59:45 -0800
Date: Mon, 23 Nov 2026 14:59:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/core_debugfs: Create listing while reading (rev2)
Message-ID: <hkb3f2hr3uti2ljhemn5radhwuysnwdyj3vsoyy67vzbtfmsrb@a7x2r67p2bbq>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20261120183707.35596-1-kamil.konieczny@linux.intel.com>
 <179521411702.62469.10399882124906007701@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179521411702.62469.10399882124906007701@9ac1b63fe3ea>
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
On 2026-11-20 at 22:35:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_debugfs: Create listing while reading (rev2)
> URL   : https://patchwork.freedesktop.org/series/179138/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9201_BAT -> XEIGTPW_16194_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_16194_BAT absolutely need to be
>   verified manually.

can you look into fails below? They are at Xe.BAT run with
sriov debugfs:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-2/igt@core_debugfs@read-all-entries.html

Using IGT_SRANDOM=1795212921 for randomisation
Opened device: /dev/dri/card0
Starting subtest: read-all-entries
Reading debugfs files from /sys/kernel/debug/dri/0000:00:02.0
ok 40	name
ok 286	clients
[cut]
ok read fails errno=5 /sys/kernel/debug/dri/0000:00:02.0/sriov/vf1/save
ok read fails errno=110 /sys/kernel/debug/dri/0000:00:02.0/sriov/vf1/restore

After that igt_runner stop testing due to timeout, it send SIGQUIT
to test, also in dmesg there is marked warning:

<3> [58.758743] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: VF1 save is still in progress!

Btw why is it triggering on debugfs reading? imho reading should
not trigger any driver action other than reporting, writing to
node can, so question is is this a bug in driver?

+cc
Piotr Piórkowski <piotr.piorkowski@intel.com>
Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Lukasz Laguna <lukasz.laguna@intel.com>

Btw this is exposed now that I try to fix test core_debugfs,
as old behaviour was to stop checks on a first error, so
most likely those nodes were not checked until now.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16194_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_16194_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_debugfs@read-all-entries:
>     - bat-wcl-2:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-2/igt@core_debugfs@read-all-entries.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-2/igt@core_debugfs@read-all-entries.html
>     - bat-nvls-1:         [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-1/igt@core_debugfs@read-all-entries.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-1/igt@core_debugfs@read-all-entries.html
>     - bat-nvls-2:         [PASS][5] -> [TIMEOUT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-nvls-2/igt@core_debugfs@read-all-entries.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-nvls-2/igt@core_debugfs@read-all-entries.html
>     - bat-ptl-2:          [PASS][7] -> [TIMEOUT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-2/igt@core_debugfs@read-all-entries.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-2/igt@core_debugfs@read-all-entries.html
>     - bat-wcl-1:          [PASS][9] -> [TIMEOUT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-wcl-1/igt@core_debugfs@read-all-entries.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-wcl-1/igt@core_debugfs@read-all-entries.html
>     - bat-ptl-1:          [PASS][11] -> [TIMEOUT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-ptl-1/igt@core_debugfs@read-all-entries.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-ptl-1/igt@core_debugfs@read-all-entries.html
>     - bat-bmg-2:          [PASS][13] -> [TIMEOUT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-2/igt@core_debugfs@read-all-entries.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-2/igt@core_debugfs@read-all-entries.html
>     - bat-adlp-7:         [PASS][15] -> [TIMEOUT][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-adlp-7/igt@core_debugfs@read-all-entries.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-adlp-7/igt@core_debugfs@read-all-entries.html
>     - bat-bmg-1:          [PASS][17] -> [TIMEOUT][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-bmg-1/igt@core_debugfs@read-all-entries.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-bmg-1/igt@core_debugfs@read-all-entries.html
>     - bat-atsm-2:         [PASS][19] -> [TIMEOUT][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9201/bat-atsm-2/igt@core_debugfs@read-all-entries.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/bat-atsm-2/igt@core_debugfs@read-all-entries.html
> 
>   
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9201 -> IGTPW_16194
>   * Linux: xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418 -> xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a
> 
>   IGTPW_16194: 16194
>   IGT_9201: 9201
>   xe-6197-90b50d97b3af2f55a75116f1ec76e0cf62914418: 90b50d97b3af2f55a75116f1ec76e0cf62914418
>   xe-6198-d706b8b5a4276d637251224ed2d5ff30a982fa0a: d706b8b5a4276d637251224ed2d5ff30a982fa0a
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16194/index.html
