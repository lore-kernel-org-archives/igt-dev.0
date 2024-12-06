Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103FDE77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD70410F1C3;
	Fri,  6 Dec 2024 22:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOW1JMmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4110F1C3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 22:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733523744; x=1765059744;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WMhK7sLFkw1Xrr8Nyw3mHoT4jANbi4qOhMKzPlvNpyE=;
 b=aOW1JMmBjDf555R8ERJaxS0CHOBwmwFg2a1JrVSMS2+JXdgvMnKUc8Nx
 WEaich6Rms2oMJbrUpNGdg9CJ3aeVzVLPkLJ09XNQfEm1pd/FzPx5+DH5
 kQUZCmw1sVzTuCBUQ90x6wEi79hK4xBhBmwLzn7hSHXv4ALzCzO/+0LGW
 d/g0muWgCOJuDgAizFpFwVnbQc9IQPuGqzosKSP64aePK9NZriVT+85o+
 355V0TIeJ6FHesRf4cnQMjwLMQCFfvgmzt3SWbBsFWp8P1/YZnd7236Or
 /XJ/ftfOjRfACVnOmoPHX7F5/YgTLNBQaRTAMpCKHLyiTMGSqmZt21B0K Q==;
X-CSE-ConnectionGUID: DEg0qxlTSGmFsA0b4X2g/A==
X-CSE-MsgGUID: X8GPfTQjS/yuMjSHSkJgPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34028732"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="34028732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 14:22:24 -0800
X-CSE-ConnectionGUID: KubprVExRIGTxym08XqmPA==
X-CSE-MsgGUID: vO0+PPZ6RES36guiOcGoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="98972530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 14:22:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 14:22:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 14:22:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 14:22:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx4TbHczKQhiFgV/EoTvvvl/6vsYS0wifIqOFna8nabY0KQfj7Qn5TIxDKhsTZisi/NGLgNyXaVCcBREWQxcXaYaDt5wxmUFwDb+hUyt90reRbgAlUEfZ50my4PXF2fId4Rwavfqx/duOXASsjlKMlz+u61YrkFgsV5jdX+0w+oCZA7vLn39yjldGPxqXdwCYlfSBxWsiodFeD/ThWiXzEc9+9oxOyKs9oHqPNbtFOddJMPKRvquH5O4YpLM2xv3i+pKcH0ijZ6kDHqXTOFneUtEkA075hlkfbfnycTuEnya6bD5fZa4hZyQgisxVFKolQiwzUOlihnI2sZQkYc58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwuzo6h8L/AyqzSTKjrRshBVqbtfWLDENjxs+yNNm3k=;
 b=i7XLwsIZ84kAWo5x6w2U5i2ea8MxLLnqtOEBPwKsV+RX6qBjjao3O2snQrXDpa1qoUGsl1zSwMenqqRTgcrkGhbn4ndJETgCm4pFi0t4N0dQm2ODdB0FO2IlrHK6tKwKNPm8GlTwCJaQJaRLPdGKq4vdCyCgoo0XIh3+txCITYKMJHlozOSsLZkbTO4bL+EPi7UYliMj9EewDvf1ehuUn/uEp/q6ykBkSgNv5e/4oFQP/NRtvRcQqsTCWZwtLvh+9zCvN/79RO0ACfasyv0O3aEqMakXC6inoelwhVjhKg4CI/nh3Zav0E/HJsrL4TobsU51oSbXEQAe1x9CQpZAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 22:21:51 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 22:21:51 +0000
Message-ID: <feeb9f34-9b8b-443b-9313-ac564e0f7f8c@intel.com>
Date: Fri, 6 Dec 2024 17:21:49 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fexec=5Fcapture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev7=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20241206175339.439177-1-zhanjun.dong@intel.com>
 <173352178326.3465139.18360890871806257826@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173352178326.3465139.18360890871806257826@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|BL1PR11MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 6741da91-4286-43d4-3132-08dd1644619e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUI4cHpqTlBDQjltVkY1YkQ3cmNkeVFlNkF2RnMvQ3ZocEp0ZHVDd1hWN3pu?=
 =?utf-8?B?T1pCdGEvc0kwQStDZ3d6UXZ4ZTVlQWxldDZZbnBYNTRWLzV1TWdnelN3SFYx?=
 =?utf-8?B?cjJ2K0dCZWE2Vnl5TnY3emVoNjlpS3phV2dJUWhMc3JlQ2trRFpwWXMvY2RN?=
 =?utf-8?B?TjNha0hvVXlKbzhTc2wvNWp6MDA1Mm1OR3E3ZmRwZG5hTXhlRkg0MDZOeDNl?=
 =?utf-8?B?SStuRFlQdU16aWlyeHVJQVMrN3ZlMjdpZVhHY0RtVk1KN3daMHlZb2xQQUhl?=
 =?utf-8?B?UHV6OFZMYkkxWGh4UmpaOWVjYUEzYXkyWW4yekRzM2NYaTNGK1NRYW5BRFJn?=
 =?utf-8?B?NEFWaXRubEZlSjczc2ZqMUtQZzZMbEE2RWVjS29hZnphOC9Udzd4Nm12Z0dV?=
 =?utf-8?B?K2RTTTFPU0hXR0EzZWVTZVZZVS9CUi84bTRoOEdhaFE1WGFJcEwxVitRNzdU?=
 =?utf-8?B?RnZqZnZqQW0wWjNGZTRWSm5UOUpycmpSZnBSTFhkcHY4R0Q2MWN6QkVkUVZW?=
 =?utf-8?B?VGs1SmhDUGU2U3BTNlg0MGZrN3djZStmYVNub0ZIZHMwdnlyOTFkNWxsc3BX?=
 =?utf-8?B?NUdPa2thcHM3enY0NVBtK0xKNjdENkxlR1hsYzNCWkRCTG4zZWJIS29LWDVm?=
 =?utf-8?B?V1drYTdHUnRoL1RsVy9EcDY5aGJlV0J6bmZZMEhiZldpN3JXZC9wZGFNZ1U1?=
 =?utf-8?B?Uk80WkkrcElSM2IrUDkxa3pWQ0liVGplV2JCNkJpdkQvT1l1VDladHlXZGFj?=
 =?utf-8?B?VXE1SnB5V1N5OFFQOXdlREE4YXpDcXFQYUhwalZBaGtPY0dVVTVmclMwYTZa?=
 =?utf-8?B?ZWpKdjk3R2w5VGdTOVA3dzVqaWd6RXYwYzBNYmtIQlJvZ0MwdCt2L0wwY2RX?=
 =?utf-8?B?QlkwSnZNQ0U3QThUdkFyVDRaNndTYlk1Z01LVFNJc3h5bWo4a2lPV25mZzEw?=
 =?utf-8?B?ZzFWTmhseUhRWHRKZmJvc0dJU29DLzJkblRvWk5QWWdrQWp3OE44RFZBaUU3?=
 =?utf-8?B?U083b0FzeDB3YzlVaG82Y1orSEpoVTBDeFpIcXV6R0pnam1MQjRhL0x5bFZh?=
 =?utf-8?B?YU5CeDFkRTVhVDNtRXBDV2xOTGN1MjVBWHVhMjJZbEl3Zm91dHdUZ0xhOFl5?=
 =?utf-8?B?Vy9PUHF6OElUaDM2VHBnam5jWkF1dm5JYzUxbVQwVWx6OW1scFlDSERoMTVN?=
 =?utf-8?B?N2duR3YwVXc3VkwySjlETFpqRWFNVXlUUWlCMWNzQlJIUXM1bnkwanNNTUlh?=
 =?utf-8?B?KytiejAwZFhUdmtEdzlSR3BiaXlMblg0ejh5azRvL2hwNkt1S2dpemxRNmlG?=
 =?utf-8?B?bUs3Z3R6bW1rRDMzeDdsNVVFaWk2bWgvWXArWThkYUJVTGhHeXhPN0srWnh5?=
 =?utf-8?B?WndOajJhdWVocHMxaVVhZ2daR3dVRHhXOVN5TVZqb2RwT1htN2loalhJWDVG?=
 =?utf-8?B?eXZYVFFIUnZJbjlMNHZQSWM3V0hkb3F6ZzBxRWdBcFI5dVgxdlg0Q05kT1p4?=
 =?utf-8?B?aUpiRVkwa2VjOWRZNUpRWGViOGQvRHlTVmMybVFMZEk3TTNTUFRrWHJHUTZk?=
 =?utf-8?B?OWNnc0RmV0R6M2NiTUI5Vk9LRFdaNEpSWnk3RlJCNlZqK210dE1oQjZENkV3?=
 =?utf-8?B?S0VvdDl0WlNGc3dzZzVuTmVKVFQ2WEdOK1N0bXpEREptcmtVMzhNSlVaa0lt?=
 =?utf-8?B?c1BCaEdFSyt1Z3BWQkJ2Zk5tOVd1SklsMFgrTjZxRFpDMDlYTytpY2xXc3Rh?=
 =?utf-8?Q?5FYQtgpM7PIClrqWk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNHeFd6NEs3YmF0L2hxSm5nNVVvVEdUQ2xGNDNNcGQ3VjFiWUhrbjlYOUxy?=
 =?utf-8?B?ay9icnpDSWxNSkhpQyt3SGFoQWlLbWFUZTdqMHB3S3BSUjBIOExDQUN4azI3?=
 =?utf-8?B?Tk9tUkJoZGJ3UktmK3pVd2tYNnYvdjlUdmFaaGd4dVFQWWZiakFVQ3lKYUh1?=
 =?utf-8?B?WXd1YXMzU2FwNitLTTB6bysrWGREQldFUVhhUUVCNUN1T1RCYTBKRFgvRjhK?=
 =?utf-8?B?bEROaUt1ZitEV0VlOGdTR2JFajgzc2krOWExRFBJQ3lVOGVhWWZhRUxEczQ1?=
 =?utf-8?B?eWdITmNsYnNnaHNYalJtKzh1U1U5S2FHdUVRaW1VTXY2R1VLYjA3RmF6VGIr?=
 =?utf-8?B?dHFBVUdBck1PZmlIWGpUdHQ3WkNDVjBhVFVyS2ZyTVFxQTkvSzIrNXFhRkpW?=
 =?utf-8?B?WFdTYmFDL1hPcEM4bWlZeXkydHRQNmJrZVBsMFA2NU5IMkI3ak95Mk9UR0dr?=
 =?utf-8?B?cWU3SW1vaCtaNXJ5ek5PMk40aXVsMUdEOGo0K1Y4YXp3a2gzUitqUENubkFJ?=
 =?utf-8?B?ZlFadVZZaGtTeExzU1FxK3JKMTNucmxRZkRWTHFlUnVDY2Y4VXZXZUFNVzNG?=
 =?utf-8?B?bW1xYXV5d0h6TWpKUUVoQWtENk1ZNVovMUhhVnQra0w1NWhQYTI3S1VHQUN0?=
 =?utf-8?B?UFhjenhnTTVTcUYvbTN0ZDFRMjA0ZkU1dVZFNjJzbDZzdEx6b2xEZFBjajJS?=
 =?utf-8?B?VUU3MnZVZlFjYnorRSszb3N5MzNNZnVGUCtzUnVWSWJYUnZOcktpMUpaN2xP?=
 =?utf-8?B?bVhXSVBuMklMV3BiMXo3QU9VN1c2MmhiWEZLMDUwU3IzcDV2N3ZDWEtqd1JD?=
 =?utf-8?B?akxtYVJxMG9qVjVxLzFtcmx1cE5QS0xQY3NScEs2WkJCaXV6bnNkM1hXRFZY?=
 =?utf-8?B?RUlPYWJHTGdGZWpwZVord3BmTU0vTFRFSW5vN2Y1TE5jSC91ekdMdkxaa0hH?=
 =?utf-8?B?dXduR1c1c2R3NVMvbi8vZUFVa1ozZ2kxN2ZOWnhyR2dQTGxvMU9lOGQ1QW5x?=
 =?utf-8?B?V1h3cnc3bFEwT09rMElHOWxlTzNKK0l3UjEvNkJzaGo5WGljSlBYV2ZBekVP?=
 =?utf-8?B?YWxZakF1MHE4WXdwMlhKRXBTTTRGanlTbEk0ZU1Cci9mWUhTOUJ0TjVlWHFG?=
 =?utf-8?B?ZnQ4a2ZUSVNEMWw2OGRHQTd0WGE0THdqNDkyc0FER2lEQ2t2cS8xaXpiQ3E2?=
 =?utf-8?B?V3ZEcEdrNGorTXlaekRJZlRFTFp3dDgwWHBMU2IzNTNsdElTTGlHc0Z6emlu?=
 =?utf-8?B?b0hOSUNoT0lFUTA4d243YndFRnVxV3cyblNLcDl0SEtDc00ydmV2Uk04cUFq?=
 =?utf-8?B?cXlER2FGTzNRcDN1MU0veXBTMzNCbkgyNU0rQ2pYSjF6WHhrM1RvSzVmSnNY?=
 =?utf-8?B?SS9HTU1QQXJiMks5ZjlSWi9XZWZkejNQb29pdW9EYzFJN2FQMDVYMTg0OE1G?=
 =?utf-8?B?QnZvY29uNGV2TmtiK1NIMlNuVU5KRzZDOHBteTk2cWM2RVpsYlVRT2I5WUVE?=
 =?utf-8?B?TTdIRUlUa2NPdFBLdHc2VDJVZ2ZubmFsMERLcVh1Z3JCK1FmYVU2dVRTZFg0?=
 =?utf-8?B?Z1J6TkpKaG10eVZXTjhxT3phT0Z0WEttK1A5Z3RzWXlFOG1uSWFzb0FIMkVE?=
 =?utf-8?B?NmxZTXV0bUVWRWNXWGh0eGJaMnBCVmJsdm0xRmsxMW9TTkdGTC91OC9BalFv?=
 =?utf-8?B?bXJTbWpxTkMxUUo2TmdEOWxqWjF2ZFQxdWRBY1pHZEFHcWhKSjkyU3dhM244?=
 =?utf-8?B?eTB3RFNEUDRkNjRCajM0K21mVDhrdWlwS3FLazBQcGNTalovSGRpT2c1VllK?=
 =?utf-8?B?VXA2YlFpTlIwbndXR09kT2JpaStPanlQMXFWMFZMTkJuK2ZuYnV5VmRaU0ZS?=
 =?utf-8?B?VUJFVUduVHJNMjNZS0RraFkvd21YZnd3UmRONnJnc1RWQjdzUSttbS9Rdkky?=
 =?utf-8?B?bFFjQU1ub2NiZ3hmUmhuYUV3b1FoUlBMenp5NUVRQ1ovWEh2UFFJeG9LUWdZ?=
 =?utf-8?B?MzVlb3RPWElBL2kzN1pFTmNBNHRURUlHZEp4dDdLLzBLcmxzc0V0bXdNY2ZI?=
 =?utf-8?B?bjd2OW9FeDVMbSttSzNxajhkRzd6ZVM0ZHBqM2JDTE9BMTc3NmRhcXA0OSt0?=
 =?utf-8?Q?zreKFNzywzgIo1jV+G71kDazM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6741da91-4286-43d4-3132-08dd1644619e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:21:51.0862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Epcud0ejTIgFSsyI636M/Joe+GD9qB1aI7Hg3TH7sDM9Ge/OucnJW0ZxMp6m/DD15ZXdy0/ajbPdTqVlEqttSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
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



On 2024-12-06 4:49 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_exec_capture: Add xe_exec_capture test (rev7)
> *URL:*	https://patchwork.freedesktop.org/series/140007/ <https:// 
> patchwork.freedesktop.org/series/140007/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8141_full -> XEIGTPW_12271_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12271_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12271_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12271_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_async_flips@crc-
>         atomic@pipe-a-hdmi-a-3.html>
>   *
> 
>     igt@kms_lease@lease-revoke@pipe-c-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@kms_lease@lease-revoke@pipe-c-
>         dp-2.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_lease@lease-
>         revoke@pipe-c-dp-2.html> +3 other tests dmesg-warn
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-41:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_pm_rpm@universal-
>         planes-dpms@plane-41.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-
>         move.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-
>         move.html> +1 other test fail
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_vblank@ts-continuation-
>         dpms-suspend.html> +2 other tests abort
>   *
> 
>     igt@xe_oa@buffer-fill:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_oa@buffer-
>         fill.html> +3 other tests dmesg-warn
> 
> 
>         Warnings
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-8/igt@xe_wedged@wedged-at-any-timeout.html>
> 
This patch add xe_exec_capture and not make changes on above igt test 
and igt lib code, all failures above are not related to this patch.

Regards,
Zhanjun Dong
> 
>     New tests
> 
> New tests have been introduced between XEIGT_8141_full and 
> XEIGTPW_12271_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@xe_exec_capture@reset:
>       o Statuses : 2 pass(s)
>       o Exec time: [39.87, 50.11] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12271_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@intel_hwmon@hwmon-
>         write.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1125>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (Intel XE#1466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-
>         tiled-small-legacy.html> (Intel XE#2233 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2233>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_async_flips@async-flip-
>         with-page-flip-events-atomic.html> (Intel XE#3719 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3719>) +3 other
>         tests fail
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-
>     linear:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>   *
> 
>     igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_async_flips@crc-
>         atomic@pipe-c-dp-2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +38 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@test-cursor:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_async_flips@test-
>         cursor.html> (Intel XE#664 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/664>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +6 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-0:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-lnl-8/
>         igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#1725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-
>         size-offset-overflow.html> (Intel XE#1477 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +13 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +13 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-
>         displays-2160x1440p.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_bw@connected-
>         linear-tiling-2-displays-2160x1440p.html> (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_bw@connected-linear-
>         tiling-3-displays-3840x2160p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_bw@connected-linear-
>         tiling-4-displays-2560x1440p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +1 other test
>         skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_bw@connected-linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_bw@linear-tiling-3-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_bw@linear-tiling-4-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html> (Intel XE#3433
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +30 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-
>         basic-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +22 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +22 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_cdclk@mode-transition-
>         all-outputs.html> (Intel XE#2724 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_cdclk@mode-
>         transition@pipe-b-edp-1.html> (Intel XE#314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_chamelium_frames@hdmi-
>         aspect-ratio.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +14 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_chamelium_hpd@dp-
>         hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/373>) +16 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_content_protection@dp-
>         mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/307>) +1 other test skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_content_protection@dp-
>         mst-type-1.html> (Intel XE#2390 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2390>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1 other test
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/
>         igt@kms_content_protection@legacy.html> (Intel XE#3278 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_content_protection@lic-
>         type-0@pipe-a-dp-2.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         offscreen-32x10.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +4 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_cursor_crc@cursor-
>         random-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@kms_cursor_crc@cursor-
>         rapid-movement-max-size.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +6 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +3 other tests incomplete
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-
>         vs-cursor-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +7 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-
>         modeset-vs-cursor-atomic.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-
>         atomic.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_cursor_legacy@basic-
>         busy-flip-before-cursor-legacy.html> (Intel XE#2286 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_cursor_legacy@cursora-
>         vs-flipb-toggle.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-
>         ioctl@a-dp-2.html> (Intel XE#2141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2141>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (Intel XE#1508 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_display_modes@mst-
>         extended-mode-negative.html> (Intel XE#2323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2323>)
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-
>         fallback.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-
>         fallback.html> (Intel XE#3070 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3070>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#2244 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1 other test
>         skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#2244 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1 other test
>         skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html>
>         (Intel XE#1695 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1695>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-7/igt@kms_feature_discovery@display-2x.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/
>         shard-bmg-4/igt@kms_feature_discovery@display-2x.html> (Intel
>         XE#2373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/
>         igt@kms_feature_discovery@psr1.html> (Intel XE#2374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_flip@2x-flip-vs-
>         blocking-wf-vblank.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +2
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-
>         interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +6 other
>         tests skip
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb-
>         interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-
>         interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@a-dp2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_flip@blocking-
>         wf_vblank@a-dp2.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible:
> 
>       o shard-lnl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_flip@bo-too-big-
>         interruptible.html> (Intel XE#1504 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1504>) +1 other test
>         timeout
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1 other test
>         fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-dp2.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_flip@flip-vs-
>         expired-vblank-interruptible@b-dp2.html> (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_flip@flip-vs-
>         suspend.html> (Intel XE#3673 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3673>) +5 other tests abort
>   *
> 
>     igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-
>         interruptible@d-hdmi-a3.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-7/
>         igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +64 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-
>         edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-
>         edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-8/igt@kms_flip@wf_vblank-ts-
>         check.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2705> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +6 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> (Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +8 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1401> / Intel XE#1745 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +8 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2333 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2333>) +12 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +34 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#1469 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#2352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-suspend.html> (Intel XE#2050
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +27 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +55 other tests skip
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_hdr@static-swap.html>
>         (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1503>)
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1503>) +1 other test skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_joiner@invalid-modeset-
>         force-ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_plane@pixel-format-source-clamping:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_plane@pixel-
>         format-source-clamping.html> (Intel XE#1035 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel
>         XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2566> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_plane_lowres@tiling-none:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_plane_lowres@tiling-none.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html>
>         (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/599>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-unity-scaling@pipe-c.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +15
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-5@pipe-b.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +14
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_pm_backlight@basic-
>         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-
>         simulation.html> (Intel XE#736 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/736>)
>   *
> 
>     igt@kms_pm_rpm@drm-resources-equal:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_pm_rpm@drm-
>         resources-equal.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html>
>         (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3184>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-
>         stress-no-wait.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
>         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3141> / Intel XE#836 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_pm_rpm@modeset-non-
>         lpsp-stress.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
>         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>   *
> 
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-
>         wait.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-
>         extra-wait.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2864 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2864> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_pm_rpm@universal-
>         planes-dpms.html> (Intel XE#2042 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-
>         plane-update-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +6 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-
>         move-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +12 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1128>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_psr2_su@page_flip-
>         p010.html> (Intel XE#2387 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2387>)
>   *
> 
>     igt@kms_psr@pr-cursor-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_psr@pr-cursor-plane-
>         onoff.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +4 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-page-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_psr@psr2-primary-page-
>         flip.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +21 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_psr@psr2-primary-
>         render.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-180.html> (Intel XE#2330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-180.html> (Intel XE#1127 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +4 other
>         tests skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_rotation_crc@sprite-
>         rotation-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +2 other
>         tests skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_scaling_modes@scaling-
>         mode-full-aspect.html> (Intel XE#2413 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) +1 other test
>         skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_tv_load_detect@load-
>         detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/330>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_tv_load_detect@load-
>         detect.html> (Intel XE#2450 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2450>)
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-rpm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-
>         rpm.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-
>         rpm.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_vblank@wait-busy-hang:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12271/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +18 other tests dmesg-fail
>   *
> 
>     igt@kms_vblank@wait-idle-hang@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-3/igt@kms_vblank@wait-idle-
>         hang@pipe-a-dp-2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +11 other
>         tests dmesg-fail
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@kms_vrr@lobf.html> (Intel
>         XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_vrr@lobf.html> (Intel
>         XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_vrr@negative-basic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-
>         virtual.html> (Intel XE#1499 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1499>) +2 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@kms_writeback@writeback-
>         check-output-xrgb2101010.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@kms_writeback@writeback-
>         pixel-formats.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@sriov_basic@enable-vfs-
>         bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_eudebug@basic-connect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@xe_eudebug@basic-
>         connect.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) +12 other tests skip
>   *
> 
>     igt@xe_eudebug@discovery-empty:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@xe_eudebug@discovery-
>         empty.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +11 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-small:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@xe_evict@evict-beng-cm-
>         threads-small.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +15 other
>         tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@xe_evict@evict-beng-mixed-
>         many-threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large:
> 
>       o shard-bmg: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_evict@evict-mixed-
>         threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>         XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@xe_exec_basic@multigpu-no-
>         exec-bindexecqueue-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +10 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@xe_exec_basic@multigpu-no-
>         exec-bindexecqueue-userptr-invalidate.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +8
>         other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-cm-userptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-7/igt@xe_exec_threads@threads-cm-
>         userptr.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_exec_threads@threads-cm-
>         userptr.html> (Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-
>         function-xe_ggtt_init_early.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_ggtt_init_early.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-7/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_sriov_init.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-3/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_uc_fw_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-7/igt@xe_fault_injection@vm-
>         create-fail-xe_exec_queue_create_bind.html> (Intel XE#3467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@xe_media_fill@media-
>         fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/560>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-1/igt@xe_media_fill@media-
>         fill.html> (Intel XE#2459 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2459> / Intel XE#2596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@xe_mmap@small-bar.html>
>         (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/512>)
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_oa@oa-tlb-
>         invalidate.html> (Intel XE#2248 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1420> / Intel XE#2838 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-3/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1420>)
>   *
> 
>     igt@xe_pm@d3hot-mmap-system:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@xe_pm@d3hot-mmap-system.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/
>         shard-bmg-3/igt@xe_pm@d3hot-mmap-system.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +4 other tests dmesg-warn
>   *
> 
>     igt@xe_pm@d3hot-mmap-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1948>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-8/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#3673 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3673>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>) +2 other tests skip
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-
>         exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1358> / Intel XE#1616 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1616>)
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@xe_pm@s3-basic.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@xe_pm@s3-basic.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@xe_pm@s3-basic-exec.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@xe_pm@s3-basic-exec.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-5/igt@xe_pm@s3-vm-bind-
>         prefetch.html> (Intel XE#584 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/584>)
>   *
> 
>     igt@xe_pm@s4-d3cold-basic-exec:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@xe_pm@s4-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-lnl-7/igt@xe_query@multigpu-query-
>         invalid-size.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +6 other tests
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-mem-usage:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-8/igt@xe_query@multigpu-query-
>         mem-usage.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>) +6 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_getclient:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@core_getclient.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-3/igt@core_getclient.html> +46 other tests pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-
>         stride-32bpp-rotate-0.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html>
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-
>         atomic-transitions.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-
>         transitions.html> +4 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-
>         varying-size.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         +11 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-1/igt@kms_flip@2x-flip-vs-
>         wf_vblank.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-3/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-lnl-7/igt@kms_flip@flip-vs-
>         absolute-wf_vblank.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-5/igt@kms_flip@flip-vs-suspend-
>         interruptible.html> +2 other tests pass
>   *
> 
>     igt@kms_lease@lease-unleased-connector@pipe-c-dp-2:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@kms_lease@lease-unleased-
>         connector@pipe-c-dp-2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-4/igt@kms_lease@lease-unleased-connector@pipe-c-dp-2.html>
>         +84 other tests pass
>   *
> 
>     igt@kms_plane_lowres@tiling-x:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-5/
>         igt@kms_plane_lowres@tiling-x.html>
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-
>         unity-scaling-with-pixel-format.html> (Intel XE#2566 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2566> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-
>         unity-scaling-with-pixel-format.html>
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/
>         shard-lnl-7/igt@kms_pm_dc@dc5-psr.html>
>   *
> 
>     igt@kms_pm_rpm@cursor:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_pm_rpm@cursor.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-4/
>         igt@kms_pm_rpm@cursor.html>
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@kms_setmode@invalid-clone-single-
>         crtc.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1435>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12271/shard-bmg-1/igt@kms_setmode@invalid-
>         clone-single-crtc.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-lnl-7/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html> (Intel XE#899 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>   *
> 
>     igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@xe_exec_balancer@twice-cm-virtual-
>         userptr-invalidate-race.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-1/igt@xe_exec_balancer@twice-cm-
>         virtual-userptr-invalidate-race.html>
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-8/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_tile_init_early.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-8/igt@xe_fault_injection@inject-fault-
>         probe-function-xe_tile_init_early.html>
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> +1 other test pass
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468> / Intel XE#569 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@xe_pm@s3-vm-bind-unbind-all.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-5/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2280> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-7/igt@xe_pm@s4-vm-
>         bind-unbind-all.html>
>   *
> 
>     igt@xe_prime_self_import@reimport-vs-gem_close-race:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@xe_prime_self_import@reimport-vs-
>         gem_close-race.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@xe_prime_self_import@reimport-vs-gem_close-race.html>
>         +2 other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-180:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_big_fb@linear-8bpp-
>         rotate-180.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-3/
>         igt@kms_big_fb@linear-8bpp-rotate-180.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-
>         flip-atomic.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-
>         hdmi-a-3.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-3/
>         igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html> (Intel
>         XE#2141 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2141>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-
>         interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-
>         interruptible.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-4/igt@kms_flip@2x-
>         plain-flip-fb-recreate.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-cur-indfb-move.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-cur-indfb-draw-blt.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-
>         draw-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2333>) +8 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-spr-indfb-draw-blt.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-
>         draw-blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +3 other tests dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-spr-indfb-fullscreen.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2333 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2333>) +4 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-shrfb-pgflip-blt.html> (Intel XE#2333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-spr-indfb-draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         draw-render.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test
>         dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         primscrn-shrfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-
>         plflip-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-cur-indfb-draw-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-
>         draw-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-
>         scndscrn-shrfb-pgflip-blt.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +10 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-1/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-4/igt@xe_evict@evict-beng-
>         threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-5/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1000>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12271/shard-bmg-5/igt@xe_evict@evict-threads-
>         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473> / Intel XE#2472 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>   *
> 
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-
>         userptr-invalidate.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-1/
>         igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-
>         vm_bind_ioctl_ops_create.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-4/igt@xe_fault_injection@vm-bind-fail-
>         vm_bind_ioctl_ops_create.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>)
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8141/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-
>         xe_vma_ops_alloc.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/shard-
>         bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html>
>         (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-7/igt@xe_pm@s2idle-exec-after.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468> / Intel XE#3673 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3673>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_12271/shard-bmg-8/
>         igt@xe_pm@s2idle-exec-after.html> (Intel XE#3673 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3673>) +1 other test
>         abort
>   *
> 
>     igt@xe_pm@s2idle-mocs:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-3/igt@xe_pm@s2idle-mocs.html> (Intel XE#3673
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>) ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12271/
>         shard-bmg-7/igt@xe_pm@s2idle-mocs.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel
>         XE#3673 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8141/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1616>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12271/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-
>         all.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1616> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> 
> 
>     Build changes
> 
>   * IGT: IGT_8141 -> IGTPW_12271
>   * Linux: xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422 ->
>     xe-2335-261a0301bda5af29477bd710465a8886e8609a4d
> 
> IGTPW_12271: cedc5aa23c601995e871c7fc19f77c987bf3638b @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2331-e57b4b7cd137e0ae00d2601b4b55ab7f504da422: 
> e57b4b7cd137e0ae00d2601b4b55ab7f504da422
> xe-2335-261a0301bda5af29477bd710465a8886e8609a4d: 
> 261a0301bda5af29477bd710465a8886e8609a4d
> 

