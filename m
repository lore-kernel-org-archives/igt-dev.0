Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15298107761B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 21:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781F10E43A;
	Wed, 18 Mar 2026 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DW38QRja";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05EC10E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 21:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoSZ7KFcobnUy3SmGjptJ3YfoiQzw6wZ5CWW6YFIdD+n53e7TM1iTLFHZ5GdBTiU5faoUa7tZon/Itn88UF8sivGzRgSvG0Z9QU96cORI1rs2a405aqhxU62X5OiOYMK2FZmHg243regAo8ql0vy/tjmS/xZkQ6PxVWRRG2Rt7lava0QVXvwQmVmEg2defXjP8ni4oCyipofFWBJNRbZG/aESjpK6x/DKlL+uuL8Q7NlMysOf22K9PEJfIEhF4z8himowUpgiyFQqYw19eFknPkVom2JDZYfgBJEJiwF1EtqRo83OIdts5lem6Ns72io9zUgQbk4mLMW43DYqMmb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDPlK7pS4rejsB/HB8T7ujYDqG2589UzElZbAgmJu9E=;
 b=UxBqu/JPHDYySHezHJ7dmgmU3QlCW1kgfxseQd0hFWy72LWiii27yn1cVkvU7nWR4nts8L3ytvdZMs58VqmfeniwuHYiahk8NsM9UPisj0SivYYWrxwoBxT+cI6KX02qRAA4xVXLL3Njo/HBvBp1xw1NXqhth//pG47q/qIqo0n7erGRwI6lAeOCDz+QjBbbZQ7nQf+exMaPF1c3LWLSRVnr3c8mqR4YMetUDIHRhSRJHIkSmB2oPybjJCChOaIPGrBRko1vs1AyqSMwyOfRspc6eJXbMDLCbe3lzgDuU14tYnai69XXhVWD+SurbpG7oNoUJdeq/YblVYbiGnHaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDPlK7pS4rejsB/HB8T7ujYDqG2589UzElZbAgmJu9E=;
 b=DW38QRjaLI26SXRv59RGu8qHNZzQg1Ooeidun06pZZMWXO8S8ntf+iNh/kebAI0lnz8GAv/JCFIJ89yP727S0D4TAJjtNx3QaRoeD67rLNiSI06CuFRXF0ehKfOjM4JRKRoewBgTwGmSu1kf8/Q8AY2y0H3Oqu7fQ2nQZzaodmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:00:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 21:00:32 +0000
Message-ID: <eeac17b5-242b-47db-a1ae-df641f6f644c@amd.com>
Date: Wed, 18 Mar 2026 15:00:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 01/12] tests/amdgpu/amd_mode_switch: Prepare for
 returning NULL from igt_crtc_for_pipe()
To: Harry Wentland <harry.wentland@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
 <9fb29dd8fcfa356cfe1a40e63977870779f277bd.1773659680.git.jani.nikula@intel.com>
 <20260318180108.vnqsmithuivxe3lw@kamilkon-DESK.igk.intel.com>
 <475c8dc6-30b0-4013-93a8-6dcaf49cc163@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <475c8dc6-30b0-4013-93a8-6dcaf49cc163@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:303:87::25) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV8PR12MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: c271094f-e4de-4dd5-ba49-08de8531646e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: bUgNLi+eFlXJRmWex4SbT7EDUwAIJUetN76PCYmuKwNCyp5bh1w8CAVqr33dM0uBgFphntVRTxVU2c9o5C1pvpeSSrbmVw1JfHmnXPxF4Bbv4v0kcbOdIDULlrphMuSe++3T0Of4i9pBRmPp06/odK2T4I5f08m7sOa1KqFQNfp+tavDsdswQU1xhAuKg/OMfUhGFiSsfG0EoEdvg/MRq40bqD3HU6Haig+2r5uKC7P9brjOTVyYhJ+1g7gen0A+BVcyOdc6Y4e2XJt/Qsrgm6TgbQZ8kahDfCZ6fRvHzFd0wo8YWJye22LwBD9S/P5/8IE8XN3LNJdfuaNCdlNh69kIzxIEXPGcJiuqSOFFz9Ywa9j62MeXYe428ACsazRgZ1i2c49aM9zVrrrFWG1BaPczgHBnFvk3mdFS+TOEnwqWo4h18qsgi2g+rbE97I2qQPNXiPO1xpKa/R/zui6gmF5oXg6Mmk8fflHISmFcLf2l8VJe/jkZ6rYJ6PqtUSQwzhWRAl6FOjWI5tYcsnScMXrzbJPomQRcM4y5pu8xY7jCDml46NuEExz1FYwzwppXZAXCfyrdYqkX2bGAz9KCk8bU5DcXuFD0RRxkUmeLm5VYe62fOP1WMoLSG9EiFi4eLkKzfT+IUICQzuT2brZoQca3RoWG882dPDDcVdSo6SD66DzVb/zcC4V8vmyFSfDWXimRiSWw1AyA2PoutGOjlElqx8qFUPaKINnqrznWwkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXkzRit1TFpMWVRBMFYxS3ltSXVBSFZKTmFTQjN2YVZnMDBVYVZvRFlIaGVQ?=
 =?utf-8?B?bzNIdk10eC8ra0dBVVZTMVFoYWd1OVdpSGJhck1zU2hSZkVCeGlIRlp1dy8r?=
 =?utf-8?B?UXQzcWlqYkJyazJoaFY4OUVUek1YQ3BwdG4rOEF0S3VHczZaTVpWS0hkMVI4?=
 =?utf-8?B?a0ljUGRMTDhXL3VTUjArOWY1STZ1ZHRZSmxsTjlBL2JVakdCelVMTVo2dVho?=
 =?utf-8?B?VTdaclJZakthOUg3TGFaeGNnV2paL2l6OExualFJWXRxUE5Eb0NibksvbS8v?=
 =?utf-8?B?RnZWUHpmMXVBenRDbWZnM3lJUWE3a2dKelRzSytWVWVrazRPVURDN3ZYbkZY?=
 =?utf-8?B?SFVZeWoyUGw4VGxZYU5tYXdabzRPbG0xL25QQ1J5bk03UUhpekN2RXpJM1FD?=
 =?utf-8?B?b3B5b0l4eVpMQktJdjFVUGFEWGVQdjdLbkRrVllHUzhRS2FpREFvR1ZYUXRa?=
 =?utf-8?B?Z3R5VmIzenZNUkJxQUpxZktiUjltK2J4M0FLamNOZTU3ZUJxVExKTGcvVkF5?=
 =?utf-8?B?a1JNYWZQWUMzVTlsNnVQUHRlUUV1OHJoeWVWSE1aWnFxNW5nNmgyeUhEYlVo?=
 =?utf-8?B?Vkl0ekVvUEZRUExUNFFCdHZ5QkRNYlRYeEwxYWtYOXo5NTMwV0ZwL3IwQ0RI?=
 =?utf-8?B?YlhBT0hGaUhndm02d1ZBc2VJS2xxNXJtclM2SWo4UTlJamVNL1FMa1NjUTlt?=
 =?utf-8?B?M0c1ZDBLT3NESkh3ck1waHRGQ2hZejhsMTVmMzZJVHRtMXZMQTFPTWxSMXhz?=
 =?utf-8?B?VnErV3FOMkRxRCtlN0FEc2FRM0JxcU5LdnZua01BbFZ5RTI4dENXdTFxK0l0?=
 =?utf-8?B?MVowNGlHZWJFOVVpemt4WmMrYmlOWnRRbDR6TzlEaVZKWGczSEJYM1BVSk01?=
 =?utf-8?B?ZWcrNW1LVE9FbU4zemdkZUpqcDFxN2l5bTBJVUJqcnIwTnd6emVxV3dNTGdC?=
 =?utf-8?B?OEowUzVLdFBRQXJzRlBEOTN6eDh2ODVFMU4yL2g5VEU0ckhBZHhTcWRBK3d6?=
 =?utf-8?B?eHNSZGkyT3pja3laMUNiODY0anJ4SHlCWjJvRU1zZUdSUmI4cmRxN2lpZGFs?=
 =?utf-8?B?Tnd6ZFBZZzNNMVlURWVHZGlFNEdxaEpQVlpRVkdvaDkyTzhITzJtcWVKbVhh?=
 =?utf-8?B?amdmT2JiOVJyUU5LRllnY0xIYlFCNGRXNXlsc25sc0dHZlV1cFpUdWk2Y0JL?=
 =?utf-8?B?UFRteWREV1dDMVJwVzU1UVQwMFhwR3h2WHArcU1vUDJQL1lhdlVBWmZtdEY0?=
 =?utf-8?B?WEFIcGd4b3pYSUhHSVdjUmVUcEt3SCtPTTlMdE1ldDRRVUlxSzZGWjZKUWk0?=
 =?utf-8?B?anNlUVlrTmdiRVNWdEN6VWZTdmQzSHMwc2VXbWtQaExla2s3L2hPT01MTjZF?=
 =?utf-8?B?MjB3cVgrbEhyamtiWjUxVUFnYVdSVDhtUzliTno0bTVIdTR0UVV4SjZQb0l6?=
 =?utf-8?B?OFZpYTFPN0dlYUllWXQrSFl0cXNjejNLS21hOW1XSFdhamZHcXIydytUYnZa?=
 =?utf-8?B?ZmZPdTFiUTBIL2ZXeGRzb3RqbVhyeXZrbXpjTEthYzVWcUYrN0RLR3hmRU4y?=
 =?utf-8?B?L0kxY1REOVorM2FHa2JlOXpidmZBR1QzY2wxQjcwZzNZendzemp6WnhoRXlp?=
 =?utf-8?B?SEZmaHV6QWduNzF4SGw3Vi9hdGMvRExUNk5TYWk5cHRMWGwveU5aRndXdXk4?=
 =?utf-8?B?UGkvS0xqWUxtTU5EcHZGV2ozakNpNXdjVGJZZ1ZTbm9tSCtCZElSamYvVHkx?=
 =?utf-8?B?Wnl6REd4TjJBOVE3YVNXUmh4Y3FkSGszSmtzR1NlT0NLTEI3c0lpYXdENkdO?=
 =?utf-8?B?WG9aYjFMWTk0VmNURm9PQk94S2xCeWhQK3V2b01MZmxsajQxUVlKdjhMNjRU?=
 =?utf-8?B?MWZ3ZGFKNGthS1JES1YvMkpMMkwrQ21mNXUvWVdaMWxRQ3VNRitUaTByWVlv?=
 =?utf-8?B?TXhJN1dVc3ZLRXdyYWhteWRZS1E3aVlIMS9yYmljSDFuMEt5L3RPeEYzV0Jx?=
 =?utf-8?B?blYzZ0pNVWdyVWdaaGhRWHFyZk9EZGxNd0hyUmd2UDAySEJFaXF5Y3EyczFq?=
 =?utf-8?B?UnBDc004UXl3NXBHL2k5SWx5YjUvUDZBdk53eExKY1doSGNVUEowczdSY1Rh?=
 =?utf-8?B?dHBpSHN0TTk4N0hmcWFCZ01NNTRiaEd6UmwxVmNJYjcrcG4zQXhhYUF5eXg3?=
 =?utf-8?B?WVgzRTFOdVRVd3Z2ZDlsVW9ZNW5XYnJJM3UzN0JrQVZWd0xOcGFuL1JOekN4?=
 =?utf-8?B?UTFQVkwrY1ZUL3RPOUxFME5IRUk5cEZ1YXRRVHNpK0ZXQi96dGUyVkNGT0tI?=
 =?utf-8?B?WWRDZTNDTDZRblcxeFBVN2IramhnSUJkak5uNVFMWkNJNkZ0UDZiZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c271094f-e4de-4dd5-ba49-08de8531646e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:00:31.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E37lYa8m0rHz1fkpxYAeLN9lZnyJvVrSTOqBXFiqKYAQgZmI2Sa6uTBwLHe+YEbEr7NKXAkSUYBYmI2+mLof0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109
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



On 3/18/26 14:01, Harry Wentland wrote:
> 
> 
> On 2026-03-18 14:01, Kamil Konieczny wrote:
>> Hi Jani,
>> On 2026-03-16 at 13:19:03 +0200, Jani Nikula wrote:
>>> After checking there are enough pipes, AMD should always have the
>>> CRTCs. Assert that the CRTC is valid.
>>>
>>> This prepares for returning NULL for invalid pipes from
>>> igt_crtc_for_pipe() by ensuring the test logic is sound.
>>>
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> +cc AMD devs
>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>>> ---
>>>   tests/amdgpu/amd_mode_switch.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
>>> index 4da07c412996..ffa2952bb5c2 100644
>>> --- a/tests/amdgpu/amd_mode_switch.c
>>> +++ b/tests/amdgpu/amd_mode_switch.c
>>> @@ -98,6 +98,8 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>>>   	for (j = 0; j < num_pipes; j++) {
>>>   		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
>>>   
>>> +		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
>>> +
> 
> Not sure I follow how this prepares for returning NULL
> from igt_crtc_for_pipe(). Wouldn't this do the opposite
> and hit a NULL pointer with crtc->valid if the function
> returns NULL?
> 
> Harry
> 


This patch may be no longer applicable because the for-loop is replaced 
by for_each_crtc(...) which already checks crtc->valid.

However, Harry's comment is still applicable to patch 2

>>>   		output = data->output[j];
>>>   		if (!igt_output_is_connected(output))
>>>   			continue;
>>> -- 
>>> 2.47.3
>>>
> 

