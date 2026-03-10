Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A3EB1043
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9B10E232;
	Tue, 10 Mar 2026 10:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRe12nDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56110E232
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773138599; x=1804674599;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tkQXZKaatPHu1JUw7BYjoru81sfo1wTPnCkTgirRuis=;
 b=GRe12nDTxBHngMdxlbjDtECqKJtE5Zk0XshOO7tCTKW+wwWujWS9Ed1O
 nGGcj/Rh8hFOoKykYWwbtCbz7UoXr6a2jL2kU5OHncVJ7uNi2euhKBhyJ
 8Tw/ZXXb1sgbpy+nc/srSzh8XCa5M9G0EW3Nwo3EvODb8CIynZaHZ3idO
 3MoLjp/cO1mRly5Mdyb1susTrlh+lOOAmDz+tj8DkXUaP9MUkeX7ri9di
 igNOIG3+MGt1Q2FJGFNXFO5QW4USJ/85uK70ifUTDl3ki3ZCHhycCKQMA
 SumBW7lsNeqazxZMsOF4GY6JlmBjQ6A5UKxSYq4a0A8BnS5wA9Ez2wVnz Q==;
X-CSE-ConnectionGUID: 7Yg2KdNaQIW3MqqP0xTlMA==
X-CSE-MsgGUID: KTpMMlx1TqmV7anf8epRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84509455"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84509455"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:29:59 -0700
X-CSE-ConnectionGUID: +OcnDcfxTJiC/T5fQHep1A==
X-CSE-MsgGUID: VOXrHCSCShiuywJe6BAm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219311551"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:29:58 -0700
Message-ID: <3ab4c909-a987-4768-ae95-75a8f3b208f6@linux.intel.com>
Date: Tue, 10 Mar 2026 11:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 03/10] tools/vmtb: Fix VM snapshot query handling
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260224075027.2409675-1-adam.miszczak@linux.intel.com>
 <20260224075027.2409675-4-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260224075027.2409675-4-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2/24/2026 8:50 AM, Adam Miszczak wrote:
> QMP command 'query-named-block-nodes' is used to select a block device
> for saving VM snapshot (QMP 'snapshot-save').
>
> Add polling for the command's return message in QMP response queue.
> It sporadically happened that unsolicited QMP message like:
> [QMP RSP] <- {"timestamp": {...}, "event": "RTC_CHANGE" ...}
> was falsely taken as a response to previously submitted
> QMP 'query-named-block-nodes' command.
> Hence, no 'block device node' argument is passed to
> 'snapshot-load' command which leads to migration tests fail.
> Also, add a condition to check if a given block node
> is writable (not read-only).
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   .../machines/virtual/backends/qmp_monitor.py  | 25 ++++++++++---------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> index ef3c8aa1c..d364a5711 100644
> --- a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> +++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   import json
>   import logging
> @@ -123,17 +123,18 @@ class QmpMonitor():
>           ret: typing.Dict = {}
>   
>           qmp_msg = self.qmp_queue.get()
> -        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
> -        if 'return' in qmp_msg:
> -            ret = qmp_msg.get('return')
> -            for block in ret:
> -                if block.get('drv') == 'qcow2':
> -                    node_name = block.get('node-name')
> -                    # Get the most recent state snapshot from the snapshots list:
> -                    snapshots = block.get('image').get('snapshots')
> -                    if snapshots:
> -                        snapshot_tag = snapshots[-1].get('name')
> -                    break
> +        while 'return' not in qmp_msg:
> +            qmp_msg = self.qmp_queue.get()
> +
> +        ret = qmp_msg.get('return')
> +        for block in ret:
> +            if block.get('drv') == 'qcow2' and block.get('ro') is False:
> +                node_name = block.get('node-name')
> +                # Get the most recent state snapshot from the snapshots list:
> +                snapshots = block.get('image').get('snapshots')
> +                if snapshots:
> +                    snapshot_tag = snapshots[-1].get('name')
> +                break
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>   
>           return (node_name, snapshot_tag)
>   
