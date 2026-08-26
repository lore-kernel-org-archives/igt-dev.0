Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C8C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 13:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB1510ED08;
	Wed, 26 Aug 2026 13:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nknDWNAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1522410ED08
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751198; x=1819287198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jjLc9M47j2vtMdK1TtSzgtFevUPKmkeJ0KnU3FqBAms=;
 b=nknDWNAGC6PqEvYbG0D5WpS8F26zhzADSOCdHe4QKJ6XTZbvhQpbSvWh
 bQGWElk+uY09newXAdKI0BbZkp9TS//iR/vfd28rRmPa9sukypJ+RN+SR
 O9MYA4511V2plcE80E6ONufdUwT7Hjq6GJyQlKFrDcLkAjAsg1PUuSuIt
 YDlA5JSoY+ITMT8QJWvr3SmHkw8/QZXswzgL2itEQf9wSmG0MM+9x7py2
 jSzyaKECfgYRzFNRceQycVENv2X6oXKEQq7kvNBrRD1IqE26POe4jYRbo
 TbyTbcNl8EJZ7WI4Ra542GYoHJsmHjvv96/HiVH6NEkbR3vy+n2r4NC77 Q==;
X-CSE-ConnectionGUID: n+taeXzrTa6pCCEFC/5rCg==
X-CSE-MsgGUID: epLJan39R3uhmoxK9F37mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="105609545"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105609545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:33:17 -0700
X-CSE-ConnectionGUID: MeVuofA0QmyDbLRT/jSkDg==
X-CSE-MsgGUID: mg7Lu7ZKR0qzmJJG9OWhsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261440872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 06:33:15 -0700
Date: Wed, 26 Aug 2026 15:33:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/intel/hwmon: Add fan control test coverage
Message-ID: <20260826133301.2podzfb2r7wtjr6o@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
References: <20260730170752.3750843-1-karthik.poosa@intel.com>
 <20260730170752.3750843-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730170752.3750843-2-karthik.poosa@intel.com>
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

Hi Karthik,
On 2026-07-30 at 22:37:52 +0530, Karthik Poosa wrote:

this is not a review, only few nits, first about prefix, please
use full test name intel_hwmon and make it a little shorter:

[PATCH i-g-t 1/1] tests/intel/intel_hwmon: Add fan control subtests

> Introduce a comprehensive set of fan-control hwmon tests, including:
> 
> Validate pwm_enable modes (full-speed, manual, and automatic control).
> Program and verify user-defined fan curves with point-by-point and
> readback checks.
> Negative test coverage for invalid PWM values and fan-curve configuration
> writes.
> Suspend/resume validation of both user-defined and default fan tables
> across freeze, mem, and disk power states.
> 
> Assisted-by: Copilot:GPT-5.3-Codex
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/intel_hwmon.c | 523 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 522 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index f185c1ca3..1ef69c983 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -4,7 +4,10 @@
>   */
>  
>  #include <dirent.h>
> +#include <errno.h>
> +#include <stdlib.h>
>  #include <sys/stat.h>
> +#include <unistd.h>

Add newline here.



Regards,
Kamil

>  #include "igt.h"
>  #include "igt_hwmon.h"
>  #include "igt_sysfs.h"
> @@ -22,10 +25,492 @@
>   *
>   * SUBTEST: hwmon-write
>   * Description: Verify writable hwmon attributes
> + *
> + * SUBTEST: fan-pwm-enable-modes
> + * Description: Verify pwmN_enable mode transitions and full-speed behavior
> + *
> + * SUBTEST: fan-curve-setup
> + * Description: Verify fan curve point programming and readback in manual mode
> + *
> + * SUBTEST: fan-negative-tests
> + * Description: Verify invalid fan-control writes are rejected
> + *
> + * SUBTEST: fan-suspend-resume-with-user-table-%s
> + * Description: Verify programmed user fan table persists across %arg[1] suspend/resume
> + *
> + * SUBTEST: fan-suspend-resume-without-user-table-%s
> + * Description: Verify stock table mode remains active across %arg[1] suspend/resume
> + *
> + * arg[1]:
> + *
> + * @freeze: freeze
> + * @mem: mem
> + * @disk: disk
>   */
>  
[cut]
