Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A48DCD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34C010E50F;
	Wed,  6 May 2026 08:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgHzqd8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E3B10E50F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778056884; x=1809592884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=20YQf9dPcAJRF24ueYSZLQ3BHr+SMu5eHsb7IT+l0kw=;
 b=KgHzqd8RpfdF8967sXwRUdMhdvGx8APjQ414yQBpbKvaGbNzeXEf0Z3o
 GRbvTv4Xqyp6SCH4Gl6z2j247HAZ+TzuVTLuALs6KXdepdhOyXTW2slKf
 uIzaEQ8o9RRQtZpIGGHalZhLLIBPHK+50kWTIpYZFC62I1kJlqqH/lJG9
 PEB5XDhGx+EEq2U+30rk1P20/EduAeZ4s3RGGNg+toTdpz3ql6QUfwDID
 UmkIZBYQf3KLsvcfWUc30+3Bv3+nXDbCBXYlkM0N2iEu7elh9sgEpHHC9
 bDxDO7ZtpF4h0FN5DF1mycL8fj2PWxV5pw2Wssfc6qv2hF/IPyYzvykIx w==;
X-CSE-ConnectionGUID: Jc9aufXgR5qnr5h6iz9Dgw==
X-CSE-MsgGUID: e1pWnJohR4uMB7JiVHU49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="79028406"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="79028406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:41:24 -0700
X-CSE-ConnectionGUID: 8n7/ULT9R5KOMakpxojdzA==
X-CSE-MsgGUID: PvcGDKJDRSGN9ZMKqaqa0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231702344"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:41:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:41:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:41:23 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGXbWR+xOezdSvVcUJ74NHZVcX7+Jg7Ka/IPE62nzb0TzJVEdTGMV6SN4RZlniiIQb4wp4dA9Bw3EL1I4WpIkTNd1ghLxSjF1AvKftCtVsrrOdJqB8KzjO6qBGyoG5OoWx2jxZJXJSj89lczBYqqSg64hhbjY0eU8OvK7xwQALoy28uzpSOQ6YvOB+JJdqGAyJe22x+lPz6AuHF0dYvYlzqqYNnXkiaj3C/b7UT1KAtT7kGfUgn5H/7X0pSl5cofQEmpOhh+BmOBR2QbmWUsH6HtYicCCpA7gLKnkVg3tfyB7xGbRFGXEniBXJbQFYpeeOHM6ApHnF3d/AVuBpTXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E3ThYqTeRWl391KSLI79/SG+i9BS4AC/UBJy3mKyns=;
 b=WfAGam3MUF/RyshA0OC94IMf7rgITX0XxHoHrpxTypiLYRHzjJFRUe1eqChIyEYAc51IPl7N3OXpwtlVapeuSXtnaGKiJ1lrKDtKKN+jzQHMopkqj3cf0v+Z2Zid9qEjJMaK9QM4KZvU7tjs44WnM81bCVFH3GtzdKIUFImLD22jcy2YiTGSP2nUvRuYmhBdlc8+ob4mGY2IMx1vhO0B4DX+gR4Gd7wafEYy10JhJjBMuC2WtAs27NXSyZhybKHPxgkdp4h1RcMT0CtNGa5seEc5OyiNXg4XwE46nsc1XPm8D0/mRv4VHIbzRZp9yYbO3BS582CGnhke53pYKuNCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:41:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:41:20 +0000
Message-ID: <5b80488e-1672-49ab-a3f4-394130588fad@intel.com>
Date: Wed, 6 May 2026 14:11:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
 <mr7gkggcgzc4h2ibqknle5btem46ijh2ioimc7zzm633k3qlkk@coy43ue5xnxb>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <mr7gkggcgzc4h2ibqknle5btem46ijh2ioimc7zzm633k3qlkk@coy43ue5xnxb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0add3d-066e-4ff7-a9cc-08deab4b3f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: of7CUohiDrg3c+8X/WhI4nWcVMvqmyHKZtZQjccTeJyZ+hTnrcZrnKXjW+asGb9ES/sbuPJHtQ3Pm7hZ1oZMdFkVwN/l1vuHWbSooxln+GbOuINsqKTk9vqmqNdROm4PtCsC2xVIs4TwPiX6W+FZNjNejKbOxZD5sY4UBYxwf+MP57E8YXAYV2AayoDk00D+hZA5oSg3l3TrLD1esbr0DrTujKkpPf4nBBr9M6fRtoGyl4xYlIFfw1wuPSb2zvHIO484EB+MP5KPYRDyB0Maek4JUUIgIrqPDYy5d+j1aW9nIxblSqRtmzsSJzjLTmQsJxgT7CSZUW8SczvebR/V6USG0VslhMRfPA+8vIaCA0yz3xMJ4f/J35P9iptKxhO8hZ3p4jhpVsni8xHaiFyJWserQXVvh0z69KrVmpF6dC8iyz3CPl67qN6tGP2k+xBSHmSWcTGbQlUZ2fFnQX6dtOGSieUlEY1AxOzryy4Bzb2nG8kCL8HG7JqR8KXN8ufn+ly6LoXWu/V2s7eOFF8W7kdennUwmklt4GCU+1q/C3XgrsDL0ezKiMsLlcgB1fvluM7phsPZRhUDxjp1bMq2U47W6QgKHkb60yW0I9qmmHb6fFqBUg/1vnmVZ2agKKkOaJjzJUBK7b574afBC6g4uJNrs0tFSni6RMqmATCB434OWSGzL1vE9HxqbiEVUI56
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdXOWlYUTBjM3c2bkpwUlhwV2hLUFEwbTBmWWwramxoSmozSTJRdjErRFY5?=
 =?utf-8?B?MFVhamVMSjZoeGVnSWRjcU5vcE52d2ViVEpiZFlIaVRGZ0dhbm0vU0FmMi9E?=
 =?utf-8?B?ZDFFVGFWR0RGaXpKZm9CczU3dnE0RTNrMVlGMG50aGFXZGdLaGpzTWpRY1Jq?=
 =?utf-8?B?MlR6dGxLUkZER3U0TXVBa2ZIVDBtZm9zN1IxMFNpVHZabkR6Um5BN0ZUSE5B?=
 =?utf-8?B?U3o4OTN6MVZKWTYzSjJta0M5c1RCSHdsTEJPRzlubWFFcldJd093dEJiN3Zw?=
 =?utf-8?B?blhmaE9yckFRVEVERlJ4WldlSGIxNEw2S3FpOUpXMDFlaHdnNWt1TUZLdnF2?=
 =?utf-8?B?QWJrT2h3V0l2ZHdDbU1XcnhYdnlFZExPYlY1bENwRXpaODlLazN3S25LSXdU?=
 =?utf-8?B?bmxZSDVPbTRiSjRjZzd4dTNubVJVSitEd3dvRjJLQ250K0xKV1h5ekR2QXRE?=
 =?utf-8?B?K1pZU3dZcjB0Wk8vSjNyc1J4YVU5VkRBY1JCOVREU0hQUU5NWVFybC9YS2Rz?=
 =?utf-8?B?cHhBOFQxT1JOK0p5VHJod0V3UnlFUUJTb1JFYnJ2SUtEZzliKzFWR1BuSnNq?=
 =?utf-8?B?Z0pXNzQ0d2hVeFhFdlpoQi9sYjJtTExzMnlUWDJvYXVLVmFwNmxzV0oyblpi?=
 =?utf-8?B?S05wdFFaWUpsUDEvVGpOK3NickFPZTlEV2x5VHkzd3pqclNtb21tZWlTTHpj?=
 =?utf-8?B?UktXSkpYWmU1aUVENERTeEtjSVBsaVVKK1o4QzUxdEQ3THJuenA0NHQwZUlI?=
 =?utf-8?B?cVB4SmhLdHk5ejU4eHNBbHlFM3hKQ3RlL2NWV0UrU2xHQUk1cU9xbGlqZkhi?=
 =?utf-8?B?aWNhWUZ5enFHT1hwN216V1phaGgxb0pHeXRidTJyaGo0b1lEMVpRMk1mSlhQ?=
 =?utf-8?B?N3ovbkd3dnluSWM4OUxLeEpxbWd5aUhiRWhiQ01LRmZrcnZrSHUvbHFFUGhj?=
 =?utf-8?B?dXJOY3JvUlZkbURxVjhqTFVSMmpEUkNSZkR2Zml0cndEY05ncWk2YnR4Z3hR?=
 =?utf-8?B?U0x2SjJHRllDRmJvSWhmd1ZDTWg1eWtVOXcvWWtpZzBzT2xzQzZUSTFlM1h0?=
 =?utf-8?B?SUJIVW9YYWFXcmlYc1lDOTBTYTN6RFFSbldaOSt2ejZtQm81VllIRUF6Njl5?=
 =?utf-8?B?RVZSZER1dUREQWhXazdJTzBiUzFBb21rMHhURjlQb3lyWDFjQnRSUDZXOHIw?=
 =?utf-8?B?VG1xZHEvTTNpMXJXcS9xTkdVTFdGb29VNWpjR0IwUzJFaXpsdnppVjdUU2Fw?=
 =?utf-8?B?Q0FGcjFrT3hXNVhJRXF0UWczSHBZamFaNzZiUU1RSVNNdC9yTHI0WDRIZ29a?=
 =?utf-8?B?QU0vYkE4M2lPbVFDWmh4cmtYaGQzeUhpSmFlY3VXUGpPMjJLRGFVRjJtSG1J?=
 =?utf-8?B?K1IrVGN3S3JwcDZSTXNZaFJRTlUvcys1QXNpb093OVZTTW1WQmFlN2NYUUFQ?=
 =?utf-8?B?VHJnRUtxYTIrcy9wdmUyb1hSS0VidStzKy9MTEwrZmwxK1FEVnU1emFBSXhQ?=
 =?utf-8?B?b2ZheC9NZk5iWEhvci81amhQVEU2Z3Q3cy84SzU2TjVZb2RaMmlvcFRNUGYv?=
 =?utf-8?B?cDlWNmI2dTlPTndYbGNOOFczOUcrLytTdXFwZHZxd3FNNm4ySHdzNm5vQlE5?=
 =?utf-8?B?elU0S1NyRGNNV2xtWk5sRTdJRXlFRllRQmZYLzJSSmtHSVpaeEhjdWhETGZC?=
 =?utf-8?B?dnUwVS9nV1poUnh2empwQkxGS040ckRXNFNOUmh1ZXpqQmlxdUkrVEhKNEl0?=
 =?utf-8?B?VjE3UnEza2x0bXF3WW5ZdVl2VDdRODJRdEQwM2krVjRkYlM5TUhoZ3FQMENQ?=
 =?utf-8?B?dVYrb0gwcE9iakdLTm5yclJYSForWlo1am5pUXBnRDdtN0o0ZEdvRzV2UGF4?=
 =?utf-8?B?b01RMml3Y0VmRStNU2RoZkRmdDczWlJ4djdmQVJQMTZ3cWdyeFl5K3FFTWZZ?=
 =?utf-8?B?bHhqSWh0MDN0MWVEa1FNTzgzVEg4QnMxMklTRnh3bHB3Q2ozMkdwMUZTZUd1?=
 =?utf-8?B?dlp1VE1ha2p5R1pWQmtuak5mcmJ6NklNZGJVNEs4V2JjaHZ6dTIvV21VUXc0?=
 =?utf-8?B?RStZZXhndmtjWk44bmNrenlqSWtwclJmYnlGck45NENOdm9rRDJ4Q3FVMnVD?=
 =?utf-8?B?Tk1PeWtGWVdLRTE4d1ZDcEFMUldnMW90TG03SmVLQUZtdUkrdndHTVN6bnFL?=
 =?utf-8?B?R0t5V3JldFRNM0h0RzJ3b04ydm4rMEo0c1l5YWtvSXpNVHltOXFid1QrUFdF?=
 =?utf-8?B?dXlTdW5uVDY0ejFDOVRlS1UydmpDOWkzdXQ1WExFUjR2ZnY4aG5admJRZFg2?=
 =?utf-8?B?MS9nNkYybTZNbU1oZHpiZExhVC92VHhlTVNncFkvdXpsVkVTMWMyQT09?=
X-Exchange-RoutingPolicyChecked: KtSj9RFg6MIBMIKdJ11DDI0PtHCwb+Xm7zEg9lI/WCtIwsGDE5XukeotFruwGWAg5GJ6dmeu0VRkDvINbEFcqfzzEoCOI9f7qGyIewfxZS+Hq+G94ul6ebrhslvEwAF+xBJTHBsO+aQHrPbtZPSlckMxwfpwV5po0i/Oih/17gVn40Dls+SyrJ9ERCcJrFt/fmjghOKg3t9t+Td/qFbRiLjoVD10v0E3oJFjvhDBFXBb7/mj5MGJKySs536jF84yH12IDshU39Srmnb+D32XYtyfqwpL+htuH7kH+dGVCqxNq6wq2pXhM70T19MW3FASkwL4zXrvD138pR5GPtNf5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0add3d-066e-4ff7-a9cc-08deab4b3f01
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:41:20.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWkB+ze6O5IseZvuhAphl/7rmEAL6o23yyKw/JcaEzqOfiHPsbHtLtMW5kVvlLiUgf7Kpdoxl9lGQfGL3AONAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

Hi Krzysztof,

On 5/5/2026 12:32 PM, Krzysztof Karas wrote:
> Hi Karthik,
>
> [...]
>
>> +static struct {
>> +	int timelines[NUM_PLANES];
>> +	bool needs_signal[NUM_PLANES];
>> +	bool active;
> I wonder if this flag is needed. See below.
>
>> +} pending_fence_state = {
>> +	.timelines = { -1, -1, -1 },
>> +};
>> +
>> +static void signal_pending_fences(int sig)
>> +{
>> +	if (!pending_fence_state.active)
>> +		return;
> The information about not needing to signal could be derived
> from the fact that no timeline has been assigned.

Thank you for the review.

Agreed, will fix this in v2.

>
>> +
>> +	for (int i = 0; i < NUM_PLANES; i++) {
>> +		if (pending_fence_state.timelines[i] < 0)
>> +			continue;
>> +
>> +		if (pending_fence_state.needs_signal[i]) {
>> +			/*
>> +			 * Best-effort: advance the timeline so the kernel
>> +			 * stops waiting on this IN_FENCE.
>> +			 */
>> +			sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
>> +			pending_fence_state.needs_signal[i] = false;
>> +		}
>> +	}
>> +
>> +	pending_fence_state.active = false;
>> +}
>> +
>>   static void setup_output(data_t *data)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t *data)
>>   
>>   		/* Attach IN_FENCE_FD to plane */
>>   		igt_plane_set_fence_fd(planes[i], fences[i]);
>> +
>> +		pending_fence_state.timelines[i] = timelines[i];
>> +		pending_fence_state.needs_signal[i] = !should_signal[i];
>>   	}
>>   
>> +	/* Arm the exit handler before the NONBLOCK commit goes out. */
>> +	pending_fence_state.active = true;
> Can "signal_pending_fences()" be called mid initialization of
> "struct pending_fence_state"? If not, then this is truly
> redundant.
Agreed, this is redundant. Will remove this variable.
>
>> +
>>   	/* Swap overlay colors to detect scanout changes via CRC */
>>   	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
>>   	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
>> @@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
>>   	igt_assert_crc_equal(&crc_before, &crc_after);
>>   
>>   	/* Now signal the blocking fence (overlay2) */
>> +	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
>>   	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>>   
>>   	/* Wait for overlay2 fence to be signaled */
>> @@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t *data)
>>   	igt_assert_eq(ret, 0);
>>   	igt_assert_eq(sync_fence_status(out_fence), 1);
>>   
>> +	/*
>> +	 * The pending atomic commit has now completed, so the exit handler
>> +	 * no longer needs to rescue it.
>> +	 */
>> +	pending_fence_state.active = false;
>> +
>>   	/* Verify display has now updated (CRC should differ from baseline) */
>>   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
>>   
>> @@ -353,6 +402,13 @@ int igt_main()
>>   
>>   		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc->crtc_index,
>>   						 IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +		/*
>> +		 * Make sure that on any failure mid-test, any unsignaled
>> +		 * IN_FENCE that the kernel is still waiting on gets
>> +		 * signaled so cleanup can complete instead of hanging.
>> +		 */
>> +		igt_install_exit_handler(signal_pending_fences);
>>   	}
>>   
>>   	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
>> @@ -363,6 +419,8 @@ int igt_main()
>>   		multiplane_atomic_fence_wait(&data);
>>   
>>   	igt_fixture() {
>> +		signal_pending_fences(0);
>> +
> You could skip this extra line.

Will update this in v2.

Thanks and Regards,
Karthik.B.S
>
>>   		reset_display_state(&data);
>>   		igt_pipe_crc_free(data.pipe_crc);
>>   		cleanup_crtc(&data);
>> -- 
>> 2.43.0
>>
