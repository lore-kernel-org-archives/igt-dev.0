Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36515FED2E0
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 07:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50310E98E;
	Thu, 12 Mar 2026 07:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9VgEmcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D05910E984
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773301276; x=1804837276;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OMCauryf/7Uxr3Q36XgS+nKAMsni2Mz/8Pu4mW5VLtY=;
 b=n9VgEmcc1NUW8iZAXppn+Ir2O+53TsLJj9PLDrY2qeiIkC+KttUsm5Ea
 NgHXiohP/C1DBSPxu68q9oZKC3pcsUoJHLGg1kliGswEa9g5hRPoE7XMN
 D16TtTJX56qYTn0q4cR9I4crHoPmMQIoXTMzD+dYVaJI09NoS/sC31Oyx
 DfIZR6JchKLbcFZvjddlnMKSe0bEDsQpVs3gRas0vcUo5Fhw3jRq/qHad
 cVVTGSHlf2jxvVXhGI6ExMLrOVSU+ndVF+Fd6Ap2Dat/eN3xyBg6cDj6A
 Cuf2Ytzcri6J65+psoYRhNkDEZBscfvdpqkuJpKVyLdym+GfOmomW7J6U Q==;
X-CSE-ConnectionGUID: 2Fyg9NGxRluzh/fexBEYIQ==
X-CSE-MsgGUID: j16c4092RfKhQl0ZJT1lig==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78274910"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="78274910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:41:15 -0700
X-CSE-ConnectionGUID: c+b5LeIoSkajVtkQSRuTCg==
X-CSE-MsgGUID: dzStXOmaTKiRG4DKzCcPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220681319"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:41:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:41:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 00:41:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/rRMFCVglV22uidzxDv7NY1QLiA1YmCy+ebHLDvh4gnVzN1Th0KloTfPhHfZT2ybw77SQDjj9wZ4NQ9LxnAaYBbXbh3N1e9aahnC233zsb/qTs87o2YL2Os8a0NiX1rWGnKAeATuV18Yzyzc3TrKK25CtjL1TkHDRstG9nxzgJ30zPYJMe5S1RgDtE1bvrdzvk4G9oRlaeXx0fZprFJAehzGDkQg3GYiebvEWFqHmU35vFQYRqdPYgptoGH6oHSGoJoBFDppbAUz7eNs7pjv7uwy97j5OQzJYrBjD3Vzh1QdG+x+Vg+Y5TrNBboCphnxaKXfTcb3jdHNJSLOqoKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DYJSjC5JY3UH1Glu9yNwkFFicrVFLZDKew1g8uwp+c=;
 b=KPJCE46EPgUwtLP9udfbOlA9reJV0d00jCt/YeQDD1jrZ24NQbxX48s8h3Cf2I/kv8iX9lFWBpJO+w17Vu1JMzZObHDnzK1de2YFPeCNmkcQ6ZP4uECfnOSnzyeN7P5sUGvjOLMMPKnVCj0oHghxBW5cR1NSxW8jnEdVRNzQmXlJapm/bsJDPIWfTctkHv+1uHUuADAzM5O9bgyE+ojau/xM6SkvWvo58LhA7e3eTq/bPhr9VTrwiovq7aIECmA8cEzRakNiWEbBMkQMrciWX/9eQ61tUw1HubPgtSw3HH/m7/DooaIHdgxFFhMfivMwJs1eEvCXphXXuFiAefEYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 07:41:11 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 07:41:11 +0000
Message-ID: <a451458a-4389-4816-9e2b-06c1b62fccb9@intel.com>
Date: Thu, 12 Mar 2026 13:11:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/ci: Add NVL Display blocklist to
 meson.build
To: <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260311122606.42223-1-aditya.chauhan@intel.com>
 <20260311122606.42223-3-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260311122606.42223-3-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0175.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: b210b8d1-d74c-41c5-0afc-08de800abac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 4weOjNmvPFS+JgAYQujkFflIGHtxhP4s1vcTEeNGF9gBSnRO0h9isO3eHmdh1Xynep3KIyE5i0Poc1E8/D2y9x+oEBir35GA9m30rTdMs+h64toi39AxIxrdVDchiirhI0PyCjApnCl2R8rpMCwnNsvdXt5EFN0+1F3rh1TbwxabIu/LrIlgV9cZMvno2S1R4AAiTN6YFsofZKTZwfs7+I1iinjqcDVRG/1iMc+kPfgR5dPbuYo+3quYQJ14eY+yaBgZYYznY+J4HlB2XrU4+cEZEfp1yghQL96Dd3sV09lv0pc/bOjxUo6liLZt0nPtMqg9aTnnQBqQsaIbsNMGj4aIQYYlzwvtrR5ZLCgtLduP8gmFMNTOeR7Ct7DUzxXqrsysSiP3fKS3npH77i5uwQjoFZ9PHrx+FpZOuJ63SOT7csunIMec2Xj9/vWsTRlm75JKgQWAqNPO+Bl+aQ3UV7htLi+IS2900SVn5iPLdnsRaT3wqPdw28VVyqU7XYkx7YKW1JcUXKodzZJgcQoXlYHuXxKzEuHUnCf/vzwnYrgNcqplgZwiygPlo9ekOr3AU/B9yFDyZNrAo21L+TWcA7MG7jqwtUFQtcxFPmpuit/qcz/L/cNmLWmyAtsGbxQdqj+zS8O2YVu5L3NbuVj1rtVBb+tR/I+vYG5PBA7t5/60mwzSCqkKFYCDhAeBd8IFU62EwDWuXAshZXItlmJKiLaYh4Fy6hVLj3Ura2Z+zR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SC9VNWs5QTlHblNtZ2N3OEZBQ0ZDM0tFZHZ6VjIwYjNOUDVEVTdVbmd6L0Zs?=
 =?utf-8?B?MUNIQ1RqV1hBSlU0ODNmTFdIMXR1M3pDTTlnQ0hkSmhsTjd2RGxBY2M4c203?=
 =?utf-8?B?SFd2T1VVY2tDamM5UDVBdFcxbi9TS2x0VlFSUkdxejNVVHhEZTNiZmdUNDhG?=
 =?utf-8?B?djdUNDZIdXUvTTQ1YlNwTXB6eXU3R0dGRXBxc29Qa3liSlpVOUxWa3UxWS9V?=
 =?utf-8?B?ZHRZT2dQcjdVOCtDRUw0UFBCaVZoTXpCSmJNR3BVMnhpTHpoVXNkL0FXTVVR?=
 =?utf-8?B?OWNxZndWVmNKTnZIalhGNVl6b2RDMTFXeUVWbk1sZVhlMlJnTEZPZlIrbHlw?=
 =?utf-8?B?NjhpUHZIb0RLYkhOWDhmcjlRMjFRWSt3M3YwR2JPbm9rM1I5bkdQNkNmOG5U?=
 =?utf-8?B?Z1NYRTRMZ3JoTDR2NEZvTFNvZmxxdWEvbzJKalBDZng5OVEySVRJVk1pRFY5?=
 =?utf-8?B?NGM5U2c4YlM2SXY1aUx1SHBUUXBJNnJFaUFwZjd5QnZYMlNlcXlSS1hUUk95?=
 =?utf-8?B?WlJrWHJCZ1pYTmFuR01nM0h4U0MwMS84bnl5R0VVY2pvSWFPMmFUUjgwWWds?=
 =?utf-8?B?SjFNdjRwaHQrdVJudlNSK1NhaCtEbzBnMFlQanpZTHZ1OW5BZzlkR1hZanlh?=
 =?utf-8?B?RW5qanpTcGo0bnRON21IQTN3SVFHdzE5MFpBYXlFQUJjNGZ5UWs5ZkVEa1dM?=
 =?utf-8?B?VisxQzZCbWswUVBOcGxyMEM2WGNLWHBSRUMwdm1vQmhXK0ZPTXlTdzk0WFlU?=
 =?utf-8?B?SDB4QXRuMlNvUTNoa3N6TFIrZXEvUjZnZWIwb1JiSi9mbjVNZHNWbVZ3U01l?=
 =?utf-8?B?YmVaQURkeDYvL1AxNTVoV25KM0pnZ2doYUo4NG1vSm9LY1QzcmU3emJGTTFZ?=
 =?utf-8?B?bUVaLzlkeHNIOVZ3VkladjNnS2NEZG5xUnpUMVpLUHAxeUNSZ205VFJqYkJ2?=
 =?utf-8?B?aU93bTAxMXJlaEpOcFpsN2FPNFc1dDdpOVVXaytHZzVsWFVRYUJLczkvY0Rj?=
 =?utf-8?B?eGlUNUYrNDh6NzBUMmpiTCtVbmVlZFZoWUVFYTA3RlBsOWZMRVpLUXBJMVhw?=
 =?utf-8?B?OGtMV0lQRk1JcFBDWHViRXdaM2gzOEduT2JENTAybk1PK3NQQ1ZMQzBkUzJt?=
 =?utf-8?B?OVgvK2dOc2xyK3JqT1VkYUZGWTQ4YmdFQjFqa0NwTk55eU1TMTZXaHNNK3Vv?=
 =?utf-8?B?SndGQmlHWldNdVBRdTRTdFVnMHJsQjdtb3o5anU5QXNTdFBROFdPaDY0UWU5?=
 =?utf-8?B?a0M3ZlZkYVZvQS9lQW5aUGhxVVZjZWl1UCtKaGZZU0JsL3NyaUllZTBjMG5q?=
 =?utf-8?B?ZWlFcVVNc1JvRWtKeXB6U2I2ODFXS01STHpZNnNaVEduNXlHNFIwcGgyMXRs?=
 =?utf-8?B?YmFMZFlDTmpoUnZ4RExRQTc1K1FkcFpuRnFvYzV2a0F1VDF0NGRybHNyTE9X?=
 =?utf-8?B?UXhJT1ROQ0hSZjROcUdCM1B4ODkyYU13ODQ1RUNJeTNGZ2Znd0h4bWgwdGV5?=
 =?utf-8?B?V0FkY0Y3NjVScjZ6ampTNEkwRHFCajdTMXFuS1hBODRtclM1RldrajZ6THhE?=
 =?utf-8?B?Sm5YaXVuUDV3RlN5NU54N3J1T21KckZvaUMxZ3J4VGk3bVJuMXhWdWthSmcr?=
 =?utf-8?B?YzlxYml1MXV4SlNaVGluSnRMUmh4WVVQQzZhWFh4OWpISlhNSUsvYU5kSytP?=
 =?utf-8?B?bzZYblFxUkl6SlJIalUxUnlValBPUWk0K3F2ME9Fa2lRa216TERCajJsL3Fp?=
 =?utf-8?B?MEVRRHhXNVF2QzZoZXprOThxM3F4NGM0U3kzRXRqc0dOZ0lpbjJQSlgzL0hZ?=
 =?utf-8?B?Qk5VS05JanM0NTNYYU5palFXRW85ZGlsZjdpMzFrMkhudXN1MEJTU1lxRVd0?=
 =?utf-8?B?bEU5dWVDVTNSWW9VaHBTV2l4UGxCYURDVlpuL1Bzbzd2c2s3b3cxYlRCVkF1?=
 =?utf-8?B?S2Q2V2I5clVzMEwyYXNPdFVhZDNVdmFTMEM1ZkFiYWpHT3FVMDR5dG5LNWJH?=
 =?utf-8?B?dW9MK2REaUo5QWlwNS9HL3VrZlRXL2ZlQXUwdGJxRGtyUXF4YnpNb1cwaUli?=
 =?utf-8?B?Z3FaZHdlbkZwM2dtYy9jM3ZIK0pUblhDS1ZBNmxxTnpRSlFZbXp1UzB1Zmp4?=
 =?utf-8?B?eEQ4Vml2VnFwN1RnZW5NeEpENjZ3K2toa2RlRWxlY2xFcDlYbnl1L1kxTFFl?=
 =?utf-8?B?M3l3ektNNklNOGVLZ3dwTWZVOC9VNWgxbzJpMXJNNUxWMmQ2R054b1ErbzVx?=
 =?utf-8?B?amFaaWcya2pCaGNBWTkrS2dzdjBicDZPU1NLeDVDaG1xanNldUtPT2dvS2lh?=
 =?utf-8?B?ZnlZblFYQW5tL2h0NVZya0IvUyt4L0o3bDd1R0ZjV1c2clY5Tndvdz09?=
X-Exchange-RoutingPolicyChecked: NiMGoi7UX52soqkHzlC9CKXa3MzShlVQ317+MonCAWxl9red39VPGB6uadIHzV/mA7HHKxgOgNFv9tI55Fewza9xQjnfJD2NnB0q8gpIeMO0VD9EyPX0XEcA828q+8JgJiEm71QkQDMVTdpWfG/mLMfzBnmHatYnxIrrO1k8fs37iQTUoLsvok8EoTicCsJiLJ6VwRD/pHPrZ6CNr/iW2nxvnDl9wYfqAiOgDSVrayNN7wcP0/VD7f0bM1BiZA0Ybpc72SgEz1volrrGY7oMWkqmH0r4hv3gOTpshDJHfkTytG3W8z6OP26oZFjAR7yGG3LqfBDXC1EocH1nru572A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b210b8d1-d74c-41c5-0afc-08de800abac5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:41:11.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRFbyjdIJrWiSqE2/xVXXGhStXH9SRzRF73nHiW8k+eWtZBoaP9ft034l/WB/mkQm31WsmNbQnkP454YuFUBrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

Hi Aditya,

On 11-03-2026 05:56 pm, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
Same here, this 'From' should be removed and add commit message.
>
> Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index a1e9dff55..2e40b2179 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -26,6 +26,7 @@ intelci_files = [
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
>     'xe.nvl.core.blocklist.txt',
> +  'xe.nvl.display.blocklist.txt',
>     'xe.sriov-vf.blocklist.txt',
>     'xe-sriov-vf.blocklist.txt',
>     'xe.sriov-vm.blocklist.txt',
