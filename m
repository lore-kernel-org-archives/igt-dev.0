Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE1A10E2B0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 07:40:00 +0000 (UTC)
Message-ID: <57671714-bfca-7466-aac1-e0728ea32f21@intel.com>
Date: Wed, 11 Jan 2023 13:09:40 +0530
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20230109120205.2259410-1-anshuman.gupta@intel.com>
 <20230109120205.2259410-3-anshuman.gupta@intel.com>
 <9e10dbb2-eaf3-6bbe-7461-b34fe818fbd9@intel.com>
 <CY5PR11MB6211BFC6A04AFB32F7F528C495FF9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <87h6wyay7p.wl-ashutosh.dixit@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87h6wyay7p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 11-01-2023 02:44, Dixit, Ashutosh wrote:
> On Tue, 10 Jan 2023 06:14:37 -0800, Gupta, Anshuman wrote:
>>> On 1/9/2023 5:32 PM, Anshuman Gupta wrote:
>>>> +bool igt_pci_bridge_warm_reset(struct pci_device *dev) {
>>>> +	uint8_t header_type;
>>>> +	uint16_t bridge_ctl;
>>>> +
>>>> +	if (pci_device_cfg_read_u8(dev, &header_type, PCI_HEADER_TYPE))
>>>> +		return false;
>>>> +
>>>> +	igt_assert_f((header_type & 0x7f) == 1, "PCI device is not a
>>>> +Bridge\n");
>>>> +
>>>> +	if (pci_device_cfg_read_u16(dev, &bridge_ctl,
>>> PCI_TYPE_1_HEADER_BRIDGE_CTL))
>>>> +		return false;
>>>> +
>>>> +	bridge_ctl |=  PCI_TYPE_1_SEC_BUS_RESET;
>>>> +
>>>> +	if (pci_device_cfg_write_u16(dev, bridge_ctl,
>>> PCI_TYPE_1_HEADER_BRIDGE_CTL))
>>>> +		return false;
>>>> +
>>>
>>>
>>> The pci code adds a minimum reset duration (Trst) delay after setting the bit.
>>> Do we need to add the same here?
>>> https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci.c#L5045
>> Thanks for review.
>> Will add delay of 2ms to keep parity with the kernel.
>>>
>>> Is restoring sequence not necessary?
>> I think driver has the responsibility of restoring.
>> I am not sure about if IGT needs to restore it.
>> The test itself has sequence of unbind and bind, so driver should restore it.
> 
> Hmm, not too sure about this stuff but looks like we should follow the
> entire sequence in the kernel function pci_reset_secondary_bus()? Thanks
> Riana for pointing out.

Reset de-assert is missing here. Reset need to be de-asserted after 
asserting it.

Regards,
Badal
> 
>>>> @@ -417,6 +421,7 @@ igt_main
>>>> 			set_device_filter(dev_path);
>>>>
>>>> 			igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
>>>> +		dev.root = igt_device_get_pci_root_port(dev.fds.dev);
> 
> Also is SBR done on the root port or the upstream bridge, in case there is
> a bridge in the middle (between the root port and the device/bus)? In which
> case this should be pci_device_get_parent_bridge()?
> 
> Thanks.
> --
> Ashutosh
