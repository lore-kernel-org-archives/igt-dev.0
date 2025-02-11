Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340CDC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 09:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45F10E63F;
	Tue, 11 Feb 2025 09:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BObvrlpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA21C10E63F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267743; x=1770803743;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Fx7FS7hH64ODsdwhBTdlu8qkvzzHst7zTh648thzB/I=;
 b=BObvrlpMRpOPxPepZcFIlPBUTZRZ/1/Hg6U3leEaTMBzxDuwQ3ZTLqxY
 FAeTHGJK/qOHt2yya67wHFyW60Mc9y0avt2w43X2PrrA4dhrzT7clWxlp
 E3fMe2i4hoH+TqD7pbUwlNBTkqbePDlhWBpcyl1dNA1NQ+BDYOnea/L57
 +R9n1H4rK9sjjsE2IbAr14SN5s7OxlQ6kXuX1IjQMSi8wLwtiEaTvth5+
 PKHVMXeeBFPXsCcqLCKDgVzmVsSVRlmzOb8I31hS+5LC8h7dBKQbrHng8
 wgjsLewkD18OdNSe0oChuIcF5D1aOLqUutOHUC6srtOt4UDhu/nbIKsNq w==;
X-CSE-ConnectionGUID: HPHrvkCKTvyPoHJmZcrXkQ==
X-CSE-MsgGUID: M4Lbo8TLRiOjSAAJuOsXKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51269595"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="51269595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:55:42 -0800
X-CSE-ConnectionGUID: 711jQAuFRIKpBFsWbjc4mw==
X-CSE-MsgGUID: GmrGShuXQmioOGURyYINUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117380080"
Received: from pnass-mobl.ger.corp.intel.com (HELO [10.245.112.60])
 ([10.245.112.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:55:40 -0800
Message-ID: <d137decd-4adf-474b-a56b-1398ef5472d1@linux.intel.com>
Date: Tue, 11 Feb 2025 10:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 katarzyna.piecielska@intel.com, ryszard.knop@intel.com,
 ewelina.musial@intel.com, adrinael@adrinael.net, mateusz.grabski@intel.com,
 konrad.b.brodzik@intel.com
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Thank you for your review. Please see below.

On 11.02.2025 10:21, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-02-06 at 16:21:47 +0100, Peter Senna Tschudin wrote:
>> Commit ddfde25f16ba ("runner: Add support for aborting on network
>> failure") introduced a 20 second deadline for the DUT’s network
>> to recover after a suspend/resume cycle. If the network isn’t
>> back up within that time, igt_runner aborts the test run to save logs
>> and prevent potential log loss from an imminent power cycle.
>>
>> This deadline was set to accommodate our internal CI system, which
>> checks for DUT network connectivity every 5 seconds and retries up
>> to 3 times at 20 second intervals. If it fails 3 consecutive checks,
> 
> This is a little confusing, you wrote in first paragraph about
> 20 second deadline and here it looks like 60 seconds (3*20).

The first paragraph is explicitly about the deadline introduced by a
previous commit. The second paragraph is explicitly about the internal
CI mechanism that inspired the deadline. Can you explain what is
confusing?

> 
>> it triggers a power cycle on the DUT.
>>
>> Although our internal CI system can be configured with a longer
> -------------- ^^^^^^^^
> Remove this.

No, why?

> 
>> wait time, extending it further would unnecessarily prolong tests
>> in cases of DUT hangs.
>>
>> Bumping the deadline to 40 seconds keeps the abort mechanism safely
> 
> imho this should be option for igt-runner, I would prefer to not
> adjust it later, let CI team tune it. Option could be either time
> or retry counter or both.

I disagree. We can add value now by potentially preventing premature
aborts with very little risk of creating any issue. The people in CC
seems to agree with that.

This patch is as simple as it can get. I don't buy the benefit of the
extra complexity of adding yet another command line option. It is way
more effective to send one of these every 6 years or so.

Am I correct that this is a nack from you?

> 
>> within our internal CI system retry window while improving chances
>> of preventing a premature abort. For upstream testing on Jenkins,
>> the deadlines vary from 16 and 25 minutes, and this change has
>> no impact.
>>
>> CC: juha-pekka.heikkila@intel.com
>> CC: katarzyna.piecielska@intel.com
>> CC: ryszard.knop@intel.com
>> CC: ewelina.musial@intel.com
>> CC: adrinael@adrinael.net
>> CC: mateusz.grabski@intel.com
>> CC: konrad.b.brodzik@intel.com
> 
> imho better here 'Cc:'

Thank you!
