Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F59310F284
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 09:56:14 +0000 (UTC)
Date: Wed, 18 May 2022 11:56:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoTCuJXQv28HQ8r5@intel.intel>
References: <20220517124447.211014-1-mauro.chehab@linux.intel.com>
 <20220517124447.211014-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517124447.211014-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 3/9] lib/igt_kmod: improve audio
 unbind logic
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
Cc: igt-dev@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Tue, May 17, 2022 at 02:44:41PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The dependencies between audio and DRM drivers are not trivial.
> 
> On several CPUs, the logic inside snd-hda-intel, for instance, tries to
> hook into i915 driver, via drm_audio_component logic. That also happens
> when there's no runtime PM.
> 
> When the audio driver is bound into i915, removing or unbinding i915
> without first removing the audio driver produce Kernel errors.
> 
> So, the audio driver(s) should be removed first, and this can only
> happen after pulseaudio, pipewire-pulse, audioctl and any other
> userspace program stops using it.
> 
> This is more prune to failures. So, the best is to only try to stop
> the audio driver when it is known to have dependencies on the video
> driver.
> 
> Before an upcoming Kernel patch, there's no way to detect if the
> audio driver required a DRM one. So, the safest way is to always
> remove the audio drivers that are known to cause issues.
> 
> After the new Kernel, the logic can be more selective, only removing
> the audio driver if /proc/modules shows dependencies with the DRM
> driver.
> 
> Reviewed-by Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
