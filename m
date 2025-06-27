Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B5FC77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 08:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960010E979;
	Fri, 27 Jun 2025 08:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCLq5sxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC6D10E979
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751012295; x=1782548295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RO0+lEEfGb6NHAXn8TXbnXciQTyaCRpY8VMSAfvXey0=;
 b=DCLq5sxJS4PK9cTAWLbaeSY9EPhNV6Rj/73gKDjKQfhjx0jTwnBuLESD
 v1EXk1fH9WPclHnJwMPrv2BsY89wWrbHf0wa/jVu+Ulj+IBftcDnyQWRN
 qlVAQhz/+WSLKFOO1rJpzN3gKtFRtmmwxbpPyTxQ2XdZDNEWJmcUevjax
 FsbAUpJ8empigIVuHO4CI0plMQsaQFHbwPxJ+Cy5wiC304CqfJ9jaTWap
 ngHghVUHTaZl9RWrOBiIj7FWrrZMl2wca16K9Jm9hrilPH3rtJcJbWpYA
 b1E+t7TkN0EpgKDjXAyOVyfxDch9DcUn/5qFrsry+38Tx9c8kmumoSjLa w==;
X-CSE-ConnectionGUID: ftVsKtPJQoO3hQFNzqmhbA==
X-CSE-MsgGUID: CMkcPwqfT8KRgvIDQHoe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40941320"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="40941320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:18:15 -0700
X-CSE-ConnectionGUID: iNhKcxspQLOeoMlpJGVlfw==
X-CSE-MsgGUID: xVirAAJBQc+P0mMEqqIKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157129136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 01:18:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:18:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 01:18:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 01:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJGo2O5m/8Y94sC+ScSevtPeH7DNwXuZnxbsdQfTgquQOqAKgsjtDuUm50x1FEkqTkdXFdfFGo9BhRROjfxOrSXDMzqvyKitxkFH4b2Znt/qVbVd/g8TvnA6XgC+L7rzpr3BLK+8JlWVkr1g80Evmoe4Wt1Ojr07d7pbMPGuwUX2kGNiun91tE5PpCU4qPEYUS42QaDZn3mnh/cnLYQq9Trd3FLQx5hukmkpe2wLfqNzKtXdgjvGB+7q5knN18Y3g6bZ7onYzVYx4tf6hlwnasXY4P8UJtGjtYqYHJgNAx4WqyhH204Tfe1P1692UD0YMzCHHOWlEQ4YnYb5U6lKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1TFdfZ6OSUkkg0ER6wsGa17Yg9CXCh+oMzZR7oOw1Y=;
 b=a9CvEF00i+5zVxM8jUbo5ipz6bQXNouf8n/PL9YGHqQifsl3wo7TzM4PusPTn9BWMYLvxlVKiCym85rhcNSuxhgn3f/uE40oNvwtzmHtQCBcbZAd5Dnz67yokvQNtvXlGXm3yFHXh3Ka5LqagN9cRbAgDEqMpa2VUiZwQs0d6QXDRcSiu314WJTHpqtP/5JNI8DdgU6mXlS5NHw0k4B6Skg5JO0SkRmv2DnRKhpN3F4SjvGJSfFBzea6QaqpeI2ZqjYawPtIPHvTfF73bNi9fdGcmXUJyo/7tvUZF5s65PRYtFIH3rU04RuFexYZcZm3mnrpF57VvQ2sLA1nSwI3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9345.namprd11.prod.outlook.com (2603:10b6:208:56c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 27 Jun
 2025 08:17:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 08:17:39 +0000
Message-ID: <59b10b8e-99db-48b1-851a-eb52f4ed3183@intel.com>
Date: Fri, 27 Jun 2025 13:47:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/5] tools/gputop/gputop: Enable support for multiple
 GPUs and instances
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
References: <20250626091626.3760324-1-soham.purkait@intel.com>
 <20250626091626.3760324-6-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250626091626.3760324-6-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: bebc9124-a025-49f5-0753-08ddb5531479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2NIcE82Q3FtRmlkUGdhTGVTZDhLMnkxNitFZXhqdi9sSWkzaXEyd3VucUxP?=
 =?utf-8?B?KytseXNrQ0ZRWGgzeTQ0VDFndDJoRVdKWFpEUXprakovMTcwMkZJckJnVXZB?=
 =?utf-8?B?TTIvZmFhNWs2cVhkWHEwUmNZYytLS09TTzd6eGRUT2J5a0xyRXhEbnFVbHZ4?=
 =?utf-8?B?VVJxWEtkVmI1MTZna3E1OWhLSkRKMWxxUEU2R3NYdzdmWkswK2Jnbm4rSkhi?=
 =?utf-8?B?QmFCK0ZUdHozZHFWcUhRUGo4dWxIbk9GKzZnY2FNZUN6eWxVWjZPeG93ekQ2?=
 =?utf-8?B?RWYySzdOOUdsa3NVMmpxbkk2dFEwdlFhb3dtem1vdE5PbW1JclJlOTNnenFL?=
 =?utf-8?B?SkRZQnRRUEtxSXl5SFU3allBZUthR1I0dlNLTDZRYWNCUllLY3JyZHQxaWsr?=
 =?utf-8?B?T3lPem5oS3orK3BORDZHaHpqQ2VsOW9FK0xQTzNSTUFRSjNRSU1ndllGV0Nm?=
 =?utf-8?B?bUR4N21tUnZSYnZFSjNsRDdWcG92bDdFNGx2RVY3NUNzeWtRbGdCVGdoN1M1?=
 =?utf-8?B?Z1F6Q1hQRUkxdzFFeUEwZWRLdk1JeUVVRDgzZENROHlyeXAyS1dTNTlhaFFw?=
 =?utf-8?B?clZzbEY3ZkFDUDg5YlpxY0pON1VZWnFBdEZlUG96TFkrQjFRdjNqRDdxSW9T?=
 =?utf-8?B?d3c2TGxBQTU4ME9EM1pCVW9vMEhqdWVuVk5BQ1VhMm1BZzJ2MXB5dHhtWjlI?=
 =?utf-8?B?K1o3dnRsTjdWRUo3NEplcUV6NHVVMm9SUkt0S0dXeERjQ2gzTWk2dkpncjJ2?=
 =?utf-8?B?MHpieDJYSTBVa21ySklXR3VXNWZlVUNzZUVsS29KQ2xqRStqZmpGRkJXc0I0?=
 =?utf-8?B?Zzl6a0VVRmF4YWlXVnIwQ2pqNHdtb24xTHhYOEdrNUVFa2Yvd1JqQW9zeW5y?=
 =?utf-8?B?d0Zvd3Zic0NDMVpNbldFNkJBN29GeGs4RTdaWFFvcnNQenliYTdHZitKeVBi?=
 =?utf-8?B?RXVNdDIvbGhJcUM1VXExenhnZzhWS1EvdEN2WUJJRnNQUllTR0kxSVVubXEr?=
 =?utf-8?B?NG9CcTRZWml3MDUrcHV2OGFBankyVVpjbEUybDFCMUhBUm54NFEzZkFxUTA0?=
 =?utf-8?B?Y1VFZS9HSGhkaWlKbGl4U2Q5SDczMzF3MXgwNmx3NzVvMm1uMDFmWGxjblJS?=
 =?utf-8?B?TGVWU05wbDlHejBndWZxYmhITkN2SGsyTUFFQXBpNERCNUJ1T0dCWEpwa0lG?=
 =?utf-8?B?L01Cd1ZTQWFZY0VlQ2dzeDliY1lSY1E5Qm5YRmpnc1ZNaVZ1dE9acVduaHo4?=
 =?utf-8?B?YXdWL0IweFRodDJlb0JFNDMxZXlyZzZNMktpNVBMbE12SFc0WGJPUm9OVG9B?=
 =?utf-8?B?MGpiRkFLRkNjMWxJMnJKN2FsRlcyeXE4dTJobWlHRS9IZTFaREIxTkZ3S3c0?=
 =?utf-8?B?TnY0ZTd4RnBjcDNoWmtvZ1pNNmt2VTRvdjVzR1hBSVNjUXZCaTVwTWdxYXl1?=
 =?utf-8?B?NmpZb1lhSTVpdFNjS0MrMnh4Wkx1eDN5Ly91TFJqR0lMdTU0dVlrTFFQdGFj?=
 =?utf-8?B?YWxVbHFZTVVjakQrQVF2SGhZVlJnVUZPMjk1MHBSS2h0NlkvbUpxZmU3WjRQ?=
 =?utf-8?B?R20wUGFJeW8wYXdCQ3h6NEoveDlmR0lRQzhqWWF0aFhvTjdKc1g4cGxKQldo?=
 =?utf-8?B?SFlTWUVvb0NpTVJmbklyV1pzM2Zac1lReXRsY2IyNWxxc21MWGFrMXpEb29E?=
 =?utf-8?B?Y1U2Vyt0R1JwaDJZaml4ZVdtY2xKU1FJWkpnbnpuM1dDS2hRVE5jWE9lM3RT?=
 =?utf-8?B?dk9wUldJQ3FrZzUzQUFtTDMzczlHVFRHNEJQeDM3eWgrVGlGUlUxRUtMMWtt?=
 =?utf-8?B?eS9iMUc1ZVUvbXBDUnpwaE5NNlI3ajhJazhJRVU3YXRrZC90SkE0THNPTDEv?=
 =?utf-8?B?OTBIV2J6MCtrZkFtVEFoSTdjc0FvN2RveUxMVStKeFd1V2VZbkxnZ3JXbDJw?=
 =?utf-8?Q?gHHqXClTk3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Si9ub3ZmOVhZRFBJeEdpRzA0YnpGcHJFcEZMYmhaaFNKdFdub3FqWUNIMjhU?=
 =?utf-8?B?UHJaS3VxZEhHcFRUbVJ0RG40SnZuVlk5VHBtWm9uRFVLakM5QlMzWHpFdVpP?=
 =?utf-8?B?bFEzVnFRc3RSWmNncTZhN0kxaTNNdUJobjZUMXVYNkJoYVV1eGJQSytONFpT?=
 =?utf-8?B?VmhuR3Rxa2g3ZStGWjlLZFcxT0JkK3lveTdMUjZzQWRlc3VUbEk1a01jbTVZ?=
 =?utf-8?B?K2I1L1lsZDhJQTdSWUlJV0MvSDZZTVdwejJITk42VDRDWGhkN1ZqbUhKL1VU?=
 =?utf-8?B?UktwelhQdmt0QnNxQ2lDeElZOFY4S1U3ZUo1cWkxd3dKK2xCWnJBTVJHdVZM?=
 =?utf-8?B?SWFObnF1T3QyY1BHWEJxVWN5blNQb2F6Ukt4bFBzRU5BdExhc0pqZVJhdVlC?=
 =?utf-8?B?Vy9CalJlQTBGMjU1WjB3aVVPY3VTWDMzL2pkc2t5TXl6OXlGQUc2a0VjTHQr?=
 =?utf-8?B?dXVzNEdINUUwN3JmUlJTN1JTc29uREJIekNOM0FLTXZFQjhpMEVYOUpVek9T?=
 =?utf-8?B?SXpMOXo0MTdxWjg0cFQ3aTJHRWRYb2hoUWdqc2N2ME1UTmxMaDZYSkJmbmcy?=
 =?utf-8?B?YXg1L0VuMzNYZTFQZ21veVVGUnhrMGdVTUY3OUZBdnc1MjZYcXZxUDkyVUpN?=
 =?utf-8?B?YWFXc0RuZXBabmJsak0vM3RhUkpBWjhnWHE2QUQyTjh6K2Vkb2FsZE9KeTBM?=
 =?utf-8?B?OHJGcGI1UFJzc2J0S1RjM1llYUZ0VWZYc0h6bEYwdmhOK1JZZytKRVdrMWYx?=
 =?utf-8?B?WEVTbjc0VlpCZWhYZXhQQjBwTmFNcmhKbGRmM0hNM0xZZjJ6Mll5S0VZaUFS?=
 =?utf-8?B?Y3h0blNtQWhOY3lJSlVoNDNEbVFqODEyZkx5MnAxQzVoNHRCbkFsSnlJQW9Z?=
 =?utf-8?B?OFdDUkJ1MEVkODlxbmJtMUFhN0tlZkEwNW5QSHFSZE1kNEhpYVpkcUROZHd5?=
 =?utf-8?B?b2ZacEZkdUt1czE2ZHlxNW5wUGFGR0tmTnMrdGxKOTZjTlBHdDhyNHBwNU81?=
 =?utf-8?B?UzFLR0J6WDgrSWp1WnZRelhEdFMxNEhEcEpBVmpYeHBOKzE2dnpxMnVxRnVw?=
 =?utf-8?B?enJaQ01YeTNxZUJtNlhTNTI3Q3IwZmphQkF3SXZXMXJHRjRIcll2TDBzZVh6?=
 =?utf-8?B?SGdjZnFTMm5FZkptbEM2ck52TWk3MVJIcUZPSVY5YndlT2JBbjJhdjl0cGdP?=
 =?utf-8?B?ajFJSXdDSXBGbzErUHovNFdzWEI4dndWYU82ck1udG1nbHdtT3V2NFMwOEQ2?=
 =?utf-8?B?bEVxb2tDVFpXa1FvcmRlL2lxSDJZY0hOSGUyRlhPMjFaWWhnUWNLSWoxSUVT?=
 =?utf-8?B?NEx3Vk5vcFBDWUhhSmZHamJnM1NQUmdxOVo2Um90VE9wU01ObmdjNC8yaGxa?=
 =?utf-8?B?SFhXV3hRaW44NFRINCtXdUdXUW9ObnM2K09yWjlCYiswUUxvV1M3NDkzZ0xw?=
 =?utf-8?B?akY4aFZkNzJFYWdSSHYwN1lYTk01ZmtwRHhQSGN4N2l6T0diZDNjOTZGWkN2?=
 =?utf-8?B?Y3QwcVlRT3F4WHZoNU1oUzZiUTBQR2xEc1F0S2dZVit3cy9EODFlZ3RNTVA4?=
 =?utf-8?B?N1RBdXBqZ004WkEzUFVhK2pTKzdBTFhuSlAwZnVBdXVmMUY0b2g3dDVyUjht?=
 =?utf-8?B?aXBIVjBKTWNrTnFia0ozcXgrRHNzV2JnMnJodVFWZTBrRlN4cFd0YklJb3BS?=
 =?utf-8?B?L016ZFJmekJxMWRJOHpsN1dlcUVmUTB5Umt3WFVMekxTc1FmMlVTWGU4ek9L?=
 =?utf-8?B?UGFZM0lXeUt3UkI0T05hTEtwblBSQVZ3SE00T1NxUzJ6dWlLRms2Q3Q4UFBm?=
 =?utf-8?B?aUdHM0FRK3cvcnJsNzh5SnNsRVlLcGVBc2VYMFhKUWZPdytXMVNaMlBUc3M5?=
 =?utf-8?B?bVlGcmhwK1pDRGcyS3ZueDYyOGovdjdORGhQcHBHNzBxSXlwTjlvNVlIYXBK?=
 =?utf-8?B?VkFwbWgzcjc5cGxMNkR0QU1ybmZ0SzVISWZMUjZJanJIS1BNT0dvNmNpNTNl?=
 =?utf-8?B?NVdKODhVV205bGErbmVFSEJBVTRlRW44UFZpbzVvczZvS0ExWmgzUVNtT2Jp?=
 =?utf-8?B?OVkvSitpR3dZRTZFbjZvU2l1cVVVR0E1ZDBTOSsrVzdPTlY5SHZqZFNBWGJE?=
 =?utf-8?Q?2jJFmBNfS+DJIdn4WF38nnXZ8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bebc9124-a025-49f5-0753-08ddb5531479
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 08:17:39.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9RyeoNV8tjFbru3yx6WrtpYwV/HpoTdkFHMGBqhSwpjVRBfb9k0Fx9RPOwL2p4G0pYXs1fGVmfPuSP+SrMBYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
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

Hi Soham

On 6/26/2025 2:46 PM, Soham Purkait wrote:
> Introduce vendor-agnostic support for handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability to various GPU configurations.
> 
> v1:
>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>   - Add device filter to populate the array of cards for
>     all supported drivers. (Zbigniew)
> v3:
>   - Cosmetic changes. (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tools/{ => gputop}/gputop.c | 237 ++++++++++++++++++++++++++++++------
>   tools/gputop/meson.build    |   6 +
>   tools/meson.build           |   6 +-
>   3 files changed, 205 insertions(+), 44 deletions(-)
>   rename tools/{ => gputop}/gputop.c (64%)
>   create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 64%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index f577a1750..4b2718206 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>    */
>   
>   #include <assert.h>
> @@ -14,66 +14,149 @@
>   #include <math.h>
>   #include <poll.h>
>   #include <signal.h>
> +#include <stdbool.h>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
>   #include <sys/ioctl.h>
>   #include <sys/stat.h>
> +#include <sys/sysmacros.h>
>   #include <sys/types.h>
> -#include <unistd.h>
>   #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>   
> +#include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_drm_clients.h"
>   #include "igt_drm_fdinfo.h"
> +#include "igt_perf.h"
>   #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements when implementing support for the
> + * new driver:
> + * @drivers: Update drivers[] with driver string.
> + * @sizeof_gputop_obj: Update this function as per new driver support included.
> + * @operations: Update the respective operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
> + * initial values.
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +    /* Keep the last one as NULL */
> +	NULL
> +};
> +
> +static size_t sizeof_gputop_obj(int driver_num)
> +{
> +	switch (driver_num) {
> +	case 0:
> +		return sizeof(struct xe_gputop);
> +	default:
> +		fprintf(stderr,
> +			"Driver number does not exist.\n");
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +/**
> + * Supported operations on driver instances. Update the ops[] array for
> + * each individual driver specific function. Maintain the sequence as per
> + * drivers[] array.
> + */
> +struct device_operations ops[] = {
> +	{
> +		xe_gputop_init,
> +		xe_populate_engines,
> +		xe_pmu_init,
> +		xe_pmu_sample,
> +		xe_print_engines,
> +		xe_clean_up
> +	}
> +};
> +
> +/*
> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
> + * and related info discovered per driver.
> + */
> +struct gputop_driver per_driver_contexts[] = {
> +	{false, 0, NULL}
> +};
>   
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>   };
>   
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> +static void gputop_clean_up(void)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> +	for (int i = 0; drivers[i]; i++) {
> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
> +		free(per_driver_contexts[i].instances);
> +		per_driver_contexts[i].device_present = false;
> +		per_driver_contexts[i].len = 0;
> +	}
>   }
>   
> -static void print_percentage_bar(double percent, int max_len)
> +static int find_driver(struct igt_device_card *card)
>   {
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> -
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
>   
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +static int populate_device_instances(const char *filter)
> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_driver *driver_entry =  NULL;
> +	int driver_no;
> +	int count, final_count = 0;
> +
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		if (strcmp(cards[j].subsystem, "pci") != 0)
> +			continue;
>   
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +		driver_no = find_driver(&cards[j]);
> +		if (driver_no < 0)
> +			continue;
>   
> -	putchar('|');
> +		driver_entry = &per_driver_contexts[driver_no];
> +		if (!driver_entry->device_present)
> +			driver_entry->device_present = true;
> +		driver_entry->len++;
> +		driver_entry->instances = realloc(driver_entry->instances,
> +						  driver_entry->len * sizeof_gputop_obj(driver_no));
> +		if (!driver_entry->instances) {
> +			fprintf(stderr,
> +				"Device instance realloc failed (%s)\n",
> +				strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}
> +		card_inplace = (struct igt_device_card *)
> +				calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
> +		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
> +			card_inplace);
> +		final_count++;
> +	}
> +	if (count)
> +		free(cards);
> +	return final_count;
>   }
>   
>   static int
> @@ -333,6 +416,7 @@ static void clrscr(void)
>   struct gputop_args {
>   	long n_iter;
>   	unsigned long delay_usec;
> +	char *device;
>   };
>   
>   static void help(char *full_path)
> @@ -350,16 +434,18 @@ static void help(char *full_path)
>   	       "\t-h, --help                show this help\n"
>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>   	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-D, --device              Device filter\n"
>   	       , short_program_name);
>   }
>   
>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   {
> -	static const char cmdopts_s[] = "hn:d:";
> +	static const char cmdopts_s[] = "hn:d:D:";
>   	static const struct option cmdopts[] = {
>   	       {"help", no_argument, 0, 'h'},
>   	       {"delay", required_argument, 0, 'd'},
>   	       {"iterations", required_argument, 0, 'n'},
> +	       {"device", required_argument, 0, 'D'},
>   	       { }
>   	};
>   
> @@ -367,6 +453,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   	memset(args, 0, sizeof(*args));
>   	args->n_iter = -1;
>   	args->delay_usec = 2 * USEC_PER_SEC;
> +	args->device = NULL;
>   
>   	for (;;) {
>   		int c, idx = 0;
> @@ -390,6 +477,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   				return -1;
>   			}
>   			break;
> +		case 'D':
> +			args->device = optarg;
> +			break;
>   		case 'h':
>   			help(argv[0]);
>   			return 0;
> @@ -429,6 +519,56 @@ int main(int argc, char **argv)
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
>   
> +	if (!populate_device_instances(args.device ? args.device
> +				       : "device:subsystem=pci,card=all")) {
> +		printf("No device found.\n");
> +		gputop_clean_up();
> +		exit(1);
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (per_driver_contexts[i].device_present) {
> +			for (int j = 0; j < per_driver_contexts[i].len; j++) {
> +				if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
> +					fprintf(stderr,
> +						"Failed to initialize engines! (%s)\n",
> +						strerror(errno));
> +						gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +				ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +							"\n"
> +							"When running as a normal user CAP_PERFMON is required to access performance\n"
> +							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +							"distribution vendor for assistance.\n"
> +							"\n"
> +							"More information can be found at 'Perf events and tool security' document:\n"
> +							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		} else {
> +			continue;
> +		}

Remove this block. Not required

I had suggested

if (!per_driver_contexts[i].device_present)
	continue;

to avoid three level indentation.




> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0;
> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
> +		     j++)
> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> +	}

you can remove brackets here. But upto you

With the first comment fixed
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
>   		exit(1);
> @@ -449,14 +589,33 @@ int main(int argc, char **argv)
>   
>   	while ((n != 0) && !stop_top) {
>   		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>   
>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0;
> +			     per_driver_contexts[i].device_present &&
> +			     j < per_driver_contexts[i].len;
> +			     j++)
> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> +		}
> +
>   		igt_drm_clients_sort(clients, client_cmp);
>   
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0;
> +			     per_driver_contexts[i].device_present &&
> +			     j < per_driver_contexts[i].len;
> +			     j++) {
> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>   		if (!clients->num_clients) {
>   			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>   
> @@ -464,7 +623,7 @@ int main(int argc, char **argv)
>   			       (int)(con_w - strlen(msg) - 1), msg);
>   		}
>   
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>   				break; /* Active clients are first in the array. */
> @@ -488,11 +647,11 @@ int main(int argc, char **argv)
>   	}
>   
>   	igt_drm_clients_free(clients);
> +	gputop_clean_up();
>   
>   	if (profiled_devices != NULL) {
>   		igt_devices_configure_profiling(profiled_devices, false);
>   		igt_devices_free_profiling(profiled_devices);
>   	}
> -
>   	return 0;
>   }
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> new file mode 100644
> index 000000000..4766d8496
> --- /dev/null
> +++ b/tools/gputop/meson.build
> @@ -0,0 +1,6 @@
> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> +executable('gputop', sources : gputop_src,
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> +	   install: true)
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..99a732942 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,11 +70,6 @@ if libudev.found()
>   		   install : true)
>   endif
>   
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>   	   dependencies : tool_deps,
> @@ -123,3 +118,4 @@ endif
>   subdir('i915-perf')
>   subdir('xe-perf')
>   subdir('null_state_gen')
> +subdir('gputop')


