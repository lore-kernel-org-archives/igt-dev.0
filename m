Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5DD60D1B
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 10:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECFF10E607;
	Tue, 19 Nov 2024 10:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgfweP9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A0910E607
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 10:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732011008; x=1763547008;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TN6iR90hfajlZTtP8ZZtTvYJ9LCC80bKJj/UiiQiBPg=;
 b=HgfweP9zRcwIVaMyLXqNICheeZOGEZnZob+dkV4KoyKOMYdsd2Y1tl5m
 yVeniAT24kpxwS8ih9bIhgfP3IVXNoA2NSJ8wmrE33WKQo0UxGmXgnaxa
 fBmn0qL2slIR7YdqnjkdBNVF+6SX/IM/TAeLg9+N/C+OZaiUbWfmBq1HH
 gFWdScMCSsKqiEVmJTFoo1/wr/zf0NVEizAv//u2YK4huIn9Tpan05HOn
 YpuhV0rKP+hybhpBF4rOc67tNTFpIxySLIsRnfgmGUJK5BpL2iInMeZ5z
 kiqD7k4jN8sRHNBCn/1AtrrtnDy7AZw56D043SlFYYODTWdkEq6Ajw/aY w==;
X-CSE-ConnectionGUID: 94npC885SxiRUrb/z6bazA==
X-CSE-MsgGUID: 722W1b/vREyaJ+WKqfOMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31935915"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31935915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:10:07 -0800
X-CSE-ConnectionGUID: Btw5IjVBRNaQwQRsmc02BQ==
X-CSE-MsgGUID: fB7vhTpiR3qODQlucKCs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120441715"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 02:10:06 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 02:10:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 02:10:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 02:10:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+pwNYKr6HEJKsSMHMZ4a3dw4DG59g7n9oFJI/7/90zsPqPs5veKOTl009eGm5UEorChT6PQ064ZZNQEFoGDi2a5OE5kFXwY0JnI+4wfqaGe4QGj+ZMSuWuHF3GhEswJPTat6C1cG641Zt6y3UOOOoPGS7Kbu8883KBOxPA+nsW62HBCzqRs4nSuwm0lrAZ6cpdwQidv0FCACJ0KjfrDxBCY57myX0t+4Zqn+4N5STGsdjpInILIj2QW7fan1Ty9DdkDrvOTQH3hiVujEf0QIoPNafYBvHbisu+jG80EO18ee5gsn35EHwGgPVKmOWke9TrdGJoKOvjnzn6vCgFxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z54Mp/gr5nO64k+aeyeFPOOmJKuSmAph6iGdhdspV7s=;
 b=DARDH3o0Lzf6l89AY6FjE9a2Z68zTSKF2jfS1SNKmssBaWO/uA6uJRab1gMjbOJXKec1fIM5tCe1arjafuCKBQrrvXgLB+9rUjWRKfuTXb1DroaLY5saLesBsn95s3NpKo+/+UnhfKOwXP/n9TNEoVE6hXO3uYbjbHe70Leg7FMQg0lQQsRHojgCK28JeEfyIfb7TtOGa+45BeDTi5Pydhfqh+q0y9T070YdXKapAUBXkSU4kd4S4DRJ2zVNhMIeDb+JoS1tscBkyV0T6BAI2+dhsyi0z8aCcAPvE/6zcBu1qlZJmCLOD2t9IkYryFC52Ibv9nXS65F69ScfjGFJlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 10:10:03 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 10:10:03 +0000
Message-ID: <477421ad-3b39-4f84-b17b-9455a06dde30@intel.com>
Date: Tue, 19 Nov 2024 15:39:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/9] XE3: tests/intel/xe_pat: extend for xe3
To: Clint Taylor <clinton.a.taylor@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-5-clinton.a.taylor@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241114190339.3885752-5-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::8) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: f43ea6bf-0085-4dec-f2f8-08dd088255c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SENaR3U2ZW1pUDNYVlU1ZmhOVWYwYlpjZmthMHUrc2FYdmhhMmUxYnJnN1Ri?=
 =?utf-8?B?a3FQN29GaEhNNmN1NHpMdTcrdkFaOU5LTDBnOVo1dytDU1d3RW1HVm1LeDNs?=
 =?utf-8?B?N2FmUTN0WUdwbldYMFN6d3NqdHRTcUQ4K2pCSnJ4ZVgyam9lS25TVndJY2VE?=
 =?utf-8?B?QnBnbG1Pc0Z6ZnNKMitrVCtEc21yc0ZUd01tcVg3a0J1eWJheElMV0l4RFJn?=
 =?utf-8?B?OG1abnRybVZib1dLZkZkK01UdjlHV29QVHVGYlV6L282bDM4ZVFTdmVxTzVR?=
 =?utf-8?B?RUorOStlaExOZVNFUjJ6azA1V3NQN3VvM3ZzdUJFN2tmZ21xbnc1VmtwQ2Mw?=
 =?utf-8?B?WHZobUk4OER5eDArbjBWTVVDc3BnL1UwVXhGNGxudFNoWEZQZ0UxZDljVDRR?=
 =?utf-8?B?RzlvWG9SdW5sdFg0dU9zY3dUb1lmNUc4V3BZQ2o2cnl0Yy9NVFlzR3V6a3VH?=
 =?utf-8?B?NHFNcThJNjRtSWQ5Q01ucjN3M3dkeHJXeDh1NWZIRERnNVd0YlAyTWRrL3VW?=
 =?utf-8?B?N1hYQ2ZRRFJ2YXFrMUtyM3RFMWdnUkJ3cW94bUluSlE0NFJTZVVRS01tTTlR?=
 =?utf-8?B?V2VXNWZWNjNIT3g0U291RFpta1ZmSWlqN2krNng0ODhpa3M2d2loMTJDNkhr?=
 =?utf-8?B?Y2JHN3ZZVWhOQUE2S3htbFhEZE5tbnBYNERvNFdzTmpkK2ZOWHNsMzFxdy9F?=
 =?utf-8?B?VmNqcGRwM1k5UWJSUlo2QlhPUFRGdTVvamtBSnNqRy9vYmJEUXBRZTR6d2Jx?=
 =?utf-8?B?TVdSeDRnUi9MSkhvcUtoci9oV3ZWei85bXBUVTMwRExwODJISklYOUZ6ZzRJ?=
 =?utf-8?B?Yzd4dkkyVGJXUWthc2lGUEhHamlQR3huMThLbnN6TG03R29lQWc2WFp4di9M?=
 =?utf-8?B?MmlrM1k3TGdxeE90NWkzT3M3K29wejNSaytobTJGc2lqdmR6eWM0WDcxZ2VI?=
 =?utf-8?B?VmJhRjFXV3pwY3RTWldQMXJJd0VMZkdSQ1J1cEJ0UTFMZ1ppaTVwdlBGM3Fo?=
 =?utf-8?B?UTBnUVgwc25vMUJEZXJMSnlTSHRPaFpJT1Job2U0WjU0VU9IZ0FtV2djdzZQ?=
 =?utf-8?B?eW43NEMwVTNnd05hdXU0ektPV3QzTlI5aVJ6N21mWTBrV3llUEhmV1N4aXF6?=
 =?utf-8?B?ZWJPQUtiVStqWGNHZTY2cWVTb1pLTDBMRHhQVVVjNWNtRXhwSE41bWtWTjBM?=
 =?utf-8?B?eENhc2dlcktOUFpiVzVKREtyOVM1UnFWZ2MwNzNyaUsvUlR5SWF5Mk90RlFz?=
 =?utf-8?B?ajhNQ1dqZ1BSLzVSblZ6d0lvcmR1K29QVXc0R282b3laMHF6Qi9WNUoxcWtC?=
 =?utf-8?B?aER5UGZhb1N1b3h2SDlpS0FaYWxoem8vSHhMSDNMb0VFQXd3WE04R3NMVGhx?=
 =?utf-8?B?akVBUXl6dGZJY3pSSll6dmtMNHF1M001Tzh6azU4TlVaVnpMVzhyTCtTOGV1?=
 =?utf-8?B?OTl2MzJhSG9NenhLc0lrQklDZ3VpSmFGYlpSMy83VVVqWllPUFpERll3RzNa?=
 =?utf-8?B?L1M5bUlnRU0zOVdHWFhCR1lUOE5rZTVqcVhDeHF4OWxkMzR2RU1WMXRSVTE1?=
 =?utf-8?B?T29aWjhycUt3ejg3NmpqOWhGM25QakpXYWl1ckUrV3JjVkE5WkptdkI4V29P?=
 =?utf-8?B?MVdaTjkvYjBQUlZJOCtyTWhydlNLMU8rUWdVNFRFSTZKbG8zVnR2US8rYU5I?=
 =?utf-8?B?WE5MSk5aakFWQTFhYjY2a1NESng4UFh0RHJ5dTdqYW5BbHNSdGl6QWU0YlR3?=
 =?utf-8?Q?aRO2pgel7BQFZokSxUmODuEliaiwC6vk9dSd9VQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlRVSXlQWklscWc3WnlmV3VRRmh6eWFJQnh4QzZ6VXVVRHpnSTZrZXlwWjNP?=
 =?utf-8?B?OCtRdUc3TmNja1BuRzgzSVZ5NjZhd2FMbDRIdXpPRjd4emZNMXJPQk96aDlz?=
 =?utf-8?B?WkhkZENPZ25xMXNNbExZUlJLRFZpS25HcWNyYVp3ZmYybGZJRUNjejZObzJB?=
 =?utf-8?B?dndlMmdWcWRyUTEyeno0MXJRUUhPN2ZEdldqd2VIeU1hTndCcC9qQStQT1M5?=
 =?utf-8?B?REFDSzRrNVR1Sm5EeTZHdWRqL1VmeWorR1lnU3FhVG1zdE9adHFUUW5OR2JQ?=
 =?utf-8?B?QWIxeTkyVE5ZeXd4VGRjZzRpTEk3Z1YyRzQzMFJTZHBVTEEyaytvZmhVaFdr?=
 =?utf-8?B?MTF5UTlYNE52V0RCWHVLSnp6cHNwRmVkRUxubVJwNzJDMldwQ0dRZkRpUkJq?=
 =?utf-8?B?M0czeDFzNWt1L09lR3FyVzJ1UUdIZ2xzalZHQ2wxcUlmNFM1MEgzdTFOV0oz?=
 =?utf-8?B?bDBFaExzem1WVWZrQTZhMVhwV1FUVmRjaVJVL2pvbXQyM3VBU0FhUG9LeU1l?=
 =?utf-8?B?TXBUZXFzTEVxT1F1R0pmU2NhOGgvNzlaQlNyVzZhT2c2aldrVlQwSFdPNVRT?=
 =?utf-8?B?NHdsZEJpWjg2Z3J1eGZiQ1pldUVjUTdKZnh5MDB3b0QzMktjTnBTaXZNUnNX?=
 =?utf-8?B?TlErclkvamdKMVR3Zm5USmZhSHNpMUF2blFxWmlOQWtVVVUvWlIwTStIZU8r?=
 =?utf-8?B?ZTl4TERCQk8vb3FRTDlMelk5aWFUN3RLZ1BqUFNSSEFzdzZ0bW1nbTdhcXJN?=
 =?utf-8?B?ZGZFYmJjS0I0QUR1UXRvOGs4aXRoWWN3T0VvTWpTdWdYOFk1RFZkS0VkWTl6?=
 =?utf-8?B?VGFvc2VoNlJCVkxxY3g1OXd3dkdmR0I5NHVWMjR5dk1sd0tqMFIrbi9WeFJV?=
 =?utf-8?B?aGxySzRtU2d3ZW1WY05VQWoyOG9MMkVIVURLeXlYc2UvSlBlcklRTHdzUjF3?=
 =?utf-8?B?VjdnWmZhaDZKaUtrUEV2WkkzWUFaaTJFNzRjejhEYlhNOFBJYkhPL29xWkN5?=
 =?utf-8?B?S25INmVoNHNrdDdscnFrMTdYamdOSmtjRm80WkNuVVhUbUlvdWxLb2EwRllY?=
 =?utf-8?B?RlJPVUpKMk8vSElXNVRaVFZrR1FQdVB1L1A5L1VxNlhneVZhTGJaeDZrNTlI?=
 =?utf-8?B?TjBMdFhoc0t4UW9RemFTRE1XblUrVElWbWtaaXAvK2ZFdHg1cXQvZmRUbVdx?=
 =?utf-8?B?NHp1c3BlZjVVTFY5T1VnOGl5a05VcDhFOUlZdG5mL1N5YkRKZ0s0OE5xYzVO?=
 =?utf-8?B?dU1wRWRZdWY3UGFScC9zTCtIa2U0WGZhM3U2SG5nbTdFNTI2RnpleUZuSjdO?=
 =?utf-8?B?RHVvdG90eUN0S3U2c1ZraHU2QlpySVVVbGZrWVdXaTF5WGE2cVRxYjFxTjBL?=
 =?utf-8?B?QjdzZDUxQzNJcXRsQkZ3SUo3dHllZi9Lcm9Sbm5yMFJEVjBtbVpZUWRxQVlj?=
 =?utf-8?B?YTAwMThTcU5TUVBVWGVkbmVmdUlFRkoyenpGeHZUTlVpNFMyZzV5dWNteGhK?=
 =?utf-8?B?OEFubnlQYTJoSlo0S0YvUlgwN0JmaE56UVp2d2FUbnJHZ1huY2k5cldELzJ3?=
 =?utf-8?B?RWUrRmx0Qy9NejJzcEFkTEdtUUNOZTVnemt1djVIQkpUR29LUkVtbytzS05j?=
 =?utf-8?B?M0R4aU1GK1pFK3l5MUM3THU0TFhuUFJPM25vTG9oWHUwVlVaQVN6Ymp3RWhL?=
 =?utf-8?B?VWZ4dVdJbDZtS2NxMnVOdUtuUmhzTVdDWExWMWNscXAyQjFORjZQMXFZMyt6?=
 =?utf-8?B?NzArcTBvb21wRXQ5aHN3VTl2dys0ZWw0TTFNaGtHNlZJL0hySmJQL0NSVlRt?=
 =?utf-8?B?aXNCU0ZkTVVpdHQ4VWpBNVgxbm52VkNySEpGQ2xSQUFhSzZQQWJXUHZEYnYr?=
 =?utf-8?B?SEVwdnl4QS9DTXJ4QVRYYkJsWEpxMm5TN1R4aTBLd2x3MVRTc0daeHA4RHRV?=
 =?utf-8?B?Y0VaZXBNWk9kMFJ3VUtEUnVVWGRxaVJZM0VEYU16U3haaXZueEZ3MkU0TE80?=
 =?utf-8?B?cDE0ekZXOWxpcHJ0OWdaM1JrUUpTZVVQQmhjRlR0cGREdEh5NmhXUmlFOVhO?=
 =?utf-8?B?RCtzdVlUazVWcytrMDdVVmpIUEFpQjlHSWJ4aFNUT2dSa29xYUhOQ1pEYkc3?=
 =?utf-8?B?SlF4elJRamxwWHVvRnBwS3ExVFN3Tks3Wlp6Z2FRTzk4bENxcUxDMEF5cjh3?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f43ea6bf-0085-4dec-f2f8-08dd088255c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 10:10:03.5007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MFJlmX3g/FDAcpZY9l8XYIBT2rxJTUxIcQCgz+02QmgnfGzpzDjUqntE5Lc7pwUMThOSIdinZYq3eMLAu07HZKIVafyKHwhdyfTjR6azN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

On 15-11-2024 00:33, Clint Taylor wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> Same pat_index modes should apply as for xe2. Matches the kernel.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   tests/intel/xe_pat.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index b0b3ad8a7..1322df349 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -110,7 +110,7 @@ static void pat_index_all(int fd)
>   
>   	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
>   	     pat_index++) {
> -		if (intel_get_device_info(dev_id)->graphics_ver == 20 &&
> +		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
>   		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
>   			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>   						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> @@ -854,7 +854,7 @@ static uint8_t get_pat_idx_wt(int fd, bool *compressed)
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   
>   	if (compressed)
> -		*compressed = intel_get_device_info(dev_id)->graphics_ver == 20;
> +		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
>   
>   	return intel_get_pat_idx_wt(fd);
>   }
