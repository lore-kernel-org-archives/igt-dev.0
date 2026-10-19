Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA200CCF2E3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 12:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB5C10EC66;
	Mon, 19 Oct 2026 12:20:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F51410EC9B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792412360; x=1823948360;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=AXHP118RdQ0iTvcFO624z3VylW7iogs/PHHbjDDiQBI=;
 b=Cz1A8VG3jXOUDa4FpNBOda99iCZex0ycvBYpUdAADtb5O5iAHXHog+qm
 6xDvDXO9GJ9q3isv4qKKNuy4Lo+GF4bUv8Mp2HcGIhdicrKvg02IfYwXa
 1z0nOdPEhbFLxcjWueKVHnLB+RQ0LChQ9co+aR6DdmUtWFTLV53JnHhSp
 9udK6ngBJurW8TOZUvt8TbU0qBDEInePFKqhJ+9cF3zox28wi+ekxdoJ5
 JQTEXgSBXiDADvZpHfbls4i9yeHc2JNHAvcnjOdi9zmM7bRBc5ffxfbml
 gN+YYo50xAUrn3tTNFNrAnLAnjY7f47qnAeBCUwLfhONB2RUGxXuL+IT+ w==;
X-CSE-ConnectionGUID: g3JnhXctTbGmUfLbnRIrkA==
X-CSE-MsgGUID: 06vLyGQ6SZSum8HzT3Y9RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1112871"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1112871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:19:20 -0700
X-CSE-ConnectionGUID: 99ASQXgpQRy43+Fa8qJ6uA==
X-CSE-MsgGUID: IbW+RjuAR5Gk0y4gFWtecA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2989913"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 05:19:20 -0700
Date: Mon, 19 Oct 2026 14:19:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_link_m_n: Add DisplayPort Link
 M/N ratio validation tests
Message-ID: <20261019121916.pssx7yin7766wyyy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
 <20261019111606.cxypyywrc5iktxcs@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019111606.cxypyywrc5iktxcs@kamilkon-DESK.igk.intel.com>
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

Hi Naladala,
On 2026-10-19 at 13:16:06 +0200, Kamil Konieczny wrote:
> Hi Naladala,
> On 2026-10-16 at 23:33:58 +0530, Naladala Ramanaidu wrote:
> > Add a DisplayPort Link M/N validation test based on pipe CRC
> > comparison.
> > 
> > The test exercises a range of Link M/N integer ratios across supported
> > link configurations and verifies that the generated output remains
> > unchanged. CRC mismatches indicate potential link timing, transmission,
> > or sink synchronization issues.
> > 
> > Subtests are generated dynamically for each display pipeline, while
> > unsupported configurations are skipped automatically.
> > 
> 
> You patch didn't apply, please rebase on current top and resend.
> 

Sorry for that, I mixed this from some other patch, your's do apply.



Regards,
Kamil

> > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > ---
> >  tests/intel/kms_link_m_n.c | 434 +++++++++++++++++++++++++++++++++++++
> 
[cut]
