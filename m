Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD8C88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 15:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7D1896F7;
	Thu, 17 Sep 2026 15:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alRbIbZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAE010E519
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789659371; x=1821195371;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gAdt6DVtWiyQyYrfcDFDdNs7AJcn0JboGP5uLOF4YdM=;
 b=alRbIbZWbCtN7fntLmWFXy5ujlw6PBzkL8GKCraH3klgJkvCKeAKM6wd
 tCxlWuly+1p67u2ebo0aeHUaVDLI5Kh2LeTDmwwg+JMSEhxYFF6XSFdVU
 uAqBPbkTpL2Y5xI+tq3zlW1NhoVCtOyWROI/pH7cu9JOmZ/pb7uQL3nLT
 HzOK8RZ52aYoZo54wvw1KBdkmtX5SaZm1P4UeywCW9EgJYejZCTG2MLRC
 490cFTjS+xz+EeWgDOdWykTfeMLQqz6Mfv7WyhghwSCV8l/4g9Qn+WHfl
 tz++7w55FI5PFcb77u6hZpyD29O8rimKhw3zHfz3a8Tfs6PdkXHE2R1HJ g==;
X-CSE-ConnectionGUID: jtxW6NKFSFqXk9EZVW0Vww==
X-CSE-MsgGUID: jHa7ONHsRCO1XefC49nObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90227060"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90227060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:36:11 -0700
X-CSE-ConnectionGUID: p4jLMVnYQcSRBWTIVkY6iQ==
X-CSE-MsgGUID: HRdRRhXbTtOIOan4MEPZFw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:36:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:36:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:36:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioZQ/hwDHlMihK322XsbUCkm7wOvDZF60V3KUemidimiqCkO9vBWnxZwqiI6/lhpY2BoDc1xjl7u/LI0aZwQvYx4CFe7BClkB6Q6Oen8wpQ4MymH6Qo2wL5jyJnm+VDNK8HtJahDDlexVlI6HELjRFFtKVfp+eGV3qlZ7Q5Dxhnagj67FjdtYxj8ZBjFM/BP7AwFZsluViERes6bLdkcIkpsnx/bGXEGkiO4hQjmwJ/CVQLGUBWmZdst1UDBOoNnyHGj9YqDMGu7MubYwZHb9sC+ZIFRhkYNaIdOb2EIzcrmRHtOWoFC4LDWy99V5B2jujyBjNjGorfkr+pXYm0qtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dohh0jl+S5HRsejdDfNshXNGtOJ0bhk4OmqcnVNP0qA=;
 b=C9bCo6Mgv1r6zikNmApcXR9lIcMX56WRoqOkoydML8iOAxVdNQbZDJ2xvuxLHyZf5IMd/G/KgwUbQk0G4rFy3F8xOjFH5c7RoAYq2DAIX6njZW/vTaPsJnRxFl3B0EH+0QLERgB8AdRCA7QsAv2dPCb9q3sbrcsf1LTADHn6takYC+7gFsy+tykpFBh1KQQQrd6pEk8y4ofOxRGCPASAxuY3NQMuTIXuZd3B7sHlyYlWfEjIama+2SYgT97NxsP8uTidsLss8cR3vTJNJcpPmmOvEfkz2J93Kf1YCX5TgGGp4w9stGcVeCQ4zU4K9tP8ML2RC9h5x6D5uBuTC56WSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5001.namprd11.prod.outlook.com (2603:10b6:806:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 15:36:08 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 15:36:07 +0000
Message-ID: <6d72509d-a9bf-47a4-9a91-351d0e41cf8b@intel.com>
Date: Thu, 17 Sep 2026 17:36:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,2/4] lib/igt_pci: Add PCI extended capability lookup
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260916115201.1973752-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260916115201.1973752-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0184.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::21) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: c988d92f-7ff3-4949-7ea8-08df14d16470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: s1mrCBsQ0/lvdImMhz0BS5JqrR7lQhnmZzWjXDBI1/7A+vjDw/9ppBH01XBdLUg9IqQ9/eeUHPDvge+Hfr0/RwKqh+fyGfBFJDI847KFM/8j8Gn/uaYbKwB2f1N1KDn7wNO4dFtjVzjrUklu7cy2eMBBJAjAs82iiuT7/WmrTZl8VI4Z/hECQnXnQ/VpqLfBdwEaoNJ+hJ8ZooUCj8UZkgU8uKi/RTV4GbKkdyMs5Pt2kEBL4pNGgff8GEpSdBOfteJfVuhsEBK3Y0uyyC41OtfiQzQhK5P70gfeJWvXcx2TXwkGG2PC0tsUgM1OR8bzIPNATX/gjLlu/l0n847dRhTmmEjKJoP6DoapisDHIEZHrRuSSFv11kSjFqcwZu86JUmzF7hOIp6aQCAQ895pPeHtkoOOrSnu2BkbmhEGqp5x0i3lHt4M1v3JPLtTOEhhF4vqgNDJSngNdVWFw5GKC9hHmwBzXA732YQeyAL5zrLAPykrLDAr+MzMEW6sQ3Kz/fNn9u/m0fD47R4FtJahJeqZ6+9Nr0Vn74oX07bM4sxxJibB9wIrgzfaZTGsoOE8HK8pSYbQXhwigkbwzTPBe4ENawfSd7MuzAkpY4zk7zLsC44FOLcbdVNqhFvXHKwbT9RXxnNAkClIm8RYx4d8el8Ykt5UGdIIbQWhizXKCEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9weTIrNGRHVEFnQ2s3Q1lrSVZoZEEwMXdDRS9QMGNJNU41b1ExdDBqanJN?=
 =?utf-8?B?RElaVjBobXFYRUwzSHgvVzdiUlJ0b0hBZTFtaEg3ck4yamp1Qy9ZRFpwbHpl?=
 =?utf-8?B?MWw1cmRNT3ZoUVdvWTlISFd3WDhBN1pUK0tZamhuZWltWWU3MXJ5T0RqcXlq?=
 =?utf-8?B?VU9mSTA2Vjl6N2VLZzdvK09pNFpiV0xOMWtnME02M0NMYi9Uc0ZpQXZBWS9V?=
 =?utf-8?B?cHlZRmJwTEJvQWg4a2ZiczFhNlJLQmJTN3JyZ3J0WmZFVlhib3VpemhOZFFs?=
 =?utf-8?B?c3lPTEtxeGd6ZUVCcmY4WnNTZDZCVU03UUF6eGFkRHRYK3BuVXpIdWJXRzRK?=
 =?utf-8?B?T05xSHIwWEREQjM4MFhnTElFNVVlZ0h4dXpmM2YwdzBuRVNOQ2lpL0pBUDQx?=
 =?utf-8?B?NUZERlhWN1BqKzEva2ZTQnUvYUh3SG9CVXk0b0d5VXFRVVN4TGdtNG9SbjFy?=
 =?utf-8?B?WlJRM2g5Y2FMcHREUU5udWQrVFE5VFFqWlJNYllJWlBOVEMva1lXQW1qZmhy?=
 =?utf-8?B?MUM1b2JGRGh5ZGUvM1ZCOG9yTDZIWTNnTUY5TW55ZTJ3NVYrSnRxL3U4cmhw?=
 =?utf-8?B?dmJwaXBKa2VOR1FRT0cxeldjT3JlaXh3VmVSdUZBMnRYMlQzdG15UnpGd0tk?=
 =?utf-8?B?SkxkdnRIRGkxbjlkbTlzU0pZazNJVjJNQkNsdCt4dmpjZzJmR0xhVExRa0kw?=
 =?utf-8?B?UGdaeTZhVmxIdFg1WE9RZzhYR1l6VzN1d1dRaUthNG93Y05ZRC96elQ5bDhE?=
 =?utf-8?B?VEtGRkZ5WHVzdkRucVc4akE5REljc2h0aFZwMlBBd2htU2VuNFU3Y1o1Sk55?=
 =?utf-8?B?a3dwUVJDVXViQTh4dEFqQVB4a0xPODZYdEVjVGd1dkpsbEhONFBDMVFrMkdT?=
 =?utf-8?B?dXJPaXNwVFdkdEozRzBIMitWdHZXL0plMGZZOHI2WXZFcjM3ejlvVDZOaWE4?=
 =?utf-8?B?VWE5RXI0UFJZNnQyMDcxdXRzK3BnZUZJa3VJQ0xKYSt3dGt3NGRzR3BGSDJW?=
 =?utf-8?B?NjAxTVNvR3JpV0NuUGpKYkN0L3cxMGZWSFlkZ3YxVExCYTV6SWgwc1hGZnlV?=
 =?utf-8?B?aEhxbzV3c1VuRUorTGQ3S2xieEtJamNlMzRTS2IzMzUwZE41VE03YmZkT0Jy?=
 =?utf-8?B?eUcwdHl1ZU40Rjdtb3VwT3dDZ2VsTkJnRHBjTzNBQVY5YkVwL1pSZnc1Z0Zn?=
 =?utf-8?B?KzJyRS9qdTN6cU9ETzR0NHA5RXFTWEZuN1p5VjVKNTZ1ZnZxL05SU2psd1Uy?=
 =?utf-8?B?ZUVLOGRLemxaU2daZ3dzMnJYaXgxODU4aVJRL3k3ZVliT3A2eTFqSC9BUFln?=
 =?utf-8?B?d3d4WG1tTFB4M01Dd3Q2OTh4R3ZoWG1DazJXNFBFMTJEZENqbW5ZWWJzWkJ6?=
 =?utf-8?B?YXZvMjllZmo1czI5ekhBK3g2YkFFeUZ1ZmlwVjlOcU1aYTUxa1VyQ0hiTzgy?=
 =?utf-8?B?N3lZbi9UaXZGalZOWnpTK1F5WUlxRmRkWXNwUEZSbTdNdFlpbXJRUklPVEZ6?=
 =?utf-8?B?Y1M5MWFMZzNQWVpLeC8xQWdqNmFuSUMxV05ZRXYyZEpsY0xMdmM1L2xseThZ?=
 =?utf-8?B?QVhnRXBZL2dMamFmS2VBY3F1M2RHeGFZNGZzOXA1cmcwS1RHSlAwa2J2L1V4?=
 =?utf-8?B?NW5QcnVhRVU3MVBDYkRleW03c2xMSzlvOHM5SXhwQ0RUdDkyclRQRlZ3UjRJ?=
 =?utf-8?B?RnI2M0pDMWV5UHBYY05ySEZuY3A4NDl0TVpyWEZEZEp6Nk1MSk1XV3ZJUW84?=
 =?utf-8?B?Z3FtcngzUHRjZGZ4QjVPQWZLRmV2dHhBaEViV05zOWNLMEdSMUhFWTVTZlJF?=
 =?utf-8?B?SGtHVGpudlJaY2ljTUNqRktjaXFSdjA2VmRsSkpKNERpcjBnZXNOcSt2UGpO?=
 =?utf-8?B?RzM4UGRCK1VmSnhxMWFqendrR1ZkQXVsU2E5d1BGcTlzTHo0S0NmaG5sZS9D?=
 =?utf-8?B?dnpNMFVyODRDZHQ2RFBmQ1RYNnh3YUF4cGNMNkI3aHMwdGdtdVUvR0tKSFcx?=
 =?utf-8?B?QVgrUTBqb0cyZnFoTDQwSVM0SjBvSUdRUGlWK3p2WlFCdXk2RFppZVczdW9J?=
 =?utf-8?B?RFhyNGZZLzBpWlZLT25oU0ZhQlZBa2FVNVJhTXY3S2h6cytqd1RFNVhmNjQ0?=
 =?utf-8?B?azNRRng0Y0UvS1RhYnc0SXdkM0QyMGxKMUNwWFA1VE1Zck8yNG9kZUx3Zm9R?=
 =?utf-8?B?S1dYemZxeHdpWVVIZDlNUWhITE03M2dROHE1SytOUm1XL2paTXZNTWw4d09R?=
 =?utf-8?B?ZTNxb0ZBS1F0NklIdER0dHNESVZsQTZaUUVneHR2ZnRkcy9ZVkNDRkhKTi9V?=
 =?utf-8?B?T2FUVGhLWFpEYXVNNnNnVXJGTko0U1VuekpXa3JVYUtJMkY2Y1ZmQT09?=
X-Exchange-RoutingPolicyChecked: PFzNYqrjuQoPwe5f6GEhbq7x6dcliFSZKSMGV6/paQauGV4W2V53jqSK2VA8FWOJTR0Oc/Kme/bPRD7ug5aNvigWbCr8Yr+0ue8FEioSV2ycxSNtc7iebBWeKyanxHuGb5AwnB7FqbnJzueMMhfkDRX9q/Mpx+tSf79I6g6JnJ0HqKg8ORlm1bIigOGPhXX2vD6ju8NCtb/Zl6nB36Y9uJcAhF+QK58RWRTV/EzSgGlEPZwm8/wXEBbyq4+vLIax8zt3CRRHSNFRRhjN1CviBSzR64OkkXPZkge6Q2U9uTpkMZda0cq7usk7c7rW4SMdDuGRLBlgmFt7hRX+lV4vgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c988d92f-7ff3-4949-7ea8-08df14d16470
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:36:07.7850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvQ81ylXElxXstNazMVZoNewXxHMn+gGije8wBrWqrc5OGyHCUzW+Vbu60AzqjkZ+zsw8CDw7ZV7mZ4FLP4BhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5001
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


On 9/16/2026 13:51, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add support for locating PCI Express extended capabilities in raw
> configuration space.
> Validate the extended capability list while traversing it and report
> malformed chains or invalid offsets.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna
> ---
>   lib/igt_pci.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h |  1 +
>   2 files changed, 41 insertions(+)
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index 06717fe8eb..a87e45c184 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -61,6 +61,46 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
>   
> +/**
> + * find_pci_ext_cap_offset:
> + * @dev: pci device
> + * @cap_id: searched extended capability id, 0 means any capability
> + *
> + * return:
> + * -1 on config read error, 0 if capability is not found,
> + * otherwise offset at which capability with cap_id is found
> + */
> +int find_pci_ext_cap_offset(struct pci_device *dev, uint16_t cap_id)

I don't see it's ever used in this series.

> +{
> +	uint32_t cap_header;
> +	unsigned int offset = PCI_EXT_CAPS_START;
> +	int loop = (PCI_EXT_CFG_SPACE_SIZE - PCI_EXT_CAPS_START) / sizeof(cap_header);
> +
> +	while (loop--) {
> +		if (pci_device_cfg_read_u32(dev, &cap_header, offset))
> +			return -1;
> +
> +		if (!cap_header)
> +			break;
> +
> +		if (!cap_id || cap_id == (cap_header & 0xffff))
> +			return offset;
> +
> +		offset = (cap_header >> 20) & 0xffc;
> +		if (!offset)
> +			break;
> +
> +		igt_fail_on_f(offset < PCI_EXT_CAPS_START ||
> +			      offset >= PCI_EXT_CFG_SPACE_SIZE,
> +			      "pci extended capability offset is invalid: 0x%x\n", offset);
> +	}
> +
> +	igt_fail_on_f(loop <= 0 && offset,
> +		      "pci extended capability offset doesn't terminate\n");
> +
> +	return 0;
> +}
> +
>   /**
>    * igt_pci_config_raw_read:
>    * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 787c10fc51..d7d2254678 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -29,6 +29,7 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int find_pci_ext_cap_offset(struct pci_device *dev, uint16_t cap_id);
>   int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
>   uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
>   uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
