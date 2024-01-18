Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7738EC47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457C10E701;
	Thu, 18 Jan 2024 09:18:21 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 09:18:19 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160E10E701
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705569499; x=1737105499;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SfjORbOTFcvMrh1dK+D2Xz3eD42xCqnpg8jeeuAtqaw=;
 b=D9RwBDNhiNp48+VeU9PDo4a4EhOj+0yNWcO0ASdkeaEQNKAgGKWs9cfi
 VFk/2xfcQmiF2vQaeZ9Pe9ZADB80yTQC57T26vy23QTXusTafPN0lTBg5
 zow3rS4eRwrIo8jVYRoe8g7/qSrnlmqXS/0N00ZMn3tEE6HnPmsrGKGOI
 HWNh8WNagnSUCzphy58VNstVO8JNtkYbK9cXFD31M4sJ6BlXp43xruA/r
 TmKou42DSBMyl7vMlFfp+SySL9oXSb+0TulaE6GL+qpbXIqpfd1/RPKDz
 Ir87O1qqaaxYiNcM11t1R6STZX9WoQChRFm7weogr7uhFfLZhrZzLxPgR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="285196"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="285196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:11:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="265500"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 01:11:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 01:11:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 01:11:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 01:10:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpwmZuiQ/Un5kaG9pSrH6kUjQvXZG8SiQ9CGZfDS+uQJcIkQBooFQt9/kCcXvCe5UBa2m58iEWet95XCuHvEkfzbz2n/TjiulucJxU3E4ldaPUZQeusETfITYg5jkW/fYULFW4Lgwh7X2YKrKovqfKI0L3/UbelwRhC+kFzSxYlK86Ae6EU6ezxu60JHBaVhGEScxJoBe9DlVRO6WvrnO1mi7uyEeWTIPHl/MaIm4EfKG2bwvZlIYk3cipGoqth1c5SG27UGZ8uv8LZVa/0mj88pA6/KAqjA7FI+0QNzaFXNrTssw6CB8f0qcjUEqM3eTk9jnyG79p/cVMU0oW46yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZlU8449hqBSomqGXuPnjepOV1fLpfu1CUmXyxKzP9A=;
 b=NXmQeYQAuzxlSj2IcIDjb9sP6yD9t8Bzc1/81uLz5K0A6z3ZBwRtRgz84qneD126IITHGUCb8UIauiNbktY6tlz4DEiw09NOnc1xjhQxbP8Al0R/GFChAAmgwGyRNbxWjqMbhHzWjSd5utXCYIS2HPo/rymj/lcgijP8JjqcAbgp2ZZ6mxrI6kynl9YgYqMvMxJ3bmKsroHJ7edBAPr1OXeTSSMV9JULoAuSn7iL1SYHKuaCshtmuIEb6lzGNEbM2VhLBMuWc0BzkypPeSHnzk2yRs4W2Iyg1MJGwLZ/JSWGyvKf4TTX+pKZ5IFw2PhnU5YAj7ghFlu+IubKZUTdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 18 Jan
 2024 09:10:44 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 09:10:44 +0000
Message-ID: <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
Date: Thu, 18 Jan 2024 14:40:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
 <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
 <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::19) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|IA1PR11MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d7b09e-1e1c-47a0-51a8-08dc1805599f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDBDq8otxIWAAExx72CCaZBnepg92jJwSG25SyVkf9TPC2UN46BD5rbhzMFiAlsxjFygyW6tG2lbXOeX0fwFvXvLSLCh845kTSgO4+GxTFhSTLVFRJSeHkg9CRMkPp9gN15vO1tzJ8qQm6c8nyVDyzVoulbuIJZ72AUP7AeVWzoeKQF9p1hQwRKltlhfbVdlXc8gYl70SOondAypzW52BQ16uFsRA6UmGwzxjsUT9QVO+xaC7AFqLaFAOrNhRldJxRuV9QfgKK7zioTnqT4/+ltee/b48lM/9wV52ZWYsqKogbm11fLvHDAf3rqIlw9fguq174OIkCRedqdBTl1Ur1zU+gx4tXPZaBItxTmWJIRX0nNkKM0/Dz5GF3muUXu8VV9dBO3VJY7kMMeNpYDXMr/67udt6BCInLoXCbDI8Otnykmt6tH1e68WaZtbJLWkrO62ZfTzyRiFI4zfnOHyxN4fn4Amq7lHgeto/6FSzXGbnyNkZQqoOW9kuGrwqx2dLMHqIDhC7VXLYL3KX1/fEwSqWrG2r7YleLNU4Lnf112eFQqX3RZ1o8lCwRcg6MqvevfGe8YVJhsvJCuqZpkVVE68sJ/YnMHAtstT+EcQnHbJySwu3moqKU4uTScQ7ic0pGEhM9lmANjpCuZCWbEyRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(66476007)(66556008)(66946007)(110136005)(316002)(6512007)(53546011)(31696002)(2616005)(5660300002)(26005)(8936002)(8676002)(82960400001)(86362001)(36756003)(38100700002)(6506007)(31686004)(6486002)(6666004)(41300700001)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NaVTBYY21KcFk3YnVKWFBNWGZJUG56TzVaZFc2Mjl4MVFNMW12c2E4c014?=
 =?utf-8?B?NHlEbGFnaDBESjdxNlc3dkVERW9pSHdOaURKSkMyRGlNTm41dlgzMnJ6eEtl?=
 =?utf-8?B?ZDFDK3VEV2tqeWUxeXNzMkdVQ0RpNmM3RnJmREpCbVJPMHVEejVtSDdKZTVv?=
 =?utf-8?B?aC9NV1dtOEsvQXBpQVJIM3lvNU1jUXlMQ2dHTm92bzZsRHFFYmFDYWVLamQv?=
 =?utf-8?B?bnpON2dFQ2RLLzJwaWRwTS9aeDZIZm9tTVF1ZEN0ZDdQTVBjZXZrVm9QV25r?=
 =?utf-8?B?S3oyUW56MWRFeXUyWTdzWmFVc1Y1YTRWMFhuZC9vT3pnWDJMMVJlRzNWVllW?=
 =?utf-8?B?OWdRbDlOZFlQY2RQd2RSYVk2ckY1cU9QMGp6VUZkamM3OEErQW9mRTBheEsy?=
 =?utf-8?B?MmtpWldJNDl5eDlObEpnT2J0WUFOcmk1YXluYndWRnZ5T1hJdklwd0FEQ0U0?=
 =?utf-8?B?MHJLdDNYYVVwNUo3M1VpNUl5Z1F5b3krYXB1OUY3VHNlMWdEKzhwTEw1enhQ?=
 =?utf-8?B?YWdHcnZXL0l2WTdFQmxmNnZ5bVF3NktvYi9kQjZMMVZrVU01NCtYdHdIMTZZ?=
 =?utf-8?B?WjNWT3NybUFjRy9FYTlSZzZxZit0eWs4bWFrS0t2bFMvV1Voai8vYTlNVDcw?=
 =?utf-8?B?bUg2U3g0dnZlVVBTcTZ1SzFNdnBzLzZMR2wza1JWSStnK0pKd0l3a01tczNE?=
 =?utf-8?B?VHlIa1ZjeTR6U1NTczdOakwyaGtKUjRkaytrQ1JVSDcrTkt2UWdTUmJndXNT?=
 =?utf-8?B?R0l0TjNiSzNEYTJBOW1ESVRWZnRyeE5QZlp3Z05LeWIwbnJsTGRhNXJ2YWlW?=
 =?utf-8?B?N29UbmhiQkRPY0lSWUJWRExsMGpHd2xGWDUycWh4Y0FJZm1FS00yN09NT1VN?=
 =?utf-8?B?SVA2QkRnd2lseEIxMUZ2c2hkQXRiYUpDZFU3R1k3RU1BYTUzQVFWRnI1SCtp?=
 =?utf-8?B?VHhqdkN4TzdXYTBpMGxtdVBnYVJGQ0xacU8zeGxrcndSQllkNjc3a3VkUHJB?=
 =?utf-8?B?NmliS2pBZUVLa2RHdjlSenIwZjFXTjNrZHJnb3ozcm8xSE9mSzZWQ1hHUGNm?=
 =?utf-8?B?STJrd3FzVGZzM1IxQVYxTmlVY3hWQTVYZjFidWFCUmF4bWFxM1dhMlJJRW5z?=
 =?utf-8?B?Y1pxMDZhamlrREZRNkpPbWtMTVhUZnZJK1YyQndFcVJHc1VxY0dVOGl5TzIy?=
 =?utf-8?B?aW9mMUxkajZlTWFBb2lybnRrYklJT0JkODZxTzZ6aytnTWc5RFdJaVFtbWZI?=
 =?utf-8?B?WmxoejRDaEdGV3dWZnVnaVlaby9OenVJa3plVVQrYmpZOE0vVC9Yd3haRllq?=
 =?utf-8?B?S1VydHR6WGw2V1V3T0NWYW9LRFBqaC95RE5TTUF0TUJ6aGordGVTcW4rQmZ5?=
 =?utf-8?B?eWlQREVTZC9OYytZVm4vaC9vRUYzOUNBNlRyVVVmeDNOUHZUclFXa3NYYUxh?=
 =?utf-8?B?UUJWRXJwZFRheVRzUDdyUmhtUU1EQUJQTlFqckFLSDduRzlQanl0aVovNmFE?=
 =?utf-8?B?aFFyTEl2SFpzSzVwNGJ5WWhjRHNka1hUQUVsQWRlMG5QaFZtU0h0UE81a0Zp?=
 =?utf-8?B?M3VtSTZZRG1NZmVUbXZUWkVEcmdDR0NhMzhhZ2NOMlBlS3hzNVEyZlV1am02?=
 =?utf-8?B?WElzU3dxY0sxSzdWOWdVSGtCUXpLMC8zcDZ0TUpTRDJIMWVLclZKZEEzV2pX?=
 =?utf-8?B?Zjd2Wm42bjhjeHRWYkczeHltS0xFOTQwUDhRbDBJUStIS1RXOERyTE1wK0dx?=
 =?utf-8?B?MGlTWU9GL2xwR3dxbTQ5NEdLbzdaMDZ1VjljbkNCNzk5Wkw0alhQbGZrcnA4?=
 =?utf-8?B?SGJpRFpqODg4ZXRIWDBIRlZqeG5zU2svNEtrdTZ5QWh5L0hXTzhaVXp3Wlp3?=
 =?utf-8?B?SEJoUjYzUU1BTTBENE9mZmdzNnJlbjMwQ01wYVZNUDd6SURFeVN5bFErejlr?=
 =?utf-8?B?ZDFnTHdqaTkwUGdwamJzV3U1WkNScyswMU5wS0VDVXY2OHVtRTRvVG5tZitQ?=
 =?utf-8?B?OTZSNS90UDUwMnJ3cU9QakdsMHZrcngvMWNnemtEMDRVcS9VQUlUdXBOUWFt?=
 =?utf-8?B?aUYvS0E5eFFFb1VLc0FWSDdkQ2lVMFZZUVRacHlVZ2lZUUN0dTc1OTRDZHBp?=
 =?utf-8?B?eVJQeHc2eTJiWnhYQ3BHQlJlOWpRUG9IK24rSW1xUmpmVFVQWnBOaG1SWlV6?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d7b09e-1e1c-47a0-51a8-08dc1805599f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 09:10:44.0777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JztkH3ykRt3EEqIuMG7cm0dmqHykMSO/KLISK5D4xfAzR/gkarGjjR7KX8weO8md9AgoMlEXhdJjr9C8tBP/2C+NRa1mB71pVLwwIT0VXq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
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


On 17-01-2024 02:44 pm, Joshi, Kunal1 wrote:
> Hello Swati and Bhanu,
> 
> On 1/17/2024 2:25 PM, Sharma, Swati2 wrote:
>> Hi Kunal,
>>
>> On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
>>> Hello Swati,
>>>
>>> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>>>> Hi Kunal,
>>>>
>>>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>>>> Hello Swati,
>>>>>
>>>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>>>> Hi Kunal,
>>>>>>
>>>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>>>> add support to choose big joiner mode with environment
>>>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>>>> found.
>>>>>>>
>>>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>>>
>>>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>>>> ---
>>>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>>>> --- a/lib/igt_kms.c
>>>>>>> +++ b/lib/igt_kms.c
>>>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>> drmModeConnector *connector,
>>>>>>>                       drmModeModeInfo *mode)
>>>>>>>   {
>>>>>>> +    bool found;
>>>>>>>       char *env;
>>>>>>> -    int i;
>>>>>>> +    int i, max_dotclock;
>>>>>>>         if (!connector->count_modes) {
>>>>>>>           igt_warn("no modes for connector %d\n",
>>>>>>> @@ -1781,21 +1782,34 @@ bool 
>>>>>>> kmstest_get_connector_default_mode(int drm_fd, drmModeConnector 
>>>>>>> *connector,
>>>>>>>       }
>>>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>>>       if (env) {
>>>>>>>           /*
>>>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or joiner) 
>>>>>>> are allowed.
>>>>>>>            *
>>>>>>>            * 0/lowest: Choose connector mode with lowest possible 
>>>>>>> resolution.
>>>>>>>            * 1/highest: Choose connector mode with highest 
>>>>>>> possible resolution.
>>>>>>> +         * 2/joiner: Choose connector mode with bigjoiner 
>>>>>>> support or with
>>>>>>> +                 highest clock if can't support  big joiner
>>>>>>
>>>>>> Shouldn't this be only joiner mode?
>>>>>>
>>>>>>
>>>>> You mean can be named as joiner mode because same can be used for 
>>>>> big joiner / ultra joiner?
>>>>
>>>> I guess this should be bigjoiner mode only. For ultra there might be 
>>>> other restrictions which we need to look at.
>>>>
>>>>> or
>>>>> We are returning the highest clock mode if no big joiner mode found?
>>>>
>>>> Yes, this is my query here. Why are we returning highest clock mode 
>>>> if no big joiner mode found?
>>>>
>>> We can return either with highest clock or highest resolution or 
>>> default mode,
>>> Since we have the other two already covered used highest clock.
>>
>> But why we need to return something if bigjoiner mode not found?
>> If its not found, then we won't get to know only bigjoiner mode not 
>> found and we are falling back to default mode.
>> @bhanu what you suggest here?
>>
> Consider a setup with two display's with one having mode with big joiner 
> support and other doesn't have any mode
> for enabling big joiner.
> 
> In such case we expect the tests to run.
> We can discuss on what mode to use on the display (highest_clock, 
> highest_res, default) which doesn't support big joiner, but we need to 
> have a mode there is
> what i understand.

IMHO, We should fall back to default mode if there is no bigjoiner 
supported mode available.

As per my understanding, Pick the mode that exercises the max bandwidth 
if there is no bigjoiner mode available is the expectation from Kunal.

- Bhanu

>>>>>>>            */
>>>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
>>>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>>>> +                             max_dotclock) ||
>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>> +                             sort_drm_modes_by_res_dsc, mode,
>>>>>>> +                             max_dotclock) ||
>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>> +                             sort_drm_modes_by_clk_dsc, mode,
>>>>>>> +                             max_dotclock);
>>>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>> sort_drm_modes_by_res_dsc);
>>>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>> sort_drm_modes_by_res_asc);
>>>>>>>           else
>>>>>>>               goto default_mode;
>>>>>>> -
>>>>>>> -        *mode = connector->modes[0];
>>>>>>> +        if (!found)
>>>>>>> +            *mode = connector->modes[0];
>>>>>>>           return true;
>>>>>>>       }
> Thanks and Regards
> Kunal Joshi
