Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BCCC79FAD
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D1710EFC5;
	Wed,  9 Sep 2026 08:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLwFV0fY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02C10EFC5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788942725; x=1820478725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4feAoK/pC2tr9tg3NyDFUQNEWsRUr13h7F6A2NNOOnw=;
 b=gLwFV0fYhEs0BN/evapRXLCg6zT8eBRnO0/8TqW2CqkORAFO4+tHGIEz
 xeOe7t70omTKpVohV6tTa9rF+ru+iUOU0C6GZTx+f79uSwnNHzLFLbJXF
 GHUxpCFUTizaKP9MG6q6LdD0YhNXajM1x5BRHyg1CDmXqO6VqRZBtMby+
 tFqnihUSSAF+kRkKcuVfrdr9KJNjSnHB1mKKfL3m69KedDq95WdEXgaWx
 5rMMrlet5HY9I2BVm77vVBUSP+nwfTzdkOgvtIOtBatDfymb0Wci/kxQ6
 ax1m1LGHU7VMOsUftJn9K+lct3Lt09DE5zMkGek2AjuGnH1lxPQZBAZqt g==;
X-CSE-ConnectionGUID: 11EIxOS4T6ur8kCOhfDFug==
X-CSE-MsgGUID: DS+ruc9yQP6qDO3+rck0oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114903786"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114903786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:32:04 -0700
X-CSE-ConnectionGUID: 4NKRJQe0TGytMYISoPKQ8A==
X-CSE-MsgGUID: nhn56JWfR2ajacANu+FG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269912821"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.20])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 01:32:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com, Chaitanya Kumar
 Borah <chaitanya.kumar.borah@intel.com>, Alex Hung <alex.hung@amd.com>,
 Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon
 Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH i-g-t v5 8/8] lib/igt_kms: add macros to iterate color
 pipelines and colorops
In-Reply-To: <956430d0a9eb201f13c963575556568bc89fc1b3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-9-mwen@igalia.com>
 <956430d0a9eb201f13c963575556568bc89fc1b3@intel.com>
Date: Wed, 09 Sep 2026 11:31:56 +0300
Message-ID: <110476a208e2b02296b9aff130db98487252ca3a@intel.com>
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

On Thu, 03 Sep 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 02 Sep 2026, Melissa Wen <mwen@igalia.com> wrote:
>> @@ -1027,6 +1028,31 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
>>  		igt_colorop_set_prop_changed(colorop, prop); \
>>  	} while (0)
>>  
>> +/**
>> + * for_each_color_pipeline:
>> + * @plane: plane to which the color pipelines belong
>> + * @color_pipeline: the color pipeline to iterate
>> + *
>> + * Iterates through all color pipelines supported by @plane. If no color
>> + * pipeline is supported, nothing happens.
>> + */
>> +#define for_each_color_pipeline(plane, color_pipeline) \
>> +	for (int igt_unique(__i) = 0; \
>> +	     igt_unique(__i) < (plane)->num_color_pipelines && \
>> +	     ((color_pipeline) = (plane)->color_pipelines[igt_unique(__i)], true); \
>> +	     igt_unique(__i)++)
>
> Hmm, I wonder if this is robust. igt_unique() is currently based on
> __LINE__, and that might work through being expanded based on the macro
> instantiation line instead of the macro definition lines here. If
> igt_unique() ever becomes truly unique, it certainly breaks, because the
> above will contain four different unique identifiers instead of one. But
> it's not silent, it'll break the build.

Okay, looks like there's a lot of this type of igt_unique() usage in
igt. Not sure how I feel about it. :/

It's all exposed by making igt_unique() actually unique:

 #define igt_unique(prefix) \
-       igt_tokencat(igt_tokencat(__igt_unique__, prefix), __LINE__)
+       igt_tokencat(igt_tokencat(__igt_unique__, prefix), __COUNTER__)

So I guess the patch at hand doesn't make things any worse, really.


BR,
Jani.


-- 
Jani Nikula, Intel
