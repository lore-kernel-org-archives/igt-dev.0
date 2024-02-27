Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7078C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 18:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C5810E430;
	Tue, 27 Feb 2024 18:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmzsES81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C5D10E825
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709058980; x=1740594980;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ojd63gxH6XH9sl2f+Z16vZwHYQWw/TtRz++38moocHw=;
 b=kmzsES81RPwYSZV8skbS+d6/4HF/hUqIjqdy67TbgP1dl1DHrKGPnygS
 a61dz/y/m5iTTqrAHjPwR/hL5iJ/5HBd067uKriEMG9lVjHW4QU8XutO/
 87ZuDTSDLTV16ZvesOmqPHUzOttvUHoJ+4zQ77U9FSmkLsrpLGJIrgg46
 jubT4rXp8jvkSpIt1VrRIxTlnXyowq1WxrNQJoIfIuFp+uVZfqP21o9wU
 EXzczF/HP5BOXHv3N2z9TjF5+6LYjY0PJiNf9gmi1N8a1BBkjOJq6+N+o
 PYveXRyLUYyIDperj29tg2Z/xXnKmHHE9Tv/us1OEDGw5ZYZg4I4ssxrF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14859508"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14859508"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="37957665"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:36:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:36:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:36:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:35:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctR8kNOCEJdonIN30NM+4r6jMOgeGsMlMA3YUfWnPJ2ymTBeix/1Ax9A9c95zOF8NYs/4WMPBijT1cbUqITn2iuPOJrVHFeP+1GrVqzdx7RGbxuoJCOpbR+SG/G4xv1SIPSR2wiN/zvnqcvi2rVVuh/MvxbpMDUYLeZ+OSjhsAQiM3ZmSimpvSVHfy4m4jwJ/Lg7RFYLKYdq5AwDEB7BmLj1lNWQ/F4fH1O4du0GFw2ywxuDm1rhjm01eh30OuyFvoTJDDuIgd+aj/HVvQNQKZrfE+te2bCwXZTZLdy8zDl1+Jj4Alfi31tA7ECP94/Yst5LqoUVDxffpLCU8TfQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaBpfwAo/LE+fEHV1XX41AKfiAIlXK1M4cQcjHNQ8wM=;
 b=CU3bdhCEbt9wuHwrw3RDi3V95u/lrCwWheFLtfQW7vj8fql/7598Zvkm+z2uK32/gUISSHBxclZVNxf6VljDjz/L6NoeGJji0ICSyF6FW0gUFZFyR4RvcXrSGpY3LBcf6ftraqthDAIzhQat83+DmaPbRMP5QnEX+R9ST34EgHmMfwKmpoMAp12qu8zWS0F1hheYUsNktVs12eU/8lQn7fSN8Ug9bNHf3HSAorhWFHUlEVm93dIOZu45Vg9uH+zlwBPwvp19Yvf0DJPStP1LIP47nF19+mVjgJm2BJKI1dbC4vdWcEfLZLdqyiURxDemsp5obnCKA99PMFO7wIyfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 18:35:54 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::d14c:c9b8:75b8:6add%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:35:54 +0000
Message-ID: <ffee3004-32af-428d-9dee-e81ca9a354ce@intel.com>
Date: Wed, 28 Feb 2024 00:05:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate
 cached stuff
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240209135526.135380-2-gustavo.sousa@intel.com>
 <170845211015.44184.10125779397878338003@gjsousa-mobl2>
 <cf373084-45f3-4c85-aed0-9fa97d84a3e3@intel.com>
 <170851900590.23070.10525095367187353126@gjsousa-mobl2>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <170851900590.23070.10525095367187353126@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::34) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 618beb17-40bf-4fc8-366e-08dc37c2ee5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDdxh68ElhMM09MmSLgx3yzSWrS7liHTh1ulqxxdyLVf5k7ny7KUWHRjLcnsypEknh9USgJ38FnHFs/FLcJxXEj5wYZ/ykbzxfepm/O5WpslcGaD+DzItQt1g9hd4Zf5p5jY5SL1xgQMNEvx0Y9qvu4+GvrC70GRtVmq4+iRDMPdldP6aRhPdtC0mML4u4E5NpmIRAj7JzRq+wwZFZdS9VqRAIFeGLTkLq/ums3EXG2RMxP5zxQrAga2HPf+Ltvamwk2QGy3AtbuzsB612kbkYbOb4bil6fHHTg4PsuOtJSdUpWoxXt8J1sjp/a+8UbSdV+iOgLN1qo3G5hQRjA+ZVssjmHZpIXFJfkKoELfNTYmfn4edMTrxcEURktKJCLuuShvnctSKKv4kaCdyIQJ9r6BXVkT75MWeqk4RmG7srA3GeTgLgqTuTT5H0RzSeOQ2EIovm7orMU4XZ/kZiWdVE5Ha0VS3u7MiKggqAmLt6P/jDR7ZEJfSuIqakDBt1SoDSzQUTXzOvi4v/6MTPieMfgkHqKbMbhjp4OlOVaUZrsp4FIA1MfX0Hw+Oqsu1kKf1ftBM69FGVKoct3sbiVZnAm1HUUmhwPKsrDegzxPU1MGRJspHV4ntTvvhrBjoT6jeou50SIf2vsRkhAS8lZpKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXQ3MFo5VnR5ZWVubXdaUU42OU5nMmpFMnk3V3lIbFVVOXFzYzk2UXRPWXVD?=
 =?utf-8?B?bXFKOUVFVnFwd0RBUlo4THlaeHJHN0NFOVJEb2xLOUFFa2Y5c2VlWW5Sa0lS?=
 =?utf-8?B?d3dxSTlsOXlnUmZrcUN1N3ZialNlNlBLWUZZdnJxQTBGR0VmNENONk1HTHps?=
 =?utf-8?B?VTkrTjBVMlZrWlo5ZVgrcWt3M1JYK3hyMi9qNzB5dEdXOEZPelVPbkZKMUZq?=
 =?utf-8?B?ZkZtakVkMHU1UEgzWVl6eFVMZURMOEx4WUF3S3dWU1Y3Qi9DaHNQRjg5cElp?=
 =?utf-8?B?QTRrTi9FMUJYaXgzS2lNM2tSVHQzZ1o1Q3U5M0ZobmZyb1R6ZEUwSVUxT0k0?=
 =?utf-8?B?emxUcW9JRXVReHlGSGtrYnNSTGRHTEw3YXlxeEkrT0NFVnRSUE1vUUxpb3Z6?=
 =?utf-8?B?ZUFac0x3VCtFSDZ6eUtibHZacmhwUVQ2WkwxVzB5bHJUVVNZaWluRjEwa1k1?=
 =?utf-8?B?YVpSMzd3dzRja1dSbndacFNHblFBMGw0S2tURmFrenVNcWplOWxEd1QzT3dx?=
 =?utf-8?B?dnBYb3RMUFV3QTJBQis4aFJWUUFveFMyazZGODgwVThtVkY0STNPZ2hiVFdM?=
 =?utf-8?B?UFJYaXRQcXdtSzJhbFlzWTN1MGwxRC9GeXNwVlUyZHZEbHlkVjcxd3RyaVhL?=
 =?utf-8?B?VWllNWg0aU53clJmRVlNWGFJV0dEWUR5bE5MMU52QUZodXROTHNjVDZXWmNh?=
 =?utf-8?B?dStUTVdvRm8xY2FWQ1loOXlvTkk5NXVacjMveGJ5OWVBN3k2L2RxNnc5Nzd2?=
 =?utf-8?B?OVdhQjBsdGFmc1FRYldKNkNkNTJjLy9GeHZqOE5zZ2pRYlBFcHMyMUFWWHhs?=
 =?utf-8?B?VDFSRzZQSSs1Z0gyeUpLT1pIM2NlS0p0TzYrTmJoOG1lKzNKdDRldVgzQi9C?=
 =?utf-8?B?QXlsMUhJWGtiR05BL0VPV1lpQkRHSVlvcEU4Y1JLaUN5OHFGQjBoaUZWUjRt?=
 =?utf-8?B?R1JidUpnWjVDWmRtNDZvczlkU20zN2NubW8rRzhpcUFNS0o5Zkg2czhGQXl5?=
 =?utf-8?B?NmVyUUg5Q3pDWFc2NzRrR3FiK0UvQm16QTVxU3lHZjVqdG4vSmFJWDBJMkEy?=
 =?utf-8?B?T1kxTzZLNW82NUkvQkg3N2dhWUNUNWJRdE9HUldHNlFoZS92Z1ltNGJSK3l1?=
 =?utf-8?B?MzNFUE1KMk5BQXNYb2s2a1RnVjZQY1pwOG1IdnZidStKNldLUE5YK1pjTU9h?=
 =?utf-8?B?a3hZM0R2cEVPSEhuS3cvaTNIbi9rcm1FYnpjcnlKNkdDODJ5Y3o4Mi9aelZ6?=
 =?utf-8?B?YWMrVENWNmxIaU9LeGYxQVVKKzdFOHdZbjFsY05UbkxTMWQxNmZnd3FSZkxY?=
 =?utf-8?B?SUpmeFBiYmlYN3JSZ0xobTloU2UwTG5hamRWSnJrc3djNVlvWW44RVVuMUVY?=
 =?utf-8?B?L2YrNzBZRUI5QVYxd01jNEtaQkpRUkM2K2xMZmkwRERRYnJpWDErVlp5bTAz?=
 =?utf-8?B?dE0xZFZ4VGZML2NHdjNEbGpGQ0hhTi9rTFNGNFhhd0dkb2JtM2xLZlZNNGtJ?=
 =?utf-8?B?NjhEdUVPQXA2WDFHNE1wY1lZSXBpdGJveGJZTm1jZnpTZVlHdTliTGt3aXZi?=
 =?utf-8?B?SWZyckRhaG9DT1JUcU5BbkEzYXRBSDIrRm85U2VLNlJNRDVYTHNSSU9sWnlB?=
 =?utf-8?B?ejF2UG5iNnAvclpONlpjWC91T0Q0eE4yRnBwUU1YMjkvQ3dNU1RoemhRKzhw?=
 =?utf-8?B?WVFmb01jNGYySi9SeG1qMzgyOHR2SUNhYmxkNHZqWm5SL2ZJdjVIYkRkTktr?=
 =?utf-8?B?M2k5VGRab0h5R3B5NVZhcnRGRHdaQWtDdHZ2aUZCOStRTHBsQThqTXZEZFN1?=
 =?utf-8?B?dG1oVmFOWG5zWWNTb29kbXFuVEZRSG1sS0wyNHpXSm5jblVsRW13bGEzYUFn?=
 =?utf-8?B?aWFQYkM3Vmdpcm5zRlVjKzdlcS8vUzg3NWpJN01oYUdHeEgzbEJQeWJEbmJD?=
 =?utf-8?B?Nzd3SFVySjc2YlU1TDZkTG5wZC9FektENWlXY0xZQ1A4RURsZFlBd0ZMT2Fh?=
 =?utf-8?B?YUpHL2tuTGV5VWc0dThSTko4U2hkVVN5d0d6eEpZU0tEMHRzbWJUM05nZ3JU?=
 =?utf-8?B?ODcvUXl0YjJmNlVDREdocEJPekp2azRTeDIvUUh6MDZ4LzBiNjk1bG43VDNI?=
 =?utf-8?B?bWZUR2RrcDZBVEg1aGxzOW5sZVNoN0pTSm1hNEFQUmo4Ynd2RnllWDM5NlFH?=
 =?utf-8?Q?cB0xZgi0KUy5QfjIDhEVNIU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 618beb17-40bf-4fc8-366e-08dc37c2ee5b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:35:54.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7i3yB/9vIUFrkLHDWL5+nsludaxk8UVr3WMK2EfURoF26Hrvx21FSFx3VgAAdnB76e6mcyXDyhqgnBx2OOjnhaR7G7lMMP5Xrn3WEuLj6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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

Hi,

Reviewed-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

On 2/21/2024 6:06 PM, Gustavo Sousa wrote:
> Quoting Vodapalli, Ravi Kumar (2024-02-20 15:10:22-03:00)
>> Hi Gustavo,
> Hi!
>
>> Below my inline comments
>>
>> On 2/20/2024 11:31 PM, Gustavo Sousa wrote:
>>> +cc Ravi.
>>>
>>> Quoting Gustavo Sousa (2024-02-09 10:55:27-03:00)
>>>> The test pipe-fbc-rte updates the primary mode parameters for each valid
>>>> dynamic test case. Because of that, we might endup with invalid cached
>>>> data due to differences between the initial state of prim_mode_params
>>>> defined from the beginning of the test program and the possibly changed
>>>> state after pipe-fbc-rte.
>>>>
>>>> As an example, in a specific environment, the command
>>>>
>>>>    ./build/tests/kms_frontbuffer_tracking \
>>>>        --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc
>>>>
>>>> would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
>>>> it would try to read CRC from pipe B while the test was being actually
>>>> done in pipe A.
>>>>
>>>> Another potential issue worth noting is that even pipe-fbc-rte could
>>>> similarly fail if the set of dynamic subtests spanned across multiple
>>>> pipes.
>>>>
>>>> Let's fix that by making sure that cached stuff that would depend on the
>>>> primary mode parameters gets properly invalidated when prim_mode_params
>>>> is the target of init_mode_params(). This should fix the issues
>>>> mentioned above and also future-proof the code for any future test that
>>>> would need to modify the prim_mode_params.
>>>>
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> ---
>>>> tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
>>>> 1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>>>> index 912cca3f8d45..17f74990979e 100644
>>>> --- a/tests/intel/kms_frontbuffer_tracking.c
>>>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>>>> @@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
>>>> static void init_mode_params(struct modeset_params *params,
>>>>                                igt_output_t *output, enum pipe pipe)
>>>> {
>>>> +        int i;
>> can you rename variable i to cnt or any meaning full name to that the
>> variable is used
> IMO, cnt isn't very meaningful to what the variable is actually doing.
> The variable i is simply being used to iterate over an array. As such, I
> think the current variable name is suitable and conforms to a pattern
> that is already being widely used on the code base:
>
>      $ git grep '\<for\s*(\s*i\s*=\s*[^;]\+;\s*i\s*<\s*[^;]\+;\s*i++)' | wc -l
>      1535
>
> --
> Gustavo Sousa
>
>>>>           drmModeModeInfo *mode;
>>>>
>>>>           igt_output_override_mode(output, NULL);
>>>> @@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_params *params,
>>>>           params->sprite.w = 64;
>>>>           params->sprite.h = 64;
>>>>
>>>> +        /* If we endup changing the primary mode parameters, we need to
>>>> +         * invalidate any existing cached stuff from a previous configuration. */
>>>> +        if (params == &prim_mode_params) {
>>>> +                if (pipe_crc) {
>>>> +                        igt_pipe_crc_free(pipe_crc);
>>>> +                        pipe_crc = NULL;
>>>> +                }
>>>> +
>>>> +                for (i = 0; i < FORMAT_COUNT; i++)
>>>> +                        blue_crcs[i].initialized = false;
>>>> +        }
>>>> +
>>>>           free(mode);
>>>> }
>>>> -- 
>>>> 2.43.0
>>>>
>> Thanks,
>> Ravi kumar V

