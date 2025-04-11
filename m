Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C53CC36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 07:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0112E10EB20;
	Fri, 11 Apr 2025 07:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI9q/7cD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B4A10EB20
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744356920; x=1775892920;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Pm0qevoc6z8avuNvDhRk9Wy2mG9RRLLppsWdok++i5g=;
 b=WI9q/7cDgqapzTKpk2r1vFy2Gy7bKUowFk0QreIvzZKRXas+SQb0rCg2
 hmUQjTvP51s27g4neyHwuLX7kSi3/FB5UzRKT3FAQuuW4bPrhDTosctlg
 La14GdKmqS/ZL/+V4e+Tcu+YFR36JdzuPUG5T0uW9gVRWNp+WSerGRqDK
 J0I1rdQu0U8qXtrLM8HteZ2MsBDsnhhgdfa8SxrkZIBLDEpG6+etX16CT
 ehom0rSb7qnJYHEvLXQ5Kgo8GN3l1dvxPC4agI5GFnDth487Igz1NbZgK
 gYhbneLUyi00H9OA+BgZ90id7aJAzARx/saGXPttKckjrTYKtV3O/bblx Q==;
X-CSE-ConnectionGUID: 3YyqOorAQ4WEEKpiHNLDSA==
X-CSE-MsgGUID: ZX4lFdi1QRGFC5rQKPr5IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48610039"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="48610039"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:35:19 -0700
X-CSE-ConnectionGUID: Cwwxx6UMTCa0EJB7YiyYkA==
X-CSE-MsgGUID: 7+LLCSeAQZ6VT/bKpcrRUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129070294"
Received: from zprzybys-mobl.ger.corp.intel.com (HELO [10.246.0.3])
 ([10.246.0.3])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 00:35:17 -0700
Message-ID: <424b20b4-4a5e-4c96-ad6f-89895d868c5f@linux.intel.com>
Date: Fri, 11 Apr 2025 09:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/intel_sysfs_debugfs: Remove xe-gt
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 matthew.brost@intel.com, pravalika.gurram@intel.com
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
 <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250410181117.6ovckutjog7wleah@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 4/10/2025 8:11 PM, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-04-10 at 11:03:15 +0200, Peter Senna Tschudin wrote:
>> The intel_sysfs_debugfs test now includes functionality to read all Xe
>> debugfs files, making the older xe-gt test redundant. Additionally,
>> xe-gt causes issues when testing Virtual Functions (VFs) in SR-IOV
>> setups, as some of the debugfs files it expects are not present for VFs.
>>
>> Rather than extending the overlapping and problematic xe-gt, this commit
>> removes it entirely.
> 
> I agree on removing reading part but not on existence checks.
> Imho start with small refactor:
> 
> - remove readings
> - change existing checks so they will print _all_ missing
>   debugfs nodes and only after that test will fail if there
>   were misses

But that is the issue. For printing _all_ missing debugfs nodes
we need first to have a list of nodes that is complete and up to
date. Looking at git blame it is not clear that the current list
had the intention of being complete. Do you know why are we
testing for these few specific files?

[...]

Peter
