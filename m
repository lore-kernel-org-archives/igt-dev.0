Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D6C021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 06:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B220910E8D4;
	Thu, 20 Feb 2025 06:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qm7AYDMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1D10E8D4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 06:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740033607; x=1771569607;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=TWePDpJCIM4wZ7ltYmngOyhfa4wmOFwJnW8Nawe123Y=;
 b=Qm7AYDMC7I9uG4tI+nTQPagbJPr5PhamAdo3k4rig1xhj5JfHA9ooglJ
 Rfyu0SjjrtlTcP4kyWmLcdO9ety9cFoQWAxW+e7+WUx0wcmM3txH2dF5Q
 Dpm8zaefi7C20j15/G/yBe8K0W4p5itNEesTC4Poe4EO8tLZPhyLbCFcS
 xrfpKpUTkpuxJZXELMjYRRtGbrWS6BXsR6jjqL7higPTp/eO9S7EDHV3O
 8r6wTZ5RPmdU8TY91WYibY0tgZ3JhxCKKokyaDOsUPSYjQMgi0DnFzkjd
 +szkHQfETDTa+40G+QfV7jv4yTWrpZB3+a+NvbghXDUkVb0tmvs1ndyNK A==;
X-CSE-ConnectionGUID: hTUo6kPLTCqi2M6VVMxO8A==
X-CSE-MsgGUID: OWfB7cpRSjWAkNaWGhrSQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51440648"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208,217";a="51440648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 22:40:06 -0800
X-CSE-ConnectionGUID: dRvjuswoQZi045+GD69evA==
X-CSE-MsgGUID: QCC0IxV4SPWCJE6EdaYt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
 d="scan'208,217";a="114898674"
Received: from rgollavi-mobl.gar.corp.intel.com (HELO [10.247.180.156])
 ([10.247.180.156])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 22:40:04 -0800
Content-Type: multipart/alternative;
 boundary="------------JVuHCKbszyXL9ePuBync2I0C"
Message-ID: <ad0827c1-2345-4b21-a89b-2d21d11dfb90@intel.com>
Date: Thu, 20 Feb 2025 12:10:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/4] add test to validate uhbr/non-uhbr over sst/mst
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 arun.r.murthy@intel.com, jeevan.b@intel.com
References: <20250218150121.2132934-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250218150121.2132934-1-kunal1.joshi@intel.com>
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

This is a multi-part message in MIME format.
--------------JVuHCKbszyXL9ePuBync2I0C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks for the reviews Jeevan and Arun,
Failures reported aren't related to below series.
IGT - Patchwork

<https://patchwork.freedesktop.org/series/143039/>Patch series is merged.

Thanks and Regards
Kunal Joshi

On 18-02-2025 20:31, Kunal Joshi wrote:
> Add new test kms_dp_link_training to validate both
> UHBR and non-UHBR link rates over SST and MST configurations.
> Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
> to check if the link rates match the expected UHBR or NON-UHBR capability
> and whether the outputs are MST or SST.
>
> Kunal Joshi (4):
>    tests/intel/kms_joiner: refactor set_all_master_pipes_for_platform
>    tests/intel/kms_joiner_helper: add helper for joiner-related functions
>    lib/igt_kms: add function to set link params
>    tests/intel/kms_dp_link_training: add tests for UHBR/NON-UHBR over
>      SST/MST
>
>   lib/igt_kms.c                      |  33 +++
>   lib/igt_kms.h                      |   2 +
>   tests/intel/kms_dp_link_training.c | 384 +++++++++++++++++++++++++++++
>   tests/intel/kms_joiner.c           |  15 +-
>   tests/intel/kms_joiner_helper.c    | 181 ++++++++++++++
>   tests/intel/kms_joiner_helper.h    |  20 ++
>   tests/meson.build                  |   5 +
>   7 files changed, 627 insertions(+), 13 deletions(-)
>   create mode 100644 tests/intel/kms_dp_link_training.c
>   create mode 100644 tests/intel/kms_joiner_helper.c
>   create mode 100644 tests/intel/kms_joiner_helper.h
>
--------------JVuHCKbszyXL9ePuBync2I0C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,<br>
      <br>
      Thanks for the reviews Jeevan and Arun,<br>
      Failures reported aren't related to below series.<br>
      <a href="https://patchwork.freedesktop.org/series/143039/">IGT -
        Patchwork<br>
        <br>
      </a>Patch series is merged.<br>
      <br>
      Thanks and Regards<br>
      Kunal Joshi<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 18-02-2025 20:31, Kunal Joshi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250218150121.2132934-1-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">Add new test kms_dp_link_training to validate both
UHBR and non-UHBR link rates over SST and MST configurations.
Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
to check if the link rates match the expected UHBR or NON-UHBR capability
and whether the outputs are MST or SST.

Kunal Joshi (4):
  tests/intel/kms_joiner: refactor set_all_master_pipes_for_platform
  tests/intel/kms_joiner_helper: add helper for joiner-related functions
  lib/igt_kms: add function to set link params
  tests/intel/kms_dp_link_training: add tests for UHBR/NON-UHBR over
    SST/MST

 lib/igt_kms.c                      |  33 +++
 lib/igt_kms.h                      |   2 +
 tests/intel/kms_dp_link_training.c | 384 +++++++++++++++++++++++++++++
 tests/intel/kms_joiner.c           |  15 +-
 tests/intel/kms_joiner_helper.c    | 181 ++++++++++++++
 tests/intel/kms_joiner_helper.h    |  20 ++
 tests/meson.build                  |   5 +
 7 files changed, 627 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/kms_dp_link_training.c
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h

</pre>
    </blockquote>
  </body>
</html>

--------------JVuHCKbszyXL9ePuBync2I0C--
