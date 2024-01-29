Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70FC47DA9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 09:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA4E11266C;
	Mon, 29 Jan 2024 09:09:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E94E11266C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 09:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706519371; x=1738055371;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B0mzun7NO2V8h0wJn9LIFiUhpi7vFWQRE+yOioQtXP4=;
 b=Tp/dkEF/6gBkWkUtQWEH75HN3kFMBA0jWDG1Hs9yNZTnsYIJUxBGUpJU
 P2tSJ2l6VgnuyFV30h98yX2sbOnEZUaELNKxSJDn3Ac3XGQdV2qcflrpE
 tJz2pp7KGupU+NSUA0CAncr77jA7xi7BPunmJrdCFHIC6DE8eKza11mKS
 4nLKV+lzFExOHWTQiy0gbQ2oSLwt6xaAjKoasbiQrxDSghmwKcDP4jW2X
 PvSqohIND5KZRsBr5WRkp1mtS6IdMRN532Pu0cewRdRzBrsCkKah+OQVJ
 e4Zu89RFpWKJ1oZG9LWgUU8cNpesKG/7yPmAPApd54QRLQitCCQXvOsX9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9644218"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9644218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3317783"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 01:09:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 01:09:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 01:09:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 01:09:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlsEjnFi5XjUdIDqrxq/Tw9N4HjJUODLD13VJ0Y5eVoJY8QmkZEL3XE6mJZx12YYpOez8lQmO8iEh4W1Lzmp7NrOkN/SPmWZCTGPt+NXFtYD9Scmis9/Msv9iSqRKQS/AFIpBGBWHnrsy59zhTU+q5Kn+opc3qmasCNqoc1jxtwPi5HDPSZyEl+cZAxZZQQLbK9Pq8L+0tuST769YKbfAi4E3ZFMRdvVVlDB2t06DnWv81Zw7ZgDVd5taFRTdViI7kL6NA+hLtmpWfzGBJH31fFRQpufgKfF2iCEYJ1ZeiJczBXbA8usFZh+mpg7wKnIdBhFTj0/UPvlXV2LKydiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffm9c4p2AVlJHe7VWCC+mMXKqJkyn/G53gSsc4fMbrI=;
 b=Vow9QJsnFbyDu7P7R2sN9QS9VNGpJaATMGKOG9sPc8/Ao63cPSsjGg2PQAGP2okpeMlxHL3axkUn28TYz8hWfdpMfbEd74iHkWowMRxFGjV9eBsVAXmalVTVXfoM712lQi+iYCKK/u8iAnUAGFeHeSKRPD3Y6jv5/6XlYwApB6CMVcFHGkn2xnTTP0IqTkBTk+Y01fnngbGcSRc6hVWFqs+FZ5pAqe4nqXU6mAhKe8mw6H/oepajVfsdimELrjD4gQhkttK6HLC4nxkTgk6s95ljit/MLa1m+00xkkMobr8deitnLk2sid6VZAU0cEG9hc0ivTUVJY9bhB2VN2qfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Mon, 29 Jan 2024 09:09:25 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 09:09:25 +0000
Message-ID: <266dbc80-7c5c-48e7-ac4e-4aed3bd9f5a6@intel.com>
Date: Mon, 29 Jan 2024 14:39:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <janga.rahul.kumar@intel.com>
References: <20240129080155.31648-1-nirmoy.das@intel.com>
 <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW4PR11MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b386b77-8872-4dc8-94b5-08dc20a9fd69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqZY7LT7CJhuYVFD1mQxmulVKq3s2k1l6F8b2Di/XCSzow0ghsj131e7UC13qUOdkpwIZ/O3MjCt3zcu7/Kkr2hXUSenWGnuj4s0X23mc3omSls4mvXCq5/cc20GJ1BTD/hFQEtziiI54dzClfp5Bj2/0aHWt++ObaaJ6cY0ewi2BZRpWpasMPPUi64vgt4OMENgUUdNCu2VhntaBQwsTQ7qiNw2cHLogSjTUkDbMPC1/bTdBmPrhmPMYEKZGBAkyznLBfBIPGAp2rUlX7FK5eHcK2gWMrY68MwMt6qsNKxocdlW/hs+ELydhDjX1JnqQU9n4xRq26VRJstq+Iv+z3DA/dmhKeNNoVEs6cTEy9dU59fG7urjedlKYZWJ1hV7d2QvPJIjv9kRAjULbWJ9Ge++vE/E6HCfwDVNYpxpgXfHvlDSPDRzNfruRhavF4dx2Q3+gShOhp5+9jQuWq+fEH/e4cOPhkOgx/uXIkTTnCABWS36K5Yt5ASDNC0rVbsbYdXaAW5+ghDEWgoQG6wzWrqyg+ghM4Y4g+JkOkVcxQf56A4byHMCECQy1+ah2bV7IfodHV8KlGT3c8+dH+XBpTccINE8eS+ob83cCmGzmAPAQkwsnZAFl7KyiLZArzx1+fqY6ozTzdjf8cu/iFuGxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(2616005)(26005)(31686004)(66476007)(316002)(6636002)(36756003)(6512007)(478600001)(53546011)(6506007)(83380400001)(6666004)(6486002)(38100700002)(82960400001)(66556008)(5660300002)(2906002)(66946007)(31696002)(86362001)(44832011)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUt6R3JubmNOdExTNVBhMXpscTJ5Ym1nUDZKZkRza2VTTGt4czNnWFE5WGNR?=
 =?utf-8?B?WFZOckFiUFdselBpaHN4T25OenVPZ251QXFkdDdaVlM0TnRQYTJQSWdvMHU3?=
 =?utf-8?B?T05IU0hNaHZsV1VOM2J5a1dhNW1CSitUMWhvdG5TOVRRNHNZa3Fqc0d3S0dv?=
 =?utf-8?B?THVRL3c3YWp5cVFYRWhnT0ZDckpaV0oxcU42NXpEMm1xZklJYVllRnZZVmhr?=
 =?utf-8?B?VlN5YjhValBlWWc2ZGhSNTJRUC9jVjFpYXZvZFJ6bG9LZndWbGxzMjVMcG5S?=
 =?utf-8?B?OW00UFBPbFpqczU1UXBuMEkrVlVrdFhsQlZENmd3VExkTVpiUmk1WnVaK0NR?=
 =?utf-8?B?ZVBhdnYxZ1pUNk12M2FkbE9lUFdkdXhmN1hVL1FESVlPc3U1SVcwaW9ZcDE3?=
 =?utf-8?B?ZE1GL0lvMk9LVFVzYWZuNXZBTXdERDBmR0V1NEduUkVPVWVZQVdOcVpUMmhx?=
 =?utf-8?B?RGJIa1lZcnExM0Y2WW1uY0FTQW5ZWUsvMjhYWUZYQVVBUEhvNTN5VHdGSGJM?=
 =?utf-8?B?RHphVjdoWmNkNkFZRWp3alVwNGpCZEd1U1BXMll2NWxYeVRSRTBDK1BJVE9h?=
 =?utf-8?B?a2IvYTNuNTFNalROTlN0bjhFMVlpRDdhN0N1bzR2K3hQanhpbUEvc2c1czlk?=
 =?utf-8?B?R1JMVCtiU0dDdmp3cENKS3Y3V25QUVM5NVdLRUw4RVdOM3JJdzRnMTJjVWYy?=
 =?utf-8?B?bWlvUDBpMEpCOUZQSHZZTVM2d3hCM0FKT1p3QngrT00wRWlOaHM3U05XdWp4?=
 =?utf-8?B?L3NRNVRjamxRdVNaSVFJd0h3RU92OFBWRFp0R3UvVGdYdWYyL3lCbzIrVThT?=
 =?utf-8?B?N1BsWEc2T2FPL2o3TUE2bWR5aW1WdVVGS2REZGcyL1RjS0EzY0t3bjJPZHNu?=
 =?utf-8?B?OGpQRU5XeW53MlRGaUxZVFNtbW02dCtFRGc0YkNQQWlDVm9OcTdxVXpOMGpW?=
 =?utf-8?B?NnhKeW9xcXdnT1hWQlYzQktvNDlUM2lqekpqbkJxR3kyUElQdzlCM0d6VkFq?=
 =?utf-8?B?bjJJRmptVTVoeWNuQ0RjR0RmNFhkcWtxSzhNYXI4dzlOczdNTWo4MTlSR1Rn?=
 =?utf-8?B?eG94RGx2YUd3cUdPWGpDYTVJa3dXSTBhdU1lZXo5YTVLY0NNYk53WFp5dncw?=
 =?utf-8?B?MDkySWtoZllhWnpEd3FhdUFRbGUzVmQreFlseHpUd204VTR5aDd2ZDlvNXUz?=
 =?utf-8?B?cGFpV2k2T2EvWWVHcSsvQlFrWXZYRUpyd2VGWHpqcFBEWGtRK3MvNis1RTFx?=
 =?utf-8?B?dVFMOFUyaVN3b296R1dTdEFuaW9FK1VzRXdPZlRXTzJwSVdlR2dramQ5cU1Q?=
 =?utf-8?B?U0tuSjUrKzRmRHlFZE1RMUpwN3F0c1hvWWxwc1VUZGMvWmJZZmtuR2FUaHNj?=
 =?utf-8?B?U0d0S0hCYkZWalAwZjhiNWhYNDFGbHdHTXlWS1ZiSWVLODhtckhsck9JMFBt?=
 =?utf-8?B?eDVhMmZMOFJGR04vTkU3d0RGWS81eTh2UWJzUlc4RFR5MHhZc1h1djdsbWt6?=
 =?utf-8?B?Nzd3M2xaV0xZTHg1enJjNTRxRFkxZzRKckZJQ1R6WUIra1lnRUtBd2ZXRENo?=
 =?utf-8?B?YTNoRWZObEw2ODN6TkhRWUFEdUc4Z3J5S1FqcHc1T2J5K0htcWp4dGFab2Nv?=
 =?utf-8?B?UGtvSkpJYm40Q29HbHNuUytjZ3ZKS0pqOS9FaVZXZEE1WFllajQwdkQvdDEw?=
 =?utf-8?B?TS83MzhRSUVRNTBVNnZTWVd1UDdJL0M3Uk5CbGcrcGVLWGdWdldMdHlsVHly?=
 =?utf-8?B?NWYyUXoySFZzMitLMm5vaGszbHJPOGxGYXdObDdRNlRVdUV5ekpKOG8reTE2?=
 =?utf-8?B?N3RiTU1HaTdpZ3dNTmtVeGVQREdsSm00a3V3STFTTEdORkEwM21EeExVSnZW?=
 =?utf-8?B?ekpFT1VTZjdvT20zR0RpTUZ3a0o1ZjVzRWJWWGp5M2tIUk4vd2RYVkpwV1Q5?=
 =?utf-8?B?V0Fsb3pyOGxPWG1GNnlCbXdPbjM2b2xPSUtyTjVkQmdQdHJxSjRvQ0VzQnlp?=
 =?utf-8?B?Qy9XNTJRTUdlaEhuTzM2TWhZd05PcDVlMjhpeE5sU3M5aU9xMUQ4ZXFmdW4w?=
 =?utf-8?B?TVBkZTQ1RTl5UWY1YnZ0Q0N3elRVTldZZ0FIVjhKZExlN0Q1ZGVDdkdyY3dh?=
 =?utf-8?Q?I0Fhvgn6vY488j/f+iljlC8KC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b386b77-8872-4dc8-94b5-08dc20a9fd69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 09:09:25.6143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6ONTFYTYeGtIHZf2fpaNdSNbZaISYBqINdljJURG17hNuFCg1y2vQMp5/vUkFjgfjuVnOsmYAHUQCXaZrqusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
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


On 1/29/2024 2:17 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-29 at 09:01:55 +0100, Nirmoy Das wrote:
>> Atomics on system memory for dGPU is not functional
>> at this moment hence skip on such configuration.
>>
>> v2: remove the skip_on.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks, Kamil. Please also help me  merge this one. Currently I don't 
have access to my devel machine.


Nirmoy

>
>> ---
>>   tests/intel/xe_exec_atomic.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
>> index 7ee80816c..48c70ec72 100644
>> --- a/tests/intel/xe_exec_atomic.c
>> +++ b/tests/intel/xe_exec_atomic.c
>> @@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>>   
>>   static bool has_atomics(int fd, uint32_t region)
>>   {
>> -	/* System memory atomics on PVC doesn't work */
>> -	if (region == system_memory(fd) &&
>> -	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
>> +	/* System memory atomics on dGPU is not functional as of now */
>> +	if (region == system_memory(fd) && xe_has_vram(fd))
>>   		return false;
>>   
>>   	return true;
>> @@ -135,8 +134,8 @@ igt_main
>>   			uint64_t memreg = all_memory_regions(fd), region;
>>   
>>   			xe_for_each_mem_region(fd, memreg, region) {
>> -
>> -				igt_skip_on(!has_atomics(fd, region));
>> +				if (!has_atomics(fd, region))
>> +					continue;
>>   
>>   				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>>   					      xe_engine_class_string(hwe->engine_class),
>> -- 
>> 2.42.0
>>
