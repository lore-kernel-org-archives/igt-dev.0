Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B20E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2714710E6C0;
	Mon,  9 Dec 2024 11:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhBIfwTg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DE110E6C0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733742399; x=1765278399;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=efa8t+6TUO8YQ5euskZXcP6rzMiQsYP0Im47oRPpgec=;
 b=YhBIfwTgHyze0ec5QtVHI2/N/A58eG0vC5jqZn4BUjf6IWx2im06wTgW
 uJ6bjryFsOm4PJnUrXZKqGO6FzQyoZC7xsXhKluNNvoMGGFq4OEQ8UO8C
 5+7X6ShI/JxL7Ok+7JuFBGeELQ96WYU8eIwdWBXc4+Mns+XJs46nOcwZL
 DHFQRHdJsyup0RLAN8SGO70urmpW78HcoZkLWkyUcXbubN25ggx1Z9DYF
 PqTfjKRe53Kg3UDNOvDpHJejSVfANSMTTZQ5XNeeTfh+NpB1YWCJ8WF9F
 Kl9pzifaesBKLi3UyNuWnKKLWPVC3+1vC/OtanQldagaUvK7fKnvZEOD+ g==;
X-CSE-ConnectionGUID: m6PrdHCTQo24x7BnOSIivA==
X-CSE-MsgGUID: kFskzYLQTHW1mQFN/+6HpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37711099"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="37711099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:06:38 -0800
X-CSE-ConnectionGUID: 4GS5AS4bQVi/Uymh7z+9mA==
X-CSE-MsgGUID: VtuyFq27QbGT6yLFdh69DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95500592"
Received: from gflanaga-mobl1.ger.corp.intel.com (HELO [10.213.200.206])
 ([10.213.200.206])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:06:36 -0800
Message-ID: <c3b14136-db8a-4d3d-82cb-038c2241fe76@linux.intel.com>
Date: Mon, 9 Dec 2024 12:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10] igt-runner fact checking
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com, dominik.karol.piatkowski@intel.com,
 katarzyna.piecielska@intel.com
References: <5a111c35-7245-4ada-a2a0-3fd0fd5bbeab@linux.intel.com>
 <2954980.SvYEEZNnvj@jkrzyszt-mobl2.ger.corp.intel.com>
 <2157e87e-a5f7-4d19-bacc-c39c75cc539d@linux.intel.com>
 <15344780.JCcGWNJJiE@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <15344780.JCcGWNJJiE@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,

On 09.12.2024 10:17, Janusz Krzysztofik wrote:
> On Friday, 6 December 2024 06:45:31 CET Peter Senna Tschudin wrote:
>> Hi Janusz,
>>
>> Thank you for your detailed comments. I appreciate the opportunity
>> to clarify and address your concerns.
>>
>> On 05.12.2024 15:05, Janusz Krzysztofik wrote:
>>> Hi Peter,
>>>
>>> On Wednesday, 4 December 2024 19:44:53 CET Peter Senna Tschudin wrote:
>>>> When using igt-runner, collect facts before each test and after the
>>>> last test, and report when facts change. The facts are:
>>>>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
>>>>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
>>>>  - Kernel taints: kernel.is_tainted.taint_warn: true
>>>>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
>>>>
>>>> This change imposes little execution overhead and adds just a few
>>>> lines of logging. The facts will be printed on normal igt-runner
>>>> output. Here is a real example from our CI shwoing
>>>> hotreplug-lateclose changing the DRM card number 
>>>
>>> Since you give that as an example of how helpful your facts can be, and follow 
>>> that with a kernel taint example, that may indicate you think, and users of 
>>> your facts may then be mislead having that read, that the taint was related to 
>>> the change of card number, while both had nothing to do with each other.
>>
>> Let’s take a step back to define the purpose and scope of igt-facts:
>>  - Definition of a fact from the dictionary: A fact is an objectively verifiable
>>    piece of information.
>>  - Purpose of igt-facts: Track which tests cause changes to the facts.
>>
>> The operation is straightforward: facts are collected before and after each test,
>> and any differences are logged. Here’s an example showing a fact change and a new
>> fact after running hotreplug-lateclose:
>>
>>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
>>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
>>
>> This output highlights the facts without implying causation between them. The
>> tool(and my commit message) neither explains relationships between facts nor
>> misleads users into assuming causation.
> 
> For me your commit message does.

Can you please provide some external support for your claims?

I am very careful while writing, and I am aware of my own limitations.
After reading what chatGPT wrote about my text, I felt comfortable
about not misleading anyone. Please mind the wording of my
question: I did not hint a desired outcome for chatGPT.

My Question:
-- // --
Can you please indicate any potential causality relationship
that the following text may offer?

Here is a real example from our CI shwoing hotreplug-lateclose
changing the DRM card number and tainting the kernel on the
abort path
-- // --

chatGPT answer:
--//--
The text suggests a potential causality relationship between the
"hotreplug-lateclose" operation and its effects on the system:

1. Causal Event: The "hotreplug-lateclose" operation.
This likely refers to a process in the CI(Continuous Integration)
environment related to hotplugging devices and managing late-close
scenarios. Hotplugging involves dynamically adding or removing
hardware components without shutting down the system.

2. Effects:

* Changing the DRM card number: This implies that the operation
affects the enumeration or reordering of DRM (Direct Rendering
Manager) devices, causing the card number to be reassigned.

* Kernel Tainting on the abort path: Kernel tainting typically
indicates that the kernel has entered a state that is not
guaranteed to be stable or reliable. This could occur due
to improper handling of errors or unexpected conditions
during the "abort path" (likely a failure or cleanup process
in the operation).

Suggested Causal Chain:
1. The "hotreplug-lateclose" operation executes in the CI.
2. This causes a change in DRM card enumeration (potentially due
to how devices are initialized or re-initialized).
3. On the abort path of this operation, a condition arises that
taints the kernel (possibly due to resource cleanup issues,
unhandled errors, or driver misbehavior).

This text highlights a possible link between hotreplug-lateclose
handling and instabilities in DRM device management as well as
kernel state integrity.
--//--



> 
> Can you please provide a full list of "facts" your code is supposed to handle?

This is in the commit message already, at the very begining.
  
> Can you please explain why you selected just those "facts", not others?

It was either what was missing, such as a convenient way to learn when
something strange happend as a gpu disappearing from the PCI bus, or
something that we believe may cause errors downstream such as a taint,
and the list of loaded modules.

For the drm card number association, we belive that there may be a caching
issue: we are trying to figure it out if the drm-reopen cache handles the
change of drm number association well. We have weak information pointing
to a probable problem akin to missing cache invalidation.


Thanks!

[...]
