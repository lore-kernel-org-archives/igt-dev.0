Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA79C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 13:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D310E7EB;
	Tue, 23 Jan 2024 13:30:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586E10E7EB
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706016638; x=1737552638;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DGm0BvyxuAJrgBeDZXt5z7S6DFydB77yqFh0YmvNhzA=;
 b=PiAy8LeJx2ObcDMdL7m2bVWiwej+Xky+6aBf2pc3uNBB1uGdL98gSaUd
 g7XrpbivEQW19D4aeV8hPfZZ6ctIPQHFORhXgAcHX0aI2zeO9846sr3j1
 JKJAc1nQZz0rrof6nQEmD97vFIQrazJYtigeAlFEb8kdK7khW9t4guEvD
 MrSUaWzQ0sVlJiHmvWa9NzAUv9jwuKL64npoJSn3t8Xp27nEZz54armMM
 ZiUfrEi4Khymk1M6uD0lD2TgPRyBdjPcYvo9FuRMJZAjKFwmwmQx3Hrjn
 lHjgYNUuwiDhkO/BWrDt1xifvLKZwBIbt7WdgH3OBtnIK5nv+9h+Gwo7B A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391944466"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="391944466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 05:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="34415080"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 05:30:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 05:30:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 05:30:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 05:30:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 05:30:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/6xZZWd9RKsv9IlCg9KW/gYAsNYQgIACDL8wu5hFZ3HptFUVINGr7WR1huNEBl8EqwUVTb44BamMvLcICIJ23SOeMb0d87Y7JwFQ4N2b9VrSnycsvnSwgzRefpga41saTo176bLUUCfko0MwECVMxNgg2X5Nfo0xFtiEqQpX/8GpgE9gqLF95aMoZ2wwDMKjj+oPop1VUpyr+suE993nlrPDotmIYaxVjhEn9TGBTdFBrceAKv3vYRV/ka2qBz8ytHTtZyea52UB3DCeCKplwKfY+4iXdTW4dq64HH40z173FmR/HWYpx/if1Dgb9/MmVeEBz85GW7pipSH2fLvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6hjDnbU1VHMQvdKIH7V9c6S6+zITrEGr8YADihDfzM=;
 b=WoPSbBANpd/w3OuvgJ77LLsKydkQDMdIiqg79/FDBFlbw9flKHsbFcZy1dDO6vwMW721eqbuqCVHlpioAeSy88/hqTcKRWrVU0XIvGArJmiaYUQz1ej2CpWNY/Y/WVneQGEjQGtCvUrx20PiSFy5W1pzbt+5HitGiU6zDLG5yCDP8ZXDU5fnqmC+R31VkeSbmtF+KjJD3ocqiSNBiOKEyX1X1VQJcEDMstwksrVh2SsR9cU4VJLAtfKsdT+IWVvKtYAnLn3hmmCl5ezhLfCC0GQNXYpmBA6rwcZoxOceWYNhgiEZ94qZq2bJcjHRYl7rWSWleEZxQdkuU5D9J9mhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Tue, 23 Jan 2024 13:30:32 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::5e80:889f:ebfe:8a37]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::5e80:889f:ebfe:8a37%7]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 13:30:32 +0000
Message-ID: <4669374a-1988-4ee4-83b4-3e6c4dcb91c5@intel.com>
Date: Tue, 23 Jan 2024 19:00:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide
 suspend testing
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240123060047.2844372-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211D90334A2E63E28645EC795742@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211D90334A2E63E28645EC795742@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: dd58adbb-0b6b-454e-1928-08dc1c17793c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZfQu9cJ59TIrhratyLbju6rYyE4zZpDnLRhXj5YPcBIOD6wCDsQtWw3UFjwEYtf7VkpMgSSQtxebTXmsNUtIBQkeuNE8v4SF6juF3KTu1WsqHVyutFSy5lzLH2QbYJjO7p/cRnoF7eKxEdRF5mZm31pkknydoSuquGa7l7cidupFRgSJMjQ53vRkY+k4CrivJVqY5LLDxMb09hj0e28aLO4v6Xl2WosUXBmJOhaH9r6lP9G8/pLO5gc7l3zBiCOR7Vm3vaaAXuBAZTyVlYDrFn2j+Q4yoYHE2Ih+Y5y46lM6hKn5zWgNP4jYzbnHEY4N7zmpRY8652EiDtXWvPM58w22Sc6Jup6dGDh3dZsHPNyhtrefTIIiXdrn2d2ed26V6vsEgk8HkTy0IaF8JRMG/dp80/xVPjdJ9cQ2Ti8kT/FvLxGFw3vL0lacG0Wf936wApbJEUCp+o7UVlDyhIUJwhzmZzyCgo8yojouMXpRveoHnnKyxsgs/x3nRma4dcjOA3xe0G/YXzsRBsaOgY4+gVTNVPj+tP78RD/3XS51780uCbqJO90S0FkUCTTNJBuwny0j2L6SQ3WQs16xPJ6crHt7o2RN8qHNmhWt8xrcq+cP1GqWXwtsHx6sXkmvJHEYRHTWXwkjtO0ljEKlN6TZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(41300700001)(6486002)(8936002)(5660300002)(2906002)(8676002)(15650500001)(316002)(110136005)(66946007)(66556008)(66476007)(478600001)(53546011)(26005)(6666004)(6506007)(6512007)(2616005)(4326008)(86362001)(83380400001)(38100700002)(31696002)(107886003)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nitrcks1MDRpMnZTUFZZRFJYUVp5T00wWE9tNEtsd0tNUlNKVngvaE5FWEM4?=
 =?utf-8?B?WjRtQmdVMCtvODJGMW1yeU9DUHY0c3JDUndlc0UvM2xXVFdGRzVNbHBzNk5m?=
 =?utf-8?B?Mno1dERsNmZvZUl5UTlzSmt1Nk4yd2ZRMWRKUFZzWm1OU2JXeDMxWUtURTIy?=
 =?utf-8?B?dVpTdVJpNnZwQkZ2K2tRZlpmUXdlVlZ6OGYrbG9nT2xad2psK0Z4dlJSQWJr?=
 =?utf-8?B?YjE4S3hDd1VlSFU2c3NPUktWUW1PclNqVGZML3Bka2tPb0VDL0pLNEJTdVhM?=
 =?utf-8?B?T0d4dTFuR003WDZiWjNMR0RUd2RBekRPdVNMVWhuV0dYTEpCNk9vVEhDL2ZU?=
 =?utf-8?B?a0tOSG5Ta3FHVEFrdGM4L3NWa2lRZEdiOFF6WkRzOEtqZlVXZllkZms1amRG?=
 =?utf-8?B?N1VHaG9zY0RVaEF5UE5UWTZJTUxQeWpDQXdKaXQvZXpFeXpvLzlEMmhLb1lK?=
 =?utf-8?B?LzdTU3gzRWtBS1RIN0h0TGVjV2VPbDE1WDNOYW9TcklNOGxITUZSVnUzQi9z?=
 =?utf-8?B?RVZIOXIzNStZZzJ1cGhsTnJrSXFIT0oxM20ySzJmSFozMzBtL2RQMWNqaW9Z?=
 =?utf-8?B?azd3YXE5RHUzaDhwYmkrUmFaWUpERmdjMGxwWE1pc3BCMnIwc2FyNVdZalNo?=
 =?utf-8?B?OXkxREdqRFh4OTJCME9zNlBWTi9kNGxaSHhTalAyTFltcWZpQ2tMT1RsSHpB?=
 =?utf-8?B?Q1FzMUhyc1g5cnc3d1ZBUWdkZ1JUZ0YxbDZObWFCQTFMQWN6L3RGK3N5dEVr?=
 =?utf-8?B?Z0ViUEJFeHpjbDNtMDd1djFmSHFqcGwvaTR3NXJKOExueDNLTTdZNUdvRm1J?=
 =?utf-8?B?NjN2VkJwekhNdTF5V2duMHI0dk5WTlZXNS8xWGFBRFVGK2FzNC90VHE4eUlQ?=
 =?utf-8?B?T3FsQTMySyttNjczclBsWTlKdWlmaFBMV1JnVTNrdjZZODZ2TzBoNUJkemtI?=
 =?utf-8?B?WmlRTmpPNEdxQzFaSk51N0hRREl5UXhqK0FpQ3dWWWxKTUJkNVdYb2ZZWGZj?=
 =?utf-8?B?Qk56OTZSbDVBalJ3c1pDbHY1TlpaV2FVSWFuSWNOTElLZ1pVTkEyVTVucDdK?=
 =?utf-8?B?NVRVbXJ1VDdFanRuVWVpbTdOV2Z3bW96WGVIeW5NbDl1ejkyemlpRlhObE5t?=
 =?utf-8?B?MXR6QkFMVXJWelNvUUlEeThJL05WbWRkWEVObFoxYVdwdFN6WmIvYTFkWGw1?=
 =?utf-8?B?VkRwNm96cUdNNWNmbXFvMnY0SU83dnZVTU9QTER3cVhSNUQ1MVAzMzNCaC9z?=
 =?utf-8?B?eXVMQ2NLa1lKa0JsU0J1Z0xseG45bmw4aW1CTStBenhzdGwzcmt4OVFJNHNw?=
 =?utf-8?B?cjJ5clllZlF6ZTgwZTZkUXBYTkVqTmlMbkpvem1wbXlJL1d5SUd2TWVoWXV2?=
 =?utf-8?B?TWhWOFpSZ09QYkdPLzFUSTlmRlZrM1hOSkkySVFLZFBoSVBrYW9yQ0FRM0FX?=
 =?utf-8?B?Q1BleDRLdjA2T0xWcGxBWTFVaWhOaXlTUmNsSUVaQ3Nsd2kvbVU1ais4eFdM?=
 =?utf-8?B?MW51ejcxT2g4S1hackFTWWhoQlZBQk55MEtRNzVtekh1SGg1Q0VRY3BzRFFw?=
 =?utf-8?B?TWhnenI5R29QbGw0ZXBaS1ZHcXpTWkJSR1U2dCtzU2NXd0t3U2xJYnBLeVlB?=
 =?utf-8?B?dDBtNnZjNzVGdnhTVHAxZWJ6K1ZiSytaNkx1ZlRQTUcrZndEQWFsRGxBNXB2?=
 =?utf-8?B?Q052c3AxSWhrUllEQjdIRGdjbFBLaXdqTjh2eEwvU0VKbXg0VUJxZXlzWjJS?=
 =?utf-8?B?S1kyQzRTWUsxZ2hET2JvU2VlMTlwTzJ0dkpVYm1lc3dkRGNja2liaUdoSzZZ?=
 =?utf-8?B?Q2t6eUF3NnpHQ1I5MFBSeU9BblZpWG9QTStEZlVWUWJSb0dYdFF3RWwzcWVi?=
 =?utf-8?B?a1I4T2dEZCtCci9OSWJnR3dkUVpFSEVSYnErTGNXcnBNVDR3SW9VY2loMzFK?=
 =?utf-8?B?SXdKUjh5Vk9KdTRJNThoWDNONXhaLzU4U2tPdVd2QjFIUWRwakJjV0MxQ0lv?=
 =?utf-8?B?WDBXSlltSlJGNndkb0VPQjltY0pad2xjV1ZSR3NiZDQ2YVhUTEhMMmNQMVpC?=
 =?utf-8?B?bWIzS3FRMG5mbC9WZFR6SnpiY0d2dFdaRTNUQlh0cHhyWmpkWDNNdnRuWUx6?=
 =?utf-8?B?WTJ0YTVVYjJWZWFEVC9ybjNpM1U5MnpiWUh4YVRFM0YrV1JSditpNDBzNGV3?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd58adbb-0b6b-454e-1928-08dc1c17793c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:30:32.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Zmbf8I7bsPiK8usX6cNBJ1DpiFWFyrbPTG42Vd7sq7LnYhMPw/IAd5H7rxzF6DemPMJsWT6zigGzNfi69qM55pEx+5D4abNlEt+8sqyry0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
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


On 1/23/2024 6:58 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Tuesday, January 23, 2024 11:31 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sharma, Swati2
>> <swati2.sharma@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [i-g-t] intel-ci/fast-feedback.testlist: Remove system wide suspend
>> testing
>>
>> Remove system wide suspend/resume testing from fast feedback testlist.
>> This will be in place until we have a proper logging to from CI to obtain reliable
>> test results for the same.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Also pushed to origin/master.
> Thanks,
> Anshuman

Thanks for the review and merge.

Regards,

Suja

>> ---
>>   tests/intel-ci/fast-feedback.testlist | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
>> feedback.testlist
>> index 60ce1efa4..662e49cc3 100644
>> --- a/tests/intel-ci/fast-feedback.testlist
>> +++ b/tests/intel-ci/fast-feedback.testlist
>> @@ -168,10 +168,3 @@ igt@i915_pm_rpm@module-reload  # Kernel selftests
>> igt@i915_selftest@live  igt@dmabuf@all-tests
>> -
>> -# System wide suspend tests
>> -igt@i915_suspend@basic-s2idle-without-i915
>> -igt@i915_suspend@basic-s3-without-i915
>> -igt@gem_exec_suspend@basic-s0
>> -igt@gem_exec_suspend@basic-s3
>> -igt@kms_pipe_crc_basic@suspend-read-crc
>> --
>> 2.25.1
