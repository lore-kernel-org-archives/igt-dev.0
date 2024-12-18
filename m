Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D3DE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0810E043;
	Wed, 18 Dec 2024 22:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M05JabLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DF110E043
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559472; x=1766095472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Gt3PNsH7Fgf8qouMM/tOzRt0MQeuSDIBf0QSMkNSXqo=;
 b=M05JabLVImdY82SyqNU7MWyns3kNkwECrEmyLlm73bgjK/3Xp82MBGwS
 +Lc1fqFL4GncVmHMpVyCggySlIydF89aswiTovoZEjKhpjscbt9v4LSwm
 HKx0oTo149iXz2sIF88g83kZqHZGOLMXgiUXJeYlytegzc0ViRtnUCoFb
 4onBaNZ2f+7H4bd9KO9EXS5ePTigzMEA5Xs/ei/m9Vsx4/c7WS3xujOOS
 8GMKsZTpXgBUGnQZM956/kCnu89gaNyMkloyC7B9gtm9Pung5JhNUKfSR
 p2kgIdyON0ehD3enY5OvzLOX0acFFObHDu3HCnlt4yVSDg+w7R5+ulgYm w==;
X-CSE-ConnectionGUID: s8WeUreUTNymAZ5RvdNi1A==
X-CSE-MsgGUID: /0D8eL27TcuWQxvuuaHmJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38838710"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38838710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:04:31 -0800
X-CSE-ConnectionGUID: 93IZRxuwSzqbhV7oIWq9Kg==
X-CSE-MsgGUID: +9iDUQDeSNa2+MCjelvBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="97821811"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:04:30 -0800
Date: Wed, 18 Dec 2024 16:04:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/4] Device scan fixes
Message-ID: <3izfilgj2eycb4fvdudz62wxq6fwarehczg5z75qpbo7l5xxvk@zdh4xgda2npo>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <4f4cb4c0-317c-4b5a-a37a-c30dd1be57c9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f4cb4c0-317c-4b5a-a37a-c30dd1be57c9@linux.intel.com>
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

On Wed, Dec 18, 2024 at 09:16:48AM +0100, Peter Senna Tschudin wrote:
>
>
>On 18.12.2024 06:13, Lucas De Marchi wrote:
>> This started with the goal of fixing xe_wedged (besides the fix to the
>> kernel that is in flight), however the issue of device "disappearing
>> from bus" looks similar to several other issues we occasionally have -
>> it may be the same issue. Try to fix it by forcing scans.
>
>Is the hypothesis that while an IGT test is running something may
>break the association between GPU and device node? I am asking because
>the drm device is always closed after a test ends.

it depends what the test is doing, if the fd is closed etc... note that
multiple subtests are executed without runing a new program. Even some
under-the-hood behavior that we have with e.g. i915 (it keeps an fd open
a dup fd open) may change the behavior if you load/unload or
bind/unbind. Example:

RPL (00:02.0) + BMG (03:00.0)
	# ./build/tools/lsgpu                                   
	card1                    Intel Battlemage (Gen20)          drm:/dev/dri/card1       
	└─renderD129                                               drm:/dev/dri/renderD129  
	card0                    Intel Raptorlake_s (Gen12)        drm:/dev/dri/card0       
	└─renderD128                                               drm:/dev/dri/renderD128  

	# ls -l /dev/dri/by-path/                           
	total 0                                                                         
	lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:00:02.0-card -> ../card0
	lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:00:02.0-render -> ../renderD128
	lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:03:00.0-card -> ../card1
	lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:03:00.0-render -> ../renderD129 

Rebind RPL:
	# echo 0000:00:02.0 | sudo tee /sys/bus/pci/drivers/xe/unbind
	# echo 0000:00:02.0 | sudo tee /sys/bus/pci/drivers/xe/bind

	# ls -l /dev/dri/by-path/
	total 0
	lrwxrwxrwx 1 root root  8 Dec 18 19:40 pci-0000:00:02.0-card -> ../card0
	lrwxrwxrwx 1 root root 13 Dec 18 19:40 pci-0000:00:02.0-render -> ../renderD128
	lrwxrwxrwx 1 root root  8 Dec 18 19:39 pci-0000:03:00.0-card -> ../card1
	lrwxrwxrwx 1 root root 13 Dec 18 19:39 pci-0000:03:00.0-render -> ../renderD129

Great, nothing break, right?

Rebind both in a different order (shouldn't happen if both cards are
backed by the same module, but can perfectly happen in a i915 + xe
scenario as the modules may be ready in different order):

	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/unbind 
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind 
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind 
	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind 
	# ls -l /dev/dri/by-path/
	total 0
	lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:00:02.0-card -> ../card1
	lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:00:02.0-render -> ../renderD129
	lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:03:00.0-card -> ../card0
	lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:03:00.0-render -> ../renderD128

Simulate one thing that may happen in igt: but leak an fd:

	# exec 3<>  /dev/dri/by-path/pci-0000:03:00.0-card
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind 
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind 
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
	# ls -l /dev/dri/by-path/
	total 0
	lrwxrwxrwx 1 root root  8 Dec 18 19:41 pci-0000:00:02.0-card -> ../card1
	lrwxrwxrwx 1 root root 13 Dec 18 19:41 pci-0000:00:02.0-render -> ../renderD129
	lrwxrwxrwx 1 root root  8 Dec 18 19:42 pci-0000:03:00.0-card -> ../card2
	lrwxrwxrwx 1 root root 13 Dec 18 19:42 pci-0000:03:00.0-render -> ../renderD130

So... because we had and fd open, now it became card2 rather than 1.
Also note that simply calling close(fd) in igt doesn't work as the
cached fds will throw igt through the wrong path.

So.... instead of adding bandaid everywhere in igt, I think we should
fix the design to stop caching the wrong thing. IMO a first step would
be "disable the cache and see how much it impacts".

Lucas De Marchi

>
>I tested this by printing the value of _opened_fds_count from
>lib/drmtest.c before each test, and the value is always 0.
>
>_opened_fds_count being zero means that the cache is empty, right? So
>if the cache is empty before each test starts, under which conditions
>can the potential problem manifest?
