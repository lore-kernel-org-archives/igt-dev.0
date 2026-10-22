Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07936606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BM3ezu6J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37EA10E055;
	Thu, 22 Oct 2026 16:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C333410E055
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792688254; x=1824224254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=B46Zl+PaIJUaeQBc8xsCs7ggiEiwAI6QaKk2aTXYREA=;
 b=BM3ezu6J488/tprHn84lmIDv9aAl458szNh56wMqYZ0k/t5YHa2+xto/
 5kCPziQO2ckPClSsSnBpjtlduol0sjVzNTCvankFPvVaJbPxLn5zBSvqe
 BVTCLCUJCLzhHUPE8dJNyM1oBKkcldQ1gBnm3k3rb0/GUt2F3q56d7eNp
 3HDnlNKGQRusQVq2V6YGD0DNTtDWMuMre8z+Vj2yng4Uimy8eQu02bt6/
 RwSdwaoTpQ4cRoVy+OijDUOa2GNx+09nHy9oC9TbU3jTJ32EkHKbiXqij
 gOWlWO2i6YiRrrg/sjM0f0nP5/gsYVGiznMWvnefZS64ufWs8c9AanQfi A==;
X-CSE-ConnectionGUID: qbiwbaE+R3y3fY5JZRBJgw==
X-CSE-MsgGUID: 7rHOsfpfRiCHa5Wtff7QOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1333587"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="1333587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:57:34 -0700
X-CSE-ConnectionGUID: uheg5eWVRL+T0Y0F3aY5lg==
X-CSE-MsgGUID: 3mowDOQcTZu3mh2tDpycSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; d="scan'208,217";a="3745182"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:57:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:57:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:57:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7yjMa3FtIwVhvLP0737JuZG5jkr4S0X4F1d0abQoXX8FQV3FFw/+mfngrD9qxB+tvla5C7VmVFl2kUb5IzXwH5wGuXwKbQayurK1kJ/YmOcxkezMccVZdgvZvoLEP+v/f3MqwYIfhY4K65IAQNorent+GfSWGgOlLKa2nFKr9CYhJJt1IJGDAreSsGVk1owfkSS1zd4FXgIG3zBC3T3tx2fbQsAD3xjT2JLtr1/I0toE/ChmVNpA/rC79J6eyLGSoWAoxbo3G/x7CcVgZOrKGdxKfQ8vJw5hF/kHzJEx5xOcBf/niBDv4mEAmH3iHHSidRcVot7AUl3t9StsxRpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVtVv9m9KceSELcjygBrCe4IkJdmPnXmmi2lfo0OnW8=;
 b=coce5DmSoj5HuCMVqIo3OzKS0JdHmryKFkdERk6uR7Egnr+nM7P75j/N6DZgavVDDbdqHp7uJbGG76szr2HTqDKB3uuCHdXmU/8o5tEvTBGvp0IWhUuNgHJrie7svjSHse74pMN4qmKwY0mY9XYdtdtCK4N2PDOa/Isj4O++80wdMItTvzkX7qai6s5/O1T8HA9uCd6rBrQSxzA2pc1fKGTIReRL3Rb/S3Ex0YAi1SLEHH8JkhujbaXOUZpzknzKYGwht75ddcyKa/AozPCGu8QQbWVkROjemb/WSQdLdlLrm1qhxG6PI6nxKFnfRc+h+ebty8VVlvX/GVjC34Qp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:55:28 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:55:28 +0000
Content-Type: multipart/alternative;
 boundary="------------Zvam3ECRQRDFGJc50paiQORe"
Message-ID: <e42e85f1-e3a5-4249-b057-31992fa0c08b@intel.com>
Date: Thu, 22 Oct 2026 22:25:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] lib/igt_drm_netlink: add set_error_threshold
 command support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-7-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-7-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 07505e9a-de8e-4416-c687-08df305d46c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|18002099003|22082099003|8096899003|6133799003;
X-Microsoft-Antispam-Message-Info: TfIHdXwMpXe0O6ULpmzuaETSY3lOwohGUcuY7UDcPVXkgwt/eInmmGPK0SUQgaQ38kI6L0Vuvfjs0/YgyALqLCE8Eyx/FyCdFao4aGY0LHt3vwCWplPeULH0VLT+q/gfuad4lRcw/2zdeHzZGap0bPEa31iye/h5pSgv0ytsRmGvjipxG4RzybsB8AVT+1+U6UmkhqNoIpvnMr2xmloE6i+a/HKvX6+DQ+guMcffVuNo54f32SfM/M+0RVpFvJkcnsieZE1ybg87u4kaU4kqNW5RfqmNGqDp7Knh2IoHFE1ogPVyvjiWQjKAetqHnOXfQ49+Vw2Sx558Xx3J1GKrcwpo6jYz+0L6DKQIQ3Myl/pjnTJaYLSc8FcK/egyscQINu1qpRQIcXSaCWf1ckrVnm+XGqqhsWehM027ITZI9b0SxZSVWPOFyqKRXRrh7d6aHc6NHWg44zu8uphTezveNC5cspezYyyW+rUpsIPiBvJDZHqiXun7fz5Zg0Cg+Zof0VdsaOCRkL+J13GyydNav4NIfjTMqoYwXMalB0P0Dv5LSWbvF6uVv/k3dctlRxXzvdRh5EMVXYiwhawaXajvpyBbgKXwlZpp8Ky7MZuAH04pZ0tPxTXLVoEVqy6Xd+aCNbZdML6pkT1DKsC8Jn8o/oXGHSsPFAFsEWdQJV7AGK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(8096899003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2psYmV4ai92cXBqTmJXZzJEenp5MW45dGduay9mcW02cS9uUXhBb1V4REF6?=
 =?utf-8?B?TUl6Tld5ZU5ScDJXSU0xRCtJZThKc1gyMVd3UnVpRyszMm5lVFVhbFA3emJz?=
 =?utf-8?B?ZzJVOVdzMStkM2pTQ2htRGE4QWxnTFp6ZnpIbGEzTDF5b2kyemNVS1JVYmQy?=
 =?utf-8?B?RjREM1NaNjcvTElGeTZXS0VGNUJjRHNxa1V6NXR1UlN1SmkyRCt3eWVpV1p4?=
 =?utf-8?B?b3FXVWhWeHYxYjRtanNrSmhqV2FIblFZRUdtSnlqdk5vRGVWOXVOVkRsZ2VW?=
 =?utf-8?B?V2VZQTZLSzltZGpXSGFCNTNTWVF6WHBSTzB5YjBJOWo2M2dFT1pHdnA1UVhv?=
 =?utf-8?B?OFlia0hzR1JoWE5pODlXQk93SlpSczBXcVRqMHp4ZHJNK1JWNEROeW9WQ3lt?=
 =?utf-8?B?U0ZwVWovK0poMWFkejBCM25SUWdVQXRPWGxOZCswSlFDQmNEWks5bXprL2dk?=
 =?utf-8?B?d1NEL2lPVW9oWVhCYkR2c2M0ZzRZU2JNbG1ZQ2c0eWRZZzhoRm9odVBZOCtz?=
 =?utf-8?B?ZmFhenNVaWZEanIxZlY0MXEzeHl2K2tiR1U0UTNHQldnWG93bURWcmVWUmVM?=
 =?utf-8?B?bHRmdkU3aUdCdzk0c3NIQU9qSFM3V3dIb1RCK3pXVjBXZEdEZVA5QXp4ZFl6?=
 =?utf-8?B?YjlSTTQ4WCtsUlhBODhOVmMrMEczWUcxNDhLWVp1Z3BnSzYvSXVYTFlpS0ts?=
 =?utf-8?B?YkNWL2p6OTJqd3FlczdSN3pYaTNsYWltMnZKWkZKL09tTkREVVY3TlR4Slk0?=
 =?utf-8?B?UCtmbUFVdjZRWDRiZDRuYTNCQkVkNTM3TkpXS3V2MEYwN1R1ZjhmZlVsNjhn?=
 =?utf-8?B?dGRkWWMwN3J0LzZxUTBldnZtdXNpOG5qSWJNaUNwOWduaXU2dTZFNUJYbDNB?=
 =?utf-8?B?OW5WOTlsbkMyQ0ltNHkyaGZPUE1vS3hrSWFNRU1YMWlIditTV3dNek1Vazhj?=
 =?utf-8?B?aWJKcHQ1OGNBZzd4clNoNnJBdEo3bDl2NVpuVjRIOUcxbndRSEFuVmhYak0z?=
 =?utf-8?B?OFBUZ3ZpRVFkSGFSenhoUCt1SkI4WjJTbnlWbUZwS2Z6WXZBZ3duQlg3b3di?=
 =?utf-8?B?bWRoVmNJNE00RVZaTHM5RzVyK3VtMUlxV1Nrb3huTmRoK2N5V1Y5LzU1TnQ1?=
 =?utf-8?B?c2crcjRQR0l6ZXlHdmU0Umo2QnBCNWxlSUVLRHJSOUpZM2kwSDl0V3VVT3NQ?=
 =?utf-8?B?NWppUWxmcnJMZjdrRHovazI5WWFjWE5Qd2hJZ1pLMmh3dEYzejhDNzcxU3BM?=
 =?utf-8?B?dG1lSVpOWkVWcGZsVStLSDNOeThFNnlpdzNpaGhMMk9ycUovTWUzQm5VWmFG?=
 =?utf-8?B?RlR4Yk5hSWdpT0tiTlVobXhjSEozS0ZsVUduK0tTSTRsSE00K0Rnek9sT2h4?=
 =?utf-8?B?aWd6ZnhoWWVFUmZHUWxXZjkyeFdwR0M1VVdMeG00QnBVLzZDK203anRZdEhp?=
 =?utf-8?B?dTM1bmJrLzZCMnVGUlp4UC90UmpVelR2UmEwUzlleExaQ01qZEh1cHdmK2Jw?=
 =?utf-8?B?QURwdjdVd3E4Ly9XTjhPTWZZV0RDUGJ0cnMxd2Jjcmk1Nm0zblFFZUJsOWJn?=
 =?utf-8?B?UHhwTDYyMW54ck5ibXlDOUloV1lPS1JPL1dDZWRzZEw0U2QvelIvZFNNeEQ0?=
 =?utf-8?B?ZlRaRnZjTVJwaGVmQzJNb1FVNG5nRjRZZmdZQ3E0UDJXL1VCWTBJQVNqZWVV?=
 =?utf-8?B?Um1vNnFMZWZOZTlVZzFxa0QwVEhFWEdUMW9sSzBEQXIvWk5hRmwyMDdsemdV?=
 =?utf-8?B?U2c3UFZkcGgzRGwxYWwzZGJsS0JLYU5LTDFUYTM3MUZkRG9kY0VTRzNpSC9m?=
 =?utf-8?B?TDEyMXV1YysweHM1QUJ3alc2Q0Q3bUdKZ1EzZDkyZmczRUFrM0phUFEwVGlV?=
 =?utf-8?B?TGxKbVFJT2xBdGFEZU5pcU83UkpSUEdzblg5aTlzTlF2SUZraFo2Rm5hdDYx?=
 =?utf-8?B?d3ZhTHd0QTMrN0lDTzA4U0gxZ1JCYlRHdUFDZTlYa0ZPd21rTmlLZWlmd0dG?=
 =?utf-8?B?V2FYOW43c3dBYlBFZ2dMMDkvM1hpdUdFVm9MTm5LeFFrUzJNN1RvSW80aWYw?=
 =?utf-8?B?ZmJ1RE5YV2gzNUNqdFMwMWFNSW44eElmcTRxYXNiRmhVTHNrS01ZZGhVSXd1?=
 =?utf-8?B?Zlp1MTdYVEE5NXhiUTJFRDdpekUvWnRGZUsvendJSDlnUjN5RDh5bTNaU1Ax?=
 =?utf-8?B?Q0Q5bWhSRTNady92MkFTMjZmaGdyVkwvSjNwdFFoTzl6U283SWxJS1ByWjN2?=
 =?utf-8?B?THVCTkIyeGZ6UGcrUWROSG1CbmY1MnFWdDFRS2dzQ2FHenJVTVNGTUZRMERv?=
 =?utf-8?B?RThxVDAyQ2lSR2paR052MllWdXZyb0poZk1GYURGRmdMbnVva2JLeklPS0JU?=
 =?utf-8?Q?E2qbjKjCBV4JDvN0=3D?=
X-Exchange-RoutingPolicyChecked: WS+u7wlCLMrc3eWOPwTCztsv9RqeoEM5DvzSPsQiu/v9QzlNIFHzbMy8wY8cK4/b0axjOuGC+TN5UScwLB+0+lico+TUgAE1sPUb7N9q/kfnoiZQ16bSz6F9Sm5acfH0Hd3PjBTPLA8Be+F1/Uvmctsd/J4ZQ9kIo0pzDRQdgZYV4q7R7sYvWOr9cT+oEUnWDs1k8SQDuYv1ADmX3t4E7q3vkfKCiRmXiijUD9JGaNOHL5MUQagkIRDZAwmyN8x8XOPgsP5+U4rzvzkMCOO905qlA88cY6iL1nglcUn8JKaV7fAznLrag4D8P+KcIoScRqRf0DxgIbkxyH2+pzV8uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07505e9a-de8e-4416-c687-08df305d46c7
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:55:28.8401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdcLxhFkQGzYcvcF+dkxcq7WCESceHfDQzfr1yiOGd8to2hGpcQB8P7PrgW+DlKcQNjb4B6jt19y+1hfGX/DnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------Zvam3ECRQRDFGJc50paiQORe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
> value
>
> Cc: Soham Purkait<soham.purkait@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Anshuman Gupta<anshuman.gupta@intel.com>
> Cc: Raag Jadav<raag.jadav@intel.com>
> Cc: Badal Nilawar<badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi<harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
> v2:Marked this command as response not required
> ---
>   lib/igt_drm_ras_nl.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_ras_nl.h |  1 +
>   2 files changed, 40 insertions(+)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index f8f289329..94fcc40ac 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -68,6 +68,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   		return NL_SKIP;
>   
>   	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> +		break;
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>   		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>   			return NL_SKIP;
> @@ -237,6 +239,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>   		ctx->response_required = true;
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>   		ret = nla_put_u32(msg,
>   				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>   				  ctx->node_id);
> @@ -252,6 +255,16 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   			nlmsg_free(msg);
>   			return normalize_nl_error(ret);
>   		}
> +
> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
> +			ret = nla_put_u32(msg,
> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +					  ctx->error_threshold);
> +			if (ret < 0) {
> +				nlmsg_free(msg);
> +				return ret;

return normalize_nl_error(ret)

Regards,
Soham
> +			}
> +		}
>   		break;
>   	default:
>   		nlmsg_free(msg);
> @@ -347,6 +360,14 @@ static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   		return -EINVAL;
>   	}
>   
> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
> +		igt_warn("Invalid error_threshold (%u) provided. "
> +			 "error_threshold should be >= 1 and <= 16.\n",
> +			 ctx->error_threshold);
> +		return -EINVAL;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -401,3 +422,21 @@ int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 86cfd79d0..5c9be5b17 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -53,6 +53,7 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
>   
--------------Zvam3ECRQRDFGJc50paiQORe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 14-10-2026 00:36, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261013190651.897241-7-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Cc: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com">&lt;harish.chegondi@intel.com&gt;</a>
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v4:Renamed the library functions with prefix &quot;igt_drm_netlink_*&quot; (Nikula
   Jani &amp; Kamil)
v2:Marked this command as response not required
---
 lib/igt_drm_ras_nl.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index f8f289329..94fcc40ac 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -68,6 +68,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 		return NL_SKIP;
 
 	switch (gnlh-&gt;cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
 			return NL_SKIP;
@@ -237,6 +239,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx-&gt;response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx-&gt;node_id);
@@ -252,6 +255,16 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return normalize_nl_error(ret);
 		}
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx-&gt;error_threshold);
+			if (ret &lt; 0) {
+				nlmsg_free(msg);
+				return ret;</pre>
    </blockquote>
    <p>return&nbsp;<span style="white-space: pre-wrap">normalize_nl_error(ret)</span></p>
    Regards,<br>
    Soham
    <blockquote type="cite" cite="mid:20261013190651.897241-7-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			}
+		}
 		break;
 	default:
 		nlmsg_free(msg);
@@ -347,6 +360,14 @@ static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
 		return -EINVAL;
 	}
 
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &amp;&amp;
+	    (ctx-&gt;error_threshold &lt; 1 || ctx-&gt;error_threshold &gt; 16)) {
+		igt_warn(&quot;Invalid error_threshold (%u) provided. &quot;
+			 &quot;error_threshold should be &gt;= 1 and &lt;= 16.\n&quot;,
+			 ctx-&gt;error_threshold);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -401,3 +422,21 @@ int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	igt_debug(&quot;Set error threshold: node_id=%u error_id=%u threshold=%u\n&quot;,
+		  ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 86cfd79d0..5c9be5b17 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -53,6 +53,7 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
 
 #endif /* IGT_DRM_RAS_NL_H */
 
</pre>
    </blockquote>
  </body>
</html>

--------------Zvam3ECRQRDFGJc50paiQORe--
