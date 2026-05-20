Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44341CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935810F0B6;
	Wed, 20 May 2026 15:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftMba8/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EA310F0B6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779289478; x=1810825478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7NhjYW7sGAShyRraQaD7vNv7TltliEyQylXpVESHsP4=;
 b=ftMba8/z6HZ6hTQMcqFXB/u9ijpOyI1UO9FJIpU/Aw5SL09kVQjeVpVB
 OUcL2ooCUwtdlLwiHf6ECYepLi6QNpJQCehn7BugwyGYjx6OtNv+yKZUY
 FzunSZbkZzloMfnWBqoKzgcg7FjHODwAF19BgXeG879//KJ5bbg104bV4
 N3EJRTSkjT2B7w6yt08ICeuU7AOjUKtN+b8fcedI4eOmMAB66ifaEM/Ot
 3PqxuhGu9Xv+4BPPgKGrN8hwK70vjSpqoqUvKNFzTZgJ1iYsHc51A7Okk
 jW6zWQ1EvIZaY1SxQCy3fAetPe0Ao+gbm41F32NAw/j0bxZ7ddwh6/NNq w==;
X-CSE-ConnectionGUID: iEcIzB0oRtCipihsagMotw==
X-CSE-MsgGUID: wCmvVH9XQD6+RGAh2ds7uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79919585"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79919585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:04:37 -0700
X-CSE-ConnectionGUID: B0E1Co5NSjypHig1E6YBIw==
X-CSE-MsgGUID: UCkYXoLIS22MByptAFZlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233856640"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:04:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 08:04:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 08:04:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 08:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqu1uLTf/0Aq5vOUSNTck6CesTp+lzfrFAvdgQeAsuophthJNrkL5qg67DXC26iHRmQ5cNlXvcPPelUK+E1FF6SihtReY8VOf3qTPhTUp7V2hsSavJ0plPYIF68EpzqXcY/DjQS1hva2nXJexpKYPMbnYtfG+lynVMsnb4uDKoaZ1o6gxgbOwzAxJOYmQKIvOj2ELoA3pH/YrxBn9SFGNbLr1sTgCJcD5z31QI5jDf9gANM1QFV6oiwZTuxaAcqkwCRy8fz29x185fGppN5K56OoZhCf87zYYn3UzwbKTeBPQzUGHf1vQ24dDUJfWRwluRuyFLa2cRpFQ/LI05PO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JQyGIkxWxkKzOHlr6j7TbwMFZHkFQe1RTh2qyFPqU4=;
 b=BizKl6KmkqAHhmusY3evHus8mM1e1lSCE6hkilUcGzR7r0azfgSr5T+aPbN0JtHuEToPboV3oGRDKFDL4EO/nY+OXrKzLTUdTU/UOEwrlMgYYjhv8kPCubcgASG4ocnsqZCckI0f86eoV2pOSZe2UeD0gYZYGu2O1gUiVkjdTSVPHRriskv8jxzk9epUWEsBBVDnfkLDWbb7vlyU6s3kiAGiPqkxMrLr180/PSag7O4FGo1r4GZycKy8zE7pcH38gfC93HERopY0q++/UQn/sjczPD1++/HP9Gn34WJ5RukKgBtzAu8B0gNd/6wzQ3pGGR0dUPqwM9k3k82lnKXdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 15:04:32 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 15:04:32 +0000
Message-ID: <e900ae56-a8f0-4bc3-bf2b-1a05b3a24262@intel.com>
Date: Wed, 20 May 2026 20:34:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_hdr: Skip unsupported formats in bpc-switch test
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260520080747.3311784-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260520080747.3311784-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 4707bf73-5583-4190-c084-08deb6811908
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: TLKAuUdHc5M8hA48lh1y7kZv/B397YsVGyBPm3CBUjozIRJBoePJ0UK/EOJuUlERviSCTSX4jzTdoI9xppRA+i1FXm199T+vW+X4cH8Qxgo3XvBM5B1VtTBNQ784wZrQghkd020gn5idss8E1OBmjHUzQ2HevQ426X1gxSKVV65XQED6OndsNeOIGwMyAjWu+K+tFkeBgOrNw8vUpLX4xJRg8w8+QRF1ymWgShr2kbWT0hwMjO/L5SWhdBYPOD2x38FgTHIMn4Tl714w6Q+cy9YxwzI45j96IZfOPCHjvXEJ+XWn+iV6/SX+yeYl28MmkGIn3JbSYAnl8yOaFVVTJWhHAWNlKPqFVcw/daS7GW5eEFjBTABtprZetZw1WI+vwqToGb/aEPus8CZCBxeWGJC0H5VtKicQPnJ5KeEFH3RVF1rqyU/nj/34Axh7srRPG4jofTXQda2OhH+amVgqLIc0EBhOKUuG4Lecpep0EglL1LhNz49W4WsHXpVjPlQy44jr4s2emCkXesSaL+3Z0FA57PpeBjAWDoNaiFjoS+1/bKGd4R++lMujvsr5lgtnunjJjMj76+tORBLbOBB5eY+qfGHOPW6qqVxUA/VnlJHQEyg4N3uaXhznPyzNQSB83+3GjTH0wroZh7BKkHXxjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZVMXRIcDg4ZDVQaGdmdmZ3T25lU0g4aXQ5UHpiSW5OTHVpNVBtMDAxVTBY?=
 =?utf-8?B?WnJ2R09GeWFSNG5tLzFtclNxNzRSamRvRC9BRE9WMWFWUVRRc2JxRHpwT2ZY?=
 =?utf-8?B?S1F4UFBJb0VTRktmRGdKVXB3RThkd21qb1V3aXJ3R0xoUDNhQ2EwZklDQTA2?=
 =?utf-8?B?dFV5ZXdpQ1hMQU90VXFpRnlYZm9YR0pNL2tGSDdGbnlXWUZUcllnbXlqNUZK?=
 =?utf-8?B?bDJISVp2MUFIV09GY1BTeTlQMjdlUDR5VmZ5eWVMTURaUVN4RFN3SWZ4QkRW?=
 =?utf-8?B?ejdReVNTTnJ5K1hKV0lmRi9sb0x3V2N5bWJXSGR2dDFERG1SRXQxSTVHK1M4?=
 =?utf-8?B?WEsxQ1FLQ3dtMHliREo1SWJrUVp3SVFTSnZmOUI1NXk4MWVEdExSNXpEWUdZ?=
 =?utf-8?B?RW1rVDhBUEF3TWZldVAzdDlCRTFZRDFYUndNYityRjJOanRUbXg3WThWM3ND?=
 =?utf-8?B?dFNhYVJXcWE2YjZNaWZyRVhJNHNMQUtkVC9QYS95b3daUGhhdVQ5MGdLUk9s?=
 =?utf-8?B?d1g5RFprd3lnWlp6WkJpMjFRcitNV1FCTnQwV0doQkUyR0FWenBxL0JTR2dX?=
 =?utf-8?B?di9XejNwSkRManZqTDF2Qkh2aVFrS2s0M1hWZlRSMzJBa1QxU25OQ0g0WlNG?=
 =?utf-8?B?M3krRTQ1TlJJaHA2cWNrekpjNmpVSnNSWlhEMnplR2ZmSXJ3SzhzVmJTTlda?=
 =?utf-8?B?cGErNHVVQklxVTNlZStQVGh6amJQelNDYURwM0hUTzByOWxBdlZidE5QdVJu?=
 =?utf-8?B?WHRNcXcvSUY0MFU4NkhFelNqd2VqdDZPL2hVWU5IeGJ6cCtzb2FwRDR3UTg2?=
 =?utf-8?B?S0FIVlZVVFdBNHNKbjc1WTRtazdvakVKekhvMG53RC9kT3R6ZW9QYkxySHZR?=
 =?utf-8?B?R2xiR1RlbGowTXFZUnpOWmZlaiswMWNXM3NMS3VqcXA2QWppNGJWT1pUT0w5?=
 =?utf-8?B?ellUN3RqTmNWMVdaUkJnbmdmTmQrNDlaRzFvdUpOTE02LzgxSGNTakYzTUhG?=
 =?utf-8?B?Z1JlUTZLV1NnTlZVRUhOSzNMME5TMXVmTFVObi8rQjJMa3NGVFdhQ3J1b0Fn?=
 =?utf-8?B?M21LbHhTQUZQVHQvNFhpQXVJckVGamc4RTVmaDJ5RHl2MlpaS2tKa21MTWxm?=
 =?utf-8?B?NEtrSVkwWnpIL0plS0VMYVpTanJLOGI0Uk80WGhtUGJBQ3FBeHhNVk94R3B3?=
 =?utf-8?B?UFJyYjNjUWVmd29ISm1uU2psRUtqWXBnZUtBdVFTdjQrbGdTcGFUejBoaU1Q?=
 =?utf-8?B?MlZVdDhWNmdLUVkvOFhSYWJzd0xRWFZkNG1kMXBWNy84R2Yyc1RxdVF0dzN2?=
 =?utf-8?B?YnNnVzQrQjVZT3BZZDZWNitwUUdsTCt3aXR6MGNoUXFBTC9YeVpycEx5Qm9Y?=
 =?utf-8?B?Y0tmRzQ3L1FTeTFPbHQ4bi9VSHNLVDR0OVBXSDdhMXZmMzc2QUhVaTNEWGQx?=
 =?utf-8?B?WEdZMm45Q2lGOHlwWmdLM2pSa0hSQms4Zkh3VmVDd3lEbmtLZllQRWdKdUI4?=
 =?utf-8?B?NFk1RGJtazQ1VkhkQ2tVT0JTeFJrWUxuS1VscUFXeTVLckdGSWNEaG9Md0ts?=
 =?utf-8?B?RnZTL3UwdjZZTGkyemxZQ3Q0Zkdnd014Nm1yQlpvZ0RPYkZ0STBDL2RWUjIv?=
 =?utf-8?B?Zkc5K1FDSEFaZVlWQnY1cU0zbmpFVE1LTktEZzRiRjhGcXFQR2NtaWNpR3FT?=
 =?utf-8?B?SGtBc3Fid1Zka1JGY2hHWjZMMExmRWRDWWozWmEvQVFlK3U0KzJLVDZJcmNu?=
 =?utf-8?B?WW9BelI1RjFVNnFLakJXRUdhUXM0Q2pJYm9qYkdMaHBTcXdwYmNodmhoV1VT?=
 =?utf-8?B?MWVDTEhvM3F1MkVSYWNrOE1oZ1k5US9Qd3R4R0wzUnAzWkNUU3M1eWNzN0Qw?=
 =?utf-8?B?WFByOFVibnNNL3dVSmpDbjJ3Ni8rQlR5c05CQXJ3aEp3Wk9rSEFxSTFaN25D?=
 =?utf-8?B?N0taR01BYVVGYnRrdUkrc1lFZlk2dWNJb3dUUm5hZzJlWDFId09pY1JBVDlB?=
 =?utf-8?B?WHdHQnJkeUxtUVZqQ1poZkdFcFVxcTd4WXkrNUJwU2dkVGdxNzcwNFFjaFR5?=
 =?utf-8?B?SzJ5VThhTmx6a1NENFJnN1FBTHlkUUNnY3BxRUJmSEVjbk84Zysxb0d3bGFB?=
 =?utf-8?B?WjVUOThiaGt5UGRteDdQMzg0U1BSU0hnczBjdVBBeVIxNnBqcWlqNFVPUTVr?=
 =?utf-8?B?dWR0QitrU25uWUJlOFl4SHdOMFhFVVBPTWR2Q0hYbHhMSmxvVGlBYmlDdjE4?=
 =?utf-8?B?bUJnNzZsdXA1ZkxWQW5OUDJEbmJ4eEtycE1YcG9nUGxLZ0dYN2ZEcmVYV2Zo?=
 =?utf-8?B?UjBBTlFROHREMDdPNVUzbllRdWVjR1ZNcG9YaFNqTG9lRDJQV0dya1hrdWFS?=
 =?utf-8?Q?TleSFdp87vUT3Cd8=3D?=
X-Exchange-RoutingPolicyChecked: P3nP3SzODIBJ1sjwRwLVvw4U6/wC3Ch7q30QzTzJN6F3tOZwr6698Nr5lL78GG8Tr7V3Bs5miw8fyjggLS6GFvtZOMXZb7qhK47gJFzyxruTH2fx5gOIH9ga3mk9pVLHYZ5FAsAZdbNKGg5mQ3SyIJqulDegVyCt9fsfKc8Go/PZfCWjuA6aJTRDzQ2coWMFmY9xUTsHOISGSedN5+opmiz7pAMv22ugvR2Zbs0gFFQxwZLtEbS7v99hI0B0M8qRLbSQyeMppJFoZejFmlziYPB4fYovoUePbQO98rHUQX4fK6O5uEO0RrGudsnL0gTlWlfC0fBzNvKzJJPkyM855g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4707bf73-5583-4190-c084-08deb6811908
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:04:32.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjvRNQCh3b+Geva4UaIDbslE9EqeFhWITbcimd4qYLc1njO4PyzNrl9P/yO0p5k7lu2uRbRyJNckwFbN/QylJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
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

Hi Jason

On 20-05-2026 01:37 pm, Jason-JH Lin wrote:
> Check if the primary plane supports the test format before attempting
> to create framebuffer. This allows the test to gracefully skip formats
> not supported by the hardware (e.g., FP16 formats on MediaTek) instead
> of failing with assertion errors.
>
> Fixes: 5d46625cfb21 ("tests/kms_hdr: add FP16 format coverage")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_hdr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d50f8778771c..cce34f7149c4 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -286,6 +286,13 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   						      "%s: No suitable mode found to use 10 bpc.\n",
>   						      igt_output_name(output));
>   
> +					igt_require_f(igt_plane_has_format_mod(data->primary,
> +									       hdr_test_formats[i],
> +									       DRM_FORMAT_MOD_LINEAR),
> +						      "%s: Primary plane not support format %s.\n",

Overall patch is okay. Except small grammatical error.

"Primary plane does not support format %s.\n"

I request if we can wait to get following series reviewed and merged first

https://patchwork.freedesktop.org/series/166710/

There will be rebase required after above series is merged.

> +						      igt_output_name(output),
> +						      igt_format_str(hdr_test_formats[i]));
> +
>   					test_bpc_switch_on_output(data, crtc, output,
>   								  hdr_test_formats[i], flags);
>   				}
