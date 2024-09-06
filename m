Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC10E6FE41
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 18:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180A10E1AB;
	Fri,  6 Sep 2024 18:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9jpHjQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7510E1AB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725648450; x=1757184450;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AnyCYmX3DAWqEBMClJUKEWgqFeibswoVBmZyMNd1Wvk=;
 b=i9jpHjQ8JHfthl2+k2RZwdeqfCxoXeEY910/ONmAgeVj5lQCXB1x/NfW
 NRXoeQn9GTbFnTQNDEo9jSsdZrcQ82zWdbBvEG1sEdY0nQlX7yc6rL5bA
 ZElxnW/qrF4AHaiVitQJylOcw3+bTOU1m9tpfvctZbzsll8oeKEfVbnk6
 my52jpI6jTIO7o9wc7jJSvbGHG0+QS4Vl9QDw1bSLJUr3ls2NtEha5xC5
 BX+znyJo7tP3DJPuEMt/3LcFiue3VE8MaDWrY2wcMTMTq3zL9Pkdz1Kre
 QxCEg85WW1L3WBQvtxhawlqdxrkM2ht83Sc3GYR+0Xr5dF9H5dJg/wfHB Q==;
X-CSE-ConnectionGUID: C5sDr8PwTKmwzP6xv8YsKA==
X-CSE-MsgGUID: ACzkXPADROm4IIQNS6cGqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="46944952"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="46944952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 11:47:29 -0700
X-CSE-ConnectionGUID: PeDhucgySze7SHARsL7zrQ==
X-CSE-MsgGUID: UadxsbbTSdyqhPxa3VsfgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65673915"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 11:47:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:47:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 11:47:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 11:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5Zdrg7+VlJMIQbrDtJTmpWYkQYkB9UL1QVIHgoq/pCrFI6K1mMkFzr0OhW4sqQsyR4fvcfk44X/axlAMccFMueLqYNtARWpaG+fk0D6Rta/T1f5uI9iVpsQEUmR2vYUQu25KqXOfAVs2C7DHRkSFl/tbMVOeOAHIBic1yibmwop7uAPfVVbruwxdtaCZy1mRWMM/sKchpv45WW7AVHwFg+qvDfdp2tHtOSLQ2ObvlO97iYtMlqRSw5XZ+ytXuYgkfcC7xZTI2ySBWvt6kDhBa2T3zLw82IJl5c/GXiMZIYXObGlAhbfGudOEn+juUfnImR3kDYL49HubejQDjJckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynqfboEaVz42amzQSuLQggkxSG/121naEnIwGB86dDg=;
 b=ckQLCkSfWaCnGa2xqX+Xs/SuE31DsQzNIhr9mLPFblAEQiresSXHKpD96h/CI++0wkZglKupJQ+UUvBhhKsrM021SblY0l1YDxG9c5azcP07vjTMemzJyRn64Q+8QTbHl1DOHd+BQlYcIWBJDXj/QTWOaIOmvQEpryCIZ6/bnCJTNlWPOLU+UyXC8rLq4qZpvJtvSmWz2zebhzgfn6upOahmwY7N5L4cwrbuXVpfH/oOSPS0ac7XpIejc4JgWyI3EtH+S3QmmlVs22gzUanU9FEmUz3lGCX9uN4envp7LI2mA0tA95ESxDogbzbQtri+VUEmFhkFmI3jVIfkRwhr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 18:47:26 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 18:47:26 +0000
Message-ID: <a2b8a050-e19f-4d0a-bc70-71dbbbe04fa0@intel.com>
Date: Sat, 7 Sep 2024 00:17:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] RFC tests/intel/kms_frontbuffer_tracking: Introduce
 plane-fbc-dr test
To: <igt-dev@lists.freedesktop.org>
References: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b9c430-1274-4a44-bccc-08dccea45a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkNzdkt0bTdyRUZQNUVjOExnNC9pNG5TOVdDL3NYRTgwZFRwVWxKa2lPQitO?=
 =?utf-8?B?MllKWGc4QVNjRmxTUWk5dWR4UGN1a28zcWpFeXoxdnAzd09WNHd1SU5ReE1T?=
 =?utf-8?B?TFZ0Y1RSUGlXNkQzYWp5N0hjOHVzaFhHWUR4bS9CQTdnSDY5bjMxSlUyQmNT?=
 =?utf-8?B?VGNESFJoaUN2SnlySkc1c2hQZEdXaXdMLzR6cFVqZGU1NnFnSlgyVlJ3aElr?=
 =?utf-8?B?M0FCbWo3TFBxL3ZFOG1ab1kvdFY0dzdtYW5EQjJ2bExDL2d2Z3RsaE9iSGIw?=
 =?utf-8?B?c1pNTTB0eUVaaFpWbzQ5SGVIZnBrZUJpaXlnQTI5Z3NlOXQzYTFYNFQ1Vzln?=
 =?utf-8?B?ZkRyUGY4aXJnVmU1aXp3cStNOWlZaHpxZVFuMEtGWTlJd1RCdm8vL1paZ1J2?=
 =?utf-8?B?eE5XTnVPTmlibVVTS3pCU2xKZHdWTHpiY0JXZ0tOVHdPc0FlQW1LOFFRTmdG?=
 =?utf-8?B?QVdFRU5iOStyU0tRL1d2WTMzNTdTZ3RncmUrTGk1a2h3bWFvMjE5Qm81QzBS?=
 =?utf-8?B?YzJqNU13eDNZVTROa3dHY25aOU5CVSswUEN0MFAvRjhEdWp2cHk1RFgyWjFT?=
 =?utf-8?B?V0ZQYVIyKzhKM2tQdGFEZXZabVpaam5OTm5HQUZiMEhUR3hvMzQ3RVNBN1VF?=
 =?utf-8?B?SkplU0xCMUVmei9LcnYwUURBZnoybFlDeU5LK1MxS0NVV0xadVZxWE11YkN6?=
 =?utf-8?B?S3dqVldOQjFxd1BacTh4VG5jKzJraE1FWGpwLzQvUnRaV1d1aTByVzF4cUVZ?=
 =?utf-8?B?dTJMM09ueDNFZ0VCOTBhU2JEK3JnWThLV2daUGJhb013NDAyTGVZbC9OQlla?=
 =?utf-8?B?a2lmNU1tZXZWV3JFblE3QWErSDkySUdYOWtVSFhBSzltanN1TUlTUkJEZzBC?=
 =?utf-8?B?NmdQT1cvR2J0RWRBWDlCa1BDVFg3aUJWRjlOcTJiVXc1UHdBMDNUdVk0cVBr?=
 =?utf-8?B?Myt3em8rbUVCSWh3NkpOZklrVDczS3dEaHVrcEovNFFQcmVVb3FHK1QrYW9l?=
 =?utf-8?B?Rm9pVVU1NVl6Y01ZUHZMS0xkMnlEc3NHQ3RUQkxrdkp4TXdLbjY5TGhYMVlq?=
 =?utf-8?B?RkdqdzNHU1YzUytUTVdQeWMrVWtDeERUejBHclRlYm5RQkpTNlV4dmpxa2tz?=
 =?utf-8?B?Vk1MQ3B5ejUzWUNmOE5EVnVKc0dzbW5DdGI1WVJ5V2VvbzZMbjMvSnNrenpS?=
 =?utf-8?B?Y1JiWmFHTFc5dXk4bGU4anZxV1VSMHdqblhtZS8wTjVXdTRmT0FPQjVFeW1P?=
 =?utf-8?B?cEdPSmtqdlJrK2RlSi93blA1M1JmT3k4VW1Mazd2TGR0L1Bod2tZVE1MRUpT?=
 =?utf-8?B?NHJLb290c0tvU0JQSTZrNi9lRUQ5aUlGUXRDME1LTmExSVU2UUNTTkhKUjVO?=
 =?utf-8?B?S0x3ZFpXY3oranZqUnZESWRNNzFYWmxYd2NTUFZibHAyTWpZaGVkaUZjRG43?=
 =?utf-8?B?aUVtRHZITHdnNlJWbWhKZmpRTFhMQXNhUk5pZk11K1k2ZGJvY29UNHhTb0Zz?=
 =?utf-8?B?ZEdBWnhLZkovdEZ1dUlVWFQ1WjRLRE0xWVFuMkVyUVE4alFReTJlZnpWOVJm?=
 =?utf-8?B?cC9LdHJ6cnhTVGUvSGhSclJ3V21kMGdwRkdjUmlnSGNSKzdJYnlwRFJ4azIv?=
 =?utf-8?B?eUJ6dXlqWnJoS3gxa2lGV0tKVWxZZ2QydG13WmhsakhaTWpic3h0bGF2QVVW?=
 =?utf-8?B?SG5OdXJyTGc4SVdKOUttcmM5NER0R1l4M29XQ2htTXM1NUd2QVZSTjJtZEJl?=
 =?utf-8?B?NlpBOGVKUm0rTUZHVnJnWVdNUWNmTlF5c1o4cGozcjB4blBLVXJYdkRNamtu?=
 =?utf-8?B?Z2M2bnBMTXJqa2tad1JtQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9RN1BDaE1kbXp2OVFnbEwzTFN4d2lUNHhrY1o4SS82aHJXazFWZWZZbksz?=
 =?utf-8?B?V3AzajJNcFJQU3RuMGFLRUxPNjB5OE5aV3dRSmo2WTNuRmtvcXFoakZYSUxs?=
 =?utf-8?B?cjdldElMWEtoUTg4dDdpd1dBSUVVSzZqZmNyeXVEaUorNUxxVHBPMXVseFBR?=
 =?utf-8?B?N05TUHZOWWNweTd6a1FTK2taMU5aYnB1a1ErUTZnZzA0eHRrQmw5b2RxakVT?=
 =?utf-8?B?NWRDNnRDZEVMMXhwdE5EZzBqZmZxNlYwaVQySEw4NWxISUFoU2dHSVNMY0No?=
 =?utf-8?B?V083VHpuNUVxRlBJQWJySHNIQ0ZBZmZxeXpHcUFid3lBamhWMG9JQWxyRHIy?=
 =?utf-8?B?NnlzZ0pranJtRGRNdSs2K0M0VkpwdGJDNEF6SW40VFJ0RHZiVEMzdGlYc1c3?=
 =?utf-8?B?YzFNM1N1U284OFJDQmxVZzhNejVaNDBkQktKUURvQlUyelFhZGcxcTUyM0VP?=
 =?utf-8?B?TXhzK1grTVVhNFdabE1RSDBqOE9rTmc5Nm82amtLeXdzSEtZWGdTaE5MeVRS?=
 =?utf-8?B?L3ZXUFhyWVJFQTlyYWFEWUtZdnZPK2d2Y09rUm91UjhhNzBhdEJzUkRuWXlS?=
 =?utf-8?B?RXQyeWxXVmoyWGdKaEN4bDJ2bi9hOElTUzRENE1WbFhXZ1VqZ3h3cUlBVUVM?=
 =?utf-8?B?ZXNoNk1wRTgzMk5BSGl5ZzVBU09IWkU5UFM0QUppc0JjR0FLZ2cvbFQwZE9r?=
 =?utf-8?B?cm94Y1hHSWZ5bWliaEF4Q292aDZlMWxvTDhrajFVZGNGWXZUd0VOMkxtcGZX?=
 =?utf-8?B?bVhEVUxpK2ZKUWZ2eDZVQmNHS2VYYzZjMC83c0x6YkJGRnRTdEZuSjFJdUlN?=
 =?utf-8?B?OEF0OEVQV3pRV0kxT3BvendtZWdUUFVqVEYvcWZoaFM3RTkzY1BJY2V0R3lZ?=
 =?utf-8?B?WHRQckFEMGdkSG5VWHEvMGNRZTNqbGRCbzNxTWhRKzVjQTlSK0VreTY0RTZw?=
 =?utf-8?B?dU10STRhQXFoWGQ5MTBjNzl1L3BpbTQyL1hONWFpTTZacEpTNTNidjR2SEI3?=
 =?utf-8?B?ZUdwd3R1NUhqcXRuc1R6WkFuN0NabG1YM2VkWkIzeWRuZTBjdmw2TndaOEZV?=
 =?utf-8?B?VDM3NXVmNDFVMm1EZTRRVjMwTnRZRmdaOFZQQmRsc3czWTZWS1Y4ZzVqMkRQ?=
 =?utf-8?B?anlIdEs0VW9jeEJrMUpHeVdlelErZHk0VnRwd0NTODF0T2lyMU9GRWxuN2lu?=
 =?utf-8?B?aUpmRDZoNUlRQzBDalluL0FKSDJLOTF0SXpKRFFuV3lLVW9ORjBsV0YxS0N0?=
 =?utf-8?B?NGVsNUdzMndzYkJLakg5WE1PMEtpejhHc3NrSnRrMEU1aFFsbTgxMEt3SlBx?=
 =?utf-8?B?L21FMVlFdE40K05neTBYRDFoeVR0aFVKSkpPZktjV0FrMnBiTVlqSkFLOStD?=
 =?utf-8?B?VVpZL2VVdmxGanhodjNXZXBkMmMyWUxxd1J0RlMrZ3ROMXVuR1RHY01WM1ZN?=
 =?utf-8?B?aWlVODdqUy9rQmJ1MzV3QWpBZ2Y3UGJxQm9iZ3hDRDQvazMzNmMrWUh0b0wv?=
 =?utf-8?B?UTVpS0Y0Tm13ZWVkMWVtOVdsZmRrcEppVTcxcDE4SUR5UjZQVDFULzlvU2ZE?=
 =?utf-8?B?bWpwZTFKU0RsTm5RUGZydEtkYnRoVDFBMHZRejVMWDN5bjFwblByRXBjNmVP?=
 =?utf-8?B?anhLMnAvcm9XdFY3Vk1IS0lCWC8xMFgvK3VFUmY4eHZEdDl2Yzd6dm94UTE5?=
 =?utf-8?B?eHRneXdJdXBpT0JjMkF3K0o5WDQwVmJ2YUtKckpPcUxUQld2dnVXVmtGNmxy?=
 =?utf-8?B?eXFJR3JqcXgxQ3FDdk5ZNTFCSDNVNFludmxoTWRIaVZ0OC96bWxVYlpwUWkz?=
 =?utf-8?B?NHoxMkovTzN0d0U3QnQzNWhucGREVDhYSkZWamJ0aTZmaHVKUWhUR3Ztb1hQ?=
 =?utf-8?B?a1A5eTN2NkU3UFltVzg2WmhvNERGNXJZQnFwc0o4TDJlOXlyUFBaQzREQi9L?=
 =?utf-8?B?SWRIa0RVOFZlUmtIMUtGK0IvTURKeFB5WWtYdTN3UGF5YURPcXVIeUJxY0RV?=
 =?utf-8?B?MTgxc2ZIdHBHVDI3a1JqVmQyaDVVYWlyM3k3RERVSmU3U3hLeExtaFU1c3Zx?=
 =?utf-8?B?YmJMT0xLaS9KdTAwQ1Q2RlkxbTF1NW9IR25oNDJiTStUbDU5ZWFvWGJvRG41?=
 =?utf-8?B?T3N1ZSt0YnF4SXJ2QlozNTVGbUhZVFpmNE52VEQyS0NlMWNsSXQwUndud2w5?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b9c430-1274-4a44-bccc-08dccea45a1d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:47:26.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmqWkLEFRbwVq97Pq9pVQIDOZejXWZn0on7X8jZeH/GjZ26haXjQDxvZJzj2b+aAr68BH3QdA/an/z8XBLRHYLBh7JCsjRVM5Sy408aEQow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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

Hello,

1. I see some styling issues in the patch. Lets adhere to coding style:
    https://www.kernel.org/doc/Documentation/process/coding-style.rst
2. This will be supported from xe3+ platforms add that check.


On 9/4/2024 9:42 PM, Santhosh Reddy Guddati wrote:
> Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
> and fill the damaged rectangles on the plane with framebuffer
> cordinates and verify that fbc dirty ctl is enabled.

3. Fix typo error cordinates.

> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 74 ++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e45d17dd6..3b40e4a93 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -57,6 +57,10 @@
>    * Description: Sanity test to enable FBC on a plane.
>    * Functionality: fbc
>    *
> + * SUBTEST: plane-fbc-dr
> + * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
> + * Functionality: fbc
> + *
>    * SUBTEST: pipe-fbc-rte
>    * Description: Sanity test to enable FBC on each pipe.
>    * Functionality: fbc
> @@ -1168,6 +1172,7 @@
>    */
>   
>   #define TIME SLOW_QUICK(1000, 10000)
> +#define MAX_DIRTY_RECT 3
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>   		     "its related features: FBC, PSR and DRRS");
> @@ -4288,6 +4293,70 @@ static int opt_handler(int option, int option_index, void *data)
>   	return IGT_OPT_HANDLER_SUCCESS;
>   }
>   
> +static void fbc_dr_subtest(const struct test_mode *t) {
> +	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
> +	uint32_t color;
> +	drmModeModeInfo *mode;
> +	prepare_subtest_data(t, NULL);
> +
> +	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
> +	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +
> +	mode = igt_output_get_mode(prim_mode_params.output);
> +
> +	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
> +		// Full Frame update
> +		rect_data[0].x1 = 0;
> +		rect_data[0].y1 = 0;
> +		rect_data[0].x2 = mode->hdisplay;
> +		rect_data[0].y2 = mode->vdisplay;
> +
> +		// Half Frame update till last-1 scanline
> +		rect_data[1].x1 = mode->hdisplay / 2;
> +		rect_data[1].y1 = mode->vdisplay / 2;
> +		rect_data[1].x2 = mode->hdisplay - 1;
> +		rect_data[1].y2 = mode->vdisplay - 1;
> +
> +		// last 10 scanlines update
> +		rect_data[2].x1 = mode->hdisplay - 10;
> +		rect_data[2].y1 = mode->vdisplay - 10;
> +		rect_data[2].x2 = mode->hdisplay - 1;
> +		rect_data[2].y2 = mode->vdisplay - 1;
> +
> +		igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
> +					rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
> +					rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
> +					rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);
> +	}
> +
> +	for(int i = 0; i < MAX_DIRTY_RECT; i++) {
> +		igt_plane_t *primary = igt_output_get_plane_type(prim_mode_params.output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_fb_t fb[MAX_DIRTY_RECT];
> +
> +		create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb[i]);
> +		color = pick_color(&fb[i], COLOR_PRIM_BG);
> +		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
> +			rect_data[i].x1, rect_data[i].y1, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1,
> +			color);
> +
> +		igt_plane_set_fb(primary, &fb[i]);
> +		igt_plane_set_position(primary, rect_data[i].x1, rect_data[i].y1);
> +		igt_plane_set_size(primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
> +		igt_fb_set_size(&fb[i], primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
> +		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS, &rect_data[i], sizeof(rect_data[i]));
> +
> +		igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		fbc_update_last_action();
> +		do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
> +		igt_assert_f(fbc_enable_per_plane(primary->index + 1, prim_mode_params.pipe), "FBC disabled\n");
> +
> +		igt_remove_fb(drm.fd, &fb[i]);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_display_commit2(&drm.display, COMMIT_ATOMIC);
> +	}
> +}
> +
>   const char *help_str =
>   "  --no-status-check           Don't check for enable/disable status\n"
>   "  --no-crc-check              Don't check for CRC values\n"
> @@ -4513,6 +4582,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		plane_fbc_rte_subtest(&t);
>   	}
>   
> +	igt_subtest_f("plane-fbc-dr") {
> +		t.feature = FEATURE_FBC;
> +	 	fbc_dr_subtest(&t);
> +	}
4. This feature will support on all the pipes. Add dynamic tests.
> +
>   	igt_subtest_group {
>   		igt_subtest_with_dynamic("pipe-fbc-rte") {
>   

Regards,
Ramanaidu N.
