Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738C2C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 07:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702A10E081;
	Thu, 23 May 2024 07:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myl6oRMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AC410E081
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716449180; x=1747985180;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lgo2sNo8AOLCgVXAhb0v7y8iuDZtIbCrwc9reNZRevw=;
 b=myl6oRMdxdKsDCTIQ3jzlHW96wJVCFjWzHQnDX04CTpeCQUTNP9lhFRC
 /s3yrs4RCbt0urJ9l4bhiNIp6P9FWOvo00EpeXqZWko2ClsSfr1Im5W0t
 QVi8ivWq3y9Q31p7JHKZKptwCYOb1E7hb7NGltPs3SXNysP6FBtQTr24e
 koK0QLnJLmGc8h2h3RWeE+LkHFltl5xzbaXRol0tcERUpo5nQn2gSO43v
 i2ineUvB3qiQIdWlJ2OwqFl7fX/Co5e5gI0PYG3WSlBmnTaDZsoRlN2ot
 Yd37SoshHVAgan9yCdSOKRL1E8nPvzWoW+HjROQ385JvJak+b8DtSp6TT w==;
X-CSE-ConnectionGUID: WM2+apnGTUKA4Q2djUVHQQ==
X-CSE-MsgGUID: WdHUR90GTSme0UKEQDyGRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12597367"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12597367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 00:26:06 -0700
X-CSE-ConnectionGUID: KSKfmTLTQky+teF5ap4jCA==
X-CSE-MsgGUID: ukXqBmHzRVa57TFIbo26UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="64411856"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 00:26:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240523070346.04def11b@maurocar-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <20240523070346.04def11b@maurocar-mobl2>
Date: Thu, 23 May 2024 10:26:01 +0300
Message-ID: <87sey9oupi.fsf@intel.com>
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

On Thu, 23 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> On Wed, 22 May 2024 16:46:27 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
>
>> Hi Jani,
>> On 2024-05-22 at 16:26:44 +0300, Jani Nikula wrote:
>> > On Wed, 22 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:  
>> > > On Wed, 22 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:  
>> > >> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>> > >>
>> > >> Such tool parses the Kernel drivers for both i915 and Xe and
>> > >> generates a script that helps detecting Intel GPU models.  
>> > >
>> > > I acknowledge the usefulness of such a tool, but to be brutally honest,
>> > > this implementation is horrible in so many levels.
>> > >
>> > > IGT uses meson and avoids perl.  
>> 
>> imho this could also be a python script.
>
> Converting the output to a python script should be trivial and can be done
> later on. The generated script has a a simple hash/dict lookup logic.

It should not be a generated script in the first place. It should not
grep the kernel or igt sources for certain patterns which will
change. It should not have to be this complicated.

If it's C, it should be a regular build (via meson). If it's Python, it
should do all it needs to do when running it.


BR,
Jani.


-- 
Jani Nikula, Intel
