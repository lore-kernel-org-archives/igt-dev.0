Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F68C25B79
	for <igt-dev@archiver.kernel.org>; Sat, 25 May 2024 05:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7322110E011;
	Sat, 25 May 2024 05:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Co6Wdjal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3711B10E011
 for <igt-dev@lists.freedesktop.org>; Sat, 25 May 2024 05:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716615876; x=1748151876;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JapoDATcBZSjVzh1MbHNR+nZEex7kTZrSvfNwXn5OWg=;
 b=Co6Wdjal3H7hGyGfNccLKxWGiw/5pATiR+I6sprg6y3pJT3dFF3Rs2/v
 1aDWkdEXmeENzHxqKhpf32hITuxphHT9uvTHMKalwICBHRAzASCHjF3X9
 RAzcrF7GZXQvrMTOdNC0qeL1XPj6qYxxncdrbzgPrQxUDDHQ/Chskz6jf
 z+cjfA/92LGGd0KYRJKb/1Va9rtes4FrGrH8ye232bSOc0F/l/3TBT2d9
 4cMq8YIwadCtJNzQdlmTC0m4ACfXgUDHxsRLjcZ67gqZYW6OJXUa76qeF
 N493BOC0JRfujYkB0MLwSyx/IRPBpu2r8ntBTY/x1JZ5tyTSYh7mcm7S8 Q==;
X-CSE-ConnectionGUID: 3JpUQHrfQQ6qnN9Us5RQSQ==
X-CSE-MsgGUID: Z7TaxY45QCSQWstsT26QPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12872262"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="12872262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 22:44:35 -0700
X-CSE-ConnectionGUID: FDYWKmaLT+65KK9tI3UGhw==
X-CSE-MsgGUID: fSDS1BDESgmbprPJjlbX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; d="scan'208";a="34320213"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 22:44:34 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.79])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ED7AE20BF42F;
 Fri, 24 May 2024 22:44:32 -0700 (PDT)
Date: Sat, 25 May 2024 07:44:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
Message-ID: <20240525074430.2cef0dbd@maurocar-mobl2>
In-Reply-To: <87o78voaqn.fsf@intel.com>
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
 <87le40q4gi.fsf@intel.com>
 <20240523173123.tu6rghsgsqkptrmm@kamilkon-DESK.igk.intel.com>
 <87o78voaqn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 24 May 2024 11:49:36 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> On Thu, 23 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Maybe this should/may be added to scripts?
> > I do find it usefull to have a little script checks,
> > without much dependancy on other libs/tools. I would
> > also want to have a way to semi-automatically update
> > it later on, where new devices will be added.  
> 
> I never questioned the usefulness of such a tool. Only the
> implementation, and how perl/make are not aligned with the IGT project,
> and the constant maintenance burden all of this brings.

Maintenance is required only when the macros to define PCI IDs at the
i915 driver changes - or if Xe driver stops using INTEL_VGA_MACRO.
This is not frequent. The only changes such approach had since when it
was written, back in 2022 is when we added support for Xe driver, and
now that the PCI ID macros at drm-tip for i915 changed.

With regards to the latest change, the v5 of this patch solves it.
The only change to make it compatible with the new way is to add a
single line:

	if [ "$$(grep MACRO__ i915_pciids.h)" != "" ]; then sed -E "s/(INTEL_\S+_IDS\()/\1INTEL_VGA_DEVICE, /" -i i915_id.h; fi

As, up to the current upstream Kernel, the macro to define a PCI ID
inside i915_pciids.h were:

	#define INTEL_I815_IDS(info)					\
		INTEL_VGA_DEVICE(0x1132, info)  /* I815*/
	...

And, on current upstream, it now requires INTEL_VGA_DEVICE to be
passed on its first argument:

	#define INTEL_I815_IDS(MACRO__, ...) \
		MACRO__(0x1132, ## __VA_ARGS__)  /* I815*/
	...

So, the generated list of PCI IDs should be changed from:

	static struct pci_device_id pci_ids[] = {
		INTEL_PVC_IDS("PVC"),
		INTEL_MTL_IDS("MTL"),
		INTEL_MTL_P_IDS("MTL_P"),
		INTEL_MTL_M_IDS("MTL_M"),
		...

to:

	static struct pci_device_id pci_ids[] = {
		INTEL_PVC_IDS(INTEL_VGA_DEVICE, "PVC"),
		INTEL_MTL_IDS(INTEL_VGA_DEVICE, "MTL"),
		INTEL_MTL_P_IDS(INTEL_VGA_DEVICE, "MTL_P"),
		INTEL_MTL_M_IDS(INTEL_VGA_DEVICE, "MTL_M"),
		...

Changing PCI ID macros is something that it is not frequent.

Regards,
Mauro
