Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E75D10E094
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 14:44:00 +0000 (UTC)
Message-ID: <75df0ee9-880b-3544-27a1-50d5ce79d130@intel.com>
Date: Tue, 29 Nov 2022 20:13:23 +0530
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221123085441.2821638-1-anshuman.gupta@intel.com>
 <20221123085441.2821638-3-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20221123085441.2821638-3-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/5] lib/igt_pci: Add PCIe slot cap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

With a comment this is
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
On 23-11-2022 14:24, Anshuman Gupta wrote:
> Adding PCIe slot cap register offset and Power Controller Present
> bit mask macros.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   lib/igt_pci.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 68afd2dacb..5c2863d657 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -21,6 +21,9 @@ enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
>   };
>   
> +#define PCI_SLOT_CAP_OFFSET 0x14  /* PCIe specs chapter 7.8.9 */
I think lets avoid adding comment about chapter number. Chapter number 
can change as specs keep updating.

Regards,
Badal
> +#define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
> +
>   int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
>   			   int start_offset);
>   
