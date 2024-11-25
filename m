Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB67D3B7F5
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 09:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754E10E1BD;
	Mon, 25 Nov 2024 09:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVE0Pbjm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F72110E1BD
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732528196; x=1764064196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7FXACzwmGJ1YODoiA5ZM9wMFoC1BervPeyFmhKHPF3o=;
 b=FVE0Pbjm5GGLrr3MfSclj+qWjvJpJ71PWQDDawQzwKvcqqYUcRcY4XJY
 VrjdXzcuu4dpRQjfC7smaoq7ALyHfsg6XtobAXHRdKhQqBTk/rHsDutaW
 vlgtIqb6zZMBXHidUremLyxvbkp7v7VLDro5KJYwM1A2WUP+pHSon2N7c
 YLwW/RamRuxnqqurRKlVyx63s5YiATgEsFlUOCO05Bji+PpN0w/CHgU9E
 LAkwCslNKPJHk64JC2NKiQRxhifTOroPRjMHGzGBVT/dh48fnnbMO8kO0
 wXPlXODrmv/zYIrhz6PQAFvfcIAJP5mz55xY4j9I3oTp1JmVthKW4gR+v Q==;
X-CSE-ConnectionGUID: ZTRP7Jg/QSGZOys1WBBzCw==
X-CSE-MsgGUID: 6YgFHzoRSZ6o4c1oYmDuJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36405274"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="36405274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:49:55 -0800
X-CSE-ConnectionGUID: 29NR65EFQfK/QXzkH7n+2g==
X-CSE-MsgGUID: QhuV4AUmRmihaGGjA+Jxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91397294"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:49:52 -0800
Date: Mon, 25 Nov 2024 10:49:49 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v8] igt-runner fact checking
Message-ID: <20241125094949.gxqftc3fccggwfo5@zkempczy-mobl2>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <9b26aa08-b762-4e5a-98b9-d7ccda7b1956@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b26aa08-b762-4e5a-98b9-d7ccda7b1956@linux.intel.com>
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

On Thu, Nov 21, 2024 at 03:22:30PM +0100, Peter Senna Tschudin wrote:
> When using igt-runner, collect facts before each test and after the
> last test, and report when facts change. The facts are:
>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
>  - Kernel taints: kernel.is_tainted.taint_warn: true
>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> 
> This change imposes little execution overhead and adds just a few
> lines of logging. The facts will be printed on normal igt-runner
> output. Here is a real example from our CI shwoing
> hotreplug-lateclose changing the DRM card number and tainting the
> kernel on the abort path:
> 
>  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
>  [245.383596] Starting subtest: hotreplug-lateclose
>  [249.843361] Aborting: Lockdep not active
>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
>  [249.859075] Closing watchdogs

<cut>

Regardless implementation - I wondered a bit about igt_runner and using
it by the others - instead of turning on gathering the facts from the
default I would add separate option to enable it. I see -f/--facts would
appropriate. This would allow to enable/disable it from CI perspective
if we would notice some problems - instead reverting the code we can
just disable it from CI perspective.

--
Zbigniew
