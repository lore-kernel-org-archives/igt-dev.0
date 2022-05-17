Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8F71120C5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 10:28:59 +0000 (UTC)
Date: Tue, 17 May 2022 12:28:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoN44i2e83finDMl@intel.intel>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
 <20220517072803.186989-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517072803.186989-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 6/9] lib/igt_kmod: make it less
 pedantic with audio driver removal
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

On Tue, May 17, 2022 at 09:28:00AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Current Linux Kernel don't report if the audio driver binds
> into the DRM driver. As this is CPU specific, allow audio
> driver unload fail without skipping the IGT tests on legacy
> Kernels, as this may not be mandatory.
> 
> On new kernels where lsmod will properly display the dependency
> between the audio and DRM drivers, skip the core hotunplug
> test if it fails to unload the audio driver, as this is
> unrelated to the DRM driver - and it could simply because there
> are some userspace code using the audio device while the IGT
> test is running.
> 
> Reviewed-by Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
