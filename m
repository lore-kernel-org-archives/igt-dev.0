Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D865BE6816B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5310E1E8;
	Tue, 17 Feb 2026 11:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYLbZ7nm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564FD10E1E8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771326178; x=1802862178;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pBNqWdYXurmXUE88MwifvpRwGMyS3IpH28qk1XbaMB8=;
 b=TYLbZ7nm0CXNL8B54NnWwcT9B98Ubtmc7pe3iEG6WB5218CBBphmYS/3
 DWBsR6XrMKo+pCEANaFYMMZoyvg9NClKWtnETOW7qyRK6Jf4O1XwCXxJq
 f1mmmtwVWwh/XW/4ZKdPUMKTi5jVaeFUgyhfxDqprAWDWV6I3xjyAsE4c
 Y/awwlHs85PlrDQSFQ/UwIZCQEaI6QNeXAmMOGTpBvhIVAXqIifRX5HJ0
 uQ0zru3VhaQqgxleo00ebyqkKFjfO4zspqeMOLI8W5eupE1W5ibfW3djp
 DBmUQlDTZGGL9oFdUlJAPFjQO6FmUCqdWahjOg4M4m0qYd+/x1UHiSxTY A==;
X-CSE-ConnectionGUID: uugGYxhERkyToZhwzsTAFw==
X-CSE-MsgGUID: 2bLfillWSa2BmuufsyOqZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89976404"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89976404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:02:58 -0800
X-CSE-ConnectionGUID: e4f0J7jvQqKPNRB24u34pw==
X-CSE-MsgGUID: +C14jAALSfOjdMyqhrFm9w==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:02:57 -0800
Message-ID: <5ffedd36-d85f-4f9d-b605-b89d5cd89daa@intel.com>
Date: Tue, 17 Feb 2026 11:02:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] tests/xe_pat: Add pat indices for XA App
 Transient in false-sharing test
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-4-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260213084603.1404162-4-priyanka.dandamudi@intel.com>
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

On 13/02/2026 08:46, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added PAT 18,19 indices to test new XA WB-App Transient where buffer is being
> shared by both CPU and GPU.XA WB-App Transient is a feature where
> specific l3 cache lines marked as XA WB-App Transient will get invalidated
> instead of whole l3 cache when CPU wanted to access the same buffer of
> GPU. These pat indices are added as part of false-sharing test.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
