Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E52C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 03:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E85113012;
	Tue, 23 Apr 2024 03:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyLUprRc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773B113012
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713843121; x=1745379121;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=duuXYo5HZzKaQcb9prpA5rs4o9eQ1KbW8WIsvp4t8mA=;
 b=CyLUprRctVtd+y5aM69wPxp8gFdqDGID1WER6ZGSdEOMe7h20pDO3itd
 GkGgs+xo9SouatGf26x3fpC+teO3O70pEorGGFrgXE41/YRulvFVwRuAS
 JlE7IXTDFoFXtXY5vm3WlqSrAaNf5Bv+bWJl/fk3PWm1ASxQTA0stcmz3
 gMKNPbbaoL34SEq8eJaWmzgVwQ8ItE97crwG0eAkNe/rTLuDAxZ4CGgib
 gmIz5hHIMuMNC9QpniLhjiq1F4pGi2PxAKW+4foskCxeUkfSPdMDWRnCd
 xJNjafjCNnOfyryq0uR1lU7YIAS4eNENs6iUBKS4/ESGDYZxPI8iCfFcv w==;
X-CSE-ConnectionGUID: CDbABD5sQNK/XE+lpB0UoA==
X-CSE-MsgGUID: KXKniFGDRu+IfWSGTZxB/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="34808067"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="34808067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:31:43 -0700
X-CSE-ConnectionGUID: /jt2qwSQSF2qpcXFEHITDQ==
X-CSE-MsgGUID: g+dhBjvXStmT5jQnza5FLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24095550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:31:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:31:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:31:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMHZKCll3wAkpIjqXG/2Zgu3q8o1Fj06FkU5k4tIjq0O891WXvCwnQfcK/ePcOlIvXPTTGgr7pP4Py5gqRrjvNy0kbuOSsVYv+rVg6UTYbjjEvQxfDVTfF/B3hdsb+SrQ4sHcuvOBr2ojdEgV30gIPiUY+UE2ZtPbe60RoFWPVvqMnCBm0rFMchrSWeDbteZ51/DIolIlingIXcZPAvTumgHZBF+H7MaLxiTHiXBml3CpsHL6HzAXQJE3i3OroAOhh9LJKOmWgDZjmpkGflxqs9N0nhs4uNW04aQcXCxpRab5aj7/EzbrJASLn7PfziUVHm0hHASO8XkU9DrzFWHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc6PVgmGZBaxNdlmkzSvFOjRGWE9ipL8+AyhlDfHdV0=;
 b=WYsAkkIungviA7/bey9XJJJvmkrIRf4QlPudqbaZ3wGtlMw7BXwOecgfgq2CYtqiGMfOE50cTtKMkeV4ZP+/z/FRilAry7PqEto2Xj2770n7qldFXRYjpUNFaSNT34F3/W/Y90BUiD7Xsiu4r88K08uBzFrPEyucc1Mzy65urCS6FJGanPrfmamVi+sZ0Ybzed1ecDfScVXVQLkS/JrIyg3/BqyqxhjNjBO9ajRW3uYomqpUq7oRU/RLDGnA8UTAs+tjGrEHGg8jTuzhmQ41b8nFpf0zTOQgXK/IPg2wggGoY++Re9gb/U9vI8pxTWX8BikUicTjHJ3TVTl8lXKk+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Tue, 23 Apr
 2024 03:31:40 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:31:40 +0000
Message-ID: <0b7e2820-4a1e-47a0-b182-cb0d4646420e@intel.com>
Date: Mon, 22 Apr 2024 20:31:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check based
 on flat-ccs enablement
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <cover.1713584014.git.akshata.jahagirdar@intel.com>
 <724d7114ac0d2f4f42c3a1c2cad09d82c0c00d57.1713584014.git.akshata.jahagirdar@intel.com>
 <20240422071337.4oodeuj4qi2ckmsr@zkempczy-mobl2>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240422071337.4oodeuj4qi2ckmsr@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:907:1::37) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: c110dd5d-96fd-44c7-8f33-08dc6345e3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHR4Ui9BR053MGIvd1p6YjVuQ01xU2ZZREF6cXA0M3NXaUxURndjRXJHY3Rn?=
 =?utf-8?B?MStZSGM2V1JxL1RoaTRFa1FvTFlzWHkxSVRWU1dqcVQ4cVd1RENCUk9zQ2RM?=
 =?utf-8?B?Q0docTFuYmpRMDI5Z1hqdm1pMHJENEVZMUE3SU1mSmJBMlExTEJPdHNRNmlP?=
 =?utf-8?B?bXZMMlVVSEs3L1hzWXlZRkNucTV2T0ZQN0RiWUFoZ290MzY5d2VISHpBak4v?=
 =?utf-8?B?MDFqNmFBRHVBbU9mdjVURFE2UHRxbDB5TEhQNHVGQ2J1aG1MK1RETGl3Wjhq?=
 =?utf-8?B?SmVCVzAzOWNUYmd2TGIySXd1VXk2WWt5aElENTM5WWZ4YnlDV1o5NGs4clF6?=
 =?utf-8?B?Z1hSWTZ5RU5YcWVhbDFPbEhJNjMzVERvT2xTcTBkSlNIVk5nNnNucHRWeVp5?=
 =?utf-8?B?VkxEWWxPUlN1Z0ZweEEyN2NLeitqM0JVd0UzR3dCanFjMUdIRS9zeFVyVDU5?=
 =?utf-8?B?Y1FHazR1bkd1UVpqRFgzZVlJdm84RmJMUFhEOFRLc0xMVldTUjBHY0MrNkh0?=
 =?utf-8?B?NEk2ZzZOQTl6QUtIMENmY25yQmRjYXcvMGYvanBEVHZDeGI2SVFERW9SS05X?=
 =?utf-8?B?TEJORlFyTDk5OUszKzVkeXpFODVsNENpdEtKL1U0N2plSjdZTzlLdlRlcjBu?=
 =?utf-8?B?aW41RVJ5WlNGNjcvOW1HY3BSUFYzTFV6UDJsTDNKL0w2dmQyMU56OEdldUFR?=
 =?utf-8?B?UDBWZ0VyZXBrVHp1UnA5Wm9GY0ZRbkk0OXFrL3BzeDIyV1NwK1EyZytaZE1p?=
 =?utf-8?B?MFZRYTlkU0RhNkdWYTBHZElCT0tEZ3U1KzVKdWFRNUM3VDVjekozRHhBUCtQ?=
 =?utf-8?B?ZFA1ZkpwVnowRjRnTTl4Ylc4eE1VRDZrbEtKM1hzZWczWXYzMElJZ3h6T2M3?=
 =?utf-8?B?SWIyODhvRitDYlB1VlAyMWVZK1VPajhJZlZzK1g2QkRLNnFrTEVOK3hzZWdo?=
 =?utf-8?B?ckdic2xKbDI3am01TndKeWZEeWhqRWpUVjljSFJNaWtwdDc1b0E5eGoyVDlp?=
 =?utf-8?B?aWplWko2RFU5dTNCU2tTWnp5Qm5JOG1uYlI4eGM1My9mc2RKK0NlSXVKWlpl?=
 =?utf-8?B?clY4c082WHdDZXNjeFRGaStlbFlqaTQ4QkVQZDdTZTBERDlXWUtNMjFOT3E4?=
 =?utf-8?B?ZzBJQ2xjVWNVbmEvRVp3NGRvd29hdTdUYkF5WWJrMWVjbDlXakdQQU12YVYx?=
 =?utf-8?B?N1hGaWhHZ2M5Q0hXc1JFZGtXOHJmVTBJczMvLzZIc1BES3Z3VDZHdU5rOHNs?=
 =?utf-8?B?c0VSZlR3NnBFNERrMm5LWHVDZUtpQVVLMkNNWExkTE5Qeit6UkJZVzV5bmJT?=
 =?utf-8?B?ZC80T2xBVzRjeHhwS3pFaXpGSExHQ3VBT284UUZJaGY5M2tXc1BodFNvNUFG?=
 =?utf-8?B?Vmk3OU1MOFI4MDBsVy9OUmtrMU5qR1Vic0hkWE40OXI4N2l4aGgvekoydEhN?=
 =?utf-8?B?WTRUazFKMXZCb0QybEl1NVQ2TU12L2RmS2ZHbG9IWDVmdlpIUm1GM3hQbko3?=
 =?utf-8?B?aTJoaEloTWllbFhGNkRWeGc0S1l6Vk9zbHNBR1FMTEJOTGkxZVgzSzVhWmJF?=
 =?utf-8?B?c2F5bTg1SkYza2lzbUQ0NmFmNGxJdWgxZFJyTzZLV1dnbUZ5WC9LUGdzb1JF?=
 =?utf-8?B?TndoS3EySlZZTjNxQksxam1kQnQ2cjV2d2xrOVArcEFPOXpNMGNvWkM5NDRZ?=
 =?utf-8?B?YjdEZFJMTEFMcUV6OEJSZlBEendBbkxNYUNqNEVpRTloWVcwWlU5TTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZOR1B0cjU1V25TRzI2c1R5TDhOQUkveWVDOU9wZWJJanpaQzE3Ui92OVJo?=
 =?utf-8?B?OHVpajArMnNqcGtsTjNxcFNKVW4yWTlHamJTSjRZajhoZDBDWWtHZFpMUnYw?=
 =?utf-8?B?TDl5enR5TG02LzNKdk1BMzMwb0tXZS8vYUYweFNYanYyVGpaR3lHNjFjOXVj?=
 =?utf-8?B?TXg4YXAxbzJiVnA1Q1RVNDEyMHNRdmJQRHd3NDJ2RVRhOFZWcWdNZWNsalo0?=
 =?utf-8?B?SzN5bW02aDNMNXBCVUJFT0k0dlIyd3F3WDYxWjNYK3pLY1ZZQnEzNFhRNHAx?=
 =?utf-8?B?TW4yNVMyVnRsK3R0ZUh3Smtlb1Vnc0h2a0hvcWYxU25kMU9rTEVMSXB2RXN1?=
 =?utf-8?B?MXRaR3orUDB0MXpxMEtLbWovYnNVVzRsZUp6ek5TbCsxaW83SW04dSt5L3dQ?=
 =?utf-8?B?emNSV0ZWMjE1M0JsYUNkcUw4Vmd3YzkwV3pqSWw4QTNvZzF2Ui9wMUxZMGp5?=
 =?utf-8?B?Z0ZaYUh1UDRreVRFUDZUOFpPcnl4SGJhVjluVXNNVXZVejVvME03VFREdnNa?=
 =?utf-8?B?UWVNbWE3N05MbEJ1alM4OWRFaXdZZGlkR3VHOER5a05BUUpPMml5UG1RR0k2?=
 =?utf-8?B?eVlhalJQNnQwZ0JLRC84NTR6TEl4SWN2SXAxSmRlQzFqZVZRQk54VTJlTnFK?=
 =?utf-8?B?c3hxZ3N1MEdyM2Z4c2xkeHg3ZjB3WDYrais3cHhiRmRwM1hNRVQxMWNWR0Rt?=
 =?utf-8?B?bXlFU09xdmhSSEtTY3Q0RE9mQkZPRHdoNUt0ZDkrNytTVWdhWFo2Qi82Mzly?=
 =?utf-8?B?TnRPY1piVVlMQzR5OWVUaHlJanhIUUhHb1h6U2VsRzNST2MrUXc4bUppWmd2?=
 =?utf-8?B?cHByVk5tQTc1bm1nd0hqVHdRb2JlY1duUWlwblVTNEVWNmkrRDlkeUN1VFNu?=
 =?utf-8?B?WUVFUlAxekxjWU05UUk0cUZMZmN2T0xDdmcvZXF3RnVIRm9OSGtxOFExUHNU?=
 =?utf-8?B?QThIVGpCdGQxZSt5cnUrMHhKTFl5RmVwc3lyOXpNWG5DQm9aUXlzRjVGSWkr?=
 =?utf-8?B?d3JrWUJHY0pLSWZ5N3FkbjZoUEZVWkF6Rk9JaWgyb0xkSTlCdDJjRTlvby9u?=
 =?utf-8?B?eklWR3lXZThKMi9PYlV1cER2Qi9QcUZKRXFZQ0FITUZxVUNkbjBUUE9xNEs0?=
 =?utf-8?B?TjBKWlZUMU51NTdDM1MrOXRndE5XMDkrSTlyZjV0R3dVQWsvL1NSWDBHaGZO?=
 =?utf-8?B?cE1xSE1oNWFtaGF3Sm02cXQ2SHNVUmJ2N2dRNTE4SkluRmRJYndIWlpnbUE2?=
 =?utf-8?B?K25Oa1BJMUp0QWg5U3dMV1VkKzNHS3ZIak1mV3d2eW9iZ3BocFJITzNDd1g3?=
 =?utf-8?B?emd4MHo1MWZJaDFmWnVsZzBnbDVuZlVab3dKdnJnVVVXM1lIMFBlQjVsOFRW?=
 =?utf-8?B?TE1IUlV1RDlHdEQyV2xIcHQ1ejdCWm0zMHhnTi9NcHFtWHp1MlR5SzRMR3M2?=
 =?utf-8?B?elNNbmxlN2NncDBCd1dZTlFlNjc4cjYvcENSNkVISXZnL1pGRllGQjZ3WHJi?=
 =?utf-8?B?R0I3aWtyamNxRUR2L0ZxalFEOUV5RHlzMGVTUm1yUFdYVGRVbjJ0K0N4OFJN?=
 =?utf-8?B?cVV5aWdsMlJxc21HRmR5a0tFTXVTeFEzL3Y1Tk9IajNySEJwYlhpUlBNaFdV?=
 =?utf-8?B?MFpVMTN6akFNZlkrSERidWRYZ1ZEOG5ZVllqK2lNelpueGFLQS9vYjRQUHRJ?=
 =?utf-8?B?YUVWc3pyTmNsNStGRVQ0UFpDZWZ1V3owRDJqWC82ZGhFUkxaNktyZjJUWGpV?=
 =?utf-8?B?RlVEelJvVDZoMEl0blZQWktyUW5LQlJNQUZmUlJUbnJDYVlDWUFVZXRMbzFH?=
 =?utf-8?B?RE1BOGJmdjBCWkY1RGhidXFXUS9RNmtGd2l0ODk5Zi90SC8rM3RYY2pQTmxy?=
 =?utf-8?B?VEZ5OWhsbmY3SCtyOWdPcTkxc2k5N0kzY09Fc250OFkweDdUNkFKbGhOR1Zw?=
 =?utf-8?B?ckpUSm13OTZUc01QU29ZY1NiSTB5a1dGUEp2NFNvSjlOWTNYaDJSSVJLZlVu?=
 =?utf-8?B?TUQxSTRuVXVHWnBiQjJKK29KZStGZzBINnk0M1ZIaFQ5WVJOdW5NeDBFZXFT?=
 =?utf-8?B?TnozNXZpRlg1NGdqaEQ4d1ZoamhBb0IzSU9xZEhOeVVSdXZSUE93Zlh0VVFu?=
 =?utf-8?B?a3ZqNE56YWJ5dkZrb3BNNWh5NTg5YkQ4Rlc5aTgzOGNFRTdxeWVjTG56cExL?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c110dd5d-96fd-44c7-8f33-08dc6345e3a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 03:31:40.4264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHjImImQDxC8vWs0PIGgvAayIdGxJc6A8a74evQ8uFXj58jtFiHlN+bjMxoofDSv2a7zI2F0GG7OmVo0KoIgICvmP0iUfrppmJVwjVjXgFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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


On 4/22/2024 12:13 AM, Zbigniew Kempczyński wrote:
> On Fri, Apr 19, 2024 at 08:36:17PM -0700, Akshata Jahagirdar wrote:
>> In Xe2+ platforms,we need to run this test regardless of the status of flat-ccs.
>> Check if the platform supports compression and has flat ccs enabled, and if it
>> doesn't, then update the checks accordingly and proceed with the test.
>>
>> Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying
>> from VRAM -> sysmem the KMD uses mapping with uncompressed PAT so the copy
>> in system memory is guaranteed to be uncompressed. When restoring such buffers
>> from sysmem -> VRAM the KMD can't easily know which pages were originally
>> compressed, so we always use uncompressed -> uncompressed here. so this means
>> there's no need for extra CCS storage on such platforms.
>> Thats why we shouldn't need to run suspend-resume on xe2 dgpu.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 40 +++++++++++++++++++++++++++++++++-------
>>   1 file changed, 33 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index b3bf97af7..7b6cf231e 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -114,10 +114,11 @@ static void surf_copy(int xe,
>>   	uint32_t sysmem = system_memory(xe);
>>   	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
>>   	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
>> +	uint32_t devid = intel_get_drm_devid(xe);
>>   	int result;
>>   
>>   	igt_assert(mid->compression);
>> -	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
>> +	if (AT_LEAST_GEN(devid, 20) && mid->compression) {
>>   		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>>   		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>>   	}
>> @@ -162,8 +163,24 @@ static void surf_copy(int xe,
>>   						      (void *)mid->ptr, mid->size);
>>   
>>   		munmap(ccsmap2, ccssize);
>> -		igt_assert(!strcmp(orig, newsum));
>> -		igt_assert(!strcmp(orig2, newsum2));
>> +		if (blt_platform_has_flat_ccs_enabled(xe)) {
>> +			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
>> +				igt_assert(!strcmp(orig, newsum));
>> +				igt_assert(!strcmp(orig2, newsum2));
>> +			} else if (AT_LEAST_GEN(devid, 20)) {
>> +				if (is_intel_dgfx(xe)) {
>> +					/* buffer object would become
>> +					 * uncompressed in xe2+ dgfx
>> +					 */
>> +					igt_assert(!blt_surface_is_compressed(xe, ctx,
>> +							NULL, ahnd, mid));
>> +				} else {
>> +					/* ccs should be present in xe2+ igfx */
>> +					igt_assert(blt_surface_is_compressed(xe, ctx,
>> +							NULL, ahnd, mid));
>> +				}
>> +			}
>> +		}
>>   		g_free(orig);
>>   		g_free(orig2);
>>   		g_free(newsum);
>> @@ -193,10 +210,18 @@ static void surf_copy(int xe,
>>   	intel_ctx_xe_sync(ctx, true);
>>   	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>>   	result = memcmp(src->ptr, dst->ptr, src->size);
>> -	igt_assert(result != 0);
>> +	if (!blt_platform_has_flat_ccs_enabled(xe))
>> +		igt_assert(result != 0);
> Why there's negation? If platorm has no flat ccs that means we have no
> compression and src will equal dst.
Oh yes, Thank you so much for catching this! Will update it.
Akshata
>>   
>> -	/* retrieve back ccs */
>> -	memcpy(ccsmap, ccscopy, ccssize);
>> +	/* In case of suspend_resume, buffer object would become
>> +	 * uncompressed in xe2+ dgfx, and therefore retrieve the
>> +	 * ccs by copying 0 to ccsmap
>> +	 */
>> +	if (suspend_resume && AT_LEAST_GEN(devid, 20) && is_intel_dgfx(xe))
>> +		memset(ccsmap, 0, ccssize);
>> +	else
>> +		/* retrieve back ccs */
>> +		memcpy(ccsmap, ccscopy, ccssize);
>>   	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
>>   
>>   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
>> @@ -365,7 +390,8 @@ static void block_copy(int xe,
>>   	 * occurs and ctrl surface will be filled with some not-zeroed values.
>>   	 */
>>   	if (mid->compression && FROM_EXP_WH(width, height))
>> -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>> +		if (!blt_platform_has_flat_ccs_enabled(xe))
>> +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> Same here, we should check if surface is compressed when platform
> has flat ccs turned on.
>
> --
> Zbigniew

Will update this too, Thanks
Akshata

>
>>   
>>   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>>   
>> -- 
>> 2.34.1
>>
