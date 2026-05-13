Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248B6CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 10:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2BF10EDEA;
	Wed, 13 May 2026 10:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9vjGYR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020D10EDC1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778667129; x=1810203129;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2lPxN9LCbxoN/GSo+z087Ed1FHbWhmqJ1B9OJgguj4c=;
 b=e9vjGYR4UzrUAOvN8qbodmJp+fITIzXJNxnl5pjDZEPMOHmYlfQpjbTI
 NyZHvAGlFlIjJK1DHKHZP/8JYBl7Ud8Mn7Dtajmke1eNYkdV+AHMT4P7W
 ivoyrux0urB5pbYri/LY0utg5UCIgdveojmg88GzHOxrkwjJ/KJ81r8Pa
 zXJLzkncOU0kp3QrrK8FGGNYhpcVMsqi/T2we7eCpxU4sRCxMKrDHGZzY
 WM4+40ypVrOwq0iqn+qjpANm52bB1fIhCDppijFJkmtlTqVNraIvC1Qnj
 YGyTn/ly7dUnhTEsGk77+jei/lWUadf12MBYWnjV4vjxCENNribUX4Z1k w==;
X-CSE-ConnectionGUID: 3kV420HOQ0S8ccl5ff1cOA==
X-CSE-MsgGUID: JFcCj7muTp+1jCvdGnt1LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79304427"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79304427"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 03:12:08 -0700
X-CSE-ConnectionGUID: LEi0fN28RuarG5ZHIBL7cQ==
X-CSE-MsgGUID: jFbHLEPdRqqhxNWeI527Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="234981499"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:12:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Cc: "Manna, Animesh" <animesh.manna@intel.com>, Dibin Moolakadan
 Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>, "Thasleem,
 Mohammed" <mohammed.thasleem@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
 IGT_FORMAT_MOD_PREFERRED for cursor FBs
In-Reply-To: <DM4PR11MB631279797CC6D993EA04720E90062@DM4PR11MB6312.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260513061503.645278-1-jeevan.b@intel.com>
 <20260513061503.645278-3-jeevan.b@intel.com>
 <1fe9ac6853b6bebc3fbdda98786c6944f66d7f82@intel.com>
 <DM4PR11MB631279797CC6D993EA04720E90062@DM4PR11MB6312.namprd11.prod.outlook.com>
Date: Wed, 13 May 2026 13:12:03 +0300
Message-ID: <f683159ff57a7ebf6cfc0333cbdbc62eef68381d@intel.com>
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

On Wed, 13 May 2026, "B, Jeevan" <jeevan.b@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Wednesday, May 13, 2026 2:06 PM
>> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: Manna, Animesh <animesh.manna@intel.com>; Dibin Moolakadan
>> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Thasleem,
>> Mohammed <mohammed.thasleem@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>; B, Jeevan <jeevan.b@intel.com>
>> Subject: Re: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
>> IGT_FORMAT_MOD_PREFERRED for cursor FBs
>> 
>> On Wed, 13 May 2026, Jeevan B <jeevan.b@intel.com> wrote:
>> > Switch all cursor-related framebuffer creations in kms_cursor_legacy
>> > to use IGT_FORMAT_MOD_PREFERRED instead of
>> DRM_FORMAT_MOD_LINEAR.
>>
>> Why?
>
> Well, the plan is to remove this hardcoded modifier usage. Since these modifiers keep changing from platform to platform,
> we currently have to update them manually or ensure that only supported tile formats are used.
> Therefore, we are considering introducing something like IGT_FORMAT_MOD_PREFERRED, 
> which would automatically select the best possible modifier for the given platform.

My point is, that information belongs in the commit message.

If the commit message only explains the "what", the reviewer can only
cross check that the commit message matches the code changes, but still
has no idea why the changes are being made.

BR,
Jani.


-- 
Jani Nikula, Intel
