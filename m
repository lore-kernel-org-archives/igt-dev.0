Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8B210EBDD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 12:31:46 +0000 (UTC)
Date: Mon, 16 May 2022 14:31:38 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoJEKqVBQHT0WCHP@intel.intel>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506114829.2288273-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/6] tests/core_hotunplug: properly
 finish processes using audio devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Fri, May 06, 2022 at 01:48:24PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Before unloading or unbinding an audio driver, all processes
> that are using it must be terminated. The current logic seeks
> only for alsactl, but ignore other processes, including
> pulseaudio.
> 
> Make the logic more general, extending it to any processes that
> could have an open device under /dev/snd.
> 
> It should be noticed that some distros like Fedora and openSUSE
> are now migrating from pulseaudio into pipewire-pulse. Right
> now, there's no standard distribution-agnostic way to request
> pipewire-pulse to stop using audio devices, but there's a new
> patch upstream that will make things easier:
> 
> 	https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/6ad6300ec657c88322a8cd6f3548261d3dc05359
> 
> Which should be available for pipewire-pulse versions 0.3.50 and
> upper.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
