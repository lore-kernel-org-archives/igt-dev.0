Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987E0C27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 14:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201EA10E270;
	Wed, 26 Jun 2024 14:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDc2pUjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F5F10E270
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719411490; x=1750947490;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z1SXwHS7wPXr//3KymLIDdRMSTwG2eZLeupm2FkOaSk=;
 b=HDc2pUjoFcAVFTrGgk9rJDjPXfaD/cAmKPtmqGO2so7dILcpIxmWus8l
 VIGTJbi2LvIVa34ysR0z26AopLUSx0q6u6D6A+5pWb9y7/hBoAXPx4AXZ
 mzXUdUbhQ/CNPyoiIjBFhawGxcGygrr2e87BIBBKVfa5VUR2uEQh17kvj
 zxX3Fq5dqwrYMDzQB3jLEvS0U12Lx0Q3kUL6G+8BZhUQMG5qu6356xzCl
 lIIKhSpyIGtQYnAs2OOaa/wcFjW/VbQhCDzRN+IR1/RFfAr9hjqErZ3Fe
 eR53FqhQ40uu3PkgG2WOctKvUaAhXCsrJPrL0KtD7RCXK7pFCXDzSL8Ej w==;
X-CSE-ConnectionGUID: ZY4TbJY7So6IzwWUdLN4TA==
X-CSE-MsgGUID: MOKSVFvQTX+rBx/uvE4u4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16615124"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16615124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:18:10 -0700
X-CSE-ConnectionGUID: R7FpW1HcQCWRMPbF1CTrFw==
X-CSE-MsgGUID: Ag/gpdb7T/yqNnMlaSwARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="44738275"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 07:18:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 07:18:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 07:18:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 07:18:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 07:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6AigkAzP1DHnExrv1Cg2y1h2ddBCwQlqdb4PCDSU7l2TS1h8Bbm+S2XieKuCjASusKJxh6YzVTg+NANSSi7KZl9wQB3C1gM3dyf/v94oAce1HIJ51fquAcbBMoOc3zqZBpdK/mD11sgi4kUnIp2JdaCgqBzHYbuWOc3Omu/NNBqXuFxfoSLoLs+JppfwqC+LC5dGJOzn0OtSKy6U/BIgV7ouXgXCP1JnGIzimKwG0PXoQ7qkheK5ol8mbVXd0x8qFumMt/H2LVj6KOFkWHFzHRjFYSzq+A3avqIlmDw7PfMxUDR85BV5JpTlSkegEUtHEjp37Y4IzIgYJkeyD84gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgRutOWuNIComijZ6nzCzlzF9Ze4YIXfHlHnKTEZJsk=;
 b=n0GDObxuQfRK1sl5dhDUAOMMeFaQOHOiiWTjvl2/WnnCpvjoA0v7gZvIC6PRGag0MbFAvBdHlmIiZTU9xINEVA4cMTsCo3O5NKV9QCdGoxREnsSnruHtwwTy3YAXksWmvbZ0C4xT63cspU4c7962Eikft6q+hg9/tgnC7mvvTyfD8sED3ghXw5w3siq0R5sBq+NtDPiw5h2www2y3momUOY9JZsnuNdaY12AkHLFQSL9PBjc4sSjGQlcp3JnYiuqWv+TsJCz77m7SthROdKVjlK82LwUaaKuhpap/3ldUkAXqI4HDiAHBVMXu5qaE+nwXCz9gBQIZrwzASbHng9bfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 14:18:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 14:18:04 +0000
Message-ID: <cd5b848f-f0ba-4bd0-bb5d-b2de655d4c0f@intel.com>
Date: Wed, 26 Jun 2024 19:47:49 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_test/intel/xe?=
 =?UTF-8?Q?=5Fgt=5Ffreq=3A_Remove_act_freq_check_from_freq=5Flow=5Fmax_test?=
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>
References: <20240620125437.181215-1-badal.nilawar@intel.com>
 <171889704358.127478.14760319746724514334@a6498e030952>
Content-Language: en-US
CC: Anshuman Gupta <Anshuman.Gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <171889704358.127478.14760319746724514334@a6498e030952>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA0PR11MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f03d06c-fe68-4e3d-85ec-08dc95eacb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTBTdjFhemt2UHlEbkRmK05TQmFqQVZoODUyK1NobWwveXh4N0liNFRtKzBp?=
 =?utf-8?B?M0UwOFJ0T1NocTBhVWQ2b1V4RG9FeWxCUjlBZmhKcDRuUGNINk14eVFua0R4?=
 =?utf-8?B?eFU3L2Q3eUR2NEpuSkk4a01Ec0FMRjc0eG5XYlc0QkJSWDdwOHM2aktYT2l6?=
 =?utf-8?B?NjVuQ3hWR0N3YlhwRUlHT3NKemlZSUwraEh5QTlUZURKWXJGUDFYZXhKOWNT?=
 =?utf-8?B?OE5CMDdubFd1djlLdjFZbnYwWXVkWW9ZZndNOVp2MkNKdHpiZHVid0RMenRV?=
 =?utf-8?B?d1I5a0hrYXVnbG1iZU9rODR1TlM5bThGcWFrVWo0Y0hKSjRubG52WVFWbENJ?=
 =?utf-8?B?UVdLdm9EUndkWEtKK0tpMS9OdlFQdFNOOWhkNFpZOEUyTGNWa2lrRUZnT0F1?=
 =?utf-8?B?aEZ5ZVJ6ckFUL1R4NTN2ekFtZE9kQ1NYWTVJU2RrZWRoNjg0QjRHZmxKOVJ3?=
 =?utf-8?B?VGx0UG4ycFEwbmVkcm9oUE1GbXo2S05CTExGeW5zd0tnZWxaMDIzN3A2SFNz?=
 =?utf-8?B?T2RTV3FFTWtyNE05cHNTU3E2RDMvY1BMU2w3cW1ScitRNnYrQ0RrT1plWmJv?=
 =?utf-8?B?ekpNWEh5TUJRVmxvWVFGdGZBRTNuWnVyTllQSUxwZ2tFRHZIYkZxZkN1VDZ3?=
 =?utf-8?B?R2Z3MEdrVHIydGt0WExNR1BSYWplVWtuY01hWWFXYnFkRktZNEJFRWFwejRB?=
 =?utf-8?B?WFpsc1R5RllrcFphZ0p6V0Y3QkVuUjhhd3BrdTJLYTBuczEzaE5XNkVnUFBj?=
 =?utf-8?B?emlrTDZrNml3N2o0OXJValRybDBiYmxwMEpZZXArZUJRVHY5RTV1MGhOVkVX?=
 =?utf-8?B?VU9ISGlxZmtFZG03eHJGTG9rUlBhNjhoRXZOQ3Bsa2ZGWWFzZkNCVjRxUE0z?=
 =?utf-8?B?VDZUMk9xOUxTd2hTMENqL2tyR0hQT2lERk81U3BYMjVyM1ZHNU9OSCs5NVo5?=
 =?utf-8?B?R1FSUHdGbTNhTExGYnNEeU82bzV2V3ZZTGpackJNNzloVTc2TjNSNFlidGxk?=
 =?utf-8?B?ZWsyaFVDMExhMXZENTRRRnp1RVA3OUlabUcySFNqSjBkS2dMWG9ZY3loVXRa?=
 =?utf-8?B?SnNhcWluOXJUVE43L1hGTlRXQnJpc0lwYmFpbjBJZUVjbkllalhGbENWbWpZ?=
 =?utf-8?B?TjZTVjNxSmJkQW1YdnFFemRZdmlEbkhGZU56ZkNuYm1kREM5ZkNaQmVmcHBp?=
 =?utf-8?B?SW01NXJxY2dyNW1yZXlHYXAxL1BReENvUlZ2RzhiS0hld0VEWHo1cWNtV0RZ?=
 =?utf-8?B?aUdNSk81aXZ6eHM4bm9LYzh5aENRbzhpb0dWT0JObldHVE5pdmdXZFZabzJk?=
 =?utf-8?B?bi9GbkwzSUYvTnhFcFhBbTBmYXNaa29DQUhEazJNOUk2ZTNXYThWQTZWZElT?=
 =?utf-8?B?VElKQ3Vod1dlWjdQWFo5N0Y0ZU1oYzA4OS81ZjhlaHVzalhrb3I3M1RMbzNa?=
 =?utf-8?B?bjRHTFpqK0wwczRXUU1reGhnelVVZGs2NytPQjNjbHlSamdIUGhrK1QrVmFx?=
 =?utf-8?B?a0lwdUxUZmpzRUJrMEFoSFdnT1c5OW5VMHM3akdDdmczU3lXcTJyeXdzaS9Y?=
 =?utf-8?B?OEk0SmlncnNXcGpZTFlheFZXWEJ3VW9jdzlTcEMyV1Y4SFFOQWtsbzR5cmhl?=
 =?utf-8?B?elVRc2Z6djZLZTkzbVg1RXArRUcyN0RGNE14c0NKbjI5REZwQ0N1ejNvZTE1?=
 =?utf-8?Q?4qhUzaWxmcGuHpD+LDg1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU5sRGFoZ3lQY1VGS0lYazRBajJGQ0dRZjdhdFl3NlUwMTl4amFwYlBXWENi?=
 =?utf-8?B?N1E2T3V0anozVEEyNnFjOStkenROYjN1c2crMFdpYUdUbHMzT2pFeUgrdUxW?=
 =?utf-8?B?VlM1cGs1NEpIcWZZcXkyS1NpNWU2Y3EwbFJZdXdXazlybWZNKzJvZDBaeXla?=
 =?utf-8?B?d2R0cHZqMUJYbEhHN3Z4R1VYbXNJTE1hZDdjdmNjOFBNMGxhdmMyYzI3ZG1F?=
 =?utf-8?B?YVV6Nkc0dEdxNWlLUCtocjdLbDBIanErUlRwNnhPUkxTRWx0K0ZPQktEbEZv?=
 =?utf-8?B?Ykt4d3cxeXhYNk9halZUc3krVlZMT3dYdkhGcDArM1ZpSjNWOEFIY0FHVmlx?=
 =?utf-8?B?WE1zcVJzMmxzdUdlM2ptbXFKRWZjb2o4am0wb2U5UWZKZ0c3L3kvSUhWMGh5?=
 =?utf-8?B?YmVJcGh6RWJibnVwS0tJM0k2Um5uKzQzTWo4bVpFWlpTY1NpWHRFaU5DUzJ6?=
 =?utf-8?B?bnlDOUEyN1hDd3dnUHZaRlpYRzRLcUl6R0VkVUd6dFo3eGxsMWtwb3pjUkRK?=
 =?utf-8?B?c3BtallhWWYydy85VVBTQ1Z1RFg0dHBWQ21uMDFLdGhrem9UWFZyTEpXZW5G?=
 =?utf-8?B?MGlacXc1TmNGWmtqTjNiYm12dGI4ODlTUkZxNk16MndRWkEwcS9wWEVVbGhH?=
 =?utf-8?B?S0JERUJDNEJmdkZsTU9KMjluR3ovY3BiUVl4ekovNGdyMlYyRGRpeEZ3MmI2?=
 =?utf-8?B?SElsRUxkTmk1OHlwTTl5bC9YNzJMU2ZhYldwK1BoNjE0ZTh1NTkwb2RoYUdW?=
 =?utf-8?B?YlVDc3pUc3VDNmlGN1VmRi93UkprN2xyOHRRMU0yZmhwaW13bHZ4dExXTDN3?=
 =?utf-8?B?ZWNpTEtnRFNnb0lYdGNPVDhYRVJINUlDZnFUbFBtYnUzVHdHQUxWUVVyaDNy?=
 =?utf-8?B?cmVPNSswZVliZDRkVnpVd1BGMnFQdUFBb29neGMvS1dTS25ZdGVmVGg3VWNx?=
 =?utf-8?B?MzFDUjZyeE9NcFFtb05mNlU4bVE1bzdobExBNGdIaS9xeHdmLzA3N3pOeEd2?=
 =?utf-8?B?YzZYV3N2T0dLV0w1Q1FMSEZYTCt6QVV1WVNTMUY0Nm5GUTVPTmRGWkkrNHEv?=
 =?utf-8?B?eHJIUkk2ZnFrRzVrSXVFZVBndDBheEtmNlFGNnZaQW95Ym16eUVndkpYdnU5?=
 =?utf-8?B?RmdOOVJhMHZZMnZDRlBBNkZFZWVBc1Z6VC9Idng3QzhXU2gyNmVrOVZrOUVX?=
 =?utf-8?B?a2h3VFNTV255VHR1VGlHYUF0T2tCTzdsZ25TUWJycUZGZlIvS1R1SnlBdUYy?=
 =?utf-8?B?NE90WElzaTdKNEVReVB0RDNLdlpiUDQ4bUZPbXpxamNDSnVzNVJrT3E5eno3?=
 =?utf-8?B?R2NYSVM0V21oODl0dFI3VGtHN0lFQ0lQS0s5TGZyaFJ1TGtuRy8zM01JQnRT?=
 =?utf-8?B?bmJVNVNMQUo3UFBBTzkzQVpYd2o5STRmNFl5V2dxeEtHbW5oaDNpS0xjcXBM?=
 =?utf-8?B?UUdDQXpIckVja2tMbkhCb2VwSmx1WXBvRUpESXJUQTl1eDNiZTF4RDcvdUxm?=
 =?utf-8?B?Y0Y2Tm5JTXVmK1Yzc2xkSXRyRlowN1lZZElndUU1b2svYUQwdUtmZGVvazFS?=
 =?utf-8?B?ZXhMc1FERWs5ZE9aQ1grZmk3RWovVjlQYjVZcWdrVm92KzJ4Vk53NjBLUzAw?=
 =?utf-8?B?MldLWjFhLytxRnpJT0g5YXJNNHpEZnUrbTcxZmhLUmp2S1BVa1NFTG5xMGJE?=
 =?utf-8?B?ZndRb2xvZ2VXS1JnL2J2aFduUEJoNlpQclNwMjg2cG95OXNwSDhHWDVRWC9r?=
 =?utf-8?B?UlJ2djJGS3EwdUJiTjJuZWZuaHhZaGtZWFpXeGtKN1EzREI4QW51aTFrWEFS?=
 =?utf-8?B?NHBHcWxWbDBtblVudlhXbEpvN0c5RTJVRjdZYmRNeWlTS1M1N0FoYkloUzcw?=
 =?utf-8?B?MWx4Qk95cTJ3VWxzVU5kYkVUSDZEWjlDRDk5QnVzUG5mb1cyT21hT1NKQVlK?=
 =?utf-8?B?YUhRK3c2MzlJczFYUUFMY0xDVENRT3VEVHBRZ21ZRzUyNmZDUFk4T0EvVjR5?=
 =?utf-8?B?ejAwdm5weE1jN1NZWmJNVVpwMmh5NXFraWlhY0pqeDVrRDFZd3dFc0NMWExa?=
 =?utf-8?B?ODdZZ3pZMUlBaHlWSkx3VGRiVEZjT3J2UHdRMklXMjFzRm9nUTRDTUFZOFMv?=
 =?utf-8?Q?wWsOMFSeMyNjeh1bp+uhrE5yK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f03d06c-fe68-4e3d-85ec-08dc95eacb70
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 14:18:04.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+648lCT8nmhXWQgWv6VGc6C9O9seYgA1WWgFWuFoswUFUvN292ZO5d8Q3qAS6fSiUqh+z+qmUKOc6SQPVfVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
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

Failures reported are not related to by patches.
This patch can be merged to drmigt

Regards,
Badal

On 20-06-2024 20:54, Patchwork wrote:
> == Series Details ==
> 
> Series: test/intel/xe_gt_freq: Remove act freq check from freq_low_max test
> URL   : https://patchwork.freedesktop.org/series/135114/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7894_BAT -> XEIGTPW_11287_BAT
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with XEIGTPW_11287_BAT absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_11287_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in XEIGTPW_11287_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@fbdev@eof:
>      - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +5 other tests skip
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@fbdev@eof.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@fbdev@eof.html
> 
>    * igt@xe_module_load@load:
>      - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_module_load@load.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_module_load@load.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_dsc@dsc-basic:
>      - bat-dg2-oem2:       [SKIP][5] ([Intel XE#455]) -> [SKIP][6]
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_psr@psr-cursor-plane-move:
>      - bat-dg2-oem2:       [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in XEIGTPW_11287_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@core_hotunplug@unbind-rebind:
>      - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1885])
>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
> 
>    * igt@kms_addfb_basic@bad-pitch-128:
>      - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([i915#2575]) +50 other tests skip
>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
> 
>    * igt@xe_intel_bb@create-in-region:
>      - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#1130]) +155 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - bat-dg2-oem2:       [SKIP][15] ([Intel XE#623]) -> [SKIP][16] ([i915#2575])
>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - bat-dg2-oem2:       [SKIP][17] ([i915#5274]) -> [SKIP][18] ([i915#2575])
>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>    * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>      - bat-dg2-oem2:       [SKIP][19] ([Intel XE#288]) -> [SKIP][20] ([Intel XE#1130]) +32 other tests skip
>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>    * igt@xe_huc_copy@huc_copy:
>      - bat-dg2-oem2:       [SKIP][21] ([Intel XE#255]) -> [SKIP][22] ([Intel XE#1130])
>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>    * igt@xe_pat@pat-index-xe2:
>      - bat-dg2-oem2:       [SKIP][23] ([Intel XE#977]) -> [SKIP][24] ([Intel XE#1130])
>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
> 
>    * igt@xe_pat@pat-index-xehpc:
>      - bat-dg2-oem2:       [SKIP][25] ([Intel XE#979]) -> [SKIP][26] ([Intel XE#1130]) +1 other test skip
>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7894/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
> 
>    
>    [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>    [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>    [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>    [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>    * IGT: IGT_7894 -> IGTPW_11287
>    * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-1505-1b460dc778f991fd62d2edb0bf812a5678b47cd7
> 
>    IGTPW_11287: 11287
>    IGT_7894: 7894
>    xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
>    xe-1505-1b460dc778f991fd62d2edb0bf812a5678b47cd7: 1b460dc778f991fd62d2edb0bf812a5678b47cd7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11287/index.html
> 
