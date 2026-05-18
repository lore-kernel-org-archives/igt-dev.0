Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF15CD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 10:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8610E79E;
	Mon, 18 May 2026 10:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvnFWPpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882610E79E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779101630; x=1810637630;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GBmPrKxiI+079qGCHYBJCbBGMcjjNhtSURf+bvY03AU=;
 b=JvnFWPpySbQ5AZMhNRBqNzKGynwhIBn56PS+pQdQ7kA2HVABlheh5Cfu
 P2M5oCbvlbCa1kKj6YrfpKjM6tC0+MvadlEhhdUeoPErzC04jaBDG69MQ
 dY4KAJHegIpeJDA+iAdesYFWlIgUt1ZlpcKJyNYPk6wwAC4O9Nlw3l8Sz
 dLvQmqxAGmTQzpAOG/GvSVdiUh8wsD7jNGcQ8KEg1cmBAlMFmUDi7Gw6t
 YLswlWCRUkzJZxBHtGFzqDCdVsXHdRN4Uklh6X7xmUwFYUhpefeCVs1zr
 5uPoLJe4v5Np66kvGqVNRP9hbZCYEYSviqqTsKOnEQT7asDcc9kVWncDi w==;
X-CSE-ConnectionGUID: ktkUxZsAT2GHB2sBeEJPQw==
X-CSE-MsgGUID: hs8AFIoWQRe93NZhIAfHHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97381627"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97381627"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:53:48 -0700
X-CSE-ConnectionGUID: 5cDmDhtTT6m4chk9rZT6Bw==
X-CSE-MsgGUID: 2cdMjH6sTvi0xvkQGVadhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="238396500"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:53:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:53:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 03:53:47 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2jcep5cGKOPk/HkFWqGTsEQ/ZMIGS7J99R87On53gJ+bqefcxgr39iGsRiuzplNehRZ1rZIJAINxK3wr81XB5WRszX3HV5saiLymFhZ60PL/j4k0+vLyKY+6cDQtiIs3UcM/mVgndAyfD7+MUVAVrhHVMkSbgVdOjQ8VFsKZtjuVDjZyGhjgG88a9fJxmD99iO28lfOKriSoOPro3OPh+AZHhIFNnF8NVBnV+i7IS+SrWt4jkuJo5c+onabgeYBKcZB3fGiInyhVJoWl49s7AS4LP05oiIGG65oamPF05dIFjZ3BgekqU6v7ctCU7nDx/XCm4txAyA7gMIrfrAZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTDrLWvAn2KD97L+NZdnmneYFv1/TXdjLZlbU6FSlVc=;
 b=nuEW1kI5G/YHOpyBU30VWoem5oZhc/HMaOIqopl6lWg/1krxkc2HqJZ6gH71jGU/qkvkHhgi8LX1KWjTJFE8DkCy40EMT03qhqWItcoLWg3j4OFnGS2na8CFHZk1NC+4gp9drdQRiX6B6053dCMqnbuOYwIONp/K+1uTKNFPM6m3tWzEpvF4i1piLfADzgF9fdLWlEr+vCA0/KiDl6nBaqShecj7n7GJscQUuAYn3b66L61jES2IZBRi7Rwvgy/j5/BGhzbWuuBzsMR+BcO3O252fiCRAjSwrS92iRra54qF84Xun6pjraPBpv2V6upG8qeu8+DGNySQCZ7bKx3+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 10:53:42 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 10:53:42 +0000
Message-ID: <6da78c43-3469-4272-be93-5cbb76c1fe02@intel.com>
Date: Mon, 18 May 2026 16:23:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_crc: Use SUSPEND_TEST_DEVICES
 for MediaTek devices
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, Karthik B S
 <karthik.b.s@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Fei Shao
 <fshao@chromium.org>, Jani <jani.nikula@intel.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Manasi Navare <navaremanasi@google.com>, "Gil
 Dekel" <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-3-jason-jh.lin@mediatek.com>
 <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::11) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f8b093-9447-48eb-6d48-08deb4cbb9af
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4143699003|11063799003|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Y2UqKGchW0FUaBckhkjAH1hrXKHaB7KRV5VpTW5xDJexhyNBmI6OTFgy1yJEO4TW7ZnPEAmhN60KYXeUj9QK0Qt4cyqx4pI+RbrINCUWzBl6itFBj0Oq8j356hxgkDHTkSbur2ez4W/EfXNBw/kSmESpco4yy8ol9/RnLSnmQnC+Qg28qlswM13Hg0E2P6HN+2EPAh8foOBZXdCizAITb0Tv4rFyVYDxJRBYNBPEGt/dLseAXQVF8Kr+5lI5DoO8gJuCYeGM4V1ozJxjuXWK8b1lo/Yi80WYX2oZUD8dnYVqc1oC+sccfBv4qvT3G9PMSHBZTOCnDVAvnozQcbjo0zdlVk7I86tA1RRaac5H8ATZKA7JWWYfTaHpR52/bpe9EkEfbHBiRf6bZxTjSfzgbjng3KxftTqAXnuyw1+Mj3up+/pzmuy9K9hQfOjr7OhHOER32rPC/KoijdYDywNx0od78ui+gY0n8nEBxJK4HABIkDIWTs/w/2V7Jjyx1zIp1UwwsJWrBpRY1K8V0bW11UE/5+ozf8bqgJ3SmPZBsgtbAxhsd0NQftglmZVT+ysaTcmRGWlUiStv06UotniHZIjtdliqxgqa5FdWf0+tw9/mFzGOSMVEcmVys0E+4fAyTBmoo5NdMta3mzKrcCBeDKuKvqfwu/LUs63uYQRdcezk9yNwA0bSLTObWsE0S+SXfVknJshB2qdg9coRegH5zt15vXqE5ZmBrbifNnoOQCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799003)(921020)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzdlTk1KMjFiMG1NeFNORzZBRmwyWlRrRWFMd3JJYVV5SU5jeFpaaWwxcUZK?=
 =?utf-8?B?ZG5yRXN0SjNUd2lYNWFpS2UzK2dodTZwU3JhWVdvSXZUUjlDb1FDbnpMVUlW?=
 =?utf-8?B?L0YwQ05GMHhxVFJkR0VlVkZKdkZ3bkRGaCtEcTlWSHRFdDZjeEVwNGh2TDU2?=
 =?utf-8?B?Nlg0WjlkWGdwR1U0cWpPWUs3MmphOG5yN3YzdEJUV0VWamEwbWtwUzhkdUh5?=
 =?utf-8?B?Y3dSUlFOSzdBMlMyMGVkSHZ1MTkxVStqdVZqSE9XSjVSZ2UzZXN2SFVaK25E?=
 =?utf-8?B?WGVoY2t4cXpTWlc0Q3hoOFZZSllGVUsyMVJDdklUelkvZnVmSERKdXAzVzdU?=
 =?utf-8?B?TlZObkhNazg4cUlBSGZtbFJVcEc0aWF1VE9iZS9rMlgrVEtySXBxNVZNQ2Qy?=
 =?utf-8?B?bEc0UkVUTGQwL1p4Y0hCN3JBNkdzZlNPdXR5NFpmbSttaWQyMFNOSDBZRHRN?=
 =?utf-8?B?dm1ZSm4zSHpDZXpOOGFXek5FZ3NCVTFibytKOWtBdW9BTTgwcnhnZ2dTTzc1?=
 =?utf-8?B?Wld2Y0ZkcnpvQllWeEFkRDRpODhqcEJQbVdBWXV5S1loRDdnbDJGZzdiZDlP?=
 =?utf-8?B?TGY1VmFvMEpSNGFYcGVkUjlDR2Q0a0EvNHRRblZrYXltS3pNTHptbXJ5QU1l?=
 =?utf-8?B?STNya0wyaU9ZMStxMEEvNy9NNnFMeUtxcVIzRDlyUlQxc3JId0JETEF0dXll?=
 =?utf-8?B?RTBTdnRQVVkreXZoRlE2b3N4d3pJSjd2cExoSXVvd05hZ2JTSmowSkY1TWFJ?=
 =?utf-8?B?YTZBQlBXQVZQWSt2VDlIS3dqRjFLOG12NmlXUm5uSjA4S1FxZnc4Y25iWmR1?=
 =?utf-8?B?STc4YThQUXpYMjFJTTN4YndXOFQwNEs4Z2ZUeTJjaldKMktjNFdTdmZGOFJI?=
 =?utf-8?B?bnJEbHRWdFBHaXZycnRScXAvMys3elNQZ0IyejNJckV3eExYUWNZQjhiQnhZ?=
 =?utf-8?B?bm5nYnQxVk5EMVlkSDJ4YWhxVncvLzRINEk4bkxqRGRodWp5OHZCTVZSUnlS?=
 =?utf-8?B?VlNuSXpTZnJqYmpUQjU5b0RJSVN4d0hVNmJLUlhXWW40RktOdzd6OU5OSEV6?=
 =?utf-8?B?Zzk5aHo3b015Sk9pYlpqRU01Znp0czRvUDFoYVZQd0lZNEI5M2FiQktMM1Jq?=
 =?utf-8?B?SUVIaFFCd3F5aXIyU2trSjFlb0gvanJEYlU0UHZTYnhua2dBamlOcFI5cno0?=
 =?utf-8?B?elY0bGhPTjAxMEJkYVlSWGViZXFpODRTUUFuNE1WOUJBaVhhWEIvSHR2Q2gz?=
 =?utf-8?B?MzE5eTl6RlpMVDk2MXpQRWhXd2YwNlRjYzVZTHRqa0ZQbnpjYmVTSGRNWSsr?=
 =?utf-8?B?NlpKNHcwRkFoMU9MVzVQajBOTTFoZ3cvb1BBY25GZC9PU3ZlaHRBQ05xQVBm?=
 =?utf-8?B?bTZFTS84OXQyVk1YdWVITmEwcDJjV0ZabUNzN0U1clJOQU1rRjR1TjhZOFU2?=
 =?utf-8?B?RFpXUTlabFlDbk9MYjYzalRGSzlxN1ZibjM2RnV6c3R2NVQrNWtZSzZpeTEx?=
 =?utf-8?B?MDkvaGloV3M0aWhvdVc1VGtzaXdWYlgvQ1NCRmFXRUNydUQ0QjIzRjErWnpM?=
 =?utf-8?B?Y3pib0JrV3pUQTY0a1pzODdPWURrY1dkemR4aHpUc3hlRWUyNzhOTGZ4UGdV?=
 =?utf-8?B?cnBNTERTLzNrMGJvNEFWSWpockdiaStLaDl1TEdqdlZNMXBMRElOYlRzdWtk?=
 =?utf-8?B?SVcvdzVOZXpjSzljYkVwM3IvY0czTzJQNDlDZU4wdE04ejhrQi9MRDJyakpB?=
 =?utf-8?B?T0VRZkdhLy9YTnpQSkpaaHpyU3QyWTJjbUIzRm82L0JqZEFscXF3OHovZEk2?=
 =?utf-8?B?bkdjakJtYWlDWkQ1cTE4bWRkQy9YT1k3MUJIdGl5Q0VsWlFQV1RSOEUrdkVD?=
 =?utf-8?B?MU00YlkwZDh0dytXMW9pZFdYSzN2S0VUUW9TK3B0YlFFdU5OdDhqVEVTTXJB?=
 =?utf-8?B?THVpTWdEUGx1Uk5CMUFJcTE0ZDZURmhkMEV2RjArcDBrVXJSZjdwaWN2dzMz?=
 =?utf-8?B?d0VlbEg1eitJeVZxdURINDNWZTRZVjBXdmw2dnU5WmRaUURMVUJsbkthd09I?=
 =?utf-8?B?NVhMWGhLOUdUTFRFRmJnMGlCMnB5OHh4Q0FxYWVTdGFhc1RtaVd6MHp3dDh5?=
 =?utf-8?B?TlVZOHJmVVp1dDNBVEVkRzhlSEdPSzlMQ1E2TmNuYnVpKzl3Wkl0aVg1UGpo?=
 =?utf-8?B?eUd4cFhxeHpjVGhRbElpN2NLNjkzUU01aDNYVWQzL3Fpa1FlTmM3QXVEMEVR?=
 =?utf-8?B?QWFCa3d6MUtSNG5FMW5qOFU5ZUdUSWJHcW9jakJCeUwxRmUwYkZpUjh1M1Ew?=
 =?utf-8?B?dC91OVpySHBHNnFqZHM0S2hyTFIrUUpuNXhUWFA3VkRKeFRPWFd1QT09?=
X-Exchange-RoutingPolicyChecked: l5iRXcO6QoZDbWNWyJEuFCezDSMMChA3CaHivASx0bkY1FhvXXxUIsibv8OBpxmy1nqbMLW6uLzXZPKIWWcG4CFB0CMakCcIPFxP0geclD5ZPnchmCCh+sqqeb/aatRmOAQ9v3H6VLjqm/P+j8qup39c7sai87AFAuQskPVAW5szngqOvu40cl8UDiAs9hDPcPUWBWgL60qhYnZDamWgiTlUE3Nt0g9+/9vSIxaOuLq4l101hgjBtuJRKujeusgNhk82Bu3E4SKycQU4DI/QZA2J7W2GimG6OGrpMeo6tMs4hBhjThUj8PVsJo8xL9jemBgnBY+Lhfh+eZGzYt+w/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f8b093-9447-48eb-6d48-08deb4cbb9af
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:53:42.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF3z6FnsIGgVHgL0D1xX8WK8SR0vrTBdqK54cDwNVyZAyBRJAmhRRQ5VxoXTcYHqdURH3csddlnxeruVWuHAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

Hi Jason,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-05-2026 04:19 pm, Kamil Konieczny wrote:
> Hi Jason-JH,
> On 2026-05-15 at 15:28:40 +0800, Jason-JH Lin wrote:
>> Use SUSPEND_TEST_DEVICES instead of SUSPEND_TEST_NONE for MediaTek
>> devices since rtcwake is not supported.
>>
>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> LGTM
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> ---
>>   tests/kms_cursor_crc.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 1249171dec56..5a6cc7717425 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -322,9 +322,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>   							DRM_MODE_DPMS_ON);
>>   			}
>>   
>> -			if (data->flags & TEST_SUSPEND)
>> -				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> -							      SUSPEND_TEST_NONE);
>> +			if (data->flags & TEST_SUSPEND) {
>> +				enum igt_suspend_test test = SUSPEND_TEST_NONE;
>> +
>> +				/* rtcwake cmd is not supported on MTK devices */
>> +				if (is_mtk_device(data->drm_fd))
>> +					test = SUSPEND_TEST_DEVICES;
>> +
>> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, test);
>> +			}
>>   
>>   			igt_pipe_crc_start(pipe_crc);
>>   			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
>> -- 
>> 2.43.0
>>
