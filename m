Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C6C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFD510F32D;
	Tue, 12 Mar 2024 10:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjY8541F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E6810F32D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710240879; x=1741776879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=J2qX3SIEqX4mRbh8tn4XnVJmfrcx+7a3HHmFGsoSFqY=;
 b=jjY8541FsXsTa7VPtmnlpZUl1mQenzjYLwK3m8mrYVCdd9/f4wDVMyJd
 uZgegyyz4sWGTjJUxkmvCs2dqiB8OnQBGCLcW5wc1eFe326fnMeS4VW0u
 /TtCSdr8UXRXusLivnf21ANhwLolZdSq3oK/LxRG1Re31Qswgj436Ta61
 ONMcNSvPvpP2Gdsf1vUB3UTnsGI5CiyPueJdOypRce0WWnMp7HwYeqot3
 IvYUcczaS/N+q2V8PKu56qxpCsqPYfbVsXuGSHim8uwZOHsv/jvvFjDGz
 NiplJScuow9mAeb0O62eJARGjvs1V51G+T3Re1Qz4tSHO6whWQVOAXiJo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5067271"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208,217";a="5067271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208,217";a="11471193"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 03:54:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 03:54:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 03:54:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 03:54:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 03:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8kaazsfzBStW5Twur39xm/Rn3clzIGWmZZvda+X2+XmNxC345jeDHU4LJ1lMWGeh7negzV/r/05J6TzpxKT1YdMHvuZvm8MFFSF+RrgmR3YFJ9EgcxoCEx0lmWC1qT8Q1fMQtKwkL1spdLWj/5doFtfdHMbE1PY1wHV4xqB+qUOiFkgtgujr7vBETUVQM1Ug1PZtH5p9cNpRS402XtLFYv0EK0hVA6fpgAnj+JMfp/bqfW1E805PxVW9OV4YlkPvweMXQ0uJCoh5k8o5smaw4shv1t3RiZ5rYHb4ZFotiSwmcJWP/00UKopaNS2ZO7Lc61ibXJAOyJvg7wA7O5ZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cznv1ykoqeo+jiOwJFN09iz15v8S9lQDIqQ4RFslcE=;
 b=dEPLgMrkXmXiPJMdtCXqGzUr+X8zebD81j0Hv+Zf4AihhutHKRMwTRolu+AVGGzS1qUEQwXFzFZRGJb3Hd3eobM3rk8h9WRorBgt07dfEuVf3asC/XiJkPz7Kud1KHu+uxneb0zlohbUewd//ihDXtnL2gNNVqZtK1nhjd83+MEN9EVFSmyAGclLz5RAKt/9SVAoYiYEzWFLXOlSX7Woj0qckdAUywUsGHM8FUbmIhlxuAIpT7vKoYgM9GT4RZ/QAxZTyCfkFOUKF76IPTIFVgwl6vAhSq/guZjN+QRrp5zEDBqOPBSgMhobGNl0NChX1MogLZCntZwnycw1AHra8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA2PR11MB5178.namprd11.prod.outlook.com (2603:10b6:806:fa::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.17; Tue, 12 Mar 2024 10:54:35 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 10:54:35 +0000
Content-Type: multipart/alternative;
 boundary="------------GgIngWaG5xnYqxo8SdYHzXfg"
Message-ID: <87d94f4c-a484-422a-b443-ade32ca50e8d@intel.com>
Date: Tue, 12 Mar 2024 11:54:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are
 preset
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
References: <20240312100757.14685-1-nirmoy.das@intel.com>
 <85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA2PR11MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f00052-0490-464d-738b-08dc4282ce53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w0iOmUfPKMYAQTWBrVXAyyQjx1GUslvsFEtf9G4uY7SgWBzAbnMTLDuv8lM20Or14cWdGVSRyjZ/DVpI+4/mygCiDjsLKO1a/WQn4i9uRURw1vnfxfoSkY1ZGpZq4/SVj1dAlkq8bq6LRz8Fhd15b8qg5W3TC/m2G2AeBetkE2cvB1VtstOuFX20SRAwTIFTOnGjY6amnU/ZdNlkNWX16UqDeJNGfgvQsbA5Tkx+8i6HnT4kNVfj73v+07osSDenUni5CiPiLCKJi1AouCgK87QBQMkD9HTbIfNHXb8bC3Dbud7Ou2jtY6pYJ91robUS0eJ+MqXC2WptXPxMk1SocQ7z48koS0upC0q4NRUi5jAfDB3UUcCRCVT/jJP5QPt3ebODhXjPp5GDqaE7wPGuBBWYCGDBK4hP1m2Xuq1lLTi0Cq0Qi2j4E5Xa7g3NAtP5L+jHKRU++W7PF5VRRWR9atJHHa2IOvqYLAU2k05teKE2EsUcq4Ptpb0GHdwmvOuQK5iVh0edyi9/UkGNYsv5gb8xGZSbRDTqtBV4RZwetP93PNL9+gNIAqTMZbQ0Bu0jyXoWYAFuLjJhD/gXwB/bkArx1I0dgJawYlt6r1jAasc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnNwd2JwMnpIa0ZCMmU3UzdrcnExZkdFODhnMTRSS3AwME9Jb2JJRm9uakVa?=
 =?utf-8?B?N25QR1JJbm5rMDhFaWVJL3BVQXg3MTRvTnpJSU82UXJQbGljOGo3MDZvTzJ4?=
 =?utf-8?B?MCtVVGdjYTVKd0NobE5aaUpEVUorQ1g0cTVNbCtuZ3pDblVNY3Z1aHhaYTRx?=
 =?utf-8?B?TDd5UWhybTNLeU50VHFDUUZGbG9BUXRoMmpkb3gvazNpMzNZblBUVTBab2ds?=
 =?utf-8?B?d2RWVStsanoyTlNkZmUzWXhoSG5Pd1dScFhWS1QyUVNUU2ZUVUlGMkpJMklK?=
 =?utf-8?B?RjNMZXl3Zys2V3VEdmoweWZpcXVGY1p4QkxHYUF4U1ZKNG9aZkxMczk0ZmxZ?=
 =?utf-8?B?Z0RvVWZFVEM0bFB3cXRmSC9GR21FL1VYczlLWm9UQnRmTWFVd2lTVVl0Ni9t?=
 =?utf-8?B?cWsxcHNrOVFpM2t4R2E5eWNoc0k3L01kVnBmSkJuWkU1RUVzZzQvcUtSQTNY?=
 =?utf-8?B?SERNdFQ5R1kvU0xEd0pCOERDWXVrV1R5N2xQS0wwSFU4TjBiSzUzdWxjZEx3?=
 =?utf-8?B?MXIrR216Z1FOVEp5SzhLb1VHYWljVkpiU2Q0b2hBV3FCVDhtRUJnam9BRERo?=
 =?utf-8?B?VjFYRGpzdWZiYW1vVVJTT1liN0U2MEhhRTM5OE5ZQzV2WnhYVWM5S2JxYk4w?=
 =?utf-8?B?L0VIMzJ4UGlmc1NlUXhhZVVXNFdUNXBQOGdXSzZZODR3azJNcUZQWW5mNHFP?=
 =?utf-8?B?eHM5MzlldDJkSWtGRUpxQ0VGMlVaZ2c2ejNVc0tmakk0cm5hcDcrQUtCUEdn?=
 =?utf-8?B?V3ZCSVhxSEVSM0dUeEE3UG9aT2ZxU01KOHhabmwxOXpNckNNQU1kdzdaTkFT?=
 =?utf-8?B?R3hSUS9ZK0s2TEJsL0UyNVJyUVZ6ckkzUVdlNG5IU04yRGhuSTlwQkJ2eHc2?=
 =?utf-8?B?TUNmVTM0NHV1N0xMY05MU0dOc3VnNkhnSmIvZW5LTWx4aXJrYVpjKzFOT1Fp?=
 =?utf-8?B?UnpLcVpMd1pvQTNUYjk4Yy9IbTA4Ylk5WHV1dTcvSUpMSXBiVWVhT1o4UU5K?=
 =?utf-8?B?bjFLZ1dsWnpVTWpucDRpSUlBUzlrWXA4Y1Y2ZW53UGpaMTJCVXJncE1yYlVj?=
 =?utf-8?B?N2ZuOFg1MFIzUFZXTkpMdTdrMjArdy9kOTVrbXBwY0FFSTg0NTdBWlpoMWFU?=
 =?utf-8?B?OE9WYW53OGtRd3UxTGxvNXQzWVNnQ1RiNFhYMHAwMXFQT2EwNldXaEZndXhJ?=
 =?utf-8?B?Wm9td2RmWDFDbElTcjFVMVc0UHJxTmZQOEZ3WVExMHNtTWdjQVFGcm04bkU3?=
 =?utf-8?B?MnRJbFp2MHZSWkFJbFBiTzVlVWt0Vk00YmpCR2xlU1FkRHU4NVZwVzM3dk9y?=
 =?utf-8?B?RHhmY2dRWHZHalNxTk5VTFJDUEJvdDZKbElrYUZPOVBvMExsY1RpRXNNaFNp?=
 =?utf-8?B?bUJqRVY3YmFKWGJkaUo5aDRLb1lLY09CTk5wY0FERjg4dldkdTNDcVM3L0pv?=
 =?utf-8?B?LzhCektxNStPa2k0OTFJR0FRVzlPSTIxWVRVdlJyR3I2cHBOQzAwSUVLNWU5?=
 =?utf-8?B?bnhBdy9hVXdLOGc4WGkyQ0x1TTRmejZUTXArbG9nZkZUYzhPSko0S2Rpb2FY?=
 =?utf-8?B?RU1VQWNQNnpWTlE3OWw0TUtzZUw4bEp0YVJaek02c1I2SUVOOWpNa1d0NHhY?=
 =?utf-8?B?ZlJCTDdjUERGNllMQzZYRDVCWTZQVkJJdmFEQVhNTW9HRUNHNWZ1ZmpvYU12?=
 =?utf-8?B?L052UWIweW10RTRJR1FObnJvTVhpdFM1N0dwSHE4NnNlVUJHOWV2blozRnRL?=
 =?utf-8?B?UEcyUEZRb1NsRGRaa3R4eHpITlB4a0wvK29uWlpnbUtQdVBaaHVjZW5nMkZh?=
 =?utf-8?B?UzJudWQwY084K3dWS1ZBY3ErWjVwdFZSOFkrWmo2N2Uzc3JldG8yQWxCd2RN?=
 =?utf-8?B?b1k1V3o2V1NiSHRVTkNQMGZyTGNTOHY0K1dSMWlCR2xUekR3ZGZyajZQNnh6?=
 =?utf-8?B?a3lLVkFpWDZ2R0xHR0dUR0VzOVpYUnRUZVJidUhRdlNXazE0K040dTJqcC9G?=
 =?utf-8?B?TFVOd1p6Z3R4NXc0dDZTMHlTbFl1Y2gvTjByc0Ruc1FSeDZmMjVLNjRoVWsy?=
 =?utf-8?B?eVkzVjRpTTNOazE5Rjk1M3dqcTNYYitSeWRhdFNjMkN5UXBGYWdjR0VnVi9t?=
 =?utf-8?Q?Qr6pptPc5jZ1bHek0UD4Z489J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f00052-0490-464d-738b-08dc4282ce53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 10:54:35.7034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjzvLZuif0DLCXoKbpWF3V55OXToNtftTcOmN2fr6wjKutfdSt0j90gZbpt/U/uQfTcP9dy8kKIDWNtITEbwRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5178
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

--------------GgIngWaG5xnYqxo8SdYHzXfg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/12/2024 11:43 AM, Janusz Krzysztofik wrote:
> Hi Nirmoy,
>
> On Tuesday, 12 March 2024 11:07:57 CET Nirmoy Das wrote:
>> Skip the test if no drm devices are preset.
> Did you mean present? (also in the subject line)
Right, another typo
>
>> v2: fix a typo.
>>
>> Closes:https://gitlab.freedesktop.org/drm/intel/-/issues/10087
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   tests/device_reset.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/device_reset.c b/tests/device_reset.c
>> index 817cbc285..73531d696 100644
>> --- a/tests/device_reset.c
>> +++ b/tests/device_reset.c
>> @@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
>>   	 * a device file descriptor open for exit handler use.
>>   	 */
>>   	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
>> -	igt_assert_fd(dev->fds.dev);
>> +	igt_require(dev->fds.dev != -1);
> What if __drm_open_driver() returns (unlikely) a negative value other than -1?

__drm_open_driverdoc says: "An open DRM fd or -1 on error" so that won't happen.

>   
> In IGT we used to verify validity of a file descriptor by checking if its
> value is not negative, i.e., >= 0 (see e.g. lib/igt_core:igt_assert_fd(),
> lib/drmtest.c:drm_open_driver()).  Please follow the same convention.

I can do s/igt_assert_fd/igt_require_fd

Thanks,

Nirmoy

> Thanks,
> Janusz
>
>>   	if (is_i915_device(dev->fds.dev))
>>   		igt_require_gem(dev->fds.dev);
>>   
>>
>
>
>
--------------GgIngWaG5xnYqxo8SdYHzXfg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/12/2024 11:43 AM, Janusz
      Krzysztofik wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Nirmoy,

On Tuesday, 12 March 2024 11:07:57 CET Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Skip the test if no drm devices are preset.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you mean present? (also in the subject line)</pre>
    </blockquote>
    Right, another typo<br>
    <blockquote type="cite" cite="mid:85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
v2: fix a typo.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/10087">https://gitlab.freedesktop.org/drm/intel/-/issues/10087</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 817cbc285..73531d696 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
 	 * a device file descriptor open for exit handler use.
 	 */
 	dev-&gt;fds.dev = __drm_open_driver(DRIVER_ANY);
-	igt_assert_fd(dev-&gt;fds.dev);
+	igt_require(dev-&gt;fds.dev != -1);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What if __drm_open_driver() returns (unlikely) a negative value other than -1? </pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">__drm_open_driver <span style="white-space: normal">doc says: &quot;An open DRM fd or -1 on error&quot; so that won't happen. </span>
</pre>
    <blockquote type="cite" cite="mid:85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap=""> 
In IGT we used to verify validity of a file descriptor by checking if its 
value is not negative, i.e., &gt;= 0 (see e.g. lib/igt_core:igt_assert_fd(), 
lib/drmtest.c:drm_open_driver()).  Please follow the same convention.
</pre>
    </blockquote>
    <p>I can do s/<span style="white-space: pre-wrap">igt_assert_fd/igt_require_fd </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite" cite="mid:85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
Thanks,
Janusz

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	if (is_i915_device(dev-&gt;fds.dev))
 		igt_require_gem(dev-&gt;fds.dev);
 

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">



</pre>
    </blockquote>
  </body>
</html>

--------------GgIngWaG5xnYqxo8SdYHzXfg--
