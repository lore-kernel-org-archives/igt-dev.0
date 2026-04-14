Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF65F34C6B
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 04:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4858010E09C;
	Tue, 14 Apr 2026 04:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKeylvoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3487610E09C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 04:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776141727; x=1807677727;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hEiKOnu0Tnu7YHdBZkgT4csnS8zmw+XA7N1azdqWSco=;
 b=FKeylvoWmMfD1wzwDEGIdVPL8DwBNO+8++1mE+Y9mmIr/SWM+VtgnvqS
 aJwqNNJTm31JCzTxF37yzWG6a0rWXDr+Oguwe/+9oTD+/pc9rGHD3qfYQ
 jqVDMMuBD6agavzuY3xrvR3A9+YMpijB0OQBVBmO1eCM3ynbDt8ln3f0+
 TLP2YNjegfZV5omMLeaTAGhkH8KKblknAvK08odrGm+ef97BBj9uSXouW
 Gbf1qvl5Hh1EsXzF7e4Lt1ispEbH04fVMuF7ipDNmn7eM4pZgzZngeXYq
 MHWulKCSkR3iMpBLBnGYaz8vxcUsdavr+2pbBv+djU/7pvry3zWp32qWk w==;
X-CSE-ConnectionGUID: zVdnllG4QJmWs0DTA4MnBQ==
X-CSE-MsgGUID: OX+iXZhRR9iaEmpL0I/89Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76253443"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="76253443"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:42:07 -0700
X-CSE-ConnectionGUID: hMjTYGZFQNu7smqBB4EO8Q==
X-CSE-MsgGUID: oDmBOZlkRICMcx/1wA6sPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253369663"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:42:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:42:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 21:42:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:42:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz5WXOl2F/ydiQ3kmUaE24oR1oi8osuBu6Br8ceuQXQkXnVt2ikPWb39UNE4y3VmchvSADsqCcWopZoaNPrsKM0XeRUdHDIw/+09AZ52nixe1R9f9Fr5JOwOHjsOZc/WSnGp5HkY3kkdMR0M0lWUI1SUjqxU+F9qM0KGPyejCeciUmiSmd5fa8p21Flw9eR/QcRhF/u0yNLukI/dErxdqn4n5lQb3mjKNuj5m3MtsR83fyfiQQzyg1u3csRZMmbEE9KPqpySn7yvXZSvyLtbkArAQaPXoxl3l3jybgHJUgAh86I+cTwB6p8Q8y8UE4iy3Vule+mYkpe2J4js2WDxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koYAnnoQNli61M+F7roEdW4wJKd/3pQnhYgxvjn3+ks=;
 b=lxL262FhPBJ/QMb3Bq/jvdnQt6mCYlE6so+pYVLnTNODTUX2B329MDiJ0us0+uG7s7BRcWeoKphHiUVVGbfxKPTCLPOdVnPOygL4/w+wRtOuEx2s3UvnvfPJJsTc00mprJvBwiIGnGEw4IP9BQKqyFltnlsEi32F2YQv8h8r01KFGPzOLYUyGKGVeG7QXS6XGgPe6dcwJ5Wy/qRYn0OdVQbjnn6PR8p0Jj2H+tKCX/Cz2cD0BV/q1wPs0qVE46obX34pLkx7exaVgDvcEq3JNNBcU+feQOGpMyCMxVkfr/6eLb1/SuqFdyihR7Wg8Ce/1q6YDazCMAXJESPp7LFpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 04:41:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9791.035; Tue, 14 Apr 2026
 04:41:58 +0000
Message-ID: <9441a6c4-0d8a-44a0-a51c-dd4cf4845233@intel.com>
Date: Tue, 14 Apr 2026 10:11:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
 <PH7PR11MB60533AC5B809DE83844C1009E7582@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <PH7PR11MB60533AC5B809DE83844C1009E7582@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c00c8f-ef82-4c6c-a6ea-08de99e02933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kzRvd9T+VyA0gyYQuoew9pFwQq0J7SjPATpGEg0uucWMDoBeWo+uZBAQeTvMhnbpqQg9+y/poHbI3mUQk0iJF3h4Js0QBKp2Hg5KBEbfqa06wsa0FxJXH6QtR4kvPMEBn8+pd9XKfjdEmjTgIsEQnKnd187B2tCYFc4Xe+Cx5LIOBUW2OPFmdOsw8HPMuyC8ZLfkuqPUAvwbbNfkYN1bPef6m+T6/6vY4xVy6Mz/3wwie1bufYJmB6I9tJVKP6X10ZmSQTkeM+M312X49VXRd2lvAqscYvgopBEOZ6uqI9VElxQCidmk+1SfYWNl9XG4fm6M+LNpeNV6SFvlBpxFNpNX/9c859eG3RzotbO2qIlTRuuQAcBXrTshDHReoUGRn3l+VcO1h72EkYVLVvpKu1zwnW3OEKwKco6g5Q82p3kkVyNETdJt1DwcY3LAA3SAMBqAQhpYwiYHxNv7mfx8edx3sEDc455SjHwkX4peIiBXUgqp4W3uNMqfc8W180OgMu0rmfeF9qTcRlSBnynqL2rwV+KF7+obxtRt30eU/VJsmnDI24b0jCRUZ6o/OuuuXnw3hnD2nv9VpxkqxHT77hxuMFWEv55Aq7P8jHakQMzoMj50CHLDq8u+uozrFzglwlCl3lxj9LSVkklIuG3yMgO8X1HmRI51jKEOoMGokHG3NUPZksGDGftqtsn6v7pvVtMsuuwL1ukZSF63b9goFYCFj5VFthQuWdRbJ2Yl0MU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG9obEd2WThSbFpHZ0xIbkJ0TStYbTVRaE1tVVhkUUdNbXI2OTA0RCtsamZE?=
 =?utf-8?B?dDlVcnBuNHQ3VGpRZ2haVGs4RmxiVGxtMU5CZFRZb1RFb2o5ZVl2QlIydG42?=
 =?utf-8?B?RGFOK3dNN3lkOURvYllWUmIvY2lGVy9yWU1qQS9Pa05MR1lvOXF2aFN2N29S?=
 =?utf-8?B?cU5Bb2g3Q2Q0eXZMdG9DZWtob1BhZzg2c2dFTjZMSStlc2JWaWFvb0llRjRp?=
 =?utf-8?B?U2o4Y00zM3BOSEhCSjBnc3lVMVF6K1VVVENIREFaVzM1Myt0ZFFhWVpncmxh?=
 =?utf-8?B?RHdOR1NYM2R1ZGt1MnQ5NXlYcXhLVTdQeUhJZlN0eWxWMlMydzZkb1dsSUVS?=
 =?utf-8?B?NndlWXFaWTlzTmtUMTVWVDErcmR2TEJDMlNuUlRwd3B6ZytWSlNIbjJBMEY2?=
 =?utf-8?B?VE8rNm9jQ2JiZXVSRzdRZXhzNnBxZDJKeFh6T2s1ZG9LRFVJSWVLYUJoWXpq?=
 =?utf-8?B?azlGZ0ZJTzhsOVdZdXBHSmViUEcrNHhIeVByNFFlMFNmdkxPMW1mYU82QkZI?=
 =?utf-8?B?dEhhZE9PYjhKUS9YWWFLNi82ZWRoWEZxUWlHb205Zm1lRHlTc0R2ek95RnJP?=
 =?utf-8?B?VUlWZm1MVmtVKzEyRlRtdUthd3BnTHVGS0F2K01LMmFXUEczNDR5ZFcvL1M2?=
 =?utf-8?B?Z2VKY1oxeTVZSzVOdHgxMk80cXJkSEovSHE0cCtRVWdyVFlnUDg4cys1cnRS?=
 =?utf-8?B?ajdKaHliUms5TXBtUTVrdDROMytMM2wwcGlyRURPS1h5ZHA5eFVKRkM5bWI3?=
 =?utf-8?B?dEhzTk1GTTdNUGM5NTZjVTB2TXdOdjVzRVdQSUM1R2xoU2FzZFJ6OXU2YzFF?=
 =?utf-8?B?RE9ZUXBIN1ZsYURUOEQ5cHZGOStsaHdXZ2svS3pKM1FPU2ZEUGtQNi9nSW1K?=
 =?utf-8?B?NkF1eWRqckRkZTRpS2IzbXUzY3N4ZDFSY2Z0RDV2SmVoQzVmQ1FheHpoWUxx?=
 =?utf-8?B?cmRiclNMSXoyMHdUaTZEODNRMFpPbXZ5cndBMkVHTjMyOFNKSk52L1lLYWFx?=
 =?utf-8?B?UFE2M1c5NmF1MnhUc3B6eHVpay92VnAvUUd1aFhuM2RMeFYySTBHZ0tPWDc0?=
 =?utf-8?B?b05jSXRDYmRVWUZ4NjI1WkpuQTQ0WnVRU0w1YisxZVJUaXEzVEsrbjJvMnZt?=
 =?utf-8?B?UTdXbG5qVXh3UWFhUSt2bEl3dVQ1WDlSUGZubjBDQjdNSGcvY0Q0TXQzSXBI?=
 =?utf-8?B?WTUwUXRvRXVKMnJUZmg3Y1I1QW1xOFZ4a1RQdUdGVXlxZkwzMUJXbXRhelRE?=
 =?utf-8?B?N24rKzh6UFhpZzRqbmhSNmxEUTNSS1lDWEJxakVhckxGOTRHSDVOZkRiUWZU?=
 =?utf-8?B?bStoL3A5K0FjaSsrRnBQOW9OWnBsYmVYdENOUHFCZVhvWWxMWUpDSnpBYTV4?=
 =?utf-8?B?MG8wYk5FM0l1SlowNjZMVUgzWFdFdXk1Zkp6NlZYOGRaQ3pHMzR6dzBrU2hk?=
 =?utf-8?B?c2hnVEZzeUwrRVZNY0ZxdXRDTXdOK2VaNXpWOHdUK3F0TmcwSy9FdDF2RFZQ?=
 =?utf-8?B?aWt6bEhpYUI0TEtrcldaRHhhanErN0gvK0RZdk5GSDNYKy9QZWVNdW04eWNW?=
 =?utf-8?B?RWloWHZ2UE5kalVHQ3NjalFseFRDL0tpYVo3aFpzSzRkRFJ2YkczQzZobHhi?=
 =?utf-8?B?NFJtN2lIOW5kL1F3b1U3blZxcVZvVC9MYmdhWk43Qy9IT2FqUXhSNGZOSGU3?=
 =?utf-8?B?WGR0aGpJOThXeHRicS9LOGwxMlNsalllMG1CWWZWTTM2MFhUM3JzQnlIY25l?=
 =?utf-8?B?Z2NDNUJRTHNiS1I5UDJOcy9iUytCZ0R6UGZmS2xEMSttZlhKbDFUZk5lOUZG?=
 =?utf-8?B?ZW5lRDVzaWdzTm50Mjd6Rm1yYyt5d2kzL0xqUEtIaXBBNm1IcXZpak5Qa29x?=
 =?utf-8?B?aTFHNnphTGQzUHJ3NWt6Z0Y0RU5icThqUlBRNXdDR3VWWkdJMWp0TlVaeUlI?=
 =?utf-8?B?QzhMYWQ2bEF3Ti9PT3FnNmxJTkZPODZOTVJScWRmUExreFBOUzNRQVB1aHk5?=
 =?utf-8?B?SFhCQzBjMEduRE9QYUgrQ3RWQjRmY2UrUjJkaTRnVmVOVysraEpqamtWalA0?=
 =?utf-8?B?dXJlRERPNHVQMTJxQ3dvR2lVdUphajRBdzJkMk5vNlBNQlhId3Rvc2xzTWcw?=
 =?utf-8?B?N0p6MEFNQUk3NzVHMDA1cWw2SUFrSUx1aFQ5VG1tdnB4L0Q5VjFIRGlRZFFy?=
 =?utf-8?B?YnN1NkVNWElIRjNUcFJtUU8xQ2htcStiRlNRcGt3YXBhTmw1dlAvMlpZeWRV?=
 =?utf-8?B?TVlLei9kVFlRVDVWdzBIVTltOXRUUzA5eXMvT05KU0szakQ5MmNNckhZK3lr?=
 =?utf-8?B?QlpzZzd1YVdZN0N1b0FtaHgwb3pzN2QwQUQwSlE5aUtSeGYvRjRKdz09?=
X-Exchange-RoutingPolicyChecked: XAqsRjIvaOwYWaF1fHEb4/dvtqTDT1JBTFImWhFGQRFGcwvHE85TldiICuDWL9u+y2pDrWmEmRPE/J6FAO6UPeeMZ2XhGMl2T+kT+znp+gwdmnOgIKVMbYJ6Qwh+BUBi5xqIq6t/I4YphzA3NfsBNzHk7JZLXH7++n6yZA6qnJq5/aiyMKoqkTLNx8V6eln6FV5Vk0dfueTIZVBGSP/ugoKewjEiETh2Ze9qutRZTlS3BaUssXFf+/3S4kjoSdcsBPXCPyfAzpXVbg54UYdIG73mphD7lrUCyq75lQoJFUc7M4eeFIR9mY7XewIWDt3wzeLVOSYA/PUKeUeBN5J1AA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c00c8f-ef82-4c6c-a6ea-08de99e02933
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:41:58.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaBd4sr5RUEYVcytDMUuN1C0yjW630TD5AY7syN9U5xSeWnD0EJQs9v1zOuAeWejgAuFhW2mrUY8E2m+vhW4og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
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

Hi Pranay,

On 4/9/2026 2:27 PM, Samala, Pranay wrote:
> Hi Karthik,
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik
>> B S
>> Sent: Tuesday, April 7, 2026 3:23 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Jason-JH Lin <jason-
>> jh.lin@mediatek.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
>>
>> Currently the test is rejecting all the outputs where the mode is not
>> matching. This is leading to excessive skips on configs wherer the tests were
>> passing previouly.
>>
>> Instead of this, use default mode for fixed mode panels if the required
>> custom mode is not found. And use custom mode for external panels as
> The current code always uses default mode on internal panels even
> if the custom mode is missing.
> Imho, if this behavior is intentional, please update the commit message.
> Remove this " if the required custom mode is not found".

Thank you for the review.

Even though we use the default mode, we are checking if that is the same 
as requested mode and if that is true, then test doesn't throw any 
warnings as we're using the requested mode itself on all available panels.

>
>> these are allowed and have also been passing previously.
>>
>> Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> Cc: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 37 insertions(+), 20 deletions(-)
>>
>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c index 4df5c2cee..4a32ec811
>> 100644
>> --- a/tests/kms_bw.c
>> +++ b/tests/kms_bw.c
>> @@ -186,14 +186,16 @@ static void force_output_mode(data_t *d,
>> igt_output_t *output,
>>   	igt_output_override_mode(output, mode);  }
>>
>> -static bool output_mode_supported(igt_output_t *output, const
>> drmModeModeInfo *mode)
>> +/* Check if output has a matching mode and call it out if mode is being
>> +forced */ static void output_mode_supported(igt_output_t *output, const
>> +drmModeModeInfo *mode)
>>   {
>>   	drmModeConnector *connector = output->config.connector;
>> +	drmModeModeInfo *default_mode;
>>   	int i;
>>
>>   	/* Virtual/forced sinks support all modes */
>>   	if (!igt_output_is_connected(output))
>> -		return true;
>> +		return;
>>
>>   	for (i = 0; i < connector->count_modes; i++) {
>>   		drmModeModeInfo *conn_mode = &connector->modes[i];
>> @@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t
>> *output, const drmModeModeInfo *m
>>   			igt_debug("Found matching mode for %dx%d@%dHz
>> on %s\n",
>>   				  mode->hdisplay, mode->vdisplay, mode-
>>> vrefresh,
>>   				  igt_output_name(output));
>> -			return true;
>>   		}
>>   	}
>>
>> -	igt_info("Mode %dx%d@%dHz not supported by %s (has %d
>> modes)\n",
>> -		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> -		 igt_output_name(output), connector->count_modes);
>> -
>> -	return false;
>> +	if (output_is_internal_panel(output)) {
>> +		default_mode = igt_output_get_mode(output);
>> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d
>> modes).\n"
>> +			 "%s Default mode: %dx%d@%dHz\n",
>> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +			 igt_output_name(output), connector-
>>> count_modes, igt_output_name(output),
>> +			 default_mode->hdisplay, default_mode->vdisplay,
>> default_mode->vrefresh);
>> +	} else {
>> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d
>> modes). Forcing mode.\n",
>> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> +			 igt_output_name(output), connector-
>>> count_modes);
>> +	}
> Here since we are anyhow never using the requested mode even if we found it,
> A suggestion, can we move this internal panel "if check" before scanning for the
> requested mode for loop earlier.
>
> For eg:
> Void output_mode_supported() {
> 	If (internal_panel)
> 		Get default mode and return
> 	Else
> 		Scan and get the requested mode if exists and return
> 	Log & force it.
> }
Same reasoning as above.
>
>>   }
>>
>>   static void run_test_linear_tiling(data_t *data, int n_crtcs, const
>> drmModeModeInfo *mode, bool physical) {
>>   	igt_display_t *display = &data->display;
>>   	igt_output_t *output;
>> +	drmModeModeInfo fb_mode;
>>   	struct igt_fb buffer[IGT_MAX_PIPES];
>>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
>>   	int i = 0, num_pipes = 0;
>>   	igt_crtc_t *crtc;
>>   	int ret;
>> -	bool has_supported_mode = false;
>>
>>   	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where
>> they do
>>   	 * not give the numver of valid crtcs and always return
>> IGT_MAX_PIPES */ @@ -242,14 +250,26 @@ static void
>> run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>   		crtc = data->crtc[i];
>>
>>   		output = physical ? data->connected_output[i] : data-
>>> output[i];
>> -		if (!output || !output_mode_supported(output, mode)) {
>> +		if (!output)
>>   			continue;
>> -		}
>>
>> -		force_output_mode(data, output, mode);
>> +		output_mode_supported(output, mode);
>> +
>> +		/*
>> +		 * On fixed mode panels trying to force a custom mode can
>> lead to failures or
>> +		 * implicit handling where the default mode is used even
>> though custom mode is requested.
> Line length exceeds 100 columns.

Will fix this.

Thanks,
Karthik.B.S
>
> Regards,
> Pranay.
>
>> +		 * To avoid this use default mode on fixed mode panels and
>> +		 * use custom modes only on external panels.
>> +		 */
>> +		if (output_is_internal_panel(output)) {
>> +			fb_mode = *igt_output_get_mode(output);
>> +		} else {
>> +			force_output_mode(data, output, mode);
>> +			fb_mode = *mode;
>> +		}
>>
>> -		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>> -				    mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +		igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
>> +				    fb_mode.vdisplay,
>> DRM_FORMAT_XRGB8888,
>>   				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>>   				    &buffer[i]);
>>
>> @@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int
>> n_crtcs, const drmModeModeI
>>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
>>   		igt_info("Assigning pipe %s to output %s with mode %s\n",
>>   			 igt_crtc_name(crtc), igt_output_name(output),
>> -			 mode->name);
>> -		has_supported_mode = true;
>> +			 fb_mode.name);
>>   	}
>> -	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all
>> pipes\n");
>>
>>   	ret = igt_display_try_commit_atomic(display,
>>
>> DRM_MODE_ATOMIC_ALLOW_MODESET | @@ -273,9 +291,8 @@ static void
>> run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>>
>>   	for (i = 0; i < n_crtcs; i++) {
>>   		output = physical ? data->connected_output[i] : data-
>>> output[i];
>> -		if (!output || !output_mode_supported(output, mode)) {
>> +		if (!output)
>>   			continue;
>> -		}
>>
>>   		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
>>   		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]), @@
>> -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs,
>> const drmModeModeI
>>
>>   	for (i = n_crtcs - 1; i >= 0; i--) {
>>   		output = physical ? data->connected_output[i] : data-
>>> output[i];
>> -		if (!output || !output_mode_supported(output, mode))
>> +		if (!output)
>>   			continue;
>>
>>   		igt_remove_fb(display->drm_fd, &buffer[i]);
>> --
>> 2.43.0
