Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D13E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 09:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8810E151;
	Tue, 10 Dec 2024 09:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLeU7RnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39C310E151
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733824223; x=1765360223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7tTTXczhQV+0w7iGzq4yPrWz8jVXezgmd/1q8tdW5g=;
 b=OLeU7RnQ0pZE+7Whj3H2t73Br/KWt4m69iKSmLatjlbmyDxJ7wacPSy5
 /oHQsJNDwnE+Oz3RBkKirgiWtYqWrMCgtaUMyb1QNy4vlxSkexRfd7cNi
 QUksWBaAT5gH+HKaeINW5CVGmOPIyBF9LIyVoDC/3xnX+CQVz9JOm1ckA
 VdXuXPNDSurZXrUdZPEPeXy4mWo3bmgVv5gRwccZvGssQguJj5CSw+6wN
 e+GWedafBouVA1QiDx5QykgtbMcGBDkdgkpB1QFaUMDuiEbkAPpm/SA+W
 /Nv01EGceADChrFwvJLLGDLhKmEY3c1CJ0RJgXM2I5LCgB6wvJ/FKjFAv A==;
X-CSE-ConnectionGUID: BHOyxfD+S3GTtlTle/FJ+A==
X-CSE-MsgGUID: m4FSSBplQn6Fp4QWmDofuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44627222"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44627222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:50:22 -0800
X-CSE-ConnectionGUID: OJiYFK9+RM+7eaicXgWXTg==
X-CSE-MsgGUID: MXyhh+A3SgyQun9593y1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95829559"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.250])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:50:19 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com, dominik.karol.piatkowski@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v10] igt-runner fact checking
Date: Tue, 10 Dec 2024 10:50:16 +0100
Message-ID: <13339095.EVyyLHbfrO@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <519663d4-e075-40d9-8404-7a2c2a95c5a9@linux.intel.com>
References: <5a111c35-7245-4ada-a2a0-3fd0fd5bbeab@linux.intel.com>
 <11260117.BaYr0rKQ5T@jkrzyszt-mobl2.ger.corp.intel.com>
 <519663d4-e075-40d9-8404-7a2c2a95c5a9@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Peter,

On Tuesday, 10 December 2024 09:38:59 CET Peter Senna Tschudin wrote:
> Very good morning Janusz,
>=20
> Thank you for your detailed question.
>=20
> On 09.12.2024 14:50, Janusz Krzysztofik wrote:
> > On Monday, 9 December 2024 12:06:33 CET Peter Senna Tschudin wrote:
> >> Hi Janusz,
> >>
> >> On 09.12.2024 10:17, Janusz Krzysztofik wrote:
> >>> On Friday, 6 December 2024 06:45:31 CET Peter Senna Tschudin wrote:
> >>>> Hi Janusz,
> >>>>
> >>>> Thank you for your detailed comments. I appreciate the opportunity
> >>>> to clarify and address your concerns.
> >>>>
> >>>> On 05.12.2024 15:05, Janusz Krzysztofik wrote:
> >>>>> Hi Peter,
> >>>>>
> >>>>> On Wednesday, 4 December 2024 19:44:53 CET Peter Senna Tschudin wro=
te:
> >>>>>> When using igt-runner, collect facts before each test and after the
> >>>>>> last test, and report when facts change. The facts are:
> >>>>>>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e2=
0b Intel Battlemage (Gen20)
> >>>>>>  - Associations between PCI GPU and DRM card: hardware.pci.drm_car=
d_at_addr.0000:03:00.0: card1
> >>>>>>  - Kernel taints: kernel.is_tainted.taint_warn: true
> >>>>>>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> >>>>>>
> >>>>>> This change imposes little execution overhead and adds just a few
> >>>>>> lines of logging. The facts will be printed on normal igt-runner
> >>>>>> output. Here is a real example from our CI shwoing
> >>>>>> hotreplug-lateclose changing the DRM card number=20
> >>>>>
> >>>>> Since you give that as an example of how helpful your facts can be,=
 and follow=20
> >>>>> that with a kernel taint example, that may indicate you think, and =
users of=20
> >>>>> your facts may then be mislead having that read, that the taint was=
 related to=20
> >>>>> the change of card number, while both had nothing to do with each o=
ther.
> >>>>
> >>>> Let=E2=80=99s take a step back to define the purpose and scope of ig=
t-facts:
> >>>>  - Definition of a fact from the dictionary: A fact is an objectivel=
y verifiable
> >>>>    piece of information.
> >>>>  - Purpose of igt-facts: Track which tests cause changes to the fact=
s.
> >>>>
> >>>> The operation is straightforward: facts are collected before and aft=
er each test,
> >>>> and any differences are logged. Here=E2=80=99s an example showing a =
fact change and a new
> >>>> fact after running hotreplug-lateclose:
> >>>>
> >>>>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: h=
ardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
> >>>>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kerne=
l.is_tainted.taint_die: true
> >>>>
> >>>> This output highlights the facts without implying causation between =
them. The
> >>>> tool(and my commit message) neither explains relationships between f=
acts nor
> >>>> misleads users into assuming causation.
> >>>
> >>> For me your commit message does.
> >>
> >> Can you please provide some external support for your claims?
> >>
> >> I am very careful while writing, and I am aware of my own limitations.
> >> After reading what chatGPT wrote about my text, I felt comfortable
> >> about not misleading anyone. Please mind the wording of my
> >> question: I did not hint a desired outcome for chatGPT.
> >>
> >> My Question:
> >> -- // --
> >> Can you please indicate any potential causality relationship
> >> that the following text may offer?
> >>
> >> Here is a real example from our CI shwoing hotreplug-lateclose
> >> changing the DRM card number and tainting the kernel on the
> >> abort path
> >> -- // --
> >>
> >> chatGPT answer:
> >> --//--
> >> The text suggests a potential causality relationship between the
> >> "hotreplug-lateclose" operation and its effects on the system:
> >>
> >> 1. Causal Event: The "hotreplug-lateclose" operation.
> >> This likely refers to a process in the CI(Continuous Integration)
> >> environment related to hotplugging devices and managing late-close
> >> scenarios. Hotplugging involves dynamically adding or removing
> >> hardware components without shutting down the system.
> >>
> >> 2. Effects:
> >>
> >> * Changing the DRM card number: This implies that the operation
> >> affects the enumeration or reordering of DRM (Direct Rendering
> >> Manager) devices, causing the card number to be reassigned.
> >>
> >> * Kernel Tainting on the abort path: Kernel tainting typically
> >> indicates that the kernel has entered a state that is not
> >> guaranteed to be stable or reliable. This could occur due
> >> to improper handling of errors or unexpected conditions
> >> during the "abort path" (likely a failure or cleanup process
> >> in the operation).
> >>
> >> Suggested Causal Chain:
> >> 1. The "hotreplug-lateclose" operation executes in the CI.
> >> 2. This causes a change in DRM card enumeration (potentially due
> >> to how devices are initialized or re-initialized).
> >> 3. On the abort path of this operation, a condition arises that
> >> taints the kernel (possibly due to resource cleanup issues,
> >> unhandled errors, or driver misbehavior).
> >>
> >> This text highlights a possible link between hotreplug-lateclose
> >> handling and instabilities in DRM device management as well as
> >> kernel state integrity.
> >> --//--
> >>
> >>
> >>
> >>>
> >>> Can you please provide a full list of "facts" your code is supposed t=
o handle?
> >>
> >> This is in the commit message already, at the very begining.
> >>  =20
> >>> Can you please explain why you selected just those "facts", not other=
s?
> >>
> >> It was either what was missing, such as a convenient way to learn when
> >> something strange happend as a gpu disappearing from the PCI bus, or
> >> something that we believe may cause errors downstream such as a taint,
> >> and the list of loaded modules.
> >>
> >> For the drm card number association, we belive that there may be a cac=
hing
> >> issue: we are trying to figure it out if the drm-reopen cache handles =
the
> >> change of drm number association well. We have weak information pointi=
ng
> >> to a probable problem akin to missing cache invalidation.
>=20
> [...]
>  > *What value do your facts add to CI reporting then?*
>=20
> It seems that the focus of your feedback has shifted from 'Peter is
> misleading people' to questioning the value of igt-runner. I believe
> it's important to address this change in perspective to ensure
> clarity and productive discussion.
>=20
> To address your new point, let me draw an analogy: asking "what is
> the value of igt-runner?" is similar to questioning the use of a car
> to reach the supermarket when walking is an option. While walking may
> suffice, the car adds efficiency and convenience, especially for
> larger or more complex "tasks".
>=20
> In our CI setup, a typical test list includes between 100 and
> 200 tests. As you rightly pointed out, determining which test changed
> a specific fact currently requires significant time and effort. When
> multiple tests modify different facts, the process is not practical.
>=20
> igt-facts adds value by:
> - Clearly identifying which tests change which facts.
> - Enabling us to know which facts were present and absent before the
>   first test runs.
> - Reporting only changes, making the information concise and
>   efficient to review.
>=20
> Moreover, for most developers, the igt-facts output will not be
> obtrusive. In our CI runs, the output is saved only to the
> igt_runner?? file and does not appear in dmesg or the results.json
> file.
>=20
> And even so, in the few hundred runs that I checked, igt-facts
> typically added between 3 and 16 lines of log to a file that has
> about 1000 lines.
>=20
> I hope this explanation helps clarify the purpose and value of
> igt-facts.

Unfortunately not.  I still can't see how your 4 facts reported by igt_runn=
er=20
could be useful to me.  But let's hear from those who share your points.

Thanks,
Janusz

>=20
> Thank you,
>=20
> Peter
>=20




