Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F295C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0A210E870;
	Thu, 20 Jun 2024 23:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaPDRzt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE110E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718926734; x=1750462734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3knbKN5K+RGhEON4+tk2QRteCVcql70bn/YFTedMmJ8=;
 b=JaPDRzt7860YiBLIvzCyZt6k/HTYVCgvzijZ1Ih9f6/D9wgRLmNvNKRI
 2pu/i2tO9cs9x8FhYI9gzbd1Lqi1qA3cEXrP3n5ZnmuFwAJZ0hcET9OcH
 pyKW+9LHDUJI0sSMgrvxg4B+R/+TpZ7u2PI1WDep5C+/tQfTjqZJeFchx
 zp7G1f8TGKUomMF+X+9bFULgA58RHNHIUDG2KLLrwiwyix7EnF5jEdBa8
 O60v+hxUoC/gyx46EkVfSDCDgr0PVsA8a4uKkdJUIiZibiPuA2lW4qzOd
 OyKu8Xl3kaHGuW9aL6MhFsv7t7WiaKdEUiSvwlF9Ah0LY5ClzO1HOni+2 A==;
X-CSE-ConnectionGUID: 3f4jDMk8SMKcnbCGQEvi1A==
X-CSE-MsgGUID: Ux+tC1V3R8KhRSbvrTPISw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16056101"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16056101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:38:54 -0700
X-CSE-ConnectionGUID: xSDXxCBYQpSAIu4ClzqVTA==
X-CSE-MsgGUID: 7NEufw0KRwCpGn++Mfvbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="43083271"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:38:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:38:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:38:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1oE5/7JcK0ILpQG34d1wQJAxCJwIKawkzrUXYkLMehGNBjNUpH3E4wNERMVqqXePGUHkxoiN3Ssn1EWW0H2POsRNfwP0qufbgcCR5F2kP/kb1G5KIwR9utbYWzR9BW+IHkKAJEjUIPhd3FptKiASajRzyu79XUj3eRNZYDE8DaNZQ4tqDnLYPA3XwfqcT76qVReTMM8u6lyHFSpaP5btoj6X5HHC3+F+T0sPtT6Hy2HhtaBL8cqeO9ZMhzOCJRBhL3CXiOeqzJ55DLSE9W5OIMnZf1J7xCQnW88EV4NSekI1Mcy2/7wOQAkEcmU1KMUmn/+kffri3tGW05hJYqINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGFwnFTwoxeUWEzZAeaZWiYAXNf6Tvqp3NfZeuIUREs=;
 b=JTMVC27QtkNT+Gf0pkigAO9KjbtTJH/pgGRPCVqeoYBZoZELEsutYBQvDMZMRn79maXg+UmVN/9tiZpJNbI8EMu2HgFNuWB7BVHSRifaLXjynJ4WVQjdJ5S+GJ9QTVizdUArzycyLQ3LaimcoOn30xpNfvNs7HvBztaG2DIJWorzXryGYZeExHYCBzeYAFVgNxf87v5ruuL11LdkAPJt4kvjQ7h0rD1EyFBX/fyHF/a5gXVwQOYF7MpifnNoIpmuIdJpjxQy7/3azrrtRmskYLnPtljQtnoDHRIX9roO6nRvpjJkHdrpjWhwZMBdD61Geht+VHY5GEfoyMVGcBbnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 23:38:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:38:46 +0000
Date: Thu, 20 Jun 2024 16:38:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 18/28] tests/intel/xe_oa: add remove OA config tests
Message-ID: <ZnS9hBZhYipFySka@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-19-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-19-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: 55faa27e-3473-4d45-4f58-08dc918220b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2VKa0xyWkxTUk1vbzlERHA3KzgrTkpST2lZck9GbHhxOWVKVGlKMXFPRjda?=
 =?utf-8?B?ZlZuNDllSDUyOUxXN05KM3F5YWpPZzJlbGxBYnZKYWRHekxrSWFQZ3NTWHF2?=
 =?utf-8?B?VzhqdDZsUjRIMTVWN0xDa3ZaMmVXTHpGM01WMW9YVS9WRVMyY0ViUGxDVEc5?=
 =?utf-8?B?SGhoT3I5UWUvazBvU3NNMnpZNEpENlBpZE9XY0RMc1RZVEhHVCtlS2hMcnBQ?=
 =?utf-8?B?TGJIR0ZFSEZzN09FajVjWG1XclU0ZmxnaDN2Q3BrUUtTL1VLbEpGRzJyVnl6?=
 =?utf-8?B?ZlhiVHV3R01OeHpseWtGU1BhaXIxRjRoaGpUcDhRR2E5RVlwMVBkT1BJb0Mv?=
 =?utf-8?B?RG5FdmExa2NKTGNMRGRTSHFkc251aEJQNmFZSkxKRzRacE5zc3UxcnpBSFVy?=
 =?utf-8?B?d2xhSFZFanI0R1ZoTTZZQjJ6YllTQ0I2a3JlaVE0ckhYVnZzYUM2eGs3Uk5N?=
 =?utf-8?B?N3VHV21WNS9hb2ZLUkRpZnplaTZuQWFvR1U2Rm1CZzM4WTBPM0Q4akxQd2k1?=
 =?utf-8?B?Mk5RM251aGEwMHdjSC9jQlZBMmpoSE8rWEpWeEE3d0REdnZnYzEwbkVOeHE3?=
 =?utf-8?B?RWZ4bXRONnUvSWpQNnNXelp3N0phWnMzd2EwNDJhSDBNenNJY3hBb3o4UE1P?=
 =?utf-8?B?RlpTUjlQdFVaN1NnUmU3L2ZXQ0w1bEhRRTlyVDF0dkt5S3JpeUxGLzNPc3Iy?=
 =?utf-8?B?VDhMREJPcmVmWVhBVEhMc2JaRzBIT3V3WDRiTWcrRTlGa2MyUS8yckZzd0I4?=
 =?utf-8?B?SnZVTTd5ZXlPZncvSTQvRm15ZG1hbFhiLzc2bGRsRWlYS1daRmhJU3pKV09H?=
 =?utf-8?B?N1VqSjE0bElaTi9WYTU0RGxjUFpXUzluK0ozRHhzby9CN3NiL3o0YVE1bm1z?=
 =?utf-8?B?UW12MXhXR0lpRmFwM1A4SmthWHRXdlhadTRRWTJCcHhETC9oLzM2RUFWbURl?=
 =?utf-8?B?MXZ6Sk9VSHNaU3REa01EaG1kSzBYVjVnWmN1UlhFemFISUtWU3RsU3dNeTRF?=
 =?utf-8?B?V1RKT25lT1ZpcGdBQnBQbkpiTW1qdGJVQ0h3ZnlXdkFneEJVUWQxRFpyZ0pR?=
 =?utf-8?B?RWkvM1kxeHpxMVRtbTZMRmp2NWt0VVc1OE9jUmhRVDgrU1VDQitwL1REMVZS?=
 =?utf-8?B?Z21ndTF0MnBHZ1JNVWh4cy9jM0VoLzZTaTVwZ0RXdTQrZzhSQ2VxeTdSTTc1?=
 =?utf-8?B?bm5ZWllRaTRwZjJZVnVORmRUTkt5M1hrSWU4V0tOMzd3cFg4R1FYSzJva1dX?=
 =?utf-8?B?WXpjSmwzOG5DbE9qcmtSS2NOOTZEc052MUZSYjI0SzJGd3JkMDl3VFQzakxH?=
 =?utf-8?B?QVFzNllKUmxaUm91a2Rzd0lnb3dWR0FZdjdlbkxXTDFMZTBTOHA1bDVXaWhS?=
 =?utf-8?B?ZnFiYXhvdnJhdm5aeGJZb1VNbzB4N0RhcUJid1Q1UFJLeTBNSk14VW9zV042?=
 =?utf-8?B?VlcrSCs3UWRXa3BVNjMrZWdJSldxWVc3SUM4dWViZ1RINTVTbGcrTGYxMitP?=
 =?utf-8?B?TEs0b2VMNVg5YldWNHdjUGZaWmxTWWJBVGlXQXRzQUsyR3F0d3c2MmdTOHNR?=
 =?utf-8?B?YnZuZWlQUXZmeU1GdTdaa1E3QVdFd3JTT3pyb0U4MDZPRGtES2liYm8wSHZL?=
 =?utf-8?B?Zlh2eUkrcndiajJFcmRpdmJuSjlpbkdrbnZOcFc1Vld3TEZHd0xXeE5qZFAv?=
 =?utf-8?B?aUV0K29vbHdwWnl5c3ZnUVB6ZGdmUGxxT1FNS0h4TkhvUUo3OWV0Wk9iN05L?=
 =?utf-8?Q?uLZtYmb2TpIc3JfLRxHPiVKS0vY9gYlNiu3H5aL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09iZWtXNndrKy9yL1pmV2IwSXFmc054N0t2U093MGZhc1R1cFdjZVArM2pS?=
 =?utf-8?B?ckNSYWFka3MveThSVjFEK2lVbUVDOEtqSHNYeU1ueTBqNmZPYUp4RU45Uzli?=
 =?utf-8?B?alFxRUEzWWpRM1Jxd2wvN0VPMldEeHpjbnovZFozQ2cyOXZwekZORURVY0FO?=
 =?utf-8?B?WnJxeEZRT3lpWG4vVFRQeEJRaWpMR1pYTnpRaDhOOUVWVUlYMTJKOE1JdURR?=
 =?utf-8?B?OGtiWktUWkQzK0V5M29hSmJKZkRUdXAxcExIT0o2ZWZleDdmdlU1VnpGYTUr?=
 =?utf-8?B?Zkk5YTN5RVVKQWcyTFFtb1dNR2dUN3lQZVRCejV6SnhTZm1TMEZLWncwVU5y?=
 =?utf-8?B?bE40UlFIOWEzZTF2TzlqcU90TUlkZDl5U3V4c1FLbDQxeHBwWVlTU3BTMk5F?=
 =?utf-8?B?Y2xETW50aVdIVTZETUlRb1dkcnd4dXQ1d3N5U3BjUUg2ZUNpRFRhTm1BUlY3?=
 =?utf-8?B?UGN2a3BLRG9LZ2lSOC92YmhDZUVFcktsTUo3NUcvNGdVT2RiZFZCY1BpbzBj?=
 =?utf-8?B?TGJTc2FqdFVxVmtmcEZ6S0xTNGRPV1BXcXljUVFwc0N5K2MvY09oK0pScDJ1?=
 =?utf-8?B?Y0FrYVBMSEFWSnRxK3JSdFEyRng1TUZDUC9EalZqL3VKMUFWU3g2NG5rL2I4?=
 =?utf-8?B?V2FkRlNBSmhxTHVsK2U0Z1J0UFhiR3Q5ODJmekZQTE5JeVYxY3F3eUJNZURu?=
 =?utf-8?B?dGVqQnpOZjMzbXF4ekVoNjU4Y0FORWxkQytyaEdNYTM0YktKMGswOWtZSGdr?=
 =?utf-8?B?K0lBTm1jdUlLdnJ3aXI5OHRVTmxiZmNveDR2U2hQVjZwaS91OE9SU2FEeThu?=
 =?utf-8?B?YU1VbDFDMXU4NFF0Nlp0N0lrQlh6cUtPNWErMk53ckJES2srWFBBVkNIZkx1?=
 =?utf-8?B?N0RBaHVJcXhwRUFPSFZ1Q0t3MmVzaENZTmE1eFVTWEErZys0RlJrVE44djFK?=
 =?utf-8?B?dGZvWXF6c1V5WVlQa0N3NVdia1BZUEFDNFRrRFZhTy9Bbm5uNWhhZ2RNTjZ2?=
 =?utf-8?B?elMybGpNV01sUlQ1eWJreG9sazMvMmhzWW4vdHcvaFZwbmJrQnRrT3gxVkwv?=
 =?utf-8?B?Q3l2cE9RMXp0RVppVTBJempobWxpTG05VXU4N1ZUUk1IdFZyY0U1bTdXNTBj?=
 =?utf-8?B?dkRhNzNES3FhSGFhN1FlY08rVWtXbGJxZkJEeW9jUm83ejZ4TWFsS3BBTXI0?=
 =?utf-8?B?WmxzY1Via29MTXJyRXZZKzJnNkZHcndwZG1jYTV6WVdKR0JxZ0dKSFBCaVNJ?=
 =?utf-8?B?TC9XUTBGTHJpT3RHT1dnSDBVTUhJNlFBM0g4TEJzZ2JuVHNUc1ZGNmhWb3Bx?=
 =?utf-8?B?OVJYWXYzd2NQUmhvSUxxSzZwTkxVRmdmeDluM0ZOeGtrL0pkL0VRclYzbDFq?=
 =?utf-8?B?aVllY1NDWGg3RnJwWEllUHB4NDNpQ3NENzdnRDNTNERpRHZmUmpvcTFmL3pP?=
 =?utf-8?B?ajhjWlA1SHp1RFhFYkhwUkFIZWRvZ0FTdS90Qlg0U0ttcDF1cWtybS9USXp4?=
 =?utf-8?B?cFZhbXgrck1JYXVlcDBabHFKeGc3eXA1Q2tGM2pBRGhqUG5yY3hwMVVEWnM3?=
 =?utf-8?B?MFV5TXo5ZC8vc1BnbEdOb0JoVk1zY2UyQVN1Q2RoNFg2aUN3SVhEZUdlUWc2?=
 =?utf-8?B?aUZyb1p0Y3JmQkRIemgrSHhKbmRuSGJHSWpRK0sxQk9jdndBeUVNNjY5Wk93?=
 =?utf-8?B?U0M3NU9NVkw1V25ieU9abGh4TGRSeFVEcTRJeVJkd3pFTi9EdXBaZU9XMHNS?=
 =?utf-8?B?M0hyT0JlbHVjb1NCQWV2M1pXMi8weDIvOWIydzdnRHFRMENPOWhvaTdUdVhT?=
 =?utf-8?B?TnJkWDl5L2xzUm5aTzJZeTJDbk1Gd3NJSU1UYmpwM0xRbHJUTzlkZ0JaUGp6?=
 =?utf-8?B?dUpxbmhIUkIzQzJsWHhjSmNURFpjdEdwWEtaYjZmYmRvdVUwMWhBSU9OTzVI?=
 =?utf-8?B?c21jRjFyeW9qM3M5L3ZVUXdZcHhXQktWSUU5WHlVL0x5NmFOajRzUmFBd0Fs?=
 =?utf-8?B?UVlJN0ZyT3ZEWFVERDJ6MXc1ellIWEJWZE9ubjFURnQ1SEFPYWJuMlhvNFY3?=
 =?utf-8?B?Nkp4dEdCNTlBWmNzb3Y1UWdQWTlrRDRKc1JjeTVJd00wYzJPQWVMOFEycTdz?=
 =?utf-8?B?dFgvNHJJc2lvczVGUlJSeG5ua2NwL1diMEdocmlRTDB6UWZ4RlpTcUN6NXUv?=
 =?utf-8?Q?dvxJg6scFdUqgT269LpG2SU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55faa27e-3473-4d45-4f58-08dc918220b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:38:46.2521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4qkLTvipckmsuQis/bVS+K2XALTgzqs25uQPf9+Z2IAfY1IXb/fdijLEjHiZUJXnH6nLwN8cBRX6P8XlVuyPp+RMLDOlWAH7vb8z3QyzcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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

On Thu, Jun 20, 2024 at 01:00:43PM -0700, Ashutosh Dixit wrote:
>Add the following tests:
>	* "invalid-create-userspace-config"
>	* "invalid-remove-userspace-config"
>	* "create-destroy-userspace-config"
>	* "whitelisted-registers-userspace-config"
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 333 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 333 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 12a76ef4a8..8e6de2db11 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -535,6 +535,12 @@ write_u64_file(const char *path, uint64_t val)
> 	fclose(f);
> }
>
>+static bool
>+try_sysfs_read_u64(const char *path, uint64_t *val)
>+{
>+	return igt_sysfs_scanf(sysfs, path, "%"PRIu64, val) == 1;
>+}
>+
> static unsigned long rc6_residency_ms(void)
> {
> 	unsigned long value;
>@@ -3575,6 +3581,321 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
> 	load_helper_fini();
> }
>
>+static int __xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
>+{
>+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_ADD_CONFIG, config);
>+	if (ret < 0)
>+		ret = -errno;
>+	return ret;
>+}
>+
>+static int xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
>+{
>+	int config_id = __xe_oa_add_config(fd, config);
>+
>+	igt_debug("config_id=%i\n", config_id);
>+	igt_assert(config_id > 0);
>+
>+	return config_id;
>+}
>+
>+static void xe_oa_remove_config(int fd, uint64_t config_id)
>+{
>+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id), 0);
>+}
>+
>+static bool has_xe_oa_userspace_config(int fd)
>+{
>+	uint64_t config = 0;
>+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config);
>+	igt_assert_eq(ret, -1);
>+
>+	igt_debug("errno=%i\n", errno);
>+
>+	return errno != EINVAL;
>+}
>+
>+#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
>+			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
>+
>+/**
>+ * SUBTEST: invalid-create-userspace-config
>+ * Description: Test invalid configs are rejected
>+ */
>+static void
>+test_invalid_create_userspace_config(void)
>+{
>+	struct drm_xe_oa_config config;
>+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>+	const char *invalid_uuid = "blablabla-wrong";
>+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
>+	uint32_t invalid_mux_regs[] = { 0x12345678 /* invalid register */, 0x0 };
>+
>+	igt_require(has_xe_oa_userspace_config(drm_fd));
>+
>+	memset(&config, 0, sizeof(config));
>+
>+	/* invalid uuid */
>+	strncpy(config.uuid, invalid_uuid, sizeof(config.uuid));
>+	config.n_regs = 1;
>+	config.regs_ptr = to_user_pointer(mux_regs);
>+
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
>+
>+	/* invalid mux_regs */
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+	config.n_regs = 1;
>+	config.regs_ptr = to_user_pointer(invalid_mux_regs);
>+
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
>+
>+	/* empty config */
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+	config.n_regs = 0;
>+	config.regs_ptr = to_user_pointer(mux_regs);
>+
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
>+
>+	/* empty config with null pointer */
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+	config.n_regs = 1;
>+	config.regs_ptr = to_user_pointer(NULL);
>+
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
>+
>+	/* invalid pointer */
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+	config.n_regs = 42;
>+	config.regs_ptr = to_user_pointer((void *) 0xDEADBEEF);
>+
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EFAULT);
>+}
>+
>+/**
>+ * SUBTEST: invalid-remove-userspace-config
>+ * Description: Test invalid remove configs are rejected
>+ */
>+static void
>+test_invalid_remove_userspace_config(void)
>+{
>+	struct drm_xe_oa_config config;
>+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
>+	uint64_t config_id, wrong_config_id = 999999999;
>+	char path[512];
>+
>+	igt_require(has_xe_oa_userspace_config(drm_fd));
>+
>+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>+
>+	/* Destroy previous configuration if present */
>+	if (try_sysfs_read_u64(path, &config_id))
>+		xe_oa_remove_config(drm_fd, config_id);
>+
>+	memset(&config, 0, sizeof(config));
>+
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+
>+	config.n_regs = 1;
>+	config.regs_ptr = to_user_pointer(mux_regs);
>+
>+	config_id = xe_oa_add_config(drm_fd, &config);
>+
>+	/* Removing configs without permissions should fail. */
>+	igt_fork(child, 1) {
>+		igt_drop_root();
>+
>+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id, EACCES);
>+	}
>+	igt_waitchildren();
>+
>+	/* Removing invalid config ID should fail. */
>+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &wrong_config_id, ENOENT);
>+
>+	xe_oa_remove_config(drm_fd, config_id);
>+}
>+
>+/**
>+ * SUBTEST: create-destroy-userspace-config
>+ * Description: Test add/remove OA configs
>+ */
>+static void
>+test_create_destroy_userspace_config(void)
>+{
>+	struct drm_xe_oa_config config;
>+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
>+	uint32_t regs[100];
>+	int i;
>+	uint64_t config_id;
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
>+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+	char path[512];
>+
>+	igt_require(has_xe_oa_userspace_config(drm_fd));
>+
>+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>+
>+	/* Destroy previous configuration if present */
>+	if (try_sysfs_read_u64(path, &config_id))
>+		xe_oa_remove_config(drm_fd, config_id);
>+
>+	memset(&config, 0, sizeof(config));
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+
>+	regs[0] = mux_regs[0];
>+	regs[1] = mux_regs[1];
>+	/* Flex EU counters */
>+	for (i = 1; i < ARRAY_SIZE(regs) / 2; i++) {
>+		regs[i * 2] = 0xe458; /* EU_PERF_CNTL0 */
>+		regs[i * 2 + 1] = 0x0;
>+	}
>+	config.regs_ptr = to_user_pointer(regs);
>+	config.n_regs = ARRAY_SIZE(regs) / 2;
>+
>+	/* Creating configs without permissions shouldn't work. */
>+	igt_fork(child, 1) {
>+		igt_drop_root();
>+
>+		igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EACCES);
>+	}
>+	igt_waitchildren();
>+
>+	/* Create a new config */
>+	config_id = xe_oa_add_config(drm_fd, &config);
>+
>+	/* Verify that adding the another config with the same uuid fails. */
>+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EADDRINUSE);
>+
>+	/* Try to use the new config */
>+	properties[3] = config_id;
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+
>+	/* Verify that destroying the config doesn't yield any error. */
>+	xe_oa_remove_config(drm_fd, config_id);
>+
>+	/* Read the config to verify shouldn't raise any issue. */
>+	config_id = xe_oa_add_config(drm_fd, &config);
>+
>+	__perf_close(stream_fd);
>+
>+	xe_oa_remove_config(drm_fd, config_id);
>+}
>+
>+/**
>+ * SUBTEST: whitelisted-registers-userspace-config
>+ * Description: Test that an OA config constructed using whitelisted register works
>+ */
>+/* Registers required by userspace. This list should be maintained by
>+ * the OA configs developers and agreed upon with kernel developers as
>+ * some of the registers have bits used by the kernel (for workarounds
>+ * for instance) and other bits that need to be set by the OA configs.
>+ */
>+static void
>+test_whitelisted_registers_userspace_config(void)
>+{
>+	struct drm_xe_oa_config config;
>+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
>+	uint32_t regs[600];
>+	uint32_t i;
>+	uint32_t oa_start_trig1, oa_start_trig8;
>+	uint32_t oa_report_trig1, oa_report_trig8;
>+	uint64_t config_id;
>+	char path[512];
>+	int ret;
>+	const uint32_t flex[] = {
>+		0xe458,
>+		0xe558,
>+		0xe658,
>+		0xe758,
>+		0xe45c,
>+		0xe55c,
>+		0xe65c
>+	};
>+
>+	igt_require(has_xe_oa_userspace_config(drm_fd));
>+
>+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
>+
>+	if (try_sysfs_read_u64(path, &config_id))
>+		xe_oa_remove_config(drm_fd, config_id);
>+
>+	memset(&config, 0, sizeof(config));
>+	memcpy(config.uuid, uuid, sizeof(config.uuid));
>+
>+	oa_start_trig1 = 0xd900;
>+	oa_start_trig8 = 0xd91c;
>+	oa_report_trig1 = 0xd920;
>+	oa_report_trig8 = 0xd93c;
>+
>+	/* b_counters_regs: OASTARTTRIG[1-8] */
>+	for (i = oa_start_trig1; i <= oa_start_trig8; i += 4) {
>+		regs[config.n_regs * 2] = i;
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+	}
>+	/* b_counters_regs: OAREPORTTRIG[1-8] */
>+	for (i = oa_report_trig1; i <= oa_report_trig8; i += 4) {
>+		regs[config.n_regs * 2] = i;
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+	}
>+
>+	/* Flex EU registers, only from Gen8+. */
>+	for (i = 0; i < ARRAY_SIZE(flex); i++) {
>+		regs[config.n_regs * 2] = flex[i];
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+	}
>+
>+	/* Mux registers (too many of them, just checking bounds) */
>+	/* NOA_WRITE */
>+	regs[config.n_regs * 2] = SAMPLE_MUX_REG;
>+	regs[config.n_regs * 2 + 1] = 0;
>+	config.n_regs++;
>+
>+	/* NOA_CONFIG */
>+	/* Prior to Xe2 */
>+	if (intel_graphics_ver(devid) < IP_VER(20, 0)) {
>+		regs[config.n_regs * 2] = 0xD04;
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+		regs[config.n_regs * 2] = 0xD2C;
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+	}
>+	/* Prior to MTLx */
>+	if (intel_graphics_ver(devid) < IP_VER(12, 70)) {
>+		/* WAIT_FOR_RC6_EXIT */
>+		regs[config.n_regs * 2] = 0x20CC;
>+		regs[config.n_regs * 2 + 1] = 0;
>+		config.n_regs++;
>+	}
>+
>+	config.regs_ptr = (uintptr_t) regs;
>+
>+	/* Create a new config */
>+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_ADD_CONFIG, &config);
>+	igt_assert(ret > 0); /* Config 0 should be used by the kernel */
>+	config_id = ret;
>+
>+	xe_oa_remove_config(drm_fd, config_id);
>+}
>+
> /**
>  * SUBTEST: xe-ref-count
>  * Description: Check that an open oa stream holds a reference on the xe module
>@@ -3979,6 +4300,18 @@ igt_main
> 			test_stress_open_close(hwe);
> 	}
>
>+	igt_subtest("invalid-create-userspace-config")
>+		test_invalid_create_userspace_config();
>+
>+	igt_subtest("invalid-remove-userspace-config")
>+		test_invalid_remove_userspace_config();
>+
>+	igt_subtest("create-destroy-userspace-config")
>+		test_create_destroy_userspace_config();
>+
>+	igt_subtest("whitelisted-registers-userspace-config")
>+		test_whitelisted_registers_userspace_config();
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
