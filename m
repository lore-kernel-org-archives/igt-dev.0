Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF55606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h67zZBhB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008F10E8A8;
	Fri, 30 Oct 2026 11:37:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879A910E8A4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793360191; x=1824896191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t/lYgc90DCOjmgjFLFGDv6icSdd411yqM4fWCAqeylY=;
 b=h67zZBhBflnu4E2IxH4mW1iJCGROi1G3H1ZZqGovsdf1ddflx6HlWqRI
 217eUvT3yWOeMwuvpagLBBCX39xUcQ3NFPAwemoq4O09XXQyC2E2NZwYP
 +fwanhiOISERr6LFVwhoqRwR4vAiZXSl7lNfqqqXzJmMSiAIYAjPJrMRd
 3VzyK31HUWBAA9uTkni7sw+Yrpaw73ZD/OrxA4lkK4XwJQ5gZeVCqmDMT
 fC4uPhPJeCGwcjMArA5CnsqGoay5vBaCWnybBCCUJ6pU6/11pOxdqkx/d
 I/LvpVvm6hNZHNJ99qwVdl2pWpQLMNNyyT74LNK0qTF78TYhIomI6Vequ w==;
X-CSE-ConnectionGUID: 74U9u95iQyyRCxsqPWnskA==
X-CSE-MsgGUID: Wl+XL1XNTG20j2UsJQisDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2022528"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2022528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:36:31 -0700
X-CSE-ConnectionGUID: 0Ux3aYqHTYK/2bkIw+ejBA==
X-CSE-MsgGUID: sNvZRi+XTa+XX+R5n9wbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5739455"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:36:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 04:36:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 04:36:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 04:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZtvH7RGyLVFr64/Uj6FArpu0qPYMEmnIvSriUbfYC9NUqnsvVhGvcaIUDJkwRC8GJ9pTGpE8DL+SQJxBNA/MD6CrcGj/vMCqHTceveYDEDIrqsricJqQzDFjqyOmndybuTqqY15DbsWfAn0gds/Jdg+1DU8zxvJHEwJ5ibBvPFGNatfakpNE0Y8jQv32aoHLz4j4Mr8DcHQSsgYwpXSiDOW+HSfqgYaZvl1DELWC02mxkAmv5ED2an2pI/8rdwx/axv43ztqwz7NHV/fAdTFFEcWiY1mSZ0n1WhV0424rDFhp2dflRzONIhKWUVPcxsEEg9QQI72poWmFP8sMtymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIzNjLYm8XMZ1hx7qFhU3TpFDgFoMfkcNZnSvLuyeYc=;
 b=Bsd+NrDTDPqwMDlV2lmiE0HWClCvGt2Smzv7XcIlVUrX4/xXiYcsad/fr5KqL+2DYzXfY2kB3k4bgwmuTwgwvNIBWOwlLpgISH5Lm2vFJNgPEYYsHgqRWIha2DF3I/XFJcr5/SKbVuc2I439Lzt752p5nR7a13BAGVycDgg5Bx4B9Fa0hFd/kWeRctL8mzMWjZIpOIXh8BhskUnccmZ8jNwqwgpFes0DuNJ68uy0jf0vG32BXtQYQjM6EtctaKeykRBIpoipII83asWy3mZCIN/DnZJuLNp49UznURIfPHtishCuyBv7mgVCAbsw1uTQxw9sDwN19S4VJVjk4A5jAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 11:36:28 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 11:36:28 +0000
Message-ID: <a774eaf1-6156-41f6-a8f5-35bd2595f5d9@intel.com>
Date: Fri, 30 Oct 2026 17:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] tests/intel/xe_err_injection: Add Core Compute
 Uncorr Error injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261029085955.1232163-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d84cab-82d8-441b-bed8-08df367a0914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003|261022105027099003|261022113327099003|261028144727099003|261021121427099003|261009223327099003|261009221227099003|261009220027099003|261009223027099003|261009221727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Qutpqh17jh4fhtVr+fkBxr5pgK2Incf0gNApY3q/MoS86JIhch3rMv6koqel9WwoDXQ09Cw61s5jbs4ACxM0LZIgctuYVP7J31w0MWNNNQg9DLpApN4Bzb8OjXJAKmHf0tlTOtu2EZB33ig2tn6240yPTKGK1vfdg9fX1UVZpR9qoCaTup2k4FPax2enD/UZYh8ov1mVWF4adnLjQ2aSApl8Z1OYi89DDd1bMrZy3+dHFxuaj39+1sidoSPqdnPFzv2bmegu2pdCIOYXQuphx8EVXHnZWDaFT4pH/Z1xBBjcyncVfDAWca8Ht9DfjgxPt1T27wHAnIpCF39FKG3hccnUL4E3KXPY/YwcXXS3nEA/l0PSMYHfWxYoJTXZL7+drZRjK3pq6w+eUd4fQ0JEiknooCIhtluvF8aIkEwLqo2rXDVJvwDtAWdutwgQFrPGamAB706rC3N0FXjJER/8Rw3sOCUOvJ8jVlKjmvCfMenArVRI5GySDpKw6QxhyWlzvS+ypXwi/VgnqMHb4aeAIvp7llYGe7pH8QHh64eHzBW3hqhRg9aUsvgUDX3gxiG+kK1uqWfuaYDHckCEvKHKQn/F0O3hIdTHt5O09kQw8IyRpbmVZgVULJuKIxJIGIIPIcvbN/ZlxR909KT+Kwqsf4zyUHSNerJ6AQ94fKJ9ZA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003)(261022105027099003)(261022113327099003)(261028144727099003)(261021121427099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009221727099003)(261026121527099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhXWEVMQVNCcDV4YmljL2p1WVZvelU4ZGJMK3lnUnNjZWxLdmsrRC90UXRs?=
 =?utf-8?B?NVlhL1hIZ3NXUC8yK3RXaTV0RVRjMWZXWmlYUHJhdkpUS3o0NjkwTjJIR0ZD?=
 =?utf-8?B?eFdrMDhMM2J0WTRZeWZtUWV1MFRBeG5JRXZWOTYvV1pOR2JVQU1JZXV0N3M4?=
 =?utf-8?B?WWZ4bnV3WWRqd2lXNis5cEVoNHdydm8xbG5XWTZwSnNwQmw2bDdxS2t3eUhT?=
 =?utf-8?B?YWhjM3J3cjNmVTZtNEhIVUZUa0djMVBmanZxMFBsVUdCaWUvd2xTNC9jcEQ3?=
 =?utf-8?B?d3FVYjgybGFSWDZubmQyaXFjTnBXbDEwN29UaEU3cmd6MVZVMmYvMzJiQnhU?=
 =?utf-8?B?TkY3SGJtaXhFekYxZGlSdGNQbTlXWU9UMHJ6WTdIZHR6QzdiNVd3U0JSenNW?=
 =?utf-8?B?c1dkakZWWTk5M0w3SThSclNjTUNTaHhCT0hLbEJ2NUs3OTA5VFZGTmMxV1ll?=
 =?utf-8?B?NlNxUXdzc2dJOWM1R2xKOTk3VXR4dVJKSDJha3NiQTNNeXlINitrc3NYSUFH?=
 =?utf-8?B?Z1dqbDBnTXlSUS81NTk5MVAyc0hOQ1lvdEJzNVhCQzlEWUxIQ3lOb3BBTHV0?=
 =?utf-8?B?S0lDK3U4ZCtVSlJlU1hvNVR1bHFkdmI1NThoTm04OG1NdVVFV0Q0YmhYVnA2?=
 =?utf-8?B?aENCV00wOU9EQXlYS0RYcnpKQTc1bTM0NktZOFZQMm1YUXBqaklQa041WXIw?=
 =?utf-8?B?NlRTVHIzMUZXeHptNnlqbXFwN1hybmhzWEI3TzJadm93Rk90SGJwa2xkNWZO?=
 =?utf-8?B?ei94QXA0MzJHWW5qL3kxUVRzWHRhZlk3bzRZWlkxdkFIR2JqMHZhOFY4cHF3?=
 =?utf-8?B?WWJWOEFUM3J3Tk5Feno1MVZnU0M0VWI5ellTQlpPenVncEZSWXU4NmVrMHlF?=
 =?utf-8?B?V0FhbEM3VU5NL0dwYkp2dUM1S3hVL2gxUzhTSmZPeTRJQ2NIMGN0UHRUalNH?=
 =?utf-8?B?SlF3d09Nb2VuWWM1VnA2YzBkQ1dZcmVMWnJnTHZzU2NSYVlRcHkwaFlmaGJD?=
 =?utf-8?B?K0tQWWZ2UGZ3UWc4TllMdGxEeFpGRXRyektJcE9QRmp0NkhFZDA0ZS84bG1x?=
 =?utf-8?B?K25Nc0hscG9HS1M0cXc5S09STmpxMHR5Yk9ab1FheVQ0OXAzd2x0SjIvaVlI?=
 =?utf-8?B?dDVIZ3ZvOHdRMWsvZ296V1lvWURRSVZ5cW1yU3paeUxqWUdOOENOakhQS2RY?=
 =?utf-8?B?SzhkbGE2WjlTZk54WXBGVnhkaGhCYkVZWXJMUTBZK01qUHZxa1lScE80TFg4?=
 =?utf-8?B?aVJ0M0hzTEUrV290WjJZV2hXMHFhSHZsSjZ3dFZtdnJBbUFzV2h4NWZBZmls?=
 =?utf-8?B?YzlkTVFuT2lZTjRQRDFnaDV5bDB6ZzQ0ZnFPZ1hMOTdxUkM3WXd1cWx3ajJL?=
 =?utf-8?B?andLcG9WSlNaQjhCeHN4K2xscWI1dmZKdVRZZ2tqV0ZmV3ZxenIzbkoxdkpT?=
 =?utf-8?B?Rk5TbEIzdkFJdFNyM3N5YUhNNUxHVG01alNSd2lESTBCcktrRGZBTDkvb0VW?=
 =?utf-8?B?Z0kwZXRVczBiRERGNE1qQ3FiTjBHL2cwZFBxQlc5U0QxMmJlVmVJcFFBeGNn?=
 =?utf-8?B?clAwUlV5TVVOUzJiWFQ5bTg1NEJ1YkxscVFtTXJTMm83cWFteGk5T0RxazJD?=
 =?utf-8?B?VEpMQlZiMGJRaGNYL0swa0h5azFHOFdKRHR0YWxpZllGK093K29WSWpJRlM4?=
 =?utf-8?B?YmJhdC9PY3p1TmtqZS81LzFFbDBhdnd6Q3dzTkJBZVpkazc0NnN1Umsvb1Z0?=
 =?utf-8?B?QzZHeXBSdmlpKy9ITm5oTkFFaTlPVVJWeTVpL1BTNGNNa2MxbUs1cFczS254?=
 =?utf-8?B?bnFFUzErNnB5NW1JaHFsUzIxWWlybzVjY0dIQlg5RG00SzljeDgwMmhnOXRi?=
 =?utf-8?B?OWJrdGI5cFR1ZVIremFNVU1ITDd5VHVMTTJUNFpoNWZyOHV4Y0V2ZlpYeHVz?=
 =?utf-8?B?QUF4d2p0ZmFMYVpncVQvSEtZSTV2TXQrSjVRN3MxY0tSQUNvRmw1elorQzNh?=
 =?utf-8?B?L0l0aVFac2diNGphMVpGWXhSMmxXNzc2YkJoY0lqTC92dmwxYStqNk5Mb0lK?=
 =?utf-8?B?K1FDcGx3UTY3RzNXMDY0dGdUNEs0T21RRUlwaWxiYXE2YWRjaWFBNi9LQ0Mx?=
 =?utf-8?B?YjJDS1NIMEsrTTBMS1VIV2pVZmQ0QlNpSXJTZDN4eEYwTnlDVFpQb1JmWUIx?=
 =?utf-8?B?RFJUV1B3cVBhRk54ekVpVENkVFo2U2RYNGdzRWRiOGtWSWpyMk5XUHB0anB1?=
 =?utf-8?B?SHZzR3RsTWZYTjFBNHJHK0dnRUM2blg1UUVyRXBXTnRORTltNFRpVTZDSzNN?=
 =?utf-8?B?ZUVvczYwWm43ZU1NMlBzTnowUmtyd0JSMk1wZ1JveUN2MEhoc3Njdz09?=
X-Exchange-RoutingPolicyChecked: mKyiqQjr5cMOZxQtLs6F9CJBMFkgGNVCdrIeDpm0Kr1/pijuCItSvXanyUJDpQTTReRiuZ2myFFyUxvuHnEywrjOQZzCsok04Zp1XMnEdRdM4c41BPJm4LFy3f8orGSn1jn0gZQtD0fS8eZJ2VH9NzL1S4vKRzeA6Mg3DIRk8Fo9WR9ktsybpnTPM1ojoM6TFeCwo+pYtEdkL0QD1grv+5rm/itvBQROBi0dCTQsH4sWd3VwX8kUxF+ZGnQ20dNi6LUuPYgqny4BIy25lu8d61peVGmZRrcPDQexe4F3W8PhwDxeUeQuqTK7rl25iXH66b/jitAoDln5UMeKO5Q7PQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d84cab-82d8-441b-bed8-08df367a0914
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:36:27.9208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8WJbHcts5Ijn365f3uwimfs+WdDG9Aj0KBB1WC/+19DPMGjvLNXsDBQNaBGfJ3rwjQi2SWefNdBn8upWMFzLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add MMIO based Core Compute Uncorrectable Error injection to verify
> the Xe driver error handling and recovery flows with the help of
> DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6:
>    - Updated aquire steering semaphore logic (Soham & Riana)
>    - Removed enum to string mappings for test names (Riana)
>    - Updated metadata in the file (Riana)
> v5:
>    - Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>    - Prefixed all register address and bit value names with "XE_" (Riana)
>    - Updated AER recovery dmesg strings to use enum-indexed arrays (Soham)
>    - Added error handling logic for function calls
>    - Changed test name comparisons from strings to enums (Riana)
>    - Added UC test and post-recovery workload tests as dynamic subtests (Riana)
> v4:
>    - Added Steer Semaphore for disabling and enabling multicast
>      operation(soham)
>    - Increased device recovery check timeout from 5secs to 10secs
>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>      Jani & Kamil)
> ---
>   tests/intel/xe_err_injection.c | 382 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 383 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..2f5f85b07
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) MMIO based Error Injection
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: Error Injection
> + * Test category: Functional tests
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_ras_nl.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/* Steering Control Register (MC_PKT_CTRL) */
> +#define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +
> +/* Core Compute Uncorrectable error injection */
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +/* STEER_SEMAPHORE_MGSR_3D */
> +#define XE_STEER_SEMAPHORE_MGSR_3D 0x00FD0
> +#define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
> +
> +/* Node types for error counters*/
> +#define NODE_ID_UNCORRECTABLE_ERROR 1
> +
> +/* Error types for error counter */
> +#define ERROR_ID_CORE_COMPUTE 1
> +
> +enum {
> +	SUCCESS = 1,
> +	FAILED,
> +	TIMEOUT,
> +};
> +
> +static bool run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	bool ret = false;
> +
> +	igt_info("Running compute-square on all engines post %s\n",
> +		 state == POST_ARMING_INJECTION_WL ? "injection" : "recovery");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		ret = xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM);
In case of multiple compute engines the previous error codes will be 
masked.
> +	}
> +	return ret;
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static bool acquire_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	uint32_t regval;
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10; /* 10 secs */
> +
> +	while (time(NULL) - start_time < timeout) {
> +		regval = xe_mmio_read32(mmio, XE_STEER_SEMAPHORE_MGSR_3D);
> +		if (regval == XE_STEER_SEMAPHORE_MGSR_3D_VALUE)
> +			return true;
Would a short sleep in between reads be gentler here?
> +	}
> +
> +	return false;
> +}
> +
> +static void release_steering_semaphore(struct xe_mmio *mmio)
> +{
> +	xe_mmio_write32(mmio, XE_STEER_SEMAPHORE_MGSR_3D,
> +			XE_STEER_SEMAPHORE_MGSR_3D_VALUE);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct igt_drm_ras_nl_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize socket for get_error command (ret=%d)\n", ret);
> +		return ret;
Return type is uint32_t but ret is negative.
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +		igt_drm_ras_nl_cleanup(&ctx);
> +		return ret;
Ditto.
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_drm_ras_nl_cleanup(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg(const char *marker, int elapsed_secs)
> +{
> +	static const char * const dmesg_status[] = {
> +		[SUCCESS] = "AER: device recovery successful",
> +		[FAILED] = "AER: device recovery failed",
> +	};
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	size_t i;
> +	ssize_t line_len;
> +	FILE *fp;
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		for (i = SUCCESS; i < ARRAY_SIZE(dmesg_status); i++) {
> +			if (!dmesg_status[i] || !strstr(buff, dmesg_status[i]))
> +				continue;
> +
> +			igt_debug("Found \"%s\" in dmesg after %d secs\n",
> +				  dmesg_status[i], elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return i;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return TIMEOUT;
> +}
> +
> +/*
> + * TODO: AER device recovery logic is pending to be implemented using
> + * "uevents emitted by the aer driver" instead of relying on the dmesg
> + * logs.
> + */
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 10 * 60; /* 10 mins */
> +	int time_interval = 30; /* 30 secs */
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return FAILED;
> +		}
> +		if (status == SUCCESS || status == FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
Could it be renamed to assert_aer_recovery() ?
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static bool uncorr_error_recovered;
> +
> +/**
> + * SUBTEST: inject_core_compute_uncorr_error
> + * Description: Inject a Core Compute Uncorrectable error and verify
> + *		AER-based device recovery.
> + *		The dynamic subtests are:
> + *		inject            - Injects Core Compute Uncorrectable error
> + *				    and verifies device recovery.
> + *		post-recovery-wl  - Runs a compute workload on all compute
> + *				    engines after recovery to confirm the GPU
> + *				    remains functional.
> + * Functionality: error injection
> + */
> +static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	bool ret;
> +	uint32_t counter_before;
> +	uint32_t counter_after;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
> +	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
Inverted xmas tree.
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	counter_before = get_counter(node_id, error_id);
> +	if (counter_before < 0) {
But counter_before is unsigned.
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to read error counter before injection\n");
> +	}
> +
> +	if (!acquire_steering_semaphore(mmio)) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
> +	}
> +
> +	/* Arm the injection sequence. */
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       XE_WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +	igt_debug("Injected Core Compute Uncorrectable error\n");
> +
> +	/* Run traffic to trigger the injected error */
> +	ret = run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +	if (!ret) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to run Xe compute on all engines post injection\n");
> +	}
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +
> +	counter_after = get_counter(node_id, error_id);
> +	igt_assert_f(counter_after < 0, "Failed to read error counter after injection\n");
For an unsigned value this is always false, so the assert seems to fire 
on every run.

Regards,
Soham
> +
> +	igt_assert_f(counter_before != UINT32_MAX && counter_after != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     counter_before, counter_after);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 counter_before, counter_after);
> +
> +	igt_assert_f(counter_after > counter_before,
> +		     "Core Compute Uncorrectable error injection failed: "
> +		     "before=%u after=%u\n", counter_before, counter_after);
> +	uncorr_error_recovered = true;
> +}
> +
> +enum xe_err_injection_type {
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
> +	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
> +};
> +
> +static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> +{
> +	switch (injection) {
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ:
> +		test_inject_core_compute_uncorr_error(mmio, fd);
> +		break;
> +	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +		break;
> +	default:
> +		igt_info("Invalid Error Injection specified\n");
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
> +			      "forcewake_all is not available in debugfs\n");
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require_f(xe_mmio_is_initialized(&mmio),
> +			      "Failed to initialize Xe MMIO access\n");
> +	}
> +
> +	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
> +	igt_subtest_with_dynamic("inject_core_compute_uncorr_error") {
> +		igt_dynamic("inject")
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ, &mmio, fd);
> +
> +		igt_dynamic("post-recovery-wl") {
> +			igt_require_f(uncorr_error_recovered,
> +				      "Run the \"inject\" dynamic subtest first\n");
> +			inject_error(XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL, &mmio, fd);
> +		}
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..c8a4c9a6a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -294,6 +294,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
