Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Date: Tue, 22 Feb 2022 18:59:42 +0100
Message-ID: <13380668.RDIVbhacDa@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <c94e00ee-967f-8dd8-8d00-e67a860c1cd9@intel.com>
References: <20220222151100.83283-1-janusz.krzysztofik@linux.intel.com>
 <c94e00ee-967f-8dd8-8d00-e67a860c1cd9@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_device: Add support for
 accessing unbound VF PCI devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Micha=C5=82,

Thanks for review.

On Tuesday, 22 February 2022 17:16:54 CET Michal Wajdeczko wrote:
>=20
> On 22.02.2022 16:11, Janusz Krzysztofik wrote:
> > The library provides igt_device_get_pci_device() function that allows to
> > get access to a PCI device from an open DRM device file descriptor.  It
> > can be used on VF devices as long as a DRM driver is bound to them.
> > However, SR-IOV tests may want to exercise VF PCI devices created by a =
PF
> > without binding any DRM driver to them.
> >=20
> > While keeping the API of igt_device_get_pci_device() untouched, extend =
API
> > of its underlying helper __igt_device_get_pci_device() with an extra
> > argument for specifying VF ID of the requested PCI device and expose th=
is
> > function as public.
> >=20
> > v2: refresh on top of IGT libpciaccess wrappers and drop previously add=
ed
> >     but no longer needed error unwind path and recommendations for users
> >     on calling pci_system_cleanup() after use (Chris),
> >   - fix incorrect validation of snprintf() result and misaligned
> >     formatting of igt_warn_on_f() arguments.
> > v3: follow VF numbering convention of Linux PCI ABI (Chris),
> >   - fix and improve DOC.
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Reviewed-by: Chris Wilson <chris.p.wilson@intel.com> # v2
> > ---
> >  lib/igt_device.c | 33 +++++++++++++++++++++++++++------
> >  lib/igt_device.h |  1 +
> >  2 files changed, 28 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/lib/igt_device.c b/lib/igt_device.c
> > index c50bf4a1f7..46b7dbc490 100644
> > --- a/lib/igt_device.c
> > +++ b/lib/igt_device.c
> > @@ -149,9 +149,9 @@ struct igt_pci_addr {
> >  	unsigned int function;
> >  };
> > =20
> > -static int igt_device_get_pci_addr(int fd, struct igt_pci_addr *pci)
> > +static int igt_device_get_pci_addr(int fd, int vf_id, struct igt_pci_a=
ddr *pci)
> >  {
> > -	char path[IGT_DEV_PATH_LEN];
> > +	char link[20], path[IGT_DEV_PATH_LEN];
> >  	char *buf;
> >  	int sysfs;
> >  	int len;
> > @@ -159,11 +159,21 @@ static int igt_device_get_pci_addr(int fd, struct=
 igt_pci_addr *pci)
> >  	if (!igt_device_is_pci(fd))
> >  		return -ENODEV;
> > =20
> > +	if (vf_id < 0)
> > +		len =3D snprintf(link, sizeof(link), "device");
> > +	else
> > +		len =3D snprintf(link, sizeof(link), "device/virtfn%u", vf_id);
> > +	if (igt_warn_on_f(len >=3D sizeof(link),
> > +			  "IGT bug: insufficient buffer space for rendering PCI device link=
 name\n"))
> > +		return -ENOSPC;
> > +	else if (igt_debug_on_f(len < 0, "unexpected failure from snprintf()\=
n"))
> > +		return len;
> > +
> >  	sysfs =3D igt_sysfs_open(fd);
> >  	if (sysfs =3D=3D -1)
> >  		return -ENOENT;
> > =20
> > -	len =3D readlinkat(sysfs, "device", path, sizeof(path) - 1);
> > +	len =3D readlinkat(sysfs, link, path, sizeof(path) - 1);
> >  	close(sysfs);
> >  	if (len =3D=3D -1)
> >  		return -ENOENT;
> > @@ -183,12 +193,23 @@ static int igt_device_get_pci_addr(int fd, struct=
 igt_pci_addr *pci)
> >  	return 0;
> >  }
> > =20
> > -static struct pci_device *__igt_device_get_pci_device(int fd)
> > +/**
> > + * __igt_device_get_pci_device:
> > + *
> > + * @fd: DRM device file descriptor
> > + * @vf_id: PCI virtual function number or -1 if native or PF itself
>=20
> this param seems to be used here rather as 0-based "index" that
> subsystem uses to list virtfn entries, while real VF "numbers" are
> 1-based, see PCI spec which says:
>=20
> "VFs are numbered starting with 1 so the first VF associated with PF M
> is VF M,1."

OK, since v2 using 1-based VF numbering has been positively reviewed by Chr=
is
despite his comment on inconsistency with Linux PCI ABI then let's consider
the 0-based VF numbering used in that ABI as non-standard and merge v2 of t=
his=20
patch with some DOC improvements from v3 if there are no more comments.

Thanks,
Janusz

>=20
> maybe we should update the wording to minimize any confusions?
>=20
> Michal
>=20
> > + *
> > + * Looks up a PCI interface of a DRM device or a VF PCI device of the =
DRM PF using libpciaccess.
> > + *
> > + * Returns:
> > + * The pci_device, NULL on any failures.
> > + */
> > +struct pci_device *__igt_device_get_pci_device(int fd, int vf_id)
> >  {
> >  	struct igt_pci_addr pci_addr;
> >  	struct pci_device *pci_dev;
> > =20
> > -	if (igt_device_get_pci_addr(fd, &pci_addr)) {
> > +	if (igt_device_get_pci_addr(fd, vf_id, &pci_addr)) {
> >  		igt_warn("Unable to find device PCI address\n");
> >  		return NULL;
> >  	}
> > @@ -231,7 +252,7 @@ struct pci_device *igt_device_get_pci_device(int fd)
> >  {
> >  	struct pci_device *pci_dev;
> > =20
> > -	pci_dev =3D __igt_device_get_pci_device(fd);
> > +	pci_dev =3D __igt_device_get_pci_device(fd, -1);
> >  	igt_require(pci_dev);
> > =20
> >  	return pci_dev;
> > diff --git a/lib/igt_device.h b/lib/igt_device.h
> > index 278ba7a9b3..00da853e71 100644
> > --- a/lib/igt_device.h
> > +++ b/lib/igt_device.h
> > @@ -33,5 +33,6 @@ void igt_device_drop_master(int fd);
> > =20
> >  int igt_device_get_card_index(int fd);
> >  struct pci_device *igt_device_get_pci_device(int fd);
> > +struct pci_device *__igt_device_get_pci_device(int fd, int vf_id);
> > =20
> >  #endif /* __IGT_DEVICE_H__ */
>=20



