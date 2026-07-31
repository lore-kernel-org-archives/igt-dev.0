Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B34C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 05:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DCB10E180;
	Fri, 31 Jul 2026 05:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBF/tP+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE12010E1DA
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 05:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785477163; x=1817013163;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=yWlsHfAW5vICEqgnrBtyrjiuE6LIVfmGbUIqX4H/cqU=;
 b=EBF/tP+eR9kasAB5Eo8Z+mc9zGXRUaUafcfaTwwe+57u1AonIRRo12/b
 UjG5+9D7xliLP+gxHwoT1YD98CkWyRiNa/EKGxg8VP8IyrGl1lvElb/zA
 yHdGdL1mt1U8tisWe96qYtjbf6zsS0HQVrlGj64fbgP79dwl8EIpKAi4X
 N/m6S/GEeeypqe44Rq6Iw8uIIvE1VSi9zHTP9I5RTCNJwRKDKGU+nFN+F
 1E71OkLMkJVNWfXh7Q+a/Y2fcnV0djE0VkKgwKCGxDxlIPdbLe2DhMYte
 fQuaRfNmViB8wuVdt/55o+9syZrWYcdIzoPx+vbcyffZtBQdhCCK1V8LS A==;
X-CSE-ConnectionGUID: gqW0zGHmR9SR7gp22r96qg==
X-CSE-MsgGUID: fh55q8YSSYe+DCrHbNJDrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86294316"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208,217";a="86294316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:52:42 -0700
X-CSE-ConnectionGUID: AVzk0xocTuu+DzC6PWyowg==
X-CSE-MsgGUID: qZ16byrDTIm+zujw5VAlVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
 d="scan'208,217";a="254173326"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:52:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 22:52:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 22:52:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 22:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPFLrH6MKnPIobsG+jAzF5sSMkdn0W9kijicjzkjZZSkY/ZQEtWkwY7e/1T87xT/b6qaGTaMR0/6hzmAOb7PXueuNH0QuM/0duKCXph7Ze8NzwGneT0iVwXUzEK8niE/mG6OUJcyoVvXa95FRmN9jzq+h//V/dpKL06Damd/z9Vkkzd90EI31n2O0Aac4XwpeoNayuyWRY0o+lOukBqhXtYJHjgAwhFE+DAVcSXCSO4jyB6jXWxgC9DZn4uL4m7GErGM3I56Wj54WcjuEpWVBGlieWYBhpG3wPA5HM7/19FNffad7Z22yXx/lcZR4xZ/++l319m4t8NotVYPOARFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZqkcMUAVRbi4XrjAozrTcIb+ioB/EORRSAiR9Dk0S4=;
 b=Bt9cHDZXWvix+ymYhb/TlUXBFKLiWePTmoE85Ljn6l98ul4GpiyhaDoPYHczmCbUxZ5eGGUtELdeiueHr+ehu1OoqMxhdgW56KOW3B9zsCdvDtKo7lyLJKPOwn4r85EpbHoYyHexDCsG0icaqmGsVQ6z0Mg5ZsF+uWZPlWInAjJrsj6ecVSEE1/wo6GO2kjZD3S2E7hdsIO4Kz0SD3D86wZq4aiuoqPPwsb1430TXm6tqLyxai56rMkfNl1YLJtdqHCaawQVB1gj/T5uR3h91vXadVP4Kcqtxz3aA7Rbk5zhgXX1qrFDhsV/w3VbWL/DakJ85x4rX6lBdHD0ptscIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Fri, 31 Jul
 2026 05:52:39 +0000
Received: from SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2a54:c2a5:16e4:48dd]) by SN7PR11MB8262.namprd11.prod.outlook.com
 ([fe80::2a54:c2a5:16e4:48dd%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 05:52:39 +0000
Content-Type: multipart/alternative;
 boundary="------------OdLJo47C1ae0OonBe0bO3YBR"
Message-ID: <9352f5b3-548a-4747-b307-a1de0bd4b3da@intel.com>
Date: Fri, 31 Jul 2026 11:22:33 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Fpm=3A_include_PCI_domain_in_i2c_adapter_name_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260727182421.2872627-2-sk.anirban@intel.com>
 <178520989984.229056.10020413553386524617@6beec6c84f66>
Content-Language: en-US
CC: <kamil.konieczny@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <178520989984.229056.10020413553386524617@6beec6c84f66>
X-ClientProxiedBy: MA5PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::12) To SN7PR11MB8262.namprd11.prod.outlook.com
 (2603:10b6:806:26e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8262:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fae7da-3393-4a29-b408-08deeec7ede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: COj4+WUcMvdDjFr6C/l+BWOzt74a+f31IHV3hyRFlsnuLC/x60HipFPq33XrisKe+0Lki9sObaFfCk+anS1+ZT+B9xHr2hK9JKxe1TpTwrymejweLLYROxrjvSCNNbUO8DeOSG9sHu2qBn7qe8ewz5QerchTvl/pwdvLDFXUOz3jtDvbcNffV1VQqY5/ueO9Wjw7w/TgOoCPTCCjzfc4fhFuogf2s1t0ZGlIH0X8tCCXZKH0mQyWWO+eYrCM7cUYxOyIk6QlCV8DQTYQIX2LcAcFv6+t0u/UCEkHoRCsATRa5Zf8KendpLiO9iWRvsy53ToEjVgrbEqtdGdYXgpYPVAceOlGuNjRKDgj/dH2yp4OOr28CVv3zfz8Q6zwkOBkIBgTI8/wOSu7s0yx6gu55/dNHqNHIro7cfUDsCun4g2HrxKsgHKrwN1Yi0aYVEePpCEn2tHiTncMif6P3i8LAYxMveJNykwLvkNTsbYNMdf0ZTS9TblqSx8P10DNVT4lN90xKLjn87JwK6tDLGguEJ735HN4d4ViRok3rh/dARh6jQux88Hx+TM7+ZDKWkz02Be5avl8thDqOV5FU1CgEqmPjompVf8zdN+rMJIyIZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8262.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UllHQ05KRTYyNXF0TXhCWlQxRGdjYlArUVV5ZjUxam1iMG9hVTNORm5yTlBa?=
 =?utf-8?B?SlRXem90bXYvZEcvZWRzd1QvTTIrQmpMY2JqcGJmV3lnWTFJT2t5cS9aZ2ow?=
 =?utf-8?B?Ry8wZ2FwUDhDcTh2ckxValFDNGtmSDV0KzBCSDN3TU0zVFNHaWF5UTlJVTVN?=
 =?utf-8?B?TVJ5QzZiSFJkQzU2T3hrN0liVk4zbTF5RmhMOHNUR0RHdDlYald2QkdHRUpj?=
 =?utf-8?B?dDBURzBXQUFiVHE3bVcyMmFnbHRwQVduRlBGaXJYUlZUdHVkTEJ1NEhvNExH?=
 =?utf-8?B?Nkx6N3Z0bzl1dk5MRnVNS2VMaEtQWXRHdk9wL3lxcldMYUZ4dXZtMGpQaUFE?=
 =?utf-8?B?NnQ5RWZjOVZjNU5HbFBCNS95dUFmcDBwUkg4eFVaNlVIRkxlT0pmUDVyZ055?=
 =?utf-8?B?cXErSDVnQjJNU0pIQ0lmY092bUl4dlgvem54SzRBZzYrRTUvZWx5N21xRUcv?=
 =?utf-8?B?S054OWlmSHRNSy8zUUtiQVFEVzUrU3QwaU4rdXowMGlzaGRmUldocDhjQlU4?=
 =?utf-8?B?KzhoemwrZEk5akY1MzU0OXNncTVyQXlPamNxSFJ3b2IzZU1seGZxT2M2K3E1?=
 =?utf-8?B?bUhmRnZPVE5pa243QUYvdC91cjhMWjNqbGpIc2dsbUt4d0FaUXV6VnFzWXJV?=
 =?utf-8?B?NllWWmVjWVZMZXNNYzlyaGxyenBTSk5QTmZLYmhwNEhleXJmZUlZbElEYytt?=
 =?utf-8?B?czdiQ0lPaC9BZkNMYjF0QUVyQ2ZJaEphdE1la0sxTzZFK3IyemVzaUwyNHNr?=
 =?utf-8?B?TVZScnpiMU4wT0FlY3Y1ZE55NEpLU09Ib3VwYm5Ia2N5eDhwZVdBcjNMckZt?=
 =?utf-8?B?bFQya2twMUFsbkpBRGE5WG0waE41bHNEcjIxeXltM1RRZzkrYW5xbTg1ZnBk?=
 =?utf-8?B?Sk9iY1BpQkpMY1YyWUFuaWFPTko2VWFFMnlPY0k1dEZyMjd2SkZmVXFraDB4?=
 =?utf-8?B?Vnh2dzl3SmRhdFczQjFpdlVuZnRCeGdvY3FBVlQySnY4dnhBcHlhQURmRG5u?=
 =?utf-8?B?S1d5YVBaNkZxTUo3UFdRVVRTdnV2M2NBays0RWU2VHNMakNNQ1V1YTcwa1E0?=
 =?utf-8?B?WTJjNVJvejFxV2hZVmNFMnJiS1VQSGJvekNBaUM5cDJ6UXVvZmFLRjhuZmFJ?=
 =?utf-8?B?YkZ4MnRyczdpYXd5OGJFVW1kdzNocVVDbHJVTExIUWdQMVpTemUzbFpXa21j?=
 =?utf-8?B?VDE1dUg5Y2l2UktDejY0Nk52L1lhZXQxekxMWlJkanFTMEsxUjFwM25QbVlO?=
 =?utf-8?B?ZTFXK3IvNE0rNXNPZHRERjlzTW0zOFZqRTdMVnZicmFLM3pqc2lpZU8yY0RJ?=
 =?utf-8?B?NHdaZlJGOGs4VTlnNWVMN2VqRmFud2d1Qmg3RmRCeW1FUUdxK1RNZzZtYk13?=
 =?utf-8?B?d3BnMFBMUnl3MkE4eTNaV3VYeWk1c3NRZGJad0hNOXFzczE5ZVpsa3NzakIw?=
 =?utf-8?B?cTVnekN2ckNZcVJsdTA5UVJOT1pHbW1ST1Y1NHBsUVN5eklTUkhCeEhLYVVK?=
 =?utf-8?B?anNEWFNXY2k5SGJhYnhoejNSN2NXYnNQdk1NaldvdHhlUlhRYTUzTVdLT0Vw?=
 =?utf-8?B?dHA5Ti9lS2hGN3F0K2NkWmUxTXVIZy9XOTZDcEl2MkpPcGFhdFdnZ3p6TW44?=
 =?utf-8?B?VjFzcHZuQjkwOTBBUW0rckNGNzFNOURIY3NZQlF0bTYwYWx4bHkwSTdsTDVi?=
 =?utf-8?B?TWJmRFNjaFd4YkhSK2tnekNuUXRWcGRxR1hwOGpOVXI5VFVlOUJiaGdCZlda?=
 =?utf-8?B?Wlp5ZG9tUWNSUnR3YmUyOWxpbFY0elYvU1VDSURQTGQ4a2MvMXdGWm1ZOGUw?=
 =?utf-8?B?TXRQNkFmUi84eG1BMStxcUpjb2JqcWZHaTU3RnpIOFNLWENXTjdVbzlxbVFJ?=
 =?utf-8?B?YTRaeUF1dERraEdMSE55NjNWbVk1VW50OHpIcktZMXV5cFl3NWx3Y3VlVEJt?=
 =?utf-8?B?UjNwMFNEU0xMYzlQbTRBK3p0U3RncTlpTjc4YkJ2TkRMVXJxNHI1M24wRDVp?=
 =?utf-8?B?SnRIU1pLMDA4UkZ5RVFyaGZHeWFCeGUybDB5V2Fmd1Q0bTFKalh0dUdRY0E4?=
 =?utf-8?B?WVZDK2tFRnBtV2NwQXBhMWhIZWJXY1pZanpacUFMb1ZhSmtEWWxhU2VHMlhI?=
 =?utf-8?B?cm5HQjFRYjNQMEcvd2pBQVdiQkRXMFJEZm15ZEluSGVtaldrUlFyd1BhRU9Y?=
 =?utf-8?B?S3gzemx4MDhNbUxZN2JCTmVrVjBYa2w1cm1WRFhRTDRRR0VhMG00S2JWZDVI?=
 =?utf-8?B?SkhBdk92Y2ljUW9LVm9ZUmdsNEhjajU5a2RiZFVPQStPRVlXbS9Bd0VwMThs?=
 =?utf-8?B?czl5bUYxeEZqczlkSzhmeThrbUtWbDRTV1laNE05SVlYSUlrYVArZz09?=
X-Exchange-RoutingPolicyChecked: WaT0NGN1xe1nTLG74Fbiw24zn1ZM9wn3O28gw2/Rv4u4dMqOiu27CDfURPQlBu4PeHSj5oyXAYe+GCPUolpEi/e3dPSlI1e05LHCdE3jaMnaSfPTCpL5+PpMgE8qvzMo6/+L8OZnjxf8S/lXF+ScDrQXyGSGQrQmneJ7qyiCmRDUY54PWx1TZZ0nIj6uZ6WCSH5JM/RXom4rtQjGnFYdJ9yY1OyThhhFiZ2Fr+xlTTI2EiHnPfq7fpn9uEcnkI5+vYyeesmuhh30Gvf9TzdtGbtFzV8N7kp9E0Lkhe3mtxTMvXVFptG6YOf0qje6PV/8xaVqPaW4DCvJPCz4n/woog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fae7da-3393-4a29-b408-08deeec7ede6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 05:52:39.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k/tcVJXFydRlrQGbkuwtblLMiJ3/fOSIQHfjagQFp0WYquK7qAMzI1l2qbv4zWL4RRXHJKimVTc+iZMewmi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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

--------------OdLJo47C1ae0OonBe0bO3YBR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These issues are not-related to my changes. Could someone please re-report?

Thanks
Anirban

On 28-07-2026 09:08 am, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pm: include PCI domain in i2c adapter name 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/170934/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html
>
>
>   CI Bug Log - changes from CI_DRM_18909_full -> IGTPW_15594_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15594_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15594_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html
>
>
>     Participating hosts (10 -> 10)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_15594_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@gem_exec_whisper@basic-contexts-priority:
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-rkl-7/igt@gem_exec_whisper@basic-contexts-priority.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority.html>
>
>
>     Known issues
>
>
--------------OdLJo47C1ae0OonBe0bO3YBR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      These issues are not-related to my changes. Could someone please
      re-report?</p>
    <p>Thanks<br>
      Anirban</p>
    <div class="moz-cite-prefix">On 28-07-2026 09:08 am, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178520989984.229056.10020413553386524617@6beec6c84f66">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_pm: include PCI domain in i2c adapter
              name (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/170934/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/170934/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_18909_full -&gt;
        IGTPW_15594_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15594_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15594_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 10)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_15594_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@gem_exec_whisper@basic-contexts-priority:
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18909/shard-rkl-7/igt@gem_exec_whisper@basic-contexts-priority.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15594/shard-rkl-1/igt@gem_exec_whisper@basic-contexts-priority.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------OdLJo47C1ae0OonBe0bO3YBR--
