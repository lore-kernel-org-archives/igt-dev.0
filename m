Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21993CA0ED1
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FF910E2A8;
	Thu, 14 Aug 2025 09:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRc/th2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA5010E2A8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164617; x=1786700617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vvy4LiSfTZlKG2aJ7uHRvc8gJOHiK4x7BbJKu+d6aUo=;
 b=GRc/th2VRJA/Ig1bAJJnbhNadkScos5k3hhKrfi2b2eUdLgFrVckHeIs
 8XyczWhSy22gUdsqfLP+eswxTW1psDUSBjZUzqV5U1Ee1CC42L8afeWHh
 MCW4A3RTAyANNaBjh8S1SGo46uGSvi0wtfcSyQD4LWEL05B9fjLIcIYoY
 Vvd+JJ0yOWwnm/LSau7c+zSPl6pwBa9RUwkl0lot2996anbnbmQQFIewt
 3FtYE+zpVc47Z2BDkwGlBFSmYtqznn+9gGuLrFh2v0qRPpb8aAMkCkiCm
 iMtzMxOXWlxMaEZ8twnejrN038HQWW7Knu1m2A9ZnRMY4PxFFX091gVPu A==;
X-CSE-ConnectionGUID: g5nZMzPuROuQQWQ046Ixew==
X-CSE-MsgGUID: TZMRFazMSmquqMolwwP9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60103198"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="60103198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:43:36 -0700
X-CSE-ConnectionGUID: 4JNnKp3zT2C2iy/bO3flCg==
X-CSE-MsgGUID: 6wQcKPRJTPGzDRCZAd+Gaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171174119"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:43:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit 96b451d53ae9
In-Reply-To: <20250813141503.5dpg2tblm325oy4v@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1754916577.git.jani.nikula@intel.com>
 <ba7afed7dbbc4ee1d1599bd66a7f453f15df1b4a.1754916577.git.jani.nikula@intel.com>
 <20250813141503.5dpg2tblm325oy4v@kamilkon-DESK.igk.intel.com>
Date: Thu, 14 Aug 2025 12:43:31 +0300
Message-ID: <5b5056b996b14c1207ed156a6833fe1f961f3bf0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 13 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2025-08-11 at 15:50:26 +0300, Jani Nikula wrote:
>
> please update subject, for example:
>
> [PATCH i-g-t 4/4] tools/intel_vbt_decode: Fix documentation
>
> With this
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> PS. same here, no need for resend, could be done at merge time.

Thanks for the reviews, pushed to master with the updated commit
messages.

BR,
Jani.

>
>> Synchronize intel_vbt_defs.h with kernel commit:
>> 
>> 96b451d53ae9 ("drm/{i915,xe}: convert i915 and xe display members into pointers")
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  tools/intel_vbt_defs.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> index e9b809568cd4..92c04811aa28 100644
>> --- a/tools/intel_vbt_defs.h
>> +++ b/tools/intel_vbt_defs.h
>> @@ -446,7 +446,7 @@ enum vbt_gmbus_ddi {
>>   * basically any of the fields to ensure the correct interpretation for the BDB
>>   * version in question.
>>   *
>> - * When we copy the child device configs to dev_priv->display.vbt.child_dev, we
>> + * When we copy the child device configs to display->vbt.child_dev, we
>>   * reserve space for the full structure below, and initialize the tail not
>>   * actually present in VBT to zeros. Accessing those fields is fine, as long as
>>   * the default zero is taken into account, again according to the BDB version.
>> -- 
>> 2.47.2
>> 

-- 
Jani Nikula, Intel
