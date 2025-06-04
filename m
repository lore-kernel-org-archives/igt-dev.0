Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D96C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 20:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3610E233;
	Wed,  4 Jun 2025 20:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8ofaFbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2994710E233
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749069277; x=1780605277;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SoBq8wRuUJk6OXzhFZD944bajT3pmqSs5lceufKuhls=;
 b=g8ofaFbtHdmePL7pmy6ZFy6suu3bS6GppxUAKZ+gk8mezNiv+oDYDJIu
 h1qNVxSTFzFXQ/rVri8jvQ1HFk41/TJ9DCvsSKXtRGeHIqMYRz3hNyCRV
 7gullCnnpcHA6n/XVJWU+PhNaHOGLB0rH3BMknBXxxqP63Dh5roQcQ7zu
 WkP7XXGD+kdZUcHzsQI87QHIxAFOZ04SwyecSVfqtHofxEq5KAfVahcjD
 1t0H7aP0Ljx6fPKKgsMGuXLck4VKNQZY+e8KNiu+FgjK6R4hLe1hh2tqW
 y1Pjmu7HZHgSaie08sUOuhzM3bZqoUySTDiFIZaOzbIztZDJNQk0L6uLz w==;
X-CSE-ConnectionGUID: empXTu7CTZKw1rrH2Gk8Ig==
X-CSE-MsgGUID: LDBt/XVCSDO5GcjxG4gHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73704068"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="73704068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:34:35 -0700
X-CSE-ConnectionGUID: /mvxtYZ2QhqJnb7kYiHopg==
X-CSE-MsgGUID: ZALGuNioR3qKvJTzCLkEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145335172"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 04 Jun 2025 13:34:32 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 654B434950;
 Wed,  4 Jun 2025 21:34:28 +0100 (IST)
Message-ID: <1ed93f24-74cc-4972-8497-aec2b94aa84a@intel.com>
Date: Wed, 4 Jun 2025 22:34:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
References: <20250604170621.83132-1-jonathan.cavitt@intel.com>
 <CH0PR11MB54448B182962FA1CEFED2465E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54448B182962FA1CEFED2465E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 04.06.2025 22:06, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com> 
> Sent: Wednesday, June 4, 2025 10:06 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C <john.c.harrison@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors while injecting fault
>>
>> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>
>> Currently, numerous fault messages have been included in the dmesg
>> ignore list, and this list continues to expand.  Each time a new fault
>> injection point is introduced or a new feature is activated, additional
>> fault messages appear, making it cumbersome to manage the dmesg ignore
>> list.
>>
>> However, we can safely assert that all dmesg reports that contain
>> *ERROR* in their message can be ignored, so add them to the dmesg ignore
>> list.  This unfortunately does not include the device probe error
>> itself, so that must be added separately.
> 
> You know, I just thought of something...
> Aren't we specifically injecting ENOMEM as a part of these tests?
> If we get anything other than ENOMEM as the errno return value, then
> that should be unexpected.  So, are we certain that we can safely ignore
> all error-level dmesg reports here?

our goal is to extend testing and inject more faults like in [1] so
different error messages will be showing up in dmesg

[1] https://patchwork.freedesktop.org/series/149501/

