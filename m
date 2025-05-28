Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA3FC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 21:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0DC10E0C6;
	Wed, 28 May 2025 21:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6EZXezq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEDE10E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469239; x=1780005239;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YUpZ19a48alXocK3rs+0KX52CXFrVmPXwn/idsiyCHE=;
 b=C6EZXezqwY/IPUbfpkKHXUhYccDLTbSOQnxVmhXZNuL6HUH+D8X9wB/z
 r1gsKbkDfhxqUX+ss9XP9q5xV7hbMVsUEgvMbwueWORjCuRMAgxwoN4xO
 JCnJippV9NqcN8pAxekC0AsZZ+8Fjv041mZ3PPbyNKPlkVmPrtxoQ/Q8I
 7pHRXshwN/RJJcSJgsXf+AM78SdZZretP1d6u/MQqLZBLRTocwkTj6ZSa
 /io5Xa2Kx1RqeZHHbMeP2Dty278BDMyOqYBr3mvVTzRhEV20/ya5DYtaR
 B1P1VxyzxI4/X7ZOvQZfM9VwNr1Q3Ij1tnPFJ7pjrs1iOTD3KERJdcsjw g==;
X-CSE-ConnectionGUID: 1Oweh5NZT3y68H8oH+4K2w==
X-CSE-MsgGUID: t6nVwrByQ5mUNPUo2bluSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50438881"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50438881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:53:59 -0700
X-CSE-ConnectionGUID: QgYYHn5dTMSeg9K9AzwnbQ==
X-CSE-MsgGUID: t8wXemcASCSabc/Al0fk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143391528"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 28 May 2025 14:53:57 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C147D34EF6;
 Wed, 28 May 2025 22:53:55 +0100 (IST)
Message-ID: <aadfb113-f41c-4d31-8f7d-31778aa0bef5@intel.com>
Date: Wed, 28 May 2025 23:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable
 activity stats error
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
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



On 28.05.2025 15:30, Satyanarayana K V P wrote:
> Add some more GuC fault messages in the dmesg ignore list.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f9bd5c761..4ca8a34bf 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -85,6 +85,7 @@ static void ignore_faults_in_dmesg(const char function_name[])
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: failed to enable activity stats-[0-9]*");

are we really going to add more and more specific error messages to the
IGT filter just to make CI happy? note that this could be never ending
story and still very fragile to any changes on the driver side in
functions or component reordering or improvements in messages or driver
attempts to recover from non-fatal errors

can't we just ignore *ALL* error messages during fault injection tests?

after all, as we are injecting errors, our only expectation should be
that driver will not crash or hit asserts, regardless how many error
messages will be printed in the meantime, as we don't expect error free
run here and we can't expect specific error message either

>  	}
>  
>  	igt_emit_ignore_dmesg_regex(regex);

