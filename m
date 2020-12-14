Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <7021dc5149a24438878f6540a0c4aed8@intel.com>
References: <20201212094354.3023502-1-chris@chris-wilson.co.uk>
 <7021dc5149a24438878f6540a0c4aed8@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 14 Dec 2020 20:48:40 +0000
Message-ID: <160797892093.13039.18269573801947438332@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] lib: Pass device fd to
 gem_mmappable_aperture_size()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chang, Yu bruce (2020-12-14 18:45:04)
> +/**
> + * gem_mappable_aperture_size:
> + *
> + * Feature test macro to query the kernel for the mappable gpu aperture size.
> + * This is the area available for GTT memory mappings.
> + *
> + * Returns: The mappable gtt address space size.
> + */
> +uint64_t gem_mappable_aperture_size(int fd)
> +{
> +       struct pci_device *pci_dev = igt_device_get_pci_device(fd);
> 
> Does it make sense to eliminate the function intel_get_pci_device() if not
> being used anymore? But it can be a separate patch.

It's still used by tools. The complication there is that we mostly
need to lookup the pci device without loading i915.ko. 
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
