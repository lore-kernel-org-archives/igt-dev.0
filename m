Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61384C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7910E3D2;
	Thu, 23 Jan 2025 06:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Etw1VNVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB5410E3D2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737613716; x=1769149716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rVH2FIawjRxnRQuWgUW7Rxu3HXmbM7su+ls7LGpEoUk=;
 b=Etw1VNVTnmatiGWvGjoHmoykEmldzb9bTtWwBU3+eiVEYbOSpOgf0BWB
 pfZf4w2UuEiPE2xUmw4a+++062IUENsTBNWYnx+qKpAJlpo4Sta8mieLN
 1HeUAyQ2n9aWeaOuE/3Z1AT/HEDrwyTgF5SgMxNX7pipP9gl26oWTZ/Y6
 BygWeeLo8F/MjIqEwIaZCoSB/c2T/SphgsQTQF3yPtckGGNoX/eiSYKwl
 mU7cA24T7Df4RsNR8TjS3lS+5e0kNvWVZk9H1F3cVurogQEvMK0IjbnNY
 kp/Qwl0SEe4mWXlx+D7926/bnLEKgifz1hfPi4OlXg1eJk3xRhZdnl4Qg w==;
X-CSE-ConnectionGUID: iSBUjWV/SE+D1kep1D0Ciw==
X-CSE-MsgGUID: V5Mk85nCTxWKOultf0zkhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49087771"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="49087771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:28:35 -0800
X-CSE-ConnectionGUID: TrYH8xL1RO2q+ZADr8aslQ==
X-CSE-MsgGUID: 2dBhNWbURduxMgNk8QQGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="112356660"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:28:34 -0800
Date: Thu, 23 Jan 2025 00:28:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 5/7] runner: Free settings at the end
Message-ID: <e7gqljgl56iemiyfabj4d45ysx5x7l4jgevoy5a7l7gje6a5d3@e7v5mv7wzatx>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-6-lucas.demarchi@intel.com>
 <173754639369.5500.6720737629497603639@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173754639369.5500.6720737629497603639@intel.com>
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

On Wed, Jan 22, 2025 at 08:46:33AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-01-21 19:57:31-03:00)
>>Keep valgrind happy with the normal allocations so we can find the real
>>leaks. Avoid this kind of leak:
>>
>>        ==806592== 8 bytes in 1 blocks are definitely lost in loss record 46 of 188
>>        ==806592==    at 0x4846828: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
>>        ==806592==    by 0x4BD534E: strdup (strdup.c:42)
>>        ==806592==    by 0x10E6AA: parse_options (settings.c:863)
>>        ==806592==    by 0x10D2DD: main (runner.c:19)
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>This looks correct, so:
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>, but it seems we also need to make initialize_execute_state() and
>initialize_execute_state_from_resume() properly clear_settings() when
>things go wrong internally.

Looking at runner/runner.c, there are more places to do it when things
go bad, example create_job_list(). Maybe replace the returns on error
path with `goto cleanup`?

Lucas De Marchi

>
>--
>Gustavo Sousa
>
>>---
>> runner/resume.c | 2 ++
>> runner/runner.c | 2 ++
>> 2 files changed, 4 insertions(+)
>>
>>diff --git a/runner/resume.c b/runner/resume.c
>>index 0f4e42bfa..ed17351c6 100644
>>--- a/runner/resume.c
>>+++ b/runner/resume.c
>>@@ -55,6 +55,8 @@ int main(int argc, char **argv)
>>                 exitcode = 3;
>>         }
>>
>>+        clear_settings(&settings);
>>+
>>         printf("Done.\n");
>>         return exitcode;
>> }
>>diff --git a/runner/runner.c b/runner/runner.c
>>index 4855ad641..258b30b36 100644
>>--- a/runner/runner.c
>>+++ b/runner/runner.c
>>@@ -49,6 +49,8 @@ int main(int argc, char **argv)
>>                 exitcode = 1;
>>         }
>>
>>+        clear_settings(&settings);
>>+
>>         printf("Done.\n");
>>         return exitcode;
>> }
>>--
>>2.48.0
>>
