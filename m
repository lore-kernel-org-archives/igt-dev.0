Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BCE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 13:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D590010E4B1;
	Mon,  9 Dec 2024 13:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WV4qrjCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9493C10E4B1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733752256; x=1765288256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yIuxZGNYjO5/+bmPV1SIWd2dDC5OFYqKPc1wqPHSgjY=;
 b=WV4qrjCc7J0uoJWoVhdh2nM8xUjzy7jrmPeQTgCJqGoxDs4oXCMyj5Da
 I+sd7VYWwDBo5D/7d8/ygiTz5UoZ/pDSCJNZihrZpwOYRo99Q1DzOZogz
 GMmZVbHo9q3ygAA/OvZB0D6UXcQN9LNPH19C/AGyo29j2WqkKYT0VruX1
 va6C24m+TpzkAo4A2Z+xkkFDmrTkZtitUGcGLv7u+c+/zCNbP6wWlM2JN
 XkTa4Gx0iJi18Nu45r+JS4rkm5lcWJv5mfHAOfOB6lOpoQ+lMMuWJWVbl
 kkvCeu8rXDVoIn8QkySBGob1CEWwQy5tC/CXhrbseUulqm0vop0/J7/Md Q==;
X-CSE-ConnectionGUID: kv0lZDKMSiKRtwQejGb7cw==
X-CSE-MsgGUID: gbJASspgTUSCFVaSjx/yHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37832318"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="37832318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:50:56 -0800
X-CSE-ConnectionGUID: tiR+abxCT3C8bPKzDdz93w==
X-CSE-MsgGUID: Nlwp0WpPRyu6lx/ioZPZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="125912740"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.184])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:50:52 -0800
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
Date: Mon, 09 Dec 2024 14:50:49 +0100
Message-ID: <11260117.BaYr0rKQ5T@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c3b14136-db8a-4d3d-82cb-038c2241fe76@linux.intel.com>
References: <5a111c35-7245-4ada-a2a0-3fd0fd5bbeab@linux.intel.com>
 <15344780.JCcGWNJJiE@jkrzyszt-mobl2.ger.corp.intel.com>
 <c3b14136-db8a-4d3d-82cb-038c2241fe76@linux.intel.com>
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

On Monday, 9 December 2024 12:06:33 CET Peter Senna Tschudin wrote:
> Hi Janusz,
>=20
> On 09.12.2024 10:17, Janusz Krzysztofik wrote:
> > On Friday, 6 December 2024 06:45:31 CET Peter Senna Tschudin wrote:
> >> Hi Janusz,
> >>
> >> Thank you for your detailed comments. I appreciate the opportunity
> >> to clarify and address your concerns.
> >>
> >> On 05.12.2024 15:05, Janusz Krzysztofik wrote:
> >>> Hi Peter,
> >>>
> >>> On Wednesday, 4 December 2024 19:44:53 CET Peter Senna Tschudin wrote:
> >>>> When using igt-runner, collect facts before each test and after the
> >>>> last test, and report when facts change. The facts are:
> >>>>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b=
 Intel Battlemage (Gen20)
> >>>>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_=
at_addr.0000:03:00.0: card1
> >>>>  - Kernel taints: kernel.is_tainted.taint_warn: true
> >>>>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> >>>>
> >>>> This change imposes little execution overhead and adds just a few
> >>>> lines of logging. The facts will be printed on normal igt-runner
> >>>> output. Here is a real example from our CI shwoing
> >>>> hotreplug-lateclose changing the DRM card number=20
> >>>
> >>> Since you give that as an example of how helpful your facts can be, a=
nd follow=20
> >>> that with a kernel taint example, that may indicate you think, and us=
ers of=20
> >>> your facts may then be mislead having that read, that the taint was r=
elated to=20
> >>> the change of card number, while both had nothing to do with each oth=
er.
> >>
> >> Let=E2=80=99s take a step back to define the purpose and scope of igt-=
facts:
> >>  - Definition of a fact from the dictionary: A fact is an objectively =
verifiable
> >>    piece of information.
> >>  - Purpose of igt-facts: Track which tests cause changes to the facts.
> >>
> >> The operation is straightforward: facts are collected before and after=
 each test,
> >> and any differences are logged. Here=E2=80=99s an example showing a fa=
ct change and a new
> >> fact after running hotreplug-lateclose:
> >>
> >>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: har=
dware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
> >>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.=
is_tainted.taint_die: true
> >>
> >> This output highlights the facts without implying causation between th=
em. The
> >> tool(and my commit message) neither explains relationships between fac=
ts nor
> >> misleads users into assuming causation.
> >=20
> > For me your commit message does.
>=20
> Can you please provide some external support for your claims?
>=20
> I am very careful while writing, and I am aware of my own limitations.
> After reading what chatGPT wrote about my text, I felt comfortable
> about not misleading anyone. Please mind the wording of my
> question: I did not hint a desired outcome for chatGPT.
>=20
> My Question:
> -- // --
> Can you please indicate any potential causality relationship
> that the following text may offer?
>=20
> Here is a real example from our CI shwoing hotreplug-lateclose
> changing the DRM card number and tainting the kernel on the
> abort path
> -- // --
>=20
> chatGPT answer:
> --//--
> The text suggests a potential causality relationship between the
> "hotreplug-lateclose" operation and its effects on the system:
>=20
> 1. Causal Event: The "hotreplug-lateclose" operation.
> This likely refers to a process in the CI(Continuous Integration)
> environment related to hotplugging devices and managing late-close
> scenarios. Hotplugging involves dynamically adding or removing
> hardware components without shutting down the system.
>=20
> 2. Effects:
>=20
> * Changing the DRM card number: This implies that the operation
> affects the enumeration or reordering of DRM (Direct Rendering
> Manager) devices, causing the card number to be reassigned.
>=20
> * Kernel Tainting on the abort path: Kernel tainting typically
> indicates that the kernel has entered a state that is not
> guaranteed to be stable or reliable. This could occur due
> to improper handling of errors or unexpected conditions
> during the "abort path" (likely a failure or cleanup process
> in the operation).
>=20
> Suggested Causal Chain:
> 1. The "hotreplug-lateclose" operation executes in the CI.
> 2. This causes a change in DRM card enumeration (potentially due
> to how devices are initialized or re-initialized).
> 3. On the abort path of this operation, a condition arises that
> taints the kernel (possibly due to resource cleanup issues,
> unhandled errors, or driver misbehavior).
>=20
> This text highlights a possible link between hotreplug-lateclose
> handling and instabilities in DRM device management as well as
> kernel state integrity.
> --//--
>=20
>=20
>=20
> >=20
> > Can you please provide a full list of "facts" your code is supposed to =
handle?
>=20
> This is in the commit message already, at the very begining.
>  =20
> > Can you please explain why you selected just those "facts", not others?
>=20
> It was either what was missing, such as a convenient way to learn when
> something strange happend as a gpu disappearing from the PCI bus, or
> something that we believe may cause errors downstream such as a taint,
> and the list of loaded modules.
>=20
> For the drm card number association, we belive that there may be a caching
> issue: we are trying to figure it out if the drm-reopen cache handles the
> change of drm number association well. We have weak information pointing
> to a probable problem akin to missing cache invalidation.

Let's have a look at CI reports from igt@core_hotunplug@hotre* subtests tha=
t=20
resulted in kernel taint:
https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query=3Dtest_name%20~=
=3D%20%22^igt@core_hotunplug@hotre%22%20AND%20runconfig_tag%20CONTAINS%20%2=
2xe%22%20AND%20status_name%20NOT%20IN%20[%22notrun%22,%22pass%22,%22skip%22=
]%20AND%20dmesg%20~=3D%20%22[tT]aint%22

Here are three cases from the top of the list at the time of this writing:

1.
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8142/shard-bmg-5/igt@core_hot=
unplug@hotrebind-lateclose.html

stdout:
=2E..
Opened device: /dev/dri/card0
=2E..
Opened device: /dev/dri/renderD128
=2E..
Opened device: /dev/dri/card1
Opened device: /dev/dri/renderD129

dmesg:
=2E..
<6> [339.587085] [IGT] core_hotunplug: starting subtest hotrebind-lateclose
=2E..
<4> [340.531229] WARNING: CPU: 8 PID: 45 at drivers/gpu/drm/i915/display/in=
tel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [340.532206] CPU: 8 UID: 0 PID: 45 Comm: kworker/8:0 Tainted: G        =
W          6.13.0-rc1-xe+ #1
<4> [340.532221] Tainted: [W]=3DWARN
=2E..
<7> [340.617993] [IGT] core_hotunplug: opening DRM device for hot rebind
=2E..
<4> [340.929113] WARNING: CPU: 2 PID: 4067 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [340.930040] CPU: 2 UID: 0 PID: 4067 Comm: core_hotunplug Tainted: G   =
     W          6.13.0-rc1-xe+ #1
<4> [340.930054] Tainted: [W]=3DWARN
=2E..
<4> [341.059764] WARNING: CPU: 2 PID: 4067 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [341.059995] CPU: 2 UID: 0 PID: 4067 Comm: core_hotunplug Tainted: G   =
     W          6.13.0-rc1-xe+ #1
<4> [341.059999] Tainted: [W]=3DWARN
=2E..
<7> [341.348551] [IGT] core_hotunplug: rebinding the driver to the device
=2E..
<6> [341.614815] [drm] Initialized xe 1.1.0 for 0000:03:00.0 on minor 1
=2E..


2.
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2331-e57b4b7cd137e0ae00d2601b4=
b55ab7f504da422/shard-bmg-8/igt@core_hotunplug@hotrebind-lateclose.html

stdout:
=2E..
Opened device: /dev/dri/card1
=2E..
Opened device: /dev/dri/renderD129
=2E..
Opened device: /dev/dri/card0
Opened device: /dev/dri/renderD128
=2E..

dmesg:
=2E..
<7> [483.134426] [IGT] core_hotunplug: opening DRM device for hot rebind
=2E..
<4> [483.441514] WARNING: CPU: 8 PID: 5465 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [483.442441] CPU: 8 UID: 0 PID: 5465 Comm: core_hotunplug Tainted: G   =
     W          6.13.0-rc1-xe+ #1
<4> [483.442456] Tainted: [W]=3DWARN
=2E..
<4> [483.586987] WARNING: CPU: 0 PID: 5465 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [483.587210] CPU: 0 UID: 0 PID: 5465 Comm: core_hotunplug Tainted: G   =
     W          6.13.0-rc1-xe+ #1
<4> [483.587214] Tainted: [W]=3DWARN
=2E..
<7> [484.026293] [IGT] core_hotunplug: rebinding the driver to the device
=2E..
<6> [484.291135] [drm] Initialized xe 1.1.0 for 0000:03:00.0 on minor 0
=2E..


3.
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2330-784dd0b20e39add60971ccdd5=
d2f7f3c27cf37bb/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html

stdout:
=2E..
Opened device: /dev/dri/card1
=2E..
Opened device: /dev/dri/renderD129
=2E..
Opened device: /dev/dri/card0
Opened device: /dev/dri/renderD128
=2E..

dmesg:
=2E..
<6> [483.536630] [IGT] core_hotunplug: starting subtest hotrebind-lateclose
=2E..
<4> [484.402689] WARNING: CPU: 4 PID: 4167 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [484.403663] CPU: 4 UID: 0 PID: 4167 Comm: kworker/4:7 Tainted: G      =
  W          6.13.0-rc1-xe+ #1
<4> [484.403677] Tainted: [W]=3DWARN
=2E..
<7> [484.563261] [IGT] core_hotunplug: closing health checked device instan=
ce
=2E..
<4> [484.641694] WARNING: CPU: 9 PID: 4887 at drivers/gpu/drm/i915/display/=
intel_display.c:416 intel_disable_transcoder+0x322/0x400 [xe]
=2E..
<4> [484.642621] CPU: 9 UID: 0 PID: 4887 Comm: kworker/9:4 Tainted: G      =
  W          6.13.0-rc1-xe+ #1
<4> [484.642635] Tainted: [W]=3DWARN
=2E..
<7> [484.725550] [IGT] core_hotunplug: closing health checked device instan=
ce
=2E..
<4> [484.873571] WARNING: CPU: 9 PID: 4887 at drivers/gpu/drm/i915/display/=
intel_display.c:416 intel_disable_transcoder+0x322/0x400 [xe]
=2E..
<4> [484.874656] CPU: 9 UID: 0 PID: 4887 Comm: kworker/9:4 Tainted: G      =
  W          6.13.0-rc1-xe+ #1
<4> [484.874672] Tainted: [W]=3DWARN
=2E..
<7> [484.959255] [IGT] core_hotunplug: opening DRM device for hot rebind
=2E..
<4> [485.126668] WARNING: CPU: 9 PID: 4887 at drivers/gpu/drm/i915/display/=
intel_display.c:416 intel_disable_transcoder+0x322/0x400 [xe]
=2E..
<4> [485.127401] CPU: 9 UID: 0 PID: 4887 Comm: kworker/9:4 Tainted: G      =
  W          6.13.0-rc1-xe+ #1
<4> [485.127413] Tainted: [W]=3DWARN
=2E..
<4> [485.309106] WARNING: CPU: 0 PID: 5276 at drivers/gpu/drm/i915/display/=
intel_display_power.c:580 __intel_display_power_put_domain+0x1c9/0x200 [xe]
=2E..
<4> [485.309290] CPU: 0 UID: 0 PID: 5276 Comm: core_hotunplug Tainted: G   =
     W          6.13.0-rc1-xe+ #1
<4> [485.309293] Tainted: [W]=3DWARN
=2E..
=2E..
<7> [485.941797] [IGT] core_hotunplug: rebinding the driver to the device
=2E..
<6> [486.209963] [drm] Initialized xe 1.1.0 for 0000:03:00.0 on minor 0
=2E..


In all the above reports I can see information on changed device minor numb=
er=20
and kernel tainted.


Now let's try to find an abort with no relevant information in dmesg (i.e.,=
=20
neither explicit info about kernel taint, nor BUG nor WARNING kernel messag=
es=20
=2D- events that mark the kernel tainted):
https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query=3Dtest_name+~%3D=
+%22^igt%40core_hotunplug%40hotre%22+AND+status_name+IS+IN+[%22abort%22]+AN=
D+NOT+dmesg+~%3D+%22[tT]aint|BUG|WARNING%22

I can't find any, can you?

Let's also try to find reports from executions where the driver was=20
succesfully rebound but information about potentially changed device minor=
=20
number was not provided:
https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query=3Dtest_name%20~=
=3D%20%22^igt@core_hotunplug@hotre%22%20AND%20status_name%20NOT%20IN%20[%22=
notrun%22,%22pass%22,%22skip%22]%20AND%20dmesg%20~=3D%20%22opening%20DRM%20=
device%20for%20hot(.*\n)*.*\[drm\]%20Initialized(.*\n)*.*opening%20DRM%20de=
vice%20for%20health%20check%22%20AND%20NOT%20stdout%20~=3D%20%22\nOpened%20=
device:%20/dev/dri/renderD12[0-9]\n(.*\n)*Opened%20device:%20/dev/dri/card[=
0-9]\n%22

I can see only cases where IGT runner didn't include such information from=
=20
stdout in the report because it killed the test after timeout and stopped=20
tracing its stdout before the test attempted to rebind the driver and had a=
=20
chance to print those messages to stdout.


*What value do your facts add to CI reporting then?*

Thanks,
Janusz


>=20
>=20
> Thanks!
>=20
> [...]
>=20




