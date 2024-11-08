Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE89D5E140
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 06:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAB410E26E;
	Fri,  8 Nov 2024 06:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/WSZtk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC5810E26E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731048706; x=1762584706;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OE8sAi6LNSTToMUVOx4ofWZZKYEUJ7UGDs09im5DFaw=;
 b=J/WSZtk1M3OLg+wmFCM3sa5+NMctRnhET0vWJj0vmvCVMzwswrdrxwmZ
 YzZS3tnLoPzAXFSzaPIDyzv//lBDNf8aMiVKz67t7PgBnV+XmmYxPU+tm
 au7Aaol8u50c4gqFjUCq1wgOX8O/Yr5Gl4xkk3YNuFjdx1RZTClyuTGSv
 9aNVYOiXx2gDDSJQRA7UG/7S6K00vR2waS4IX1LsWsyglyLtJf0wAx/Tt
 L05zU1RkzPClVL5CGW6H9OR1TY2vcbWDUEeZKDlf9GIOKiD4uMaMONWxj
 Ze067Bmv4LPaLmgfPl3vvO1uXJjZZ4ohGUTUJbX2N72VSBu1nrKfQmb6m g==;
X-CSE-ConnectionGUID: A+IrkxY5TgO9dY/Wmg5EaA==
X-CSE-MsgGUID: xVDpMWMkTH+ws3Y89IdtsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30806384"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30806384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:51:43 -0800
X-CSE-ConnectionGUID: UwaJxZwXQUud2eW+fIy0Gg==
X-CSE-MsgGUID: QD4NjP5SQZK5iXkskKvdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="116269970"
Received: from askrebko-mobl1.ger.corp.intel.com (HELO [10.213.195.95])
 ([10.213.195.95])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:51:41 -0800
Message-ID: <08f43b41-cd86-415d-83e0-ce4fa161545c@linux.intel.com>
Date: Fri, 8 Nov 2024 07:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] igt-runner fact checking
To: "Knop, Ryszard" <ryszard.knop@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sousa, Gustavo" <gustavo.sousa@intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
 <4dbdbc32618cc7bbc7b13ee961534fc798be5b91.camel@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <4dbdbc32618cc7bbc7b13ee961534fc798be5b91.camel@intel.com>
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

Dear Ryszard,

Thank you for taking the time to write. Please see my comments bellow.

On 08.11.2024 02:15, Knop, Ryszard wrote:

[...]

> 
> Extra hooks more or less hardcoded in the command line for a given run
> are easy, just let us know when to add them. Reading extras from the
> cover letter is doable, but would require time (think: early next year,
> not a week or two), as we are switching the Patchwork integration to a
> new implementation at the moment.
> 
> Although, two comments about the "facts" infra:
> 
> - I like the simple text format, but if possible, make the output
> easier to parse with a consistent format for all state changes, like:
> [FACT <test>] <new|changed|deleted>: <prop>: <value>[ -> <new_value>]

Thank you for that, it will be on V4. What string do you want for the first
facts that print before the first test? Currently is "before any test".

Just to make sure I understood what you want, the first '[]' around FACT are
intended to be printed while the second ones around  -> <new_value> are not to
be printed and are there to indicate an optional part of the message. Correct?

> 
> - While running these facts within hooks could work, it would require
> extending the hooks with something that can understand that a given
> command is supposed to output a bunch of facts in a well-known format
> (ideally JSON, alternatively a "key: value" text block), then diff them
> against the state from the previou run of the same hook.

Please tell me what you want. I like to have text output on the terminal with
igt-runner output, but it is just a convenience. Please tell me how you want the
output to be printed and/or saved to disk.

[...]

Thank you,

Peter
