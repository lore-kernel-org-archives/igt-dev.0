Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6E5C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B633112616;
	Fri, 29 Mar 2024 09:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuLgVvcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0827611261A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711704981; x=1743240981;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Nrlxgy7cSrqowWI4/h2L9Rby3QW8uDw5wYt5KXAe+tA=;
 b=GuLgVvcLqjUxpyTTaYvTPEhThRRIIkWEVnTpNmqWCfpq3Vqu5GS0lNVy
 xc2UNLFTymkvfBwrLNiN0YbsNoAL0LrLXLSneVdGAP1nWWjcwVFBwV7wR
 26cW3e/wVtM1eU3rD8vm8zj2h0XZSPACMZ2MYr0y9T20YYJc4e4LUKmAI
 ZKzAY/WBV8yN2GBvji0Inc+LHrVnGYyWCWOu21afgIP8eEyTGqIfUnCnc
 4/b1NnQoMMJYa0hJsOIezBV/ckRqBp5ryglrsETMyiYzoUeYxNoORE6w8
 diyU+q/IljlohMxCMRAgrrkp8J4WwdeISnbk1Zc61l9z2olNTJAxwPGJp A==;
X-CSE-ConnectionGUID: DFi875quTxeiTk6f8KqjPg==
X-CSE-MsgGUID: VF/LGFfuScqMqXOOi0GA6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7082293"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208,217";a="7082293"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208,217";a="16961482"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 02:36:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 02:36:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 02:36:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 02:36:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 02:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1K6yIm8kzttjtMIyWGt0MNlGTHofpBDvQ+YL+Yk5oNUqVFztXcX8Y9Asnhljzvg66ITFG8BvY9hv6ydBcSe/cAVvlj0bJqZNuMJdmOX8qMYPXWQv8J3nFF0nE8Yv6jTdvimKOaaNxZT3B6CZxJ1FIYu328Sb4/EWpV6tHO8x9dx5GkrlI3r7dgirgAGaQo98giECyc4wMxcV/sTgl+GsPdsuiNO7oAIjslkrxLgxuqMWKkuEBCuLMIA9HIK8VA5Y+4xbESkEZHhr6+SpgSxRULmlbdiB4qnLjFGeJLDDz1HqCo+lBZpvlG4Fx+8iZ2zCWtZI5QQGnI82mp3D4N03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItSSb76K6l5AYRY86btW1NeWxfrJWmfkjGL7U5G9zMY=;
 b=oB+21tRQaQnwE/ZwDuDyEshIhb436tWt3nIDCKovgxLZD+mTHE/Dx+5r83LnfWSlZHH1VCQdPxv/eaQfW8SC1orYoDwX2WzIJf6GIhNFe91GcPQiZgWlHR/jdQS+XO/ZdJlpyya30Nxwg141r9V9OJ3T+vcftOMYwZWb9VB+rfMNn79WGW1LyQaI1w1J4J/f/I6g7Xf1WGLkZaNmM9ouk+zr8scnAeLoYSphlc5iwVIIeLIU9tWJWp72oHAH6TmdWI6Y/NiQRzDGeJCISDPPZH6D3zOLr56uGSpERH+YiUUAuy+3IWn+zpSh+9MN6oyzCVNuiAIzLAsTiexbZfJqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 09:36:17 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 09:36:17 +0000
Content-Type: multipart/alternative;
 boundary="------------HKUC0KLOI05BqL9vnc44OvRv"
Message-ID: <f21e5837-b74d-4e36-818f-6f61c2d43d60@intel.com>
Date: Fri, 29 Mar 2024 10:36:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,1/2] lib/intel_mmio: Map the whole BAR0 for gen12+
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240326100921.3539141-2-piotr.piorkowski@intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240326100921.3539141-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MI0P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SA0PR11MB4559:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/X9L0Kg8aAuu03x1FPy6bCh7Q26IrwSfx0z1Ylc0iNubHuaKSMPcjyE70hDLl4Me+zNaqVv7lxGcE6h8RrqWTxPhIiITHdx9RdZpWRRAvAKpX5+6YdzH7nf41LntV80fT4EsdIzBiGWOSHWYfzleWL3F8AxhcfKkOAwftYGM7jahLNrW5TnWTpJrstFVu8X3lA6H//WuMHBWYcs3KV0ZXb4gksD/fVq6Z8IlxDzTclQxwllrEL6/wF8oGfDjQRjaDwOhHeQUdIi0OvOEDGqTfOy7XDLl5ftkGkm6F719sGe1O/bJbQP+OlIPxEbKtLUjkd3Ovd0Wa/+zAfBRUJ+RN6wCEoX5rEjcjBhstb9T1DwrNgjYRFMnzbox/aYL1vNQfMeXdoQi0FfSbZ9OJWIr9m5J/9MNujQpPVYa0TPtd975YeYrHuGxKoA8qXRdGt13E6WUJbe+GAZMUEm4hD57y/DJ607zm0TlLqOP9SZWdAjy9GTrG1pLdrce3Prklcz9IdeQ6ZgeGgRzGR6kBGe4R7oIJ2QtaI3eDMl91oT5pj/peoPfi1YLf2uTcPLMJdturMpZ+Uvq3+1Uweuax86was8kXR8Cc/xNxLKlALECkZOKJg+CpYS63SNlpTlZI/lDin0Viz7gAGR2aui3UuvCzhChqiW93PqnDuYNj4i4ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHhIMnVCMFVBM1JqN1k0anVNNFgzN01Cb3N0OUtpK3RybXQvZFFwVzhEZ3NY?=
 =?utf-8?B?QmRYNnV4V2E2KzdGcGxlMHE2SUt4Y29MZVFLZmZNTnRLYVppeGd3UWppR3BY?=
 =?utf-8?B?cmM2dGc3N1d0SEdtbEFuNjNlelMzdlFBa1c5OGF0Vko3ZEY3K2Z3SHJ4ZkJR?=
 =?utf-8?B?cW1xM1Y2dnVNR2hXUGdEbUQrbGVpYUJzQTBzQUcyVkN4U3V3UzV6NXRUSHJk?=
 =?utf-8?B?Sk5rWnhCRHhOM0IwbUtUSHFVR3M0eUxycjRudjN6ODdoZDAxYjRtMlpZbVNM?=
 =?utf-8?B?VHF5TnpaSExPMXJScGhsaUNsT3dpYldSWEpVZlFkSVZ0QkRtN3Y1NCtBUllU?=
 =?utf-8?B?Q3F4Tm8zQnMrNGo2MVR0UStjOWtCa2JyR1hMTTl2SjFCMThJdWFDenVvS1ky?=
 =?utf-8?B?bkRKY28razhqNkl3c3grWGkwc1dIU0ErMnE5SWpUQmNTMms5Y2EzYnFVSTlv?=
 =?utf-8?B?VTBtZkZ2alRIajVpSmlDRFFpRlZDTU1pcUJ4ZHZhZGxLY280NVY2SkI4Y1VU?=
 =?utf-8?B?dnBLM2ZXMXF2ZnQ1MERST211SUNIY0lBaFVNbWtmcnRSTkVJOEV3azRXSXh2?=
 =?utf-8?B?VFV3b3pSMnFzb083L204aUp0b0l2RUp3cUM0SW00UnJuZ0JYdk9yanUrQkpk?=
 =?utf-8?B?SVhqWXVtU2FZTDlZcXNJR3VuNHB2M0xHYW51Zm1IcXovN3ZRczg2TEpaTmRi?=
 =?utf-8?B?QjVnY3JNTzNmK3JDak9CSEJjOWtGam1xdWFTWTVDSHNmMEdKSDJHNG5XaUJz?=
 =?utf-8?B?N0tBOXBoZDFsMmtFQS9acHVWR2FPc0JidU1vdTdtM0RDdi85TzdEVHUzb0Js?=
 =?utf-8?B?MU1EOHhkY1R3dThjWWpjc3AybGUwa2VvcmU5Y2g2eFNiS3NEZ1BxV3lRNVNk?=
 =?utf-8?B?TE9EY3hJc1d2dm42bmgxWENxYWEvOWJtMTBLdE02SkFFVUtjMGNVSnlsdURC?=
 =?utf-8?B?bFNXeTduVTlxTU9paWZFRHpSM0F3NHRVa0FPT2F4VWFmSHdHSzBFdk0xSnhX?=
 =?utf-8?B?U1dRVmFuZDNDQzVacGlneExrNWk1Y3JPL1YyZys5d1EvNkFrNU0xaGdBUjNs?=
 =?utf-8?B?eEE4SktJQjJ5d2NGUjZMejR6SEEvVTJGVUJoMHQ1NlJrbEpXbzVqNTl0eVdP?=
 =?utf-8?B?bGNMTm92SmMrSFhlS3lOU3gzakFxRUtrOE1zaXB6cGVpL3BmaU5FNlRxd0Ru?=
 =?utf-8?B?TU1kcHd2S0hpZTk1U3Rlcks1ZytGcGJpMldoNjN5bVlKaEt4YlVjcjZOTk1p?=
 =?utf-8?B?eUlYTndZMzErdzlsTWl4Q2hiNnJtRS82VmRWTTRRUlZiQW14UkZzT1BPZG42?=
 =?utf-8?B?SDNnd2xmUmhFdzRmYitEOTh5c1lUUGh0TXdScE5mZjhaTlZUdTd1OEF6MjBW?=
 =?utf-8?B?dEFoSEFkeGxhSC9FcHM1TThpK1haWk1mRnJUVzZ2bndlRnlKM21seUttOURz?=
 =?utf-8?B?L2IrOHMydnBhQU1ycGVpU01TOXBTV2hqN2NoaGJSQU41dXB0RzZYbW9iVlFa?=
 =?utf-8?B?eWU1OGEzMzZWa2FlbUpwV2p6VEhLbm9EcHgyTlRSMTBZVkZxWDhMU1JDcGJs?=
 =?utf-8?B?VWhJTWFOblc0ZDZqSnRhQmxuNDFGVy9uNDhSMG5LVmlHNkFWVGQ2RGg4eERK?=
 =?utf-8?B?RGVvQWYzYWNhVkhWa0V6WjhYTTFJMEZNZEFhMGRvZjZ4R0lZeDMvUGRGREEy?=
 =?utf-8?B?Vkt0U0creXlVVi80SEFIdlg5NGFjS1JZNmRMSjZac1kxOUwrS3U1dmlqcGhr?=
 =?utf-8?B?LzkxS1RrQmk5OTRNRk1ObGt2eUt2Q2NsRnhUQjFEUXpnT21DY1gvU2NTQ0d5?=
 =?utf-8?B?UldYVHhocXUxRmd4enJMekhCaWcxZEpHd3NXY2lQTjNJS3RxVFo5b1k5RWpy?=
 =?utf-8?B?Wlk3czljQlpmVnlCZ0lPUy9Dd3ZwSWpOb2kwWHk1bGxvNmpWYktIcWNKdGxN?=
 =?utf-8?B?dnJQcWE5R1lMa29oNGJWbVMwOVNUWVFFSkdmQkhWNGMrc2hhakJoQk9VRCtV?=
 =?utf-8?B?RUM5Vk84T21FOW1LWkZMdmFDSEZpbzB6THJwZTkrU0pFUi9VWEJTZ1UzZ1hL?=
 =?utf-8?B?R3Bmb2Y2UlllMlNYMjhXNDI1bDFsb1ZlYjhzWnZVa204SHd1cXFqd2RGMVlw?=
 =?utf-8?B?em5JVnZOMEpjTE9WV20ySENMMytkeC85MS9JVEo2d3JGQ21hS3NXVGRBTmhs?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 322e1a25-bfd8-493d-d0e2-08dc4fd3af43
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 09:36:17.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD1ZfF5Se4kJaaDP8E33BkXp7614l+WND7uaxHKccilHahudUzkrAL1/RPbEPaTlG7XlXI0tPPJeAGBpnbyolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--------------HKUC0KLOI05BqL9vnc44OvRv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 3/26/2024 11:09, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Previously, we limited BAR0 mapping to register space only because of
> the potential conflict with wc mapping for the GTT region.
> For gen12+ platforms, the size of BAR0 varies due to the different amount
> of tile.
> And as for gen11+ platforms, we can already map the whole BAR0 as uc,
> so let's map the whole BAR0, without artificial limitations.
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   lib/intel_mmio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
> index 4b6820787..31975727e 100644
> --- a/lib/intel_mmio.c
> +++ b/lib/intel_mmio.c
> @@ -154,7 +154,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
>   
>   	gen = intel_gen(devid);
>   	if (gen >= 12)
> -		mmio_size = 8 * 1024 * 1024;
> +		mmio_size = pci_dev->regions[mmio_bar].size;
>   	else if (gen >= 5)
>   		mmio_size = 2 * 1024 * 1024;
>   	else

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>

--------------HKUC0KLOI05BqL9vnc44OvRv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/26/2024 11:09, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Previously, we limited BAR0 mapping to register space only because of
the potential conflict with wc mapping for the GTT region.
For gen12+ platforms, the size of BAR0 varies due to the different amount
of tile.
And as for gen11+ platforms, we can already map the whole BAR0 as uc,
so let's map the whole BAR0, without artificial limitations.

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 lib/intel_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 4b6820787..31975727e 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -154,7 +154,7 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 
 	gen = intel_gen(devid);
 	if (gen &gt;= 12)
-		mmio_size = 8 * 1024 * 1024;
+		mmio_size = pci_dev-&gt;regions[mmio_bar].size;
 	else if (gen &gt;= 5)
 		mmio_size = 2 * 1024 * 1024;
 	else</pre>
    </blockquote>
    <br>
    <p><span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------HKUC0KLOI05BqL9vnc44OvRv--
