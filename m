Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40930C531D0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 08:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7D10E0BA;
	Thu, 30 Jul 2026 08:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS4yWBsc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D397A10E0BA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785399211; x=1816935211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AvhnIqWzubl9h+Ho5/qNQti/Pa2/Gd66iO8jSQDain4=;
 b=SS4yWBscMQiHFSJ8Fv5XzM9XXno9FFnHJp6hbHaQspRsY73NqJenzz43
 EBuJYIvtgGZ4zUKNV1o+9MjGnbPAyccL/FhnIZvjQy1XzBrovSE4283dy
 GuKbTMLWjl8ReG8IgLv7LmeexBybHN5oo2L//YjOYsFjl4AglcmtepWzy
 44cv9TVbWJod26XlIQuk347T1eJ4ci2YG3dHcKLKK2IJYvQ6VtSanvMEC
 etBM08hc7PIm2z3OmnWLKlnJX9oORNvjpn0Jl+2XHxobAmh71lEoZ/JrV
 qqlwM3ixO1gxKgIXm52tywTXhTu6chZapygcrb6JJCYM7O0TbeohREHNE g==;
X-CSE-ConnectionGUID: DxBO157BR9mpCVH7WGYexw==
X-CSE-MsgGUID: OYP6MaDDQMKkNk5krA4RZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85961547"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85961547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:13:31 -0700
X-CSE-ConnectionGUID: 0oHHeQqVQoeSjDTZpU3A9Q==
X-CSE-MsgGUID: kawqDxhlREqGmmTvKjgocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="255935149"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:13:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:13:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:13:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OK/yLDSMJLsHSeDn3xWfPJ8R6v0zT0m0ytcFbw/T8UQD2Ffi/P3Al4tOS/7/MU41hHxMgbWCQ04akRS2hvaV9CHyodt+GI41WtZLp50n9Gu8UfVQFVuZhG6Ouj72jijdAjeotjB+i2ySSg7u4rGFvfAey4EPhn89Zg10256bFn0UA9tPta7T8daTM4aDhtBwRnfgL3KKz0KN4g5MYPj+4FItWWZolV8fTCzkn3XfvkmjzWvhCSuKjMjMmdib8NTCV51Zi4sEV+P8vMXLhBSnBPVOQB8sPcSm/HTEhWyQGIRRnrsnHfGvb67pSTUwzs1fqv3zXHHH871zaZgUBvA+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMs27xM3oGgfH1IbpGZSiE97RjvsyjpVUjz5xGj0DE0=;
 b=ndTd4FpAFh4tYB6C08aowPfwv2Wj6PcIUtYhQ0dwLu5pUGXc3i3qhEmSAsdIGP4aWEMWYB7AFQdGI8ZWHYWfvrGsF7N4hA4XkwM6XyFBEofQGieM4wHNrRZt+IHfS/9JdzpXSaIA3AsLahvsr2in2WAGuw3iz6LZKPXT/b2yN3gWp15BzWvme6clyf1BiWxhRgfrEECR00hnHaufhu3VZCYJgsuIeJ4jHKTjvbWe995aBbiH/xDmbAtEXRFU6pWFXO+bsDitDGrbMVFZMWYzWkG2xNEAAh1l8o2+gh9bhm0r0dq9BsV+5LTvGu1alVsHzD1ufjZ5E+UYJ32l8Qqlsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 08:13:26 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 08:13:26 +0000
Message-ID: <ce7ceed0-79c4-4280-9afe-827d17547b69@intel.com>
Date: Thu, 30 Jul 2026 13:43:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xe-perf-recorder: expose some OA stream open
 properties
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20260728063606.2874276-1-shekhar.chauhan@intel.com>
 <878q6tgpae.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <878q6tgpae.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS0PR11MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dd0e83-3ca4-462f-d13a-08deee126e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|7136999003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: pT8wxtyYHMBfTK8xpQYWGIvSDxeemMywKLJ9aeCFymrezZcO7wEwKfTFBouoxOVQtqo/pA954gBp41Z9C7e4mIxf0GUzkxDR9oAGMqkizMsvoz07F/WZdGI7MENBhgYEKjglexTzlyB/6k+OXpdW29TNPykIz95z+RM527ii5l2fQN1OavSbhKEbHGnnKQK++dUDnFvzLbFfh3FMZps2oc/AVCsVIEargAiut3yYmNVOJW0hLa5SIYkJeAhiU0FgZ+r560z4+ycrRECBitav1y+ybMxbu5OLYycAchzIpkS5JyRNW8Wys359/+GvuwuWPH1mJREZqcrx+jrakpBR9DEj/f9yGZcUwKyplzQlb6K/J+SiLKfOT4EsYotdiTtshpnlp1Nb1lZHdnzkQibiUa4OV6YjndOwlHjMMqxM82dxJdR6Hrk5Bc1Qxwbw0cxG56JFIieJQ7W9NlKokIBkMI/Jnm+FwLr346IdhqUTMqYcLAaptVKYa4QslXALCeIaKH54wKq9Hm1G8sslY6Xd1J7bLnwZFCPa4J6oz89EzEkRe8yDheZJKKzvUVsGDuIW+CvXAKhwveRcNGmgyNUQvuzi0XDTH39+44iTirZd9O/Xykw+QjA0AcOxU2XVywbiWPM1LDZCY4IhR4mn++UJoBzduAH7No/Ow/nR661L0p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(7136999003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTdreE1HbHFhekp2M1B6RmkxblpUQStUNTd6RElKdFVyZGRKbjZGa2d5QThy?=
 =?utf-8?B?bEhjNXZtL1pFSDNNdjkvVEtQdEE5QlFxUmQrTE1XOWR4TlNOaVFSb3NKSCsv?=
 =?utf-8?B?eEEyKzVLYXQ2dFU4Y2FEU2dsOEp5MGpOUEJRYmRNWTQzay9MMW1pUHpOdWln?=
 =?utf-8?B?VGZyazJ4WmVKWlRadVRHQ05tQW5oSktEcTRMWUNScDMvSExzVHM1RUNIanox?=
 =?utf-8?B?S2l2MlJJM1ozNndOOEs5WTBDYTdnUU5FU1l4VFFKR1BOR1JOb3U1bG0xLzlP?=
 =?utf-8?B?dW1IQXpwNGowVC9CMWIrYWlGYm9Oc3R3K045c284SlQ5NHZ2K0RBK1FWQTIw?=
 =?utf-8?B?emlPaTYyZ3FYWlc4ZEZDZCtGQVNXeG5CKzlGb3BqMUJRcUxPYVQ5YzBUUE0y?=
 =?utf-8?B?aTZSYjVSMTA5cGtLNUZydy9CczI0RDVWa0NSMm13bG91dHhycU02VWV3ZVpu?=
 =?utf-8?B?ZG5LdEhuRGJHWW1kR3g5bnB4dENyK21FRkQyVzNMTkQ1Wmx1b1piamdjUnJj?=
 =?utf-8?B?RlZmaVI4bnphNzVmSFFoWHhCZzRYQVhBS2w3a2V4ZTl0WHVkUmR1VEFub0FG?=
 =?utf-8?B?dVdNK2VuMllLSGxvQU1RQmpGNit6UjIwcGIxbTBGNjljaXgxQUlSYUhITHh2?=
 =?utf-8?B?cWdDamVHTEMwcnVhZjZXY05GaVRKYitsZVJwQW5jT2QyNm9vemV4ZWhQUkZG?=
 =?utf-8?B?aTBYMERIS1BoWjRZcnRHQ3J4bWExc2pnRGZvblJWeE1UU0E4QWF5ZE5QNzNH?=
 =?utf-8?B?SFNxMmZqK0Y4dHNvN1RsSHFOL2xTTmZWeGo5MEQ5NTNESTJub2ZBZkJVVER0?=
 =?utf-8?B?c1FMT25oalNWQW9HdmlaZW45ak5tYXE1L0FoWTIxVnBnSkFBdHFXUmk3RW9W?=
 =?utf-8?B?Qm1xTlRaQ0piUUdwRWNOT1U0ZXVidldsQzdnV3NxeEFJc0QxTnRzYVFYQlNs?=
 =?utf-8?B?M0FzVkFmQTlrVUZQUWhha0wyeWhvTXVteTF4M2puZW5RaDNqTVplOUNTTjZt?=
 =?utf-8?B?NXh6amtjS2dUN0hGbHdJUjZlS3d6TEtSRVRiSnd2MFFFY0s4eFhhS0VpWUZU?=
 =?utf-8?B?NDRhUi9IYkRNTExVbm5lejNwTkoydFRkc3hjN2dXZFdaeDhKNlBETDRQeEgx?=
 =?utf-8?B?aFNIMDljYmlKT3ByWXJUZ1hOQ3d3MFowbGdWUGRCUTBZS1RhYlgyOUlNMFVS?=
 =?utf-8?B?SW4rZkZUVG9nU3FKbzc4RnlEMVJDbkNSa3YydW85bDkzSzZyekVrN3NDdzJ3?=
 =?utf-8?B?RWhoUUdvUm9jdUZzTmJLaVlvMWRORmd0NUZrZjBFUk1lTDVIQXdueGh6NXVv?=
 =?utf-8?B?TjhsaW1CamxCb0Y3Z2hGL1FzelJhUGtKY0VORGNZVUdGRVc4R2tFRjlqU2Zv?=
 =?utf-8?B?eVhSb0lSSEJ0Mzhqd21nanRaY0Ztc01qRjRZR2hMOGtrV3hJZzRvQmQ5TWYy?=
 =?utf-8?B?OXlYT0xNNGx2Mm9kd3AzRmdwS2NSbUdRVEpON1FNREFmNmVIb0Ira2JjZjBu?=
 =?utf-8?B?aktPT1BHTERwZUFxVHp6cHN0YnZqMTBnbEM1djZtN21DUW5oSStYenAyT3FC?=
 =?utf-8?B?N09wa01EK01hWnF5Sis3ZDRqaHFLampPcmpKYUwvYVpRSUhkaCtBZW5GbkQv?=
 =?utf-8?B?SlRKbTJZRTdGU3JaY1RUMmtiU1dYdm9uV3JqYzJvelRKbnR3WHhwWW95RlNi?=
 =?utf-8?B?YlIvYmVBYkRmZzQ2MW82bHdJWFZ5UWZZbFBFcDd1cE5kSFQyZjNXdE5URnd4?=
 =?utf-8?B?Umhwb1BSZllHbHdBQWw2d1l6aHJBWVVmUmxFVjMzQ1FpdkdMQ1J0ZGZhUFJs?=
 =?utf-8?B?dHhpcXhnVWZweUgvZWF6am9GYTNTOUwwVEpoVEFBWWNTbXl6aTdlYUFkMkl2?=
 =?utf-8?B?aW9PclJWY0NPS0RraGkxQjBNUVNiUmIxZHhHemZVQUw1V1M0N1JxWWhZY2Nl?=
 =?utf-8?B?N1k3NGhhdXREM0RQRHhnR3AzTVo4QmVTdVc4U2EzYUtwT3BQOHNHbXJrUDRk?=
 =?utf-8?B?TllFdDhJbGxDdWYrODdSOHUwU0d3VURlaS9zcEtBcm5rblF5eC9hb2hNR3U0?=
 =?utf-8?B?T3N5UXFHa3JRaDluMkxWWG9YMjlMbU1STW1GcmUrVUVwVWg2U0JmZ05oZ2J0?=
 =?utf-8?B?L0pzQllFdjhsMEFvQUVWTVVHYVNyQzRNQ0NRNjJIZnFQMmxvMUgyQlNXelpN?=
 =?utf-8?B?WnY3V2tiZ21vTHBiRm9zaEtjQWJ4eHVTRUtRaDlyOWg1S21PeFdzRzdoY2hN?=
 =?utf-8?B?am9qdnAzK1EwazJPd1ZjRDMxV1o4QWtyZ2ZsajRWcjZiL3pCdk9Nb0hYcVNF?=
 =?utf-8?B?alBicEtJY2d3cG0wZDlkdUZTRzQ5RzlLV2VmTE0xQTNSeE5nNkNVa241c2pq?=
 =?utf-8?Q?GNbNDHTJIvxxqLw8=3D?=
X-Exchange-RoutingPolicyChecked: OwBMRifyd9ej8h1c2AmOy8+TQVA3pfg67YehjdCPVnajIhYlgGC2JVdLEICHPFk9I4CwTbqKzL97epZKIE964WlkVeXDo+lpUgRn+nbDiRv/zufY/UQdIgPNzc1Re4CE6E15G9fKdoV+qw8y7Di4uWPC5nEIZaBmg6ts6cnhwP4wit9SD/jMOIv6DN2ZzxvUd6b9K4LlU2Q/zmJB3seIInDhi1SRJC/PIz8GzEAJjycARsmf+2H3RRX5T5v09KGeDx8vxxXnd9Q7zdGS8Aa0aANdp6mkoLWEiQENX4y8OdWcuKzGwQL/S+OLFoT+Hg9wsnALPQuIsyxOa57GamyHeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dd0e83-3ca4-462f-d13a-08deee126e74
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:13:26.4667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89awO8HhBHAK9gQZkJUg+72h34UekfBes9XcDalMTJ10oePFiyJ4fmyY17aHrMMbLE3cPJwqlFu4Efd+St6j1QPvCsn9BeVj7EiMbt1fPlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
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


On 7/30/2026 8:24, Dixit, Ashutosh wrote:
> On Mon, 27 Jul 2026 23:36:06 -0700, Shekhar Chauhan wrote:
>> xe-perf-recorder only passes 5 of the OA stream open properties to
>> DRM_XE_OBSERVATION_OP_STREAM_OPEN, leaving the rest without an open
>> source consumer. Add few of the remaining ones.
>>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   tools/xe-perf/xe_perf_recorder.c | 105 ++++++++++++++++++++++++++++---
>>   1 file changed, 98 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>> index c69050b43..06d1016a0 100644
>> --- a/tools/xe-perf/xe_perf_recorder.c
>> +++ b/tools/xe-perf/xe_perf_recorder.c
>> @@ -26,6 +26,7 @@
>>   #include <unistd.h>
>>
>>   #include "igt_core.h"
>> +#include "igt_sizes.h"
> Not needed, see below.
>
>>   #include "intel_batchbuffer.h"
>>   #include "intel_chipset.h"
>>   #include "ioctl_wrappers.h"
>> @@ -364,6 +365,16 @@ struct recording_context {
>> 	struct drm_xe_oa_unit *oa_unit;
>> 	struct drm_xe_engine_class_instance *hwe;
>>
>> +	/* Optional OA stream open properties */
>> +	bool oa_disabled;
>> +	bool no_preempt;
>> +	bool exec_queue_id_set;
>> +	uint32_t exec_queue_id;
>> +	bool oa_engine_instance_set;
>> +	uint32_t oa_engine_instance;
>> +	uint64_t oa_buffer_size;
>> +	uint64_t wait_num_reports;
>> +
>> 	uint32_t vm;
>> 	uint32_t exec_queue;
>> 	struct intel_bb *ibb;
>> @@ -477,7 +488,7 @@ perf_open(struct recording_context *ctx)
>>   {
>> 	int stream_fd;
>>
>> -	uint64_t properties[] = {
>> +	uint64_t properties[32] = {
>> 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, ctx->oa_unit->oa_unit_id,
>>
>> 		/* Include OA reports in samples */
>> @@ -488,10 +499,39 @@ perf_open(struct recording_context *ctx)
>> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(ctx->metric_set->perf_oa_format),
>> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, ctx->oa_exponent,
>> 	};
>> -	struct intel_xe_oa_open_prop param = {
>> -		.num_properties = ARRAY_SIZE(properties) / 2,
>> -		.properties_ptr = to_user_pointer(properties),
>> -	};
>> +	struct intel_xe_oa_open_prop param = { 0 };
>> +	uint32_t n = 10; /* 5 mandatory properties (10 u64 slots) set above */
>> +
>> +	/* Optional properties, only passed when given on the command line */
> Let us not do this new business of mandatory and optional properties. Just
> add the two properties we are adding in this patch (see below) to the
> properties array above and populate their default values: 64 MB for
> oa_buffer_size and 1 for wait_num_reports (and override the defaults if
> commond line input is provided), similar to what is done for the previously
> existing properties.
>
>> +	if (ctx->oa_disabled) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_DISABLED;
>> +		properties[n++] = 1;
>> +	}
>> +	if (ctx->exec_queue_id_set) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
>> +		properties[n++] = ctx->exec_queue_id;
>> +	}
>> +	if (ctx->oa_engine_instance_set) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE;
>> +		properties[n++] = ctx->oa_engine_instance;
>> +	}
>> +	if (ctx->no_preempt) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_NO_PREEMPT;
>> +		properties[n++] = 1;
>> +	}
>> +	if (ctx->oa_buffer_size) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE;
>> +		properties[n++] = ctx->oa_buffer_size;
>> +	}
>> +	if (ctx->wait_num_reports) {
>> +		properties[n++] = DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS;
>> +		properties[n++] = ctx->wait_num_reports;
>> +	}
>> +
>> +	igt_assert(n <= ARRAY_SIZE(properties));
>> +
>> +	param.num_properties = n / 2;
>> +	param.properties_ptr = to_user_pointer(properties);
>>
>> 	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
>> 	if (stream_fd < 0) {
>> @@ -924,7 +964,14 @@ usage(const char *name)
>> 		"     --output,             -o <path>   Output file (default = xe_perf.record)\n"
>> 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
>> 		"                                       Values: boot, mono, mono_raw (default = mono)\n"
>> -		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n",
>> +		"     --oa-unit-id          -u <value>  OA unit id for the capture.\n"
>> +		"     --oa-disabled         -D          Open the OA stream in the disabled state\n"
>> +		"                                       (the stream is enabled right after open)\n"
>> +		"     --exec-queue-id       -q <value>  Exec queue id for context scoped capture\n"
>> +		"     --oa-engine-instance  -e <value>  Engine instance for context scoped capture\n"
>> +		"     --no-preempt          -n          Disable preemption (requires --exec-queue-id)\n"
>> +		"     --oa-buffer-size      -b <value>  OA buffer size in bytes (pow2, 128K - 128M)\n"
>> +		"     --wait-num-reports    -w <value>  Min reports before poll()/read() unblocks\n",
>> 		name);
>>   }
>>
>> @@ -1038,6 +1085,12 @@ main(int argc, char *argv[])
>> 		{"command-fifo",	required_argument, 0, 'f'},
>> 		{"cpu-clock",		required_argument, 0, 'k'},
>> 		{"oa-unit-id",		required_argument, 0, 'u'},
>> +		{"oa-disabled",		no_argument,	   0, 'D'},
> There is no point adding this command line option, if we are just going to
> re-enable the stream right after.
>
> Let us remove this command line option. But then always add the
> DRM_XE_OA_PROPERTY_OA_DISABLED internally, and re-enable the stream right
> after opening it.
But then, why do we even have this thing? Having a disabled option but 
not giving it as a command line param, not allowing the user to disable 
the stream, and even just add the DISABLED flag and then re-enable the 
stream again, makes it counter-intuitive.

Or is this because we can't touch the kernel code or if that thing is 
now part of the uAPI and we can't edit it now.?

I'll address rest of the changes as you asked.

-shekhar

>
>> +		{"exec-queue-id",	required_argument, 0, 'q'},
>> +		{"oa-engine-instance",	required_argument, 0, 'e'},
>> +		{"no-preempt",		no_argument,	   0, 'n'},
> I don't think these 3 can be command line options. Because we are not doing
> anything with them in xe_perf_recorder yet.
>
> The issue is: to pass exec-queue-id, the user will have to create an
> exec_queue, and then pass in the exec-queue-id. But even if the caller does
> this (say fork the xe_perf_recorder process), the exec-queue-id is created
> against the drm_fd in the parent process and the xe_perf_recorder will not
> find the exec_queue. So the command line option is useless.
>
> So in this patch I think just drop these 3 command line options. These will
> need to be implemented internally in xe_perf_recorder later and actually
> used (by creating a context specific buffer and issuing a
> MI_REPORT_PERF_COUNT command there and then dumping that report out,
> similar to what we do for mmio_trigger.
>
> So let's drop these 3 args from this patch. I will also confirm this with
> Umesh.
>
>> +		{"oa-buffer-size",	required_argument, 0, 'b'},
>> +		{"wait-num-reports",	required_argument, 0, 'w'},
> These two can be added in this patch.
>
>> 		{0, 0, 0, 0}
>> 	};
>> 	const struct {
>> @@ -1068,7 +1121,7 @@ main(int argc, char *argv[])
>> 		.oa_unit_id = 0,
>> 	};
>>
>> -	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:", long_options, NULL)) != -1) {
>> +	while ((opt = getopt_long(argc, argv, "hc:d:p:m:Co:s:f:k:P:u:Dq:e:nb:w:", long_options, NULL)) != -1) {
>> 		switch (opt) {
>> 		case 'h':
>> 			usage(argv[0]);
>> @@ -1119,6 +1172,26 @@ main(int argc, char *argv[])
>> 		case 'u':
>> 			ctx.oa_unit_id = atoi(optarg);
>> 			break;
>> +		case 'D':
>> +			ctx.oa_disabled = true;
>> +			break;
>> +		case 'q':
>> +			ctx.exec_queue_id = strtoul(optarg, NULL, 0);
>> +			ctx.exec_queue_id_set = true;
>> +			break;
>> +		case 'e':
>> +			ctx.oa_engine_instance = strtoul(optarg, NULL, 0);
>> +			ctx.oa_engine_instance_set = true;
>> +			break;
>> +		case 'n':
>> +			ctx.no_preempt = true;
>> +			break;
>> +		case 'b':
>> +			ctx.oa_buffer_size = strtoull(optarg, NULL, 0);
>> +			break;
>> +		case 'w':
>> +			ctx.wait_num_reports = strtoull(optarg, NULL, 0);
>> +			break;
>> 		default:
>> 			fprintf(stderr, "Internal error: "
>> 				"unexpected getopt value: %d\n", opt);
>> @@ -1127,6 +1200,17 @@ main(int argc, char *argv[])
>> 		}
>> 	}
>>
>> +	if (ctx.no_preempt && !ctx.exec_queue_id_set) {
>> +		fprintf(stderr, "--no-preempt requires --exec-queue-id\n");
>> +		return EXIT_FAILURE;
>> +	}
>> +	if (ctx.oa_buffer_size &&
>> +	    ((ctx.oa_buffer_size & (ctx.oa_buffer_size - 1)) ||
>> +	     ctx.oa_buffer_size < SZ_128K || ctx.oa_buffer_size > SZ_128M)) {
>> +		fprintf(stderr, "--oa-buffer-size must be a power of 2 in [128K, 128M]\n");
>> +		return EXIT_FAILURE;
>> +	}
> No need to do this check here. Kernel will check and fail the OA stream
> open if a weird size is passed in :-)
>
>> +
>> 	if (dev_node_id == -2) {
>> 		print_intel_devices();
>> 		return EXIT_SUCCESS;
>> @@ -1291,6 +1375,13 @@ main(int argc, char *argv[])
>> 		goto fail;
>> 	}
>>
>> +	if (ctx.oa_disabled &&
>> +	    perf_ioctl(ctx.perf_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0) < 0) {
>> +		fprintf(stderr, "Unable to enable xe oa stream: %s\n",
>> +			strerror(errno));
>> +		goto fail;
>> +	}
>> +
>> 	init_mmio_trigger_ctx(&ctx);
>> 	emit_oa_trigger(&ctx, 0xc0ffee01);
>>
>> --
>> 2.53.0
>>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

