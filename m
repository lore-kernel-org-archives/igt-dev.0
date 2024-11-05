Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0053D1CA26
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 05:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDDF10E156;
	Tue,  5 Nov 2024 05:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX+YRmzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2AA10E156
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730783369; x=1762319369;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=OlLalc9tq1gMKKCKcA3p5LtC3FiYoVZzaKEF0GjI5BI=;
 b=gX+YRmznxeJZD1xyI2QveqMV0q1TMfUoYw7oSgO4QUgxa07l0fr8mP8X
 xCnoX+0/iiByfzEij9pa1CLVUx5n1mKgy0b6pRP7OWY62vEW7dLkyEsuI
 pz6tq5pRYrTQVRq+6lSr1H3ShP1g/qEYlobgqwFL/gQN1o299upsa0Eth
 3urTIBB97euDqts1JpplIE98UqqHJuudA8JdJSpReidtnUUFfLConpW8T
 bM8rpu2TYp5tsd4enBkbPfdV/bQjiVPCXpNNUSUL1zMZLUzdvqCQ1wd4i
 84BcTDpVxnKTUQhKu8zsGOZCB3yZA0cxIGQAaVkmwgDzPw+fhHDX4nnA8 w==;
X-CSE-ConnectionGUID: DaXoSAR/QeCzGR3YBwYyiQ==
X-CSE-MsgGUID: MibGTpz/R6ihxhbu+J3Ezg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33348632"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="33348632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:09:28 -0800
X-CSE-ConnectionGUID: ex+zzgT6Stef02kBIfrsuw==
X-CSE-MsgGUID: oy8AdgBjRUegiBJ1dgyI/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83815795"
Received: from gbaugh-mobl.ger.corp.intel.com (HELO [10.213.194.58])
 ([10.213.194.58])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:09:26 -0800
Message-ID: <b2995283-9fe0-477d-8ceb-2b67b15f9aa9@linux.intel.com>
Date: Tue, 5 Nov 2024 06:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] igt-runner fact checking
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 luciano.coelho@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
Content-Language: en-US
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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


[...]

> 
> TODO
>  - Save logs to disk.

I got the first CI results, and the logs are actually saved to disk in a place that feels right to me, the file igt_runner0.txt. This file contains the terminal output of igt-runner. Here is an example:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12022/bat-dg2-oem2/igt_runner0.txt

We can clearly see that all tests are behaving properly and no change to the environment is undesired. So unless a review spot something that need change, the patch seems to be ready to be merged.

[...]

