Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14D10E7B6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 12:18:57 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 25 Jan 2023 12:18:51 +0000
Message-ID: <CY5PR11MB6211EED8136BF4C659ADC4A095CE9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230109120205.2259410-1-anshuman.gupta@intel.com>
 <20230109120205.2259410-3-anshuman.gupta@intel.com>
 <9e10dbb2-eaf3-6bbe-7461-b34fe818fbd9@intel.com>
 <CY5PR11MB6211BFC6A04AFB32F7F528C495FF9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <87h6wyay7p.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87h6wyay7p.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/device_reset: Add warm_reset
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Wednesday, January 11, 2023 2:45 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Tauro, Riana <riana.tauro@intel.com>; igt-dev@lists.freedesktop.org;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [PATCH i-g-t 2/2] tests/device_reset: Add warm_reset test
>=20
> On Tue, 10 Jan 2023 06:14:37 -0800, Gupta, Anshuman wrote:
> > > On 1/9/2023 5:32 PM, Anshuman Gupta wrote:
> > > > +bool igt_pci_bridge_warm_reset(struct pci_device *dev) {
> > > > +	uint8_t header_type;
> > > > +	uint16_t bridge_ctl;
> > > > +
> > > > +	if (pci_device_cfg_read_u8(dev, &header_type, PCI_HEADER_TYPE))
> > > > +		return false;
> > > > +
> > > > +	igt_assert_f((header_type & 0x7f) =3D=3D 1, "PCI device is not a
> > > > +Bridge\n");
> > > > +
> > > > +	if (pci_device_cfg_read_u16(dev, &bridge_ctl,
> > > PCI_TYPE_1_HEADER_BRIDGE_CTL))
> > > > +		return false;
> > > > +
> > > > +	bridge_ctl |=3D  PCI_TYPE_1_SEC_BUS_RESET;
> > > > +
> > > > +	if (pci_device_cfg_write_u16(dev, bridge_ctl,
> > > PCI_TYPE_1_HEADER_BRIDGE_CTL))
> > > > +		return false;
> > > > +
> > >
> > >
> > > The pci code adds a minimum reset duration (Trst) delay after setting=
 the bit.
> > > Do we need to add the same here?
> > > https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci.c#L50
> > > 45
> > Thanks for review.
> > Will add delay of 2ms to keep parity with the kernel.
> > >
> > > Is restoring sequence not necessary?
> > I think driver has the responsibility of restoring.
> > I am not sure about if IGT needs to restore it.
> > The test itself has sequence of unbind and bind, so driver should resto=
re it.
>=20
> Hmm, not too sure about this stuff but looks like we should follow the en=
tire
> sequence in the kernel function pci_reset_secondary_bus()? Thanks Riana f=
or
> pointing out.
I was looking to the kernel source code , it seems by using /sys/bus/pvi/de=
vices/$bdf/reset and /sys/bus/pvi/devices/$bdf/reset_method
sysfs we can trigger bus reset i.e warm reset. So we don't need to reinvent=
 the wheel in IGT. So dropping the patch series.
Br,
Anshuman Gupta.=20
>=20
> > > > @@ -417,6 +421,7 @@ igt_main
> > > >			set_device_filter(dev_path);
> > > >
> > > >			igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
> > > > +		dev.root =3D igt_device_get_pci_root_port(dev.fds.dev);
>=20
> Also is SBR done on the root port or the upstream bridge, in case there i=
s a
> bridge in the middle (between the root port and the device/bus)? In which=
 case
> this should be pci_device_get_parent_bridge()?
>=20
> Thanks.
> --
> Ashutosh
