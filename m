Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073E1121DE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 17:09:15 +0000 (UTC)
Date: Wed, 11 May 2022 10:09:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20220511170913.rdw7pxl7mze7ylu2@ldmartin-desk2>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/6] lib/igt_kmod: improve audio
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
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 06, 2022 at 01:48:26PM +0200, Mauro Carvalho Chehab wrote:
>+int igt_audio_driver_unload(const char **who)
>+{
>+	const char *drm_driver = "i915";
>+	unsigned int num_mod, i, j;
>+	struct module_ref *mod;
>+	int pos = -1;
>+	int ret = 0;
>+
>+	/*
>+	 * On older Kernels, there's no way to check if the audio driver
>+	 * binds into the DRM one. So, always remove audio drivers that
>+	 * might be binding.
>+	 */
>+	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))

comparing specific kernel version is not very good practice as features
are moved from one kernel to the other, backported, etc.

if at all, we should test if something is present in the kernel. If we
can't, then we either add support for that if we can enough.
For IGT we can probably simply take the approach of landing this only
when the corresponding kernel support is merged.

What we could merge today is: always unload audio drivers.

Lucas De Marchi
