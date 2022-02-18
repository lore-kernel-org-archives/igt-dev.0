Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Date: Fri, 18 Feb 2022 18:08:41 +0100
Message-ID: <22539233.6Emhk5qWAg@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <164520018148.26182.14140261608114027724@build.alporthouse.com>
References: <20220218151935.31688-1-janusz.krzysztofik@linux.intel.com>
 <164520018148.26182.14140261608114027724@build.alporthouse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device: Add support for
 accessing unbound VF PCI devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 =?utf-8?B?TWljaGHFgsKC?= Winiarski <michal.winiarski@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Friday, 18 February 2022 17:03:01 CET Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2022-02-18 15:19:35)
> > @@ -206,15 +229,19 @@ static struct pci_device *__igt_device_get_pci_device(int fd)
> >                 igt_warn("Couldn't find PCI device %04x:%02x:%02x:%02x\n",
> >                          pci_addr.domain, pci_addr.bus,
> >                          pci_addr.device, pci_addr.function);
> > -               return NULL;
> > +               goto cleanup;
> >         }
> >  
> >         if (pci_device_probe(pci_dev)) {
> >                 igt_warn("Couldn't probe PCI device\n");
> > -               return NULL;
> > +               goto cleanup;
> >         }
> >  
> >         return pci_dev;
> > +
> > +cleanup:
> > +       pci_system_cleanup();
> 
> This is a global cleanup of libpciaccess iirc, such that if anyone else
> was using the library they would be affected.

Right, but shouldn't we also drop pci_system_init() from here and request 
users to manage initialization and cleanup of that data themselves?  On each 
call pci_system_init() abandons existing data and overwrites a pointer to it 
with that of newly allocated memory, then tests calling 
igt_device_get_pci_device() multiple times are going to suffer from 
significant memory leaking.

Thanks,
Janusz

> 
> > +       return NULL;
> >  }
> 



